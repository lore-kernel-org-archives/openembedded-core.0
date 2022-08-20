Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB83C25B08
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 16:39:08 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.8511.1661013547526623016
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Aug 2022 09:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lTfgOeYj;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id p125so6818731pfp.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Aug 2022 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=7Pu5+S7w+tWIOE+bI1ZXo2lDLlyq0mPpJzA0ar4YVDo=;
        b=lTfgOeYjHiqRn2LrAre4icsvbravl3zL5i9f8YZy+CgvxL0fK2jdfZTwKAABGu2N9K
         nwQfXWHoVahhd4WphBAWcdbNAfwUgqb6q3a++cPCAW8pwUdtCRmcIFrZO5BTcKr4HE03
         WpbZavY4Iw9WRed+dSr914ErPW7h+Ug03WNkB34lnb5scCs8srPAD747vdd6TLxBOh5u
         V9jkBWETXNNYOAcvio27qSb8gywujyqkx7WkoAaYI+HsHmhuJtRP5KHwoxHz0H0IAieO
         1TCDV5yo0hNBevsItxyOVARmKY8C6v5JumM3RerhiU8VFa3UosKfuyHH9lDr7ptD0Zg9
         RgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=7Pu5+S7w+tWIOE+bI1ZXo2lDLlyq0mPpJzA0ar4YVDo=;
        b=k6YTpMpBeRgHmYg0dVpAw2zdrFU+1aJiOW/Vw63phyxEZroMUSI4yq0iBf+oZGMbc0
         bswz/3E5yPm5a7SkI2Zb7/HV5kVh/xFu/P24bEDJ0oSwiC5kAGWNIuuVfpq0OviA2SxT
         leW1x/GkgOj6IG7bfknFmyJMueHLLbwKShP4TL8M334LpDbG+Ov4tT3H8j+WD2dhoTIk
         IaJEDqBf9CuzKFmLKvNWzI44RfDPrtx8yDISS6OreqqBL7RfGNcqi0AMW+4nI3SRKlxb
         PylE3/KoneXQLHtFf36zkDY2QuR70JMGA1A2AwayrV6Y4YhZCa/lT8ZFFd88q63gc1b3
         rJtA==
X-Gm-Message-State: ACgBeo0kI5qZr7VxLNnI3S8H5dZq7UEUfx00boxXtJSIbEKAZyJn0Gk9
	GhOUQHWNHK2WZUfE9AQzx/92KJUaSL5RBw==
X-Google-Smtp-Source: 
 AA6agR5ID5A++wrJ8sswpgefyW3m+WYhubiYIJI2MWX9jTKUopUu80Vcdsv1Rv6CsqzJJ62pDUvshQ==
X-Received: by 2002:a63:1208:0:b0:423:c60e:ed09 with SMTP id
 h8-20020a631208000000b00423c60eed09mr10297401pgl.385.1661013546523;
        Sat, 20 Aug 2022 09:39:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 rt12-20020a17090b508c00b001f334aa9170sm7081652pjb.48.2022.08.20.09.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 09:39:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Upgrade to 12.2.0
Date: Sat, 20 Aug 2022 09:39:03 -0700
Message-Id: <20220820163903.3462152-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Aug 2022 16:39:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169651

GCC 12.2 is the first bug-fix release from the GCC 12 branch containing
important fixes for regressions and serious bugs in GCC 12.1 with more
than 71 bugs fixed since the previous release comprising of  a number
of libstdc++ and C++ and fortran fixes [1]

Remove backported patch to fix libsanitizers with glibc 2.36, its
already present in 12.2

