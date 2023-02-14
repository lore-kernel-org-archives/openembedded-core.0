Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77867C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 15:56:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10720.1676390166938345645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 07:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E27181FB;
	Tue, 14 Feb 2023 07:56:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 967AD3F663;
	Tue, 14 Feb 2023 07:56:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] site: remove glib site values
Date: Tue, 14 Feb 2023 15:56:02 +0000
Message-Id: <20230214155603.2390194-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 15:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177152

GLib 1.x is incredibly obsolete and GLib 2.x is built using Meson
not autotools, so we can remove the GLib entries from the site files.

Also fix a few copy/paste typos where glib_ was used incorrectly, for exa=
mple:

  ac_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}

The glib_cv_ should be ac_cv_.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/site/arc-common          |  4 ----
 meta/site/arm-32              | 15 ---------------
 meta/site/arm-64              | 15 ---------------
 meta/site/arm-common          | 19 -------------------
 meta/site/arm-darwin          |  2 --
 meta/site/arm-darwin8         |  2 --
 meta/site/arm-linux           |  2 +-
 meta/site/armeb-linux         |  2 +-
 meta/site/common-glibc        | 13 -------------
 meta/site/common-musl         |  9 ---------
 meta/site/ix86-common         | 22 ----------------------
 meta/site/loongarch64-linux   |  4 ----
 meta/site/microblaze-linux    | 23 -----------------------
 meta/site/mips-common         |  7 -------
 meta/site/mips-linux          | 18 ------------------
 meta/site/mips64-linux        | 22 ----------------------
 meta/site/mips64el-linux      | 22 ----------------------
 meta/site/mipsel-linux        | 18 ------------------
 meta/site/mipsisa32r6-linux   | 18 ------------------
 meta/site/mipsisa32r6el-linux | 18 ------------------
 meta/site/mipsisa64r6-linux   | 22 ----------------------
 meta/site/mipsisa64r6el-linux | 22 ----------------------
 meta/site/nios2-linux         | 35 +----------------------------------
 meta/site/powerpc-common      |  5 -----
 meta/site/powerpc-linux       |  5 -----
 meta/site/powerpc32-linux     | 26 --------------------------
 meta/site/riscv32-linux       |  4 ----
 meta/site/riscv64-linux       |  4 ----
 meta/site/sh-common           | 33 ---------------------------------
 meta/site/sparc-linux         |  6 ------
 meta/site/x32-linux           |  3 ---
 meta/site/x86_64-linux        | 22 ----------------------
 32 files changed, 3 insertions(+), 439 deletions(-)

diff --git a/meta/site/arc-common b/meta/site/arc-common
index d3c721a8bb9..5cdad0b07b0 100644
--- a/meta/site/arc-common
+++ b/meta/site/arc-common
@@ -3,9 +3,5 @@ ac_cv_alignof_guint32=3D4
 ac_cv_alignof_guint64=3D4
 ac_cv_alignof_unsigned_long=3D4
=20
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
 # startup-notification
 lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
diff --git a/meta/site/arm-32 b/meta/site/arm-32
index 60ada2e974d..c6af852354e 100644
--- a/meta/site/arm-32
+++ b/meta/site/arm-32
@@ -4,21 +4,6 @@
 ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
 ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
=20
-# glib
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-
-# glib-2.0
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
-glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
-glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D4
-
 # jikes
 ac_cv_sizeof_wchar_t=3D4
=20
diff --git a/meta/site/arm-64 b/meta/site/arm-64
index 40763fb0592..79c10dab0e8 100644
--- a/meta/site/arm-64
+++ b/meta/site/arm-64
@@ -7,21 +7,6 @@ ac_cv_sizeof_ssize_t=3D8
 ac_cv_alignof_char=3D1
 ac_cv_alignof_double=3D8
=20
-# glib
-#glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-#glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-#glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-
-# glib-2.0
-#glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-#glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
-#glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
-#glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
-#glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D8
-
 # at-spi2-core
 ac_cv_alignof_dbind_pointer=3D8
 ac_cv_alignof_dbind_struct=3D1
diff --git a/meta/site/arm-common b/meta/site/arm-common
index 4c25c82be95..18c6d422008 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -41,25 +41,6 @@ ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3D=
yes}
 # gettext
 am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
=20
-# glib
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_tr=
ylock_posix=3Dyes}
-glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecifi=
c_posix=3Dyes}
-glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_ti=
medwait_posix=3Dyes}
-
-# glib-2.0
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_niceness_=
surrogate=3Dyes}
-
 #gstreamer
 as_cv_unaligned_access=3D${as_cv_unaligned_access=3Dno}
