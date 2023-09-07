Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CCFEE14DD
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 09:58:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9277.1694080703408736181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 02:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CF151595;
	Thu,  7 Sep 2023 02:59:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D883B3F64C;
	Thu,  7 Sep 2023 02:58:21 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] python3-build: upgrade to 1.0.3
Date: Thu,  7 Sep 2023 10:58:19 +0100
Message-Id: <20230907095819.1751674-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 09:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187370

From: Ross Burton <ross.burton@arm.com>

- Avoid CPython 3.8.17, 3.9.17, 3.10.12, and 3.11.4 tarfile symlink bug
  triggered by adding data_filter

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/{python3-build_1.0.0.bb =3D> python3-build_1.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.0.0.bb =3D> python3=
-build_1.0.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-build_1.0.0.bb b/meta/r=
ecipes-devtools/python/python3-build_1.0.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-build_1.0.0.bb
rename to meta/recipes-devtools/python/python3-build_1.0.3.bb
index 7944bb0b264..2d8faeff259 100644
--- a/meta/recipes-devtools/python/python3-build_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/pypa/build"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b0fb4780b2ad6907c2=
56c"
=20
-SRC_URI[sha256sum] =3D "49a60f212df4d9925727c2118e1cbe3abf30b393eff7d0e7=
287d2170eb36844d"
+SRC_URI[sha256sum] =3D "538aab1b64f9828977f84bc63ae570b060a8ed1be419e787=
0b8b4fc5e6ea553b"
=20
 inherit pypi python_flit_core
=20
--=20
2.34.1


