Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0C72476420
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 23:21:26 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so3830484ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7kY4ZVyjIVkdNAkL7VBuNqSHymGJW788QTzEbcrW6Sc=;
	b=E56IXX6h1gUgQO3RQCjLG2JEiuXz75WGP0M53jEoN/yvelDfXJsuWcaezfnLb//7o5
	2FlOaEQWfLK7l6ECIReDsyxVeGKxcsssJgI9T/y7wOF6ngxTlcelcmy/oH0dQl6yZR/T
	3goaVDIFOzq5PS5r01XTdt65UDU7YZeYhQiH61BBgG1sfQCSh6X+rogG8h5xMnm0n7Wc
	XS5NuRE5ebgfgB7D7TuuKERezyMXiR7E3aJHv1eaHuYVHgKXALWOH2myPCQa4Z6gAlfy
	SslnZs2yA6FdQhQyC4LmpnFB+VcIrsNSieettngQ+TtwoWs+xt39yt4A04HYjt/ydrcH
	fJVg==
X-Received: by 10.107.138.152 with SMTP id c24mr56171302ioj.74.1438125686689; 
	Tue, 28 Jul 2015 16:21:26 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id i7sm9668533igt.18.2015.07.28.16.21.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Jul 2015 16:21:26 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:20:59 -0700
Message-Id: <1438125665-14966-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/8] busybox: re-order defconfig to align with busybox 1.23.2
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
X-List-Received-Date: Tue, 28 Jul 2015 23:21:28 -0000

No functional changes, simply re-order lines in defconfig so that
the existing options don't move elsewhere in the file when run
though busybox 1.23.2 'make oldconfig'.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 84 ++++++++++++++---------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 2a1706b..6535755 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -36,6 +36,7 @@ CONFIG_LAST_SUPPORTED_WCHAR=0
 # CONFIG_UNICODE_BIDI_SUPPORT is not set
 # CONFIG_UNICODE_NEUTRAL_TABLE is not set
 # CONFIG_UNICODE_PRESERVE_BROKEN is not set
+# CONFIG_PAM is not set
 CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_DEVPTS=y
 # CONFIG_FEATURE_CLEAN_UP is not set
@@ -133,7 +134,14 @@ CONFIG_FEATURE_SEAMLESS_Z=y
 CONFIG_AR=y
 # CONFIG_FEATURE_AR_LONG_FILENAMES is not set
 # CONFIG_FEATURE_AR_CREATE is not set
+# CONFIG_UNCOMPRESS is not set
+CONFIG_GUNZIP=y
 CONFIG_BUNZIP2=y
+# CONFIG_UNLZMA is not set
+# CONFIG_FEATURE_LZMA_FAST is not set
+# CONFIG_LZMA is not set
+# CONFIG_UNXZ is not set
+# CONFIG_XZ is not set
 # CONFIG_BZIP2 is not set
 CONFIG_CPIO=y
 # CONFIG_FEATURE_CPIO_O is not set
@@ -141,14 +149,13 @@ CONFIG_CPIO=y
 # CONFIG_DPKG is not set
 # CONFIG_DPKG_DEB is not set
 # CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
-CONFIG_GUNZIP=y
 CONFIG_GZIP=y
 # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
 CONFIG_GZIP_FAST=0
 # CONFIG_LZOP is not set
 # CONFIG_LZOP_COMPR_HIGH is not set
-# CONFIG_RPM2CPIO is not set
 # CONFIG_RPM is not set
+# CONFIG_RPM2CPIO is not set
 CONFIG_TAR=y
 CONFIG_FEATURE_TAR_CREATE=y
 CONFIG_FEATURE_TAR_AUTODETECT=y
@@ -161,12 +168,6 @@ CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
 # CONFIG_FEATURE_TAR_UNAME_GNAME is not set
 CONFIG_FEATURE_TAR_NOPRESERVE_TIME=y
 # CONFIG_FEATURE_TAR_SELINUX is not set
-# CONFIG_UNCOMPRESS is not set
-# CONFIG_UNLZMA is not set
-# CONFIG_FEATURE_LZMA_FAST is not set
-# CONFIG_LZMA is not set
-# CONFIG_UNXZ is not set
-# CONFIG_XZ is not set
 CONFIG_UNZIP=y
 
 #
@@ -360,7 +361,15 @@ CONFIG_WHICH=y
 #
 # Editors
 #
+CONFIG_AWK=y
+CONFIG_FEATURE_AWK_LIBM=y
+CONFIG_CMP=y
+CONFIG_DIFF=y
+# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
+CONFIG_FEATURE_DIFF_DIR=y
+# CONFIG_ED is not set
 CONFIG_PATCH=y
+CONFIG_SED=y
 CONFIG_VI=y
 CONFIG_FEATURE_VI_MAX_LEN=1024
 CONFIG_FEATURE_VI_8BIT=y
@@ -376,14 +385,6 @@ CONFIG_FEATURE_VI_USE_SIGNALS=y
 CONFIG_FEATURE_VI_WIN_RESIZE=y
 # CONFIG_FEATURE_VI_ASK_TERMINAL is not set
 CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
-CONFIG_AWK=y
-CONFIG_FEATURE_AWK_LIBM=y
-CONFIG_CMP=y
-CONFIG_DIFF=y
-# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
-CONFIG_FEATURE_DIFF_DIR=y
-# CONFIG_ED is not set
-CONFIG_SED=y
 CONFIG_FEATURE_ALLOW_EXEC=y
 
 #
