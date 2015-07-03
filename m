Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8DDE075D07
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 01:46:08 +0000 (UTC)
Received: by igcsj18 with SMTP id sj18so176716217igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 18:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fiuh7MraPSKHjrpw1ZdGWd/gkBsNin5p45oGCQkdfLo=;
	b=FAjnO4f2smf5JDHlA+Ge4i37Tk80xsJbEwG9Fqsc+hDiWtCxvhNhrzcn0V8K8rvaAT
	ZUEepZTiVbfSThp+3bH0dD7wfMcKTqZDmlUVNaojgClYm1c5Hw5jk6VRD8NOtfZDfWTq
	ue06y8HqXfJZSZEm0x5cz5VahpMn1/+WrxRvtY7gAj1novU8tP7CUJSzE1ys3ASE/yfQ
	g2AFqE8RHMYyGYbX6GtaqaMfZb+QTAgrsiVaUQJK9FTsSjbxqY1p7i5cZr7eQmV4sR8c
	IWb8oN6aJi81sMqh3LY4T9alWnu5DgODBFv06SAsIJt8mW9Kgjh34yxuuNRqNROtrHRG
	2yJg==
X-Received: by 10.50.138.136 with SMTP id qq8mr48125347igb.27.1435887968559;
	Thu, 02 Jul 2015 18:46:08 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id x4sm5233578iod.26.2015.07.02.18.46.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Jul 2015 18:46:08 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jul 2015 18:45:42 -0700
Message-Id: <1435887942-20254-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435887942-20254-1-git-send-email-armccurdy@gmail.com>
References: <1435887942-20254-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] busybox: refresh defconfig for busybox v1.23.2
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
X-List-Received-Date: Fri, 03 Jul 2015 01:46:08 -0000

The oe-core busybox defconfig file is based on busybox v1.20.2,
therefore any new configure options introduced in busybox v1.21.x,
v1.22.x and v1.23.x take on default values when the oe-core defconfig
is run through busybox v1.23.2 'make oldconfig'.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 47 ++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 4b8a51b..94c4497 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.20.2
-# Mon Aug 20 17:01:45 2012
+# Busybox version: 1.23.2
+# Thu Jul  2 14:00:00 2015
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -37,12 +37,14 @@ CONFIG_LAST_SUPPORTED_WCHAR=0
 # CONFIG_UNICODE_NEUTRAL_TABLE is not set
 # CONFIG_UNICODE_PRESERVE_BROKEN is not set
 # CONFIG_PAM is not set
+CONFIG_FEATURE_USE_SENDFILE=y
 CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_DEVPTS=y
 # CONFIG_FEATURE_CLEAN_UP is not set
 CONFIG_FEATURE_UTMP=y
 # CONFIG_FEATURE_WTMP is not set
 CONFIG_FEATURE_PIDFILE=y
+CONFIG_PID_FILE_PATH="/var/run"
 CONFIG_FEATURE_SUID=y
 CONFIG_FEATURE_SUID_CONFIG=y
 CONFIG_FEATURE_SUID_CONFIG_QUIET=y
@@ -73,6 +75,7 @@ CONFIG_EXTRA_LDLIBS=""
 #
 # CONFIG_DEBUG is not set
 # CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_UNIT_TEST is not set
 # CONFIG_WERROR is not set
 CONFIG_NO_DEBUG_LIB=y
 # CONFIG_DMALLOC is not set
@@ -97,6 +100,7 @@ CONFIG_FEATURE_SYSTEMD=y
 CONFIG_FEATURE_RTMINMAX=y
 CONFIG_PASSWORD_MINLEN=6
 CONFIG_MD5_SMALL=1
+CONFIG_SHA3_SMALL=1
 CONFIG_FEATURE_FAST_TOP=y
 # CONFIG_FEATURE_ETC_NETWORKS is not set
 CONFIG_FEATURE_USE_TERMIOS=y
