Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A099CCA482
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:44:55 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.51638.1658306690564786805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QAP8E5fA;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id bp15so31836826ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XzIl8h7iFtZj4TsC7Wq0/vlFKHZBnYT9IxgdjejV4nc=;
        b=QAP8E5fAdDf17e2a7rWmgRs3mNan5o5PuLp0hv/It/JffrpMWCtyLBISKGs+e981Mg
         o4ff567bpe4W7mau9WT1m4Zvgh2yPU+oKeIAzIgitiWEHXNr0FAI/9BvuvMSuUYo4ptk
         GDbJ/aY0UDKB2D0fURlwel3LVLYzlhLW6RuIDGKROCzqOfk12FIOCAeZiM0MnM38ijlL
         e1WH6JmxqQmEyzEYNdCOv+4Kg1pejM6PfJkVmFqS36IQ8L2zUidfFeoPBFc4TsUtUzSC
         AZEAharbkpbP+0Fr8dzzTseXECwV21gewVu8z1nRewGTpyLCCWsFyL3GmmXtOCYhh+c7
         zS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XzIl8h7iFtZj4TsC7Wq0/vlFKHZBnYT9IxgdjejV4nc=;
        b=sbPU/h2JIhDXW+ITZ6WfJeGcE9VXhz4dcXoCNCRdmxfeIM+pyhVZBohIFwRRCvkLER
         9YbT4a27uLiaLCPPUUGcJLIe25t22SSCvZ+QaGKmf9Zfb5a9hXYB/oocw4OnV/iZM761
         WTGOU2GQkTIPWCnwZTvzJdCeKdLFfHcsr1mSWs5hD7M4+uBDT3SgH98nW93GCEUyxErf
         bgyadOsKECtVm4xIi8J+gM2CPNKxYaTfeZIrRBlT8Y6SD1CJW4gW+RA7XI5wtDfbQobp
         23UOQWhgm6qcmVJXAi/xzaxMEIzbNcBG6oAaMraZqLJFFV8IKapqWnxLVF/i8/7z25q7
         eZsw==
X-Gm-Message-State: AJIora92nDUIboMSmxvlGNhqHucsuzRwTiB9b7CTv31CXs2R3AIIrJbr
	6wxNKDtzfuUfIqY/htIR67xd//AkEkU=
X-Google-Smtp-Source: 
 AGRyM1s5yaDGOnPjpV3mb244g2TvESueieyQKjh9pKQT5nAL49vvoYoWtVFmSEz0p3DJW0feXK7STA==
X-Received: by 2002:a17:907:a06f:b0:72b:564c:465b with SMTP id
 ia15-20020a170907a06f00b0072b564c465bmr33945419ejc.344.1658306689035;
        Wed, 20 Jul 2022 01:44:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/51] systemd-boot: update 251.2 -> 251.3
Date: Wed, 20 Jul 2022 10:43:55 +0200
Message-Id: <20220720084442.2940187-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:44:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168298

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...md-boot_251.2.bb =3D> systemd-boot_251.3.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  3 +-
 ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 16 ++++---
 ...red-utmp-wtmp-fix-build-without-utmp.patch | 32 --------------
 ...7ca2ab96d085158485ecfc46c7cb6af0f166.patch | 42 -------------------
 .../{systemd_251.2.bb =3D> systemd_251.3.bb}    |  4 +-
 6 files changed, 10 insertions(+), 87 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_251.2.bb =3D> systemd-boot_=
251.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-shared-utmp-wtmp=
-fix-build-without-utmp.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/38c87ca2ab96d08515848=
5ecfc46c7cb6af0f166.patch
 rename meta/recipes-core/systemd/{systemd_251.2.bb =3D> systemd_251.3.bb} =
