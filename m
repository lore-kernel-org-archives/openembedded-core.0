Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3550.1795026746063723626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 10:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=RSOkSoNi;
 spf=pass (domain: 9elements.com, ip: 209.85.208.182, mailfrom: tan.siewert@9elements.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso12474601fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795026744; x=1795631544; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q7athTTxHLfayKx0Ff1Hce9XM2787W6hxuYlaBnAWRE=;
        b=RSOkSoNiEDAy/adUjYdW+8xu4BfzqACiGdq1UtZ14mt2m5hxBr0EZjg1B7CIBBlpel
         DCQ8DAz9oXc1PipxPqHEMVlJVXf/oII97IscpP+S0L81IL1Jmn/sL+F/ya7wtc/HZkal
         Vz80olTCo08xNd35xueNS3J2vb/EYj6i0hzv3SlIRtMHJlAfl+5Hdrk7a5O46ZQKHZhE
         XaUCJCCi/o1uPxuMRNAMegLfMG7SKKys0N5yrljEEa9AD0KhuLaAko8x6SmOCIqogGqU
         d0y9PDLSlFox1xlETIdSrT/a4YfrLeOfgyjiOyKquDvGpPi9YsN1Qj4y0ufQnq2amcyp
         TZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026744; x=1795631544;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q7athTTxHLfayKx0Ff1Hce9XM2787W6hxuYlaBnAWRE=;
        b=H5Q/HHoI+VKT3mdAomPrpRydExVcxVQLmR8EGophFn2FUFMIAXOaTM6WAcdrpOerRX
         knCnEJs/1fwoe8d5sV7LnGNUTyxMvDec9lLUNnm4EbF/2Iu3QWlweXu8xSa2KYxmMtJY
         Dr94nlQYK3rwYzmXqccAWfQ8GEDIxblutl9tmzO7/jiG730064j/47KolcUzqTNJw+pq
         TKNc/ilwwWk1RiGD/K5abWVK2UGzwqnXZSlu/LMmtIhkMaU15vkWeTRGAZwouV7YiheS
         mFptSddeQ12Rt+POwiPOYcAQ+Xg1vShn+cajyFcDpahrEOuNouDZL30uv3x7vpFfyvj3
         7+iA==
X-Gm-Message-State: APuU4Z93g2LYBFX0VfHLYy8PKYgb+DeZ0RIKQDU7JEM6HBDvw3ppI3G+
	VOa5j5rlhCDzku3LXAOrWILYGdF8JQJvsSfajBCM5CwWynQGTPxhodujt4KOlA+hvHjQaAztbmH
	uI+6DVSs=
X-Gm-Gg: AYBFou3CgYQt+bYy0oHTgBftwONQ6UTGKirnI8kJgkEEW1IQvyT+CoHaRxg5OLZXK07
	OjoN/+1Gctla8NtLIL+CwrNI3/Ov40RlybZxPC8rRZaRscl0axG3TQN+ucx62rZ49jI1Uf8j7/J
	iNQc6BhMo7Xqn8XXHdHVfmHXYF8tVXYJ/bopBgK+H7R2x39/xUZ5q8exXYroEmvZPU2E8Xmb23X
	YL2XXidJUwepQWmoN2onkMuwzeaIm/ba9A0kKb7HxWavPDzWpZCltbErE01O2Dps5Adm8IaJ47Q
	pYio+LpmyXF7FqE5Z7E43J4DS/mhn7a6v7XGMdLSI5Byv2O/rjca1GydA3xToP3f453AeB6xwiW
	GglsBDXI2XVOwQYE/p5SBggN918cSAkqNQspLjIn2UKNieuC19aIwEIRPRyQXgsXBQVRjgHu2Ul
	VLS2KDFWYkBdX6/T2N4msur8EMcqkTeMU9u3FRSqTZ328zDxeqdvE1rfsHM+k1Q+fTS2lIp+bXS
	RTs3icgZCuXJBvKMhqEQie5ahsZn47hKu2LBQ4Kb74+VQA2a8yVyKUiPHGA/fF6RXClPu8AfLZ4
	z0VJPb0EaAFQjx8V82LUHL1LMsfL5o9plQLUErutiTvcf1aAB84=
X-Received: by 2002:a05:600c:4fc6:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb7da23baemr71131675e9.15.1795026405431;
        Wed, 18 Nov 2026 10:26:45 -0800 (PST)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha633933.local ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb83249eb9sm5359435e9.1.2026.11.18.10.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:26:45 -0800 (PST)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Wed, 18 Nov 2026 19:26:36 +0100
Subject: [PATCH] systemd: upgrade 262 -> 262.2
MIME-Version: 1.0
Message-Id: <20261118-systemd-update-v1-1-9a54c36efd6c@9elements.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMBAF0atIrw0kCiJeZZhFTL7ago6koyji3
 Y3j8i2qThIEhlCTnRSwsfBvTjB5Rm6wcw/FPpkKXVTGmFrJIRGTV+vibYSCrjS60tats5SiJaD
 j/T/8fF/L2o5w8bnQdd2y+tSkcgAAAA==
X-Change-ID: 20261118-systemd-update-e060ef3a8bca
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795026396; l=11995;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=WsiV6EF4ND11sFAzfUMgUliaQUzoxM6VR62cdHtBwto=;
 b=I+yQFq95Z5sm6ScRAnpSI8O/bfMQVJVp/ySrnJX9tq5tfar/3qcU3pAGNGWwhNSdzn7/jArHo
 DrvUM45oCG3BL44K927huZAPHOGk4nHHbPjPME7/cvrKE4d8LxNK5u8
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 18:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250578

- Drop 0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch [1]
- Refresh patches for v262.2

[1] https://github.com/systemd/systemd/commit/546e9270a0

Compare Log: https://github.com/systemd/systemd/compare/v262...v262.2

AI Generated: Uses Klaus EDV (Claude Opus 5.5)

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 ...-native_262.bb => systemd-boot-native_262.2.bb} |  0
 .../{systemd-boot_262.bb => systemd-boot_262.2.bb} |  0
 ...native_262.bb => systemd-tools-native_262.2.bb} |  0
 meta/recipes-core/systemd/systemd.inc              |  2 +-
 ...pend-the-sysroot-to-libaudit-s-includedir.patch | 63 ----------------------
 ...dle-missing-STATX_MNT_ID-on-older-kernels.patch | 53 ++++++++++++------
 .../systemd/{systemd_262.bb => systemd_262.2.bb}   |  1 -
 7 files changed, 37 insertions(+), 82 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_262.bb b/meta/recipes-core/systemd/systemd-boot-native_262.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_262.bb
