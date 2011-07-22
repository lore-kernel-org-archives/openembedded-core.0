Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QkJJY-0000R3-N9
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 19:15:05 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6MHAtMh020977
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 12:10:55 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 10:10:46 -0700
Message-Id: <08c84ed8298775e06575e3670b7748a99a2eaf33.1311354521.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311354521.git.tom_rini@mentor.com>
References: <cover.1311354521.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311354521.git.tom_rini@mentor.com>
References: <cover.1311354521.git.tom_rini@mentor.com>
Subject: [PATCH v2 2/8] siteinfo: Move certain bash entries to common-linux
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
 meta/site/arm-common          |   14 --------------
 meta/site/common-linux        |   16 ++++++++++++++++
 meta/site/ix86-common         |   14 --------------
 meta/site/mips-linux          |    3 ---
 meta/site/mips-linux-uclibc   |    3 ---
 meta/site/mipsel-linux        |   14 --------------
 meta/site/mipsel-linux-uclibc |   14 --------------
 meta/site/powerpc-linux       |    3 ---
 meta/site/powerpc32-linux     |   13 -------------
 meta/site/sh-common           |   14 --------------
 meta/site/sparc-linux         |    3 ---
 meta/site/x86_64-linux        |    1 -
 meta/site/x86_64-linux-uclibc |    1 -
 13 files changed, 16 insertions(+), 97 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 5d3e68a..39eb30b 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -14,21 +14,7 @@ apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # coreutils
 utils_cv_sys_open_max=${utils_cv_sys_open_max=1019}
diff --git a/meta/site/common-linux b/meta/site/common-linux
index c37c76a..74a822d 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -3,3 +3,19 @@ samba_cv_HAVE_IFACE_AIX=${samba_cv_HAVE_IFACE_AIX=no}
 samba_cv_HAVE_IFACE_IFCONF=${samba_cv_HAVE_IFACE_IFCONF=yes}
 samba_cv_HAVE_IFACE_IFREQ=${samba_cv_HAVE_IFACE_IFREQ=yes}
 samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=no}
+
+# bash
+bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
+bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
+bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
+bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
+bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
+bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
+bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
+bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
+bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
+bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
+bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
+bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
+bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
+bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 4a4442a..267d59f 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -58,21 +58,7 @@ ac_cv_file_lib_src_libmad_frame_h=${ac_cv_file_lib_src_libmad_frame_h=no}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # clamav
 clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index 074cb09..495df5f 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -118,9 +118,6 @@ mono_cv_uscore=${mono_cv_uscore=no}
 ac_cv_va_copy=${ac_cv_va_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
 
-# readline
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
-
 # eds-dbus
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
 
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index 074cb09..495df5f 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -118,9 +118,6 @@ mono_cv_uscore=${mono_cv_uscore=no}
 ac_cv_va_copy=${ac_cv_va_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
 
-# readline
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
-
 # eds-dbus
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
 
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index c20e5ee..0959883 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -8,21 +8,7 @@ ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # openssh
 ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
index 9545fea..25fa8b5 100644
--- a/meta/site/mipsel-linux-uclibc
+++ b/meta/site/mipsel-linux-uclibc
@@ -8,21 +8,7 @@ ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # openssh
 ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
index 9498b8a..399a58e 100644
--- a/meta/site/powerpc-linux
+++ b/meta/site/powerpc-linux
@@ -4,9 +4,6 @@ ac_cv_func_setgrent_void=yes
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 
-# bash
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
-
 # startup-notification
 lf_cv_sane_realloc=yes
 
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 5d92ecf..9d89f73 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -205,19 +205,6 @@ cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # openssh
 ac_cv_have_broken_dirname=${ac_cv_have_broken_dirname='yes'}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 9368444..196af11 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -222,21 +222,7 @@ cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # mono
 cv_mono_sizeof_sunpath=108
diff --git a/meta/site/sparc-linux b/meta/site/sparc-linux
index 491dc74..ea6386b 100644
--- a/meta/site/sparc-linux
+++ b/meta/site/sparc-linux
@@ -53,6 +53,3 @@ glib_cv_stack_grows=${glib_cv_stack_grows=no}
 
 #linux
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-#bash
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 9c9e0f8..ba6e57c 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -32,7 +32,6 @@ ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=8}
 ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
 ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long long'}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index d0d0f32..771e725 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -24,7 +24,6 @@ ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
 ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=8}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
 ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long long'}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-- 
1.7.0.4