@@ -468,7 +469,6 @@ CONFIG_DELGROUP=y
 CONFIG_GETTY=y
 CONFIG_LOGIN=y
 # CONFIG_LOGIN_SESSION_AS_CHILD is not set
-# CONFIG_PAM is not set
 # CONFIG_LOGIN_SCRIPTS is not set
 # CONFIG_FEATURE_NOLOGIN is not set
 # CONFIG_FEATURE_SECURETTY is not set
@@ -608,28 +608,32 @@ CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
 CONFIG_VOLUMEID=y
-CONFIG_FEATURE_VOLUMEID_EXT=y
 # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
-# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
+# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
+CONFIG_FEATURE_VOLUMEID_EXT=y
 CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_HFS is not set
-# CONFIG_FEATURE_VOLUMEID_JFS is not set
-# CONFIG_FEATURE_VOLUMEID_XFS is not set
-# CONFIG_FEATURE_VOLUMEID_NTFS is not set
 # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
-# CONFIG_FEATURE_VOLUMEID_UDF is not set
-# CONFIG_FEATURE_VOLUMEID_LUKS is not set
+# CONFIG_FEATURE_VOLUMEID_JFS is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
-# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
+# CONFIG_FEATURE_VOLUMEID_LUKS is not set
+# CONFIG_FEATURE_VOLUMEID_NTFS is not set
+# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
+# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
 # CONFIG_FEATURE_VOLUMEID_ROMFS is not set
 # CONFIG_FEATURE_VOLUMEID_SYSV is not set
-# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
+# CONFIG_FEATURE_VOLUMEID_UDF is not set
+# CONFIG_FEATURE_VOLUMEID_XFS is not set
 
 #
 # Miscellaneous Utilities
 #
 # CONFIG_CONSPY is not set
+# CONFIG_CROND is not set
+# CONFIG_FEATURE_CROND_D is not set
+# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+CONFIG_FEATURE_CROND_DIR=""
 CONFIG_LESS=y
 CONFIG_FEATURE_LESS_MAXLINES=9999999
 CONFIG_FEATURE_LESS_BRACKETS=y
@@ -642,13 +646,17 @@ CONFIG_FEATURE_LESS_FLAGS=y
 # CONFIG_FEATURE_LESS_LINENUMS is not set
 # CONFIG_NANDWRITE is not set
 # CONFIG_NANDDUMP is not set
+CONFIG_RFKILL=y
 # CONFIG_SETSERIAL is not set
+# CONFIG_TASKSET is not set
+# CONFIG_FEATURE_TASKSET_FANCY is not set
 # CONFIG_UBIATTACH is not set
 # CONFIG_UBIDETACH is not set
 # CONFIG_UBIMKVOL is not set
 # CONFIG_UBIRMVOL is not set
 # CONFIG_UBIRSVOL is not set
 # CONFIG_UBIUPDATEVOL is not set
+# CONFIG_WALL is not set
 # CONFIG_ADJTIMEX is not set
 # CONFIG_BBCONFIG is not set
 # CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
@@ -664,10 +672,6 @@ CONFIG_FEATURE_BEEP_LENGTH_MS=0
 # CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
 # CONFIG_FEATURE_CHAT_CLR_ABORT is not set
 # CONFIG_CHRT is not set
-# CONFIG_CROND is not set
-# CONFIG_FEATURE_CROND_D is not set
-# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
-CONFIG_FEATURE_CROND_DIR=""
 # CONFIG_CRONTAB is not set
 CONFIG_DC=y
 # CONFIG_FEATURE_DC_LIBM is not set
@@ -705,18 +709,14 @@ CONFIG_MICROCOM=y
 # CONFIG_MT is not set
 # CONFIG_RAIDAUTORUN is not set
 # CONFIG_READAHEAD is not set
-CONFIG_RFKILL=y
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
 # CONFIG_SETSID is not set
 CONFIG_STRINGS=y
-# CONFIG_TASKSET is not set
-# CONFIG_FEATURE_TASKSET_FANCY is not set
 CONFIG_TIME=y
 # CONFIG_TIMEOUT is not set
 # CONFIG_TTYSIZE is not set
 # CONFIG_VOLNAME is not set
-# CONFIG_WALL is not set
 # CONFIG_WATCHDOG is not set
 
 #
@@ -894,6 +894,13 @@ CONFIG_FEATURE_MIME_CHARSET=""
 # CONFIG_PSTREE is not set
 # CONFIG_PWDX is not set
 # CONFIG_SMEMCAP is not set
+CONFIG_TOP=y
+CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
+CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
+# CONFIG_FEATURE_TOP_SMP_CPU is not set
+# CONFIG_FEATURE_TOP_DECIMALS is not set
+# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
+# CONFIG_FEATURE_TOPMEM is not set
 CONFIG_UPTIME=y
 # CONFIG_FEATURE_UPTIME_UTMP_SUPPORT is not set
 CONFIG_FREE=y
@@ -914,13 +921,6 @@ CONFIG_FEATURE_PS_LONG=y
 # CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
 CONFIG_RENICE=y
 CONFIG_BB_SYSCTL=y
-CONFIG_TOP=y
-CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
-CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
-# CONFIG_FEATURE_TOP_SMP_CPU is not set
-# CONFIG_FEATURE_TOP_DECIMALS is not set
-# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
-# CONFIG_FEATURE_TOPMEM is not set
 # CONFIG_FEATURE_SHOW_THREADS is not set
 CONFIG_WATCH=y
 
-- 
1.9.1


