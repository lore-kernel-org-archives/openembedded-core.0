Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZr-0005eM-7g
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:35 +0200
Received: by pbbrq2 with SMTP id rq2so5531122pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=N2X7/cslWF97qia9D/Qsheb8SlLvMWpAn86j/ZPbyBw=;
	b=hyi2pTw1MZxDi1Pdp9oQ6ajp50/4YEU+28KaLc3PBD0K21tnOC18lPC+g7FSYn3jhg
	y3D0quxeo6uAcrqj/J0W96o1rbEq2GKzbYN7Rhrycdqihiw5yrSGGz5m1Bm2mH3QJ3Xk
	0HwNdS2uHQHv99chjlK0MDw9UVVkXRk/He68xnz9dVyw98GmLvcSIH3WqQNcJToJOnHO
	OABgh8AibaeMCdrygTNqZYsX7YpJn9uvqzpWrEwWou66LxhZGFoU7LcEnpw741/7boLR
	wgXg5n9jJIEFI1Qaqa2nIanTZZBXX8sZOgmx0Ir+nvjwkdyvVz0fkowVHcz6QLppFYnH
	aBrQ==
Received: by 10.68.132.201 with SMTP id ow9mr63491810pbb.160.1337571387549;
	Sun, 20 May 2012 20:36:27 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:37 -0700
Message-Id: <2e315d2d0de215811e8caa80b1f13fd0e9fa53e8.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 02/14] site: Add mips64 eglibc and uclibc site files
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
X-List-Received-Date: Mon, 21 May 2012 03:46:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/mips64-linux          |   82 +++++++++++++++++++++++++++++
 meta/site/mips64-linux-uclibc   |   83 ++++++++++++++++++++++++++++++
 meta/site/mips64el-linux        |   82 +++++++++++++++++++++++++++++
 meta/site/mips64el-linux-uclibc |  108 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 355 insertions(+), 0 deletions(-)
 create mode 100644 meta/site/mips64-linux
 create mode 100644 meta/site/mips64-linux-uclibc
 create mode 100644 meta/site/mips64el-linux
 create mode 100644 meta/site/mips64el-linux-uclibc

diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
new file mode 100644
index 0000000..4449c96
--- /dev/null
+++ b/meta/site/mips64-linux
@@ -0,0 +1,82 @@
+# general
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+
+# db
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+
+# rrdtool
+rd_cv_ieee_works=${rd_cv_ieee_works=yes}
+# ac_cv_path_PERL=${ac_cv_path_PERL=no}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+
+# vim
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+
+# intercom
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
+
+# lmbench
+ac_cv_uint=${ac_cv_unit=yes}
+
+# D-BUS
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
+# eds-dbus
+ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
+
diff --git a/meta/site/mips64-linux-uclibc b/meta/site/mips64-linux-uclibc
new file mode 100644
index 0000000..cbba552
--- /dev/null
+++ b/meta/site/mips64-linux-uclibc
@@ -0,0 +1,83 @@
+# general
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# db
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+
+# rrdtool
+rd_cv_ieee_works=${rd_cv_ieee_works=yes}
+# ac_cv_path_PERL=${ac_cv_path_PERL=no}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+
+# vim
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+
+# intercom
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
+
+# lmbench
+ac_cv_uint=${ac_cv_unit=yes}
+
+# D-BUS
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
+# eds-dbus
+ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
+
diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
new file mode 100644
index 0000000..8b61eb0
--- /dev/null
+++ b/meta/site/mips64el-linux
@@ -0,0 +1,82 @@
+# general
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# db
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+
+# rrdtool
+rd_cv_ieee_works=${rd_cv_ieee_works=yes}
+# ac_cv_path_PERL=${ac_cv_path_PERL=no}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+
+# vim
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+
+# intercom
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
+
+#lmbench
+ac_cv_uint=${ac_cv_unit=yes}
+
+# D-BUS
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
+# eds-dbus
+ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
diff --git a/meta/site/mips64el-linux-uclibc b/meta/site/mips64el-linux-uclibc
new file mode 100644
index 0000000..6a0499d
--- /dev/null
+++ b/meta/site/mips64el-linux-uclibc
@@ -0,0 +1,108 @@
+# general
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+# from samba 3.0.14a on 5/29/2005
+ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
+ac_cv_have_asprintf_decl=${ac_cv_have_asprintf_decl=yes}
+ac_cv_have_setresgid_decl=${ac_cv_have_setresgid_decl=yes}
+ac_cv_have_setresuid_decl=${ac_cv_have_setresuid_decl=yes}
+ac_cv_have_vasprintf_decl=${ac_cv_have_vasprintf_decl=yes}
+fu_cv_sys_stat_statvfs64=${fu_cv_sys_stat_statvfs64=yes}
+samba_cv_FTRUNCATE_NEEDS_ROOT=${samba_cv_FTRUNCATE_NEEDS_ROOT=no}
+samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
+samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
+samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=no}
+samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
+samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
+samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
+samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
+samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=yes}
+samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
+samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
+samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
+samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
+samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
+samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
+samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
+samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
+samba_cv_HAVE_QUOTACTL_4A=${samba_cv_HAVE_QUOTACTL_4A=yes}
+samba_cv_HAVE_ROOT=${samba_cv_HAVE_ROOT=no}
+samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
+samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
+samba_cv_HAVE_STRUCT_DIRENT64=${samba_cv_HAVE_STRUCT_DIRENT64=yes}
+samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
+samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
+samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=no}
+samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=no}
+samba_cv_HAVE_Werror=${samba_cv_HAVE_Werror=yes}
+samba_cv_REALPATH_TAKES_NULL=${samba_cv_REALPATH_TAKES_NULL=no}
+samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
+samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
+samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
+samba_cv_SYSCONF_SC_NGROUPS_MAX=${samba_cv_SYSCONF_SC_NGROUPS_MAX=yes}
+samba_cv_SYSCONF_SC_NPROC_ONLN=${samba_cv_SYSCONF_SC_NPROC_ONLN=no}
+samba_cv_SYSQUOTA_FOUND=${samba_cv_SYSQUOTA_FOUND=yes}
+samba_cv_SYSQUOTA_WORKS=${samba_cv_SYSQUOTA_WORKS=yes}
+samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
+samba_cv_have_longlong=${samba_cv_have_longlong=yes}
+samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
+samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
+samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_4A.c}
+# This cached value needs a local patch to pick it up, upstream 3.0.14a
+# doesn't cache it.
+samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
-- 
1.7.5.4