@@ -182,13 +186,16 @@ CONFIG_FEATURE_DATE_COMPAT=y
 # CONFIG_HOSTID is not set
 CONFIG_ID=y
 CONFIG_GROUPS=y
+CONFIG_SHUF=y
 CONFIG_TEST=y
 CONFIG_FEATURE_TEST_64=y
 CONFIG_TOUCH=y
+CONFIG_FEATURE_TOUCH_NODEREF=y
 CONFIG_FEATURE_TOUCH_SUSV3=y
 CONFIG_TR=y
 CONFIG_FEATURE_TR_CLASSES=y
 # CONFIG_FEATURE_TR_EQUIV is not set
+CONFIG_UNLINK=y
 # CONFIG_BASE64 is not set
 CONFIG_WHO=y
 CONFIG_USERS=y
@@ -264,6 +271,7 @@ CONFIG_SEQ=y
 # CONFIG_SHA1SUM is not set
 # CONFIG_SHA256SUM is not set
 # CONFIG_SHA512SUM is not set
+CONFIG_SHA3SUM=y
 CONFIG_SLEEP=y
 CONFIG_FEATURE_FANCY_SLEEP=y
 # CONFIG_FEATURE_FLOAT_SLEEP is not set
@@ -296,6 +304,11 @@ CONFIG_WHOAMI=y
 CONFIG_YES=y
 
 #
+# Common options
+#
+CONFIG_FEATURE_VERBOSE=y
+
+#
 # Common options for cp and mv
 #
 # CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
@@ -311,7 +324,7 @@ CONFIG_FEATURE_AUTOWIDTH=y
 CONFIG_FEATURE_HUMAN_READABLE=y
 
 #
-# Common options for md5sum, sha1sum, sha256sum, sha512sum
+# Common options for md5sum, sha1sum, sha256sum, sha512sum, sha3sum
 #
 CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
 
@@ -363,6 +376,7 @@ CONFIG_WHICH=y
 #
 CONFIG_AWK=y
 CONFIG_FEATURE_AWK_LIBM=y
+CONFIG_FEATURE_AWK_GNU_EXTENSIONS=y
 CONFIG_CMP=y
 CONFIG_DIFF=y
 # CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
@@ -384,6 +398,9 @@ CONFIG_FEATURE_VI_USE_SIGNALS=y
 # CONFIG_FEATURE_VI_SET is not set
 CONFIG_FEATURE_VI_WIN_RESIZE=y
 # CONFIG_FEATURE_VI_ASK_TERMINAL is not set
+CONFIG_FEATURE_VI_UNDO=y
+CONFIG_FEATURE_VI_UNDO_QUEUE=y
+CONFIG_FEATURE_VI_UNDO_QUEUE_MAX=256
 CONFIG_FEATURE_ALLOW_EXEC=y
 
 #
@@ -400,6 +417,7 @@ CONFIG_FEATURE_FIND_MAXDEPTH=y
 CONFIG_FEATURE_FIND_NEWER=y
 # CONFIG_FEATURE_FIND_INUM is not set
 CONFIG_FEATURE_FIND_EXEC=y
+CONFIG_FEATURE_FIND_EXEC_PLUS=y
 CONFIG_FEATURE_FIND_USER=y
 CONFIG_FEATURE_FIND_GROUP=y
 CONFIG_FEATURE_FIND_NOT=y
@@ -421,6 +439,7 @@ CONFIG_XARGS=y
 # CONFIG_FEATURE_XARGS_SUPPORT_QUOTES is not set
 # CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT is not set
 # CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM is not set
+CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
 
 #
 # Init Utilities
@@ -457,6 +476,7 @@ CONFIG_USE_BB_CRYPT=y
 CONFIG_ADDUSER=y
 CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
 # CONFIG_FEATURE_CHECK_NAMES is not set
+CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
 CONFIG_LAST_SYSTEM_ID=999
 CONFIG_ADDGROUP=y
