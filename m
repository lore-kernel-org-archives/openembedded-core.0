Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/lBw+Emk8eZEKvxp8lQ8/LrdTBIo3p470=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkIpC-00082M-NB
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 18:43:43 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6MGdXir001451
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:39:33 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <ea9bd3c17709ba37b964e4824e8818bcd4723135.1311352057.git.tom_rini@mentor.com>
Date: Fri, 22 Jul 2011 11:39:32 -0500
Message-Id: <3DA9FF0A-3193-4606-9A94-561B09173340@kernel.crashing.org>
References: <cover.1311352057.git.tom_rini@mentor.com>
	<ea9bd3c17709ba37b964e4824e8818bcd4723135.1311352057.git.tom_rini@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/8] siteinfo: Move certain samba entries to common-linux
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
X-List-Received-Date: Fri, 22 Jul 2011 16:43:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

>=20
> diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
> index e69de29..145da0d 100644
> --- a/meta/site/powerpc-common
> +++ b/meta/site/powerpc-common
> @@ -0,0 +1,325 @@
> +ac_cv_func_getpgrp_void=3Dyes
> +ac_cv_func_setpgrp_void=3Dyes
> +ac_cv_func_setgrent_void=3Dyes
> +ac_cv_func_malloc_0_nonnull=3Dyes
> +ac_cv_func_malloc_works=3Dyes
> +ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
> +ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
> +ac_cv_func_setvbuf_reversed=3Dno
> +ac_cv_sizeof___int64=3D${ac_cv_sizeof___int64=3D0}
> +ac_cv_sizeof_bool=3D${ac_cv_sizeof_bool=3D1}
> +ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
> +ac_cv_sizeof_double=3D${ac_cv_sizeof_double=3D8}
> +ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> +ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
> +ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
> +ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
> +ac_cv_sizeof_long_int=3D${ac_cv_sizeof_long_int=3D4}
> +ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
> +ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
> +ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
> +ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
> +ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
> +ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
> +ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
> +ac_cv_sizeof_wchar_t=3D${ac_cv_sizeof_wchar_t=3D4}
> +ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D8}
> +ac_cv_sys_restartable_syscalls=3Dyes
> +ac_cv_type___int64=3D${ac_cv_type___int64=3Dno}
> +ac_cv_type_size_t=3D${ac_cv_type_size_t=3Dyes}
> +ac_cv_type_void_p=3D${ac_cv_type_void_p=3Dyes}
> +ac_cv_uchar=3D${ac_cv_uchar=3Dno}
> +ac_cv_uint=3D${ac_cv_uint=3Dyes}
> +ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
> +ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
> +ac_cv_time_r_type=3D${ac_cv_time_r_type=3DPOSIX}
> =
+cookie_io_functions_use_off64_t=3D${cookie_io_functions_use_off64_t=3Dyes=
}


This is wrong for PPC.. will break ppc64

- k