rename to meta/recipes-core/systemd/systemd-boot-native_262.2.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_262.bb b/meta/recipes-core/systemd/systemd-boot_262.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_262.bb
rename to meta/recipes-core/systemd/systemd-boot_262.2.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_262.bb b/meta/recipes-core/systemd/systemd-tools-native_262.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-tools-native_262.bb
rename to meta/recipes-core/systemd/systemd-tools-native_262.2.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3efc48f65b..ec21358d19 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -13,7 +13,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=c09786363500a9acc29b147e6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=be0aaf4a380f73f7e00b420a007368f2"
 
-SRCREV = "8cc40e0c5e9234bf45084751ac53b1fbfe70b492"
+SRCREV = "63511d7283d7d0e2a2fc28075481afaf1a7be8f5"
 SRCBRANCH = "v262-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
diff --git a/meta/recipes-core/systemd/systemd/0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch b/meta/recipes-core/systemd/systemd/0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch
deleted file mode 100644
index 5212577955..0000000000
--- a/meta/recipes-core/systemd/systemd/0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 492b3f38c3cea1054bffe5f9e203dcf73ee8e981 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Wed, 21 Oct 2026 05:09:48 +0900
-Subject: [PATCH] journal: prepend the sysroot to libaudit's includedir if
- pkg-config did not
-
-The audit type list generator builds its -I flag from the includedir
-variable of audit.pc. When cross-compiling, that variable is not
-necessarily relocated into the sysroot: with the freedesktop.org
-sysroot rules, pkg-config applies PKG_CONFIG_SYSROOT_DIR only to the
--I/-L flags in Cflags/Libs, and returns variables as is. pkgconf
-follows these rules when PKG_CONFIG_FDO_SYSROOT_RULES is set, which
-OpenEmbedded does in its pkg-config wrapper.
-
-The includedir then yields the unprefixed /usr/include. GCC does not
-apply --sysroot to a plain -I, so the build host's headers get picked
-up, and toolchains built with -Werror=poison-system-directories, as
-OpenEmbedded's is, reject it:
-
-  cc1: error: include location "/usr/include" is unsafe for cross-compilation [-Werror=poison-system-directories]
-
-Query pc_sysrootdir, which pkgconf sets from PKG_CONFIG_SYSROOT_DIR,
-and prepend it to includedir unless includedir is already under it
-(pkgconf's default mode already relocates variables). This does not
-single out any particular directory, so a customized includedir is
-handled the same way.
-
-Follow-up for 0d06dbabc364fe58e4bd1b9696f3c5b823620dbc (v262).
-
-Co-authored-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/492b3f38c3cea1054bffe5f9e203dcf73ee8e981]
-Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
----
- src/journal/meson.build | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/src/journal/meson.build b/src/journal/meson.build
-index a27b359b61..d6bc742b3d 100644
---- a/src/journal/meson.build
-+++ b/src/journal/meson.build
-@@ -33,9 +33,17 @@ systemd_journald_export_sources += journald_gperf_c
- generate_audit_type_list = files('generate-audit_type-list.sh')
- generate_audit_type_command = [env, 'bash', generate_audit_type_list, cpp]
- if libaudit.found()
-+        # With the freedesktop.org sysroot rules (e.g. PKG_CONFIG_FDO_SYSROOT_RULES=1, as set by
-+        # OpenEmbedded), pkg-config does not prepend the sysroot to variables. Do it ourselves.
-+        libaudit_includedir = libaudit.get_variable('includedir')
-+        libaudit_sysroot = libaudit.get_variable(pkgconfig : 'pc_sysrootdir', default_value : '')
-+        if libaudit_sysroot not in ['', '/'] and not libaudit_includedir.startswith(libaudit_sysroot + '/')
-+                libaudit_includedir = libaudit_sysroot + libaudit_includedir
-+        endif
-+
-         generate_audit_type_command += [
-                 '-include', 'libaudit.h',
--                '-I' + libaudit.get_variable('includedir'),
-+                '-I' + libaudit_includedir,
-         ]
- endif
- generate_audit_type_command += system_include_args
--- 
-2.43.0
-
diff --git a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
index 7e96550dd3..10b1b258ae 100644
--- a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
+++ b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
@@ -22,27 +22,34 @@ Upstream-Status: Inappropriate [oe specific]
 Assisted-by: kiro:claude-opus-4.6
 Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
 ---
