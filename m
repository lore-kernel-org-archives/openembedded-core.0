Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBEAE77173
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 08:41:50 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.96466.1733733706230784195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 00:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 9 Dec
 2024 16:41:43 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 9 Dec 2024 16:41:43 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v1] python3-pyhsslms: Add 2.0.0 recipe
Date: Mon, 9 Dec 2024 16:41:42 +0800
Message-ID: <20241209084142.939432-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 08:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208475

This recipe was placed in meta-arm meta layer,
https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-devtools/python=
/python3-pyhsslms_2.0.0.bb

However, users may want to build this python module but do not want to add
"meta-arm" layer. To make this recipe more flexible, move this recipe from
meta-arm to OpenEmbedded-Core/meta layer.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 .../python/python3-pyhsslms_2.0.0.bb               | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb b/meta/=
recipes-devtools/python/python3-pyhsslms_2.0.0.bb
new file mode 100644
index 0000000000..b18d1c8e86
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Pure-Python implementation of HSS/LMS Digital Signatures (RFC=
 8554)"
+HOMEPAGE =3D"https://pypi.org/project/pyhsslms"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbbc59ef8bf238c2902ca816b87b=
58571"
+
+inherit python_setuptools_build_meta
+
+# Maintainer refused to upload source to pypi.org, but said he would in a =
future release.  In the meantime, do github
+SRC_URI =3D "git:///github.com/russhousley/pyhsslms.git;branch=3Dmaster;pr=
otocol=3Dhttps"
+SRCREV =3D "c798728deed6d3f681c9e6bfd7fe8a6705f5638b"
+
+S =3D "${WORKDIR}/git"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