=20
diff --git a/meta/site/arm-darwin b/meta/site/arm-darwin
index 09ff097aa0d..00d9a64aa71 100644
--- a/meta/site/arm-darwin
+++ b/meta/site/arm-darwin
@@ -1,7 +1,5 @@
 ac_cv_lib_m_sin=3D${ac_cv_lib_m_sin=3Dyes}
 ac_cv_func_posix_spawn=3D${ac_cv_func_posix_spawn=3Dno}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dno}
 ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dno}
 ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dno}
diff --git a/meta/site/arm-darwin8 b/meta/site/arm-darwin8
index 09ff097aa0d..00d9a64aa71 100644
--- a/meta/site/arm-darwin8
+++ b/meta/site/arm-darwin8
@@ -1,7 +1,5 @@
 ac_cv_lib_m_sin=3D${ac_cv_lib_m_sin=3Dyes}
 ac_cv_func_posix_spawn=3D${ac_cv_func_posix_spawn=3Dno}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dno}
 ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dno}
 ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dno}
diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index fb3c81d0e97..c4205a4a2e7 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -17,7 +17,7 @@ ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
 ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
 ac_cv_sizeof_double=3D${ac_cv_sizeof_double=3D8}
 ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D8}
-ac_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
+ac_cv_sizeof_ptrdiff_t=3D${ac_cv_sizeof_ptrdiff_t=3D4}
 ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
 ac_cv_sizeof_unsigned=3D${ac_cv_sizeof_unsigned=3D4}
 ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
diff --git a/meta/site/armeb-linux b/meta/site/armeb-linux
index 6521ff584ae..3e57e1843c5 100644
--- a/meta/site/armeb-linux
+++ b/meta/site/armeb-linux
@@ -12,7 +12,7 @@ ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
 ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D8}
 ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D4}
 ac_cv_sizeof_unsigned=3D${ac_cv_sizeof_unsigned=3D4}
-ac_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
+ac_cv_sizeof_ptrdiff_t=3D${ac_cv_sizeof_ptrdiff_t=3D4}
=20
 ac_cv_uchar=3D${ac_cv_uchar=3Dno}
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 0a665658fb1..7ba91e03c04 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -36,19 +36,6 @@ gl_cv_func_working_mkstemp=3D${gl_cv_func_working_mkst=
emp=3Dyes}
 gl_cv_func_working_mktime=3D${gl_cv_func_working_mktime=3Dyes}
 gl_cv_func_working_utimes=3D${gl_cv_func_working_utimes=3Dyes}
=20
-# glib
-glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
-ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
-ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
-ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
-glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=3D=
1}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-# glib-1.x requires this and pkgconfig-native / pkgconfig-nativesdk use
-# that to avoid a dependency loop.
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
-glib_cv_have_qsort_r=3D${glib_cv_have_qsort_r=3Dyes}
-
 #dbus-glib
 ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
=20
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 23e50ef7491..0fd0413819e 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -18,15 +18,6 @@ ac_cv_func_strtod=3D${ac_cv_func_strtod=3Dyes}
 # off_t is always 64bit on musl systems
 ac_cv_sys_file_offset_bits=3D${ac_cv_sys_file_offset_bits=3D64}
=20
-# glib
-glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
-ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
-ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
-ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
-glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=3D=
1}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_have_qsort_r=3D${glib_cv_have_qsort_r=3Dyes}
-
 #dbus-glib
 ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
=20
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index d98ae5265b0..b97b2e3f60c 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -69,28 +69,6 @@ ettercap_cv_type_socklen_t=3D${ettercap_cv_type_sockle=
n_t=3Dyes}
 # gettext
 am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
=20
-# glib
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_ti=
medwait_posix=3Dyes}
-glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecifi=
c_posix=3Dyes}
-glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_tr=
ylock_posix=3Dyes}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dyes}
-
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D4
-ac_cv_alignof_unsigned_long=3D4
-
 # guile
 ac_cv_uchar=3D${ac_cv_uchar=3Dno}
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
diff --git a/meta/site/loongarch64-linux b/meta/site/loongarch64-linux
index 38bc5f044dd..384d3bd8774 100644
--- a/meta/site/loongarch64-linux
+++ b/meta/site/loongarch64-linux
@@ -3,9 +3,5 @@ ac_cv_alignof_guint32=3D4
 ac_cv_alignof_guint64=3D8
 ac_cv_alignof_unsigned_long=3D8
=20
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
 # startup-notification
 lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
diff --git a/meta/site/microblaze-linux b/meta/site/microblaze-linux
index c6a40c6bec5..61dcd43e8c8 100644
--- a/meta/site/microblaze-linux
+++ b/meta/site/microblaze-linux
@@ -26,29 +26,6 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
 ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
 ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
=20
-# glib
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-
-# glib-2.0
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D4
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
-glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
-glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_niceness_=
surrogate=3Dyes}
-
 # startup-notification
 lf_cv_sane_realloc=3Dyes
