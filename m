Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CBD3E6A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 23:05:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 16:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,790,1367996400"; d="scan'208";a="379734093"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2013 16:05:29 -0700
Message-ID: <51F99839.4020003@linux.intel.com>
Date: Wed, 31 Jul 2013 16:05:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
	<51F9948F.1000908@linux.intel.com>
	<08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
In-Reply-To: <08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Wed, 31 Jul 2013 23:05:54 -0000
X-Groupsio-MsgNum: 42785
Content-Type: multipart/mixed; boundary="------------010403080904050705000609"

--------------010403080904050705000609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2013 03:51 PM, Khem Raj wrote:
>
> On Jul 31, 2013, at 3:49 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>>
>> Still seems to failing in Jinja, I wonder if the dependencies are correctly sinec it's nooking for native bits and the python3-native had not been installed yet.
>>
>>
>
> in my build from scratch several times, I never had this issue. Did you do an incremental build to get to this issue ?
>

Yes, most of my builds are incremental until I throw them against the 
Autobuilder!

It seems that I also got a do_package failure, seems like it might be a 
host contamination issue

> NOTE: DO PACKAGE QA
> ERROR: QA Issue: python3: The compile log indicates that host include and/or library paths were used.
>          Please check the log '/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/temp/log.do_compile' for more information.
> NOTE: Checking Package: libpython3

I attached my do_compile log.

Sau!


--------------010403080904050705000609
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile"

