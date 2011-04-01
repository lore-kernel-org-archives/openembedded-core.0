Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W08-0004q6-FN
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:25 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3431291iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=RMLUVf0jlD+AMDi2SYHF7WWXeaytCctYs7z2J7h5mtU=;
	b=a//QdN1salLdqZIQnru0TzK9Q/XLr01qrQYoKO8Efy6id5zc5CqNNlDgBY2OzKp1Sh
	FDpaXvXM5qTh5QZ6exspQRBFuarUr10HTNFo/gkiR3TTwgkV4Hs5kNFr2EwkiRmVGoiU
	q8ahc/ChLmtH1d0dXr5fCuytL6WedonykjtbU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VklV3yBtkEqHWQcK0pJ2Wa+jDXQb9pgbYXnvMwyEOnvZeMNFwGLrL0DwFdhTagseAl
	9B6DU4Evi12NHoUNFAAYHoNyScjP8J7IgKPV6xnoxMGswsrgDXKFmx2pbTRTHLKje7Ax
	HhlQ0YC5JT7LH58StDxLz0KTrOYx8qhiomaJI=
Received: by 10.43.55.137 with SMTP id vy9mr4522395icb.174.1301632105769;
	Thu, 31 Mar 2011 21:28:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id gy41sm1184409ibb.5.2011.03.31.21.28.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:17 -0700
Message-Id: <24fb47af47739da13596cd383002a4b2cd650a6f.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 04/46] site: Add mips-linux-uclibc site file and add to x86_64-linux-uclibc
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:25 -0000

mips-uclibc needs the mips-linux-uclibc site file
x86_64-linux-uclibc is enahnced for missing cached variables

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/mips-linux-uclibc   |  126 +++++++++++++++++++++++++++++++++++++++++
 meta/site/x86_64-linux-uclibc |   26 +++++++++
 2 files changed, 152 insertions(+), 0 deletions(-)
 create mode 100644 meta/site/mips-linux-uclibc

diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
new file mode 100644
index 0000000..074cb09
--- /dev/null
+++ b/meta/site/mips-linux-uclibc
@@ -0,0 +1,126 @@
+
+ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+
+# tslib, others
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
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
+glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+
+# slrn
+slrn_cv___va_copy=${slrn_cv___va_copy=yes}
+slrn_cv_va_copy=${slrn_cv_va_copy=yes}
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
+
+# db3
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
+db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
+db_cv_posixmutexes=${db_cv_posixmutexes=no}
+db_cv_uimutexes=${db_cv_uimutexes=no}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
+db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
+db_cv_path_cp=${db_cv_path_cp=/bin/cp}
+db_cv_path_ln=${db_cv_path_ln=/bin/ln}
+db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
+db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
+db_cv_path_rm=${db_cv_path_rm=/bin/rm}
+db_cv_path_sh=${db_cv_path_sh=/bin/sh}
+db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
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
+# sudo
+sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
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
+# mono
+cv_mono_sizeof_sunpath=108
+mono_cv_sizeof_sunpath=108
+mono_cv_uscore=${mono_cv_uscore=no}
+
+# popt
+ac_cv_va_copy=${ac_cv_va_copy=yes}
+ac_cv___va_copy=${ac_cv___va_copy=yes}
+
+# readline
+bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
+
+# eds-dbus
+ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
+
diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index fe235d0..d83ed1d 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -76,3 +76,29 @@ utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
 
 # gettext
 am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# glib-2.0
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
+# flex
+ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
+ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ORBit2
+ac_cv_alignof_CORBA_boolean=1
+ac_cv_alignof_CORBA_char=1
+ac_cv_alignof_CORBA_double=4
+ac_cv_alignof_CORBA_float=4
+ac_cv_alignof_CORBA_long=4
+ac_cv_alignof_CORBA_long_double=8
+ac_cv_alignof_CORBA_long_long=8
+ac_cv_alignof_CORBA_octet=1
+ac_cv_alignof_CORBA_pointer=8
+ac_cv_alignof_CORBA_short=2
+ac_cv_alignof_CORBA_struct=1
+ac_cv_alignof_CORBA_wchar=2
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
-- 
1.7.4.1