(99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_251.2.bb b/meta/recipes=
-core/systemd/systemd-boot_251.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_251.2.bb
rename to meta/recipes-core/systemd/systemd-boot_251.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index b8dbe2263a..03f1559f02 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,9 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa=
882bbe \
                     file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b=
364516c"
=20
-SRCREV =3D "253052686cbd840ac69030d31c4b186af23aba4c"
+SRCREV =3D "516108f273888df3dcfa4f42b140252a285a2288"
 SRCBRANCH =3D "v251-stable"
 SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttps;=
branch=3D${SRCBRANCH} \
-           file://38c87ca2ab96d085158485ecfc46c7cb6af0f166.patch \
 "
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.=
d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/000=
1-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
index 31efc4cc4b..0fb6efb469 100644
--- a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfm=
t.d-modules-load.d-to-.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfm=
t.d-modules-load.d-to-.patch
@@ -1,4 +1,4 @@
-From beb0219b71510bc63aed81d2a970a04349d6c616 Mon Sep 17 00:00:00 2001
+From 258af8106cbed6fa53f7bee042bf903e58b57a41 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 29 Sep 2020 18:01:41 -0700
 Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
@@ -10,18 +10,19 @@ the old /usr/lib is still being used.
 Upstream-Status: Inappropriate (OE-specific)
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+
 ---
  src/core/systemd.pc.in           | 8 ++++----
  src/libsystemd/sd-path/sd-path.c | 8 ++++----
  2 files changed, 8 insertions(+), 8 deletions(-)
=20
 diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
-index fc0f8c34fa..65996bbed8 100644
+index 693433b34b..8368a3ff02 100644
 --- a/src/core/systemd.pc.in
 +++ b/src/core/systemd.pc.in
-@@ -65,16 +65,16 @@ systemdshutdowndir=3D${systemd_shutdown_dir}
- tmpfiles_dir=3D${prefix}/lib/tmpfiles.d
- tmpfilesdir=3D${tmpfiles_dir}
+@@ -67,16 +67,16 @@ tmpfilesdir=3D${tmpfiles_dir}
+=20
+ user_tmpfiles_dir=3D${prefix}/share/user-tmpfiles.d
=20=20
 -sysusers_dir=3D${rootprefix}/lib/sysusers.d
 +sysusers_dir=3D${prefix}/lib/sysusers.d
@@ -41,7 +42,7 @@ index fc0f8c34fa..65996bbed8 100644
=20=20
  catalog_dir=3D${prefix}/lib/systemd/catalog
 diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-=
path.c
-index ff1e0d5f8e..19a001f47e 100644
+index ac33e349c0..f0615ffb22 100644
 --- a/src/libsystemd/sd-path/sd-path.c
 +++ b/src/libsystemd/sd-path/sd-path.c
 @@ -362,19 +362,19 @@ static int get_path(uint64_t type, char **buffer, co=
nst char **ret) {
@@ -68,6 +69,3 @@ index ff1e0d5f8e..19a001f47e 100644
                  return 0;
=20=20
          case SD_PATH_CATALOG:
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0001-shared-utmp-wtmp-fix-bu=
ild-without-utmp.patch b/meta/recipes-core/systemd/systemd/0001-shared-utmp=
-wtmp-fix-build-without-utmp.patch
deleted file mode 100644
index 2bb9565bf2..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-shared-utmp-wtmp-fix-build-wit=
hout-utmp.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d6e2c2d34d336398f5948a8b731fefff3dc0ff12 Mon Sep 17 00:00:00 2001
-From: Christian Hesse <mail@eworm.de>
-Date: Thu, 2 Jun 2022 20:49:46 +0200
-Subject: [PATCH] shared/utmp-wtmp: fix build without utmp
-
-Commit 16618332388442f2f1c3e52b0a9fde00121564a3 changed a function to
-add an extra argument. The data types used when building without utmp
-missed the change.
-
-Upstream-Status: Backport [d6e2c2d34d336398f5948a8b731fefff3dc0ff12]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- src/shared/utmp-wtmp.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/shared/utmp-wtmp.h b/src/shared/utmp-wtmp.h
-index 36e4203b4f..188d011fdd 100644
---- a/src/shared/utmp-wtmp.h
-+++ b/src/shared/utmp-wtmp.h
-@@ -59,7 +59,7 @@ static inline int utmp_wall(
-                 const char *message,
-                 const char *username,
-                 const char *origin_tty,
--                bool (*match_tty)(const char *tty, void *userdata),
-+                bool (*match_tty)(const char *tty, bool is_local, void *u=
serdata),
-                 void *userdata) {
-         return 0;
- }
---=20
-2.36.1
-
diff --git a/meta/recipes-core/systemd/systemd/38c87ca2ab96d085158485ecfc46=
c7cb6af0f166.patch b/meta/recipes-core/systemd/systemd/38c87ca2ab96d0851584=
85ecfc46c7cb6af0f166.patch
deleted file mode 100644
index 6ab89cd99e..0000000000
--- a/meta/recipes-core/systemd/systemd/38c87ca2ab96d085158485ecfc46c7cb6af=
0f166.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 38c87ca2ab96d085158485ecfc46c7cb6af0f166 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@in=
.waw.pl>
-Date: Fri, 3 Jun 2022 09:32:02 +0200
-Subject: [PATCH] sha256: fix compilation on efi-ia32
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-/usr/bin/gcc -c ../src/fundamental/sha256.c -o src/boot/efi/sha256.c.o -Wn=
o-format-signedness -Wno-missing-field-initializers -Wno-unused-parameter -=
Wdate-time -Wendif-labels -Werror=3Dformat=3D2 -Werror=3Dimplicit-function-=
declaration -Werror=3Dincompatible-pointer-types -Werror=3Dint-conversion -=
Werror=3Doverflow -Werror=3Doverride-init -Werror=3Dreturn-type -Werror=3Ds=
hift-count-overflow -Werror=3Dshift-overflow=3D2 -Werror=3Dundef -Wfloat-eq=
ual -Wimplicit-fallthrough=3D5 -Winit-self -Wlogical-op -Wmissing-include-d=
irs -Wmissing-noreturn -Wnested-externs -Wold-style-definition -Wpointer-ar=
ith -Wredundant-decls -Wshadow -Wstrict-aliasing=3D2 -Wstrict-prototypes -W=
suggest-attribute=3Dnoreturn -Wunused-function -Wwrite-strings -Wno-unused-=
result -fno-stack-protector -fno-strict-aliasing -fpic -fwide-exec-charset=
=3DUCS2 -Wall -Wextra -Wsign-compare -nostdlib -std=3Dgnu99 -ffreestanding =
-fshort-wchar -fvisibility=3Dhidden -isystem /usr/include/efi -isystem /usr=
/include/efi/ia32 -I /builddir/build/BUILD/systemd-stable-250.7/src/fundame=
ntal -DSD_BOOT -DGNU_EFI_USE_MS_ABI -include src/boot/efi/efi_config.h -inc=
lude version.h -mno-sse -mno-mmx -flto -O2 -flto=3Dauto
-../src/fundamental/sha256.c: In function =E2=80=98sha256_finish_ctx=E2=80=
=99:
-../src/fundamental/sha256.c:61:25: error: =E2=80=98false=E2=80=99 undeclar=
ed (first use in this function)
-   61 | # define UNALIGNED_P(p) false
-      |                         ^~~~~
-../src/fundamental/sha256.c:136:21: note: in expansion of macro =E2=80=98U=
NALIGNED_P=E2=80=99
-  136 |                 if (UNALIGNED_P(resbuf))
-      |                     ^~~~~~~~~~~
-../src/fundamental/sha256.c:32:1: note: =E2=80=98false=E2=80=99 is defined=
 in header =E2=80=98<stdbool.h>=E2=80=99; did you forget to =E2=80=98#inclu=
de <stdbool.h>=E2=80=99?
-   31 | #include "sha256.h"
-  +++ |+#include <stdbool.h>
-   32 |
-...
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- src/fundamental/sha256.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/fundamental/sha256.c b/src/fundamental/sha256.c
-index cd16aec4dd..58b1a80d33 100644
---- a/src/fundamental/sha256.c
-+++ b/src/fundamental/sha256.c
-@@ -58,7 +58,7 @@
- #  define UNALIGNED_P(p) (((size_t) p) % sizeof(uint32_t) !=3D 0)
- # endif
- #else
--# define UNALIGNED_P(p) false
-+# define UNALIGNED_P(p) sd_false
- #endif
-=20
- /* This array contains the bytes used to pad the buffer to the next
diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core=
/systemd/systemd_251.3.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_251.2.bb
rename to meta/recipes-core/systemd/systemd_251.3.bb
index bb3c59f418..025472143c 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.3.bb
@@ -14,7 +14,8 @@ inherit useradd pkgconfig meson perlnative update-rc.d up=
date-alternatives qemu
 # that we don't build both udev and systemd in world builds.
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
-SRC_URI +=3D "file://touchscreen.rules \
+SRC_URI +=3D " \
+           file://touchscreen.rules \
            file://00-create-volatile.conf \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallbac=
k', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallbac=
k', 'file://00-hostnamed-network-user.conf', '', d)} \
@@ -24,7 +25,6 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to=
-.patch \
-           file://0001-shared-utmp-wtmp-fix-build-without-utmp.patch \
            "
=20
 # patches needed by musl
--=20
2.30.2