- src/basic/chase.c   | 21 +++++++++++++++-
- src/basic/fd-util.c | 61 +++++++++++++++++++++++++++++++++++++++++++--
+ src/basic/chase.c   | 21 +++++++++++++--
+ src/basic/fd-util.c | 63 +++++++++++++++++++++++++++++++++++++++++++--
  src/basic/fd-util.h |  1 +
- 3 files changed, 80 insertions(+), 3 deletions(-)
+ 3 files changed, 81 insertions(+), 4 deletions(-)
 
 diff --git a/src/basic/chase.c b/src/basic/chase.c
-index 23a523798e..08ef95b3dd 100644
+index ff879aefa5..1d6199d17b 100644
 --- a/src/basic/chase.c
 +++ b/src/basic/chase.c
-@@ -40,7 +40,9 @@
+@@ -45,7 +45,7 @@
          (CHASE_MUST_BE_DIRECTORY|CHASE_MUST_BE_REGULAR|CHASE_MUST_BE_SOCKET)
  
- static int chase_statx(int fd, struct statx *ret) {
+ static int chase_statx(int fd, ChaseFlags chase_flags, struct statx *ret) {
+-        int statx_flags = 0;
++        int statx_flags = 0, r;
+ 
+         /* Querying fresh attributes of a mount point root on a network file system (e.g. NFS) makes
+          * the kernel revalidate them with the server, which blocks if the server is unreachable.
+@@ -53,7 +53,7 @@ static int chase_statx(int fd, ChaseFlags chase_flags, struct statx *ret) {
+         if (FLAGS_SET(chase_flags, CHASE_NO_SYNC))
+                 statx_flags |= AT_STATX_DONT_SYNC;
+ 
 -        return xstatx_full(fd,
-+        int r;
-+
 +        r = xstatx_full(fd,
                          /* path= */ NULL,
-                         /* statx_flags= */ 0,
+                         statx_flags,
                          XSTATX_MNT_ID_BEST,
-@@ -48,6 +50,23 @@ static int chase_statx(int fd, struct statx *ret) {
+@@ -61,6 +61,23 @@ static int chase_statx(int fd, ChaseFlags chase_flags, struct statx *ret) {
                          /* optional_mask= */ 0,
                          /* mandatory_attributes= */ 0,
                          ret);
@@ -50,7 +57,7 @@ index 23a523798e..08ef95b3dd 100644
 +                uint64_t mnt_id;
 +
 +                /* Kernel lacks STATX_MNT_ID; fall back to /proc/self/fdinfo. */
-+                r = xstatx(fd, /* path= */ NULL, /* statx_flags= */ 0,
++                r = xstatx(fd, /* path= */ NULL, statx_flags,
 +                           STATX_TYPE|STATX_UID|STATX_INO,
 +                           ret);
 +                if (r < 0)
@@ -65,12 +72,24 @@ index 23a523798e..08ef95b3dd 100644
 +        return r;
  }
  
- static int chase_openat2(int root_fd, int dir_fd, const char *path, ChaseFlags chase_flags) {
+ static int chase_statx_is_root(const struct statx *stx, const struct statx *root_stx) {
 diff --git a/src/basic/fd-util.c b/src/basic/fd-util.c
-index c6e78c59b6..7f33d900e5 100644
+index 5c07983782..a4dc9f04e6 100644
 --- a/src/basic/fd-util.c
 +++ b/src/basic/fd-util.c
-@@ -1082,6 +1082,38 @@ int path_is_root_at(int dir_fd, const char *path) {
+@@ -12,9 +12,11 @@
+ #include "dirent-util.h"
+ #include "errno-util.h"
+ #include "fd-util.h"
++#include "fileio.h"
+ #include "format-util.h"
+ #include "fs-util.h"
+ #include "log.h"
++#include "parse-util.h"
+ #include "path-util.h"
+ #include "process-util.h"
+ #include "sort-util.h"
+@@ -1107,6 +1109,38 @@ int path_is_root_at(int dir_fd, const char *path) {
          return fds_inode_and_mount_same(dir_fd, XAT_FDROOT);
  }
  
@@ -109,7 +128,7 @@ index c6e78c59b6..7f33d900e5 100644
  int fds_inode_and_mount_same(int fd1, int fd2) {
          struct statx sx1, sx2;
          int r;
-@@ -1092,7 +1124,20 @@ int fds_inode_and_mount_same(int fd1, int fd2) {
+@@ -1117,7 +1151,20 @@ int fds_inode_and_mount_same(int fd1, int fd2) {
          r = xstatx(fd1, /* path = */ NULL, AT_EMPTY_PATH,
                     STATX_TYPE|STATX_INO|STATX_MNT_ID,
                     &sx1);
@@ -131,7 +150,7 @@ index c6e78c59b6..7f33d900e5 100644
                  return r;
  
          if (fd1 == fd2) /* Shortcut things if fds are the same (only after validating the fd) */
-@@ -1101,7 +1146,19 @@ int fds_inode_and_mount_same(int fd1, int fd2) {
+@@ -1126,7 +1173,19 @@ int fds_inode_and_mount_same(int fd1, int fd2) {
          r = xstatx(fd2, /* path = */ NULL, AT_EMPTY_PATH,
                     STATX_TYPE|STATX_INO|STATX_MNT_ID,
                     &sx2);
@@ -153,7 +172,7 @@ index c6e78c59b6..7f33d900e5 100644
  
          r = statx_mount_same(&sx1, &sx2);
 diff --git a/src/basic/fd-util.h b/src/basic/fd-util.h
-index 86bddb6dac..34370c8943 100644
+index caf948a218..0d7b89e6c2 100644
 --- a/src/basic/fd-util.h
 +++ b/src/basic/fd-util.h
 @@ -188,6 +188,7 @@ static inline int dir_fd_is_root_or_cwd(int dir_fd) {
diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.2.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_262.bb
rename to meta/recipes-core/systemd/systemd_262.2.bb
index 71a90a0903..7223a4d192 100644
--- a/meta/recipes-core/systemd/systemd_262.bb
+++ b/meta/recipes-core/systemd/systemd_262.2.bb
@@ -37,7 +37,6 @@ SRC_URI += "file://touchscreen.rules \
            file://coredumpd-kernel-version.conf \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://0004-journal-prepend-the-sysroot-to-libaudit-s-includedir.patch \
            "
 
 PAM_PLUGINS = " \

---
base-commit: 9518ce9aa2a6cbce678895ef9a95cd27939dae2a
change-id: 20261118-systemd-update-e060ef3a8bca

Best regards,
--  
Tan Siewert <tan.siewert@9elements.com>

