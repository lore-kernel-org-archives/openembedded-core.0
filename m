Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id 45F1371A0B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:31:32 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id 506F0983CF26E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 12:31:29 +0100 (IST)
Received: from HHMAIL01.hh.imgtec.org (10.100.10.19) by HHMAIL03.hh.imgtec.org
	(10.44.0.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 4 Oct 2016 12:31:31 +0100
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 4 Oct 2016 12:31:31 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2016 12:31:17 +0100
Message-ID: <1475580681-55081-6-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH 5/9] siteinfo.bbclass: Add mipsisa{32, 64}r6{el, } support
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
X-List-Received-Date: Tue, 04 Oct 2016 11:31:32 -0000
Content-Type: text/plain

Add support for MIPS Release 6 ISA

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/classes/siteinfo.bbclass |  4 +++
 meta/site/mipsisa32r6-linux   | 79 ++++++++++++++++++++++++++++++++++++++++
 meta/site/mipsisa32r6el-linux | 79 ++++++++++++++++++++++++++++++++++++++++
 meta/site/mipsisa64r6-linux   | 83 +++++++++++++++++++++++++++++++++++++++++++
 meta/site/mipsisa64r6el-linux | 83 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 328 insertions(+)
 create mode 100644 meta/site/mipsisa32r6-linux
 create mode 100644 meta/site/mipsisa32r6el-linux
 create mode 100644 meta/site/mipsisa64r6-linux
 create mode 100644 meta/site/mipsisa64r6el-linux

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 6a2e4bf..6eca004 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -36,7 +36,11 @@ def siteinfo_data(d):
         "mips": "endian-big bit-32 mips-common",
         "mips64": "endian-big bit-64 mips-common",
         "mips64el": "endian-little bit-64 mips-common",
+        "mipsisa64r6": "endian-big bit-64 mips-common",
+        "mipsisa64r6el": "endian-little bit-64 mips-common",
         "mipsel": "endian-little bit-32 mips-common",
+        "mipsisa32r6": "endian-big bit-32 mips-common",
+        "mipsisa32r6el": "endian-little bit-32 mips-common",
         "powerpc": "endian-big bit-32 powerpc-common",
         "nios2": "endian-little bit-32 nios2-common",
         "powerpc64": "endian-big bit-64 powerpc-common",
diff --git a/meta/site/mipsisa32r6-linux b/meta/site/mipsisa32r6-linux
new file mode 100644
index 0000000..72a54f9
--- /dev/null
+++ b/meta/site/mipsisa32r6-linux
@@ -0,0 +1,79 @@
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
+# evolution-data-server
+ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
+
diff --git a/meta/site/mipsisa32r6el-linux b/meta/site/mipsisa32r6el-linux
new file mode 100644
index 0000000..696b1be
--- /dev/null
+++ b/meta/site/mipsisa32r6el-linux
@@ -0,0 +1,79 @@
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
+# evolution-data-server
+ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
diff --git a/meta/site/mipsisa64r6-linux b/meta/site/mipsisa64r6-linux
new file mode 100644
index 0000000..ed0fbbe
--- /dev/null
+++ b/meta/site/mipsisa64r6-linux
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
+ac_cv_sizeof_ssize_t=8
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
diff --git a/meta/site/mipsisa64r6el-linux b/meta/site/mipsisa64r6el-linux
new file mode 100644
index 0000000..680171d
--- /dev/null
+++ b/meta/site/mipsisa64r6el-linux
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
+ac_cv_sizeof_ssize_t=8
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
-- 
1.9.1


