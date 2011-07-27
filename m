Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuW-00028v-Py
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949354"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:13 -0700
Message-Id: <51bd0c95c9dc885918a6d7aa256ad01e33114388.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 23/35] siteinfo: Move certain samba entries to common-linux
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2011 07:52:09 -0000

From: Tom Rini <tom_rini@mentor.com>

Part of re-syncing with oe.dev, move samba_cv_HAVE_IFACE_* to common-linux

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-linux           |    4 ----
 meta/site/arm-linux-uclibc    |    4 ----
 meta/site/armeb-linux         |    2 --
 meta/site/armeb-linux-uclibc  |    2 --
 meta/site/common-linux        |    5 +++++
 meta/site/mipsel-linux-uclibc |    3 ---
 meta/site/powerpc32-linux     |    3 ---
 meta/site/sh-common           |    2 --
 8 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index 033366a..cb3bcbb 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -60,13 +60,10 @@ samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
 samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
 samba_cv_HAVE_FUNCTION_MACRO=${samba_cv_HAVE_FUNCTION_MACRO=yes}
 samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_IFACE_AIX=${samba_cv_HAVE_IFACE_AIX=no}
-samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
 samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
 samba_cv_HAVE_INT16_FROM_RPC_RPC_H=${samba_cv_HAVE_INT16_FROM_RPC_RPC_H=no}
 samba_cv_HAVE_INT32_FROM_RPC_RPC_H=${samba_cv_HAVE_INT32_FROM_RPC_RPC_H=no}
 samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_IRIX=${samba_cv_HAVE_KERNEL_OPLOCKS_IRIX=no}
 samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
 samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
 samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
@@ -145,7 +142,6 @@ samba_cv_unixsocket=${samba_cv_unixsocket=yes}
 samba_cv_volatile=${samba_cv_volatile=yes}
 
 #older sambe defines
-samba_cv_HAVE_IFACE_IFREQ=${samba_cv_HAVE_IFACE_IFREQ=yes}
 samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
 samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
 samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
diff --git a/meta/site/arm-linux-uclibc b/meta/site/arm-linux-uclibc
index 2933c3f..55cd68e 100644
--- a/meta/site/arm-linux-uclibc
+++ b/meta/site/arm-linux-uclibc
@@ -44,14 +44,10 @@ samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
 samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
 samba_cv_HAVE_FUNCTION_MACRO=${samba_cv_HAVE_FUNCTION_MACRO=yes}
 samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_IFACE_AIX=${samba_cv_HAVE_IFACE_AIX=no}
-samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
 samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
 samba_cv_HAVE_INT16_FROM_RPC_RPC_H=${samba_cv_HAVE_INT16_FROM_RPC_RPC_H=no}
 samba_cv_HAVE_INT32_FROM_RPC_RPC_H=${samba_cv_HAVE_INT32_FROM_RPC_RPC_H=no}
-samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=no}
 samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_IRIX=${samba_cv_HAVE_KERNEL_OPLOCKS_IRIX=no}
 samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
 samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
 samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
diff --git a/meta/site/armeb-linux b/meta/site/armeb-linux
index c852f00..d8da123 100644
--- a/meta/site/armeb-linux
+++ b/meta/site/armeb-linux
@@ -31,8 +31,6 @@ ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
 
 # samba
 samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
-samba_cv_HAVE_IFACE_IFREQ=${samba_cv_HAVE_IFACE_IFREQ=yes}
 samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
 samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
 samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
diff --git a/meta/site/armeb-linux-uclibc b/meta/site/armeb-linux-uclibc
index 02c63e4..5e86009 100644
--- a/meta/site/armeb-linux-uclibc
+++ b/meta/site/armeb-linux-uclibc
@@ -31,8 +31,6 @@ ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
 
 # samba
 samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
-samba_cv_HAVE_IFACE_IFREQ=${samba_cv_HAVE_IFACE_IFREQ=yes}
 samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
 samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
 samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
diff --git a/meta/site/common-linux b/meta/site/common-linux
index e69de29..c37c76a 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -0,0 +1,5 @@
+# samba
+samba_cv_HAVE_IFACE_AIX=${samba_cv_HAVE_IFACE_AIX=no}
+samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
+samba_cv_HAVE_IFACE_IFREQ=${samba_cv_HAVE_IFACE_IFREQ=yes}
+samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=no}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
index f36a30a..9545fea 100644
--- a/meta/site/mipsel-linux-uclibc
+++ b/meta/site/mipsel-linux-uclibc
@@ -93,10 +93,7 @@ samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPP
 samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
 samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
 samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_IFACE_AIX=${samba_cv_HAVE_IFACE_AIX=no}
-samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
 samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
-samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=no}
 samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
 samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
 samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 33ad786..5d92ecf 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -272,9 +272,6 @@ samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
 samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
 samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
 samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_IFACE_AIX=${samba_cv_HAVE_IFACE_AIX=no}
-samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
-samba_cv_HAVE_IFACE_IFREQ=${samba_cv_HAVE_IFACE_IFREQ=yes}
 samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
 samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
 samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index e8228fd..9368444 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -84,8 +84,6 @@ ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_struct=yes}
 
 # samba
 samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
-samba_cv_HAVE_IFACE_IFREQ=${samba_cv_HAVE_IFACE_IFREQ=yes}
 samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
 samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
 samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
-- 
1.7.3.4