@@ -525,6 +545,8 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # Linux System Utilities
 #
 # CONFIG_BLOCKDEV is not set
+CONFIG_FATATTR=y
+CONFIG_FSTRIM=y
 # CONFIG_MDEV is not set
 # CONFIG_FEATURE_MDEV_CONF is not set
 # CONFIG_FEATURE_MDEV_RENAME is not set
@@ -595,6 +617,7 @@ CONFIG_RDATE=y
 # CONFIG_SCRIPTREPLAY is not set
 # CONFIG_SETARCH is not set
 CONFIG_SWAPONOFF=y
+CONFIG_FEATURE_SWAPON_DISCARD=y
 CONFIG_FEATURE_SWAPON_PRI=y
 CONFIG_SWITCH_ROOT=y
 CONFIG_UMOUNT=y
@@ -607,9 +630,15 @@ CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
 CONFIG_VOLUMEID=y
+
+#
+# Filesystem/Volume identification
+#
 # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
+CONFIG_FEATURE_VOLUMEID_EXFAT=y
 CONFIG_FEATURE_VOLUMEID_EXT=y
+CONFIG_FEATURE_VOLUMEID_F2FS=y
 CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_HFS is not set
 # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
@@ -617,10 +646,12 @@ CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
 # CONFIG_FEATURE_VOLUMEID_LUKS is not set
+CONFIG_FEATURE_VOLUMEID_NILFS=y
 # CONFIG_FEATURE_VOLUMEID_NTFS is not set
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
 # CONFIG_FEATURE_VOLUMEID_REISERFS is not set
 # CONFIG_FEATURE_VOLUMEID_ROMFS is not set
+# CONFIG_FEATURE_VOLUMEID_SQUASHFS is not set
 # CONFIG_FEATURE_VOLUMEID_SYSV is not set
 # CONFIG_FEATURE_VOLUMEID_UDF is not set
 # CONFIG_FEATURE_VOLUMEID_XFS is not set
@@ -747,13 +778,13 @@ CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_FTPD is not set
 # CONFIG_FEATURE_FTP_WRITE is not set
 # CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST is not set
+# CONFIG_FEATURE_FTP_AUTHENTICATION is not set
 # CONFIG_FTPGET is not set
 # CONFIG_FTPPUT is not set
 # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
 CONFIG_HOSTNAME=y
 # CONFIG_HTTPD is not set
 # CONFIG_FEATURE_HTTPD_RANGES is not set
-# CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
 # CONFIG_FEATURE_HTTPD_SETUID is not set
 # CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
 # CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
@@ -810,6 +841,7 @@ CONFIG_NETSTAT=y
 CONFIG_NSLOOKUP=y
 # CONFIG_NTPD is not set
 # CONFIG_FEATURE_NTPD_SERVER is not set
+# CONFIG_FEATURE_NTPD_CONF is not set
 # CONFIG_PSCAN is not set
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
@@ -847,6 +879,7 @@ CONFIG_DUMPLEASES=y
 CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
 CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
+CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
@@ -965,6 +998,7 @@ CONFIG_ASH_GETOPTS=y
 CONFIG_ASH_BUILTIN_ECHO=y
 CONFIG_ASH_BUILTIN_PRINTF=y
 CONFIG_ASH_BUILTIN_TEST=y
+CONFIG_ASH_HELP=y
 # CONFIG_ASH_CMDCMD is not set
 # CONFIG_ASH_MAIL is not set
 CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
@@ -1014,6 +1048,11 @@ CONFIG_FEATURE_IPC_SYSLOG=y
 CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=64
 CONFIG_LOGREAD=y
 CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
+CONFIG_FEATURE_KMSG_SYSLOG=y
 CONFIG_KLOGD=y
+
+#
+# klogd should not be used together with syslog to kernel printk buffer
+#
 CONFIG_FEATURE_KLOGD_KLOGCTL=y
 CONFIG_LOGGER=y
-- 
1.9.1


