Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56C0C7EE26
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:34:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14844.1683106445338118254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 02:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 378C12F4;
	Wed,  3 May 2023 02:34:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 758823F67D;
	Wed,  3 May 2023 02:34:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 1/4] glslang: upgrade to 1.3.243
Date: Wed,  3 May 2023 10:33:46 +0100
Message-Id: <20230503093349.2836626-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 09:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180797

The libraries are now versioned correctly, so remove the manual
packaging.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../glslang/{glslang_1.3.239.0.bb =3D> glslang_1.3.243.0.bb}  | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.239.0.bb =3D> glslang_=
1.3.243.0.bb} (88%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.239.0.bb b/meta/re=
cipes-graphics/glslang/glslang_1.3.243.0.bb
similarity index 88%
rename from meta/recipes-graphics/glslang/glslang_1.3.239.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.243.0.bb
index 295a8fe1901..c50d67a6522 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.239.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE =3D "https://www.khronos.org/opengles/sdk/tools/=
Reference-Compiler"
 LICENSE =3D "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with=
-bison-exception"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2a2b5acd7bc4844964cfda45f=
e807dc3"
=20
-SRCREV =3D "ca8d07d0bc1c6390b83915700439fa7719de6a2a"
+SRCREV =3D "14e5a04e70057972eef8a40df422e30a3b70e4b5"
 SRC_URI =3D "git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;=
branch=3Dmain \
            file://0001-generate-glslang-pkg-config.patch \
            "
@@ -30,8 +30,4 @@ EXTRA_OECMAKE =3D " \
     -DBUILD_EXTERNAL=3DOFF \
 "
=20
-SOLIBSDEV =3D "glslang.so"
-# all the other libraries are unversioned, so pack it on PN
-FILES:${PN} +=3D "${libdir}/*.so"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


