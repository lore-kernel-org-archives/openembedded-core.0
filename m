Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id D37D27C7AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 19:20:51 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x1HJKqaE004310
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 20:20:52 +0100
Received: from dev.vm6.ccp.siemens.com ([139.22.40.5])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x1HJKqFi015460;
	Sun, 17 Feb 2019 20:20:52 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 059DB98F566;
	Sun, 17 Feb 2019 20:20:52 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 20:19:53 +0100
Message-Id: <20190217191953.12856-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190217191953.12856-1-andrej.valek@siemens.com>
References: <20190217191953.12856-1-andrej.valek@siemens.com>
MIME-Version: 1.0
In-Reply-To: <20190215082252.2726-1-andrej.valek@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
Subject: [PATCH v3 1/1] busybox: 1.29.3 -> 1.30.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2019 19:20:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- update to last stable version 1.30.1
- remove and refresh already merged patches
- re-generate defconfig

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...inittab_1.29.3.bb => busybox-inittab_1.30.1.bb} |   0
 ...te-check-CONFIG_DESKTOP-before-using-od-t.patch |  83 ---------
 ...-testsuite-check-uudecode-before-using-it.patch |   6 +-
 meta/recipes-core/busybox/busybox/defconfig        | 191 +++++++++++----------
 .../{busybox_1.29.3.bb => busybox_1.30.1.bb}       |   5 +-
 5 files changed, 104 insertions(+), 181 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.29.3.bb => busybox-inittab_1.30.1.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
 rename meta/recipes-core/busybox/{busybox_1.29.3.bb => busybox_1.30.1.bb} (89%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.29.3.bb b/meta/recipes-core/busybox/busybox-inittab_1.30.1.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.29.3.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.30.1.bb
diff --git a/meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch b/meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
deleted file mode 100644
index 9b96eeeae5..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From b09db631e77c63ebe733c69b00108f043f1f1d85 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 21 Nov 2018 10:00:29 +0800
-Subject: [PATCH] testsuite: check CONFIG_DESKTOP before using 'od -t'
-
-The '-t' option for od is enabled by CONFIG_DESKTOP. So
-check this config before using 'od -t' in test cases.
-
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2018-November/086895.html]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- testsuite/echo/echo-prints-dash        | 1 +
- testsuite/echo/echo-prints-non-opts    | 1 +
- testsuite/echo/echo-prints-slash-zero  | 2 +-
- testsuite/echo/echo-prints-slash_00041 | 2 +-
- testsuite/echo/echo-prints-slash_0041  | 2 +-
- testsuite/echo/echo-prints-slash_041   | 2 +-
- testsuite/echo/echo-prints-slash_41    | 2 +-
- 7 files changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/testsuite/echo/echo-prints-dash b/testsuite/echo/echo-prints-dash
-index ddcdbad..f1f31a0 100644
---- a/testsuite/echo/echo-prints-dash
-+++ b/testsuite/echo/echo-prints-dash
-@@ -1 +1,2 @@
-+# FEATURE: CONFIG_DESKTOP
- test "`busybox echo - | od -t x1 | head -n 1`" = "0000000 2d 0a"
-diff --git a/testsuite/echo/echo-prints-non-opts b/testsuite/echo/echo-prints-non-opts
-index c7d1e20..4e642a1 100644
---- a/testsuite/echo/echo-prints-non-opts
-+++ b/testsuite/echo/echo-prints-non-opts
-@@ -1 +1,2 @@
-+# FEATURE: CONFIG_DESKTOP
- test "`busybox echo -neEZ | od -t x1 | head -n 1`" = "0000000 2d 6e 65 45 5a 0a"
-diff --git a/testsuite/echo/echo-prints-slash-zero b/testsuite/echo/echo-prints-slash-zero
-index d97ed8e..948f899 100644
---- a/testsuite/echo/echo-prints-slash-zero
-+++ b/testsuite/echo/echo-prints-slash-zero
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -e -n 'msg\n\0' | od -t x1 | head -n 1`" = "0000000 6d 73 67 0a 00"
-diff --git a/testsuite/echo/echo-prints-slash_00041 b/testsuite/echo/echo-prints-slash_00041
-index 9cffabd..7ea217b 100644
---- a/testsuite/echo/echo-prints-slash_00041
-+++ b/testsuite/echo/echo-prints-slash_00041
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -ne '\00041z' | od -t x1 | head -n 1`" = "0000000 04 31 7a"
-diff --git a/testsuite/echo/echo-prints-slash_0041 b/testsuite/echo/echo-prints-slash_0041
-index b07429d..941faca 100644
---- a/testsuite/echo/echo-prints-slash_0041
-+++ b/testsuite/echo/echo-prints-slash_0041
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -ne '\0041z' | od -t x1 | head -n 1`" = "0000000 21 7a"
-diff --git a/testsuite/echo/echo-prints-slash_041 b/testsuite/echo/echo-prints-slash_041
-index 1d70cec..60cbfca 100644
---- a/testsuite/echo/echo-prints-slash_041
-+++ b/testsuite/echo/echo-prints-slash_041
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -ne '\041z' | od -t x1 | head -n 1`" = "0000000 21 7a"
-diff --git a/testsuite/echo/echo-prints-slash_41 b/testsuite/echo/echo-prints-slash_41
-index 6d8999b..afd7c36 100644
---- a/testsuite/echo/echo-prints-slash_41
-+++ b/testsuite/echo/echo-prints-slash_41
-@@ -1,3 +1,3 @@
--# FEATURE: CONFIG_FEATURE_FANCY_ECHO
-+# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
- 
- test "`busybox echo -ne '\41z' | od -t x1 | head -n 1`" = "0000000 21 7a"
--- 
-2.7.4
-
diff --git a/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch b/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
index 2d9856fb61..25472f0bbd 100644
--- a/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
+++ b/meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
@@ -35,11 +35,11 @@ index af53de9..3b45ece 100755
  rm foo.zip
  
  # File containing some damaged encrypted stream