DEBUG: SITE files ['endian-big', 'bit-32', 'mips-common', 'common-linux', '=
common-glibc', 'mips-linux', 'common']
DEBUG: Executing shell function do_compile
Skipping: _POSIX_C_SOURCE =3D 200809L
Skipping: _POSIX_C_SOURCE =3D 199506L
Skipping: _POSIX_C_SOURCE =3D 200112L
Skipping: _POSIX_C_SOURCE =3D 200809L
Warning - could not find file stdc
Skipping: __LEAF =3D , __leaf__
Skipping: __LEAF_ATTR =3D __attribute__ ((__leaf__))
Skipping: __THROW =3D __attribute__ ((__nothrow__ __LEAF))
Skipping: __THROWNL =3D __attribute__ ((__nothrow__))
Skipping: def __NTH(fct): return __attribute__ ((__nothrow__ __LEAF)) fct

Skipping: __THROW =3D throw ()
Skipping: __THROWNL =3D throw ()
Skipping: def __NTH(fct): return __LEAF_ATTR fct throw ()

Skipping: __inline =3D=20
Skipping: __ptr_t =3D void *
Skipping: __long_double_t =3D long double
Skipping: __BEGIN_DECLS =3D extern "C" {
Skipping: __END_DECLS =3D }
Skipping: __BEGIN_NAMESPACE_STD =3D namespace std {
Skipping: __END_NAMESPACE_STD =3D }
Skipping: def __USING_NAMESPACE_STD(name): return using std::name;

Skipping: __BEGIN_NAMESPACE_C99 =3D namespace __c99 {
Skipping: __END_NAMESPACE_C99 =3D }
Skipping: def __USING_NAMESPACE_C99(name): return using __c99::name;

Skipping: __fortify_function =3D __extern_always_inline __attribute_artific=
ial__
Skipping: __attribute_malloc__ =3D __attribute__ ((__malloc__))
Skipping: __attribute_malloc__ =3D=20
Skipping: __attribute_pure__ =3D __attribute__ ((__pure__))
Skipping: __attribute_pure__ =3D=20
Skipping: __attribute_const__ =3D __attribute__ ((__const__))
Skipping: __attribute_const__ =3D=20
Skipping: __attribute_used__ =3D __attribute__ ((__used__))
Skipping: __attribute_noinline__ =3D __attribute__ ((__noinline__))
Skipping: __attribute_used__ =3D __attribute__ ((__unused__))
Skipping: __attribute_noinline__ =3D=20
Skipping: __attribute_deprecated__ =3D __attribute__ ((__deprecated__))
Skipping: __attribute_deprecated__ =3D=20
Skipping: def __nonnull(params): return __attribute__ ((__nonnull__ params)=
)

Skipping: __attribute_warn_unused_result__ =3D \
   __attribute__ ((__warn_unused_result__))
Skipping: __wur =3D __attribute_warn_unused_result__
Skipping: __attribute_warn_unused_result__ =3D=20
Skipping: __wur =3D=20
Skipping: __always_inline =3D __inline __attribute__ ((__always_inline__))
Skipping: __always_inline =3D __inline
Skipping: __attribute_artificial__ =3D __attribute__ ((__artificial__))
Skipping: __attribute_artificial__ =3D=20
Skipping: __extern_inline =3D extern __inline __attribute__ ((__gnu_inline_=
_))
Skipping: __extern_always_inline =3D \
  extern __always_inline __attribute__ ((__gnu_inline__))
Skipping: __extern_inline =3D extern __inline
Skipping: __extern_always_inline =3D extern __always_inline
Skipping: __extern_inline =3D=20
Skipping: __extern_always_inline =3D=20
Skipping: __extension__ =3D=20
Skipping: __restrict =3D=20
Skipping: __restrict_arr =3D __restrict
Skipping: __restrict_arr =3D=20
Skipping: __restrict_arr =3D restrict
Skipping: __restrict_arr =3D=20
Skipping: __WORDSIZE =3D _MIPS_SZPTR
Warning - could not find file gnu/stubs
Warning - could not find file stddef.h
Skipping: RTLD_NEXT =3D ((void *) -1l)
Skipping: RTLD_DEFAULT =3D ((void *) 0)
Warning - could not find file asm
Skipping: __kernel_daddr_t =3D __kernel_daddr_t
Skipping: __kernel_fsid_t =3D __kernel_fsid_t
Skipping: __bitwise__ =3D __attribute__((bitwise))
Skipping: __bitwise =3D __bitwise__
Skipping: __aligned_u64 =3D __u64 __attribute__((aligned(8)))
Skipping: __aligned_be64 =3D __be64 __attribute__((aligned(8)))
Skipping: __aligned_le64 =3D __le64 __attribute__((aligned(8)))
Skipping: __arch_swab16 =3D __arch_swab16
Skipping: __arch_swab32 =3D __arch_swab32
Skipping: __arch_swab64 =3D __arch_swab64
Skipping: def ___constant_swab16(x): return ((__u16)(				\

Skipping: def ___constant_swab32(x): return ((__u32)(				\

Skipping: def ___constant_swab64(x): return ((__u64)(				\

Skipping: def ___constant_swahw32(x): return ((__u32)(			\

Skipping: def ___constant_swahb32(x): return ((__u32)(			\

Skipping: def __constant_cpu_to_le64(x): return ((__le64)___constant_swab64=
((x)))

Skipping: def __constant_cpu_to_le32(x): return ((__le32)___constant_swab32=
((x)))

Skipping: def __constant_cpu_to_le16(x): return ((__le16)___constant_swab16=
((x)))

Skipping: def __cpu_to_le64(x): return ((__le64)__swab64((x)))

Skipping: def __cpu_to_le32(x): return ((__le32)__swab32((x)))

Skipping: def __cpu_to_le16(x): return ((__le16)__swab16((x)))

Skipping: def __cpu_to_be64s(x): return do { (void)(x); } while (0)

Skipping: def __be64_to_cpus(x): return do { (void)(x); } while (0)

Skipping: def __cpu_to_be32s(x): return do { (void)(x); } while (0)

Skipping: def __be32_to_cpus(x): return do { (void)(x); } while (0)

Skipping: def __cpu_to_be16s(x): return do { (void)(x); } while (0)

Skipping: def __be16_to_cpus(x): return do { (void)(x); } while (0)

Skipping: def __constant_htonl(x): return ((__be32)___constant_swab32((x)))

Skipping: def __constant_htons(x): return ((__be16)___constant_swab16((x)))

Skipping: def __constant_cpu_to_be64(x): return ((__be64)___constant_swab64=
((x)))

Skipping: def __constant_cpu_to_be32(x): return ((__be32)___constant_swab32=
((x)))

Skipping: def __constant_cpu_to_be16(x): return ((__be16)___constant_swab16=
((x)))

Skipping: def __cpu_to_be64(x): return ((__be64)__swab64((x)))

Skipping: def __cpu_to_be32(x): return ((__be32)__swab32((x)))

Skipping: def __cpu_to_be16(x): return ((__be16)__swab16((x)))

Skipping: def __cpu_to_le64s(x): return do { (void)(x); } while (0)

Skipping: def __le64_to_cpus(x): return do { (void)(x); } while (0)

Skipping: def __cpu_to_le32s(x): return do { (void)(x); } while (0)

Skipping: def __le32_to_cpus(x): return do { (void)(x); } while (0)

Skipping: def __cpu_to_le16s(x): return do { (void)(x); } while (0)

Skipping: def __le16_to_cpus(x): return do { (void)(x); } while (0)

Skipping: EDRIVE_CANT_DO_THIS =3D EOPNOTSUPP
Skipping: CDSL_NONE =3D (INT_MAX-1)
Skipping: CDSL_CURRENT =3D INT_MAX
Skipping: _POSIX_C_SOURCE =3D 200809L
Skipping: _POSIX_C_SOURCE =3D 199506L
Skipping: _POSIX_C_SOURCE =3D 200112L
Skipping: _POSIX_C_SOURCE =3D 200809L
Warning - could not find file stdc
Skipping: __LEAF =3D , __leaf__
Skipping: __LEAF_ATTR =3D __attribute__ ((__leaf__))
Skipping: __THROW =3D __attribute__ ((__nothrow__ __LEAF))
Skipping: __THROWNL =3D __attribute__ ((__nothrow__))
Skipping: def __NTH(fct): return __attribute__ ((__nothrow__ __LEAF)) fct

Skipping: __THROW =3D throw ()
Skipping: __THROWNL =3D throw ()
Skipping: def __NTH(fct): return __LEAF_ATTR fct throw ()

Skipping: __inline =3D=20
Skipping: __ptr_t =3D void *
Skipping: __long_double_t =3D long double
Skipping: __BEGIN_DECLS =3D extern "C" {
Skipping: __END_DECLS =3D }
Skipping: __BEGIN_NAMESPACE_STD =3D namespace std {
Skipping: __END_NAMESPACE_STD =3D }
Skipping: def __USING_NAMESPACE_STD(name): return using std::name;

Skipping: __BEGIN_NAMESPACE_C99 =3D namespace __c99 {
Skipping: __END_NAMESPACE_C99 =3D }
Skipping: def __USING_NAMESPACE_C99(name): return using __c99::name;

Skipping: __fortify_function =3D __extern_always_inline __attribute_artific=
ial__
Skipping: __attribute_malloc__ =3D __attribute__ ((__malloc__))
Skipping: __attribute_malloc__ =3D=20
Skipping: __attribute_pure__ =3D __attribute__ ((__pure__))
Skipping: __attribute_pure__ =3D=20
Skipping: __attribute_const__ =3D __attribute__ ((__const__))
Skipping: __attribute_const__ =3D=20
Skipping: __attribute_used__ =3D __attribute__ ((__used__))
Skipping: __attribute_noinline__ =3D __attribute__ ((__noinline__))
Skipping: __attribute_used__ =3D __attribute__ ((__unused__))
Skipping: __attribute_noinline__ =3D=20
Skipping: __attribute_deprecated__ =3D __attribute__ ((__deprecated__))
Skipping: __attribute_deprecated__ =3D=20
Skipping: def __nonnull(params): return __attribute__ ((__nonnull__ params)=
)

Skipping: __attribute_warn_unused_result__ =3D \
   __attribute__ ((__warn_unused_result__))
Skipping: __wur =3D __attribute_warn_unused_result__
Skipping: __attribute_warn_unused_result__ =3D=20
Skipping: __wur =3D=20
Skipping: __always_inline =3D __inline __attribute__ ((__always_inline__))
Skipping: __always_inline =3D __inline
Skipping: __attribute_artificial__ =3D __attribute__ ((__artificial__))
Skipping: __attribute_artificial__ =3D=20
Skipping: __extern_inline =3D extern __inline __attribute__ ((__gnu_inline_=
_))
Skipping: __extern_always_inline =3D \
  extern __always_inline __attribute__ ((__gnu_inline__))
Skipping: __extern_inline =3D extern __inline
Skipping: __extern_always_inline =3D extern __always_inline
Skipping: __extern_inline =3D=20
Skipping: __extern_always_inline =3D=20
Skipping: __extension__ =3D=20
Skipping: __restrict =3D=20
Skipping: __restrict_arr =3D __restrict
Skipping: __restrict_arr =3D=20
Skipping: __restrict_arr =3D restrict
Skipping: __restrict_arr =3D=20
Skipping: __WORDSIZE =3D _MIPS_SZPTR
Warning - could not find file gnu/stubs
Skipping: __WCHAR_MAX =3D __WCHAR_MAX__
Skipping: __WCHAR_MAX =3D (0xffffffffu + Lord('\0'))
Skipping: __WCHAR_MAX =3D (0x7fffffff + Lord('\0'))
Skipping: __WCHAR_MIN =3D __WCHAR_MIN__
Skipping: __WCHAR_MIN =3D (Lord('\0') + 0)
Skipping: __WCHAR_MIN =3D (-__WCHAR_MAX - 1)
Skipping: UINT32_MAX =3D (4294967295U)
Skipping: UINT_LEAST32_MAX =3D (4294967295U)
Skipping: INT_FAST16_MIN =3D (-9223372036854775807L-1)
Skipping: INT_FAST32_MIN =3D (-9223372036854775807L-1)
Skipping: INT_FAST16_MAX =3D (9223372036854775807L)
Skipping: INT_FAST32_MAX =3D (9223372036854775807L)
Skipping: UINT_FAST16_MAX =3D (18446744073709551615UL)
Skipping: UINT_FAST32_MAX =3D (18446744073709551615UL)
Skipping: UINT_FAST16_MAX =3D (4294967295U)
Skipping: UINT_FAST32_MAX =3D (4294967295U)
Skipping: INTPTR_MIN =3D (-9223372036854775807L-1)
Skipping: INTPTR_MAX =3D (9223372036854775807L)
Skipping: UINTPTR_MAX =3D (18446744073709551615UL)
Skipping: UINTPTR_MAX =3D (4294967295U)
Skipping: PTRDIFF_MIN =3D (-9223372036854775807L-1)
Skipping: PTRDIFF_MAX =3D (9223372036854775807L)
Skipping: SIZE_MAX =3D (18446744073709551615UL)
Skipping: SIZE_MAX =3D (4294967295U)
Skipping: WCHAR_MIN =3D __WCHAR_MIN
Skipping: WCHAR_MAX =3D __WCHAR_MAX
Skipping: WINT_MIN =3D (0u)
Skipping: WINT_MAX =3D (4294967295u)
Skipping: __S16_TYPE =3D short int
Skipping: __U16_TYPE =3D unsigned short int
Skipping: __U32_TYPE =3D unsigned int
Skipping: __SLONGWORD_TYPE =3D long int
Skipping: __ULONGWORD_TYPE =3D unsigned long int
Skipping: __SQUAD_TYPE =3D __quad_t
Skipping: __UQUAD_TYPE =3D __u_quad_t
Skipping: __UWORD_TYPE =3D unsigned int
Skipping: __SLONG32_TYPE =3D long int
Skipping: __ULONG32_TYPE =3D unsigned long int
Skipping: __S64_TYPE =3D __quad_t
Skipping: __U64_TYPE =3D __u_quad_t
Skipping: __STD_TYPE =3D __extension__ typedef
Skipping: __SQUAD_TYPE =3D long int
Skipping: __UQUAD_TYPE =3D unsigned long int
Skipping: __SWORD_TYPE =3D long int
Skipping: __UWORD_TYPE =3D unsigned long int
Skipping: __ULONG32_TYPE =3D unsigned int
Skipping: __S64_TYPE =3D long int
Skipping: __U64_TYPE =3D unsigned long int
Skipping: __STD_TYPE =3D typedef
Skipping: __DEV_T_TYPE =3D __UQUAD_TYPE
Skipping: __UID_T_TYPE =3D __U32_TYPE
Skipping: __GID_T_TYPE =3D __U32_TYPE
Skipping: __INO_T_TYPE =3D __ULONGWORD_TYPE
Skipping: __INO64_T_TYPE =3D __UQUAD_TYPE
Skipping: __MODE_T_TYPE =3D __U32_TYPE
Skipping: __NLINK_T_TYPE =3D __UWORD_TYPE
Skipping: __OFF_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __OFF64_T_TYPE =3D __SQUAD_TYPE
Skipping: __RLIM_T_TYPE =3D __ULONGWORD_TYPE
Skipping: __RLIM64_T_TYPE =3D __UQUAD_TYPE
Skipping: __BLKCNT_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __BLKCNT64_T_TYPE =3D __SQUAD_TYPE
Skipping: __FSBLKCNT_T_TYPE =3D __ULONGWORD_TYPE
Skipping: __FSBLKCNT64_T_TYPE =3D __UQUAD_TYPE
Skipping: __FSFILCNT_T_TYPE =3D __ULONGWORD_TYPE
Skipping: __FSFILCNT64_T_TYPE =3D __UQUAD_TYPE
Skipping: __ID_T_TYPE =3D __U32_TYPE
Skipping: __CLOCK_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __TIME_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __USECONDS_T_TYPE =3D __U32_TYPE
Skipping: __SUSECONDS_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __TIMER_T_TYPE =3D void *
Skipping: __BLKSIZE_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __FSID_T_TYPE =3D struct { int __val[2]; }
Skipping: __SYSCALL_SLONG_TYPE =3D __SLONGWORD_TYPE
Skipping: __SYSCALL_ULONG_TYPE =3D __ULONGWORD_TYPE
Warning - could not find file stddef.h
Skipping: CLOCKS_PER_SEC =3D 1000000l
Skipping: CLK_TCK =3D ((__clock_t) __sysconf (2))
Skipping: CLK_TCK =3D CLOCKS_PER_SEC
Warning - could not find file bits/byteswap
Skipping: _SIGSET_NWORDS =3D (1024 / (8 * sizeof (unsigned long int)))
Skipping: _EXTERN_INLINE =3D __extern_inline
Skipping: def __sigword(sig): return (((sig) - 1) / (8 * sizeof (unsigned l=
ong int)))

Skipping: __NFDBITS =3D (8 * (int) sizeof (__fd_mask))
Skipping: def __FD_MASK(d): return ((__fd_mask) 1 << ((d) % __NFDBITS))

Skipping: def __FDS_BITS(set): return ((set)->fds_bits)

Skipping: def __FDS_BITS(set): return ((set)->__fds_bits)

Skipping: NFDBITS =3D __NFDBITS
Skipping: preadv =3D preadv64
Skipping: pwritev =3D pwritev64
Skipping: SOCK_DGRAM =3D SOCK_DGRAM
Skipping: SOCK_STREAM =3D SOCK_STREAM
Skipping: SOCK_RAW =3D SOCK_RAW
Skipping: SOCK_RDM =3D SOCK_RDM
Skipping: SOCK_SEQPACKET =3D SOCK_SEQPACKET
Skipping: SOCK_DCCP =3D SOCK_DCCP
Skipping: SOCK_PACKET =3D SOCK_PACKET
Skipping: SOCK_CLOEXEC =3D SOCK_CLOEXEC
Skipping: SOCK_NONBLOCK =3D SOCK_NONBLOCK
Skipping: __SOCKADDR_COMMON_SIZE =3D (sizeof (unsigned short int))
Skipping: __ss_aligntype =3D unsigned long int
Skipping: _SS_PADSIZE =3D (_SS_SIZE - (2 * sizeof (__ss_aligntype)))
Skipping: MSG_OOB =3D MSG_OOB
Skipping: MSG_PEEK =3D MSG_PEEK
Skipping: MSG_DONTROUTE =3D MSG_DONTROUTE
Skipping: MSG_TRYHARD =3D MSG_DONTROUTE
Skipping: MSG_CTRUNC =3D MSG_CTRUNC
Skipping: MSG_PROXY =3D MSG_PROXY
Skipping: MSG_TRUNC =3D MSG_TRUNC
Skipping: MSG_DONTWAIT =3D MSG_DONTWAIT
Skipping: MSG_EOR =3D MSG_EOR
Skipping: MSG_WAITALL =3D MSG_WAITALL
Skipping: MSG_FIN =3D MSG_FIN
Skipping: MSG_SYN =3D MSG_SYN
Skipping: MSG_CONFIRM =3D MSG_CONFIRM
Skipping: MSG_RST =3D MSG_RST
Skipping: MSG_ERRQUEUE =3D MSG_ERRQUEUE
Skipping: MSG_NOSIGNAL =3D MSG_NOSIGNAL
Skipping: MSG_MORE =3D MSG_MORE
Skipping: MSG_WAITFORONE =3D MSG_WAITFORONE
Skipping: MSG_FASTOPEN =3D MSG_FASTOPEN
Skipping: MSG_CMSG_CLOEXEC =3D MSG_CMSG_CLOEXEC
Skipping: def CMSG_DATA(cmsg): return ((cmsg)->__cmsg_data)

Skipping: def CMSG_DATA(cmsg): return ((unsigned char *) ((struct cmsghdr *=
) (cmsg) + 1))

Skipping: def CMSG_ALIGN(len): return (((len) + sizeof (size_t) - 1) \

Skipping: def CMSG_SPACE(len): return (CMSG_ALIGN (len) \

Skipping: def CMSG_LEN(len): return (CMSG_ALIGN (sizeof (struct cmsghdr)) +=
 (len))

Skipping: _EXTERN_INLINE =3D __extern_inline
Skipping: SCM_RIGHTS =3D SCM_RIGHTS
Skipping: SCM_CREDENTIALS =3D SCM_CREDENTIALS
Skipping: _IOC_NONE =3D 1U
Skipping: _IOC_READ =3D 2U
Skipping: _IOC_WRITE =3D 4U
Warning - could not find file asm
Skipping: FIOGETOWN =3D _IOR(ord('f'), 123, int)
Skipping: FIOSETOWN =3D _IOW(ord('f'), 124, int)
Skipping: SIOCATMARK =3D _IOR(ord('s'), 7, int)
Skipping: SIOCSPGRP =3D _IOW(ord('s'), 8, pid_t)
Skipping: SIOCGPGRP =3D _IOR(ord('s'), 9, pid_t)
Skipping: SHUT_RD =3D SHUT_RD
Skipping: SHUT_WR =3D SHUT_WR
Skipping: SHUT_RDWR =3D SHUT_RDWR
Skipping: __SOCKADDR_ARG =3D struct sockaddr *__restrict
Skipping: __CONST_SOCKADDR_ARG =3D const struct sockaddr *
Skipping: __SOCKADDR_ALLTYPES =3D \
  __SOCKADDR_ONETYPE (sockaddr) \
  __SOCKADDR_ONETYPE (sockaddr_at) \
  __SOCKADDR_ONETYPE (sockaddr_ax25) \
  __SOCKADDR_ONETYPE (sockaddr_dl) \
  __SOCKADDR_ONETYPE (sockaddr_eon) \
  __SOCKADDR_ONETYPE (sockaddr_in) \
  __SOCKADDR_ONETYPE (sockaddr_in6) \
  __SOCKADDR_ONETYPE (sockaddr_inarp) \
  __SOCKADDR_ONETYPE (sockaddr_ipx) \
  __SOCKADDR_ONETYPE (sockaddr_iso) \
  __SOCKADDR_ONETYPE (sockaddr_ns) \
  __SOCKADDR_ONETYPE (sockaddr_un) \
  __SOCKADDR_ONETYPE (sockaddr_x25)
Skipping: def __SOCKADDR_ONETYPE(type): return struct type *__restrict __##=
type##__;

Skipping: def __SOCKADDR_ONETYPE(type): return const struct type *__restric=
t __##type##__;

Skipping: IPPROTO_IP =3D IPPROTO_IP
Skipping: IPPROTO_HOPOPTS =3D IPPROTO_HOPOPTS
Skipping: IPPROTO_ICMP =3D IPPROTO_ICMP
Skipping: IPPROTO_IGMP =3D IPPROTO_IGMP
Skipping: IPPROTO_IPIP =3D IPPROTO_IPIP
Skipping: IPPROTO_TCP =3D IPPROTO_TCP
Skipping: IPPROTO_EGP =3D IPPROTO_EGP
Skipping: IPPROTO_PUP =3D IPPROTO_PUP
Skipping: IPPROTO_UDP =3D IPPROTO_UDP
Skipping: IPPROTO_IDP =3D IPPROTO_IDP
Skipping: IPPROTO_TP =3D IPPROTO_TP
Skipping: IPPROTO_DCCP =3D IPPROTO_DCCP
Skipping: IPPROTO_IPV6 =3D IPPROTO_IPV6
Skipping: IPPROTO_ROUTING =3D IPPROTO_ROUTING
Skipping: IPPROTO_FRAGMENT =3D IPPROTO_FRAGMENT
Skipping: IPPROTO_RSVP =3D IPPROTO_RSVP
Skipping: IPPROTO_GRE =3D IPPROTO_GRE
Skipping: IPPROTO_ESP =3D IPPROTO_ESP
Skipping: IPPROTO_AH =3D IPPROTO_AH
Skipping: IPPROTO_ICMPV6 =3D IPPROTO_ICMPV6
Skipping: IPPROTO_NONE =3D IPPROTO_NONE
Skipping: IPPROTO_DSTOPTS =3D IPPROTO_DSTOPTS
Skipping: IPPROTO_MTP =3D IPPROTO_MTP
Skipping: IPPROTO_ENCAP =3D IPPROTO_ENCAP
Skipping: IPPROTO_PIM =3D IPPROTO_PIM
Skipping: IPPROTO_COMP =3D IPPROTO_COMP
Skipping: IPPROTO_SCTP =3D IPPROTO_SCTP
Skipping: IPPROTO_UDPLITE =3D IPPROTO_UDPLITE
Skipping: IPPROTO_RAW =3D IPPROTO_RAW
Skipping: INADDR_ANY =3D ((in_addr_t) 0x00000000)
Skipping: INADDR_BROADCAST =3D ((in_addr_t) 0xffffffff)
Skipping: INADDR_NONE =3D ((in_addr_t) 0xffffffff)
Skipping: INADDR_LOOPBACK =3D ((in_addr_t) 0x7f000001)
Skipping: INADDR_UNSPEC_GROUP =3D ((in_addr_t) 0xe0000000)
Skipping: INADDR_ALLHOSTS_GROUP =3D ((in_addr_t) 0xe0000001)
Skipping: INADDR_ALLRTRS_GROUP =3D ((in_addr_t) 0xe0000002)
Skipping: INADDR_MAX_LOCAL_GROUP =3D ((in_addr_t) 0xe00000ff)
Skipping: s6_addr =3D __in6_u.__u6_addr8
Skipping: s6_addr16 =3D __in6_u.__u6_addr16
Skipping: s6_addr32 =3D __in6_u.__u6_addr32
Skipping: IN6ADDR_ANY_INIT =3D { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 } } }
Skipping: IN6ADDR_LOOPBACK_INIT =3D { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1 }=
 } }
Skipping: def IP_MSFILTER_SIZE(numsrc): return (sizeof (struct ip_msfilter)=
 \

Skipping: def GROUP_FILTER_SIZE(numsrc): return (sizeof (struct group_filte=
r) \

Skipping: IP_RECVRETOPTS =3D IP_RETOPTS
Skipping: SCM_SRCRT =3D IPV6_RXSRCRT
Skipping: def IN6_IS_ADDR_MULTICAST(a): return (((const uint8_t *) (a))[0] =
=3D=3D 0xff)

Skipping: _POSIX_C_SOURCE =3D 200809L
Skipping: _POSIX_C_SOURCE =3D 199506L
Skipping: _POSIX_C_SOURCE =3D 200112L
Skipping: _POSIX_C_SOURCE =3D 200809L
Warning - could not find file stdc
Skipping: __LEAF =3D , __leaf__
Skipping: __LEAF_ATTR =3D __attribute__ ((__leaf__))
Skipping: __THROW =3D __attribute__ ((__nothrow__ __LEAF))
Skipping: __THROWNL =3D __attribute__ ((__nothrow__))
Skipping: def __NTH(fct): return __attribute__ ((__nothrow__ __LEAF)) fct

Skipping: __THROW =3D throw ()
Skipping: __THROWNL =3D throw ()
Skipping: def __NTH(fct): return __LEAF_ATTR fct throw ()

Skipping: __inline =3D=20
Skipping: __ptr_t =3D void *
Skipping: __long_double_t =3D long double
Skipping: __BEGIN_DECLS =3D extern "C" {
Skipping: __END_DECLS =3D }
Skipping: __BEGIN_NAMESPACE_STD =3D namespace std {
Skipping: __END_NAMESPACE_STD =3D }
Skipping: def __USING_NAMESPACE_STD(name): return using std::name;

Skipping: __BEGIN_NAMESPACE_C99 =3D namespace __c99 {
Skipping: __END_NAMESPACE_C99 =3D }
Skipping: def __USING_NAMESPACE_C99(name): return using __c99::name;

Skipping: __fortify_function =3D __extern_always_inline __attribute_artific=
ial__
Skipping: __attribute_malloc__ =3D __attribute__ ((__malloc__))
Skipping: __attribute_malloc__ =3D=20
Skipping: __attribute_pure__ =3D __attribute__ ((__pure__))
Skipping: __attribute_pure__ =3D=20
Skipping: __attribute_const__ =3D __attribute__ ((__const__))
Skipping: __attribute_const__ =3D=20
Skipping: __attribute_used__ =3D __attribute__ ((__used__))
Skipping: __attribute_noinline__ =3D __attribute__ ((__noinline__))
Skipping: __attribute_used__ =3D __attribute__ ((__unused__))
Skipping: __attribute_noinline__ =3D=20
Skipping: __attribute_deprecated__ =3D __attribute__ ((__deprecated__))
Skipping: __attribute_deprecated__ =3D=20
Skipping: def __nonnull(params): return __attribute__ ((__nonnull__ params)=
)

Skipping: __attribute_warn_unused_result__ =3D \
   __attribute__ ((__warn_unused_result__))
Skipping: __wur =3D __attribute_warn_unused_result__
Skipping: __attribute_warn_unused_result__ =3D=20
Skipping: __wur =3D=20
Skipping: __always_inline =3D __inline __attribute__ ((__always_inline__))
Skipping: __always_inline =3D __inline
Skipping: __attribute_artificial__ =3D __attribute__ ((__artificial__))
Skipping: __attribute_artificial__ =3D=20
Skipping: __extern_inline =3D extern __inline __attribute__ ((__gnu_inline_=
_))
Skipping: __extern_always_inline =3D \
  extern __always_inline __attribute__ ((__gnu_inline__))
Skipping: __extern_inline =3D extern __inline
Skipping: __extern_always_inline =3D extern __always_inline
Skipping: __extern_inline =3D=20
Skipping: __extern_always_inline =3D=20
Skipping: __extension__ =3D=20
Skipping: __restrict =3D=20
Skipping: __restrict_arr =3D __restrict
Skipping: __restrict_arr =3D=20
Skipping: __restrict_arr =3D restrict
Skipping: __restrict_arr =3D=20
Skipping: __WORDSIZE =3D _MIPS_SZPTR
Warning - could not find file gnu/stubs
Skipping: __S16_TYPE =3D short int
Skipping: __U16_TYPE =3D unsigned short int
Skipping: __U32_TYPE =3D unsigned int
Skipping: __SLONGWORD_TYPE =3D long int
Skipping: __ULONGWORD_TYPE =3D unsigned long int
Skipping: __SQUAD_TYPE =3D __quad_t
Skipping: __UQUAD_TYPE =3D __u_quad_t
Skipping: __UWORD_TYPE =3D unsigned int
Skipping: __SLONG32_TYPE =3D long int
Skipping: __ULONG32_TYPE =3D unsigned long int
Skipping: __S64_TYPE =3D __quad_t
Skipping: __U64_TYPE =3D __u_quad_t
Skipping: __STD_TYPE =3D __extension__ typedef
Skipping: __SQUAD_TYPE =3D long int
Skipping: __UQUAD_TYPE =3D unsigned long int
Skipping: __SWORD_TYPE =3D long int
Skipping: __UWORD_TYPE =3D unsigned long int
Skipping: __ULONG32_TYPE =3D unsigned int
Skipping: __S64_TYPE =3D long int
Skipping: __U64_TYPE =3D unsigned long int
Skipping: __STD_TYPE =3D typedef
Skipping: __DEV_T_TYPE =3D __UQUAD_TYPE
Skipping: __UID_T_TYPE =3D __U32_TYPE
Skipping: __GID_T_TYPE =3D __U32_TYPE
Skipping: __INO_T_TYPE =3D __ULONGWORD_TYPE
Skipping: __INO64_T_TYPE =3D __UQUAD_TYPE
Skipping: __MODE_T_TYPE =3D __U32_TYPE
Skipping: __NLINK_T_TYPE =3D __UWORD_TYPE
Skipping: __OFF_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __OFF64_T_TYPE =3D __SQUAD_TYPE
Skipping: __RLIM_T_TYPE =3D __ULONGWORD_TYPE
Skipping: __RLIM64_T_TYPE =3D __UQUAD_TYPE
Skipping: __BLKCNT_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __BLKCNT64_T_TYPE =3D __SQUAD_TYPE
Skipping: __FSBLKCNT_T_TYPE =3D __ULONGWORD_TYPE
Skipping: __FSBLKCNT64_T_TYPE =3D __UQUAD_TYPE
Skipping: __FSFILCNT_T_TYPE =3D __ULONGWORD_TYPE
Skipping: __FSFILCNT64_T_TYPE =3D __UQUAD_TYPE
Skipping: __ID_T_TYPE =3D __U32_TYPE
Skipping: __CLOCK_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __TIME_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __USECONDS_T_TYPE =3D __U32_TYPE
Skipping: __SUSECONDS_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __TIMER_T_TYPE =3D void *
Skipping: __BLKSIZE_T_TYPE =3D __SLONGWORD_TYPE
Skipping: __FSID_T_TYPE =3D struct { int __val[2]; }
Skipping: __SYSCALL_SLONG_TYPE =3D __SLONGWORD_TYPE
Skipping: __SYSCALL_ULONG_TYPE =3D __ULONGWORD_TYPE
Warning - could not find file stddef.h
Skipping: CLOCKS_PER_SEC =3D 1000000l
Skipping: CLK_TCK =3D ((__clock_t) __sysconf (2))
Skipping: CLK_TCK =3D CLOCKS_PER_SEC
Warning - could not find file bits/byteswap
Skipping: _SIGSET_NWORDS =3D (1024 / (8 * sizeof (unsigned long int)))
Skipping: _EXTERN_INLINE =3D __extern_inline
Skipping: def __sigword(sig): return (((sig) - 1) / (8 * sizeof (unsigned l=
ong int)))

Skipping: __NFDBITS =3D (8 * (int) sizeof (__fd_mask))
Skipping: def __FD_MASK(d): return ((__fd_mask) 1 << ((d) % __NFDBITS))

Skipping: def __FDS_BITS(set): return ((set)->fds_bits)

Skipping: def __FDS_BITS(set): return ((set)->__fds_bits)

Skipping: NFDBITS =3D __NFDBITS
/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-=
3.3.2
NOTE: make -j 16 CROSS_COMPILE=3Dyes HOSTPGEN=3D/srv/hdd/builds/world/tmp/s=
ysroots/x86_64-linux/usr/bin/python3-native/pgen HOSTPYTHON=3D/srv/hdd/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/bin/python3-native/python3 STAGING_L=
IBDIR=3D/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib STAGING_BASELIB=
DIR=3D/srv/hdd/builds/world/tmp/sysroots/qemumips/lib STAGING_INCDIR=3D/srv=
/hdd/builds/world/tmp/sysroots/qemumips/usr/include BUILD_SYS=3Dx86_64-linu=
x HOST_SYS=3Dmips-poky-linux LIB=3Dlib ARCH=3Dmips OPT=3D -O2 -pipe -g -fel=
iminate-unused-debug-types libpython3.so
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/acceler.o Parser=
/acceler.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/grammar1.o Parse=
r/grammar1.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/listnode.o Parse=
r/listnode.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/node.o Parser/no=
de.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/parser.o Parser/=
parser.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/bitset.o Parser/=
bitset.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/metagrammar.o Pa=
rser/metagrammar.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/firstsets.o Pars=
er/firstsets.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/grammar.o Parser=
/grammar.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/pgen.o Parser/pg=
en.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/myreadline.o Par=
ser/myreadline.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/parsetok.o Parse=
r/parsetok.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/tokenizer.o Pars=
er/tokenizer.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/abstract.o Obje=
cts/abstract.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/accu.o Objects/=
accu.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/boolobject.o Ob=
jects/boolobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/bytes_methods.o=
 Objects/bytes_methods.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/bytearrayobject=
.o Objects/bytearrayobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/bytesobject.o O=
bjects/bytesobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/cellobject.o Ob=
jects/cellobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/classobject.o O=
bjects/classobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/codeobject.o Ob=
jects/codeobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/complexobject.o=
 Objects/complexobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/descrobject.o O=
bjects/descrobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/enumobject.o Ob=
jects/enumobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/exceptions.o Ob=
jects/exceptions.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/genobject.o Obj=
ects/genobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/fileobject.o Ob=
jects/fileobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/floatobject.o O=
bjects/floatobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/frameobject.o O=
bjects/frameobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/funcobject.o Ob=
jects/funcobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/iterobject.o Ob=
jects/iterobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/listobject.o Ob=
jects/listobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/longobject.o Ob=
jects/longobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/dictobject.o Ob=
jects/dictobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/memoryobject.o =
Objects/memoryobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/methodobject.o =
Objects/methodobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/moduleobject.o =
Objects/moduleobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/namespaceobject=
.o Objects/namespaceobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/object.o Object=
s/object.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/obmalloc.o Obje=
cts/obmalloc.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/capsule.o Objec=
ts/capsule.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/rangeobject.o O=
bjects/rangeobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/setobject.o Obj=
ects/setobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/sliceobject.o O=
bjects/sliceobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/structseq.o Obj=
ects/structseq.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/tupleobject.o O=
bjects/tupleobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/typeobject.o Ob=
jects/typeobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/unicodeobject.o=
 Objects/unicodeobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/unicodectype.o =
Objects/unicodectype.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Objects/weakrefobject.o=
 Objects/weakrefobject.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/_warnings.o Pyth=
on/_warnings.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/Python-ast.o Pyt=
hon/Python-ast.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/asdl.o Python/as=
dl.c
make Parser/pgen
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/bltinmodule.o Py=
thon/bltinmodule.c
make[1]: Entering directory `/srv/hdd/builds/world/tmp/work/mips32-poky-lin=
ux/python3/3.3.2-r0.0/Python-3.3.2'
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/dynamic_annotati=
ons.o Python/dynamic_annotations.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/mysnprintf.o Pyt=
hon/mysnprintf.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/ceval.o Python/c=
eval.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/codecs.o Python/=
codecs.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/errors.o Python/=
errors.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/frozenmain.o Pyt=
hon/frozenmain.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/pyctype.o Python=
/pyctype.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/tokenizer_pgen.o=
 Parser/tokenizer_pgen.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/future.o Python/=
future.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/getargs.o Python=
/getargs.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/getcompiler.o Py=
thon/getcompiler.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/printgrammar.o P=
arser/printgrammar.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/getcopyright.o P=
ython/getcopyright.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -DPLATFORM=3D'"linux"' -DA=
RCH=3D'"mips"' -DLIB=3D'"lib"' -o Python/getplatform.o ./Python/getplatform=
.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/getversion.o Pyt=
hon/getversion.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/import.o Python/=
import.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -I. -o Python/importdl.o .=
/Python/importdl.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/marshal.o Python=
/marshal.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/modsupport.o Pyt=
hon/modsupport.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/parsetok_pgen.o =
Parser/parsetok_pgen.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/mystrtoul.o Pyth=
on/mystrtoul.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/peephole.o Pytho=
n/peephole.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Parser/pgenmain.o Parse=
r/pgenmain.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/pyarena.o Python=
/pyarena.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/pyfpe.o Python/p=
yfpe.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/pymath.o Python/=
pymath.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/pystate.o Python=
/pystate.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/pythonrun.o Pyth=
on/pythonrun.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/pytime.o Python/=
pytime.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/random.o Python/=
random.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -O2 -pi=
pe -g -feliminate-unused-debug-types -Wl,-O1  -Wl,--as-needed -Wl,-O1  -Wl,=
--as-needed Parser/acceler.o Parser/grammar1.o Parser/listnode.o Parser/nod=
e.o Parser/parser.o Parser/bitset.o Parser/metagrammar.o Parser/firstsets.o=
 Parser/grammar.o Parser/pgen.o Objects/obmalloc.o Python/dynamic_annotatio=
ns.o Python/mysnprintf.o Python/pyctype.o Parser/tokenizer_pgen.o Parser/pr=
intgrammar.o Parser/parsetok_pgen.o Parser/pgenmain.o -lpthread -ldl  -lpth=
read -lutil -o Parser/pgen
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/structmember.o P=
ython/structmember.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE \
		-DABIFLAGS=3D'"m"' \
		-o Python/sysmodule.o ./Python/sysmodule.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/traceback.o Pyth=
on/traceback.c
make[1]: Leaving directory `/srv/hdd/builds/world/tmp/work/mips32-poky-linu=
x/python3/3.3.2-r0.0/Python-3.3.2'
/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/bin/python3-native/pgen=
 ./Grammar/Grammar Include/graminit.h Python/graminit.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/getopt.o Python/=
getopt.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/pystrcmp.o Pytho=
n/pystrcmp.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/pystrtod.o Pytho=
n/pystrtod.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/dtoa.o Python/dt=
oa.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/formatter_unicod=
e.o Python/formatter_unicode.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/fileutils.o Pyth=
on/fileutils.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE \
		-DSOABI=3D'"cpython-33m"' \
		-o Python/dynload_shlib.o ./Python/dynload_shlib.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/thread.o Python/=
thread.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Modules/config.o Module=
s/config.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -DPYTHONPATH=3D'":plat-lin=
ux"' \
		-DPREFIX=3D'"/usr"' \
		-DEXEC_PREFIX=3D'"/usr"' \
		-DVERSION=3D'"3.3"' \
		-DVPATH=3D'""' \
		-DARCH=3D'"mips"' -DLIB=3D'"lib"' \
		-o Modules/getpath.o ./Modules/getpath.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Modules/main.o Modules/=
main.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Modules/gcmodule.o Modu=
les/gcmodule.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/_threadmodule.c=
 -o Modules/_threadmodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/signalmodule.c =
-o Modules/signalmodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/posixmodule.c -=
o Modules/posixmodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/errnomodule.c -=
o Modules/errnomodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/pwdmodule.c -o =
Modules/pwdmodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/_sre.c -o Modul=
es/_sre.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/_codecsmodule.c=
 -o Modules/_codecsmodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/_weakref.c -o M=
odules/_weakref.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/_functoolsmodul=
e.c -o Modules/_functoolsmodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/operator.c -o M=
odules/operator.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/_collectionsmod=
ule.c -o Modules/_collectionsmodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/itertoolsmodule=
.c -o Modules/itertoolsmodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/_localemodule.c=
 -o Modules/_localemodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -I./Modules/_io -c ./Modules=
/_io/_iomodule.c -o Modules/_iomodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -I./Modules/_io -c ./Modules=
/_io/iobase.c -o Modules/iobase.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -I./Modules/_io -c ./Modules=
/_io/fileio.c -o Modules/fileio.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -I./Modules/_io -c ./Modules=
/_io/bytesio.c -o Modules/bytesio.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -I./Modules/_io -c ./Modules=
/_io/bufferedio.c -o Modules/bufferedio.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -I./Modules/_io -c ./Modules=
/_io/textio.c -o Modules/textio.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -I./Modules/_io -c ./Modules=
/_io/stringio.c -o Modules/stringio.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/zipimport.c -o =
Modules/zipimport.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/faulthandler.c =
-o Modules/faulthandler.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/symtablemodule.=
c -o Modules/symtablemodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/zlibmodule.c -o=
 Modules/zlibmodule.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wno-un=
used-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -felim=
inate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -I. =
-IInclude -I./Include   -fPIC -DPy_BUILD_CORE  -c ./Modules/xxsubtype.c -o =
Modules/xxsubtype.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/frozen.o Python/=
frozen.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/ast.o Python/ast=
.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/compile.o Python=
/compile.c
make Include/graminit.h
make[1]: Entering directory `/srv/hdd/builds/world/tmp/work/mips32-poky-lin=
ux/python3/3.3.2-r0.0/Python-3.3.2'
make[1]: `Include/graminit.h' is up to date.
make[1]: Leaving directory `/srv/hdd/builds/world/tmp/work/mips32-poky-linu=
x/python3/3.3.2-r0.0/Python-3.3.2'
touch Python/graminit.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/symtable.o Pytho=
n/symtable.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Python/graminit.o Pytho=
n/graminit.c
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE \
	      -DHGVERSION=3D"\"`LC_ALL=3DC `\"" \
	      -DHGTAG=3D"\"`LC_ALL=3DC `\"" \
	      -DHGBRANCH=3D"\"`LC_ALL=3DC `\"" \
	      -o Modules/getbuildinfo.o ./Modules/getbuildinfo.c
if test libpython3.3m.so.1.0 !=3D libpython3.3m.so; then \
		mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBU=
G -fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shar=
ed -Wl,-O1  -Wl,--as-needed -Wl,-O1  -Wl,--as-needed -Wl,-hlibpython3.3m.so=
.1.0 -o libpython3.3m.so.1.0 Modules/getbuildinfo.o Parser/acceler.o Parser=
/grammar1.o Parser/listnode.o Parser/node.o Parser/parser.o Parser/bitset.o=
 Parser/metagrammar.o Parser/firstsets.o Parser/grammar.o Parser/pgen.o Par=
ser/myreadline.o Parser/parsetok.o Parser/tokenizer.o Objects/abstract.o Ob=
jects/accu.o Objects/boolobject.o Objects/bytes_methods.o Objects/bytearray=
object.o Objects/bytesobject.o Objects/cellobject.o Objects/classobject.o O=
bjects/codeobject.o Objects/complexobject.o Objects/descrobject.o Objects/e=
numobject.o Objects/exceptions.o Objects/genobject.o Objects/fileobject.o O=
bjects/floatobject.o Objects/frameobject.o Objects/funcobject.o Objects/ite=
robject.o Objects/listobject.o Objects/longobject.o Objects/dictobject.o Ob=
jects/memoryobject.o Objects/methodobject.o Objects/moduleobject.o Objects/=
namespaceobject.o Objects/object.o Objects/obmalloc.o Objects/capsule.o Obj=
ects/rangeobject.o Objects/setobject.o Objects/sliceobject.o Objects/struct=
seq.o Objects/tupleobject.o Objects/typeobject.o Objects/unicodeobject.o Ob=
jects/unicodectype.o Objects/weakrefobject.o Python/_warnings.o Python/Pyth=
on-ast.o Python/asdl.o Python/ast.o Python/bltinmodule.o Python/ceval.o Pyt=
hon/compile.o Python/codecs.o Python/dynamic_annotations.o Python/errors.o =
Python/frozenmain.o Python/future.o Python/getargs.o Python/getcompiler.o P=
ython/getcopyright.o Python/getplatform.o Python/getversion.o Python/gramin=
it.o Python/import.o Python/importdl.o Python/marshal.o Python/modsupport.o=
 Python/mystrtoul.o Python/mysnprintf.o Python/peephole.o Python/pyarena.o =
Python/pyctype.o Python/pyfpe.o Python/pymath.o Python/pystate.o Python/pyt=
honrun.o Python/pytime.o Python/random.o Python/structmember.o Python/symta=
ble.o Python/sysmodule.o Python/traceback.o Python/getopt.o Python/pystrcmp=
.o Python/pystrtod.o Python/dtoa.o Python/formatter_unicode.o Python/fileut=
ils.o Python/dynload_shlib.o   Python/thread.o Modules/config.o Modules/get=
path.o Modules/main.o Modules/gcmodule.o  Modules/_threadmodule.o  Modules/=
signalmodule.o  Modules/posixmodule.o  Modules/errnomodule.o  Modules/pwdmo=
dule.o  Modules/_sre.o  Modules/_codecsmodule.o  Modules/_weakref.o  Module=
s/_functoolsmodule.o  Modules/operator.o  Modules/_collectionsmodule.o  Mod=
ules/itertoolsmodule.o  Modules/_localemodule.o  Modules/_iomodule.o Module=
s/iobase.o Modules/fileio.o Modules/bytesio.o Modules/bufferedio.o Modules/=
textio.o Modules/stringio.o  Modules/zipimport.o  Modules/faulthandler.o  M=
odules/symtablemodule.o  Modules/zlibmodule.o  Modules/xxsubtype.o Python/f=
rozen.o -lz   -lpthread -ldl  -lpthread -lutil  -lm ; \
		ln -f libpython3.3m.so.1.0 libpython3.3m.so; \
	else \
		mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBU=
G -fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shar=
ed -Wl,-O1  -Wl,--as-needed -Wl,-O1  -Wl,--as-needed -o libpython3.3m.so Mo=
dules/getbuildinfo.o Parser/acceler.o Parser/grammar1.o Parser/listnode.o P=
arser/node.o Parser/parser.o Parser/bitset.o Parser/metagrammar.o Parser/fi=
rstsets.o Parser/grammar.o Parser/pgen.o Parser/myreadline.o Parser/parseto=
k.o Parser/tokenizer.o Objects/abstract.o Objects/accu.o Objects/boolobject=
.o Objects/bytes_methods.o Objects/bytearrayobject.o Objects/bytesobject.o =
Objects/cellobject.o Objects/classobject.o Objects/codeobject.o Objects/com=
plexobject.o Objects/descrobject.o Objects/enumobject.o Objects/exceptions.=
o Objects/genobject.o Objects/fileobject.o Objects/floatobject.o Objects/fr=
ameobject.o Objects/funcobject.o Objects/iterobject.o Objects/listobject.o =
Objects/longobject.o Objects/dictobject.o Objects/memoryobject.o Objects/me=
thodobject.o Objects/moduleobject.o Objects/namespaceobject.o Objects/objec=
t.o Objects/obmalloc.o Objects/capsule.o Objects/rangeobject.o Objects/seto=
bject.o Objects/sliceobject.o Objects/structseq.o Objects/tupleobject.o Obj=
ects/typeobject.o Objects/unicodeobject.o Objects/unicodectype.o Objects/we=
akrefobject.o Python/_warnings.o Python/Python-ast.o Python/asdl.o Python/a=
st.o Python/bltinmodule.o Python/ceval.o Python/compile.o Python/codecs.o P=
ython/dynamic_annotations.o Python/errors.o Python/frozenmain.o Python/futu=
re.o Python/getargs.o Python/getcompiler.o Python/getcopyright.o Python/get=
platform.o Python/getversion.o Python/graminit.o Python/import.o Python/imp=
ortdl.o Python/marshal.o Python/modsupport.o Python/mystrtoul.o Python/mysn=
printf.o Python/peephole.o Python/pyarena.o Python/pyctype.o Python/pyfpe.o=
 Python/pymath.o Python/pystate.o Python/pythonrun.o Python/pytime.o Python=
/random.o Python/structmember.o Python/symtable.o Python/sysmodule.o Python=
/traceback.o Python/getopt.o Python/pystrcmp.o Python/pystrtod.o Python/dto=
a.o Python/formatter_unicode.o Python/fileutils.o Python/dynload_shlib.o   =
Python/thread.o Modules/config.o Modules/getpath.o Modules/main.o Modules/g=
cmodule.o  Modules/_threadmodule.o  Modules/signalmodule.o  Modules/posixmo=
dule.o  Modules/errnomodule.o  Modules/pwdmodule.o  Modules/_sre.o  Modules=
/_codecsmodule.o  Modules/_weakref.o  Modules/_functoolsmodule.o  Modules/o=
perator.o  Modules/_collectionsmodule.o  Modules/itertoolsmodule.o  Modules=
/_localemodule.o  Modules/_iomodule.o Modules/iobase.o Modules/fileio.o Mod=
ules/bytesio.o Modules/bufferedio.o Modules/textio.o Modules/stringio.o  Mo=
dules/zipimport.o  Modules/faulthandler.o  Modules/symtablemodule.o  Module=
s/zlibmodule.o  Modules/xxsubtype.o Python/frozen.o -lz   -lpthread -ldl  -=
lpthread -lutil  -lm ; \
	fi
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared=
 -Wl,-O1  -Wl,--as-needed -Wl,-O1  -Wl,--as-needed -Wl,--no-as-needed -o li=
bpython3.so -Wl,-hlibpython3.so libpython3.3m.so
oe_libinstall: cd /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/=
3.3.2-r0.0/Python-3.3.2
oe_libinstall: install -d /srv/hdd/builds/world/tmp/sysroots/qemumips/usr/l=
ib/
oe_libinstall: install -m 0755 libpython3.3m.so /srv/hdd/builds/world/tmp/s=
ysroots/qemumips/usr/lib/
oe_libinstall: install -m 0755 libpython3.3m.so.1.0 /srv/hdd/builds/world/t=
mp/sysroots/qemumips/usr/lib/
oe_libinstall: ln -sf libpython3.3m.so.1.0 /srv/hdd/builds/world/tmp/sysroo=
ts/qemumips/usr/lib/libpython3.3m.so
oe_libinstall: cd /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/=
3.3.2-r0.0/Python-3.3.2
NOTE: make -j 16 CROSS_COMPILE=3Dyes HOSTPGEN=3D/srv/hdd/builds/world/tmp/s=
ysroots/x86_64-linux/usr/bin/python-native3/pgen HOSTPYTHON=3D/srv/hdd/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/bin/python-native3/python3 STAGING_L=
IBDIR=3D/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib STAGING_INCDIR=
=3D/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include STAGING_BASELIBD=
IR=3D/srv/hdd/builds/world/tmp/sysroots/qemumips/lib BUILD_SYS=3Dx86_64-lin=
ux HOST_SYS=3Dmips-poky-linux LIB=3Dlib ARCH=3Dmips OPT=3D -O2 -pipe -g -fe=
liminate-unused-debug-types
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Modules/python.o ./Modu=
les/python.c
rm -f libpython3.3m.a
/usr/bin/install -c -m 644 ./Tools/gdb/libpython.py python-gdb.py
mips-poky-linux-ar rc libpython3.3m.a Modules/getbuildinfo.o
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -c -Wno=
-unused-result -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types   -=
I. -IInclude -I./Include   -fPIC -DPy_BUILD_CORE -o Modules/_testembed.o ./=
Modules/_testembed.c
mips-poky-linux-ar rc libpython3.3m.a Parser/acceler.o Parser/grammar1.o Pa=
rser/listnode.o Parser/node.o Parser/parser.o Parser/bitset.o Parser/metagr=
ammar.o Parser/firstsets.o Parser/grammar.o Parser/pgen.o Parser/myreadline=
.o Parser/parsetok.o Parser/tokenizer.o
mips-poky-linux-ar rc libpython3.3m.a Objects/abstract.o Objects/accu.o Obj=
ects/boolobject.o Objects/bytes_methods.o Objects/bytearrayobject.o Objects=
/bytesobject.o Objects/cellobject.o Objects/classobject.o Objects/codeobjec=
t.o Objects/complexobject.o Objects/descrobject.o Objects/enumobject.o Obje=
cts/exceptions.o Objects/genobject.o Objects/fileobject.o Objects/floatobje=
ct.o Objects/frameobject.o Objects/funcobject.o Objects/iterobject.o Object=
s/listobject.o Objects/longobject.o Objects/dictobject.o Objects/memoryobje=
ct.o Objects/methodobject.o Objects/moduleobject.o Objects/namespaceobject.=
o Objects/object.o Objects/obmalloc.o Objects/capsule.o Objects/rangeobject=
.o Objects/setobject.o Objects/sliceobject.o Objects/structseq.o Objects/tu=
pleobject.o Objects/typeobject.o Objects/unicodeobject.o Objects/unicodecty=
pe.o Objects/weakrefobject.o
mips-poky-linux-ar rc libpython3.3m.a Python/_warnings.o Python/Python-ast.=
o Python/asdl.o Python/ast.o Python/bltinmodule.o Python/ceval.o Python/com=
pile.o Python/codecs.o Python/dynamic_annotations.o Python/errors.o Python/=
frozenmain.o Python/future.o Python/getargs.o Python/getcompiler.o Python/g=
etcopyright.o Python/getplatform.o Python/getversion.o Python/graminit.o Py=
thon/import.o Python/importdl.o Python/marshal.o Python/modsupport.o Python=
/mystrtoul.o Python/mysnprintf.o Python/peephole.o Python/pyarena.o Python/=
pyctype.o Python/pyfpe.o Python/pymath.o Python/pystate.o Python/pythonrun.=
o Python/pytime.o Python/random.o Python/structmember.o Python/symtable.o P=
ython/sysmodule.o Python/traceback.o Python/getopt.o Python/pystrcmp.o Pyth=
on/pystrtod.o Python/dtoa.o Python/formatter_unicode.o Python/fileutils.o P=
ython/dynload_shlib.o   Python/thread.o Python/frozen.o
mips-poky-linux-ar rc libpython3.3m.a Modules/config.o Modules/getpath.o Mo=
dules/main.o Modules/gcmodule.o=20
mips-poky-linux-ar rc libpython3.3m.a Modules/_threadmodule.o  Modules/sign=
almodule.o  Modules/posixmodule.o  Modules/errnomodule.o  Modules/pwdmodule=
.o  Modules/_sre.o  Modules/_codecsmodule.o  Modules/_weakref.o  Modules/_f=
unctoolsmodule.o  Modules/operator.o  Modules/_collectionsmodule.o  Modules=
/itertoolsmodule.o  Modules/_localemodule.o  Modules/_iomodule.o Modules/io=
base.o Modules/fileio.o Modules/bytesio.o Modules/bufferedio.o Modules/text=
io.o Modules/stringio.o  Modules/zipimport.o  Modules/faulthandler.o  Modul=
es/symtablemodule.o  Modules/zlibmodule.o  Modules/xxsubtype.o
mips-poky-linux-ranlib libpython3.3m.a
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wl,-O1=
  -Wl,--as-needed -Wl,-O1  -Wl,--as-needed -Xlinker -export-dynamic -o pyth=
on Modules/python.o -L. -lpython3.3m -lpthread -ldl  -lpthread -lutil -lz  =
 -lm =20
mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG =
-fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -Wl,-O1=
  -Wl,--as-needed -Wl,-O1  -Wl,--as-needed -Xlinker -export-dynamic -o Modu=
les/_testembed Modules/_testembed.o -L. -lpython3.3m -lpthread -ldl  -lpthr=
ead -lutil -lz   -lm =20
_PYTHON_PROJECT_BASE=3D/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyt=
hon3/3.3.2-r0.0/Python-3.3.2 _PYTHON_HOST_PLATFORM=3Dlinux-mips PYTHONPATH=
=3D./Lib:./Lib/plat-linux python3.3 -S -m sysconfig --generate-posix-vars
running build
running build_ext
INFO: Can't locate Tcl/Tk libs and/or headers
building '_struct' extension
creating build/temp.linux-mips-3.3/srv
creating build/temp.linux-mips-3.3/srv/hdd
creating build/temp.linux-mips-3.3/srv/hdd/builds
creating build/temp.linux-mips-3.3/srv/hdd/builds/world
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_struct.c -o build/temp.linu=
x-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Modules/_struct.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_struct.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-p=
oky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hd=
d/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.linu=
x-mips-3.3/_struct.cpython-33m.so
building '_ctypes_test' extension
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/_ctypes_test.c -o bu=
ild/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyt=
hon3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/_ctypes_test.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_ctypes/_ctypes_test.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/u=
sr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/=
lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o b=
uild/lib.linux-mips-3.3/_ctypes_test.cpython-33m.so
building 'array' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/arraymodule.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/arraymodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/arraymodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mi=
ps-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/sr=
v/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.=
linux-mips-3.3/array.cpython-33m.so
building 'cmath' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/cmathmodule.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/cmathmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_math.c -o build/temp.linux-=
mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Modules/_math.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/cmathmodule.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/=
mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_math.o -L/srv/hd=
d/builds/world/tmp/sysroots/qemumips/usr/lib/mips-poky-linux/4.8.1 -L/srv/h=
dd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hdd/builds/world/tmp/sysro=
ots/qemumips/usr/lib -lm -lpython3.3m -o build/lib.linux-mips-3.3/cmath.cpy=
thon-33m.so
building 'math' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/mathmodule.c -o build/temp.l=
inux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2=
-r0.0/Python-3.3.2/Modules/mathmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_math.c -o build/temp.linux-=
mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Modules/_math.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/mathmodule.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/m=
ips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_math.o -L/srv/hdd=
/builds/world/tmp/sysroots/qemumips/usr/lib/mips-poky-linux/4.8.1 -L/srv/hd=
d/builds/world/tmp/sysroots/qemumips/lib -L/srv/hdd/builds/world/tmp/sysroo=
ts/qemumips/usr/lib -lm -lpython3.3m -o build/lib.linux-mips-3.3/math.cpyth=
on-33m.so
building 'time' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/timemodule.c -o build/temp.l=
inux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2=
-r0.0/Python-3.3.2/Modules/timemodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/timemodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mip=
s-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv=
/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.l=
inux-mips-3.3/time.cpython-33m.so
building '_datetime' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_datetimemodule.c -o build/t=
emp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/=
3.3.2-r0.0/Python-3.3.2/Modules/_datetimemodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_datetimemodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/li=
b/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -=
L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/=
lib.linux-mips-3.3/_datetime.cpython-33m.so
building '_random' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_randommodule.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_randommodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_randommodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/=
mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/=
srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/li=
b.linux-mips-3.3/_random.cpython-33m.so
building '_bisect' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_bisectmodule.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_bisectmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_bisectmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/=
mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/=
srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/li=
b.linux-mips-3.3/_bisect.cpython-33m.so
building '_heapq' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_heapqmodule.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/_heapqmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_heapqmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib=
.linux-mips-3.3/_heapq.cpython-33m.so
building '_pickle' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_pickle.c -o build/temp.linu=
x-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Modules/_pickle.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_pickle.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-p=
oky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hd=
d/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.linu=
x-mips-3.3/_pickle.cpython-33m.so
building 'atexit' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/atexitmodule.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/atexitmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/atexitmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib=
.linux-mips-3.3/atexit.cpython-33m.so
building '_json' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_json.c -o build/temp.linux-=
mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Modules/_json.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_json.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-pok=
y-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hdd/=
builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.linux-=
mips-3.3/_json.cpython-33m.so
building '_testcapi' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_testcapimodule.c -o build/t=
emp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/=
3.3.2-r0.0/Python-3.3.2/Modules/_testcapimodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_testcapimodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/li=
b/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -=
L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/=
lib.linux-mips-3.3/_testcapi.cpython-33m.so
building '_testbuffer' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_testbuffer.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/_testbuffer.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_testbuffer.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mi=
ps-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/sr=
v/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.=
linux-mips-3.3/_testbuffer.cpython-33m.so
building '_lsprof' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_lsprof.c -o build/temp.linu=
x-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Modules/_lsprof.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/rotatingtree.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/rotatingtree.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_lsprof.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips=
32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/rotatingtree.o -L/srv=
/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-poky-linux/4.8.1 -L/sr=
v/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hdd/builds/world/tmp/sy=
sroots/qemumips/usr/lib -lpython3.3m -o build/lib.linux-mips-3.3/_lsprof.cp=
ython-33m.so
building 'unicodedata' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/unicodedata.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/unicodedata.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/unicodedata.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mi=
ps-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/sr=
v/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.=
linux-mips-3.3/unicodedata.cpython-33m.so
building 'fcntl' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/fcntlmodule.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/fcntlmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/fcntlmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mi=
ps-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/sr=
v/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.=
linux-mips-3.3/fcntl.cpython-33m.so
building 'grp' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/grpmodule.c -o build/temp.li=
nux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-=
r0.0/Python-3.3.2/Modules/grpmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/grpmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips=
-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/=
hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.li=
nux-mips-3.3/grp.cpython-33m.so
building 'spwd' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/spwdmodule.c -o build/temp.l=
inux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2=
-r0.0/Python-3.3.2/Modules/spwdmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/spwdmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mip=
s-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv=
/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.l=
inux-mips-3.3/spwd.cpython-33m.so
building 'select' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/selectmodule.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/selectmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/selectmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib=
.linux-mips-3.3/select.cpython-33m.so
building 'parser' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/parsermodule.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/parsermodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/parsermodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib=
.linux-mips-3.3/parser.cpython-33m.so
building 'mmap' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/mmapmodule.c -o build/temp.l=
inux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2=
-r0.0/Python-3.3.2/Modules/mmapmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/mmapmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mip=
s-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv=
/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.l=
inux-mips-3.3/mmap.cpython-33m.so
building 'syslog' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/syslogmodule.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/syslogmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/syslogmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib=
.linux-mips-3.3/syslog.cpython-33m.so
building 'audioop' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/audioop.c -o build/temp.linu=
x-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Modules/audioop.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/audioop.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-p=
oky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hd=
d/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.linu=
x-mips-3.3/audioop.cpython-33m.so
building 'readline' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/readline.c -o build/temp.lin=
ux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r=
0.0/Python-3.3.2/Modules/readline.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/readline.o -L/usr/lib/termcap -L/srv/hdd/builds/world/tmp/sysroots/qem=
umips/usr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qe=
mumips/lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lreadline=
 -lncurses -lpython3.3m -o build/lib.linux-mips-3.3/readline.cpython-33m.so
/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/libexec/mips32-poky-lin=
ux/gcc/mips-poky-linux/4.8.1/ld: warning: library search path "/usr/lib/ter=
mcap" is unsafe for cross-compilation
building '_crypt' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_cryptmodule.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/_cryptmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_cryptmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lcrypt -lpython3.3m -o b=
uild/lib.linux-mips-3.3/_crypt.cpython-33m.so
building '_csv' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_csv.c -o build/temp.linux-m=
ips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/=
Python-3.3.2/Modules/_csv.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_csv.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-poky=
-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hdd/b=
uilds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.linux-m=
ips-3.3/_csv.cpython-33m.so
building '_posixsubprocess' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_posixsubprocess.c -o build/=
temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_posixsubprocess.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_posixsubprocess.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/l=
ib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib =
-L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build=
/lib.linux-mips-3.3/_posixsubprocess.cpython-33m.so
building '_socket' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/socketmodule.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/socketmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/socketmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib=
.linux-mips-3.3/_socket.cpython-33m.so
building '_ssl' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ssl.c -o build/temp.linux-m=
ips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/=
Python-3.3.2/Modules/_ssl.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_ssl.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-poky=
-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hdd/b=
uilds/world/tmp/sysroots/qemumips/usr/lib -lssl -lcrypto -lpython3.3m -o bu=
ild/lib.linux-mips-3.3/_ssl.cpython-33m.so
building '_hashlib' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_hashopenssl.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/_hashopenssl.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_hashopenssl.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lssl -lcrypto -lpython3.=
3m -o build/lib.linux-mips-3.3/_hashlib.cpython-33m.so
building '_sha256' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/sha256module.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/sha256module.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/sha256module.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib=
.linux-mips-3.3/_sha256.cpython-33m.so
building '_sha512' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/sha512module.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/sha512module.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/sha512module.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib=
.linux-mips-3.3/_sha512.cpython-33m.so
building '_md5' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/md5module.c -o build/temp.li=
nux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-=
r0.0/Python-3.3.2/Modules/md5module.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/md5module.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips=
-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/=
hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.li=
nux-mips-3.3/_md5.cpython-33m.so
building '_sha1' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/sha1module.c -o build/temp.l=
inux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2=
-r0.0/Python-3.3.2/Modules/sha1module.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/sha1module.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mip=
s-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv=
/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.l=
inux-mips-3.3/_sha1.cpython-33m.so
building '_sqlite3' extension
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DM=
ODULE_NAME=3D"sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=3D1 -IModules/_sqlite -=
I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/=
include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/cache.c -o build/t=
emp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/=
3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/cache.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DM=
ODULE_NAME=3D"sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=3D1 -IModules/_sqlite -=
I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/=
include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/connection.c -o bu=
ild/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyt=
hon3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/connection.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DM=
ODULE_NAME=3D"sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=3D1 -IModules/_sqlite -=
I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/=
include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/cursor.c -o build/=
temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/cursor.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DM=
ODULE_NAME=3D"sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=3D1 -IModules/_sqlite -=
I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/=
include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/microprotocols.c -=
o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux=
/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/microprotocols.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DM=
ODULE_NAME=3D"sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=3D1 -IModules/_sqlite -=
I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/=
include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/module.c -o build/=
temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/module.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DM=
ODULE_NAME=3D"sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=3D1 -IModules/_sqlite -=
I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/=
include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/prepare_protocol.c=
 -o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-lin=
ux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/prepare_protocol.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DM=
ODULE_NAME=3D"sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=3D1 -IModules/_sqlite -=
I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/=
include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/row.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_sqlite/row.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DM=
ODULE_NAME=3D"sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=3D1 -IModules/_sqlite -=
I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/=
include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/statement.c -o bui=
ld/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyth=
on3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/statement.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DM=
ODULE_NAME=3D"sqlite3" -DSQLITE_OMIT_LOAD_EXTENSION=3D1 -IModules/_sqlite -=
I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/=
include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/util.c -o build/te=
mp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3=
.3.2-r0.0/Python-3.3.2/Modules/_sqlite/util.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_sqlite/cache.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/wor=
k/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/connect=
ion.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-l=
inux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/cursor.o build/temp.li=
nux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-=
r0.0/Python-3.3.2/Modules/_sqlite/microprotocols.o build/temp.linux-mips-3.=
3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python=
-3.3.2/Modules/_sqlite/module.o build/temp.linux-mips-3.3/srv/hdd/builds/wo=
rld/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sql=
ite/prepare_protocol.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/w=
ork/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/row.o=
 build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_sqlite/statement.o build/temp.linu=
x-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Modules/_sqlite/util.o -L/srv/hdd/builds/world/tmp/sysroots=
/qemumips/usr/lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mip=
s-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv=
/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lsqlite3 -lpython3.3m -o b=
uild/lib.linux-mips-3.3/_sqlite3.cpython-33m.so
building '_dbm' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DH=
AVE_NDBM_H -I./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/q=
emumips/usr/include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyth=
on3/3.3.2-r0.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32=
-poky-linux/python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/wo=
rk/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_dbmmodule.c -=
o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux=
/python3/3.3.2-r0.0/Python-3.3.2/Modules/_dbmmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_dbmmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mip=
s-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv=
/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lgdbm_compat -lpython3.3m =
-o build/lib.linux-mips-3.3/_dbm.cpython-33m.so
building '_gdbm' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_gdbmmodule.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/_gdbmmodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_gdbmmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mi=
ps-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/sr=
v/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lgdbm -lpython3.3m -o bui=
ld/lib.linux-mips-3.3/_gdbm.cpython-33m.so
building 'termios' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/termios.c -o build/temp.linu=
x-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Modules/termios.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/termios.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-p=
oky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hd=
d/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.linu=
x-mips-3.3/termios.cpython-33m.so
building 'resource' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/resource.c -o build/temp.lin=
ux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r=
0.0/Python-3.3.2/Modules/resource.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/resource.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-=
poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/h=
dd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.lin=
ux-mips-3.3/resource.cpython-33m.so
building 'nis' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/nismodule.c -o build/temp.li=
nux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-=
r0.0/Python-3.3.2/Modules/nismodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/nismodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips=
-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/=
hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lnsl -lpython3.3m -o build/=
lib.linux-mips-3.3/nis.cpython-33m.so
building '_curses' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_cursesmodule.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_cursesmodule.o
/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-=
3.3.2/Modules/_cursesmodule.c: In function 'PyCurses_setupterm':
/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-=
3.3.2/Modules/_cursesmodule.c:2521:5: warning: implicit declaration of func=
tion 'setupterm' [-Wimplicit-function-declaration]
     if (!initialised_setupterm && setupterm(termstr,fd,&err) =3D=3D ERR) {
     ^
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_cursesmodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/=
mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/=
srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lncurses -lpython3.3m -=
o build/lib.linux-mips-3.3/_curses.cpython-33m.so
building '_curses_panel' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_curses_panel.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_curses_panel.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_curses_panel.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/=
mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/=
srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpanel -lncurses -lpyth=
on3.3m -o build/lib.linux-mips-3.3/_curses_panel.cpython-33m.so
building 'binascii' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/binascii.c -o build/temp.lin=
ux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r=
0.0/Python-3.3.2/Modules/binascii.o -DUSE_ZLIB_CRC32
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/binascii.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-=
poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/h=
dd/builds/world/tmp/sysroots/qemumips/usr/lib -lz -lpython3.3m -o build/lib=
.linux-mips-3.3/binascii.cpython-33m.so
building '_bz2' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_bz2module.c -o build/temp.l=
inux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2=
-r0.0/Python-3.3.2/Modules/_bz2module.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_bz2module.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mip=
s-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv=
/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lbz2 -lpython3.3m -o build=
/lib.linux-mips-3.3/_bz2.cpython-33m.so
building '_lzma' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_lzmamodule.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/_lzmamodule.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_lzmamodule.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mi=
ps-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/sr=
v/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -llzma -lpython3.3m -o bui=
ld/lib.linux-mips-3.3/_lzma.cpython-33m.so
building 'pyexpat' extension
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/expat
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DH=
AVE_EXPAT_CONFIG_H=3D1 -DUSE_PYEXPAT_CAPI -I/srv/hdd/builds/world/tmp/work/=
mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/expat -I./Include=
 -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I=
/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-=
3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2/Modules/pyexpat.c -o build/temp.linux-mips-3=
.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Pytho=
n-3.3.2/Modules/pyexpat.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DH=
AVE_EXPAT_CONFIG_H=3D1 -DUSE_PYEXPAT_CAPI -I/srv/hdd/builds/world/tmp/work/=
mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/expat -I./Include=
 -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I=
/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-=
3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2/Modules/expat/xmlparse.c -o build/temp.linux=
-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.=
0/Python-3.3.2/Modules/expat/xmlparse.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DH=
AVE_EXPAT_CONFIG_H=3D1 -DUSE_PYEXPAT_CAPI -I/srv/hdd/builds/world/tmp/work/=
mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/expat -I./Include=
 -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I=
/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-=
3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2/Modules/expat/xmlrole.c -o build/temp.linux-=
mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Modules/expat/xmlrole.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DH=
AVE_EXPAT_CONFIG_H=3D1 -DUSE_PYEXPAT_CAPI -I/srv/hdd/builds/world/tmp/work/=
mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/expat -I./Include=
 -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I=
/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-=
3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2/Modules/expat/xmltok.c -o build/temp.linux-m=
ips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/=
Python-3.3.2/Modules/expat/xmltok.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/pyexpat.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips=
32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/expat/xmlparse.o buil=
d/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pytho=
n3/3.3.2-r0.0/Python-3.3.2/Modules/expat/xmlrole.o build/temp.linux-mips-3.=
3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python=
-3.3.2/Modules/expat/xmltok.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips=
/usr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumip=
s/lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o=
 build/lib.linux-mips-3.3/pyexpat.cpython-33m.so
building '_elementtree' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DH=
AVE_EXPAT_CONFIG_H=3D1 -DUSE_PYEXPAT_CAPI -I/srv/hdd/builds/world/tmp/work/=
mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/expat -I./Include=
 -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I=
/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-=
3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2/Modules/_elementtree.c -o build/temp.linux-m=
ips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/=
Python-3.3.2/Modules/_elementtree.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_elementtree.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/m=
ips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/s=
rv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib=
.linux-mips-3.3/_elementtree.cpython-33m.so
building '_multibytecodec' extension
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/multibytecodec.c -=
o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux=
/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/multibytecodec.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/cjkcodecs/multibytecodec.o -L/srv/hdd/builds/world/tmp/sysroots/qemumi=
ps/usr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemum=
ips/lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m =
-o build/lib.linux-mips-3.3/_multibytecodec.cpython-33m.so
building '_codecs_kr' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_kr.c -o bu=
ild/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyt=
hon3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_kr.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/cjkcodecs/_codecs_kr.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/u=
sr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/=
lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o b=
uild/lib.linux-mips-3.3/_codecs_kr.cpython-33m.so
building '_codecs_jp' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_jp.c -o bu=
ild/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyt=
hon3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_jp.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/cjkcodecs/_codecs_jp.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/u=
sr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/=
lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o b=
uild/lib.linux-mips-3.3/_codecs_jp.cpython-33m.so
building '_codecs_cn' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_cn.c -o bu=
ild/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyt=
hon3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_cn.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/cjkcodecs/_codecs_cn.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/u=
sr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/=
lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o b=
uild/lib.linux-mips-3.3/_codecs_cn.cpython-33m.so
building '_codecs_tw' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_tw.c -o bu=
ild/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyt=
hon3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_tw.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/cjkcodecs/_codecs_tw.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/u=
sr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/=
lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o b=
uild/lib.linux-mips-3.3/_codecs_tw.cpython-33m.so
building '_codecs_hk' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_hk.c -o bu=
ild/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyt=
hon3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_hk.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/cjkcodecs/_codecs_hk.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/u=
sr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/=
lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o b=
uild/lib.linux-mips-3.3/_codecs_hk.cpython-33m.so
building '_codecs_iso2022' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_iso2022.c =
-o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linu=
x/python3/3.3.2-r0.0/Python-3.3.2/Modules/cjkcodecs/_codecs_iso2022.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/cjkcodecs/_codecs_iso2022.o -L/srv/hdd/builds/world/tmp/sysroots/qemum=
ips/usr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemu=
mips/lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m=
 -o build/lib.linux-mips-3.3/_codecs_iso2022.cpython-33m.so
building '_decimal' extension
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/_decimal.c -o build/temp.linux-mi=
ps-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/P=
ython-3.3.2/Modules/_decimal/_decimal.o -Wextra -Wno-missing-field-initiali=
zers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/basearith.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/basearith.o -Wextra -Wno-mi=
ssing-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/constants.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/constants.o -Wextra -Wno-mi=
ssing-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/context.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/context.o -Wextra -Wno-missin=
g-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/convolute.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/convolute.o -Wextra -Wno-mi=
ssing-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/crt.c -o build/temp.linu=
x-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Modules/_decimal/libmpdec/crt.o -Wextra -Wno-missing-field-=
initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/difradix2.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/difradix2.o -Wextra -Wno-mi=
ssing-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/fnt.c -o build/temp.linu=
x-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2/Modules/_decimal/libmpdec/fnt.o -Wextra -Wno-missing-field-=
initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/fourstep.c -o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/fourstep.o -Wextra -Wno-miss=
ing-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/io.c -o build/temp.linux=
-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.=
0/Python-3.3.2/Modules/_decimal/libmpdec/io.o -Wextra -Wno-missing-field-in=
itializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/memory.c -o build/temp.l=
inux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2=
-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/memory.o -Wextra -Wno-missing-=
field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/mpdecimal.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/mpdecimal.o -Wextra -Wno-mi=
ssing-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/numbertheory.c -o build/=
temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/numbertheory.o -Wextra -=
Wno-missing-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/sixstep.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/sixstep.o -Wextra -Wno-missin=
g-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -DC=
ONFIG_32=3D1 -DANSI=3D1 -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/=
python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec -I./Include -I. -=
IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/include -I/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0=
.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/transpose.c -o build/tem=
p.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.=
3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/transpose.o -Wextra -Wno-mi=
ssing-field-initializers
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_decimal/_decimal.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp=
/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/li=
bmpdec/basearith.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/=
mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec=
/constants.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32=
-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/conte=
xt.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-li=
nux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/convolute.o b=
uild/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/crt.o build/temp.li=
nux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-=
r0.0/Python-3.3.2/Modules/_decimal/libmpdec/difradix2.o build/temp.linux-mi=
ps-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/P=
ython-3.3.2/Modules/_decimal/libmpdec/fnt.o build/temp.linux-mips-3.3/srv/h=
dd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/=
Modules/_decimal/libmpdec/fourstep.o build/temp.linux-mips-3.3/srv/hdd/buil=
ds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules=
/_decimal/libmpdec/io.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/=
work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/lib=
mpdec/memory.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips=
32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/mpd=
ecimal.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/numberthe=
ory.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-l=
inux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/sixstep.o bu=
ild/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pyt=
hon3/3.3.2-r0.0/Python-3.3.2/Modules/_decimal/libmpdec/transpose.o -L/srv/h=
dd/builds/world/tmp/sysroots/qemumips/usr/lib/mips-poky-linux/4.8.1 -L/srv/=
hdd/builds/world/tmp/sysroots/qemumips/lib -L/srv/hdd/builds/world/tmp/sysr=
oots/qemumips/usr/lib -lpython3.3m -o build/lib.linux-mips-3.3/_decimal.cpy=
thon-33m.so
building '_multiprocessing' extension
creating build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_multiprocessing
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -IM=
odules/_multiprocessing -I./Include -I. -IInclude -I/srv/hdd/builds/world/t=
mp/sysroots/qemumips/usr/include -I/srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tm=
p/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds=
/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_=
multiprocessing/multiprocessing.c -o build/temp.linux-mips-3.3/srv/hdd/buil=
ds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules=
/_multiprocessing/multiprocessing.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -IM=
odules/_multiprocessing -I./Include -I. -IInclude -I/srv/hdd/builds/world/t=
mp/sysroots/qemumips/usr/include -I/srv/hdd/builds/world/tmp/work/mips32-po=
ky-linux/python3/3.3.2-r0.0/Python-3.3.2/Include -I/srv/hdd/builds/world/tm=
p/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds=
/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_=
multiprocessing/semaphore.c -o build/temp.linux-mips-3.3/srv/hdd/builds/wor=
ld/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_mult=
iprocessing/semaphore.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_multiprocessing/multiprocessing.o build/temp.linux-mips-3.3/srv/hdd/b=
uilds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modu=
les/_multiprocessing/semaphore.o -L/srv/hdd/builds/world/tmp/sysroots/qemum=
ips/usr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemu=
mips/lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m=
 -o build/lib.linux-mips-3.3/_multiprocessing.cpython-33m.so
building 'ossaudiodev' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I.=
/Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/in=
clude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/py=
thon3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-poky=
-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/ossaudiodev.c -o build/temp.=
linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.=
2-r0.0/Python-3.3.2/Modules/ossaudiodev.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/ossaudiodev.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/mi=
ps-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/lib -L/sr=
v/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lpython3.3m -o build/lib.=
linux-mips-3.3/ossaudiodev.cpython-33m.so
building '_ctypes' extension
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I/=
srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/libffi-3.0.13/include -I=
./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/i=
nclude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.=
0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/_ctypes.c -o build/=
temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/_ctypes.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I/=
srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/libffi-3.0.13/include -I=
./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/i=
nclude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.=
0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/callbacks.c -o buil=
d/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/pytho=
n3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/callbacks.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I/=
srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/libffi-3.0.13/include -I=
./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/i=
nclude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.=
0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/callproc.c -o build=
/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python=
3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/callproc.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I/=
srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/libffi-3.0.13/include -I=
./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/i=
nclude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.=
0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/stgdict.c -o build/=
temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3=
/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/stgdict.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -fPIC -W=
no-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -I/=
srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib/libffi-3.0.13/include -I=
./Include -I. -IInclude -I/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/i=
nclude -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.=
0/Python-3.3.2/Include -I/srv/hdd/builds/world/tmp/work/mips32-poky-linux/p=
ython3/3.3.2-r0.0/Python-3.3.2 -c /srv/hdd/builds/world/tmp/work/mips32-pok=
y-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/cfield.c -o build/t=
emp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/=
3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/cfield.o
mips-poky-linux-gcc -meb -mabi=3D32 -mhard-float -march=3Dmips32 -DNDEBUG -=
fno-inline --sysroot=3D/srv/hdd/builds/world/tmp/sysroots/qemumips -shared =
-Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -Wl,-O1 -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-mips-3.3/srv/hdd/=
builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Mod=
ules/_ctypes/_ctypes.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/w=
ork/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/callb=
acks.o build/temp.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-=
linux/python3/3.3.2-r0.0/Python-3.3.2/Modules/_ctypes/callproc.o build/temp=
.linux-mips-3.3/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3=
.2-r0.0/Python-3.3.2/Modules/_ctypes/stgdict.o build/temp.linux-mips-3.3/sr=
v/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/Python-3.3=
.2/Modules/_ctypes/cfield.o -L/srv/hdd/builds/world/tmp/sysroots/qemumips/u=
sr/lib/mips-poky-linux/4.8.1 -L/srv/hdd/builds/world/tmp/sysroots/qemumips/=
lib -L/srv/hdd/builds/world/tmp/sysroots/qemumips/usr/lib -lffi -lpython3.3=
m -o build/lib.linux-mips-3.3/_ctypes.cpython-33m.so
running build_scripts
creating build/scripts-3.3
copying /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Tools/scripts/pydoc3 -> build/scripts-3.3
copying /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Tools/scripts/idle3 -> build/scripts-3.3
copying /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Tools/scripts/2to3 -> build/scripts-3.3
copying /srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0=
/Python-3.3.2/Tools/scripts/pyvenv -> build/scripts-3.3
renaming build/scripts-3.3/pydoc3 to build/scripts-3.3/pydoc3.3
renaming build/scripts-3.3/idle3 to build/scripts-3.3/idle3.3
renaming build/scripts-3.3/2to3 to build/scripts-3.3/2to3-3.3
renaming build/scripts-3.3/pyvenv to build/scripts-3.3/pyvenv-3.3
DEBUG: Shell function do_compile finished

--------------010403080904050705000609--