> +
> +
> +# apache
> +ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
> +apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
> +ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
> +
> +ac_cv_header_netinet_sctp_h=3D${ac_cv_header_netinet_sctp_h=3Dno}
> +ac_cv_header_netinet_sctp_uio_h=3D${ac_cv_header_netinet_sctp_uio_h=3Dn=
o}
> +ac_cv_sctp=3D${ac_cv_sctp=3Dno}
> +
> +# ssh
> =
+ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_dirent_have_space_d_na=
me=3Dyes}
> +ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> +ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> +ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> +ac_cv_type_struct_timespec=3D${ac_cv_type_struct_timespec=3Dyes}
> +ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dyes}
> +
> +# coreutils
> +utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1019}
> +
> +# libpcap
> +ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> +
> +# nano
> +ac_cv_regexec_segfault_emptystr=3D${ac_cv_regexec_segfault_emptystr=3Dn=
o}
> =
+nano_cv_func_regexec_segv_emptystr=3D${nano_cv_func_regexec_segv_emptystr=
=3Dno}
> +
> +
> +# libnet
> +ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
> +
> +# screen
> +screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
> +screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
> +screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
> +screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes=
}
> +screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
> =
+screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
> +screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
> +screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
> +screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
> +
> =
+ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_derefe=
rences_slashed_symlink=3Dyes}
> =
+ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=3D=
no}
> =
+ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3Dn=
o}
> =
+ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_traili=
ng_slash=3Dno}
> +
> +# socat
> +ac_cv_ispeed_offset=3D${ac_cv_ispeed_offset=3D13}
> +sc_cv_termios_ispeed=3D${sc_cv_termios_ispeed=3Dyes}
> +
> +# links
> =
+ac_cv_lib_png_png_create_info_struct=3D${ac_cv_lib_png_png_create_info_st=
ruct=3Dyes}
> +
> +# sleepycat db
> +db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
> +db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
> +db_cv_path_ar=3D${db_cv_path_ar=3D/usr/bin/ar}
> +db_cv_path_chmod=3D${db_cv_path_chmod=3D/bin/chmod}
> +db_cv_path_cp=3D${db_cv_path_cp=3D/bin/cp}
> +db_cv_path_ln=3D${db_cv_path_ln=3D/bin/ln}
> +db_cv_path_mkdir=3D${db_cv_path_mkdir=3D/bin/mkdir}
> +db_cv_path_ranlib=3D${db_cv_path_ranlib=3D/usr/bin/ranlib}
> +db_cv_path_rm=3D${db_cv_path_rm=3D/bin/rm}
> +db_cv_path_sh=3D${db_cv_path_sh=3D/bin/sh}
> +db_cv_path_strip=3D${db_cv_path_strip=3D/usr/bin/strip}
> +db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
> +db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
> +db_cv_mutex=3D${db_cv_mutex=3Dno}
> +db_cv_posixmutexes=3D${db_cv_posixmutexes=3Dno}
> +db_cv_uimutexes=3D${db_cv_uimutexes=3Dno}
> +
> +# php
> +ac_cv_pread=3D${ac_cv_pread=3Dno}
> +ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
> =
+php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_funct=
ions_use_off64_t=3Dyes}
> +
> +# gettext
> +am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> +
> +# glib
> +glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> +glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> +glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> +glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> +glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> +glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> +glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> +glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> +glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> +glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> +glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> +glib_cv_va_copy=3D${glib_cv_va_copy=3Dno}
> +glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
> +glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> +glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> +ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
> =
+glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_try=
lock_posix=3Dyes}
> =
+glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecific=
_posix=3Dyes}
> =
+glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_tim=
edwait_posix=3Dyes}
> +
> +# ettercap
> +ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
> +
> +# libesmtp
> +acx_working_snprintf=3D${acx_working_snprintf=3Dyes}
> +
> +# D-BUS
> +ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
> +
> +# glib 2.0
> +glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> +glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> +glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
> +glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
> +glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
> +glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> =
+glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_niceness_s=
urrogate=3Dyes}
> +
> +glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
> +
> +# httppc
> +ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
> +
> +# lftp
> +ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
> +lftp_cv_va_copy=3D${lftp_cv_va_copy=3Dno}
> +lftp_cv_va_val_copy=3D${lftp_cv_va_val_copy=3Dyes}
> +lftp_cv___va_copy=3D${lftp_cv___va_copy=3Dyes}
> +
> +# edb
> +db_cv_spinlocks=3D${db_cv_spinlocks=3Dno}
> +
> +# fget
> +compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> +compat_cv_func_basename_works=3D${compat_cv_func_basename_works=3Dno}
> +compat_cv_func_dirname_works=3D${compat_cv_func_dirname_works=3Dno}
> +
> +# slrn
> +slrn_cv___va_copy=3D${slrn_cv___va_copy=3Dyes}
> +slrn_cv_va_copy=3D${slrn_cv_va_copy=3Dno}
> +slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
> +ac_cv_func_realloc_works=3D${ac_cv_func_realloc_works=3Dyes}
> +ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dyes}
> +ac_cv_func_malloc_works=3D${ac_cv_func_malloc_works=3Dyes}
> +ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
> +
> +# startup-notification
> +lf_cv_sane_realloc=3Dyes
> +
> +# libidl
> +libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> +
> +# ORBit2
> +ac_cv_alignof_CORBA_boolean=3D1
> +ac_cv_alignof_CORBA_char=3D1
> +ac_cv_alignof_CORBA_double=3D4
> +ac_cv_alignof_CORBA_float=3D4
> +ac_cv_alignof_CORBA_long=3D4
> +ac_cv_alignof_CORBA_long_double=3D4
> +ac_cv_alignof_CORBA_long_long=3D4
> +ac_cv_alignof_CORBA_octet=3D1
> +ac_cv_alignof_CORBA_pointer=3D4
> +ac_cv_alignof_CORBA_short=3D2
> +ac_cv_alignof_CORBA_struct=3D4
> +ac_cv_alignof_CORBA_wchar=3D2
> +ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
> +
> +# cvs
> +cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
> +
> +# bash
> +ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
> +bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
> +bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
> =
+bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandlers=
=3Dno}
> +bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
> +bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
> +bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
> +bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
> +bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
> +bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
> +bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
> +bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
> +bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
> +bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
> +bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
> +bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
> +
> +# openssh
> +ac_cv_have_broken_dirname=3D${ac_cv_have_broken_dirname=3D'yes'}
> =
+ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3D'no'}
> +ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3D'no'}
> +ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3D'yes'}
> +ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3D'no=
'}
> +ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3D'yes'}
> +
> +# vim
> +ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D'4'}
> +
> +#modphp=20
> +ac_cv_c_bigendian_php=3D${ac_cv_c_bigendian_php=3Dyes}
> +ac_cv_sizeof_ptrdiff_t=3D${ac_cv_sizeof_ptrdiff_t=3D4}
> +
> +# apache2 (note other apache stanza in this file)
> +ap_void_ptr_lt_long=3D${ap_void_ptr_lt_long=3Dno}
> +apr_cv_use_lfs64=3D${apr_cv_use_lfs64=3Dyes}
> +apr_cv_epoll=3D${apr_cv_epoll=3Dyes}
> +apr_cv_pthreads_cflags=3D${apr_cv_pthreads_cflags=3D-pthread}
> +apr_cv_pthreads_lib=3D${apr_cv_pthreads_lib=3D-lpthread}
> +apr_cv_mutex_recursive=3D${apr_cv_mutex_recursive=3Dyes}
> +ac_cv_func_mmap=3D${ac_cv_func_mmap=3Dyes}
> +ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
> +ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
> +ac_cv_sizeof_pid_t=3D${ac_cv_sizeof_pid_t=3D4}
> +ac_cv_socklen_t=3D${ac_cv_socklen_t=3Dyes}
> +ac_cv_struct_rlimit=3D${ac_cv_struct_rlimit=3Dyes}
> +ac_cv_negative_eai=3D${ac_cv_negative_eai=3Dyes}
> +apr_cv_gai_addrconfig=3D${apr_cv_gai_addrconfig=3Dno}
> +ac_cv_o_nonblock_inherited=3D${ac_cv_o_nonblock_inherited=3Dno}
> +apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
> +
> +# binutils (libiberty)
> +ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> +ac_cv_type_int=3D${ac_cv_type_int=3Dyes}
> +ac_cv_type_uintptr_t=3D${ac_cv_type_uintptr_t=3Dyes}
> +liberty_cv_uint64=3D${liberty_cv_uint64=3Duint64_t}
> +
> +#samba
> +ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
> +fu_cv_sys_stat_statvfs64=3D${fu_cv_sys_stat_statvfs64=3Dyes}
> =
+samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=3D${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=
=3Dno}
> +samba_cv_HAVE_BROKEN_GETGROUPS=3D${samba_cv_HAVE_BROKEN_GETGROUPS=3Dno}=