--optional FEATURE_UNZIP_CDF
-+optional FEATURE_UNZIP_CDF UUDECODE
+-optional FEATURE_UNZIP_CDF CONFIG_UNICODE_SUPPORT
++optional FEATURE_UNZIP_CDF CONFIG_UNICODE_SUPPORT UUDECODE
  testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" \
  "Archive:  bad.zip
-   inflating: ]3j½r«IK-%Ix
+   inflating: ]3j½r«I??K-%Ix
 -- 
 2.7.4
 
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index d11707abc3..a209eea5a1 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.29.1
-# Thu Jul 19 11:09:46 2018
+# Busybox version: 1.30.1
+# Sun Feb 17 18:12:27 2019
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -12,29 +12,29 @@ CONFIG_HAVE_DOT_CONFIG=y
 # CONFIG_EXTRA_COMPAT is not set
 # CONFIG_FEDORA_COMPAT is not set
 # CONFIG_INCLUDE_SUSv2 is not set
-# CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_LONG_OPTS=y
 CONFIG_SHOW_USAGE=y
 # CONFIG_FEATURE_VERBOSE_USAGE is not set
 CONFIG_FEATURE_COMPRESS_USAGE=y
-CONFIG_BUSYBOX=y
-# CONFIG_FEATURE_INSTALLER is not set
-# CONFIG_INSTALL_NO_USR is not set
+CONFIG_LFS=y
 # CONFIG_PAM is not set
-CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_DEVPTS=y
-# CONFIG_FEATURE_CLEAN_UP is not set
 CONFIG_FEATURE_UTMP=y
 # CONFIG_FEATURE_WTMP is not set
 CONFIG_FEATURE_PIDFILE=y
 CONFIG_PID_FILE_PATH="/var/run"