[1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 .../gcc/{gcc-12.1.inc => gcc-12.2.inc}        |  7 ++-
 ...ian_12.1.bb => gcc-cross-canadian_12.2.bb} |  0
 .../{gcc-cross_12.1.bb => gcc-cross_12.2.bb}  |  0
 ...-crosssdk_12.1.bb => gcc-crosssdk_12.2.bb} |  0
 ...cc-runtime_12.1.bb => gcc-runtime_12.2.bb} |  0
 ...itizers_12.1.bb => gcc-sanitizers_12.2.bb} |  0
 ...{gcc-source_12.1.bb => gcc-source_12.2.bb} |  0
 ...rry-pick-9cf13067cb5088626ba7-from-u.patch | 45 -------------------
 .../gcc/{gcc_12.1.bb => gcc_12.2.bb}          |  0
 ...initial_12.1.bb => libgcc-initial_12.2.bb} |  0
 .../gcc/{libgcc_12.1.bb => libgcc_12.2.bb}    |  0
 ...ibgfortran_12.1.bb => libgfortran_12.2.bb} |  0
 13 files changed, 4 insertions(+), 50 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-12.1.inc => gcc-12.2.inc} (95%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.1.bb => gcc-cross-canadian_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_12.1.bb => gcc-cross_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.1.bb => gcc-crosssdk_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_12.1.bb => gcc-runtime_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.1.bb => gcc-sanitizers_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_12.1.bb => gcc-source_12.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch
 rename meta/recipes-devtools/gcc/{gcc_12.1.bb => gcc_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_12.1.bb => libgcc-initial_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_12.1.bb => libgcc_12.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_12.1.bb => libgfortran_12.2.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c0c38dfc16..47b3e8148e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -188,7 +188,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-12.1.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-12.2.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtools/gcc/gcc-12.2.inc
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-12.1.inc
rename to meta/recipes-devtools/gcc/gcc-12.2.inc
index 488e0c95b1..572fd8b669 100644
--- a/meta/recipes-devtools/gcc/gcc-12.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.2.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "12.1.0"
+PV = "12.2.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "12.1.0"
+BINV = "12.2.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -64,11 +64,10 @@ SRC_URI = "${BASEURI} \
            file://0024-Fix-install-path-of-linux64.h.patch \
            file://0025-Move-sched.h-include-ahead-of-user-headers.patch \
            file://0026-rust-recursion-limit.patch \
-           file://0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch \
            file://prefix-map-realpath.patch \
            file://hardcoded-paths.patch \
 "
-SRC_URI[sha256sum] = "62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b"
+SRC_URI[sha256sum] = "e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_12.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_12.1.bb b/meta/recipes-devtools/gcc/gcc-cross_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_12.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_12.1.bb b/meta/recipes-devtools/gcc/gcc-source_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_12.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_12.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch b/meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch
deleted file mode 100644
index 6bbc95aa00..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2701442d0cf6292f6624443c15813d6d1a3562fe Mon Sep 17 00:00:00 2001
-From: Martin Liska <mliska@suse.cz>
-Date: Mon, 11 Jul 2022 22:03:14 +0200
-Subject: [PATCH] libsanitizer: cherry-pick 9cf13067cb5088626ba7 from upstream
-
-9cf13067cb5088626ba7ee1ec4c42ec59c7995a0 [sanitizer] Remove #include <linux/fs.h> to resolve fsconfig_command/mount_attr conflict with glibc 2.36
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=2701442d0cf6292f6624443c15813d6d1a3562fe]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../sanitizer_platform_limits_posix.cpp                | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
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
-@@ -869,10 +871,10 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
-   unsigned IOCTL_EVIOCGPROP = IOCTL_NOT_PRESENT;
-   unsigned IOCTL_EVIOCSKEYCODE_V2 = IOCTL_NOT_PRESENT;
- #endif
--  unsigned IOCTL_FS_IOC_GETFLAGS = FS_IOC_GETFLAGS;
--  unsigned IOCTL_FS_IOC_GETVERSION = FS_IOC_GETVERSION;
--  unsigned IOCTL_FS_IOC_SETFLAGS = FS_IOC_SETFLAGS;
--  unsigned IOCTL_FS_IOC_SETVERSION = FS_IOC_SETVERSION;
-+  unsigned IOCTL_FS_IOC_GETFLAGS = _IOR('f', 1, long);
-+  unsigned IOCTL_FS_IOC_GETVERSION = _IOR('v', 1, long);
-+  unsigned IOCTL_FS_IOC_SETFLAGS = _IOW('f', 2, long);
-+  unsigned IOCTL_FS_IOC_SETVERSION = _IOW('v', 2, long);
-   unsigned IOCTL_GIO_CMAP = GIO_CMAP;
-   unsigned IOCTL_GIO_FONT = GIO_FONT;
-   unsigned IOCTL_GIO_UNIMAP = GIO_UNIMAP;
--- 
-2.37.1
-
diff --git a/meta/recipes-devtools/gcc/gcc_12.1.bb b/meta/recipes-devtools/gcc/gcc_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_12.1.bb
rename to meta/recipes-devtools/gcc/gcc_12.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_12.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_12.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_12.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_12.1.bb b/meta/recipes-devtools/gcc/libgcc_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_12.1.bb
rename to meta/recipes-devtools/gcc/libgcc_12.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_12.1.bb b/meta/recipes-devtools/gcc/libgfortran_12.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_12.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_12.2.bb
-- 
2.37.2


