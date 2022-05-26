Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B76C433FE
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:10:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.22572.1653585011391890402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 10:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96044150C;
	Thu, 26 May 2022 10:10:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3691A3F66F;
	Thu, 26 May 2022 10:10:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH 05/10] python3-pep517: add new recipe
Date: Thu, 26 May 2022 18:09:56 +0100
Message-Id: <20220526171001.4074388-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526171001.4074388-1-ross.burton@arm.com>
References: <20220526171001.4074388-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 17:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166191

This is a runtime dependency of most Python package build frontends.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pep517_0.12.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pep517_0.12.0.bb

diff --git a/meta/recipes-devtools/python/python3-pep517_0.12.0.bb b/meta=
/recipes-devtools/python/python3-pep517_0.12.0.bb
new file mode 100644
index 00000000000..43ac35a3f79
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pep517_0.12.0.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "Wrappers to build Python packages using PEP 517 hooks"
+HOMEPAGE =3D "https://github.com/pypa/pep517"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daad69c93f605003e3342b174d9b07=
08c"
+
+SRC_URI[sha256sum] =3D "931378d93d11b298cf511dd634cf5ea4cb249a28ef84160b=
3247ee9afb4e8ab0"
+
+inherit pypi python_flit_core
+
+BBCLASSEXTEND =3D "native nativesdk"
\ No newline at end of file
--=20
2.25.1