+CONFIG_BUSYBOX=y
+# CONFIG_FEATURE_SHOW_SCRIPT is not set
+# CONFIG_FEATURE_INSTALLER is not set
+# CONFIG_INSTALL_NO_USR is not set
 CONFIG_FEATURE_SUID=y
 CONFIG_FEATURE_SUID_CONFIG=y
 CONFIG_FEATURE_SUID_CONFIG_QUIET=y
-# CONFIG_SELINUX is not set
 # CONFIG_FEATURE_PREFER_APPLETS is not set
 CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
+# CONFIG_SELINUX is not set
+# CONFIG_FEATURE_CLEAN_UP is not set
 CONFIG_FEATURE_SYSLOG=y
-# CONFIG_FEATURE_HAVE_RPC is not set
 CONFIG_PLATFORM_LINUX=y
 
 #
@@ -44,14 +44,16 @@ CONFIG_PLATFORM_LINUX=y
 # CONFIG_PIE is not set
 # CONFIG_NOMMU is not set
 # CONFIG_BUILD_LIBBUSYBOX is not set
+# CONFIG_FEATURE_LIBBUSYBOX_STATIC is not set
 # CONFIG_FEATURE_INDIVIDUAL is not set
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
-CONFIG_LFS=y
 CONFIG_CROSS_COMPILER_PREFIX=""
 CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
+# CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_STACK_OPTIMIZATION_386=y
 
 #
 # Installation Options ("make install" behavior)
@@ -81,7 +83,9 @@ CONFIG_NO_DEBUG_LIB=y
 # Library Tuning
 #
 # CONFIG_FEATURE_USE_BSS_TAIL is not set
+# CONFIG_FLOAT_DURATION is not set
 CONFIG_FEATURE_RTMINMAX=y
+# CONFIG_FEATURE_RTMINMAX_USE_LIBC_DEFINITIONS is not set
 CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
 # CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
 # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
@@ -101,6 +105,7 @@ CONFIG_FEATURE_EDITING_SAVEHISTORY=y
 CONFIG_FEATURE_TAB_COMPLETION=y
 CONFIG_FEATURE_USERNAME_COMPLETION=y
 CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
+# CONFIG_FEATURE_EDITING_WINCH is not set
 # CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
 # CONFIG_LOCALE_SUPPORT is not set
 # CONFIG_UNICODE_SUPPORT is not set
@@ -146,7 +151,6 @@ CONFIG_BZCAT=y
 # CONFIG_UNLZMA is not set
 CONFIG_LZCAT=y
 # CONFIG_LZMA is not set
-# CONFIG_FEATURE_LZMA_FAST is not set
 # CONFIG_UNXZ is not set
 CONFIG_XZCAT=y
 # CONFIG_XZ is not set
@@ -185,12 +189,14 @@ CONFIG_FEATURE_UNZIP_CDF=y
 # CONFIG_FEATURE_UNZIP_BZIP2 is not set
 # CONFIG_FEATURE_UNZIP_LZMA is not set
 # CONFIG_FEATURE_UNZIP_XZ is not set
+# CONFIG_FEATURE_LZMA_FAST is not set
 
 #
 # Coreutils
 #
 CONFIG_BASENAME=y
 CONFIG_CAT=y
+CONFIG_FEATURE_CATN=y
 # CONFIG_FEATURE_CATV is not set
 CONFIG_CHGRP=y
 CONFIG_CHMOD=y
@@ -201,6 +207,7 @@ CONFIG_CHROOT=y
 # CONFIG_COMM is not set
 CONFIG_CP=y
 # CONFIG_FEATURE_CP_LONG_OPTIONS is not set
+# CONFIG_FEATURE_CP_REFLINK is not set
 CONFIG_CUT=y
 CONFIG_DATE=y
 # CONFIG_FEATURE_DATE_ISOFMT is not set
@@ -221,11 +228,8 @@ CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
 CONFIG_ECHO=y
 CONFIG_FEATURE_FANCY_ECHO=y
 CONFIG_ENV=y
-CONFIG_FEATURE_ENV_LONG_OPTIONS=y
 # CONFIG_EXPAND is not set
-# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
 # CONFIG_UNEXPAND is not set
-# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
 CONFIG_EXPR=y
 CONFIG_EXPR_MATH_SUPPORT_64=y
 # CONFIG_FACTOR is not set
@@ -263,12 +267,10 @@ CONFIG_MD5SUM=y
 #
 CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
 CONFIG_MKDIR=y
-CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
 CONFIG_MKFIFO=y
 CONFIG_MKNOD=y
 CONFIG_MKTEMP=y
 CONFIG_MV=y
-# CONFIG_FEATURE_MV_LONG_OPTIONS is not set
 # CONFIG_NICE is not set
 # CONFIG_NL is not set
 CONFIG_NOHUP=y
@@ -283,15 +285,14 @@ CONFIG_FEATURE_READLINK_FOLLOW=y
 CONFIG_REALPATH=y
 CONFIG_RM=y
 CONFIG_RMDIR=y
-# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
 CONFIG_SEQ=y
 # CONFIG_SHRED is not set
 CONFIG_SHUF=y
 CONFIG_SLEEP=y
 CONFIG_FEATURE_FANCY_SLEEP=y
-CONFIG_FEATURE_FLOAT_SLEEP=y
 CONFIG_SORT=y
 CONFIG_FEATURE_SORT_BIG=y
+# CONFIG_FEATURE_SORT_OPTIMIZE_MEMORY is not set
 # CONFIG_SPLIT is not set
 # CONFIG_FEATURE_SPLIT_FANCY is not set
 CONFIG_STAT=y
@@ -331,10 +332,10 @@ CONFIG_USLEEP=y
 # CONFIG_UUENCODE is not set
 CONFIG_WC=y
 # CONFIG_FEATURE_WC_LARGE is not set
+CONFIG_WHOAMI=y
 CONFIG_WHO=y
 # CONFIG_W is not set
 CONFIG_USERS=y
-CONFIG_WHOAMI=y
 CONFIG_YES=y
 
 #
@@ -443,6 +444,7 @@ CONFIG_FEATURE_FIND_MTIME=y
 CONFIG_FEATURE_FIND_MMIN=y
 CONFIG_FEATURE_FIND_PERM=y
 CONFIG_FEATURE_FIND_TYPE=y
+CONFIG_FEATURE_FIND_EXECUTABLE=y
 CONFIG_FEATURE_FIND_XDEV=y
 CONFIG_FEATURE_FIND_MAXDEPTH=y
 CONFIG_FEATURE_FIND_NEWER=y
@@ -456,6 +458,7 @@ CONFIG_FEATURE_FIND_DEPTH=y
 CONFIG_FEATURE_FIND_PAREN=y
 CONFIG_FEATURE_FIND_SIZE=y
 CONFIG_FEATURE_FIND_PRUNE=y
+CONFIG_FEATURE_FIND_QUIT=y
 # CONFIG_FEATURE_FIND_DELETE is not set
 CONFIG_FEATURE_FIND_PATH=y
 CONFIG_FEATURE_FIND_REGEX=y
@@ -471,6 +474,8 @@ CONFIG_XARGS=y
 # CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT is not set
 # CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM is not set
 CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
+# CONFIG_FEATURE_XARGS_SUPPORT_PARALLEL is not set
+# CONFIG_FEATURE_XARGS_SUPPORT_ARGS_FILE is not set
 
 #
 # Init Utilities
@@ -481,6 +486,7 @@ CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
 # CONFIG_HALT is not set
 # CONFIG_POWEROFF is not set
 CONFIG_REBOOT=y
+# CONFIG_FEATURE_WAIT_FOR_INIT is not set
 # CONFIG_FEATURE_CALL_TELINIT is not set
 # CONFIG_TELINIT_PATH is not set
 # CONFIG_INIT is not set
@@ -503,13 +509,11 @@ CONFIG_REBOOT=y
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
-# CONFIG_ADD_SHELL is not set
-# CONFIG_REMOVE_SHELL is not set
 # CONFIG_ADDGROUP is not set
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
 # CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
