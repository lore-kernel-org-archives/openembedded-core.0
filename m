Return-Path: <opensource@nabladev.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E52D78769
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 12:37:49 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15843.1766147868380186678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 04:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nabladev.com header.s=dkim header.b=RM7Z6x/X;
 spf=pass (domain: nabladev.com, ip: 178.251.229.89, mailfrom: opensource@nabladev.com)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C836107639;
	Fri, 19 Dec 2025 13:37:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1766147862; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=uBmeDC0zuCBGv1PSJeTvtoOaMdu5Z4+HNek3uVVqkP8=;
	b=RM7Z6x/X3i09z7ysPG60T5pX2fFKhZGpk/MdjdUAVC+bxhuy8owFIvD9JcVXkJexBc4Dt2
	QYI5SlyiTlIRqxxq85QvE2I4sYr1m8nIKfVv/+SNBJ+i5Uue54M9UyyPmG5bfXcaUv4lX0
	5fKFw4B//casq5C9SdNI08BUyJyaBI38h4gfKPbDtMj6k33Z4ueDXHf+bgCd6mzp0DRcgJ
	Lz5QcC3ybAbzUDOQNaheQ1hL6Y+/8tE/Y8MC2Ao5Uc8Yn5HwwpC/aIFsGaCu2VHdgJWlPR
	6l4gSqaj7VyyOo7qAEoT0pxQWKxwXOsZt6WGp3MLrjtNrouO7H7hwDbWozXCoQ==
From: opensource@nabladev.com
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@nabladev.com>
Subject: [PATCH V2] libubootenv: upgrade 0.3.6 -> 0.3.7
Date: Fri, 19 Dec 2025 13:37:33 +0100
Message-ID: <20251219123733.33019-1-opensource@nabladev.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228229

From: Stefano Babic <sbabic@nabladev.com>

Signed-off-by: Stefano Babic <sbabic@nabladev.com>
---

Changes since V1: added tag=3Dv${PV} to SRC_URI

 ...Update-cmake_minimum_required-to-3.5.patch | 50 -------------------
 ...ubootenv_0.3.6.bb =3D> libubootenv_0.3.7.bb} |  6 +--
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake=
_minimum_required-to-3.5.patch
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.6.bb =3D> libubootenv_0.=
3.7.bb} (83%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimu=
m_required-to-3.5.patch b/meta/recipes-bsp/u-boot/libubootenv/0001-Update=
-cmake_minimum_required-to-3.5.patch
deleted file mode 100644
index ee174ca59e..0000000000
--- a/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_requi=
red-to-3.5.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cd12d9dd2bea8e4580f458df77229477fc55ba70 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 14 May 2025 14:17:40 -0600
-Subject: [PATCH] Update cmake_minimum_required to 3.5
-
-This supports compilation with cmake-4.0.0.
-
-Fixes:
-CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-  Update the VERSION argument <min> value.  Or, use the <min>...<max> sy=
ntax
-  to tell CMake that the project requires at least <min> but has been up=
dated
-  to work with policies introduced by <max> or earlier.
-
-  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anyway=
.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream-Status: Backport [cd12d9dd2bea8e4580f458df77229477fc55ba70]
----
- CMakeLists.txt     | 2 +-
- src/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 796d7bc..0a11730 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,7 +2,7 @@
- #
- # SPDX-License-Identifier:     LGPL-2.1-or-later
-
--cmake_minimum_required (VERSION 2.6)
-+cmake_minimum_required (VERSION 3.5)
- project (libubootenv C)
-
- # The version number.
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index c56d0c7..3370232 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -1,7 +1,7 @@
- # SPDX-FileCopyrightText: 2019-2021 Stefano Babic <stefano.babic@swupda=
te.org>
- #
- # SPDX-License-Identifier:     LGPL-2.1-or-later
--cmake_minimum_required (VERSION 2.6)
-+cmake_minimum_required (VERSION 3.5)
- # Sources and private headers
- SET(libubootenv_SOURCES
-   uboot_env.c
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes-=
bsp/u-boot/libubootenv_0.3.7.bb
similarity index 83%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
index b63b8ff87d..7b5300f38b 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
@@ -10,10 +10,8 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-2.1-or-later.txt;md5=3D4fbd65=
380cdd255951079008b364516c"
 SECTION =3D "libs"
=20
-SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps;branch=
=3Dmaster \
-           file://0001-Update-cmake_minimum_required-to-3.5.patch \
-           "
-SRCREV =3D "5507339628b5caf244e1ff9d58cb3fa534b16beb"
+SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "1e3511ed77f794ee5decc0974d54c8e5af26f64c"
=20
 inherit cmake lib_package
=20
--=20
2.43.0


