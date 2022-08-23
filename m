Return-Path: <bernhard.rosenkraenzer.ext@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA7FC32789
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 17:36:27 +0000 (UTC)
Received: from mail.lindev.ch (mail.lindev.ch [5.39.83.55])
 by mx.groups.io with SMTP id smtpd.web08.884.1661276180356308518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: huawei.com, ip: 5.39.83.55, mailfrom: bernhard.rosenkraenzer.ext@huawei.com)
Received: from c64.fritz.box (unknown [81.221.122.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: bero@lindev.ch)
	by mail.lindev.ch (Postfix) with ESMTPSA id 60D694100344;
	Tue, 23 Aug 2022 19:36:18 +0200 (CEST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>
Subject: [PATCH] gcc: Update to 12.2
Date: Tue, 23 Aug 2022 19:36:16 +0200
Message-Id: <20220823173616.2561114-1-bernhard.rosenkraenzer.ext@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 17:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169719

Update gcc to 12.2, drop
0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch
(which is already in 12.2)

Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@hua=
wei.com>
---
 .../gcc/{gcc-12.1.inc =3D> gcc-12.2.inc}        |  7 ++-
 ...ian_12.1.bb =3D> gcc-cross-canadian_12.2.bb} |  0
 .../{gcc-cross_12.1.bb =3D> gcc-cross_12.2.bb}  |  0
 ...-crosssdk_12.1.bb =3D> gcc-crosssdk_12.2.bb} |  0
 ...cc-runtime_12.1.bb =3D> gcc-runtime_12.2.bb} |  0
 ...itizers_12.1.bb =3D> gcc-sanitizers_12.2.bb} |  0
 ...{gcc-source_12.1.bb =3D> gcc-source_12.2.bb} |  0
 ...rry-pick-9cf13067cb5088626ba7-from-u.patch | 45 -------------------
 .../gcc/{gcc_12.1.bb =3D> gcc_12.2.bb}          |  0
 ...initial_12.1.bb =3D> libgcc-initial_12.2.bb} |  0
 .../gcc/{libgcc_12.1.bb =3D> libgcc_12.2.bb}    |  0
 ...ibgfortran_12.1.bb =3D> libgfortran_12.2.bb} |  0
 12 files changed, 3 insertions(+), 49 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-12.1.inc =3D> gcc-12.2.inc} (95%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.1.bb =3D> gcc-cr=
oss-canadian_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_12.1.bb =3D> gcc-cross_12.2.=
bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.1.bb =3D> gcc-crosssdk=
_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_12.1.bb =3D> gcc-runtime_1=
2.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.1.bb =3D> gcc-saniti=
zers_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_12.1.bb =3D> gcc-source_12.=
2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherr=
y-pick-9cf13067cb5088626ba7-from-u.patch
 rename meta/recipes-devtools/gcc/{gcc_12.1.bb =3D> gcc_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_12.1.bb =3D> libgcc-ini=
tial_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_12.1.bb =3D> libgcc_12.2.bb} (1=
00%)
 rename meta/recipes-devtools/gcc/{libgfortran_12.1.bb =3D> libgfortran_1=
2.2.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtoo=
ls/gcc/gcc-12.2.inc
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-12.1.inc
rename to meta/recipes-devtools/gcc/gcc-12.2.inc
index 488e0c95b1..572fd8b669 100644
--- a/meta/recipes-devtools/gcc/gcc-12.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.2.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
=20
 # Third digit in PV should be incremented after a minor release
=20
-PV =3D "12.1.0"
+PV =3D "12.2.0"
=20
 # BINV should be incremented to a revision after a minor gcc release
=20
-BINV =3D "12.1.0"
+BINV =3D "12.2.0"
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
=20
@@ -64,11 +64,10 @@ SRC_URI =3D "${BASEURI} \
            file://0024-Fix-install-path-of-linux64.h.patch \
            file://0025-Move-sched.h-include-ahead-of-user-headers.patch =
\
            file://0026-rust-recursion-limit.patch \
-           file://0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-fro=
m-u.patch \
            file://prefix-map-realpath.patch \
            file://hardcoded-paths.patch \
 "
-SRC_URI[sha256sum] =3D "62fd634889f31c02b64af2c468f064b47ad1ca78411c45ab=
e6ac4b5f8dd19c7b"
+SRC_URI[sha256sum] =3D "e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39be=
b4181e06926230ff"
=20
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_12.1.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_12.1.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_12.1.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.1.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_12.1.bb b/meta/recipes-=
devtools/gcc/gcc-source_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-=
9cf13067cb5088626ba7-from-u.patch b/meta/recipes-devtools/gcc/gcc/0001-li=
bsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch
deleted file mode 100644
index 6bbc95aa00..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-9cf1306=
7cb5088626ba7-from-u.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2701442d0cf6292f6624443c15813d6d1a3562fe Mon Sep 17 00:00:00 2001
-From: Martin Liska <mliska@suse.cz>
-Date: Mon, 11 Jul 2022 22:03:14 +0200
-Subject: [PATCH] libsanitizer: cherry-pick 9cf13067cb5088626ba7 from ups=
tream
-
-9cf13067cb5088626ba7ee1ec4c42ec59c7995a0 [sanitizer] Remove #include <li=
nux/fs.h> to resolve fsconfig_command/mount_attr conflict with glibc 2.36
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D2701442d0cf6292f6624443c15813d6d1a3562fe]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../sanitizer_platform_limits_posix.cpp                | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_pos=
ix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cp=
p
-index 8ed3e92d270..97fd07acf9d 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -73,7 +73,9 @@
- #include <sys/vt.h>
- #include <linux/cdrom.h>
- #include <linux/fd.h>
-+#if SANITIZER_ANDROID
- #include <linux/fs.h>
-+#endif
- #include <linux/hdreg.h>
- #include <linux/input.h>
- #include <linux/ioctl.h>
-@@ -869,10 +871,10 @@ unsigned struct_ElfW_Phdr_sz =3D sizeof(Elf_Phdr);
-   unsigned IOCTL_EVIOCGPROP =3D IOCTL_NOT_PRESENT;
-   unsigned IOCTL_EVIOCSKEYCODE_V2 =3D IOCTL_NOT_PRESENT;
- #endif
--  unsigned IOCTL_FS_IOC_GETFLAGS =3D FS_IOC_GETFLAGS;
--  unsigned IOCTL_FS_IOC_GETVERSION =3D FS_IOC_GETVERSION;
--  unsigned IOCTL_FS_IOC_SETFLAGS =3D FS_IOC_SETFLAGS;
--  unsigned IOCTL_FS_IOC_SETVERSION =3D FS_IOC_SETVERSION;
-+  unsigned IOCTL_FS_IOC_GETFLAGS =3D _IOR('f', 1, long);
-+  unsigned IOCTL_FS_IOC_GETVERSION =3D _IOR('v', 1, long);
-+  unsigned IOCTL_FS_IOC_SETFLAGS =3D _IOW('f', 2, long);
-+  unsigned IOCTL_FS_IOC_SETVERSION =3D _IOW('v', 2, long);
-   unsigned IOCTL_GIO_CMAP =3D GIO_CMAP;
-   unsigned IOCTL_GIO_FONT =3D GIO_FONT;
-   unsigned IOCTL_GIO_UNIMAP =3D GIO_UNIMAP;
---=20
-2.37.1
-
diff --git a/meta/recipes-devtools/gcc/gcc_12.1.bb b/meta/recipes-devtool=
s/gcc/gcc_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_12.1.bb
rename to meta/recipes-devtools/gcc/gcc_12.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_12.1.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_12.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_12.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_12.1.bb b/meta/recipes-devt=
ools/gcc/libgcc_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_12.1.bb
rename to meta/recipes-devtools/gcc/libgcc_12.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_12.1.bb b/meta/recipes=
-devtools/gcc/libgfortran_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_12.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_12.2.bb
--=20
2.37.2