+# CONFIG_ADD_SHELL is not set
+# CONFIG_REMOVE_SHELL is not set
 # CONFIG_ADDUSER is not set
-# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
 # CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
@@ -585,8 +589,11 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # CONFIG_FEATURE_BLKID_TYPE is not set
 # CONFIG_BLOCKDEV is not set
 # CONFIG_CAL is not set
+# CONFIG_CHRT is not set
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
+# CONFIG_EJECT is not set
+# CONFIG_FEATURE_EJECT_SCSI is not set
 # CONFIG_FALLOCATE is not set
 # CONFIG_FATATTR is not set
 CONFIG_FBSET=y
@@ -616,8 +623,8 @@ CONFIG_HEXDUMP=y
 # CONFIG_HD is not set
 # CONFIG_XXD is not set
 CONFIG_HWCLOCK=y
-CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
 CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
+# CONFIG_IONICE is not set
 # CONFIG_IPCRM is not set
 # CONFIG_IPCS is not set
 # CONFIG_LAST is not set
@@ -653,8 +660,10 @@ CONFIG_MOUNT=y
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
 # CONFIG_FEATURE_MOUNT_OTHERTAB is not set
+CONFIG_MOUNTPOINT=y
+# CONFIG_NOLOGIN is not set
+# CONFIG_NOLOGIN_DEPENDENCIES is not set
 # CONFIG_NSENTER is not set
-# CONFIG_FEATURE_NSENTER_LONG_OPTS is not set
 CONFIG_PIVOT_ROOT=y
 CONFIG_RDATE=y
 # CONFIG_RDEV is not set
@@ -668,10 +677,15 @@ CONFIG_RENICE=y
 # CONFIG_LINUX32 is not set
 # CONFIG_LINUX64 is not set
 # CONFIG_SETPRIV is not set
+# CONFIG_FEATURE_SETPRIV_DUMP is not set
+# CONFIG_FEATURE_SETPRIV_CAPABILITIES is not set
+# CONFIG_FEATURE_SETPRIV_CAPABILITY_NAMES is not set
+CONFIG_SETSID=y
 CONFIG_SWAPON=y
 CONFIG_FEATURE_SWAPON_DISCARD=y
 CONFIG_FEATURE_SWAPON_PRI=y
 CONFIG_SWAPOFF=y
+# CONFIG_FEATURE_SWAPONOFF_LABEL is not set
 CONFIG_SWITCH_ROOT=y
 # CONFIG_TASKSET is not set
 # CONFIG_FEATURE_TASKSET_FANCY is not set
@@ -702,9 +716,11 @@ CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_VOLUMEID_HFS is not set
 # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
 # CONFIG_FEATURE_VOLUMEID_JFS is not set
+# CONFIG_FEATURE_VOLUMEID_LFS is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
 # CONFIG_FEATURE_VOLUMEID_LUKS is not set
+# CONFIG_FEATURE_VOLUMEID_MINIX is not set
 # CONFIG_FEATURE_VOLUMEID_NILFS is not set
 # CONFIG_FEATURE_VOLUMEID_NTFS is not set
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
@@ -719,19 +735,44 @@ CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 #
 # Miscellaneous Utilities
 #
+# CONFIG_ADJTIMEX is not set
+# CONFIG_BBCONFIG is not set
+# CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
+# CONFIG_BC is not set
+CONFIG_DC=y
+# CONFIG_FEATURE_DC_BIG is not set
+# CONFIG_FEATURE_DC_LIBM is not set
+# CONFIG_FEATURE_BC_INTERACTIVE is not set
+# CONFIG_FEATURE_BC_LONG_OPTIONS is not set
 # CONFIG_BEEP is not set
 CONFIG_FEATURE_BEEP_FREQ=0
 CONFIG_FEATURE_BEEP_LENGTH_MS=0
