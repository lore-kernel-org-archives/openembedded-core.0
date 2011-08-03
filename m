Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojjj-0004U0-Aj
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912958"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:11:09 -0700
Message-Id: <9809d7cb8136a3ca18653337755d80a9de804297.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 25/33] sudo: Drop sudo_cv_uid_t_len from site files
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:23 -0000

From: Tom Rini <tom_rini@mentor.com>

We were just setting this to the assumed default.  If anything, this
belongs in the libc files if we must set it.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-common        |    3 ---
 meta/site/ix86-common       |    3 ---
 meta/site/mips-linux        |    3 ---
 meta/site/mips-linux-uclibc |    3 ---
 meta/site/mipsel-linux      |    5 +----
 meta/site/powerpc32-linux   |    3 ---
 meta/site/sh-common         |    3 ---
 meta/site/x86_64-linux      |    1 -
 8 files changed, 1 insertions(+), 23 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 04d1164..2129298 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -191,9 +191,6 @@ ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=yes}
 # startup-notification
 lf_cv_sane_realloc=yes
 
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
 # xffm
 jm_cv_func_working_readdir=yes
 
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 7a7e253..122eb14 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -211,9 +211,6 @@ ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=yes}
 # startup-notification
 lf_cv_sane_realloc=yes
 
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
 # xffm
 jm_cv_func_working_readdir=yes
 
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index 807e552..212c3ad 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -76,9 +76,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
 # vim
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
 
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
 # intercom
 ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
 
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index 807e552..212c3ad 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -76,9 +76,6 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
 # vim
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
 
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
 # intercom
 ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
 
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index c59d85f..a9032ac 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -77,10 +77,7 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
 # vim
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
 
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
-#intercom
+# intercom
 ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
 
 #lmbench
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 46b64eb..8a10111 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -280,9 +280,6 @@ ac_cv_sync_with_stdio_2=${ac_cv_sync_with_stdio_2=yes}
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
 
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
 # dpkg
 dpkg_cv_va_copy=${ac_cv_va_copy=yes}
 dpkg_cv___va_copy=${ac_cv___va_copy=yes}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 26a612a..63abe57 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -231,9 +231,6 @@ rsync_cv_HAVE_SECURE_MKSTEMP=${rsync_cv_HAVE_SECURE_MKSTEMP=yes}
 rsync_cv_REPLACE_INET_NTOA=${rsync_cv_REPLACE_INET_NTOA=no}
 rsync_cv_REPLACE_INET_ATON=${rsync_cv_REPLACE_INET_ATON=no}
 
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
 # ipsec-tools
 ac_cv_va_copy=${ac_cv_va_copy=no}
 ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 968dedc..91965b9 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -92,7 +92,6 @@ ac_cv_alignof_CORBA_short=2
 ac_cv_alignof_CORBA_struct=1
 ac_cv_alignof_CORBA_wchar=2
 
-sudo_cv_uid_t=${sudo_cv_uid_t_len=10}
 lf_cv_sane_realloc=yes
 as_cv_unaligned_access=${as_cv_unaligned_access=yes}
 
-- 
1.7.3.4