=20
diff --git a/meta/site/mips-common b/meta/site/mips-common
index 892817b1080..ff1b7f4e5e0 100644
--- a/meta/site/mips-common
+++ b/meta/site/mips-common
@@ -18,13 +18,6 @@ screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo=
_used=3Dyes}
 # apache
 ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
=20
-# glib
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D4
-
-
 # slrn
 slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
=20
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index b2f15eee183..91570ec3098 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -15,24 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_hav=
e_space_d_name_in_struct_dir
 # fget
 compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
=20
-# glib
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-
 # libpcap
 ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
=20
diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
index e7c16405eb2..7e05b94a093 100644
--- a/meta/site/mips64-linux
+++ b/meta/site/mips64-linux
@@ -15,28 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_hav=
e_space_d_name_in_struct_dir
 # fget
 compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
=20
-# glib
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D8
-ac_cv_sizeof_ssize_t=3D8
-
 # libpcap
 ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
=20
diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
index 406ffd66c5d..1e1d7687c28 100644
--- a/meta/site/mips64el-linux
+++ b/meta/site/mips64el-linux
@@ -15,28 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_hav=
e_space_d_name_in_struct_dir
 # fget
 compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
=20
-# glib
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D8
-ac_cv_sizeof_ssize_t=3D8
-
 # libpcap
 ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
=20
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index e9cf193cec2..a3077f21610 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -15,24 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_hav=
e_space_d_name_in_struct_dir
 # fget
 compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
=20
-# glib
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-
 # libpcap
 ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
=20
diff --git a/meta/site/mipsisa32r6-linux b/meta/site/mipsisa32r6-linux
index b2f15eee183..91570ec3098 100644
--- a/meta/site/mipsisa32r6-linux
+++ b/meta/site/mipsisa32r6-linux
@@ -15,24 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_hav=
e_space_d_name_in_struct_dir
 # fget
 compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
=20
-# glib
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-
 # libpcap
 ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
=20
diff --git a/meta/site/mipsisa32r6el-linux b/meta/site/mipsisa32r6el-linu=
x
index e9cf193cec2..a3077f21610 100644
--- a/meta/site/mipsisa32r6el-linux
+++ b/meta/site/mipsisa32r6el-linux
@@ -15,24 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_hav=
e_space_d_name_in_struct_dir
 # fget
 compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
=20
-# glib
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-
 # libpcap
 ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
=20
diff --git a/meta/site/mipsisa64r6-linux b/meta/site/mipsisa64r6-linux
index e7c16405eb2..7e05b94a093 100644
--- a/meta/site/mipsisa64r6-linux
+++ b/meta/site/mipsisa64r6-linux
@@ -15,28 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_hav=
e_space_d_name_in_struct_dir
 # fget
 compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
=20
-# glib
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D8
-ac_cv_sizeof_ssize_t=3D8
-
 # libpcap
 ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
=20
diff --git a/meta/site/mipsisa64r6el-linux b/meta/site/mipsisa64r6el-linu=
x
index 406ffd66c5d..1e1d7687c28 100644
--- a/meta/site/mipsisa64r6el-linux
+++ b/meta/site/mipsisa64r6el-linux
@@ -15,28 +15,6 @@ ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_hav=
e_space_d_name_in_struct_dir
 # fget
 compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
=20
-# glib
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D8
-ac_cv_sizeof_ssize_t=3D8
-
 # libpcap
 ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
=20
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 656da9fde46..58ffcbc7e2f 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -53,39 +53,6 @@ ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3D=
yes}
 # gettext
 am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
=20
-# gio
-ac_cv_func_getgrgid_r=3D${ac_cv_func_getgrgid_r=3Dyes}
-
-# glib
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
-glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
-glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_tr=
ylock_posix=3Dyes}
-glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecifi=
c_posix=3Dyes}
-glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_ti=
medwait_posix=3Dyes}
-
-# glib-2.0
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
-glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
-glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_niceness_=
surrogate=3Dyes}
-
 #gstreamer
 as_cv_unaligned_access=3D${as_cv_unaligned_access=3Dno}
=20
@@ -225,7 +192,7 @@ ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
 ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
 ac_cv_sizeof_double=3D${ac_cv_sizeof_double=3D8}
 ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D8}
-ac_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
+ac_cv_sizeof_ptrdiff_t=3D${ac_cv_sizeof_ptrdiff_t=3D4}
 ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
 ac_cv_sizeof_unsigned=3D${ac_cv_sizeof_unsigned=3D4}
 ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
index efa299c664b..02217c70f94 100644
--- a/meta/site/powerpc-common
+++ b/meta/site/powerpc-common
@@ -1,8 +1,3 @@
-# glib
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D4
-
 # at-spi2-core
 ac_cv_alignof_char=3D1
 ac_cv_alignof_dbind_pointer=3D4
diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
index a9f89cb5d47..0aa5732fc00 100644
--- a/meta/site/powerpc-linux
+++ b/meta/site/powerpc-linux
@@ -4,11 +4,6 @@ ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dyes}
 # startup-notification
 lf_cv_sane_realloc=3Dyes
=20
-# glib
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
-
 # lftp
 lftp_cv_va_val_copy=3D${lftp_cv_va_val_copy=3Dyes}
=20
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 764e97e4c31..c2f870b432c 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -97,21 +97,6 @@ php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_=
lib_cookie_io_functions_use_
 # gettext
 am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
=20
-# glib
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_tr=
ylock_posix=3Dyes}
-glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecifi=
c_posix=3Dyes}
-glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_ti=
medwait_posix=3Dyes}
-
 # ettercap
 ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
=20
@@ -121,17 +106,6 @@ acx_working_snprintf=3D${acx_working_snprintf=3Dyes}
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
=20
-# glib 2.0
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
-glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
-glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_niceness_=
surrogate=3Dyes}
-
-glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
-
 # httppc
 ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
=20
diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
index 97de628e228..2cc26f3b93f 100644
--- a/meta/site/riscv32-linux
+++ b/meta/site/riscv32-linux
@@ -3,9 +3,5 @@ ac_cv_alignof_guint32=3D4
 ac_cv_alignof_guint64=3D8
 ac_cv_alignof_unsigned_long=3D4
=20
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
 # startup-notification
 lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
index 38bc5f044dd..384d3bd8774 100644
--- a/meta/site/riscv64-linux
+++ b/meta/site/riscv64-linux
@@ -3,9 +3,5 @@ ac_cv_alignof_guint32=3D4
 ac_cv_alignof_guint64=3D8
 ac_cv_alignof_unsigned_long=3D8
=20
-# glib-2.0
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-
 # startup-notification
 lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index d269a17db92..720d4543518 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -103,24 +103,6 @@ ac_cv_pread=3D${ac_cv_pread=3Dno}
 ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
 php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_func=
tions_use_off64_t=3Dyes}
=20
-# glib
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
-glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_tr=
ylock_posix=3Dyes}
-glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecifi=
c_posix=3Dyes}
-glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_ti=
medwait_posix=3Dyes}
-
 # ettercap
 ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
=20
@@ -130,21 +112,6 @@ acx_working_snprintf=3D${acx_working_snprintf=3Dyes}
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
=20
-# glib 2.0
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
-glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
-glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
-glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_niceness_=
surrogate=3Dyes}
-
-glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D4
-
 # httppc
 ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
=20
diff --git a/meta/site/sparc-linux b/meta/site/sparc-linux
index 49d0d9a3d66..c87eaae5ec3 100644
--- a/meta/site/sparc-linux
+++ b/meta/site/sparc-linux
@@ -38,11 +38,5 @@ am_cv_sys_posix_termios=3D${am_cv_sys_posix_termios=3D=
yes}
 # gettext
 am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
=20
-#glib
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}=20
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-
 #linux
 ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
diff --git a/meta/site/x32-linux b/meta/site/x32-linux
index 4b70422ed2a..cf4ef147f7a 100644
--- a/meta/site/x32-linux
+++ b/meta/site/x32-linux
@@ -3,6 +3,3 @@ ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D1=
6}
 ac_cv_sizeof_dev_t=3D${ac_cv_sizeof_dev_t=3D8}
 ac_cv_sys_file_offset_bits=3D${ac_cv_sys_file_offset_bits=3D64}
 ac_cv_alignof_double=3D8
-
-# glib
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D32}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index ea3176da938..d7b7a530ff5 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -32,28 +32,6 @@ db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'=
}
 db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
 db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
=20
-# glib
-glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
-glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
-glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
-glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
-glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dyes}
-glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
-glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D40}
-glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
-glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D8}
-glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D8}
-glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D8}
-glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
-glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_ti=
medwait_posix=3Dyes}
-glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecifi=
c_posix=3Dyes}
-glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_tr=
ylock_posix=3Dyes}
-glib_cv_uscore=3D${glib_cv_uscore=3Dno}
-glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dno}
-ac_cv_alignof_guint32=3D4
-ac_cv_alignof_guint64=3D8
-ac_cv_alignof_unsigned_long=3D8
-
 nano_cv_func_regexec_segv_emptystr=3D${nano_cv_func_regexec_segv_emptyst=
r=3Dno}
 samba_cv_HAVE_VA_COPY=3D${samba_cv_HAVE_VA_COPY=3Dyes}
 screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
--=20
2.34.1