+# CONFIG_CHAT is not set
+# CONFIG_FEATURE_CHAT_NOFAIL is not set
+# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
+# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
+# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
+# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
+# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
+# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
 # CONFIG_CONSPY is not set
 # CONFIG_CROND is not set
 # CONFIG_FEATURE_CROND_D is not set
 # CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+# CONFIG_FEATURE_CROND_SPECIAL_TIMES is not set
 CONFIG_FEATURE_CROND_DIR=""
+# CONFIG_CRONTAB is not set
 # CONFIG_DEVFSD is not set
 # CONFIG_DEVFSD_MODLOAD is not set
 # CONFIG_DEVFSD_FG_NP is not set
 # CONFIG_DEVFSD_VERBOSE is not set
 # CONFIG_FEATURE_DEVFS is not set
+# CONFIG_DEVMEM is not set
+# CONFIG_FBSPLASH is not set
+# CONFIG_FLASHCP is not set
+# CONFIG_FLASH_ERASEALL is not set
+# CONFIG_FLASH_LOCK is not set
+# CONFIG_FLASH_UNLOCK is not set
 # CONFIG_HDPARM is not set
 # CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
 # CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
@@ -744,6 +785,7 @@ CONFIG_FEATURE_CROND_DIR=""
 # CONFIG_I2CSET is not set
 # CONFIG_I2CDUMP is not set
 # CONFIG_I2CDETECT is not set
+# CONFIG_INOTIFYD is not set
 CONFIG_LESS=y
 CONFIG_FEATURE_LESS_MAXLINES=9999999
 CONFIG_FEATURE_LESS_BRACKETS=y
@@ -755,78 +797,35 @@ CONFIG_FEATURE_LESS_FLAGS=y
 # CONFIG_FEATURE_LESS_ASK_TERMINAL is not set
 # CONFIG_FEATURE_LESS_DASHCMD is not set
 # CONFIG_FEATURE_LESS_LINENUMS is not set
+# CONFIG_FEATURE_LESS_RAW is not set
+# CONFIG_FEATURE_LESS_ENV is not set
 # CONFIG_LSSCSI is not set
-# CONFIG_NANDWRITE is not set
-# CONFIG_NANDDUMP is not set
-# CONFIG_PARTPROBE is not set
-CONFIG_RFKILL=y
-# CONFIG_SETSERIAL is not set
-# CONFIG_UBIATTACH is not set
-# CONFIG_UBIDETACH is not set
-# CONFIG_UBIMKVOL is not set
-# CONFIG_UBIRMVOL is not set
-# CONFIG_UBIRSVOL is not set
-# CONFIG_UBIUPDATEVOL is not set
-# CONFIG_UBIRENAME is not set
-# CONFIG_ADJTIMEX is not set
-# CONFIG_BBCONFIG is not set
-# CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
-# CONFIG_BEEP is not set
-CONFIG_FEATURE_BEEP_FREQ=0
-CONFIG_FEATURE_BEEP_LENGTH_MS=0
-# CONFIG_CHAT is not set
-# CONFIG_FEATURE_CHAT_NOFAIL is not set
-# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
-# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
-# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
-# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
-# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
-# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
-# CONFIG_CHRT is not set
-# CONFIG_CRONTAB is not set
-CONFIG_DC=y
-# CONFIG_FEATURE_DC_LIBM is not set
-# CONFIG_DEVFSD is not set
-# CONFIG_DEVFSD_MODLOAD is not set
-# CONFIG_DEVFSD_FG_NP is not set
-# CONFIG_DEVFSD_VERBOSE is not set
-# CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
-# CONFIG_EJECT is not set
-# CONFIG_FEATURE_EJECT_SCSI is not set
-# CONFIG_FBSPLASH is not set
-# CONFIG_FLASHCP is not set
-# CONFIG_FLASH_LOCK is not set
-# CONFIG_FLASH_UNLOCK is not set
-# CONFIG_FLASH_ERASEALL is not set
-# CONFIG_IONICE is not set
-# CONFIG_INOTIFYD is not set
-# CONFIG_LAST is not set
-# CONFIG_FEATURE_LAST_FANCY is not set
-# CONFIG_HDPARM is not set
-# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
-# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
-# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
 # CONFIG_MAKEDEVS is not set
 # CONFIG_FEATURE_MAKEDEVS_LEAF is not set
 # CONFIG_FEATURE_MAKEDEVS_TABLE is not set
 # CONFIG_MAN is not set
 CONFIG_MICROCOM=y
