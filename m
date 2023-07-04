Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C24EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 10:23:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.55507.1688466190625311222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 03:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80BBD2F4;
	Tue,  4 Jul 2023 03:23:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4B883F73F;
	Tue,  4 Jul 2023 03:23:09 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libjpeg-turbo: upgrade to 3.0.0
Date: Tue,  4 Jul 2023 11:23:07 +0100
Message-Id: <20230704102307.3654880-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 10:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183821

From: Ross Burton <ross.burton@arm.com>

Remove 0001-libjpeg-turbo-fix-package_qa-error.patch, doesn't appear to
be needed anymore.

Use the full upstream license for LICENSE, and change LIC_FILES_CHKSUM
to point at just the license overview in LICENSE.md.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...1-libjpeg-turbo-fix-package_qa-error.patch | 32 -------------------
 ...urbo_2.1.5.1.bb =3D> libjpeg-turbo_3.0.0.bb} | 14 +++-----
 2 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-f=
ix-package_qa-error.patch
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.5.1.bb =3D> libjpeg=
-turbo_3.0.0.bb} (83%)

diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-pack=
age_qa-error.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-=
fix-package_qa-error.patch
deleted file mode 100644
index fab5109f831..00000000000
--- a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-=
error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5cf847b5bef8dc3f9f89bd09dd5af4e6603f393c Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 27 Aug 2018 16:10:55 +0800
-Subject: [PATCH] libjpeg-turbo: fix package_qa error
-
-Fix package qa errors like below:
-libjpeg.so.62.3.0 contains probably-redundant RPATH /usr/lib [useless-rp=
aths]
-usr/bin/cjpeg contains probably-redundant RPATH /usr/lib
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- CMakeLists.txt | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2bc3458..ea3041e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -191,10 +191,6 @@ endif()
- report_option(ENABLE_SHARED "Shared libraries")
- report_option(ENABLE_STATIC "Static libraries")
-=20
--if(ENABLE_SHARED)
--  set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
--endif()
--
- if(WITH_JPEG8 OR WITH_JPEG7)
-   set(WITH_ARITH_ENC 1)
-   set(WITH_ARITH_DEC 1)
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb b/meta/r=
ecipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
similarity index 83%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
index e086830c021..146d80008c5 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb
@@ -2,19 +2,15 @@ SUMMARY =3D "Hardware accelerated JPEG compression/deco=
mpression library"
 DESCRIPTION =3D "libjpeg-turbo is a derivative of libjpeg that uses SIMD=
 instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression a=
nd decompression"
 HOMEPAGE =3D "http://libjpeg-turbo.org/"
=20
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D13;md5=3D8a61af33cc1c681=
cd5cc297150bbb5bd \
-                    file://jpeglib.h;endline=3D16;md5=3D52b5eaade8d5b6a4=
52a7693dfe52c084 \
-                    file://djpeg.c;endline=3D11;md5=3D510b386442ab6a27ee=
241fc5669bc5ea \
-                    "
+LICENSE =3D "IJG & BSD-3-Clause & Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D2a8e0d8226a102f07ab63ed7fd=
6ce155"
+
 DEPENDS:append:x86-64:class-target =3D " nasm-native"
 DEPENDS:append:x86:class-target =3D " nasm-native"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://0001-libjpeg-turbo-fix-package_qa-error.patch \
-           "
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
=20
-SRC_URI[sha256sum] =3D "2fdc3feb6e9deb17adec9bafa3321419aa19f8f4e5dea7bf=
8486844ca22207bf"
+SRC_URI[sha256sum] =3D "c77c65fcce3d33417b2e90432e7a0eb05f59a7fff884022a=
9d931775d583bfaa"
 UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/libjpeg-turbo/fi=
les/"
 UPSTREAM_CHECK_REGEX =3D "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/=
"
=20
--=20
2.34.1