> +samba_cv_HAVE_BROKEN_READDIR=3D${samba_cv_HAVE_BROKEN_READDIR=3Dyes}
> =
+samba_cv_HAVE_BROKEN_READDIR_NAME=3D${samba_cv_HAVE_BROKEN_READDIR_NAME=3D=
no}
> +samba_cv_HAVE_C99_VSNPRINTF=3D${samba_cv_HAVE_C99_VSNPRINTF=3Dyes}
> +samba_cv_HAVE_DEV64_T=3D${samba_cv_HAVE_DEV64_T=3Dno}
> +samba_cv_HAVE_DEVICE_MAJOR_FN=3D${samba_cv_HAVE_DEVICE_MAJOR_FN=3Dyes}
> +samba_cv_HAVE_DEVICE_MINOR_FN=3D${samba_cv_HAVE_DEVICE_MINOR_FN=3Dyes}
> +samba_cv_HAVE_FCNTL_LOCK=3D${samba_cv_HAVE_FCNTL_LOCK=3Dyes}
> +samba_cv_HAVE_FTRUNCATE_EXTEND=3D${samba_cv_HAVE_FTRUNCATE_EXTEND=3Dyes=
}
> +samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> +samba_cv_HAVE_INO64_T=3D${samba_cv_HAVE_INO64_T=3Dno}
> =
+samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3D${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=
=3Dyes}
> =
+samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3D${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=
=3Dyes}
> =
+samba_cv_HAVE_KERNEL_SHARE_MODES=3D${samba_cv_HAVE_KERNEL_SHARE_MODES=3Dy=
es}
> +samba_cv_HAVE_MAKEDEV=3D${samba_cv_HAVE_MAKEDEV=3Dyes}
> +samba_cv_HAVE_MMAP=3D${samba_cv_HAVE_MMAP=3Dyes}
> +samba_cv_HAVE_OFF64_T=3D${samba_cv_HAVE_OFF64_T=3Dno}
> +samba_cv_HAVE_SECURE_MKSTEMP=3D${samba_cv_HAVE_SECURE_MKSTEMP=3Dyes}
> +samba_cv_HAVE_SENDFILE64=3D${samba_cv_HAVE_SENDFILE64=3Dyes}
> +samba_cv_HAVE_SENDFILE=3D${samba_cv_HAVE_SENDFILE=3Dyes}
> +samba_cv_HAVE_STRUCT_FLOCK64=3D${samba_cv_HAVE_STRUCT_FLOCK64=3Dyes}
> +samba_cv_HAVE_TRUNCATED_SALT=3D${samba_cv_HAVE_TRUNCATED_SALT=3Dno}
> +samba_cv_HAVE_UNSIGNED_CHAR=3D${samba_cv_HAVE_UNSIGNED_CHAR=3Dyes}
> +samba_cv_HAVE_WORKING_AF_LOCAL=3D${samba_cv_HAVE_WORKING_AF_LOCAL=3Dyes=
}
> +samba_cv_LINUX_LFS_SUPPORT=3D${samba_cv_LINUX_LFS_SUPPORT=3Dyes}
> +samba_cv_REALPATH_TAKES_NULL=3D${samba_cv_REALPATH_TAKES_NULL=3Dyes}
> +samba_cv_REPLACE_INET_NTOA=3D${samba_cv_REPLACE_INET_NTOA=3Dno}
> +samba_cv_REPLACE_READDIR=3D${samba_cv_REPLACE_READDIR=3Dno}
> +samba_cv_SIZEOF_DEV_T=3D${samba_cv_SIZEOF_DEV_T=3Dyes}
> +samba_cv_SIZEOF_INO_T=3D${samba_cv_SIZEOF_INO_T=3Dyes}
> +samba_cv_SIZEOF_OFF_T=3D${samba_cv_SIZEOF_OFF_T=3Dyes}
> +samba_cv_STAT_STATVFS64=3D${samba_cv_STAT_STATVFS64=3Dyes}
> +samba_cv_USE_SETEUID=3D${samba_cv_USE_SETEUID=3Dyes}
> +samba_cv_USE_SETRESUID=3D${samba_cv_USE_SETRESUID=3Dyes}
> +samba_cv_USE_SETREUID=3D${samba_cv_USE_SETREUID=3Dyes}
> +samba_cv_USE_SETUIDX=3D${samba_cv_USE_SETUIDX=3Dyes}
> +samba_cv_have_longlong=3D${samba_cv_have_longlong=3Dyes}
> +samba_cv_have_setresgid=3D${samba_cv_have_setresgid=3Dyes}
> +samba_cv_have_setresuid=3D${samba_cv_have_setresuid=3Dyes}
> +
> +#monotone
> +ac_cv_sync_with_stdio=3D${ac_cv_sync_with_stdio=3Dyes}=20
> +ac_cv_sync_with_stdio_2=3D${ac_cv_sync_with_stdio_2=3Dyes}
> +
> +# mysql
> +mysql_cv_func_atomic_sub=3D${mysql_cv_func_atomic_sub=3Dno}
> +mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=3Dno}
> +ac_cv_conv_longlong_to_float=3D${ac_cv_conv_longlong_to_float=3Dyes}
> +
> +# sudo
> +sudo_cv_uid_t_len=3D${sudo_cv_uid_t_len=3D10}
> +
> +# dpkg
> +dpkg_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
> +dpkg_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
> diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
> index 33ad786..5d92ecf 100644
> --- a/meta/site/powerpc32-linux
> +++ b/meta/site/powerpc32-linux
> @@ -272,9 +272,6 @@ =
samba_cv_HAVE_DEVICE_MINOR_FN=3D${samba_cv_HAVE_DEVICE_MINOR_FN=3Dyes}
> samba_cv_HAVE_FCNTL_LOCK=3D${samba_cv_HAVE_FCNTL_LOCK=3Dyes}
> samba_cv_HAVE_FTRUNCATE_EXTEND=3D${samba_cv_HAVE_FTRUNCATE_EXTEND=3Dyes}=

> samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -samba_cv_HAVE_IFACE_AIX=3D${samba_cv_HAVE_IFACE_AIX=3Dno}
> -samba_cv_HAVE_IFACE_IFCONF=3D${samba_cv_HAVE_IFACE_IFCONF=3Dyes}
> -samba_cv_HAVE_IFACE_IFREQ=3D${samba_cv_HAVE_IFACE_IFREQ=3Dyes}
> samba_cv_HAVE_INO64_T=3D${samba_cv_HAVE_INO64_T=3Dno}
> =
samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3D${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3D=
yes}
> =
samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3D${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3D=
yes}