-CONFIG_MOUNTPOINT=y
 # CONFIG_MT is not set
+# CONFIG_NANDWRITE is not set
+# CONFIG_NANDDUMP is not set
+# CONFIG_PARTPROBE is not set
 # CONFIG_RAIDAUTORUN is not set
 # CONFIG_READAHEAD is not set
+CONFIG_RFKILL=y
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
-CONFIG_SETSID=y
 # CONFIG_SETFATTR is not set
+# CONFIG_SETSERIAL is not set
 CONFIG_STRINGS=y
 CONFIG_TIME=y
-# CONFIG_TIMEOUT is not set
 # CONFIG_TTYSIZE is not set
+# CONFIG_UBIRENAME is not set
+# CONFIG_UBIATTACH is not set
+# CONFIG_UBIDETACH is not set
+# CONFIG_UBIMKVOL is not set
+# CONFIG_UBIRMVOL is not set
+# CONFIG_UBIRSVOL is not set
+# CONFIG_UBIUPDATEVOL is not set
 # CONFIG_VOLNAME is not set
 # CONFIG_WATCHDOG is not set
 
@@ -837,6 +836,7 @@ CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
+# CONFIG_FEATURE_TLS_SHA1 is not set
 # CONFIG_ARP is not set
 # CONFIG_ARPING is not set
 # CONFIG_BRCTL is not set
@@ -911,6 +911,7 @@ CONFIG_FEATURE_IP_TUNNEL=y
 # CONFIG_FEATURE_NAMEIF_EXTENDED is not set
 # CONFIG_NBDCLIENT is not set
 CONFIG_NC=y
+# CONFIG_NETCAT is not set
 # CONFIG_NC_SERVER is not set
 # CONFIG_NC_EXTRA is not set
 # CONFIG_NC_110_COMPAT is not set
@@ -918,9 +919,12 @@ CONFIG_NETSTAT=y
 # CONFIG_FEATURE_NETSTAT_WIDE is not set
 # CONFIG_FEATURE_NETSTAT_PRG is not set
 CONFIG_NSLOOKUP=y
+# CONFIG_FEATURE_NSLOOKUP_BIG is not set
+# CONFIG_FEATURE_NSLOOKUP_LONG_OPTIONS is not set
 # CONFIG_NTPD is not set
 # CONFIG_FEATURE_NTPD_SERVER is not set
 # CONFIG_FEATURE_NTPD_CONF is not set
+# CONFIG_FEATURE_NTP_AUTH is not set
 CONFIG_PING=y
 CONFIG_PING6=y
 CONFIG_FEATURE_FANCY_PING=y
@@ -940,15 +944,11 @@ CONFIG_FEATURE_TELNET_WIDTH=y
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=y
+# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTPD is not set
-
-#
-# Common options for tftp/tftpd
-#
 CONFIG_FEATURE_TFTP_GET=y
 CONFIG_FEATURE_TFTP_PUT=y
 # CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
-# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTP_DEBUG is not set
 CONFIG_TLS=y
 CONFIG_TRACEROUTE=y
@@ -988,9 +988,9 @@ CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 #
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
 # CONFIG_FEATURE_UDHCP_8021Q is not set
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"
 
 #
@@ -1071,13 +1071,11 @@ CONFIG_SV_DEFAULT_SERVICE_DIR=""
 # CONFIG_SVOK is not set
 # CONFIG_SVLOGD is not set
 # CONFIG_CHCON is not set
-# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
 # CONFIG_GETENFORCE is not set
 # CONFIG_GETSEBOOL is not set
 # CONFIG_LOAD_POLICY is not set
 # CONFIG_MATCHPATHCON is not set
 # CONFIG_RUNCON is not set
-# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
 # CONFIG_SELINUXENABLED is not set
 # CONFIG_SESTATUS is not set
 # CONFIG_SETENFORCE is not set
@@ -1099,6 +1097,8 @@ CONFIG_ASH=y
 CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
 CONFIG_ASH_INTERNAL_GLOB=y
 CONFIG_ASH_BASH_COMPAT=y
+# CONFIG_ASH_BASH_SOURCE_CURDIR is not set
+CONFIG_ASH_BASH_NOT_FOUND_HOOK=y
 CONFIG_ASH_JOB_CONTROL=y
 CONFIG_ASH_ALIAS=y
 # CONFIG_ASH_RANDOM_SUPPORT is not set
@@ -1115,6 +1115,8 @@ CONFIG_ASH_CMDCMD=y
 # CONFIG_HUSH is not set
 # CONFIG_HUSH_BASH_COMPAT is not set
 # CONFIG_HUSH_BRACE_EXPANSION is not set
+# CONFIG_HUSH_LINENO_VAR is not set
+# CONFIG_HUSH_BASH_SOURCE_CURDIR is not set
 # CONFIG_HUSH_INTERACTIVE is not set
 # CONFIG_HUSH_SAVEHISTORY is not set
 # CONFIG_HUSH_JOB is not set
@@ -1132,17 +1134,20 @@ CONFIG_ASH_CMDCMD=y
 # CONFIG_HUSH_HELP is not set
 # CONFIG_HUSH_EXPORT is not set
 # CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_READONLY is not set
 # CONFIG_HUSH_KILL is not set
 # CONFIG_HUSH_WAIT is not set
+# CONFIG_HUSH_COMMAND is not set
 # CONFIG_HUSH_TRAP is not set
 # CONFIG_HUSH_TYPE is not set
+# CONFIG_HUSH_TIMES is not set
 # CONFIG_HUSH_READ is not set
 # CONFIG_HUSH_SET is not set
 # CONFIG_HUSH_UNSET is not set
 # CONFIG_HUSH_ULIMIT is not set
 # CONFIG_HUSH_UMASK is not set
+# CONFIG_HUSH_GETOPTS is not set
 # CONFIG_HUSH_MEMLEAK is not set
-# CONFIG_MSH is not set
 
 #
 # Options common to all shells
@@ -1152,7 +1157,9 @@ CONFIG_FEATURE_SH_MATH=y
 CONFIG_FEATURE_SH_EXTRA_QUIET=y
 # CONFIG_FEATURE_SH_STANDALONE is not set
 # CONFIG_FEATURE_SH_NOFORK is not set
+# CONFIG_FEATURE_SH_READ_FRAC is not set
 CONFIG_FEATURE_SH_HISTFILESIZE=y
+# CONFIG_FEATURE_SH_EMBEDDED_SCRIPTS is not set
 
 #
 # System Logging Utilities
diff --git a/meta/recipes-core/busybox/busybox_1.29.3.bb b/meta/recipes-core/busybox/busybox_1.30.1.bb
similarity index 89%
rename from meta/recipes-core/busybox/busybox_1.29.3.bb
rename to meta/recipes-core/busybox/busybox_1.30.1.bb
index a3e68cdc77..164f3ab3c3 100644
--- a/meta/recipes-core/busybox/busybox_1.29.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.30.1.bb
@@ -44,9 +44,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
-           file://0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "0a367e19cdfd157e8258d87f893ee516"
-SRC_URI[tarball.sha256sum] = "97648636e579462296478e0218e65e4bc1e9cd69089a3b1aeb810bff7621efb7"
+SRC_URI[tarball.md5sum] = "4f72fc6abd736d5f4741fc4a2485547a"
+SRC_URI[tarball.sha256sum] = "3d1d04a4dbd34048f4794815a5c48ebb9eb53c5277e09ffffc060323b95dfbdc"
-- 
2.11.0


