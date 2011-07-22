Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QkJJY-0000R5-PN
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 19:15:05 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6MHAtMj020977
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 12:10:55 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 10:10:48 -0700
Message-Id: <589b268a122019f3218eb3e708686dfa1fafcc62.1311354521.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311354521.git.tom_rini@mentor.com>
References: <cover.1311354521.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311354521.git.tom_rini@mentor.com>
References: <cover.1311354521.git.tom_rini@mentor.com>
Subject: [PATCH v2 4/8] siteinfo: Move certain mysql entries to common-linux
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
X-List-Received-Date: Fri, 22 Jul 2011 17:15:05 -0000

More re-sync with oe.dev

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-common         |    1 -
 meta/site/arm-linux          |    1 -
 meta/site/arm-linux-uclibc   |    1 -
 meta/site/armeb-linux        |    1 -
 meta/site/armeb-linux-uclibc |    1 -
 meta/site/common-linux       |    4 ++++
 meta/site/ix86-common        |    3 ---
 meta/site/powerpc32-linux    |    2 --
 meta/site/sh-common          |    2 --
 meta/site/sparc-linux        |    1 -
 10 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 39eb30b..2880cfc 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -138,7 +138,6 @@ cv_mono_sizeof_sunpath=108
 # mysql
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
-ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
 
 # nano
 ac_cv_regexec_segfault_emptystr=${ac_cv_regexec_segfault_emptystr=no}
diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index cb3bcbb..96a1dde 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -34,7 +34,6 @@ ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=4}
 ac_cv_sizeof_unsigned_long_long=${ac_cv_sizeof_unsigned_long_long=8}
 ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
 
-ac_cv_sys_restartable_syscalls=yes
 ac_cv_uchar=${ac_cv_uchar=no}
 ac_cv_uint=${ac_cv_uint=yes}
 ac_cv_ulong=${ac_cv_ulong=yes}
diff --git a/meta/site/arm-linux-uclibc b/meta/site/arm-linux-uclibc
index 55cd68e..017594d 100644
--- a/meta/site/arm-linux-uclibc
+++ b/meta/site/arm-linux-uclibc
@@ -18,7 +18,6 @@ ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
 ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
 
-ac_cv_sys_restartable_syscalls=yes
 ac_cv_uchar=${ac_cv_uchar=no}
 ac_cv_uint=${ac_cv_uint=yes}
 ac_cv_ulong=${ac_cv_ulong=yes}
diff --git a/meta/site/armeb-linux b/meta/site/armeb-linux
index d8da123..45fa692 100644
--- a/meta/site/armeb-linux
+++ b/meta/site/armeb-linux
@@ -21,7 +21,6 @@ ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
 ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
 ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
 
-ac_cv_sys_restartable_syscalls=yes
 ac_cv_uchar=${ac_cv_uchar=no}
 ac_cv_uint=${ac_cv_uint=yes}
 ac_cv_ulong=${ac_cv_ulong=yes}
diff --git a/meta/site/armeb-linux-uclibc b/meta/site/armeb-linux-uclibc
index 5e86009..50874c4 100644
--- a/meta/site/armeb-linux-uclibc
+++ b/meta/site/armeb-linux-uclibc
@@ -21,7 +21,6 @@ ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
 ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
 ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
 
-ac_cv_sys_restartable_syscalls=yes
 ac_cv_uchar=${ac_cv_uchar=no}
 ac_cv_uint=${ac_cv_uint=yes}
 ac_cv_ulong=${ac_cv_ulong=yes}
diff --git a/meta/site/common-linux b/meta/site/common-linux
index 74a822d..7cdfb63 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -19,3 +19,7 @@ bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
 bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
 bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
 bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
+
+# mysql
+ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
+ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 267d59f..cacf7ee 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -47,7 +47,6 @@ lf_cv_sane_realloc=yes
 jm_cv_func_gettimeofday_clobber=no
 samba_cv_HAVE_GETTIMEOFDAY_TZ=yes
 bf_lsbf=1
-ac_cv_sys_restartable_syscalls=yes
 ac_cv_uchar=${ac_cv_uchar=no}
 ac_cv_uint=${ac_cv_uint=yes}
 ac_cv_ulong=${ac_cv_ulong=yes}
@@ -126,7 +125,6 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 
 # guile
-ac_cv_sys_restartable_syscalls=yes
 ac_cv_uchar=${ac_cv_uchar=no}
 ac_cv_uint=${ac_cv_uint=yes}
 ac_cv_ulong=${ac_cv_ulong=yes}
@@ -165,7 +163,6 @@ cv_mono_sizeof_sunpath=108
 # mysql
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=yes}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=yes}
-ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
 
 # ORBit2
 ac_cv_alignof_CORBA_boolean=1
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 9d89f73..3a05053 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -28,7 +28,6 @@ ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
 ac_cv_sizeof_unsigned_short_int=${ac_cv_sizeof_unsigned_short_int=2}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
 ac_cv_sizeof_wchar_t=${ac_cv_sizeof_wchar_t=4}
-ac_cv_sys_restartable_syscalls=yes
 ac_cv_type___int64=${ac_cv_type___int64=no}
 ac_cv_type_size_t=${ac_cv_type_size_t=yes}
 ac_cv_type_void_p=${ac_cv_type_void_p=yes}
@@ -296,7 +295,6 @@ ac_cv_sync_with_stdio_2=${ac_cv_sync_with_stdio_2=yes}
 # mysql
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
-ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
 
 # sudo
 sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 196af11..7fe36cc 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -24,7 +24,6 @@ ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
 # lzo
 ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
 
-ac_cv_sys_restartable_syscalls=yes
 ac_cv_uchar=${ac_cv_uchar=no}
 ac_cv_uint=${ac_cv_uint=yes}
 ac_cv_ulong=${ac_cv_ulong=yes}
@@ -230,7 +229,6 @@ cv_mono_sizeof_sunpath=108
 # mysql
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
-ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
 
 # rp-pppoe
 rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
diff --git a/meta/site/sparc-linux b/meta/site/sparc-linux
index ea6386b..f4c221c 100644
--- a/meta/site/sparc-linux
+++ b/meta/site/sparc-linux
@@ -29,7 +29,6 @@ ac_cv_alignof_CORBA_long_double=4
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
 
 
-ac_cv_sys_restartable_syscalls=yes
 ac_cv_uchar=${ac_cv_uchar=no}
 ac_cv_uint=${ac_cv_uint=yes}
 ac_cv_ulong=${ac_cv_ulong=yes}
-- 
1.7.0.4



