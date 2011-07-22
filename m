Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19fKkqW09aioXBBwl+Z4ijcAYWSklEdA40=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkBuy-0003p4-3e
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 11:21:12 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6M9H4tf032121
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 04:17:04 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 04:17:03 -0500
Message-Id: <1311326223-10708-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] site/powerpc*-linux: refactor needed options that are common
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
X-List-Received-Date: Fri, 22 Jul 2011 09:21:12 -0000

Pulled common options that are needed for powerpc64-linux to build
out of powerpc32-linux and put them into powerpc-linux.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/site/powerpc-linux   |   24 ++++++++++++++++++++++++
 meta/site/powerpc32-linux |   19 -------------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
index e69de29..9498b8a 100644
--- a/meta/site/powerpc-linux
+++ b/meta/site/powerpc-linux
@@ -0,0 +1,24 @@
+ac_cv_func_getpgrp_void=yes
+ac_cv_func_setpgrp_void=yes
+ac_cv_func_setgrent_void=yes
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
+# bash
+bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
+
+# startup-notification
+lf_cv_sane_realloc=yes
+
+# flex
+ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
+ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
+
+# glib
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
+
+# popt/rpm
+ac_cv_va_copy=${ac_cv_va_copy=yes}
+ac_cv___va_copy=${ac_cv___va_copy=yes}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index bd45ea6..33ad786 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -1,10 +1,5 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
 ac_cv_func_malloc_0_nonnull=yes
 ac_cv_func_malloc_works=yes
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_setvbuf_reversed=no
 ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
@@ -128,20 +123,16 @@ am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 # glib
 glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
 glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 glib_cv_has__inline=${glib_cv_has__inline=yes}
 glib_cv_has__inline__=${glib_cv_has__inline__=yes}
 glib_cv_hasinline=${glib_cv_hasinline=yes}
 glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
 glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_uscore=${glib_cv_uscore=no}
 glib_cv_va_copy=${glib_cv_va_copy=no}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
 glib_cv___va_copy=${glib_cv___va_copy=yes}
 glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
 glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
 glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
@@ -187,14 +178,9 @@ compat_cv_func_dirname_works=${compat_cv_func_dirname_works=no}
 slrn_cv___va_copy=${slrn_cv___va_copy=yes}
 slrn_cv_va_copy=${slrn_cv_va_copy=no}
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
 ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
 ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
-# startup-notification
-lf_cv_sane_realloc=yes
-
 # libidl
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
 
@@ -218,7 +204,6 @@ cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
 bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
 bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
@@ -341,7 +326,3 @@ libc_cv_ppc_machine=${libc_cv_ppc_machine=yes}
 libc_cv_mlong_double_128ibm=${libc_cv_mlong_double_128ibm=yes}
 libc_cv_mabi_ibmlongdouble=${libc_cv_mabi_ibmlongdouble=yes}
 libc_cv_mlong_double_128=${libc_cv_mlong_double_128=yes}
-
-# popt
-ac_cv_va_copy=${ac_cv_va_copy=yes}
-ac_cv___va_copy=${ac_cv___va_copy=yes}
-- 
1.7.3.4



