Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuY-00028m-4f
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949383"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:19 -0700
Message-Id: <91e6ad022dd83b5bd4e4f268827a341eefd1a900.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 29/35] siteinfo: Move general realloc/malloc values to common-$libc
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:11 -0000

From: Tom Rini <tom_rini@mentor.com>

These are tests for glibc behavior which we have enabled in uclibc.
Note that if we ever disable MALLOC_GLIBC_COMPAT the uclibc tests
will need to be changed (but I believe this would also entail massive
patching to the rest of userspace so this should be unlikely).

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-common          |    4 ----
 meta/site/arm-linux           |    2 --
 meta/site/arm-linux-uclibc    |    2 --
 meta/site/armeb-linux         |    2 --
 meta/site/armeb-linux-uclibc  |    2 --
 meta/site/common-glibc        |    3 +++
 meta/site/common-uclibc       |    4 ++++
 meta/site/ix86-common         |    5 -----
 meta/site/mips-common         |    3 ---
 meta/site/mips-linux          |    3 ---
 meta/site/mips-linux-uclibc   |    3 ---
 meta/site/mipsel-linux        |    3 ---
 meta/site/mipsel-linux-uclibc |    3 ---
 meta/site/powerpc-linux       |    4 ----
 meta/site/powerpc32-linux     |    4 ----
 meta/site/sh-common           |    6 ------
 meta/site/sparc-linux         |    2 --
 meta/site/x86_64-linux        |    2 --
 meta/site/x86_64-linux-uclibc |    5 -----
 19 files changed, 7 insertions(+), 55 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 2524db4..c216b57 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -180,10 +180,6 @@ screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
 slrn_cv___va_copy=${slrn_cv___va_copy=yes}
 slrn_cv_va_copy=${slrn_cv_va_copy=yes}
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
-ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
 # socat
 ac_cv_ispeed_offset=${ac_cv_ispeed_offset=13}
diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index 1211ad4..8ac9041 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -1,8 +1,6 @@
 ac_cv_func_getpgrp_void=yes
 ac_cv_func_setpgrp_void=yes
 ac_cv_func_setgrent_void=yes
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_func_setvbuf_reversed=no
diff --git a/meta/site/arm-linux-uclibc b/meta/site/arm-linux-uclibc
index 017594d..70d0908 100644
--- a/meta/site/arm-linux-uclibc
+++ b/meta/site/arm-linux-uclibc
@@ -1,8 +1,6 @@
 ac_cv_func_getpgrp_void=yes
 ac_cv_func_setpgrp_void=yes
 ac_cv_func_setgrent_void=yes
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
 ac_cv_func_setvbuf_reversed=no
diff --git a/meta/site/armeb-linux b/meta/site/armeb-linux
index 45fa692..ecff3da 100644
--- a/meta/site/armeb-linux
+++ b/meta/site/armeb-linux
@@ -1,8 +1,6 @@
 ac_cv_func_getpgrp_void=yes
 ac_cv_func_setpgrp_void=yes
 ac_cv_func_setgrent_void=yes
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_func_setvbuf_reversed=no
diff --git a/meta/site/armeb-linux-uclibc b/meta/site/armeb-linux-uclibc
index 50874c4..8365810 100644
--- a/meta/site/armeb-linux-uclibc
+++ b/meta/site/armeb-linux-uclibc
@@ -1,8 +1,6 @@
 ac_cv_func_getpgrp_void=yes
 ac_cv_func_setpgrp_void=yes
 ac_cv_func_setgrent_void=yes
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_func_setvbuf_reversed=no
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index a34396f..9339655 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -1,5 +1,8 @@
 # general
 ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=yes}
+ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
+ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
+ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
 ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
 ac_cv_type_uid_t={ac_cv_type_uid_t=yes}
diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index ce216bb..8ea192c 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -1,5 +1,9 @@
 # general
 ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}
+ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
+ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
+ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
 # glib
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 47f7178..ea8937e 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -25,8 +25,6 @@ ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
 ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
 ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
@@ -167,9 +165,6 @@ ac_cv_alignof_CORBA_struct=4
 ac_cv_alignof_CORBA_wchar=2
 ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 
-# p3scan
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
-
 # php
 ac_cv_pread=${ac_cv_pread=no}
 ac_cv_pwrite=${ac_cv_pwrite=no}
diff --git a/meta/site/mips-common b/meta/site/mips-common
index bbfc779..e7eb3af 100644
--- a/meta/site/mips-common
+++ b/meta/site/mips-common
@@ -1,6 +1,3 @@
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index f81d4fa..a8e52ae 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -3,9 +3,6 @@ ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 
-# tslib, others
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index f81d4fa..a8e52ae 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -3,9 +3,6 @@ ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 
-# tslib, others
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index 2805be1..fc2a9c0 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -3,9 +3,6 @@ ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 
-# tslib, others
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
index 838bdff..c589cfd 100644
--- a/meta/site/mipsel-linux-uclibc
+++ b/meta/site/mipsel-linux-uclibc
@@ -3,9 +3,6 @@ ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 
-# tslib, others
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
index 399a58e..93a94f5 100644
--- a/meta/site/powerpc-linux
+++ b/meta/site/powerpc-linux
@@ -7,10 +7,6 @@ ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 # startup-notification
 lf_cv_sane_realloc=yes
 
-# flex
-ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
-
 # glib
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 6df66dc..46b64eb 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -1,5 +1,3 @@
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
@@ -165,8 +163,6 @@ compat_cv_func_dirname_works=${compat_cv_func_dirname_works=no}
 slrn_cv___va_copy=${slrn_cv___va_copy=yes}
 slrn_cv_va_copy=${slrn_cv_va_copy=no}
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
 # libidl
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 12ac3d8..ce7c41b 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -1,7 +1,5 @@
 ac_cv_func_setpgrp_void=yes
 ac_cv_func_setgrent_void=yes
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
@@ -178,10 +176,6 @@ compat_cv_func_dirname_works=${compat_cv_func_dirname_works=no}
 slrn_cv___va_copy=${slrn_cv___va_copy=yes}
 slrn_cv_va_copy=${slrn_cv_va_copy=no}
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
-ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
 # startup-notification
 lf_cv_sane_realloc=yes
diff --git a/meta/site/sparc-linux b/meta/site/sparc-linux
index f4c221c..a0ac8d1 100644
--- a/meta/site/sparc-linux
+++ b/meta/site/sparc-linux
@@ -1,8 +1,6 @@
 ac_cv_func_getpgrp_void=yes
 ac_cv_func_setpgrp_void=yes
 ac_cv_func_setgrent_void=yes
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 1b83ce9..48e94da 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -2,7 +2,6 @@ ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
@@ -100,7 +99,6 @@ ac_cv_alignof_CORBA_wchar=2
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 
 sudo_cv_uid_t=${sudo_cv_uid_t_len=10}
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
 lf_cv_sane_realloc=yes
 as_cv_unaligned_access=${as_cv_unaligned_access=yes}
 
diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index f646c31..be74642 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -2,7 +2,6 @@ ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
 ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
@@ -68,10 +67,6 @@ am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 
-# flex
-ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
-
 # libidl
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
 
-- 
1.7.3.4



