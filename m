Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4F92E6A973
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 17:14:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 26 Jun 2013 10:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,945,1363158000"; d="i'?scan'208";a="356151724"
Received: from unknown (HELO [10.255.13.111]) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2013 10:14:59 -0700
Message-ID: <51CB2164.5090102@linux.intel.com>
Date: Wed, 26 Jun 2013 10:14:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
	<CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
	<F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
In-Reply-To: <F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Wed, 26 Jun 2013 17:14:24 -0000
X-Groupsio-MsgNum: 41014
Content-Type: multipart/mixed; boundary="------------010303080502020801060100"

--------------010303080502020801060100
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/25/2013 11:00 AM, Khem Raj wrote:
>
> On Jun 25, 2013, at 10:46 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/log/?h=imx_2.6.35_11.09.01
>>
>
> hmm 2.6.35
>
>> If you provide me the command I should do, I can get it. Or Saul might
>> get it from autobuilder as well.
>
> something like below. Replace the paths to your tmpdir appropriately in below cmd ( e.g. /builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi might be something else for you and also compiler name and sysroot)
>
> cd into kernel srcdir in staging tmp/sysroots/beaglebone/usr/src/kernel/tools/perf
>
> arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -Iutil/include -Iarch/arm/include -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/arch/arm/include/generated/uapi -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr/src/kernel/arch/arm/include/uapi -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr/src/kernel/arch/arm/include -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/include/generated/uapi -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr/src/kernel/include/uapi -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr/src/kernel
/include -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/util -Iutil -I. -I../lib/traceevent/ -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/ -DLIBELF_SUPPORT -DLIBELF_MMAP -I=/usr/include/slang -DNEWT_SUPPORT -DHAVE_ON_EXIT -DBACKTRACE_SUPPORT  util/callchain.c -E -dD -o callchain.i
>
> and send me callchain.i
>
Finally got a hold of a build!

Here's the command that I used:

> arm-poky-linux-gnueabi-gcc -march=armv5te -marm -mthumb-interwork --sysroot=/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/sysroots/imx28evk -c -O2 -pipe -g -feliminate-unused-debug-types -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Iutil/include -Iarch/arm/include -I../../include -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/work/imx28evk-poky-linux-gnueabi/perf/1.0-r8/perf-1.0/ -DNO_NEWT_SUPPORT -DNO_LIBPERL -DNO_LIBPYTHON -DHAVE_CPLUS_DEMANGLE -DSHA1_HEADER="<openssl/sha.h>" util/callchain.c -E -dD -o callchain.i

I hope this can help.

Sau!


--------------010303080502020801060100
Content-Type: text/plain; charset=UTF-8;
 name="callchain.i"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="callchain.i"

# 1 "util/callchain.c"
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/src/kernel/tools/perf//"
#define __STDC__ 1
# 1 "util/callchain.c"
#define __STDC_HOSTED__ 1
# 1 "util/callchain.c"
#define __GNUC__ 4
# 1 "util/callchain.c"
#define __GNUC_MINOR__ 8
# 1 "util/callchain.c"
#define __GNUC_PATCHLEVEL__ 1
# 1 "util/callchain.c"
#define __VERSION__ "4.8.1"
# 1 "util/callchain.c"
#define __ATOMIC_RELAXED 0
# 1 "util/callchain.c"
#define __ATOMIC_SEQ_CST 5
# 1 "util/callchain.c"
#define __ATOMIC_ACQUIRE 2
# 1 "util/callchain.c"
#define __ATOMIC_RELEASE 3
# 1 "util/callchain.c"
#define __ATOMIC_ACQ_REL 4
# 1 "util/callchain.c"
#define __ATOMIC_CONSUME 1
# 1 "util/callchain.c"
#define __OPTIMIZE__ 1
# 1 "util/callchain.c"
#define __FINITE_MATH_ONLY__ 0
# 1 "util/callchain.c"
#define __SIZEOF_INT__ 4
# 1 "util/callchain.c"
#define __SIZEOF_LONG__ 4
# 1 "util/callchain.c"
#define __SIZEOF_LONG_LONG__ 8
# 1 "util/callchain.c"
#define __SIZEOF_SHORT__ 2
# 1 "util/callchain.c"
#define __SIZEOF_FLOAT__ 4
# 1 "util/callchain.c"
#define __SIZEOF_DOUBLE__ 8
# 1 "util/callchain.c"
#define __SIZEOF_LONG_DOUBLE__ 8
# 1 "util/callchain.c"
#define __SIZEOF_SIZE_T__ 4
# 1 "util/callchain.c"
#define __CHAR_BIT__ 8
# 1 "util/callchain.c"
#define __BIGGEST_ALIGNMENT__ 8
# 1 "util/callchain.c"
#define __ORDER_LITTLE_ENDIAN__ 1234
# 1 "util/callchain.c"
#define __ORDER_BIG_ENDIAN__ 4321
# 1 "util/callchain.c"
#define __ORDER_PDP_ENDIAN__ 3412
# 1 "util/callchain.c"
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
# 1 "util/callchain.c"
#define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
# 1 "util/callchain.c"
#define __SIZEOF_POINTER__ 4
# 1 "util/callchain.c"
#define __SIZE_TYPE__ unsigned int
# 1 "util/callchain.c"
#define __PTRDIFF_TYPE__ int
# 1 "util/callchain.c"
#define __WCHAR_TYPE__ unsigned int
# 1 "util/callchain.c"
#define __WINT_TYPE__ unsigned int
# 1 "util/callchain.c"
#define __INTMAX_TYPE__ long long int
# 1 "util/callchain.c"
#define __UINTMAX_TYPE__ long long unsigned int
# 1 "util/callchain.c"
#define __CHAR16_TYPE__ short unsigned int
# 1 "util/callchain.c"
#define __CHAR32_TYPE__ unsigned int
# 1 "util/callchain.c"
#define __SIG_ATOMIC_TYPE__ int
# 1 "util/callchain.c"
#define __INT8_TYPE__ signed char
# 1 "util/callchain.c"
#define __INT16_TYPE__ short int
# 1 "util/callchain.c"
#define __INT32_TYPE__ int
# 1 "util/callchain.c"
#define __INT64_TYPE__ long long int
# 1 "util/callchain.c"
#define __UINT8_TYPE__ unsigned char
# 1 "util/callchain.c"
#define __UINT16_TYPE__ short unsigned int
# 1 "util/callchain.c"
#define __UINT32_TYPE__ unsigned int
# 1 "util/callchain.c"
#define __UINT64_TYPE__ long long unsigned int
# 1 "util/callchain.c"
#define __INT_LEAST8_TYPE__ signed char
# 1 "util/callchain.c"
#define __INT_LEAST16_TYPE__ short int
# 1 "util/callchain.c"
#define __INT_LEAST32_TYPE__ int
# 1 "util/callchain.c"
#define __INT_LEAST64_TYPE__ long long int
# 1 "util/callchain.c"
#define __UINT_LEAST8_TYPE__ unsigned char
# 1 "util/callchain.c"
#define __UINT_LEAST16_TYPE__ short unsigned int
# 1 "util/callchain.c"
#define __UINT_LEAST32_TYPE__ unsigned int
# 1 "util/callchain.c"
#define __UINT_LEAST64_TYPE__ long long unsigned int
# 1 "util/callchain.c"
#define __INT_FAST8_TYPE__ signed char
# 1 "util/callchain.c"
#define __INT_FAST16_TYPE__ int
# 1 "util/callchain.c"
#define __INT_FAST32_TYPE__ int
# 1 "util/callchain.c"
#define __INT_FAST64_TYPE__ long long int
# 1 "util/callchain.c"
#define __UINT_FAST8_TYPE__ unsigned char
# 1 "util/callchain.c"
#define __UINT_FAST16_TYPE__ unsigned int
# 1 "util/callchain.c"
#define __UINT_FAST32_TYPE__ unsigned int
# 1 "util/callchain.c"
#define __UINT_FAST64_TYPE__ long long unsigned int
# 1 "util/callchain.c"
#define __INTPTR_TYPE__ int
# 1 "util/callchain.c"
#define __UINTPTR_TYPE__ unsigned int
# 1 "util/callchain.c"
#define __GXX_ABI_VERSION 1002
# 1 "util/callchain.c"
#define __SCHAR_MAX__ 127
# 1 "util/callchain.c"
#define __SHRT_MAX__ 32767
# 1 "util/callchain.c"
#define __INT_MAX__ 2147483647
# 1 "util/callchain.c"
#define __LONG_MAX__ 2147483647L
# 1 "util/callchain.c"
#define __LONG_LONG_MAX__ 9223372036854775807LL
# 1 "util/callchain.c"
#define __WCHAR_MAX__ 4294967295U
# 1 "util/callchain.c"
#define __WCHAR_MIN__ 0U
# 1 "util/callchain.c"
#define __WINT_MAX__ 4294967295U
# 1 "util/callchain.c"
#define __WINT_MIN__ 0U
# 1 "util/callchain.c"
#define __PTRDIFF_MAX__ 2147483647
# 1 "util/callchain.c"
#define __SIZE_MAX__ 4294967295U
# 1 "util/callchain.c"
#define __INTMAX_MAX__ 9223372036854775807LL
# 1 "util/callchain.c"
#define __INTMAX_C(c) c ## LL
# 1 "util/callchain.c"
#define __UINTMAX_MAX__ 18446744073709551615ULL
# 1 "util/callchain.c"
#define __UINTMAX_C(c) c ## ULL
# 1 "util/callchain.c"
#define __SIG_ATOMIC_MAX__ 2147483647
# 1 "util/callchain.c"
#define __SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)
# 1 "util/callchain.c"
#define __INT8_MAX__ 127
# 1 "util/callchain.c"
#define __INT16_MAX__ 32767
# 1 "util/callchain.c"
#define __INT32_MAX__ 2147483647
# 1 "util/callchain.c"
#define __INT64_MAX__ 9223372036854775807LL
# 1 "util/callchain.c"
#define __UINT8_MAX__ 255
# 1 "util/callchain.c"
#define __UINT16_MAX__ 65535
# 1 "util/callchain.c"
#define __UINT32_MAX__ 4294967295U
# 1 "util/callchain.c"
#define __UINT64_MAX__ 18446744073709551615ULL
# 1 "util/callchain.c"
#define __INT_LEAST8_MAX__ 127
# 1 "util/callchain.c"
#define __INT8_C(c) c
# 1 "util/callchain.c"
#define __INT_LEAST16_MAX__ 32767
# 1 "util/callchain.c"
#define __INT16_C(c) c
# 1 "util/callchain.c"
#define __INT_LEAST32_MAX__ 2147483647
# 1 "util/callchain.c"
#define __INT32_C(c) c
# 1 "util/callchain.c"
#define __INT_LEAST64_MAX__ 9223372036854775807LL
# 1 "util/callchain.c"
#define __INT64_C(c) c ## LL
# 1 "util/callchain.c"
#define __UINT_LEAST8_MAX__ 255
# 1 "util/callchain.c"
#define __UINT8_C(c) c
# 1 "util/callchain.c"
#define __UINT_LEAST16_MAX__ 65535
# 1 "util/callchain.c"
#define __UINT16_C(c) c
# 1 "util/callchain.c"
#define __UINT_LEAST32_MAX__ 4294967295U
# 1 "util/callchain.c"
#define __UINT32_C(c) c ## U
# 1 "util/callchain.c"
#define __UINT_LEAST64_MAX__ 18446744073709551615ULL
# 1 "util/callchain.c"
#define __UINT64_C(c) c ## ULL
# 1 "util/callchain.c"
#define __INT_FAST8_MAX__ 127
# 1 "util/callchain.c"
#define __INT_FAST16_MAX__ 2147483647
# 1 "util/callchain.c"
#define __INT_FAST32_MAX__ 2147483647
# 1 "util/callchain.c"
#define __INT_FAST64_MAX__ 9223372036854775807LL
# 1 "util/callchain.c"
#define __UINT_FAST8_MAX__ 255
# 1 "util/callchain.c"
#define __UINT_FAST16_MAX__ 4294967295U
# 1 "util/callchain.c"
#define __UINT_FAST32_MAX__ 4294967295U
# 1 "util/callchain.c"
#define __UINT_FAST64_MAX__ 18446744073709551615ULL
# 1 "util/callchain.c"
#define __INTPTR_MAX__ 2147483647
# 1 "util/callchain.c"
#define __UINTPTR_MAX__ 4294967295U
# 1 "util/callchain.c"
#define __FLT_EVAL_METHOD__ 0
# 1 "util/callchain.c"
#define __DEC_EVAL_METHOD__ 2
# 1 "util/callchain.c"
#define __FLT_RADIX__ 2
# 1 "util/callchain.c"
#define __FLT_MANT_DIG__ 24
# 1 "util/callchain.c"
#define __FLT_DIG__ 6
# 1 "util/callchain.c"
#define __FLT_MIN_EXP__ (-125)
# 1 "util/callchain.c"
#define __FLT_MIN_10_EXP__ (-37)
# 1 "util/callchain.c"
#define __FLT_MAX_EXP__ 128
# 1 "util/callchain.c"
#define __FLT_MAX_10_EXP__ 38
# 1 "util/callchain.c"
#define __FLT_DECIMAL_DIG__ 9
# 1 "util/callchain.c"
#define __FLT_MAX__ 3.4028234663852886e+38F
# 1 "util/callchain.c"
#define __FLT_MIN__ 1.1754943508222875e-38F
# 1 "util/callchain.c"
#define __FLT_EPSILON__ 1.1920928955078125e-7F
# 1 "util/callchain.c"
#define __FLT_DENORM_MIN__ 1.4012984643248171e-45F
# 1 "util/callchain.c"
#define __FLT_HAS_DENORM__ 1
# 1 "util/callchain.c"
#define __FLT_HAS_INFINITY__ 1
# 1 "util/callchain.c"
#define __FLT_HAS_QUIET_NAN__ 1
# 1 "util/callchain.c"
#define __DBL_MANT_DIG__ 53
# 1 "util/callchain.c"
#define __DBL_DIG__ 15
# 1 "util/callchain.c"
#define __DBL_MIN_EXP__ (-1021)
# 1 "util/callchain.c"
#define __DBL_MIN_10_EXP__ (-307)
# 1 "util/callchain.c"
#define __DBL_MAX_EXP__ 1024
# 1 "util/callchain.c"
#define __DBL_MAX_10_EXP__ 308
# 1 "util/callchain.c"
#define __DBL_DECIMAL_DIG__ 17
# 1 "util/callchain.c"
#define __DBL_MAX__ ((double)1.7976931348623157e+308L)
# 1 "util/callchain.c"
#define __DBL_MIN__ ((double)2.2250738585072014e-308L)
# 1 "util/callchain.c"
#define __DBL_EPSILON__ ((double)2.2204460492503131e-16L)
# 1 "util/callchain.c"
#define __DBL_DENORM_MIN__ ((double)4.9406564584124654e-324L)
# 1 "util/callchain.c"
#define __DBL_HAS_DENORM__ 1
# 1 "util/callchain.c"
#define __DBL_HAS_INFINITY__ 1
# 1 "util/callchain.c"
#define __DBL_HAS_QUIET_NAN__ 1
# 1 "util/callchain.c"
#define __LDBL_MANT_DIG__ 53
# 1 "util/callchain.c"
#define __LDBL_DIG__ 15
# 1 "util/callchain.c"
#define __LDBL_MIN_EXP__ (-1021)
# 1 "util/callchain.c"
#define __LDBL_MIN_10_EXP__ (-307)
# 1 "util/callchain.c"
#define __LDBL_MAX_EXP__ 1024
# 1 "util/callchain.c"
#define __LDBL_MAX_10_EXP__ 308
# 1 "util/callchain.c"
#define __DECIMAL_DIG__ 17
# 1 "util/callchain.c"
#define __LDBL_MAX__ 1.7976931348623157e+308L
# 1 "util/callchain.c"
#define __LDBL_MIN__ 2.2250738585072014e-308L
# 1 "util/callchain.c"
#define __LDBL_EPSILON__ 2.2204460492503131e-16L
# 1 "util/callchain.c"
#define __LDBL_DENORM_MIN__ 4.9406564584124654e-324L
# 1 "util/callchain.c"
#define __LDBL_HAS_DENORM__ 1
# 1 "util/callchain.c"
#define __LDBL_HAS_INFINITY__ 1
# 1 "util/callchain.c"
#define __LDBL_HAS_QUIET_NAN__ 1
# 1 "util/callchain.c"
#define __DEC32_MANT_DIG__ 7
# 1 "util/callchain.c"
#define __DEC32_MIN_EXP__ (-94)
# 1 "util/callchain.c"
#define __DEC32_MAX_EXP__ 97
# 1 "util/callchain.c"
#define __DEC32_MIN__ 1E-95DF
# 1 "util/callchain.c"
#define __DEC32_MAX__ 9.999999E96DF
# 1 "util/callchain.c"
#define __DEC32_EPSILON__ 1E-6DF
# 1 "util/callchain.c"
#define __DEC32_SUBNORMAL_MIN__ 0.000001E-95DF
# 1 "util/callchain.c"
#define __DEC64_MANT_DIG__ 16
# 1 "util/callchain.c"
#define __DEC64_MIN_EXP__ (-382)
# 1 "util/callchain.c"
#define __DEC64_MAX_EXP__ 385
# 1 "util/callchain.c"
#define __DEC64_MIN__ 1E-383DD
# 1 "util/callchain.c"
#define __DEC64_MAX__ 9.999999999999999E384DD
# 1 "util/callchain.c"
#define __DEC64_EPSILON__ 1E-15DD
# 1 "util/callchain.c"
#define __DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD
# 1 "util/callchain.c"
#define __DEC128_MANT_DIG__ 34
# 1 "util/callchain.c"
#define __DEC128_MIN_EXP__ (-6142)
# 1 "util/callchain.c"
#define __DEC128_MAX_EXP__ 6145
# 1 "util/callchain.c"
#define __DEC128_MIN__ 1E-6143DL
# 1 "util/callchain.c"
#define __DEC128_MAX__ 9.999999999999999999999999999999999E6144DL
# 1 "util/callchain.c"
#define __DEC128_EPSILON__ 1E-33DL
# 1 "util/callchain.c"
#define __DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143D=
L
# 1 "util/callchain.c"
#define __SFRACT_FBIT__ 7
# 1 "util/callchain.c"
#define __SFRACT_IBIT__ 0
# 1 "util/callchain.c"
#define __SFRACT_MIN__ (-0.5HR-0.5HR)
# 1 "util/callchain.c"
#define __SFRACT_MAX__ 0X7FP-7HR
# 1 "util/callchain.c"
#define __SFRACT_EPSILON__ 0x1P-7HR
# 1 "util/callchain.c"
#define __USFRACT_FBIT__ 8
# 1 "util/callchain.c"
#define __USFRACT_IBIT__ 0
# 1 "util/callchain.c"
#define __USFRACT_MIN__ 0.0UHR
# 1 "util/callchain.c"
#define __USFRACT_MAX__ 0XFFP-8UHR
# 1 "util/callchain.c"
#define __USFRACT_EPSILON__ 0x1P-8UHR
# 1 "util/callchain.c"
#define __FRACT_FBIT__ 15
# 1 "util/callchain.c"
#define __FRACT_IBIT__ 0
# 1 "util/callchain.c"
#define __FRACT_MIN__ (-0.5R-0.5R)
# 1 "util/callchain.c"
#define __FRACT_MAX__ 0X7FFFP-15R
# 1 "util/callchain.c"
#define __FRACT_EPSILON__ 0x1P-15R
# 1 "util/callchain.c"
#define __UFRACT_FBIT__ 16
# 1 "util/callchain.c"
#define __UFRACT_IBIT__ 0
# 1 "util/callchain.c"
#define __UFRACT_MIN__ 0.0UR
# 1 "util/callchain.c"
#define __UFRACT_MAX__ 0XFFFFP-16UR
# 1 "util/callchain.c"
#define __UFRACT_EPSILON__ 0x1P-16UR
# 1 "util/callchain.c"
#define __LFRACT_FBIT__ 31
# 1 "util/callchain.c"
#define __LFRACT_IBIT__ 0
# 1 "util/callchain.c"
#define __LFRACT_MIN__ (-0.5LR-0.5LR)
# 1 "util/callchain.c"
#define __LFRACT_MAX__ 0X7FFFFFFFP-31LR
# 1 "util/callchain.c"
#define __LFRACT_EPSILON__ 0x1P-31LR
# 1 "util/callchain.c"
#define __ULFRACT_FBIT__ 32
# 1 "util/callchain.c"
#define __ULFRACT_IBIT__ 0
# 1 "util/callchain.c"
#define __ULFRACT_MIN__ 0.0ULR
# 1 "util/callchain.c"
#define __ULFRACT_MAX__ 0XFFFFFFFFP-32ULR
# 1 "util/callchain.c"
#define __ULFRACT_EPSILON__ 0x1P-32ULR
# 1 "util/callchain.c"
#define __LLFRACT_FBIT__ 63
# 1 "util/callchain.c"
#define __LLFRACT_IBIT__ 0
# 1 "util/callchain.c"
#define __LLFRACT_MIN__ (-0.5LLR-0.5LLR)
# 1 "util/callchain.c"
#define __LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR
# 1 "util/callchain.c"
#define __LLFRACT_EPSILON__ 0x1P-63LLR
# 1 "util/callchain.c"
#define __ULLFRACT_FBIT__ 64
# 1 "util/callchain.c"
#define __ULLFRACT_IBIT__ 0
# 1 "util/callchain.c"
#define __ULLFRACT_MIN__ 0.0ULLR
# 1 "util/callchain.c"
#define __ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR
# 1 "util/callchain.c"
#define __ULLFRACT_EPSILON__ 0x1P-64ULLR
# 1 "util/callchain.c"
#define __SACCUM_FBIT__ 7
# 1 "util/callchain.c"
#define __SACCUM_IBIT__ 8
# 1 "util/callchain.c"
#define __SACCUM_MIN__ (-0X1P7HK-0X1P7HK)
# 1 "util/callchain.c"
#define __SACCUM_MAX__ 0X7FFFP-7HK
# 1 "util/callchain.c"
#define __SACCUM_EPSILON__ 0x1P-7HK
# 1 "util/callchain.c"
#define __USACCUM_FBIT__ 8
# 1 "util/callchain.c"
#define __USACCUM_IBIT__ 8
# 1 "util/callchain.c"
#define __USACCUM_MIN__ 0.0UHK
# 1 "util/callchain.c"
#define __USACCUM_MAX__ 0XFFFFP-8UHK
# 1 "util/callchain.c"
#define __USACCUM_EPSILON__ 0x1P-8UHK
# 1 "util/callchain.c"
#define __ACCUM_FBIT__ 15
# 1 "util/callchain.c"
#define __ACCUM_IBIT__ 16
# 1 "util/callchain.c"
#define __ACCUM_MIN__ (-0X1P15K-0X1P15K)
# 1 "util/callchain.c"
#define __ACCUM_MAX__ 0X7FFFFFFFP-15K
# 1 "util/callchain.c"
#define __ACCUM_EPSILON__ 0x1P-15K
# 1 "util/callchain.c"
#define __UACCUM_FBIT__ 16
# 1 "util/callchain.c"
#define __UACCUM_IBIT__ 16
# 1 "util/callchain.c"
#define __UACCUM_MIN__ 0.0UK
# 1 "util/callchain.c"
#define __UACCUM_MAX__ 0XFFFFFFFFP-16UK
# 1 "util/callchain.c"
#define __UACCUM_EPSILON__ 0x1P-16UK
# 1 "util/callchain.c"
#define __LACCUM_FBIT__ 31
# 1 "util/callchain.c"
#define __LACCUM_IBIT__ 32
# 1 "util/callchain.c"
#define __LACCUM_MIN__ (-0X1P31LK-0X1P31LK)
# 1 "util/callchain.c"
#define __LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK
# 1 "util/callchain.c"
#define __LACCUM_EPSILON__ 0x1P-31LK
# 1 "util/callchain.c"
#define __ULACCUM_FBIT__ 32
# 1 "util/callchain.c"
#define __ULACCUM_IBIT__ 32
# 1 "util/callchain.c"
#define __ULACCUM_MIN__ 0.0ULK
# 1 "util/callchain.c"
#define __ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK
# 1 "util/callchain.c"
#define __ULACCUM_EPSILON__ 0x1P-32ULK
# 1 "util/callchain.c"
#define __LLACCUM_FBIT__ 31
# 1 "util/callchain.c"
#define __LLACCUM_IBIT__ 32
# 1 "util/callchain.c"
#define __LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)
# 1 "util/callchain.c"
#define __LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK
# 1 "util/callchain.c"
#define __LLACCUM_EPSILON__ 0x1P-31LLK
# 1 "util/callchain.c"
#define __ULLACCUM_FBIT__ 32
# 1 "util/callchain.c"
#define __ULLACCUM_IBIT__ 32
# 1 "util/callchain.c"
#define __ULLACCUM_MIN__ 0.0ULLK
# 1 "util/callchain.c"
#define __ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK
# 1 "util/callchain.c"
#define __ULLACCUM_EPSILON__ 0x1P-32ULLK
# 1 "util/callchain.c"
#define __QQ_FBIT__ 7
# 1 "util/callchain.c"
#define __QQ_IBIT__ 0
# 1 "util/callchain.c"
#define __HQ_FBIT__ 15
# 1 "util/callchain.c"
#define __HQ_IBIT__ 0
# 1 "util/callchain.c"
#define __SQ_FBIT__ 31
# 1 "util/callchain.c"
#define __SQ_IBIT__ 0
# 1 "util/callchain.c"
#define __DQ_FBIT__ 63
# 1 "util/callchain.c"
#define __DQ_IBIT__ 0
# 1 "util/callchain.c"
#define __TQ_FBIT__ 127
# 1 "util/callchain.c"
#define __TQ_IBIT__ 0
# 1 "util/callchain.c"
#define __UQQ_FBIT__ 8
# 1 "util/callchain.c"
#define __UQQ_IBIT__ 0
# 1 "util/callchain.c"
#define __UHQ_FBIT__ 16
# 1 "util/callchain.c"
#define __UHQ_IBIT__ 0
# 1 "util/callchain.c"
#define __USQ_FBIT__ 32
# 1 "util/callchain.c"
#define __USQ_IBIT__ 0
# 1 "util/callchain.c"
#define __UDQ_FBIT__ 64
# 1 "util/callchain.c"
#define __UDQ_IBIT__ 0
# 1 "util/callchain.c"
#define __UTQ_FBIT__ 128
# 1 "util/callchain.c"
#define __UTQ_IBIT__ 0
# 1 "util/callchain.c"
#define __HA_FBIT__ 7
# 1 "util/callchain.c"
#define __HA_IBIT__ 8
# 1 "util/callchain.c"
#define __SA_FBIT__ 15
# 1 "util/callchain.c"
#define __SA_IBIT__ 16
# 1 "util/callchain.c"
#define __DA_FBIT__ 31
# 1 "util/callchain.c"
#define __DA_IBIT__ 32
# 1 "util/callchain.c"
#define __TA_FBIT__ 63
# 1 "util/callchain.c"
#define __TA_IBIT__ 64
# 1 "util/callchain.c"
#define __UHA_FBIT__ 8
# 1 "util/callchain.c"
#define __UHA_IBIT__ 8
# 1 "util/callchain.c"
#define __USA_FBIT__ 16
# 1 "util/callchain.c"
#define __USA_IBIT__ 16
# 1 "util/callchain.c"
#define __UDA_FBIT__ 32
# 1 "util/callchain.c"
#define __UDA_IBIT__ 32
# 1 "util/callchain.c"
#define __UTA_FBIT__ 64
# 1 "util/callchain.c"
#define __UTA_IBIT__ 64
# 1 "util/callchain.c"
#define __REGISTER_PREFIX__=20
# 1 "util/callchain.c"
#define __USER_LABEL_PREFIX__=20
# 1 "util/callchain.c"
#define __GNUC_GNU_INLINE__ 1
# 1 "util/callchain.c"
#define __CHAR_UNSIGNED__ 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_BOOL_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_CHAR_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_CHAR32_T_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_WCHAR_T_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_SHORT_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_INT_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_LONG_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_LLONG_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1
# 1 "util/callchain.c"
#define __GCC_ATOMIC_POINTER_LOCK_FREE 1
# 1 "util/callchain.c"
#define __GCC_HAVE_DWARF2_CFI_ASM 1
# 1 "util/callchain.c"
#define __PRAGMA_REDEFINE_EXTNAME 1
# 1 "util/callchain.c"
#define __SIZEOF_WCHAR_T__ 4
# 1 "util/callchain.c"
#define __SIZEOF_WINT_T__ 4
# 1 "util/callchain.c"
#define __SIZEOF_PTRDIFF_T__ 4
# 1 "util/callchain.c"
#define __ARM_FEATURE_DSP 1
# 1 "util/callchain.c"
#define __ARM_FEATURE_QBIT 1
# 1 "util/callchain.c"
#define __ARM_FEATURE_CLZ 1
# 1 "util/callchain.c"
#define __ARM_SIZEOF_MINIMAL_ENUM 4
# 1 "util/callchain.c"
#define __ARM_SIZEOF_WCHAR_T 32
# 1 "util/callchain.c"
#define __arm__ 1
# 1 "util/callchain.c"
#define __ARM_ARCH 5
# 1 "util/callchain.c"
#define __ARM_ARCH_ISA_ARM 1
# 1 "util/callchain.c"
#define __APCS_32__ 1
# 1 "util/callchain.c"
#define __ARM_ARCH_ISA_THUMB 1
# 1 "util/callchain.c"
#define __ARMEL__ 1
# 1 "util/callchain.c"
#define __SOFTFP__ 1
# 1 "util/callchain.c"
#define __VFP_FP__ 1
# 1 "util/callchain.c"
#define __ARM_FP 12
# 1 "util/callchain.c"
#define __ARM_NEON_FP 4
# 1 "util/callchain.c"
#define __THUMB_INTERWORK__ 1
# 1 "util/callchain.c"
#define __ARM_ARCH_5TE__ 1
# 1 "util/callchain.c"
#define __ARM_PCS 1
# 1 "util/callchain.c"
#define __ARM_EABI__ 1
# 1 "util/callchain.c"
#define __GXX_TYPEINFO_EQUALITY_INLINE 0
# 1 "util/callchain.c"
#define __gnu_linux__ 1
# 1 "util/callchain.c"
#define __linux 1
# 1 "util/callchain.c"
#define __linux__ 1
# 1 "util/callchain.c"
#define linux 1
# 1 "util/callchain.c"
#define __unix 1
# 1 "util/callchain.c"
#define __unix__ 1
# 1 "util/callchain.c"
#define unix 1
# 1 "util/callchain.c"
#define __ELF__ 1
# 1 "<command-line>"
#define _LARGEFILE64_SOURCE 1
#define _FILE_OFFSET_BITS 64
#define NO_NEWT_SUPPORT 1
#define NO_LIBPERL 1
#define NO_LIBPYTHON 1
#define HAVE_CPLUS_DEMANGLE 1
#define SHA1_HEADER <openssl/sha.h>
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/stdc-predef.h" 1 3 4
# 19 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdc-predef.h" 3 4
#define _STDC_PREDEF_H 1
# 30 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdc-predef.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/predefs.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/predefs.h" 3 4
#define _PREDEFS_H=20
# 31 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdc-predef.h" 2 3 4



#define __STDC_ISO_10646__ 201103L


#define __STDC_NO_THREADS__ 1
# 1 "<command-line>" 2
# 1 "util/callchain.c"
# 12 "util/callchain.c"
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/features.h" 1 3 4
# 19 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 3 4
#define _FEATURES_H 1
# 98 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 3 4
#undef __USE_ISOC11
#undef __USE_ISOC99
#undef __USE_ISOC95
#undef __USE_ISOCXX11
#undef __USE_POSIX
#undef __USE_POSIX2
#undef __USE_POSIX199309
#undef __USE_POSIX199506
#undef __USE_XOPEN
#undef __USE_XOPEN_EXTENDED
#undef __USE_UNIX98
#undef __USE_XOPEN2K
#undef __USE_XOPEN2KXSI
#undef __USE_XOPEN2K8
#undef __USE_XOPEN2K8XSI
#undef __USE_LARGEFILE
#undef __USE_LARGEFILE64
#undef __USE_FILE_OFFSET64
#undef __USE_BSD
#undef __USE_SVID
#undef __USE_MISC
#undef __USE_ATFILE
#undef __USE_GNU
#undef __USE_REENTRANT
#undef __USE_FORTIFY_LEVEL
#undef __FAVOR_BSD
#undef __KERNEL_STRICT_NAMES




#define __KERNEL_STRICT_NAMES=20



#define __USE_ANSI 1
# 143 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 3 4
#define __GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >=3D ((ma=
j) << 16) + (min))
# 188 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 3 4
#define _BSD_SOURCE 1
#define _SVID_SOURCE 1
# 223 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 3 4
#define _POSIX_SOURCE 1







#define _POSIX_C_SOURCE 200809L

#define __USE_POSIX_IMPLICITLY 1



#define __USE_POSIX 1



#define __USE_POSIX2 1



#define __USE_POSIX199309 1



#define __USE_POSIX199506 1



#define __USE_XOPEN2K 1
#undef __USE_ISOC95
#define __USE_ISOC95 1
#undef __USE_ISOC99
#define __USE_ISOC99 1



#define __USE_XOPEN2K8 1
#undef _ATFILE_SOURCE
#define _ATFILE_SOURCE 1
# 297 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 3 4
#define __USE_LARGEFILE64 1



#define __USE_FILE_OFFSET64 1



#define __USE_MISC 1



#define __USE_BSD 1



#define __USE_SVID 1



#define __USE_ATFILE 1
# 340 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 3 4
#define __USE_FORTIFY_LEVEL 0
# 353 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 3 4
#undef __GNU_LIBRARY__
#define __GNU_LIBRARY__ 6



#define __GLIBC__ 2
#define __GLIBC_MINOR__ 17

#define __GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >=3D (=
(maj) << 16) + (min))







#define __GLIBC_HAVE_LONG_LONG 1





# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define _SYS_CDEFS_H 1
# 35 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#undef __P
#undef __PMT






#define __LEAF , __leaf__
#define __LEAF_ATTR __attribute__ ((__leaf__))
# 56 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __THROW __attribute__ ((__nothrow__ __LEAF))
#define __THROWNL __attribute__ ((__nothrow__))
#define __NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct
# 83 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __P(args) args
#define __PMT(args) args




#define __CONCAT(x,y) x ## y
#define __STRING(x) #x


#define __ptr_t void *
#define __long_double_t long double







#define __BEGIN_DECLS=20
#define __END_DECLS=20
# 123 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __BEGIN_NAMESPACE_STD=20
#define __END_NAMESPACE_STD=20
#define __USING_NAMESPACE_STD(name)=20
#define __BEGIN_NAMESPACE_C99=20
#define __END_NAMESPACE_C99=20
#define __USING_NAMESPACE_C99(name)=20





#define __bounded=20
#define __unbounded=20
#define __ptrvalue=20




#define __bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)
#define __bos0(ptr) __builtin_object_size (ptr, 0)
#define __fortify_function __extern_always_inline __attribute_artificial__


#define __warndecl(name,msg) extern void name (void) __attribute__((__warni=
ng__ (msg)))

#define __warnattr(msg) __attribute__((__warning__ (msg)))
#define __errordecl(name,msg) extern void name (void) __attribute__((__erro=
r__ (msg)))
# 160 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __flexarr []
# 187 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)=
)






#define __REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#al=
ias)) __THROW

#define __REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#=
alias)) __THROWNL


#define __ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)
#define __ASMNAME2(prefix,cname) __STRING (prefix) cname
# 221 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __attribute_malloc__ __attribute__ ((__malloc__))
# 230 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __attribute_pure__ __attribute__ ((__pure__))






#define __attribute_const__ __attribute__ ((__const__))
# 246 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __attribute_used__ __attribute__ ((__used__))
#define __attribute_noinline__ __attribute__ ((__noinline__))







#define __attribute_deprecated__ __attribute__ ((__deprecated__))
# 267 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))
# 277 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__str=
fmon__, a, b)))
# 286 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __nonnull(params) __attribute__ ((__nonnull__ params))







#define __attribute_warn_unused_result__ __attribute__ ((__warn_unused_resu=
lt__))
# 303 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __wur=20




#define __always_inline __inline __attribute__ ((__always_inline__))







#define __attribute_artificial__ __attribute__ ((__artificial__))
# 329 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __extern_inline extern __inline
#define __extern_always_inline extern __always_inline
# 344 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __va_arg_pack() __builtin_va_arg_pack ()
#define __va_arg_pack_len() __builtin_va_arg_pack_len ()
# 365 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __restrict_arr __restrict
# 380 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __glibc_unlikely(cond) __builtin_expect((cond), 0)




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 1 3 4
# 18 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 3 4
#define __WORDSIZE 32
# 386 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 2 3 4
# 407 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/cdefs.h" 3 4
#define __LDBL_REDIR1(name,proto,alias) name proto
#define __LDBL_REDIR(name,proto) name proto
#define __LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW
#define __LDBL_REDIR_NTH(name,proto) name proto __THROW
#define __LDBL_REDIR_DECL(name)=20

#define __REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)
#define __REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, =
alias)
# 376 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 2 3 4
# 391 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 3 4
#define __USE_EXTERN_INLINES 1







# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/gnu/stubs.h" 1 3 4






# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/gnu/stubs-soft.h" 1 3 4
# 10 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/gnu/stubs-soft.h" 3 4
#define __stub_chflags=20
#define __stub_create_module=20
#define __stub_fattach=20
#define __stub_fchflags=20
#define __stub_fdetach=20
#define __stub_get_kernel_syms=20
#define __stub_getmsg=20
#define __stub_getpmsg=20
#define __stub_gtty=20
#define __stub_lchmod=20
#define __stub_putmsg=20
#define __stub_putpmsg=20
#define __stub_query_module=20
#define __stub_revoke=20
#define __stub_setlogin=20
#define __stub_sigreturn=20
#define __stub_sstk=20
#define __stub_stty=20
# 8 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/gnu/stubs.h" 2 3 4
# 400 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/features.h" 2 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 2 3 4


#define __need_size_t=20

#define __need_wchar_t=20
#define __need_NULL=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 184 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#define __size_t__=20
#define __SIZE_T__=20
#define _SIZE_T=20
#define _SYS_SIZE_T_H=20
#define _T_SIZE_=20
#define _T_SIZE=20
#define __SIZE_T=20
#define _SIZE_T_=20
#define _BSD_SIZE_T_=20
#define _SIZE_T_DEFINED_=20
#define _SIZE_T_DEFINED=20
#define _BSD_SIZE_T_DEFINED_=20
#define _SIZE_T_DECLARED=20
#define ___int_size_t_h=20
#define _GCC_SIZE_T=20
#define _SIZET_=20






#define __size_t=20





typedef unsigned int size_t;
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 263 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#define __wchar_t__=20
#define __WCHAR_T__=20
#define _WCHAR_T=20
#define _T_WCHAR_=20
#define _T_WCHAR=20
#define __WCHAR_T=20
#define _WCHAR_T_=20
#define _BSD_WCHAR_T_=20
#define _WCHAR_T_DEFINED_=20
#define _WCHAR_T_DEFINED=20
#define _WCHAR_T_H=20
#define ___int_wchar_t_h=20
#define __INT_WCHAR_T_H=20
#define _GCC_WCHAR_T=20
#define _WCHAR_T_DECLARED=20
# 290 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef _BSD_WCHAR_T_
# 324 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL
# 33 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 2 3 4




#define _STDLIB_H 1



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/waitflags.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/waitflags.h" 3 4
#define WNOHANG 1
#define WUNTRACED 2


#define WSTOPPED 2
#define WEXITED 4
#define WCONTINUED 8
#define WNOWAIT 0x01000000

#define __WNOTHREAD 0x20000000

#define __WALL 0x40000000
#define __WCLONE 0x80000000
# 42 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 2 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/waitstatus.h" 1 3 4
# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/waitstatus.h" 3 4
#define __WEXITSTATUS(status) (((status) & 0xff00) >> 8)


#define __WTERMSIG(status) ((status) & 0x7f)


#define __WSTOPSIG(status) __WEXITSTATUS(status)


#define __WIFEXITED(status) (__WTERMSIG(status) =3D=3D 0)


#define __WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1)=
 > 0)



#define __WIFSTOPPED(status) (((status) & 0xff) =3D=3D 0x7f)




#define __WIFCONTINUED(status) ((status) =3D=3D __W_CONTINUED)



#define __WCOREDUMP(status) ((status) & __WCOREFLAG)


#define __W_EXITCODE(ret,sig) ((ret) << 8 | (sig))
#define __W_STOPCODE(sig) ((sig) << 8 | 0x7f)
#define __W_CONTINUED 0xffff
#define __WCOREFLAG 0x80




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/endian.h" 1 3 4
# 19 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/endian.h" 3 4
#define _ENDIAN_H 1
# 31 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/endian.h" 3 4
#define __LITTLE_ENDIAN 1234
#define __BIG_ENDIAN 4321
#define __PDP_ENDIAN 3412


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/endian.h" 1 3 4
# 9 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/endian.h" 3 4
#define __BYTE_ORDER __LITTLE_ENDIAN
# 37 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/endian.h" 2 3 4




#define __FLOAT_WORD_ORDER __BYTE_ORDER



#define LITTLE_ENDIAN __LITTLE_ENDIAN
#define BIG_ENDIAN __BIG_ENDIAN
#define PDP_ENDIAN __PDP_ENDIAN
#define BYTE_ORDER __BYTE_ORDER



#define __LONG_LONG_PAIR(HI,LO) LO, HI







# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/byteswap.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/byteswap.h" 3 4
#define _BITS_BYTESWAP_H 1


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/types.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/types.h" 3 4
#define _BITS_TYPES_H 1


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 1 3 4
# 18 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 3 4
#define __WORDSIZE 32
# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;




__extension__ typedef signed long long int __int64_t;
__extension__ typedef unsigned long long int __uint64_t;







__extension__ typedef long long int __quad_t;
__extension__ typedef unsigned long long int __u_quad_t;
# 98 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/types.h" 3 4
#define __S16_TYPE short int
#define __U16_TYPE unsigned short int
#define __S32_TYPE int
#define __U32_TYPE unsigned int
#define __SLONGWORD_TYPE long int
#define __ULONGWORD_TYPE unsigned long int

#define __SQUAD_TYPE __quad_t
#define __UQUAD_TYPE __u_quad_t
#define __SWORD_TYPE int
#define __UWORD_TYPE unsigned int
#define __SLONG32_TYPE long int
#define __ULONG32_TYPE unsigned long int
#define __S64_TYPE __quad_t
#define __U64_TYPE __u_quad_t


#define __STD_TYPE __extension__ typedef
# 130 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/types.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/typesizes.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/typesizes.h" 3 4
#define _BITS_TYPESIZES_H 1




#define __DEV_T_TYPE __UQUAD_TYPE
#define __UID_T_TYPE __U32_TYPE
#define __GID_T_TYPE __U32_TYPE
#define __INO_T_TYPE __ULONGWORD_TYPE
#define __INO64_T_TYPE __UQUAD_TYPE
#define __MODE_T_TYPE __U32_TYPE
#define __NLINK_T_TYPE __UWORD_TYPE
#define __OFF_T_TYPE __SLONGWORD_TYPE
#define __OFF64_T_TYPE __SQUAD_TYPE
#define __PID_T_TYPE __S32_TYPE
#define __RLIM_T_TYPE __ULONGWORD_TYPE
#define __RLIM64_T_TYPE __UQUAD_TYPE
#define __BLKCNT_T_TYPE __SLONGWORD_TYPE
#define __BLKCNT64_T_TYPE __SQUAD_TYPE
#define __FSBLKCNT_T_TYPE __ULONGWORD_TYPE
#define __FSBLKCNT64_T_TYPE __UQUAD_TYPE
#define __FSFILCNT_T_TYPE __ULONGWORD_TYPE
#define __FSFILCNT64_T_TYPE __UQUAD_TYPE
#define __FSWORD_T_TYPE __SWORD_TYPE
#define __ID_T_TYPE __U32_TYPE
#define __CLOCK_T_TYPE __SLONGWORD_TYPE
#define __TIME_T_TYPE __SLONGWORD_TYPE
#define __USECONDS_T_TYPE __U32_TYPE
#define __SUSECONDS_T_TYPE __SLONGWORD_TYPE
#define __DADDR_T_TYPE __S32_TYPE
#define __KEY_T_TYPE __S32_TYPE
#define __CLOCKID_T_TYPE __S32_TYPE
#define __TIMER_T_TYPE void *
#define __BLKSIZE_T_TYPE __SLONGWORD_TYPE
#define __FSID_T_TYPE struct { int __val[2]; }
#define __SSIZE_T_TYPE __SWORD_TYPE
#define __SYSCALL_SLONG_TYPE __SLONGWORD_TYPE
#define __SYSCALL_ULONG_TYPE __ULONGWORD_TYPE
# 74 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/typesizes.h" 3 4
#define __FD_SETSIZE 1024
# 131 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/types.h" 2 3 4


__extension__ typedef __u_quad_t __dev_t;
__extension__ typedef unsigned int __uid_t;
__extension__ typedef unsigned int __gid_t;
__extension__ typedef unsigned long int __ino_t;
__extension__ typedef __u_quad_t __ino64_t;
__extension__ typedef unsigned int __mode_t;
__extension__ typedef unsigned int __nlink_t;
__extension__ typedef long int __off_t;
__extension__ typedef __quad_t __off64_t;
__extension__ typedef int __pid_t;
__extension__ typedef struct { int __val[2]; } __fsid_t;
__extension__ typedef long int __clock_t;
__extension__ typedef unsigned long int __rlim_t;
__extension__ typedef __u_quad_t __rlim64_t;
__extension__ typedef unsigned int __id_t;
__extension__ typedef long int __time_t;
__extension__ typedef unsigned int __useconds_t;
__extension__ typedef long int __suseconds_t;

__extension__ typedef int __daddr_t;
__extension__ typedef int __key_t;


__extension__ typedef int __clockid_t;


__extension__ typedef void * __timer_t;


__extension__ typedef long int __blksize_t;




__extension__ typedef long int __blkcnt_t;
__extension__ typedef __quad_t __blkcnt64_t;


__extension__ typedef unsigned long int __fsblkcnt_t;
__extension__ typedef __u_quad_t __fsblkcnt64_t;


__extension__ typedef unsigned long int __fsfilcnt_t;
__extension__ typedef __u_quad_t __fsfilcnt64_t;


__extension__ typedef int __fsword_t;

__extension__ typedef int __ssize_t;


__extension__ typedef long int __syscall_slong_t;

__extension__ typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


__extension__ typedef int __intptr_t;


__extension__ typedef unsigned int __socklen_t;


#undef __STD_TYPE
# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/byteswap.h" 2 3 4


#define __bswap_constant_16(x) ((unsigned short int)((((x) >> 8) & 0xffu) |=
 (((x) & 0xffu) << 8)))



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/byteswap-16.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/byteswap-16.h" 3 4
#define __bswap_16(x) (__extension__ ({ unsigned short int __bsx =3D (unsig=
ned short int) (x); __bswap_constant_16 (__bsx); }))
# 35 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/byteswap.h" 2 3 4


#define __bswap_constant_32(x) ((((x) & 0xff000000u) >> 24) | (((x) & 0x00f=
f0000u) >> 8) | (((x) & 0x0000ff00u) << 8) | (((x) & 0x000000ffu) << 24))





static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
# 63 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/byteswap.h" 3 4
#define __bswap_constant_64(x) (__extension__ ((((x) & 0xff00000000000000ul=
l) >> 56) | (((x) & 0x00ff000000000000ull) >> 40) | (((x) & 0x0000ff0000000=
000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000f=
f000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x00000=
0000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56)))
# 74 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/byteswap.h" 3 4
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
# 61 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/endian.h" 2 3 4


#define htobe16(x) __bswap_16 (x)
#define htole16(x) (x)
#define be16toh(x) __bswap_16 (x)
#define le16toh(x) (x)

#define htobe32(x) __bswap_32 (x)
#define htole32(x) (x)
#define be32toh(x) __bswap_32 (x)
#define le32toh(x) (x)


#define htobe64(x) __bswap_64 (x)
#define htole64(x) (x)
#define be64toh(x) __bswap_64 (x)
#define le64toh(x) (x)
# 65 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/waitstatus.h" 2 3 4

union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };

#define w_termsig __wait_terminated.__w_termsig
#define w_coredump __wait_terminated.__w_coredump
#define w_retcode __wait_terminated.__w_retcode
#define w_stopsig __wait_stopped.__w_stopsig
#define w_stopval __wait_stopped.__w_stopval
# 43 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 2 3 4







#define __WAIT_INT(status) (__extension__ (((union { __typeof(status) __in;=
 int __i; }) { .__in =3D (status) }).__i))
# 67 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
typedef union
  {
    union wait *__uptr;
    int *__iptr;
  } __WAIT_STATUS __attribute__ ((__transparent_union__));
#define __WAIT_STATUS_DEFN int *
# 84 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
#define WEXITSTATUS(status) __WEXITSTATUS (__WAIT_INT (status))
#define WTERMSIG(status) __WTERMSIG (__WAIT_INT (status))
#define WSTOPSIG(status) __WSTOPSIG (__WAIT_INT (status))
#define WIFEXITED(status) __WIFEXITED (__WAIT_INT (status))
#define WIFSIGNALED(status) __WIFSIGNALED (__WAIT_INT (status))
#define WIFSTOPPED(status) __WIFSTOPPED (__WAIT_INT (status))

#define WIFCONTINUED(status) __WIFCONTINUED (__WAIT_INT (status))





typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;
#define __ldiv_t_defined 1






__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
#define __lldiv_t_defined 1





#define RAND_MAX 2147483647




#define EXIT_FAILURE 1
#define EXIT_SUCCESS 0



#define MB_CUR_MAX (__ctype_get_mb_cur_max ())
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , _=
_leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__))=
 __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));




__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));





__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));

# 276 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4

extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) atoi (const char *__nptr)
{
  return (int) strtol (__nptr, (char **) ((void *)0), 10);
}
extern __inline long int
__attribute__ ((__nothrow__ , __leaf__)) atol (const char *__nptr)
{
  return strtol (__nptr, (char **) ((void *)0), 10);
}




__extension__ extern __inline long long int
__attribute__ ((__nothrow__ , __leaf__)) atoll (const char *__nptr)
{
  return strtoll (__nptr, (char **) ((void *)0), 10);
}

# 305 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1))) ;




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 3 4
#define _SYS_TYPES_H 1









typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
#define __u_char_defined=20



typedef __loff_t loff_t;





typedef __ino64_t ino_t;

#define __ino_t_defined=20


typedef __ino64_t ino64_t;
#define __ino64_t_defined=20



typedef __dev_t dev_t;
#define __dev_t_defined=20



typedef __gid_t gid_t;
#define __gid_t_defined=20



typedef __mode_t mode_t;
#define __mode_t_defined=20



typedef __nlink_t nlink_t;
#define __nlink_t_defined=20



typedef __uid_t uid_t;
#define __uid_t_defined=20






typedef __off64_t off_t;

#define __off_t_defined=20


typedef __off64_t off64_t;
#define __off64_t_defined=20



typedef __pid_t pid_t;
#define __pid_t_defined=20




typedef __id_t id_t;
#define __id_t_defined=20



typedef __ssize_t ssize_t;
#define __ssize_t_defined=20




typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
#define __daddr_t_defined=20




typedef __key_t key_t;
#define __key_t_defined=20



#define __need_clock_t=20

#define __need_time_t=20
#define __need_timer_t=20
#define __need_clockid_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/time.h" 1 3 4
# 53 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#define __clock_t_defined 1





typedef __clock_t clock_t;






#undef __need_clock_t


#define __time_t_defined 1





typedef __time_t time_t;






#undef __need_time_t



#define __clockid_t_defined 1




typedef __clockid_t clockid_t;


#undef __clockid_time_t



#define __timer_t_defined 1




typedef __timer_t timer_t;


#undef __need_timer_t
# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timespec
# 133 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 2 3 4
# 145 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 3 4
#define __need_size_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 408 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_NULL
# 147 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 187 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 3 4
#define __intN_t(N,MODE) typedef int int ##N ##_t __attribute__ ((__mode__ =
(MODE)))

#define __u_intN_t(N,MODE) typedef unsigned int u_int ##N ##_t __attribute_=
_ ((__mode__ (MODE)))



#define __int8_t_defined=20
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));





#define __BIT_TYPES_DEFINED__ 1







# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/select.h" 1 3 4
# 22 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/select.h" 3 4
#define _SYS_SELECT_H 1







# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/select.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/select.h" 3 4
#define __FD_ZERO(s) do { unsigned int __i; fd_set *__arr =3D (s); for (__i=
 =3D 0; __i < sizeof (fd_set) / sizeof (__fd_mask); ++__i) __FDS_BITS (__ar=
r)[__i] =3D 0; } while (0)






#define __FD_SET(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] |=3D __FD_MASK(d=
)))

#define __FD_CLR(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] &=3D ~__FD_MASK(=
d)))

#define __FD_ISSET(d,s) ((__FDS_BITS (s)[__FD_ELT (d)] & __FD_MASK (d)) !=
=3D 0)
# 31 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/select.h" 2 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/sigset.h" 1 3 4
# 21 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigset.h" 3 4
#define _SIGSET_H_types 1

typedef int __sig_atomic_t;



#define _SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))
typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 34 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/select.h" 2 3 4


#define __sigset_t_defined=20
typedef __sigset_t sigset_t;



#define __need_time_t=20
#define __need_timespec=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/time.h" 1 3 4
# 66 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_clock_t
# 82 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_time_t
# 94 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __clockid_time_t
# 106 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timer_t







#define __timespec_defined 1





struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };


#undef __need_timespec
# 44 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/select.h" 2 3 4
#define __need_timeval=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 3 4
#define _STRUCT_TIMEVAL 1




struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 99 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 3 4
#undef __need_timeval
# 46 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/select.h" 2 3 4


typedef __suseconds_t suseconds_t;
#define __suseconds_t_defined=20




typedef long int __fd_mask;


#undef __NFDBITS

#define __NFDBITS (8 * (int) sizeof (__fd_mask))
#define __FD_ELT(d) ((d) / __NFDBITS)
#define __FD_MASK(d) ((__fd_mask) 1 << ((d) % __NFDBITS))


typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];
#define __FDS_BITS(set) ((set)->__fds_bits)

  } fd_set;


#define FD_SETSIZE __FD_SETSIZE



typedef __fd_mask fd_mask;


#define NFDBITS __NFDBITS




#define FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)
#define FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)
#define FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)
#define FD_ZERO(fdsetp) __FD_ZERO (fdsetp)



# 106 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 118 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 131 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/select.h" 3 4

# 220 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 2 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/sysmacros.h" 1 3 4
# 21 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/sysmacros.h" 3 4
#define _SYS_SYSMACROS_H 1









__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


__extension__ extern __inline __attribute__ ((__const__)) unsigned int
__attribute__ ((__nothrow__ , __leaf__)) gnu_dev_major (unsigned long long =
int __dev)
{
  return ((__dev >> 8) & 0xfff) | ((unsigned int) (__dev >> 32) & ~0xfff);
}

__extension__ extern __inline __attribute__ ((__const__)) unsigned int
__attribute__ ((__nothrow__ , __leaf__)) gnu_dev_minor (unsigned long long =
int __dev)
{
  return (__dev & 0xff) | ((unsigned int) (__dev >> 12) & ~0xff);
}

__extension__ extern __inline __attribute__ ((__const__)) unsigned long lon=
g int
__attribute__ ((__nothrow__ , __leaf__)) gnu_dev_makedev (unsigned int __ma=
jor, unsigned int __minor)
{
  return ((__minor & 0xff) | ((__major & 0xfff) << 8)
   | (((unsigned long long int) (__minor & ~0xff)) << 12)
   | (((unsigned long long int) (__major & ~0xfff)) << 32));
}




#define major(dev) gnu_dev_major (dev)
#define minor(dev) gnu_dev_minor (dev)
#define makedev(maj,min) gnu_dev_makedev (maj, min)
# 223 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;
#define __blksize_t_defined=20
# 248 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 3 4
typedef __blkcnt64_t blkcnt_t;
#define __blkcnt_t_defined=20


typedef __fsblkcnt64_t fsblkcnt_t;
#define __fsblkcnt_t_defined=20


typedef __fsfilcnt64_t fsfilcnt_t;
#define __fsfilcnt_t_defined=20




typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;





# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/pthreadtypes.h" 1 3 4
# 19 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/pthreadtypes.h" 3 4
#define _BITS_PTHREADTYPES_H 1



#define __SIZEOF_PTHREAD_ATTR_T 36
#define __SIZEOF_PTHREAD_MUTEX_T 24
#define __SIZEOF_PTHREAD_MUTEXATTR_T 4
#define __SIZEOF_PTHREAD_COND_T 48
#define __SIZEOF_PTHREAD_COND_COMPAT_T 12
#define __SIZEOF_PTHREAD_CONDATTR_T 4
#define __SIZEOF_PTHREAD_RWLOCK_T 32
#define __SIZEOF_PTHREAD_RWLOCKATTR_T 8
#define __SIZEOF_PTHREAD_BARRIER_T 20
#define __SIZEOF_PTHREAD_BARRIERATTR_T 4




typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[36];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;
#define __have_pthread_attr_t 1



typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;




typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;


    int __kind;
    unsigned int __nusers;
    __extension__ union
    {
      int __spins;
      __pthread_slist_t __list;
    };
  } __data;
  char __size[24];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  long int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  long int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{
  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
# 144 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/pthreadtypes.h" 3 4
    unsigned char __flags;
    unsigned char __shared;
    unsigned char __pad1;
    unsigned char __pad2;

    int __writer;
  } __data;
  char __size[32];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[20];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/types.h" 2 3 4



# 315 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __l=
eaf__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute_=
_ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __le=
af__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__=
)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));






extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __lea=
f__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __le=
af__));







extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__not=
hrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __le=
af__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothr=
ow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    unsigned long long int __a;
  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__=
)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__=
)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf_=
_)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));






#define __malloc_and_calloc_defined=20


extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) =
;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused=
_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));




extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/alloca.h" 1 3 4
# 19 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/alloca.h" 3 4
#define _ALLOCA_H 1



#define __need_size_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 408 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_NULL
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/alloca.h" 2 3 4




#undef alloca


extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__)=
);


#define alloca(size) __builtin_alloca (size)



# 492 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __si=
ze)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1))) ;
# 512 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4


extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribu=
te__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __l=
eaf__)) __attribute__ ((__nonnull__ (1)));
# 529 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4





extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg=
)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));






extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __=
attribute__ ((__noreturn__));













extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) _=
_attribute__ ((__noreturn__));






extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __le=
af__)) __attribute__ ((__nonnull__ (1))) ;

# 577 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__))=
 __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __le=
af__)) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
# 605 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf=
__)) __attribute__ ((__nonnull__ (1)));
# 622 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __asm__ ("" "mkstemp64")
     __attribute__ ((__nonnull__ (1))) ;





extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 644 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __asm__ ("" "mkstem=
ps64")
                     __attribute__ ((__nonnull__ (1))) ;





extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
# 662 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __lea=
f__)) __attribute__ ((__nonnull__ (1))) ;
# 711 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4





extern int system (const char *__command) ;

# 733 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf_=
_)) ;





#define __COMPAR_FN_T=20
typedef int (*__compar_fn_t) (const void *, const void *);
# 751 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4



extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;



extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 770 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribu=
te__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 807 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __att=
ribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __att=
ribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ (=
(__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ (=
(__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
3, 4, 5)));







extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ =
, __leaf__)) ;


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , =
__leaf__)) ;


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ =
, __leaf__)) ;



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __=
leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));








extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , _=
_leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 895 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2, 3))) ;
# 947 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/stdlib-float.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/stdlib-float.h" 3 4

extern __inline double
__attribute__ ((__nothrow__ , __leaf__)) atof (const char *__nptr)
{
  return strtod (__nptr, (char **) ((void *)0));
}

# 952 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 2 3 4
# 962 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdlib.h" 3 4
#undef __need_malloc_and_calloc


# 13 "util/callchain.c" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 1 3 4
# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
#define _STDIO_H 1




#define __need_size_t=20
#define __need_NULL=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL
# 34 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 2 3 4


#define __need_FILE=20
#define __need___FILE=20






struct _IO_FILE;



typedef struct _IO_FILE FILE;







#define __FILE_defined 1

#undef __need_FILE





typedef struct _IO_FILE __FILE;

#define ____FILE_defined 1

#undef __need___FILE



#define _STDIO_USES_IOSTREAM=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 1 3 4
# 30 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
#define _IO_STDIO_H=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/_G_config.h" 1 3 4




#define _G_config_h 1




#define __need_size_t=20



#define __need_NULL=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL
# 16 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/_G_config.h" 2 3 4
#define __need_mbstate_t=20



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/wchar.h" 1 3 4
# 80 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/wchar.h" 3 4
#define ____mbstate_t_defined 1

typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;

#undef __need_mbstate_t
# 899 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/wchar.h" 3 4
#undef __need_mbstate_t
#undef __need_wint_t
# 21 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 46 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/_G_config.h" 3 4
#define _G_va_list __gnuc_va_list

#define _G_HAVE_MMAP 1
#define _G_HAVE_MREMAP 1

#define _G_IO_IO_FILE_VERSION 0x20001


#define _G_HAVE_ST_BLKSIZE defined (_STATBUF_ST_BLKSIZE)

#define _G_BUFSIZ 8192
# 33 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 2 3 4

#define _IO_fpos_t _G_fpos_t
#define _IO_fpos64_t _G_fpos64_t
#define _IO_size_t size_t
#define _IO_ssize_t __ssize_t
#define _IO_off_t __off_t
#define _IO_off64_t __off64_t
#define _IO_pid_t __pid_t
#define _IO_uid_t __uid_t
#define _IO_iconv_t _G_iconv_t
#define _IO_HAVE_ST_BLKSIZE _G_HAVE_ST_BLKSIZE
#define _IO_BUFSIZ _G_BUFSIZ
#define _IO_va_list _G_va_list
#define _IO_wint_t wint_t


#define __need___va_list=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stdarg.h" 1 3 4
# 34 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include/stdarg.h" 3 4
#undef __need___va_list




#define __GNUC_VA_LIST=20
typedef __builtin_va_list __gnuc_va_list;
# 51 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 2 3 4

#undef _IO_va_list
#define _IO_va_list __gnuc_va_list






#define _IO_UNIFIED_JUMPTABLES 1


#define EOF (-1)
# 78 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
#define _IOS_INPUT 1
#define _IOS_OUTPUT 2
#define _IOS_ATEND 4
#define _IOS_APPEND 8
#define _IOS_TRUNC 16
#define _IOS_NOCREATE 32
#define _IOS_NOREPLACE 64
#define _IOS_BIN 128







#define _IO_MAGIC 0xFBAD0000
#define _OLD_STDIO_MAGIC 0xFABC0000
#define _IO_MAGIC_MASK 0xFFFF0000
#define _IO_USER_BUF 1
#define _IO_UNBUFFERED 2
#define _IO_NO_READS 4
#define _IO_NO_WRITES 8
#define _IO_EOF_SEEN 0x10
#define _IO_ERR_SEEN 0x20
#define _IO_DELETE_DONT_CLOSE 0x40
#define _IO_LINKED 0x80
#define _IO_IN_BACKUP 0x100
#define _IO_LINE_BUF 0x200
#define _IO_TIED_PUT_GET 0x400
#define _IO_CURRENTLY_PUTTING 0x800
#define _IO_IS_APPENDING 0x1000
#define _IO_IS_FILEBUF 0x2000
#define _IO_BAD_SEEN 0x4000
#define _IO_USER_LOCK 0x8000

#define _IO_FLAGS2_MMAP 1
#define _IO_FLAGS2_NOTCANCEL 2



#define _IO_FLAGS2_USER_WBUF 8







#define _IO_SKIPWS 01
#define _IO_LEFT 02
#define _IO_RIGHT 04
#define _IO_INTERNAL 010
#define _IO_DEC 020
#define _IO_OCT 040
#define _IO_HEX 0100
#define _IO_SHOWBASE 0200
#define _IO_SHOWPOINT 0400
#define _IO_UPPERCASE 01000
#define _IO_SHOWPOS 02000
#define _IO_SCIENTIFIC 04000
#define _IO_FIXED 010000
#define _IO_UNITBUF 020000
#define _IO_STDIO 040000
#define _IO_DONT_CLOSE 0100000
#define _IO_BOOLALPHA 0200000


struct _IO_jump_t; struct _IO_FILE;
# 155 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 178 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 246 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;
#define _IO_file_flags _flags



  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;

#define __HAVE_COLUMN=20

  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 294 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
  __off64_t _offset;
# 303 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;

#define _IO_stdin ((_IO_FILE*)(&_IO_2_1_stdin_))
#define _IO_stdout ((_IO_FILE*)(&_IO_2_1_stdout_))
#define _IO_stderr ((_IO_FILE*)(&_IO_2_1_stderr_))
# 339 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbyte=
s);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 391 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);







#define _IO_BE(expr,res) __builtin_expect ((expr), res)




#define _IO_getc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >=3D (_fp)->_IO=
_read_end, 0) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)


#define _IO_peekc_unlocked(_fp) (_IO_BE ((_fp)->_IO_read_ptr >=3D (_fp)->_I=
O_read_end, 0) && __underflow (_fp) =3D=3D EOF ? EOF : *(unsigned char *) (=
_fp)->_IO_read_ptr)



#define _IO_putc_unlocked(_ch,_fp) (_IO_BE ((_fp)->_IO_write_ptr >=3D (_fp)=
->_IO_write_end, 0) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned c=
har) (*(_fp)->_IO_write_ptr++ =3D (_ch)))
# 432 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
#define _IO_feof_unlocked(__fp) (((__fp)->_flags & _IO_EOF_SEEN) !=3D 0)
#define _IO_ferror_unlocked(__fp) (((__fp)->_flags & _IO_ERR_SEEN) !=3D 0)

extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__=
));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf=
__));

extern int _IO_peekc_locked (_IO_FILE *__fp);


#define _IO_PENDING_OUTPUT_COUNT(_fp) ((_fp)->_IO_write_ptr - (_fp)->_IO_wr=
ite_base)


extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf=
__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __le=
af__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __le=
af__));
# 457 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/libio.h" 3 4
#define _IO_peekc(_fp) _IO_peekc_unlocked (_fp)
#define _IO_flockfile(_fp)=20
#define _IO_funlockfile(_fp)=20
#define _IO_ftrylockfile(_fp)=20
#define _IO_cleanup_region_start(_fct,_fp)=20
#define _IO_cleanup_region_end(_Doit)=20


extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ ,=
 __leaf__));
# 75 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
#define _VA_LIST_DEFINED=20
# 108 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4




typedef _G_fpos64_t fpos_t;



typedef _G_fpos64_t fpos64_t;



#define _IOFBF 0
#define _IOLBF 1
#define _IONBF 2




#define BUFSIZ _IO_BUFSIZ
# 140 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2
# 151 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
#define P_tmpdir "/tmp"
# 164 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/stdio_lim.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/stdio_lim.h" 3 4
#define L_tmpnam 20
#define TMP_MAX 238328
#define FILENAME_MAX 4096


#define L_ctermid 9







#undef FOPEN_MAX
#define FOPEN_MAX 16
# 165 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;

#define stdin stdin
#define stdout stdout
#define stderr stderr



extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __=
leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__=
nothrow__ , __leaf__));




extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));



# 198 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern FILE *tmpfile (void) __asm__ ("" "tmpfile64") ;






extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) =
;
# 227 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) =
;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 252 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 266 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4

# 283 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename, const char *__restri=
ct __modes) __asm__ ("" "fopen64")

  ;
extern FILE *freopen (const char *__restrict __filename, const char *__rest=
rict __modes, FILE *__restrict __stream) __asm__ ("" "freopen64")


  ;







extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothr=
ow__ , __leaf__)) ;
# 319 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribut=
e__ ((__nothrow__ , __leaf__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __at=
tribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __lea=
f__));








extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, =
3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, =
3, 0)));

# 412 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __=
leaf__));
# 443 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, const char *__restrict __form=
at, ...) __asm__ ("" "__isoc99_fscanf")

                               ;
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc=
99_scanf")
                              ;
extern int sscanf (const char *__restrict __s, const char *__restrict __for=
mat, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __le=
af__))

                      ;
# 463 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (_=
_scanf__, 2, 0)));
# 494 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, =
__gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) _=
_asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __fo=
rmat, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ (=
(__nothrow__ , __leaf__))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 522 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);




#define getc(_fp) _IO_getc (_fp)






extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 561 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);




#define putc(_ch,_fp) _IO_putc (_ch, _fp)
# 594 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __strea=
m)
     ;
# 638 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern char *gets (char *__s) __attribute__ ((__deprecated__));


# 665 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 737 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 781 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off64_t __off, int __whence) __asm__ (=
"" "fseeko64")

                  ;
extern __off64_t ftello (FILE *__stream) __asm__ ("" "ftello64");








# 806 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos) __=
asm__ ("" "fgetpos64")
                                          ;
extern int fsetpos (FILE *__stream, const fpos_t *__pos) __asm__ ("" "fsetp=
os64")
                                                          ;








extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos=
);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);




extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf_=
_));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__))=
 ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ =
, __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __l=
eaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , _=
_leaf__)) ;








extern void perror (const char *__s);






# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/sys_errlist.h" 1 3 4
# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];
# 854 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__))=
 ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , _=
_leaf__)) ;
# 873 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));
# 913 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf=
__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __le=
af__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __le=
af__));
# 934 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/stdio.h" 1 3 4
# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/stdio.h" 3 4
#define __STDIO_INLINE __extern_inline
# 35 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/stdio.h" 3 4
extern __inline int
vprintf (const char *__restrict __fmt, __gnuc_va_list __arg)
{
  return vfprintf (stdout, __fmt, __arg);
}



extern __inline int
getchar (void)
{
  return _IO_getc (stdin);
}




extern __inline int
fgetc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >=3D (__fp)->_IO_read_end=
), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}





extern __inline int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >=3D (__fp)->_IO_read_end=
), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}


extern __inline int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >=3D (stdin)->_IO_read_e=
nd), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}




extern __inline int
putchar (int __c)
{
  return _IO_putc (__c, stdout);
}




extern __inline int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >=3D (__stream)->_IO=
_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned =
char) (*(__stream)->_IO_write_ptr++ =3D (__c)));
}





extern __inline int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >=3D (__stream)->_IO=
_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned =
char) (*(__stream)->_IO_write_ptr++ =3D (__c)));
}


extern __inline int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >=3D (stdout)->_IO_wri=
te_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) =
(*(stdout)->_IO_write_ptr++ =3D (__c)));
}
# 124 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/stdio.h" 3 4
extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x10) !=3D 0);
}


extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x20) !=3D 0);
}
# 144 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/stdio.h" 3 4
#define fread_unlocked(ptr,size,n,stream) (__extension__ ((__builtin_consta=
nt_p (size) && __builtin_constant_p (n) && (size_t) (size) * (size_t) (n) <=
=3D 8 && (size_t) (size) !=3D 0) ? ({ char *__ptr =3D (char *) (ptr); FILE =
*__stream =3D (stream); size_t __cnt; for (__cnt =3D (size_t) (size) * (siz=
e_t) (n); __cnt > 0; --__cnt) { int __c =3D _IO_getc_unlocked (__stream); i=
f (__c =3D=3D EOF) break; *__ptr++ =3D __c; } ((size_t) (size) * (size_t) (=
n) - __cnt) / (size_t) (size); }) : (((__builtin_constant_p (size) && (size=
_t) (size) =3D=3D 0) || (__builtin_constant_p (n) && (size_t) (n) =3D=3D 0)=
) ? ((void) (ptr), (void) (stream), (void) (size), (void) (n), (size_t) 0) =
: fread_unlocked (ptr, size, n, stream))))
# 168 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/stdio.h" 3 4
#define fwrite_unlocked(ptr,size,n,stream) (__extension__ ((__builtin_const=
ant_p (size) && __builtin_constant_p (n) && (size_t) (size) * (size_t) (n) =
<=3D 8 && (size_t) (size) !=3D 0) ? ({ const char *__ptr =3D (const char *)=
 (ptr); FILE *__stream =3D (stream); size_t __cnt; for (__cnt =3D (size_t) =
(size) * (size_t) (n); __cnt > 0; --__cnt) if (_IO_putc_unlocked (*__ptr++,=
 __stream) =3D=3D EOF) break; ((size_t) (size) * (size_t) (n) - __cnt) / (s=
ize_t) (size); }) : (((__builtin_constant_p (size) && (size_t) (size) =3D=
=3D 0) || (__builtin_constant_p (n) && (size_t) (n) =3D=3D 0)) ? ((void) (p=
tr), (void) (stream), (void) (size), (void) (n), (size_t) 0) : fwrite_unloc=
ked (ptr, size, n, stream))))
# 190 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/stdio.h" 3 4
#undef __STDIO_INLINE
# 935 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 2 3 4
# 943 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdio.h" 3 4

# 14 "util/callchain.c" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stdbool.h" 1 3 4
# 29 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include/stdbool.h" 3 4
#define _STDBOOL_H=20



#define bool _Bool
#define true 1
#define false 0
# 48 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include/stdbool.h" 3 4
#define __bool_true_false_are_defined 1
# 15 "util/callchain.c" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/errno.h" 1 3 4
# 27 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/errno.h" 3 4
#define _ERRNO_H 1







# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/errno.h" 1 3 4
# 21 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/errno.h" 3 4
#undef EDOM
#undef EILSEQ
#undef ERANGE
# 1 "../../include/linux/errno.h" 1 3 4

#define _LINUX_ERRNO_H=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/errno.h" 1 3 4
# 1 "../../include/asm-generic/errno.h" 1 3 4

#define _ASM_GENERIC_ERRNO_H=20

# 1 "../../include/asm-generic/errno-base.h" 1 3 4

#define _ASM_GENERIC_ERRNO_BASE_H=20

#define EPERM 1
#define ENOENT 2
#define ESRCH 3
#define EINTR 4
#define EIO 5
#define ENXIO 6
#define E2BIG 7
#define ENOEXEC 8
#define EBADF 9
#define ECHILD 10
#define EAGAIN 11
#define ENOMEM 12
#define EACCES 13
#define EFAULT 14
#define ENOTBLK 15
#define EBUSY 16
#define EEXIST 17
#define EXDEV 18
#define ENODEV 19
#define ENOTDIR 20
#define EISDIR 21
#define EINVAL 22
#define ENFILE 23
#define EMFILE 24
#define ENOTTY 25
#define ETXTBSY 26
#define EFBIG 27
#define ENOSPC 28
#define ESPIPE 29
#define EROFS 30
#define EMLINK 31
#define EPIPE 32
#define EDOM 33
#define ERANGE 34
# 5 "../../include/asm-generic/errno.h" 2 3 4

#define EDEADLK 35
#define ENAMETOOLONG 36
#define ENOLCK 37
#define ENOSYS 38
#define ENOTEMPTY 39
#define ELOOP 40
#define EWOULDBLOCK EAGAIN
#define ENOMSG 42
#define EIDRM 43
#define ECHRNG 44
#define EL2NSYNC 45
#define EL3HLT 46
#define EL3RST 47
#define ELNRNG 48
#define EUNATCH 49
#define ENOCSI 50
#define EL2HLT 51
#define EBADE 52
#define EBADR 53
#define EXFULL 54
#define ENOANO 55
#define EBADRQC 56
#define EBADSLT 57

#define EDEADLOCK EDEADLK

#define EBFONT 59
#define ENOSTR 60
#define ENODATA 61
#define ETIME 62
#define ENOSR 63
#define ENONET 64
#define ENOPKG 65
#define EREMOTE 66
#define ENOLINK 67
#define EADV 68
#define ESRMNT 69
#define ECOMM 70
#define EPROTO 71
#define EMULTIHOP 72
#define EDOTDOT 73
#define EBADMSG 74
#define EOVERFLOW 75
#define ENOTUNIQ 76
#define EBADFD 77
#define EREMCHG 78
#define ELIBACC 79
#define ELIBBAD 80
#define ELIBSCN 81
#define ELIBMAX 82
#define ELIBEXEC 83
#define EILSEQ 84
#define ERESTART 85
#define ESTRPIPE 86
#define EUSERS 87
#define ENOTSOCK 88
#define EDESTADDRREQ 89
#define EMSGSIZE 90
#define EPROTOTYPE 91
#define ENOPROTOOPT 92
#define EPROTONOSUPPORT 93
#define ESOCKTNOSUPPORT 94
#define EOPNOTSUPP 95
#define EPFNOSUPPORT 96
#define EAFNOSUPPORT 97
#define EADDRINUSE 98
#define EADDRNOTAVAIL 99
#define ENETDOWN 100
#define ENETUNREACH 101
#define ENETRESET 102
#define ECONNABORTED 103
#define ECONNRESET 104
#define ENOBUFS 105
#define EISCONN 106
#define ENOTCONN 107
#define ESHUTDOWN 108
#define ETOOMANYREFS 109
#define ETIMEDOUT 110
#define ECONNREFUSED 111
#define EHOSTDOWN 112
#define EHOSTUNREACH 113
#define EALREADY 114
#define EINPROGRESS 115
#define ESTALE 116
#define EUCLEAN 117
#define ENOTNAM 118
#define ENAVAIL 119
#define EISNAM 120
#define EREMOTEIO 121
#define EDQUOT 122

#define ENOMEDIUM 123
#define EMEDIUMTYPE 124
#define ECANCELED 125
#define ENOKEY 126
#define EKEYEXPIRED 127
#define EKEYREVOKED 128
#define EKEYREJECTED 129


#define EOWNERDEAD 130
#define ENOTRECOVERABLE 131

#define ERFKILL 132
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/errno.h" 2 3 4
# 5 "../../include/linux/errno.h" 2 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/errno.h" 2 3 4


#define ENOTSUP EOPNOTSUPP
# 45 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/errno.h" 3 4
#define EHWPOISON 133




extern int *__errno_location (void) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__const__));



#define errno (*__errno_location ())
# 36 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/errno.h" 2 3 4
#undef __need_Emath
# 58 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/errno.h" 3 4

# 16 "util/callchain.c" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/math.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#define _MATH_H 1







# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/huge_val.h" 1 3 4
# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/huge_val.h" 3 4
#define HUGE_VAL (__builtin_huge_val())
# 34 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/huge_valf.h" 1 3 4
# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/huge_valf.h" 3 4
#define HUGE_VALF (__builtin_huge_valf())
# 36 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/huge_vall.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/huge_vall.h" 3 4
#define HUGE_VALL (__builtin_huge_vall())
# 37 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/inf.h" 1 3 4
# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/inf.h" 3 4
#define INFINITY (__builtin_inff())
# 40 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/nan.h" 1 3 4
# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/nan.h" 3 4
#define NAN (__builtin_nanf (""))
# 43 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/mathdef.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathdef.h" 3 4
#define _MATH_H_MATHDEF 1


typedef float float_t;

typedef double double_t;



#define FP_ILOGB0 (-2147483647)
#define FP_ILOGBNAN (2147483647)
# 55 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathdef.h" 3 4
#define __NO_LONG_DOUBLE_MATH 1
# 47 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4






#define __MATHCALL(function,suffix,args) __MATHDECL (_Mdouble_,function,suf=
fix, args)

#define __MATHDECL(type,function,suffix,args) __MATHDECL_1(type, function,s=
uffix, args); __MATHDECL_1(type, __CONCAT(__,function),suffix, args)


#define __MATHCALLX(function,suffix,args,attrib) __MATHDECLX (_Mdouble_,fun=
ction,suffix, args, attrib)

#define __MATHDECLX(type,function,suffix,args,attrib) __MATHDECL_1(type, fu=
nction,suffix, args) __attribute__ (attrib); __MATHDECL_1(type, __CONCAT(__=
,function),suffix, args) __attribute__ (attrib)


#define __MATHDECL_1(type,function,suffix,args) extern type __MATH_PRECNAME=
(function,suffix) args __THROW


#define _Mdouble_ double
#define __MATH_PRECNAME(name,r) __CONCAT(name,r)
#define _Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_STD
#define _Mdouble_END_NAMESPACE __END_NAMESPACE_STD
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 1 3 4
# 52 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 3 4


extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , =
__leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((=
__nothrow__ , __leaf__));


extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));

# 86 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 3 4


extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); =
extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__))=
;

extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); =
extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__))=
;

extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); =
extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__))=
;







extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow=
__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attr=
ibute__ ((__nothrow__ , __leaf__));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow_=
_ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attrib=
ute__ ((__nothrow__ , __leaf__));


extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); =
extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__))=
;


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__=
 , __leaf__)); extern double __modf (double __x, double *__iptr) __attribut=
e__ ((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (2)));

# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 3 4


extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); =
extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__))=
;


extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); =
extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__))=
;


extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));








extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __=
leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__no=
throw__ , __leaf__));


extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));





extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , =
__leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((=
__nothrow__ , __leaf__));






extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));








extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __=
attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ =
((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __=
attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ =
((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) _=
_attribute__ ((__const__)); extern double __floor (double __x) __attribute_=
_ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , _=
_leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__=
nothrow__ , __leaf__));




extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__=
)) __attribute__ ((__const__));





extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) =
__attribute__ ((__const__));


extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__))=
 __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , _=
_leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__=
nothrow__ , __leaf__));



extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf=
__)); extern double __significand (double __x) __attribute__ ((__nothrow__ =
, __leaf__));





extern double copysign (double __x, double __y) __attribute__ ((__nothrow__=
 , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double=
 __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((=
__const__));






extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf=
__)) __attribute__ ((__const__)); extern double __nan (const char *__tagb) =
__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__const__));



extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) =
__attribute__ ((__const__));


extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern =
double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern =
double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern =
double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern =
double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));






extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern=
 double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); exter=
n double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));






extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));





extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); exte=
rn double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));






extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow_=
_ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attrib=
ute__ ((__nothrow__ , __leaf__));







extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow_=
_ , __leaf__)) __attribute__ ((__const__)); extern double __nextafter (doub=
le __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ =
((__const__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__no=
throw__ , __leaf__)) __attribute__ ((__const__)); extern double __nexttowar=
d (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __=
attribute__ ((__const__));



extern double remainder (double __x, double __y) __attribute__ ((__nothrow_=
_ , __leaf__)); extern double __remainder (double __x, double __y) __attrib=
ute__ ((__nothrow__ , __leaf__));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __=
leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__no=
throw__ , __leaf__));



extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow_=
_ , __leaf__)); extern double __scalbln (double __x, long int __n) __attrib=
ute__ ((__nothrow__ , __leaf__));



extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__=
)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __=
leaf__));



extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) _=
_attribute__ ((__const__)); extern double __round (double __x) __attribute_=
_ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) _=
_attribute__ ((__const__)); extern double __trunc (double __x) __attribute_=
_ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((_=
_nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, in=
t *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__))=
; extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf=
__));
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __le=
af__)); extern long long int __llrint (double __x) __attribute__ ((__nothro=
w__ , __leaf__));



extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)=
); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __le=
af__));
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __l=
eaf__)); extern long long int __llround (double __x) __attribute__ ((__noth=
row__ , __leaf__));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , _=
_leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__=
nothrow__ , __leaf__));


extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , _=
_leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, do=
uble __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const_=
_));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , _=
_leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, do=
uble __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const_=
_));



extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __le=
af__))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf_=
_))
     __attribute__ ((__const__));



extern double fma (double __x, double __y, double __z) __attribute__ ((__no=
throw__ , __leaf__)); extern double __fma (double __x, double __y, double _=
_z) __attribute__ ((__nothrow__ , __leaf__));








extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , =
__leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((=
__nothrow__ , __leaf__));
# 71 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4
#undef _Mdouble_
#undef _Mdouble_BEGIN_NAMESPACE
#undef _Mdouble_END_NAMESPACE
#undef __MATH_PRECNAME
# 83 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#define _Mfloat_ float

#define _Mdouble_ _Mfloat_
#define __MATH_PRECNAME(name,r) name ##f ##r
#define _Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_C99
#define _Mdouble_END_NAMESPACE __END_NAMESPACE_C99
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 1 3 4
# 52 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 3 4


extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __=
leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__no=
throw__ , __leaf__));


extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

# 86 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 3 4


extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));







extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow_=
_ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attrib=
ute__ ((__nothrow__ , __leaf__));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__=
 , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribut=
e__ ((__nothrow__ , __leaf__));


extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ ,=
 __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ =
((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (2)));

# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 3 4


extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); e=
xtern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));








extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __le=
af__)); extern float __powf (float __x, float __y) __attribute__ ((__nothro=
w__ , __leaf__));


extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));





extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __=
leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__no=
throw__ , __leaf__));






extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));








extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __a=
ttribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((=
__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __a=
ttribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((=
__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __=
attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ =
((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __l=
eaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__noth=
row__ , __leaf__));




extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__=
)) __attribute__ ((__const__));





extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) =
__attribute__ ((__const__));


extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__))=
 __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __l=
eaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__noth=
row__ , __leaf__));



extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf_=
_)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , =
__leaf__));





extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ ,=
 __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __=
x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__co=
nst__));






extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf=
__)) __attribute__ ((__const__)); extern float __nanf (const char *__tagb) =
__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__const__));



extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) =
__attribute__ ((__const__));


extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern f=
loat __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern f=
loat __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern f=
loat __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern f=
loat __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));






extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern =
float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern=
 float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); exte=
rn float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));






extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); exte=
rn float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));





extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); exter=
n float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));






extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__=
 , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribut=
e__ ((__nothrow__ , __leaf__));







extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ex=
tern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ =
, __leaf__)) __attribute__ ((__const__)); extern float __nextafterf (float =
__x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__=
const__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__not=
hrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nexttowardf=
 (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __at=
tribute__ ((__const__));



extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ =
, __leaf__)); extern float __remainderf (float __x, float __y) __attribute_=
_ ((__nothrow__ , __leaf__));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __l=
eaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__noth=
row__ , __leaf__));



extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); ext=
ern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__=
 , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribut=
e__ ((__nothrow__ , __leaf__));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)=
); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __le=
af__));



extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __=
attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ =
((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __=
attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ =
((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__n=
othrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *_=
_quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__))=
; extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf=
__));
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __le=
af__)); extern long long int __llrintf (float __x) __attribute__ ((__nothro=
w__ , __leaf__));



extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)=
); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __le=
af__));
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __l=
eaf__)); extern long long int __llroundf (float __x) __attribute__ ((__noth=
row__ , __leaf__));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __l=
eaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__noth=
row__ , __leaf__));


extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __l=
eaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float=
 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __l=
eaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float=
 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __le=
af__))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf_=
_))
     __attribute__ ((__const__));



extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothr=
ow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __=
attribute__ ((__nothrow__ , __leaf__));








extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __=
leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__no=
throw__ , __leaf__));
# 90 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4
#undef _Mdouble_
#undef _Mdouble_BEGIN_NAMESPACE
#undef _Mdouble_END_NAMESPACE
#undef __MATH_PRECNAME
# 117 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#undef __MATHDECL_1
#define __MATHDECL_2(type,function,suffix,args,alias) extern type __REDIREC=
T_NTH(__MATH_PRECNAME(function,suffix), args, alias)


#define __MATHDECL_1(type,function,suffix,args) __MATHDECL_2(type, function=
,suffix, args, __CONCAT(function,suffix))







#define _Mlong_double_ long double

#define _Mdouble_ _Mlong_double_
#define __MATH_PRECNAME(name,r) name ##l ##r
#define _Mdouble_BEGIN_NAMESPACE __BEGIN_NAMESPACE_C99
#define _Mdouble_END_NAMESPACE __END_NAMESPACE_C99
#define __MATH_DECLARE_LDOUBLE 1
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 1 3 4
# 52 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 3 4


extern long double acosl (long double __x) __asm__ ("" "acos") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) =
__asm__ ("" "__acos") __attribute__ ((__nothrow__ , __leaf__));

extern long double asinl (long double __x) __asm__ ("" "asin") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) =
__asm__ ("" "__asin") __attribute__ ((__nothrow__ , __leaf__));

extern long double atanl (long double __x) __asm__ ("" "atan") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) =
__asm__ ("" "__atan") __attribute__ ((__nothrow__ , __leaf__));

extern long double atan2l (long double __y, long double __x) __asm__ ("" "a=
tan2") __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2=
l (long double __y, long double __x) __asm__ ("" "__atan2") __attribute__ (=
(__nothrow__ , __leaf__));


extern long double cosl (long double __x) __asm__ ("" "cos") __attribute__ =
((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __a=
sm__ ("" "__cos") __attribute__ ((__nothrow__ , __leaf__));

extern long double sinl (long double __x) __asm__ ("" "sin") __attribute__ =
((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __a=
sm__ ("" "__sin") __attribute__ ((__nothrow__ , __leaf__));

extern long double tanl (long double __x) __asm__ ("" "tan") __attribute__ =
((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __a=
sm__ ("" "__tan") __attribute__ ((__nothrow__ , __leaf__));




extern long double coshl (long double __x) __asm__ ("" "cosh") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) =
__asm__ ("" "__cosh") __attribute__ ((__nothrow__ , __leaf__));

extern long double sinhl (long double __x) __asm__ ("" "sinh") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) =
__asm__ ("" "__sinh") __attribute__ ((__nothrow__ , __leaf__));

extern long double tanhl (long double __x) __asm__ ("" "tanh") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) =
__asm__ ("" "__tanh") __attribute__ ((__nothrow__ , __leaf__));

# 86 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 3 4


extern long double acoshl (long double __x) __asm__ ("" "acosh") __attribut=
e__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __=
x) __asm__ ("" "__acosh") __attribute__ ((__nothrow__ , __leaf__));

extern long double asinhl (long double __x) __asm__ ("" "asinh") __attribut=
e__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __=
x) __asm__ ("" "__asinh") __attribute__ ((__nothrow__ , __leaf__));

extern long double atanhl (long double __x) __asm__ ("" "atanh") __attribut=
e__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __=
x) __asm__ ("" "__atanh") __attribute__ ((__nothrow__ , __leaf__));







extern long double expl (long double __x) __asm__ ("" "exp") __attribute__ =
((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __a=
sm__ ("" "__exp") __attribute__ ((__nothrow__ , __leaf__));


extern long double frexpl (long double __x, int *__exponent) __asm__ ("" "f=
rexp") __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexp=
l (long double __x, int *__exponent) __asm__ ("" "__frexp") __attribute__ (=
(__nothrow__ , __leaf__));


extern long double ldexpl (long double __x, int __exponent) __asm__ ("" "ld=
exp") __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl=
 (long double __x, int __exponent) __asm__ ("" "__ldexp") __attribute__ ((_=
_nothrow__ , __leaf__));


extern long double logl (long double __x) __asm__ ("" "log") __attribute__ =
((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __a=
sm__ ("" "__log") __attribute__ ((__nothrow__ , __leaf__));


extern long double log10l (long double __x) __asm__ ("" "log10") __attribut=
e__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __=
x) __asm__ ("" "__log10") __attribute__ ((__nothrow__ , __leaf__));


extern long double modfl (long double __x, long double *__iptr) __asm__ (""=
 "modf") __attribute__ ((__nothrow__ , __leaf__)); extern long double __mod=
fl (long double __x, long double *__iptr) __asm__ ("" "__modf") __attribute=
__ ((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (2)));

# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/mathcalls.h" 3 4


extern long double expm1l (long double __x) __asm__ ("" "expm1") __attribut=
e__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __=
x) __asm__ ("" "__expm1") __attribute__ ((__nothrow__ , __leaf__));


extern long double log1pl (long double __x) __asm__ ("" "log1p") __attribut=
e__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __=
x) __asm__ ("" "__log1p") __attribute__ ((__nothrow__ , __leaf__));


extern long double logbl (long double __x) __asm__ ("" "logb") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) =
__asm__ ("" "__logb") __attribute__ ((__nothrow__ , __leaf__));






extern long double exp2l (long double __x) __asm__ ("" "exp2") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) =
__asm__ ("" "__exp2") __attribute__ ((__nothrow__ , __leaf__));


extern long double log2l (long double __x) __asm__ ("" "log2") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) =
__asm__ ("" "__log2") __attribute__ ((__nothrow__ , __leaf__));








extern long double powl (long double __x, long double __y) __asm__ ("" "pow=
") __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (lon=
g double __x, long double __y) __asm__ ("" "__pow") __attribute__ ((__nothr=
ow__ , __leaf__));


extern long double sqrtl (long double __x) __asm__ ("" "sqrt") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) =
__asm__ ("" "__sqrt") __attribute__ ((__nothrow__ , __leaf__));





extern long double hypotl (long double __x, long double __y) __asm__ ("" "h=
ypot") __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypot=
l (long double __x, long double __y) __asm__ ("" "__hypot") __attribute__ (=
(__nothrow__ , __leaf__));






extern long double cbrtl (long double __x) __asm__ ("" "cbrt") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) =
__asm__ ("" "__cbrt") __attribute__ ((__nothrow__ , __leaf__));








extern long double ceill (long double __x) __asm__ ("" "ceil") __attribute_=
_ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long doubl=
e __ceill (long double __x) __asm__ ("" "__ceil") __attribute__ ((__nothrow=
__ , __leaf__)) __attribute__ ((__const__));


extern long double fabsl (long double __x) __asm__ ("" "fabs") __attribute_=
_ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long doubl=
e __fabsl (long double __x) __asm__ ("" "__fabs") __attribute__ ((__nothrow=
__ , __leaf__)) __attribute__ ((__const__));


extern long double floorl (long double __x) __asm__ ("" "floor") __attribut=
e__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long dou=
ble __floorl (long double __x) __asm__ ("" "__floor") __attribute__ ((__not=
hrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __asm__ ("" "fm=
od") __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (=
long double __x, long double __y) __asm__ ("" "__fmod") __attribute__ ((__n=
othrow__ , __leaf__));




extern int __isinfl (long double __value) __asm__ ("" "__isinf") __attribut=
e__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitel (long double __value) __asm__ ("" "__finite") __attrib=
ute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int isinfl (long double __value) __asm__ ("" "isinf") __attribute__ =
((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int finitel (long double __value) __asm__ ("" "finite") __attribute_=
_ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __asm__ ("" "dr=
em") __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (=
long double __x, long double __y) __asm__ ("" "__drem") __attribute__ ((__n=
othrow__ , __leaf__));



extern long double significandl (long double __x) __asm__ ("" "significand"=
) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significan=
dl (long double __x) __asm__ ("" "__significand") __attribute__ ((__nothrow=
__ , __leaf__));





extern long double copysignl (long double __x, long double __y) __asm__ (""=
 "copysign") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__con=
st__)); extern long double __copysignl (long double __x, long double __y) _=
_asm__ ("" "__copysign") __attribute__ ((__nothrow__ , __leaf__)) __attribu=
te__ ((__const__));






extern long double nanl (const char *__tagb) __asm__ ("" "nan") __attribute=
__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long doub=
le __nanl (const char *__tagb) __asm__ ("" "__nan") __attribute__ ((__nothr=
ow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnanl (long double __value) __asm__ ("" "__isnan") __attribut=
e__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int isnanl (long double __value) __asm__ ("" "isnan") __attribute__ =
((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double j0l (long double) __asm__ ("" "j0") __attribute__ ((__no=
throw__ , __leaf__)); extern long double __j0l (long double) __asm__ ("" "_=
_j0") __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __asm__ ("" "j1") __attribute__ ((__no=
throw__ , __leaf__)); extern long double __j1l (long double) __asm__ ("" "_=
_j1") __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __asm__ ("" "jn") __attribute__ (=
(__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __as=
m__ ("" "__jn") __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __asm__ ("" "y0") __attribute__ ((__no=
throw__ , __leaf__)); extern long double __y0l (long double) __asm__ ("" "_=
_y0") __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __asm__ ("" "y1") __attribute__ ((__no=
throw__ , __leaf__)); extern long double __y1l (long double) __asm__ ("" "_=
_y1") __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __asm__ ("" "yn") __attribute__ (=
(__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __as=
m__ ("" "__yn") __attribute__ ((__nothrow__ , __leaf__));






extern long double erfl (long double) __asm__ ("" "erf") __attribute__ ((__=
nothrow__ , __leaf__)); extern long double __erfl (long double) __asm__ (""=
 "__erf") __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __asm__ ("" "erfc") __attribute__ ((=
__nothrow__ , __leaf__)); extern long double __erfcl (long double) __asm__ =
("" "__erfc") __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __asm__ ("" "lgamma") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __=
asm__ ("" "__lgamma") __attribute__ ((__nothrow__ , __leaf__));






extern long double tgammal (long double) __asm__ ("" "tgamma") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __=
asm__ ("" "__tgamma") __attribute__ ((__nothrow__ , __leaf__));





extern long double gammal (long double) __asm__ ("" "gamma") __attribute__ =
((__nothrow__ , __leaf__)); extern long double __gammal (long double) __asm=
__ ("" "__gamma") __attribute__ ((__nothrow__ , __leaf__));






extern long double lgammal_r (long double, int *__signgamp) __asm__ ("" "lg=
amma_r") __attribute__ ((__nothrow__ , __leaf__)); extern long double __lga=
mmal_r (long double, int *__signgamp) __asm__ ("" "__lgamma_r") __attribute=
__ ((__nothrow__ , __leaf__));







extern long double rintl (long double __x) __asm__ ("" "rint") __attribute_=
_ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) =
__asm__ ("" "__rint") __attribute__ ((__nothrow__ , __leaf__));


extern long double nextafterl (long double __x, long double __y) __asm__ ("=
" "nextafter") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__c=
onst__)); extern long double __nextafterl (long double __x, long double __y=
) __asm__ ("" "__nextafter") __attribute__ ((__nothrow__ , __leaf__)) __att=
ribute__ ((__const__));

extern long double nexttowardl (long double __x, long double __y) __asm__ (=
"" "nexttoward") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((_=
_const__)); extern long double __nexttowardl (long double __x, long double =
__y) __asm__ ("" "__nexttoward") __attribute__ ((__nothrow__ , __leaf__)) _=
_attribute__ ((__const__));



extern long double remainderl (long double __x, long double __y) __asm__ ("=
" "remainder") __attribute__ ((__nothrow__ , __leaf__)); extern long double=
 __remainderl (long double __x, long double __y) __asm__ ("" "__remainder")=
 __attribute__ ((__nothrow__ , __leaf__));



extern long double scalbnl (long double __x, int __n) __asm__ ("" "scalbn")=
 __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (lo=
ng double __x, int __n) __asm__ ("" "__scalbn") __attribute__ ((__nothrow__=
 , __leaf__));



extern int ilogbl (long double __x) __asm__ ("" "ilogb") __attribute__ ((__=
nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __asm__ ("" "=
__ilogb") __attribute__ ((__nothrow__ , __leaf__));




extern long double scalblnl (long double __x, long int __n) __asm__ ("" "sc=
albln") __attribute__ ((__nothrow__ , __leaf__)); extern long double __scal=
blnl (long double __x, long int __n) __asm__ ("" "__scalbln") __attribute__=
 ((__nothrow__ , __leaf__));



extern long double nearbyintl (long double __x) __asm__ ("" "nearbyint") __=
attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (lo=
ng double __x) __asm__ ("" "__nearbyint") __attribute__ ((__nothrow__ , __l=
eaf__));



extern long double roundl (long double __x) __asm__ ("" "round") __attribut=
e__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long dou=
ble __roundl (long double __x) __asm__ ("" "__round") __attribute__ ((__not=
hrow__ , __leaf__)) __attribute__ ((__const__));



extern long double truncl (long double __x) __asm__ ("" "trunc") __attribut=
e__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long dou=
ble __truncl (long double __x) __asm__ ("" "__trunc") __attribute__ ((__not=
hrow__ , __leaf__)) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) _=
_asm__ ("" "remquo") __attribute__ ((__nothrow__ , __leaf__)); extern long =
double __remquol (long double __x, long double __y, int *__quo) __asm__ (""=
 "__remquo") __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintl (long double __x) __asm__ ("" "lrint") __attribute__=
 ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __a=
sm__ ("" "__lrint") __attribute__ ((__nothrow__ , __leaf__));
extern long long int llrintl (long double __x) __asm__ ("" "llrint") __attr=
ibute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long do=
uble __x) __asm__ ("" "__llrint") __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundl (long double __x) __asm__ ("" "lround") __attribute=
__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) =
__asm__ ("" "__lround") __attribute__ ((__nothrow__ , __leaf__));
extern long long int llroundl (long double __x) __asm__ ("" "llround") __at=
tribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long=
 double __x) __asm__ ("" "__llround") __attribute__ ((__nothrow__ , __leaf_=
_));



extern long double fdiml (long double __x, long double __y) __asm__ ("" "fd=
im") __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (=
long double __x, long double __y) __asm__ ("" "__fdim") __attribute__ ((__n=
othrow__ , __leaf__));


extern long double fmaxl (long double __x, long double __y) __asm__ ("" "fm=
ax") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); =
extern long double __fmaxl (long double __x, long double __y) __asm__ ("" "=
__fmax") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__=
));


extern long double fminl (long double __x, long double __y) __asm__ ("" "fm=
in") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); =
extern long double __fminl (long double __x, long double __y) __asm__ ("" "=
__fmin") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__=
));



extern int __fpclassifyl (long double __value) __asm__ ("" "__fpclassify") =
__attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __asm__ ("" "__signbit") __attr=
ibute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern long double fmal (long double __x, long double __y, long double __z)=
 __asm__ ("" "fma") __attribute__ ((__nothrow__ , __leaf__)); extern long d=
ouble __fmal (long double __x, long double __y, long double __z) __asm__ ("=
" "__fma") __attribute__ ((__nothrow__ , __leaf__));








extern long double scalbl (long double __x, long double __n) __asm__ ("" "s=
calb") __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalb=
l (long double __x, long double __n) __asm__ ("" "__scalb") __attribute__ (=
(__nothrow__ , __leaf__));
# 137 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4
#undef _Mdouble_
#undef _Mdouble_BEGIN_NAMESPACE
#undef _Mdouble_END_NAMESPACE
#undef __MATH_PRECNAME




#undef __MATHDECL_1
#undef __MATHDECL
#undef __MATHCALL




extern int signgam;
# 193 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
enum
  {
    FP_NAN =3D
#define FP_NAN 0
      0,
    FP_INFINITE =3D
#define FP_INFINITE 1
      1,
    FP_ZERO =3D
#define FP_ZERO 2
      2,
    FP_SUBNORMAL =3D
#define FP_SUBNORMAL 3
      3,
    FP_NORMAL =3D
#define FP_NORMAL 4
      4
  };



#define fpclassify(x) (sizeof (x) =3D=3D sizeof (float) ? __fpclassifyf (x)=
 : __fpclassify (x))
# 226 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#define signbit(x) (sizeof (x) =3D=3D sizeof (float) ? __signbitf (x) : __s=
ignbit (x))
# 238 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#define isfinite(x) (sizeof (x) =3D=3D sizeof (float) ? __finitef (x) : __f=
inite (x))
# 249 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#define isnormal(x) (fpclassify (x) =3D=3D FP_NORMAL)




#define isnan(x) (sizeof (x) =3D=3D sizeof (float) ? __isnanf (x) : __isnan=
 (x))
# 266 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#define isinf(x) (sizeof (x) =3D=3D sizeof (float) ? __isinff (x) : __isinf=
 (x))
# 277 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#define MATH_ERRNO 1
#define MATH_ERREXCEPT 2





#define math_errhandling (MATH_ERRNO | MATH_ERREXCEPT)






typedef enum
{
  _IEEE_ =3D -1,
  _SVID_,
  _XOPEN_,
  _POSIX_,
  _ISOC_
} _LIB_VERSION_TYPE;




extern _LIB_VERSION_TYPE _LIB_VERSION;
# 316 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
struct exception

  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };




extern int matherr (struct exception *__exc);


#define X_TLOSS 1.41484755040568800000e+16


#define DOMAIN 1
#define SING 2
#define OVERFLOW 3
#define UNDERFLOW 4
#define TLOSS 5
#define PLOSS 6


#define HUGE 3.40282347e+38F
# 357 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#define M_E 2.7182818284590452354
#define M_LOG2E 1.4426950408889634074
#define M_LOG10E 0.43429448190325182765
#define M_LN2 0.69314718055994530942
#define M_LN10 2.30258509299404568402
#define M_PI 3.14159265358979323846
#define M_PI_2 1.57079632679489661923
#define M_PI_4 0.78539816339744830962
#define M_1_PI 0.31830988618379067154
#define M_2_PI 0.63661977236758134308
#define M_2_SQRTPI 1.12837916709551257390
#define M_SQRT2 1.41421356237309504880
#define M_SQRT1_2 0.70710678118654752440
# 406 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4
#define isgreater(x,y) __builtin_isgreater(x, y)
#define isgreaterequal(x,y) __builtin_isgreaterequal(x, y)
#define isless(x,y) __builtin_isless(x, y)
#define islessequal(x,y) __builtin_islessequal(x, y)
#define islessgreater(x,y) __builtin_islessgreater(x, y)
#define isunordered(u,v) __builtin_isunordered(u, v)




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/mathinline.h" 1 3 4
# 417 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 2 3 4
# 478 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/math.h" 3 4

# 17 "util/callchain.c" 2

# 1 "util/util.h" 1

#define GIT_COMPAT_UTIL_H=20

#define _FILE_OFFSET_BITS 64
# 14 "util/util.h"
#define FLEX_ARRAY=20
# 28 "util/util.h"
#define ARRAY_SIZE(x) (sizeof(x)/sizeof(x[0]))


#define TYPEOF(x) (__typeof__(x))




#define MSB(x,bits) ((x) & TYPEOF(x)(~0ULL << (sizeof(x) * 8 - (bits))))
#define HAS_MULTI_BITS(i) ((i) & ((i) - 1))


#define decimal_length(x) ((int)(sizeof(x) * 2.56 + 0.5) + 1)

#define _ALL_SOURCE 1
#define _GNU_SOURCE 1
#define _BSD_SOURCE 1
#define HAS_BOOL=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
#define _UNISTD_H 1










#define _POSIX_VERSION 200809L
# 53 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
#define __POSIX2_THIS_VERSION 200809L
# 67 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
#define _POSIX2_VERSION __POSIX2_THIS_VERSION



#define _POSIX2_C_BIND __POSIX2_THIS_VERSION



#define _POSIX2_C_DEV __POSIX2_THIS_VERSION



#define _POSIX2_SW_DEV __POSIX2_THIS_VERSION



#define _POSIX2_LOCALEDEF __POSIX2_THIS_VERSION



#define _XOPEN_VERSION 700
# 97 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
#define _XOPEN_XCU_VERSION 4


#define _XOPEN_XPG2 1
#define _XOPEN_XPG3 1
#define _XOPEN_XPG4 1


#define _XOPEN_UNIX 1


#define _XOPEN_CRYPT 1



#define _XOPEN_ENH_I18N 1


#define _XOPEN_LEGACY 1
# 202 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/posix_opt.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/posix_opt.h" 3 4
#define _BITS_POSIX_OPT_H 1


#define _POSIX_JOB_CONTROL 1


#define _POSIX_SAVED_IDS 1


#define _POSIX_PRIORITY_SCHEDULING 200809L


#define _POSIX_SYNCHRONIZED_IO 200809L


#define _POSIX_FSYNC 200809L


#define _POSIX_MAPPED_FILES 200809L


#define _POSIX_MEMLOCK 200809L


#define _POSIX_MEMLOCK_RANGE 200809L


#define _POSIX_MEMORY_PROTECTION 200809L


#define _POSIX_CHOWN_RESTRICTED 0



#define _POSIX_VDISABLE '\0'


#define _POSIX_NO_TRUNC 1


#define _XOPEN_REALTIME 1


#define _XOPEN_REALTIME_THREADS 1


#define _XOPEN_SHM 1


#define _POSIX_THREADS 200809L


#define _POSIX_REENTRANT_FUNCTIONS 1
#define _POSIX_THREAD_SAFE_FUNCTIONS 200809L


#define _POSIX_THREAD_PRIORITY_SCHEDULING 200809L


#define _POSIX_THREAD_ATTR_STACKSIZE 200809L


#define _POSIX_THREAD_ATTR_STACKADDR 200809L


#define _POSIX_THREAD_PRIO_INHERIT 200809L



#define _POSIX_THREAD_PRIO_PROTECT 200809L



#define _POSIX_THREAD_ROBUST_PRIO_INHERIT 200809L


#define _POSIX_THREAD_ROBUST_PRIO_PROTECT -1



#define _POSIX_SEMAPHORES 200809L


#define _POSIX_REALTIME_SIGNALS 200809L


#define _POSIX_ASYNCHRONOUS_IO 200809L
#define _POSIX_ASYNC_IO 1

#define _LFS_ASYNCHRONOUS_IO 1

#define _POSIX_PRIORITIZED_IO 200809L


#define _LFS64_ASYNCHRONOUS_IO 1


#define _LFS_LARGEFILE 1
#define _LFS64_LARGEFILE 1
#define _LFS64_STDIO 1


#define _POSIX_SHARED_MEMORY_OBJECTS 200809L


#define _POSIX_CPUTIME 0


#define _POSIX_THREAD_CPUTIME 0


#define _POSIX_REGEXP 1


#define _POSIX_READER_WRITER_LOCKS 200809L


#define _POSIX_SHELL 1


#define _POSIX_TIMEOUTS 200809L


#define _POSIX_SPIN_LOCKS 200809L


#define _POSIX_SPAWN 200809L


#define _POSIX_TIMERS 200809L


#define _POSIX_BARRIERS 200809L


#define _POSIX_MESSAGE_PASSING 200809L


#define _POSIX_THREAD_PROCESS_SHARED 200809L


#define _POSIX_MONOTONIC_CLOCK 0


#define _POSIX_CLOCK_SELECTION 200809L


#define _POSIX_ADVISORY_INFO 200809L


#define _POSIX_IPV6 200809L


#define _POSIX_RAW_SOCKETS 200809L


#define _POSIX2_CHAR_TERM 200809L


#define _POSIX_SPORADIC_SERVER -1
#define _POSIX_THREAD_SPORADIC_SERVER -1


#define _POSIX_TRACE -1
#define _POSIX_TRACE_EVENT_FILTER -1
#define _POSIX_TRACE_INHERIT -1
#define _POSIX_TRACE_LOG -1


#define _POSIX_TYPED_MEMORY_OBJECTS -1
# 203 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 2 3 4



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/environments.h" 1 3 4
# 22 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/environments.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 1 3 4
# 18 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 3 4
#define __WORDSIZE 32
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/environments.h" 2 3 4
# 66 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/environments.h" 3 4
#define _POSIX_V7_ILP32_OFF32 1
#define _POSIX_V7_ILP32_OFFBIG 1
#define _POSIX_V6_ILP32_OFF32 1
#define _POSIX_V6_ILP32_OFFBIG 1
#define _XBS5_ILP32_OFF32 1
#define _XBS5_ILP32_OFFBIG 1





#define _POSIX_V7_LP64_OFF64 -1
#define _POSIX_V7_LPBIG_OFFBIG -1
#define _POSIX_V6_LP64_OFF64 -1
#define _POSIX_V6_LPBIG_OFFBIG -1
#define _XBS5_LP64_OFF64 -1
#define _XBS5_LPBIG_OFFBIG -1


#define __ILP32_OFFBIG_CFLAGS "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64=
"
# 207 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 2 3 4



#define STDIN_FILENO 0
#define STDOUT_FILENO 1
#define STDERR_FILENO 2
# 224 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
#define __need_size_t=20
#define __need_NULL=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL
# 227 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 2 3 4
# 255 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
typedef __useconds_t useconds_t;
#define __useconds_t_defined=20
# 267 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
typedef __intptr_t intptr_t;
#define __intptr_t_defined=20





typedef __socklen_t socklen_t;
#define __socklen_t_defined=20





#define R_OK 4
#define W_OK 2
#define X_OK 1
#define F_OK 0


extern int access (const char *__name, int __type) __attribute__ ((__nothro=
w__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 304 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2))) ;
# 322 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
#define L_SET SEEK_SET
#define L_INCR SEEK_CUR
#define L_XTND SEEK_END
# 337 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern __off64_t lseek (int __fd, __off64_t __offset, int __whence) __asm__=
 ("" "lseek64") __attribute__ ((__nothrow__ , __leaf__))

             ;





extern __off64_t lseek64 (int __fd, __off64_t __offset, int __whence)
     __attribute__ ((__nothrow__ , __leaf__));






extern int close (int __fd);






extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;





extern ssize_t write (int __fd, const void *__buf, size_t __n) ;
# 388 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes, __off64_t __o=
ffset) __asm__ ("" "pread64")

                    ;
extern ssize_t pwrite (int __fd, const void *__buf, size_t __nbytes, __off6=
4_t __offset) __asm__ ("" "pwrite64")

                     ;
# 404 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern ssize_t pread64 (int __fd, void *__buf, size_t __nbytes,
   __off64_t __offset) ;


extern ssize_t pwrite64 (int __fd, const void *__buf, size_t __n,
    __off64_t __offset) ;







extern int pipe (int __pipedes[2]) __attribute__ ((__nothrow__ , __leaf__))=
 ;
# 432 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern unsigned int alarm (unsigned int __seconds) __attribute__ ((__nothro=
w__ , __leaf__));
# 444 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern unsigned int sleep (unsigned int __seconds);







extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     __attribute__ ((__nothrow__ , __leaf__));






extern int usleep (__useconds_t __useconds);
# 469 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern int pause (void);



extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1))) ;



extern int fchown (int __fd, __uid_t __owner, __gid_t __group) __attribute_=
_ ((__nothrow__ , __leaf__)) ;




extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1))) ;






extern int fchownat (int __fd, const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2))) ;



extern int chdir (const char *__path) __attribute__ ((__nothrow__ , __leaf_=
_)) __attribute__ ((__nonnull__ (1))) ;



extern int fchdir (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;
# 511 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern char *getcwd (char *__buf, size_t __size) __attribute__ ((__nothrow_=
_ , __leaf__)) ;
# 525 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern char *getwd (char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1))) __attribute__ ((__deprecated__)) ;




extern int dup (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;


extern int dup2 (int __fd, int __fd2) __attribute__ ((__nothrow__ , __leaf_=
_));
# 543 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern char **__environ;







extern int execve (const char *__path, char *const __argv[],
     char *const __envp[]) __attribute__ ((__nothrow__ , __leaf__)) __attri=
bute__ ((__nonnull__ (1, 2)));




extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));




extern int execv (const char *__path, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));



extern int execle (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));



extern int execl (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));



extern int execvp (const char *__file, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));




extern int execlp (const char *__file, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));
# 598 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern int nice (int __inc) __attribute__ ((__nothrow__ , __leaf__)) ;




extern void _exit (int __status) __attribute__ ((__noreturn__));





# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/confname.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/confname.h" 3 4
enum
  {
    _PC_LINK_MAX,
#define _PC_LINK_MAX _PC_LINK_MAX
    _PC_MAX_CANON,
#define _PC_MAX_CANON _PC_MAX_CANON
    _PC_MAX_INPUT,
#define _PC_MAX_INPUT _PC_MAX_INPUT
    _PC_NAME_MAX,
#define _PC_NAME_MAX _PC_NAME_MAX
    _PC_PATH_MAX,
#define _PC_PATH_MAX _PC_PATH_MAX
    _PC_PIPE_BUF,
#define _PC_PIPE_BUF _PC_PIPE_BUF
    _PC_CHOWN_RESTRICTED,
#define _PC_CHOWN_RESTRICTED _PC_CHOWN_RESTRICTED
    _PC_NO_TRUNC,
#define _PC_NO_TRUNC _PC_NO_TRUNC
    _PC_VDISABLE,
#define _PC_VDISABLE _PC_VDISABLE
    _PC_SYNC_IO,
#define _PC_SYNC_IO _PC_SYNC_IO
    _PC_ASYNC_IO,
#define _PC_ASYNC_IO _PC_ASYNC_IO
    _PC_PRIO_IO,
#define _PC_PRIO_IO _PC_PRIO_IO
    _PC_SOCK_MAXBUF,
#define _PC_SOCK_MAXBUF _PC_SOCK_MAXBUF
    _PC_FILESIZEBITS,
#define _PC_FILESIZEBITS _PC_FILESIZEBITS
    _PC_REC_INCR_XFER_SIZE,
#define _PC_REC_INCR_XFER_SIZE _PC_REC_INCR_XFER_SIZE
    _PC_REC_MAX_XFER_SIZE,
#define _PC_REC_MAX_XFER_SIZE _PC_REC_MAX_XFER_SIZE
    _PC_REC_MIN_XFER_SIZE,
#define _PC_REC_MIN_XFER_SIZE _PC_REC_MIN_XFER_SIZE
    _PC_REC_XFER_ALIGN,
#define _PC_REC_XFER_ALIGN _PC_REC_XFER_ALIGN
    _PC_ALLOC_SIZE_MIN,
#define _PC_ALLOC_SIZE_MIN _PC_ALLOC_SIZE_MIN
    _PC_SYMLINK_MAX,
#define _PC_SYMLINK_MAX _PC_SYMLINK_MAX
    _PC_2_SYMLINKS
#define _PC_2_SYMLINKS _PC_2_SYMLINKS
  };


enum
  {
    _SC_ARG_MAX,
#define _SC_ARG_MAX _SC_ARG_MAX
    _SC_CHILD_MAX,
#define _SC_CHILD_MAX _SC_CHILD_MAX
    _SC_CLK_TCK,
#define _SC_CLK_TCK _SC_CLK_TCK
    _SC_NGROUPS_MAX,
#define _SC_NGROUPS_MAX _SC_NGROUPS_MAX
    _SC_OPEN_MAX,
#define _SC_OPEN_MAX _SC_OPEN_MAX
    _SC_STREAM_MAX,
#define _SC_STREAM_MAX _SC_STREAM_MAX
    _SC_TZNAME_MAX,
#define _SC_TZNAME_MAX _SC_TZNAME_MAX
    _SC_JOB_CONTROL,
#define _SC_JOB_CONTROL _SC_JOB_CONTROL
    _SC_SAVED_IDS,
#define _SC_SAVED_IDS _SC_SAVED_IDS
    _SC_REALTIME_SIGNALS,
#define _SC_REALTIME_SIGNALS _SC_REALTIME_SIGNALS
    _SC_PRIORITY_SCHEDULING,
#define _SC_PRIORITY_SCHEDULING _SC_PRIORITY_SCHEDULING
    _SC_TIMERS,
#define _SC_TIMERS _SC_TIMERS
    _SC_ASYNCHRONOUS_IO,
#define _SC_ASYNCHRONOUS_IO _SC_ASYNCHRONOUS_IO
    _SC_PRIORITIZED_IO,
#define _SC_PRIORITIZED_IO _SC_PRIORITIZED_IO
    _SC_SYNCHRONIZED_IO,
#define _SC_SYNCHRONIZED_IO _SC_SYNCHRONIZED_IO
    _SC_FSYNC,
#define _SC_FSYNC _SC_FSYNC
    _SC_MAPPED_FILES,
#define _SC_MAPPED_FILES _SC_MAPPED_FILES
    _SC_MEMLOCK,
#define _SC_MEMLOCK _SC_MEMLOCK
    _SC_MEMLOCK_RANGE,
#define _SC_MEMLOCK_RANGE _SC_MEMLOCK_RANGE
    _SC_MEMORY_PROTECTION,
#define _SC_MEMORY_PROTECTION _SC_MEMORY_PROTECTION
    _SC_MESSAGE_PASSING,
#define _SC_MESSAGE_PASSING _SC_MESSAGE_PASSING
    _SC_SEMAPHORES,
#define _SC_SEMAPHORES _SC_SEMAPHORES
    _SC_SHARED_MEMORY_OBJECTS,
#define _SC_SHARED_MEMORY_OBJECTS _SC_SHARED_MEMORY_OBJECTS
    _SC_AIO_LISTIO_MAX,
#define _SC_AIO_LISTIO_MAX _SC_AIO_LISTIO_MAX
    _SC_AIO_MAX,
#define _SC_AIO_MAX _SC_AIO_MAX
    _SC_AIO_PRIO_DELTA_MAX,
#define _SC_AIO_PRIO_DELTA_MAX _SC_AIO_PRIO_DELTA_MAX
    _SC_DELAYTIMER_MAX,
#define _SC_DELAYTIMER_MAX _SC_DELAYTIMER_MAX
    _SC_MQ_OPEN_MAX,
#define _SC_MQ_OPEN_MAX _SC_MQ_OPEN_MAX
    _SC_MQ_PRIO_MAX,
#define _SC_MQ_PRIO_MAX _SC_MQ_PRIO_MAX
    _SC_VERSION,
#define _SC_VERSION _SC_VERSION
    _SC_PAGESIZE,
#define _SC_PAGESIZE _SC_PAGESIZE
#define _SC_PAGE_SIZE _SC_PAGESIZE
    _SC_RTSIG_MAX,
#define _SC_RTSIG_MAX _SC_RTSIG_MAX
    _SC_SEM_NSEMS_MAX,
#define _SC_SEM_NSEMS_MAX _SC_SEM_NSEMS_MAX
    _SC_SEM_VALUE_MAX,
#define _SC_SEM_VALUE_MAX _SC_SEM_VALUE_MAX
    _SC_SIGQUEUE_MAX,
#define _SC_SIGQUEUE_MAX _SC_SIGQUEUE_MAX
    _SC_TIMER_MAX,
#define _SC_TIMER_MAX _SC_TIMER_MAX



    _SC_BC_BASE_MAX,
#define _SC_BC_BASE_MAX _SC_BC_BASE_MAX
    _SC_BC_DIM_MAX,
#define _SC_BC_DIM_MAX _SC_BC_DIM_MAX
    _SC_BC_SCALE_MAX,
#define _SC_BC_SCALE_MAX _SC_BC_SCALE_MAX
    _SC_BC_STRING_MAX,
#define _SC_BC_STRING_MAX _SC_BC_STRING_MAX
    _SC_COLL_WEIGHTS_MAX,
#define _SC_COLL_WEIGHTS_MAX _SC_COLL_WEIGHTS_MAX
    _SC_EQUIV_CLASS_MAX,
#define _SC_EQUIV_CLASS_MAX _SC_EQUIV_CLASS_MAX
    _SC_EXPR_NEST_MAX,
#define _SC_EXPR_NEST_MAX _SC_EXPR_NEST_MAX
    _SC_LINE_MAX,
#define _SC_LINE_MAX _SC_LINE_MAX
    _SC_RE_DUP_MAX,
#define _SC_RE_DUP_MAX _SC_RE_DUP_MAX
    _SC_CHARCLASS_NAME_MAX,
#define _SC_CHARCLASS_NAME_MAX _SC_CHARCLASS_NAME_MAX

    _SC_2_VERSION,
#define _SC_2_VERSION _SC_2_VERSION
    _SC_2_C_BIND,
#define _SC_2_C_BIND _SC_2_C_BIND
    _SC_2_C_DEV,
#define _SC_2_C_DEV _SC_2_C_DEV
    _SC_2_FORT_DEV,
#define _SC_2_FORT_DEV _SC_2_FORT_DEV
    _SC_2_FORT_RUN,
#define _SC_2_FORT_RUN _SC_2_FORT_RUN
    _SC_2_SW_DEV,
#define _SC_2_SW_DEV _SC_2_SW_DEV
    _SC_2_LOCALEDEF,
#define _SC_2_LOCALEDEF _SC_2_LOCALEDEF

    _SC_PII,
#define _SC_PII _SC_PII
    _SC_PII_XTI,
#define _SC_PII_XTI _SC_PII_XTI
    _SC_PII_SOCKET,
#define _SC_PII_SOCKET _SC_PII_SOCKET
    _SC_PII_INTERNET,
#define _SC_PII_INTERNET _SC_PII_INTERNET
    _SC_PII_OSI,
#define _SC_PII_OSI _SC_PII_OSI
    _SC_POLL,
#define _SC_POLL _SC_POLL
    _SC_SELECT,
#define _SC_SELECT _SC_SELECT
    _SC_UIO_MAXIOV,
#define _SC_UIO_MAXIOV _SC_UIO_MAXIOV
    _SC_IOV_MAX =3D _SC_UIO_MAXIOV,
#define _SC_IOV_MAX _SC_IOV_MAX
    _SC_PII_INTERNET_STREAM,
#define _SC_PII_INTERNET_STREAM _SC_PII_INTERNET_STREAM
    _SC_PII_INTERNET_DGRAM,
#define _SC_PII_INTERNET_DGRAM _SC_PII_INTERNET_DGRAM
    _SC_PII_OSI_COTS,
#define _SC_PII_OSI_COTS _SC_PII_OSI_COTS
    _SC_PII_OSI_CLTS,
#define _SC_PII_OSI_CLTS _SC_PII_OSI_CLTS
    _SC_PII_OSI_M,
#define _SC_PII_OSI_M _SC_PII_OSI_M
    _SC_T_IOV_MAX,
#define _SC_T_IOV_MAX _SC_T_IOV_MAX


    _SC_THREADS,
#define _SC_THREADS _SC_THREADS
    _SC_THREAD_SAFE_FUNCTIONS,
#define _SC_THREAD_SAFE_FUNCTIONS _SC_THREAD_SAFE_FUNCTIONS
    _SC_GETGR_R_SIZE_MAX,
#define _SC_GETGR_R_SIZE_MAX _SC_GETGR_R_SIZE_MAX
    _SC_GETPW_R_SIZE_MAX,
#define _SC_GETPW_R_SIZE_MAX _SC_GETPW_R_SIZE_MAX
    _SC_LOGIN_NAME_MAX,
#define _SC_LOGIN_NAME_MAX _SC_LOGIN_NAME_MAX
    _SC_TTY_NAME_MAX,
#define _SC_TTY_NAME_MAX _SC_TTY_NAME_MAX
    _SC_THREAD_DESTRUCTOR_ITERATIONS,
#define _SC_THREAD_DESTRUCTOR_ITERATIONS _SC_THREAD_DESTRUCTOR_ITERATIONS
    _SC_THREAD_KEYS_MAX,
#define _SC_THREAD_KEYS_MAX _SC_THREAD_KEYS_MAX
    _SC_THREAD_STACK_MIN,
#define _SC_THREAD_STACK_MIN _SC_THREAD_STACK_MIN
    _SC_THREAD_THREADS_MAX,
#define _SC_THREAD_THREADS_MAX _SC_THREAD_THREADS_MAX
    _SC_THREAD_ATTR_STACKADDR,
#define _SC_THREAD_ATTR_STACKADDR _SC_THREAD_ATTR_STACKADDR
    _SC_THREAD_ATTR_STACKSIZE,
#define _SC_THREAD_ATTR_STACKSIZE _SC_THREAD_ATTR_STACKSIZE
    _SC_THREAD_PRIORITY_SCHEDULING,
#define _SC_THREAD_PRIORITY_SCHEDULING _SC_THREAD_PRIORITY_SCHEDULING
    _SC_THREAD_PRIO_INHERIT,
#define _SC_THREAD_PRIO_INHERIT _SC_THREAD_PRIO_INHERIT
    _SC_THREAD_PRIO_PROTECT,
#define _SC_THREAD_PRIO_PROTECT _SC_THREAD_PRIO_PROTECT
    _SC_THREAD_PROCESS_SHARED,
#define _SC_THREAD_PROCESS_SHARED _SC_THREAD_PROCESS_SHARED

    _SC_NPROCESSORS_CONF,
#define _SC_NPROCESSORS_CONF _SC_NPROCESSORS_CONF
    _SC_NPROCESSORS_ONLN,
#define _SC_NPROCESSORS_ONLN _SC_NPROCESSORS_ONLN
    _SC_PHYS_PAGES,
#define _SC_PHYS_PAGES _SC_PHYS_PAGES
    _SC_AVPHYS_PAGES,
#define _SC_AVPHYS_PAGES _SC_AVPHYS_PAGES
    _SC_ATEXIT_MAX,
#define _SC_ATEXIT_MAX _SC_ATEXIT_MAX
    _SC_PASS_MAX,
#define _SC_PASS_MAX _SC_PASS_MAX

    _SC_XOPEN_VERSION,
#define _SC_XOPEN_VERSION _SC_XOPEN_VERSION
    _SC_XOPEN_XCU_VERSION,
#define _SC_XOPEN_XCU_VERSION _SC_XOPEN_XCU_VERSION
    _SC_XOPEN_UNIX,
#define _SC_XOPEN_UNIX _SC_XOPEN_UNIX
    _SC_XOPEN_CRYPT,
#define _SC_XOPEN_CRYPT _SC_XOPEN_CRYPT
    _SC_XOPEN_ENH_I18N,
#define _SC_XOPEN_ENH_I18N _SC_XOPEN_ENH_I18N
    _SC_XOPEN_SHM,
#define _SC_XOPEN_SHM _SC_XOPEN_SHM

    _SC_2_CHAR_TERM,
#define _SC_2_CHAR_TERM _SC_2_CHAR_TERM
    _SC_2_C_VERSION,
#define _SC_2_C_VERSION _SC_2_C_VERSION
    _SC_2_UPE,
#define _SC_2_UPE _SC_2_UPE

    _SC_XOPEN_XPG2,
#define _SC_XOPEN_XPG2 _SC_XOPEN_XPG2
    _SC_XOPEN_XPG3,
#define _SC_XOPEN_XPG3 _SC_XOPEN_XPG3
    _SC_XOPEN_XPG4,
#define _SC_XOPEN_XPG4 _SC_XOPEN_XPG4

    _SC_CHAR_BIT,
#define _SC_CHAR_BIT _SC_CHAR_BIT
    _SC_CHAR_MAX,
#define _SC_CHAR_MAX _SC_CHAR_MAX
    _SC_CHAR_MIN,
#define _SC_CHAR_MIN _SC_CHAR_MIN
    _SC_INT_MAX,
#define _SC_INT_MAX _SC_INT_MAX
    _SC_INT_MIN,
#define _SC_INT_MIN _SC_INT_MIN
    _SC_LONG_BIT,
#define _SC_LONG_BIT _SC_LONG_BIT
    _SC_WORD_BIT,
#define _SC_WORD_BIT _SC_WORD_BIT
    _SC_MB_LEN_MAX,
#define _SC_MB_LEN_MAX _SC_MB_LEN_MAX
    _SC_NZERO,
#define _SC_NZERO _SC_NZERO
    _SC_SSIZE_MAX,
#define _SC_SSIZE_MAX _SC_SSIZE_MAX
    _SC_SCHAR_MAX,
#define _SC_SCHAR_MAX _SC_SCHAR_MAX
    _SC_SCHAR_MIN,
#define _SC_SCHAR_MIN _SC_SCHAR_MIN
    _SC_SHRT_MAX,
#define _SC_SHRT_MAX _SC_SHRT_MAX
    _SC_SHRT_MIN,
#define _SC_SHRT_MIN _SC_SHRT_MIN
    _SC_UCHAR_MAX,
#define _SC_UCHAR_MAX _SC_UCHAR_MAX
    _SC_UINT_MAX,
#define _SC_UINT_MAX _SC_UINT_MAX
    _SC_ULONG_MAX,
#define _SC_ULONG_MAX _SC_ULONG_MAX
    _SC_USHRT_MAX,
#define _SC_USHRT_MAX _SC_USHRT_MAX

    _SC_NL_ARGMAX,
#define _SC_NL_ARGMAX _SC_NL_ARGMAX
    _SC_NL_LANGMAX,
#define _SC_NL_LANGMAX _SC_NL_LANGMAX
    _SC_NL_MSGMAX,
#define _SC_NL_MSGMAX _SC_NL_MSGMAX
    _SC_NL_NMAX,
#define _SC_NL_NMAX _SC_NL_NMAX
    _SC_NL_SETMAX,
#define _SC_NL_SETMAX _SC_NL_SETMAX
    _SC_NL_TEXTMAX,
#define _SC_NL_TEXTMAX _SC_NL_TEXTMAX

    _SC_XBS5_ILP32_OFF32,
#define _SC_XBS5_ILP32_OFF32 _SC_XBS5_ILP32_OFF32
    _SC_XBS5_ILP32_OFFBIG,
#define _SC_XBS5_ILP32_OFFBIG _SC_XBS5_ILP32_OFFBIG
    _SC_XBS5_LP64_OFF64,
#define _SC_XBS5_LP64_OFF64 _SC_XBS5_LP64_OFF64
    _SC_XBS5_LPBIG_OFFBIG,
#define _SC_XBS5_LPBIG_OFFBIG _SC_XBS5_LPBIG_OFFBIG

    _SC_XOPEN_LEGACY,
#define _SC_XOPEN_LEGACY _SC_XOPEN_LEGACY
    _SC_XOPEN_REALTIME,
#define _SC_XOPEN_REALTIME _SC_XOPEN_REALTIME
    _SC_XOPEN_REALTIME_THREADS,
#define _SC_XOPEN_REALTIME_THREADS _SC_XOPEN_REALTIME_THREADS

    _SC_ADVISORY_INFO,
#define _SC_ADVISORY_INFO _SC_ADVISORY_INFO
    _SC_BARRIERS,
#define _SC_BARRIERS _SC_BARRIERS
    _SC_BASE,
#define _SC_BASE _SC_BASE
    _SC_C_LANG_SUPPORT,
#define _SC_C_LANG_SUPPORT _SC_C_LANG_SUPPORT
    _SC_C_LANG_SUPPORT_R,
#define _SC_C_LANG_SUPPORT_R _SC_C_LANG_SUPPORT_R
    _SC_CLOCK_SELECTION,
#define _SC_CLOCK_SELECTION _SC_CLOCK_SELECTION
    _SC_CPUTIME,
#define _SC_CPUTIME _SC_CPUTIME
    _SC_THREAD_CPUTIME,
#define _SC_THREAD_CPUTIME _SC_THREAD_CPUTIME
    _SC_DEVICE_IO,
#define _SC_DEVICE_IO _SC_DEVICE_IO
    _SC_DEVICE_SPECIFIC,
#define _SC_DEVICE_SPECIFIC _SC_DEVICE_SPECIFIC
    _SC_DEVICE_SPECIFIC_R,
#define _SC_DEVICE_SPECIFIC_R _SC_DEVICE_SPECIFIC_R
    _SC_FD_MGMT,
#define _SC_FD_MGMT _SC_FD_MGMT
    _SC_FIFO,
#define _SC_FIFO _SC_FIFO
    _SC_PIPE,
#define _SC_PIPE _SC_PIPE
    _SC_FILE_ATTRIBUTES,
#define _SC_FILE_ATTRIBUTES _SC_FILE_ATTRIBUTES
    _SC_FILE_LOCKING,
#define _SC_FILE_LOCKING _SC_FILE_LOCKING
    _SC_FILE_SYSTEM,
#define _SC_FILE_SYSTEM _SC_FILE_SYSTEM
    _SC_MONOTONIC_CLOCK,
#define _SC_MONOTONIC_CLOCK _SC_MONOTONIC_CLOCK
    _SC_MULTI_PROCESS,
#define _SC_MULTI_PROCESS _SC_MULTI_PROCESS
    _SC_SINGLE_PROCESS,
#define _SC_SINGLE_PROCESS _SC_SINGLE_PROCESS
    _SC_NETWORKING,
#define _SC_NETWORKING _SC_NETWORKING
    _SC_READER_WRITER_LOCKS,
#define _SC_READER_WRITER_LOCKS _SC_READER_WRITER_LOCKS
    _SC_SPIN_LOCKS,
#define _SC_SPIN_LOCKS _SC_SPIN_LOCKS
    _SC_REGEXP,
#define _SC_REGEXP _SC_REGEXP
    _SC_REGEX_VERSION,
#define _SC_REGEX_VERSION _SC_REGEX_VERSION
    _SC_SHELL,
#define _SC_SHELL _SC_SHELL
    _SC_SIGNALS,
#define _SC_SIGNALS _SC_SIGNALS
    _SC_SPAWN,
#define _SC_SPAWN _SC_SPAWN
    _SC_SPORADIC_SERVER,
#define _SC_SPORADIC_SERVER _SC_SPORADIC_SERVER
    _SC_THREAD_SPORADIC_SERVER,
#define _SC_THREAD_SPORADIC_SERVER _SC_THREAD_SPORADIC_SERVER
    _SC_SYSTEM_DATABASE,
#define _SC_SYSTEM_DATABASE _SC_SYSTEM_DATABASE
    _SC_SYSTEM_DATABASE_R,
#define _SC_SYSTEM_DATABASE_R _SC_SYSTEM_DATABASE_R
    _SC_TIMEOUTS,
#define _SC_TIMEOUTS _SC_TIMEOUTS
    _SC_TYPED_MEMORY_OBJECTS,
#define _SC_TYPED_MEMORY_OBJECTS _SC_TYPED_MEMORY_OBJECTS
    _SC_USER_GROUPS,
#define _SC_USER_GROUPS _SC_USER_GROUPS
    _SC_USER_GROUPS_R,
#define _SC_USER_GROUPS_R _SC_USER_GROUPS_R
    _SC_2_PBS,
#define _SC_2_PBS _SC_2_PBS
    _SC_2_PBS_ACCOUNTING,
#define _SC_2_PBS_ACCOUNTING _SC_2_PBS_ACCOUNTING
    _SC_2_PBS_LOCATE,
#define _SC_2_PBS_LOCATE _SC_2_PBS_LOCATE
    _SC_2_PBS_MESSAGE,
#define _SC_2_PBS_MESSAGE _SC_2_PBS_MESSAGE
    _SC_2_PBS_TRACK,
#define _SC_2_PBS_TRACK _SC_2_PBS_TRACK
    _SC_SYMLOOP_MAX,
#define _SC_SYMLOOP_MAX _SC_SYMLOOP_MAX
    _SC_STREAMS,
#define _SC_STREAMS _SC_STREAMS
    _SC_2_PBS_CHECKPOINT,
#define _SC_2_PBS_CHECKPOINT _SC_2_PBS_CHECKPOINT

    _SC_V6_ILP32_OFF32,
#define _SC_V6_ILP32_OFF32 _SC_V6_ILP32_OFF32
    _SC_V6_ILP32_OFFBIG,
#define _SC_V6_ILP32_OFFBIG _SC_V6_ILP32_OFFBIG
    _SC_V6_LP64_OFF64,
#define _SC_V6_LP64_OFF64 _SC_V6_LP64_OFF64
    _SC_V6_LPBIG_OFFBIG,
#define _SC_V6_LPBIG_OFFBIG _SC_V6_LPBIG_OFFBIG

    _SC_HOST_NAME_MAX,
#define _SC_HOST_NAME_MAX _SC_HOST_NAME_MAX
    _SC_TRACE,
#define _SC_TRACE _SC_TRACE
    _SC_TRACE_EVENT_FILTER,
#define _SC_TRACE_EVENT_FILTER _SC_TRACE_EVENT_FILTER
    _SC_TRACE_INHERIT,
#define _SC_TRACE_INHERIT _SC_TRACE_INHERIT
    _SC_TRACE_LOG,
#define _SC_TRACE_LOG _SC_TRACE_LOG

    _SC_LEVEL1_ICACHE_SIZE,
#define _SC_LEVEL1_ICACHE_SIZE _SC_LEVEL1_ICACHE_SIZE
    _SC_LEVEL1_ICACHE_ASSOC,
#define _SC_LEVEL1_ICACHE_ASSOC _SC_LEVEL1_ICACHE_ASSOC
    _SC_LEVEL1_ICACHE_LINESIZE,
#define _SC_LEVEL1_ICACHE_LINESIZE _SC_LEVEL1_ICACHE_LINESIZE
    _SC_LEVEL1_DCACHE_SIZE,
#define _SC_LEVEL1_DCACHE_SIZE _SC_LEVEL1_DCACHE_SIZE
    _SC_LEVEL1_DCACHE_ASSOC,
#define _SC_LEVEL1_DCACHE_ASSOC _SC_LEVEL1_DCACHE_ASSOC
    _SC_LEVEL1_DCACHE_LINESIZE,
#define _SC_LEVEL1_DCACHE_LINESIZE _SC_LEVEL1_DCACHE_LINESIZE
    _SC_LEVEL2_CACHE_SIZE,
#define _SC_LEVEL2_CACHE_SIZE _SC_LEVEL2_CACHE_SIZE
    _SC_LEVEL2_CACHE_ASSOC,
#define _SC_LEVEL2_CACHE_ASSOC _SC_LEVEL2_CACHE_ASSOC
    _SC_LEVEL2_CACHE_LINESIZE,
#define _SC_LEVEL2_CACHE_LINESIZE _SC_LEVEL2_CACHE_LINESIZE
    _SC_LEVEL3_CACHE_SIZE,
#define _SC_LEVEL3_CACHE_SIZE _SC_LEVEL3_CACHE_SIZE
    _SC_LEVEL3_CACHE_ASSOC,
#define _SC_LEVEL3_CACHE_ASSOC _SC_LEVEL3_CACHE_ASSOC
    _SC_LEVEL3_CACHE_LINESIZE,
#define _SC_LEVEL3_CACHE_LINESIZE _SC_LEVEL3_CACHE_LINESIZE
    _SC_LEVEL4_CACHE_SIZE,
#define _SC_LEVEL4_CACHE_SIZE _SC_LEVEL4_CACHE_SIZE
    _SC_LEVEL4_CACHE_ASSOC,
#define _SC_LEVEL4_CACHE_ASSOC _SC_LEVEL4_CACHE_ASSOC
    _SC_LEVEL4_CACHE_LINESIZE,
#define _SC_LEVEL4_CACHE_LINESIZE _SC_LEVEL4_CACHE_LINESIZE


    _SC_IPV6 =3D _SC_LEVEL1_ICACHE_SIZE + 50,
#define _SC_IPV6 _SC_IPV6
    _SC_RAW_SOCKETS,
#define _SC_RAW_SOCKETS _SC_RAW_SOCKETS

    _SC_V7_ILP32_OFF32,
#define _SC_V7_ILP32_OFF32 _SC_V7_ILP32_OFF32
    _SC_V7_ILP32_OFFBIG,
#define _SC_V7_ILP32_OFFBIG _SC_V7_ILP32_OFFBIG
    _SC_V7_LP64_OFF64,
#define _SC_V7_LP64_OFF64 _SC_V7_LP64_OFF64
    _SC_V7_LPBIG_OFFBIG,
#define _SC_V7_LPBIG_OFFBIG _SC_V7_LPBIG_OFFBIG

    _SC_SS_REPL_MAX,
#define _SC_SS_REPL_MAX _SC_SS_REPL_MAX

    _SC_TRACE_EVENT_NAME_MAX,
#define _SC_TRACE_EVENT_NAME_MAX _SC_TRACE_EVENT_NAME_MAX
    _SC_TRACE_NAME_MAX,
#define _SC_TRACE_NAME_MAX _SC_TRACE_NAME_MAX
    _SC_TRACE_SYS_MAX,
#define _SC_TRACE_SYS_MAX _SC_TRACE_SYS_MAX
    _SC_TRACE_USER_EVENT_MAX,
#define _SC_TRACE_USER_EVENT_MAX _SC_TRACE_USER_EVENT_MAX

    _SC_XOPEN_STREAMS,
#define _SC_XOPEN_STREAMS _SC_XOPEN_STREAMS

    _SC_THREAD_ROBUST_PRIO_INHERIT,
#define _SC_THREAD_ROBUST_PRIO_INHERIT _SC_THREAD_ROBUST_PRIO_INHERIT
    _SC_THREAD_ROBUST_PRIO_PROTECT
#define _SC_THREAD_ROBUST_PRIO_PROTECT _SC_THREAD_ROBUST_PRIO_PROTECT
  };


enum
  {
    _CS_PATH,
#define _CS_PATH _CS_PATH

    _CS_V6_WIDTH_RESTRICTED_ENVS,
#define _CS_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS
#define _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS

    _CS_GNU_LIBC_VERSION,
#define _CS_GNU_LIBC_VERSION _CS_GNU_LIBC_VERSION
    _CS_GNU_LIBPTHREAD_VERSION,
#define _CS_GNU_LIBPTHREAD_VERSION _CS_GNU_LIBPTHREAD_VERSION

    _CS_V5_WIDTH_RESTRICTED_ENVS,
#define _CS_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS
#define _CS_POSIX_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS

    _CS_V7_WIDTH_RESTRICTED_ENVS,
#define _CS_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS
#define _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS

    _CS_LFS_CFLAGS =3D 1000,
#define _CS_LFS_CFLAGS _CS_LFS_CFLAGS
    _CS_LFS_LDFLAGS,
#define _CS_LFS_LDFLAGS _CS_LFS_LDFLAGS
    _CS_LFS_LIBS,
#define _CS_LFS_LIBS _CS_LFS_LIBS
    _CS_LFS_LINTFLAGS,
#define _CS_LFS_LINTFLAGS _CS_LFS_LINTFLAGS
    _CS_LFS64_CFLAGS,
#define _CS_LFS64_CFLAGS _CS_LFS64_CFLAGS
    _CS_LFS64_LDFLAGS,
#define _CS_LFS64_LDFLAGS _CS_LFS64_LDFLAGS
    _CS_LFS64_LIBS,
#define _CS_LFS64_LIBS _CS_LFS64_LIBS
    _CS_LFS64_LINTFLAGS,
#define _CS_LFS64_LINTFLAGS _CS_LFS64_LINTFLAGS

    _CS_XBS5_ILP32_OFF32_CFLAGS =3D 1100,
#define _CS_XBS5_ILP32_OFF32_CFLAGS _CS_XBS5_ILP32_OFF32_CFLAGS
    _CS_XBS5_ILP32_OFF32_LDFLAGS,
#define _CS_XBS5_ILP32_OFF32_LDFLAGS _CS_XBS5_ILP32_OFF32_LDFLAGS
    _CS_XBS5_ILP32_OFF32_LIBS,
#define _CS_XBS5_ILP32_OFF32_LIBS _CS_XBS5_ILP32_OFF32_LIBS
    _CS_XBS5_ILP32_OFF32_LINTFLAGS,
#define _CS_XBS5_ILP32_OFF32_LINTFLAGS _CS_XBS5_ILP32_OFF32_LINTFLAGS
    _CS_XBS5_ILP32_OFFBIG_CFLAGS,
#define _CS_XBS5_ILP32_OFFBIG_CFLAGS _CS_XBS5_ILP32_OFFBIG_CFLAGS
    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,
#define _CS_XBS5_ILP32_OFFBIG_LDFLAGS _CS_XBS5_ILP32_OFFBIG_LDFLAGS
    _CS_XBS5_ILP32_OFFBIG_LIBS,
#define _CS_XBS5_ILP32_OFFBIG_LIBS _CS_XBS5_ILP32_OFFBIG_LIBS
    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,
#define _CS_XBS5_ILP32_OFFBIG_LINTFLAGS _CS_XBS5_ILP32_OFFBIG_LINTFLAGS
    _CS_XBS5_LP64_OFF64_CFLAGS,
#define _CS_XBS5_LP64_OFF64_CFLAGS _CS_XBS5_LP64_OFF64_CFLAGS
    _CS_XBS5_LP64_OFF64_LDFLAGS,
#define _CS_XBS5_LP64_OFF64_LDFLAGS _CS_XBS5_LP64_OFF64_LDFLAGS
    _CS_XBS5_LP64_OFF64_LIBS,
#define _CS_XBS5_LP64_OFF64_LIBS _CS_XBS5_LP64_OFF64_LIBS
    _CS_XBS5_LP64_OFF64_LINTFLAGS,
#define _CS_XBS5_LP64_OFF64_LINTFLAGS _CS_XBS5_LP64_OFF64_LINTFLAGS
    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,
#define _CS_XBS5_LPBIG_OFFBIG_CFLAGS _CS_XBS5_LPBIG_OFFBIG_CFLAGS
    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,
#define _CS_XBS5_LPBIG_OFFBIG_LDFLAGS _CS_XBS5_LPBIG_OFFBIG_LDFLAGS
    _CS_XBS5_LPBIG_OFFBIG_LIBS,
#define _CS_XBS5_LPBIG_OFFBIG_LIBS _CS_XBS5_LPBIG_OFFBIG_LIBS
    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,
#define _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS

    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,
#define _CS_POSIX_V6_ILP32_OFF32_CFLAGS _CS_POSIX_V6_ILP32_OFF32_CFLAGS
    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,
#define _CS_POSIX_V6_ILP32_OFF32_LDFLAGS _CS_POSIX_V6_ILP32_OFF32_LDFLAGS
    _CS_POSIX_V6_ILP32_OFF32_LIBS,
#define _CS_POSIX_V6_ILP32_OFF32_LIBS _CS_POSIX_V6_ILP32_OFF32_LIBS
    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,
#define _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS _CS_POSIX_V6_ILP32_OFF32_LINTFLA=
GS
    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,
#define _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS
    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,
#define _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS
    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,
#define _CS_POSIX_V6_ILP32_OFFBIG_LIBS _CS_POSIX_V6_ILP32_OFFBIG_LIBS
    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,
#define _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LINTF=
LAGS
    _CS_POSIX_V6_LP64_OFF64_CFLAGS,
#define _CS_POSIX_V6_LP64_OFF64_CFLAGS _CS_POSIX_V6_LP64_OFF64_CFLAGS
    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,
#define _CS_POSIX_V6_LP64_OFF64_LDFLAGS _CS_POSIX_V6_LP64_OFF64_LDFLAGS
    _CS_POSIX_V6_LP64_OFF64_LIBS,
#define _CS_POSIX_V6_LP64_OFF64_LIBS _CS_POSIX_V6_LP64_OFF64_LIBS
    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,
#define _CS_POSIX_V6_LP64_OFF64_LINTFLAGS _CS_POSIX_V6_LP64_OFF64_LINTFLAGS
    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,
#define _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS
    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,
#define _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS
    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,
#define _CS_POSIX_V6_LPBIG_OFFBIG_LIBS _CS_POSIX_V6_LPBIG_OFFBIG_LIBS
    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,
#define _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LINTF=
LAGS

    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,
#define _CS_POSIX_V7_ILP32_OFF32_CFLAGS _CS_POSIX_V7_ILP32_OFF32_CFLAGS
    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,
#define _CS_POSIX_V7_ILP32_OFF32_LDFLAGS _CS_POSIX_V7_ILP32_OFF32_LDFLAGS
    _CS_POSIX_V7_ILP32_OFF32_LIBS,
#define _CS_POSIX_V7_ILP32_OFF32_LIBS _CS_POSIX_V7_ILP32_OFF32_LIBS
    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,
#define _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS _CS_POSIX_V7_ILP32_OFF32_LINTFLA=
GS
    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,
#define _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS
    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,
#define _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS
    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,
#define _CS_POSIX_V7_ILP32_OFFBIG_LIBS _CS_POSIX_V7_ILP32_OFFBIG_LIBS
    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,
#define _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LINTF=
LAGS
    _CS_POSIX_V7_LP64_OFF64_CFLAGS,
#define _CS_POSIX_V7_LP64_OFF64_CFLAGS _CS_POSIX_V7_LP64_OFF64_CFLAGS
    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,
#define _CS_POSIX_V7_LP64_OFF64_LDFLAGS _CS_POSIX_V7_LP64_OFF64_LDFLAGS
    _CS_POSIX_V7_LP64_OFF64_LIBS,
#define _CS_POSIX_V7_LP64_OFF64_LIBS _CS_POSIX_V7_LP64_OFF64_LIBS
    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,
#define _CS_POSIX_V7_LP64_OFF64_LINTFLAGS _CS_POSIX_V7_LP64_OFF64_LINTFLAGS
    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,
#define _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS
    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,
#define _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS
    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,
#define _CS_POSIX_V7_LPBIG_OFFBIG_LIBS _CS_POSIX_V7_LPBIG_OFFBIG_LIBS
    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,
#define _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LINTF=
LAGS

    _CS_V6_ENV,
#define _CS_V6_ENV _CS_V6_ENV
    _CS_V7_ENV
#define _CS_V7_ENV _CS_V7_ENV
  };
# 610 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 2 3 4


extern long int pathconf (const char *__path, int __name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));


extern long int fpathconf (int __fd, int __name) __attribute__ ((__nothrow_=
_ , __leaf__));


extern long int sysconf (int __name) __attribute__ ((__nothrow__ , __leaf__=
));



extern size_t confstr (int __name, char *__buf, size_t __len) __attribute__=
 ((__nothrow__ , __leaf__));




extern __pid_t getpid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __pid_t getppid (void) __attribute__ ((__nothrow__ , __leaf__));




extern __pid_t getpgrp (void) __attribute__ ((__nothrow__ , __leaf__));
# 646 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern __pid_t __getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __le=
af__));

extern __pid_t getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf=
__));






extern int setpgid (__pid_t __pid, __pid_t __pgid) __attribute__ ((__nothro=
w__ , __leaf__));
# 672 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern int setpgrp (void) __attribute__ ((__nothrow__ , __leaf__));
# 689 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern __pid_t setsid (void) __attribute__ ((__nothrow__ , __leaf__));



extern __pid_t getsid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf_=
_));



extern __uid_t getuid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __uid_t geteuid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __gid_t getgid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __gid_t getegid (void) __attribute__ ((__nothrow__ , __leaf__));




extern int getgroups (int __size, __gid_t __list[]) __attribute__ ((__nothr=
ow__ , __leaf__)) ;
# 722 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern int setuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) =
;




extern int setreuid (__uid_t __ruid, __uid_t __euid) __attribute__ ((__noth=
row__ , __leaf__)) ;




extern int seteuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__))=
 ;






extern int setgid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) =
;




extern int setregid (__gid_t __rgid, __gid_t __egid) __attribute__ ((__noth=
row__ , __leaf__)) ;




extern int setegid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__))=
 ;
# 778 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern __pid_t fork (void) __attribute__ ((__nothrow__));







extern __pid_t vfork (void) __attribute__ ((__nothrow__ , __leaf__));





extern char *ttyname (int __fd) __attribute__ ((__nothrow__ , __leaf__));



extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2))) ;



extern int isatty (int __fd) __attribute__ ((__nothrow__ , __leaf__));





extern int ttyslot (void) __attribute__ ((__nothrow__ , __leaf__));




extern int link (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2))) ;




extern int linkat (int __fromfd, const char *__from, int __tofd,
     const char *__to, int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2, 4))) ;




extern int symlink (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2))) ;




extern ssize_t readlink (const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2))) ;




extern int symlinkat (const char *__from, int __tofd,
        const char *__to) __attribute__ ((__nothrow__ , __leaf__)) __attrib=
ute__ ((__nonnull__ (1, 3))) ;


extern ssize_t readlinkat (int __fd, const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2, 3))) ;



extern int unlink (const char *__name) __attribute__ ((__nothrow__ , __leaf=
__)) __attribute__ ((__nonnull__ (1)));



extern int unlinkat (int __fd, const char *__name, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));



extern int rmdir (const char *__path) __attribute__ ((__nothrow__ , __leaf_=
_)) __attribute__ ((__nonnull__ (1)));



extern __pid_t tcgetpgrp (int __fd) __attribute__ ((__nothrow__ , __leaf__)=
);


extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) __attribute__ ((__nothro=
w__ , __leaf__));






extern char *getlogin (void);







extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__n=
onnull__ (1)));




extern int setlogin (const char *__name) __attribute__ ((__nothrow__ , __le=
af__)) __attribute__ ((__nonnull__ (1)));







#define __need_getopt=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/getopt.h" 1 3 4
# 58 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/getopt.h" 3 4
extern char *optarg;
# 72 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/getopt.h" 3 4
extern int optind;




extern int opterr;



extern int optopt;
# 151 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/getopt.h" 3 4
extern int getopt (int ___argc, char *const *___argv, const char *__shortop=
ts)
       __attribute__ ((__nothrow__ , __leaf__));
# 190 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/getopt.h" 3 4
#undef __need_getopt
# 894 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 2 3 4







extern int gethostname (char *__name, size_t __len) __attribute__ ((__nothr=
ow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int sethostname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1))) ;



extern int sethostid (long int __id) __attribute__ ((__nothrow__ , __leaf__=
)) ;





extern int getdomainname (char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1))) ;
extern int setdomainname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1))) ;





extern int vhangup (void) __attribute__ ((__nothrow__ , __leaf__));


extern int revoke (const char *__file) __attribute__ ((__nothrow__ , __leaf=
__)) __attribute__ ((__nonnull__ (1))) ;







extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));





extern int acct (const char *__name) __attribute__ ((__nothrow__ , __leaf__=
));



extern char *getusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void endusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void setusershell (void) __attribute__ ((__nothrow__ , __leaf__));





extern int daemon (int __nochdir, int __noclose) __attribute__ ((__nothrow_=
_ , __leaf__)) ;






extern int chroot (const char *__path) __attribute__ ((__nothrow__ , __leaf=
__)) __attribute__ ((__nonnull__ (1))) ;



extern char *getpass (const char *__prompt) __attribute__ ((__nonnull__ (1)=
));







extern int fsync (int __fd);
# 991 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern long int gethostid (void);


extern void sync (void) __attribute__ ((__nothrow__ , __leaf__));





extern int getpagesize (void) __attribute__ ((__nothrow__ , __leaf__)) __at=
tribute__ ((__const__));




extern int getdtablesize (void) __attribute__ ((__nothrow__ , __leaf__));
# 1019 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern int truncate (const char *__file, __off64_t __length) __asm__ ("" "t=
runcate64") __attribute__ ((__nothrow__ , __leaf__))

                  __attribute__ ((__nonnull__ (1))) ;





extern int truncate64 (const char *__file, __off64_t __length)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1))) ;
# 1041 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern int ftruncate (int __fd, __off64_t __length) __asm__ ("" "ftruncate6=
4") __attribute__ ((__nothrow__ , __leaf__))
                        ;





extern int ftruncate64 (int __fd, __off64_t __length) __attribute__ ((__not=
hrow__ , __leaf__)) ;
# 1059 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern int brk (void *__addr) __attribute__ ((__nothrow__ , __leaf__)) ;





extern void *sbrk (intptr_t __delta) __attribute__ ((__nothrow__ , __leaf__=
));
# 1080 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern long int syscall (long int __sysno, ...) __attribute__ ((__nothrow__=
 , __leaf__));
# 1097 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
#define F_ULOCK 0
#define F_LOCK 1
#define F_TLOCK 2
#define F_TEST 3





extern int lockf (int __fd, int __cmd, __off64_t __len) __asm__ ("" "lockf6=
4")
                       ;





extern int lockf64 (int __fd, int __cmd, __off64_t __len) ;
# 1134 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4
extern int fdatasync (int __fildes);
# 1172 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/unistd.h" 3 4

# 48 "util/util.h" 2

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
#define _SYS_STAT_H 1
# 33 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
#define __need_time_t=20


#define __need_timespec=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/time.h" 1 3 4
# 66 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_clock_t
# 82 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_time_t
# 94 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __clockid_time_t
# 106 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timer_t
# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timespec
# 39 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 2 3 4
# 104 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/stat.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/stat.h" 3 4
#define _BITS_STAT_H 1


#define _STAT_VER_LINUX_OLD 1
#define _STAT_VER_KERNEL 1
#define _STAT_VER_SVR4 2
#define _STAT_VER_LINUX 3
#define _STAT_VER _STAT_VER_LINUX


#define _MKNOD_VER_LINUX 1
#define _MKNOD_VER_SVR4 2
#define _MKNOD_VER _MKNOD_VER_LINUX


struct stat
  {
    __dev_t st_dev;
    unsigned short int __pad1;



    __ino_t __st_ino;

    __mode_t st_mode;
    __nlink_t st_nlink;
    __uid_t st_uid;
    __gid_t st_gid;
    __dev_t st_rdev;
    unsigned short int __pad2;



    __off64_t st_size;

    __blksize_t st_blksize;




    __blkcnt64_t st_blocks;
# 72 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/stat.h" 3 4
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
#define st_atime st_atim.tv_sec
#define st_mtime st_mtim.tv_sec
#define st_ctime st_ctim.tv_sec
# 90 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/stat.h" 3 4
    __ino64_t st_ino;

  };


struct stat64
  {
    __dev_t st_dev;
    unsigned int __pad1;

    __ino_t __st_ino;
    __mode_t st_mode;
    __nlink_t st_nlink;
    __uid_t st_uid;
    __gid_t st_gid;
    __dev_t st_rdev;
    unsigned int __pad2;
    __off64_t st_size;
    __blksize_t st_blksize;

    __blkcnt64_t st_blocks;







    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 129 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/stat.h" 3 4
    __ino64_t st_ino;
  };



#define _STATBUF_ST_BLKSIZE=20
#define _STATBUF_ST_RDEV=20

#define _STATBUF_ST_NSEC=20



#define __S_IFMT 0170000


#define __S_IFDIR 0040000
#define __S_IFCHR 0020000
#define __S_IFBLK 0060000
#define __S_IFREG 0100000
#define __S_IFIFO 0010000
#define __S_IFLNK 0120000
#define __S_IFSOCK 0140000



#define __S_TYPEISMQ(buf) ((buf)->st_mode - (buf)->st_mode)
#define __S_TYPEISSEM(buf) ((buf)->st_mode - (buf)->st_mode)
#define __S_TYPEISSHM(buf) ((buf)->st_mode - (buf)->st_mode)



#define __S_ISUID 04000
#define __S_ISGID 02000
#define __S_ISVTX 01000
#define __S_IREAD 0400
#define __S_IWRITE 0200
#define __S_IEXEC 0100


#define UTIME_NOW ((1l << 30) - 1l)
#define UTIME_OMIT ((1l << 30) - 2l)
# 107 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 2 3 4


#define S_IFMT __S_IFMT
#define S_IFDIR __S_IFDIR
#define S_IFCHR __S_IFCHR
#define S_IFBLK __S_IFBLK
#define S_IFREG __S_IFREG

#define S_IFIFO __S_IFIFO


#define S_IFLNK __S_IFLNK



#define S_IFSOCK __S_IFSOCK





#define __S_ISTYPE(mode,mask) (((mode) & __S_IFMT) =3D=3D (mask))

#define S_ISDIR(mode) __S_ISTYPE((mode), __S_IFDIR)
#define S_ISCHR(mode) __S_ISTYPE((mode), __S_IFCHR)
#define S_ISBLK(mode) __S_ISTYPE((mode), __S_IFBLK)
#define S_ISREG(mode) __S_ISTYPE((mode), __S_IFREG)

#define S_ISFIFO(mode) __S_ISTYPE((mode), __S_IFIFO)


#define S_ISLNK(mode) __S_ISTYPE((mode), __S_IFLNK)
# 147 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
#define S_ISSOCK(mode) __S_ISTYPE((mode), __S_IFSOCK)
# 157 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
#define S_TYPEISMQ(buf) __S_TYPEISMQ(buf)
#define S_TYPEISSEM(buf) __S_TYPEISSEM(buf)
#define S_TYPEISSHM(buf) __S_TYPEISSHM(buf)





#define S_ISUID __S_ISUID
#define S_ISGID __S_ISGID



#define S_ISVTX __S_ISVTX


#define S_IRUSR __S_IREAD
#define S_IWUSR __S_IWRITE
#define S_IXUSR __S_IEXEC

#define S_IRWXU (__S_IREAD|__S_IWRITE|__S_IEXEC)


#define S_IREAD S_IRUSR
#define S_IWRITE S_IWUSR
#define S_IEXEC S_IXUSR


#define S_IRGRP (S_IRUSR >> 3)
#define S_IWGRP (S_IWUSR >> 3)
#define S_IXGRP (S_IXUSR >> 3)

#define S_IRWXG (S_IRWXU >> 3)

#define S_IROTH (S_IRGRP >> 3)
#define S_IWOTH (S_IWGRP >> 3)
#define S_IXOTH (S_IXGRP >> 3)

#define S_IRWXO (S_IRWXG >> 3)




#define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO)
#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
#define DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)

#define S_BLKSIZE 512
# 218 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
extern int stat (const char *__restrict __file, struct stat *__restrict __b=
uf) __asm__ ("" "stat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (1, 2)));
extern int fstat (int __fd, struct stat *__buf) __asm__ ("" "fstat64") __at=
tribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (2)));






extern int stat64 (const char *__restrict __file,
     struct stat64 *__restrict __buf) __attribute__ ((__nothrow__ , __leaf_=
_)) __attribute__ ((__nonnull__ (1, 2)));
extern int fstat64 (int __fd, struct stat64 *__buf) __attribute__ ((__nothr=
ow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 244 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
extern int fstatat (int __fd, const char *__restrict __file, struct stat *_=
_restrict __buf, int __flag) __asm__ ("" "fstatat64") __attribute__ ((__not=
hrow__ , __leaf__))


                 __attribute__ ((__nonnull__ (2, 3)));






extern int fstatat64 (int __fd, const char *__restrict __file,
        struct stat64 *__restrict __buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2, 3)));
# 268 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
extern int lstat (const char *__restrict __file, struct stat *__restrict __=
buf) __asm__ ("" "lstat64") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (1, 2)));





extern int lstat64 (const char *__restrict __file,
      struct stat64 *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));





extern int chmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));





extern int lchmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));




extern int fchmod (int __fd, __mode_t __mode) __attribute__ ((__nothrow__ ,=
 __leaf__));





extern int fchmodat (int __fd, const char *__file, __mode_t __mode,
       int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2))) ;






extern __mode_t umask (__mode_t __mask) __attribute__ ((__nothrow__ , __lea=
f__));
# 322 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
extern int mkdir (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));





extern int mkdirat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));






extern int mknod (const char *__path, __mode_t __mode, __dev_t __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));





extern int mknodat (int __fd, const char *__path, __mode_t __mode,
      __dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__=
 ((__nonnull__ (2)));





extern int mkfifo (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));





extern int mkfifoat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));





extern int utimensat (int __fd, const char *__path,
        const struct timespec __times[2],
        int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));




extern int futimens (int __fd, const struct timespec __times[2]) __attribut=
e__ ((__nothrow__ , __leaf__));
# 411 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
extern int __fxstat (int __ver, int __fildes, struct stat *__stat_buf) __as=
m__ ("" "__fxstat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (3)));
extern int __xstat (int __ver, const char *__filename, struct stat *__stat_=
buf) __asm__ ("" "__xstat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat (int __ver, const char *__filename, struct stat *__stat=
_buf) __asm__ ("" "__lxstat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat (int __ver, int __fildes, const char *__filename, str=
uct stat *__stat_buf, int __flag) __asm__ ("" "__fxstatat64") __attribute__=
 ((__nothrow__ , __leaf__))


                    __attribute__ ((__nonnull__ (3, 4)));
# 433 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/stat.h" 3 4
extern int __fxstat64 (int __ver, int __fildes, struct stat64 *__stat_buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
3)));
extern int __xstat64 (int __ver, const char *__filename,
        struct stat64 *__stat_buf) __attribute__ ((__nothrow__ , __leaf__))=
 __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat64 (int __ver, const char *__filename,
         struct stat64 *__stat_buf) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat64 (int __ver, int __fildes, const char *__filename,
    struct stat64 *__stat_buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
3, 4)));

extern int __xmknod (int __ver, const char *__path, __mode_t __mode,
       __dev_t *__dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute=
__ ((__nonnull__ (2, 4)));

extern int __xmknodat (int __ver, int __fd, const char *__path,
         __mode_t __mode, __dev_t *__dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
3, 5)));




extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) stat (const char *__path, struct s=
tat *__statbuf)
{
  return __xstat (3, __path, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) lstat (const char *__path, struct =
stat *__statbuf)
{
  return __lxstat (3, __path, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) fstat (int __fd, struct stat *__st=
atbuf)
{
  return __fxstat (3, __fd, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) fstatat (int __fd, const char *__f=
ilename, struct stat *__statbuf, int __flag)

{
  return __fxstatat (3, __fd, __filename, __statbuf, __flag);
}



extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) mknod (const char *__path, __mode_=
t __mode, __dev_t __dev)
{
  return __xmknod (1, __path, __mode, &__dev);
}



extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) mknodat (int __fd, const char *__p=
ath, __mode_t __mode, __dev_t __dev)

{
  return __xmknodat (1, __fd, __path, __mode, &__dev);
}





extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) stat64 (const char *__path, struct=
 stat64 *__statbuf)
{
  return __xstat64 (3, __path, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) lstat64 (const char *__path, struc=
t stat64 *__statbuf)
{
  return __lxstat64 (3, __path, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) fstat64 (int __fd, struct stat64 *=
__statbuf)
{
  return __fxstat64 (3, __fd, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) fstatat64 (int __fd, const char *_=
_filename, struct stat64 *__statbuf, int __flag)

{
  return __fxstatat64 (3, __fd, __filename, __statbuf, __flag);
}







# 50 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/statfs.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/statfs.h" 3 4
#define _SYS_STATFS_H 1




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/statfs.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/statfs.h" 3 4
struct statfs
  {
    __fsword_t f_type;
    __fsword_t f_bsize;







    __fsblkcnt64_t f_blocks;
    __fsblkcnt64_t f_bfree;
    __fsblkcnt64_t f_bavail;
    __fsfilcnt64_t f_files;
    __fsfilcnt64_t f_ffree;

    __fsid_t f_fsid;
    __fsword_t f_namelen;
    __fsword_t f_frsize;
    __fsword_t f_flags;
    __fsword_t f_spare[4];
  };


struct statfs64
  {
    __fsword_t f_type;
    __fsword_t f_bsize;
    __fsblkcnt64_t f_blocks;
    __fsblkcnt64_t f_bfree;
    __fsblkcnt64_t f_bavail;
    __fsfilcnt64_t f_files;
    __fsfilcnt64_t f_ffree;
    __fsid_t f_fsid;
    __fsword_t f_namelen;
    __fsword_t f_frsize;
    __fsword_t f_flags;
    __fsword_t f_spare[4];
  };



#define _STATFS_F_NAMELEN=20
#define _STATFS_F_FRSIZE=20
#define _STATFS_F_FLAGS=20
# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/statfs.h" 2 3 4









extern int statfs (const char *__file, struct statfs *__buf) __asm__ ("" "s=
tatfs64") __attribute__ ((__nothrow__ , __leaf__))

                __attribute__ ((__nonnull__ (1, 2)));





extern int statfs64 (const char *__file, struct statfs64 *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));
# 54 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/statfs.h" 3 4
extern int fstatfs (int __fildes, struct statfs *__buf) __asm__ ("" "fstatf=
s64") __attribute__ ((__nothrow__ , __leaf__))
                 __attribute__ ((__nonnull__ (2)));





extern int fstatfs64 (int __fildes, struct statfs64 *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));



# 51 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4
#define _FCNTL_H 1











# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl.h" 3 4
#define __O_DIRECTORY 040000
#define __O_NOFOLLOW 0100000
#define __O_DIRECT 0200000
#define __O_LARGEFILE 0400000

struct flock
  {
    short int l_type;
    short int l_whence;




    __off64_t l_start;
    __off64_t l_len;

    __pid_t l_pid;
  };


struct flock64
  {
    short int l_type;
    short int l_whence;
    __off64_t l_start;
    __off64_t l_len;
    __pid_t l_pid;
  };



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl-linux.h" 1 3 4
# 42 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl-linux.h" 3 4
#define O_ACCMODE 0003
#define O_RDONLY 00
#define O_WRONLY 01
#define O_RDWR 02

#define O_CREAT 0100


#define O_EXCL 0200


#define O_NOCTTY 0400


#define O_TRUNC 01000


#define O_APPEND 02000


#define O_NONBLOCK 04000


#define O_NDELAY O_NONBLOCK


#define O_SYNC 04010000

#define O_FSYNC O_SYNC

#define O_ASYNC 020000
# 85 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl-linux.h" 3 4
#define __O_CLOEXEC 02000000





#define __O_NOATIME 01000000


#define __O_PATH 010000000


#define __O_DSYNC 010000
# 106 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl-linux.h" 3 4
#define F_GETLK F_GETLK64
#define F_SETLK F_SETLK64
#define F_SETLKW F_SETLKW64



#define F_GETLK64 12
#define F_SETLK64 13
#define F_SETLKW64 14



#define O_LARGEFILE __O_LARGEFILE



#define O_DIRECTORY __O_DIRECTORY
#define O_NOFOLLOW __O_NOFOLLOW
#define O_CLOEXEC __O_CLOEXEC
# 137 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl-linux.h" 3 4
#define O_DSYNC __O_DSYNC



#define O_RSYNC O_SYNC




#define F_DUPFD 0
#define F_GETFD 1
#define F_SETFD 2
#define F_GETFL 3
#define F_SETFL 4


#define __F_SETOWN 8
#define __F_GETOWN 9



#define F_SETOWN __F_SETOWN
#define F_GETOWN __F_GETOWN



#define __F_SETSIG 10
#define __F_GETSIG 11


#define __F_SETOWN_EX 15
#define __F_GETOWN_EX 16
# 186 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl-linux.h" 3 4
#define F_DUPFD_CLOEXEC 1030




#define FD_CLOEXEC 1



#define F_RDLCK 0
#define F_WRLCK 1
#define F_UNLCK 2





#define F_EXLCK 4
#define F_SHLCK 8




#define LOCK_SH 1
#define LOCK_EX 2
#define LOCK_NB 4

#define LOCK_UN 8
# 256 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl-linux.h" 3 4
#define FAPPEND O_APPEND
#define FFSYNC O_FSYNC
#define FASYNC O_ASYNC
#define FNONBLOCK O_NONBLOCK
#define FNDELAY O_NDELAY



#define __POSIX_FADV_DONTNEED 4
#define __POSIX_FADV_NOREUSE 5



#define POSIX_FADV_NORMAL 0
#define POSIX_FADV_RANDOM 1
#define POSIX_FADV_SEQUENTIAL 2
#define POSIX_FADV_WILLNEED 3
#define POSIX_FADV_DONTNEED __POSIX_FADV_DONTNEED
#define POSIX_FADV_NOREUSE __POSIX_FADV_NOREUSE
# 312 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl-linux.h" 3 4

# 386 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl-linux.h" 3 4

# 54 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/fcntl.h" 2 3 4
# 36 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 2 3 4
# 66 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4
#define __need_timespec=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/time.h" 1 3 4
# 66 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_clock_t
# 82 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_time_t
# 94 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __clockid_time_t
# 106 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timer_t
# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timespec
# 68 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 2 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/stat.h" 1 3 4
# 69 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 2 3 4

#define S_IFMT __S_IFMT
#define S_IFDIR __S_IFDIR
#define S_IFCHR __S_IFCHR
#define S_IFBLK __S_IFBLK
#define S_IFREG __S_IFREG

#define S_IFIFO __S_IFIFO


#define S_IFLNK __S_IFLNK


#define S_IFSOCK __S_IFSOCK




#define S_ISUID __S_ISUID
#define S_ISGID __S_ISGID



#define S_ISVTX __S_ISVTX


#define S_IRUSR __S_IREAD
#define S_IWUSR __S_IWRITE
#define S_IXUSR __S_IEXEC

#define S_IRWXU (__S_IREAD|__S_IWRITE|__S_IEXEC)

#define S_IRGRP (S_IRUSR >> 3)
#define S_IWGRP (S_IWUSR >> 3)
#define S_IXGRP (S_IXUSR >> 3)

#define S_IRWXG (S_IRWXU >> 3)

#define S_IROTH (S_IRGRP >> 3)
#define S_IWOTH (S_IWGRP >> 3)
#define S_IXOTH (S_IXGRP >> 3)

#define S_IRWXO (S_IRWXG >> 3)
# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4
#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2



#define AT_FDCWD -100


#define AT_SYMLINK_NOFOLLOW 0x100
#define AT_REMOVEDIR 0x200

#define AT_SYMLINK_FOLLOW 0x400





#define AT_EACCESS 0x200
# 154 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4
extern int fcntl (int __fd, int __cmd, ...);
# 166 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4
extern int open (const char *__file, int __oflag, ...) __asm__ ("" "open64"=
)
     __attribute__ ((__nonnull__ (1)));





extern int open64 (const char *__file, int __oflag, ...) __attribute__ ((__=
nonnull__ (1)));
# 191 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4
extern int openat (int __fd, const char *__file, int __oflag, ...) __asm__ =
("" "openat64")
                    __attribute__ ((__nonnull__ (2)));





extern int openat64 (int __fd, const char *__file, int __oflag, ...)
     __attribute__ ((__nonnull__ (2)));
# 212 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4
extern int creat (const char *__file, mode_t __mode) __asm__ ("" "creat64")
                  __attribute__ ((__nonnull__ (1)));





extern int creat64 (const char *__file, mode_t __mode) __attribute__ ((__no=
nnull__ (1)));
# 259 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4
extern int posix_fadvise (int __fd, __off64_t __offset, __off64_t __len, in=
t __advise) __asm__ ("" "posix_fadvise64") __attribute__ ((__nothrow__ , __=
leaf__))

                      ;





extern int posix_fadvise64 (int __fd, off64_t __offset, off64_t __len,
       int __advise) __attribute__ ((__nothrow__ , __leaf__));
# 280 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4
extern int posix_fallocate (int __fd, __off64_t __offset, __off64_t __len) =
__asm__ ("" "posix_fallocate64")

                           ;





extern int posix_fallocate64 (int __fd, off64_t __offset, off64_t __len);
# 299 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/fcntl.h" 3 4

# 52 "util/util.h" 2

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 39 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#define _STDDEF_H=20
#define _STDDEF_H_=20

#define _ANSI_STDDEF_H=20
# 136 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#define _PTRDIFF_T=20
#define _T_PTRDIFF_=20
#define _T_PTRDIFF=20
#define __PTRDIFF_T=20
#define _PTRDIFF_T_=20
#define _BSD_PTRDIFF_T_=20
#define ___int_ptrdiff_t_h=20
#define _GCC_PTRDIFF_T=20



typedef int ptrdiff_t;
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 54 "util/util.h" 2

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stdarg.h" 1 3 4
# 31 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include/stdarg.h" 3 4
#define _STDARG_H=20
#define _ANSI_STDARG_H_=20

#undef __need___va_list
# 47 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include/stdarg.h" 3 4
#define va_start(v,l) __builtin_va_start(v,l)
#define va_end(v) __builtin_va_end(v)
#define va_arg(v,l) __builtin_va_arg(v,l)

#define va_copy(d,s) __builtin_va_copy(d,s)

#define __va_copy(d,s) __builtin_va_copy(d,s)
# 104 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stdarg.h" 3 4
#define _VA_LIST_=20


#define _VA_LIST=20





#define _VA_LIST_T_H=20


#define __va_list__=20
# 56 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/string.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
#define _STRING_H 1






#define __need_size_t=20
#define __need_NULL=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 33 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ (=
(__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));






extern void *memccpy (void *__restrict __dest, const void *__restrict __src=
,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__noth=
row__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));
# 92 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) _=
_attribute__ ((__nonnull__ (1)));


# 123 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src=
,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ =
((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));






# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/xlocale.h" 1 3 4
# 21 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/xlocale.h" 3 4
#define _XLOCALE_H 1





typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 160 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 2 3 4


extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ =
((__nonnull__ (2, 4)));





extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) =
__attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) =
__attribute__ ((__nonnull__ (1)));
# 207 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4

# 232 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1)));
# 259 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1)));


# 278 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4



extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));
# 311 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));
# 338 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim=
,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2, 3)));
# 393 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4


extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__=
));

# 423 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ =
("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__))

                        __attribute__ ((__nonnull__ (2)));
# 441 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__no=
throw__ , __leaf__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , _=
_leaf__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __l=
eaf__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));
# 485 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1)));
# 513 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribu=
te__ ((__const__));
# 532 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __=
attribute__ ((__nonnull__ (1, 2)));
# 555 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__))=
;


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __sr=
c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1, 2)));
# 630 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/string.h" 1 3 4
# 9 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/string.h" 3 4
#define _BITS_STRING_H 1
# 631 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 2 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 1 3 4
# 45 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define __STRING_INLINE __extern_inline
# 76 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define __STRING2_COPY_TYPE(N) typedef struct { unsigned char __arr[N]; } _=
_attribute__ ((__packed__)) __STRING2_COPY_ARR ##N


typedef struct { unsigned char __arr[2]; } __attribute__ ((__packed__)) __S=
TRING2_COPY_ARR2;
typedef struct { unsigned char __arr[3]; } __attribute__ ((__packed__)) __S=
TRING2_COPY_ARR3;
typedef struct { unsigned char __arr[4]; } __attribute__ ((__packed__)) __S=
TRING2_COPY_ARR4;
typedef struct { unsigned char __arr[5]; } __attribute__ ((__packed__)) __S=
TRING2_COPY_ARR5;
typedef struct { unsigned char __arr[6]; } __attribute__ ((__packed__)) __S=
TRING2_COPY_ARR6;
typedef struct { unsigned char __arr[7]; } __attribute__ ((__packed__)) __S=
TRING2_COPY_ARR7;
typedef struct { unsigned char __arr[8]; } __attribute__ ((__packed__)) __S=
TRING2_COPY_ARR8;
#undef __STRING2_COPY_TYPE





#define __string2_1bptr_p(__x) ((size_t)(const void *)((__x) + 1) - (size_t=
)(const void *)(__x) =3D=3D 1)
# 194 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define __bzero(s,n) __builtin_memset (s, '\0', n)
# 393 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
extern void *__rawmemchr (const void *__s, int __c);

#define strchr(s,c) (__extension__ (__builtin_constant_p (c) && !__builtin_=
constant_p (s) && (c) =3D=3D '\0' ? (char *) __rawmemchr (s, c) : __builtin=
_strchr (s, c)))
# 760 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define strncpy(dest,src,n) __builtin_strncpy (dest, src, n)
# 784 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define strncat(dest,src,n) __builtin_strncat (dest, src, n)
# 799 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define strcmp(s1,s2) __extension__ ({ size_t __s1_len, __s2_len; (__builti=
n_constant_p (s1) && __builtin_constant_p (s2) && (__s1_len =3D strlen (s1)=
, __s2_len =3D strlen (s2), (!__string2_1bptr_p (s1) || __s1_len >=3D 4) &&=
 (!__string2_1bptr_p (s2) || __s2_len >=3D 4)) ? __builtin_strcmp (s1, s2) =
: (__builtin_constant_p (s1) && __string2_1bptr_p (s1) && (__s1_len =3D str=
len (s1), __s1_len < 4) ? (__builtin_constant_p (s2) && __string2_1bptr_p (=
s2) ? __builtin_strcmp (s1, s2) : __strcmp_cg (s1, s2, __s1_len)) : (__buil=
tin_constant_p (s2) && __string2_1bptr_p (s2) && (__s2_len =3D strlen (s2),=
 __s2_len < 4) ? (__builtin_constant_p (s1) && __string2_1bptr_p (s1) ? __b=
uiltin_strcmp (s1, s2) : __strcmp_gc (s1, s2, __s2_len)) : __builtin_strcmp=
 (s1, s2)))); })
# 841 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define __strcmp_cc(s1,s2,l) (__extension__ ({ register int __result =3D ((=
(const unsigned char *) (const char *) (s1))[0] - ((const unsigned char *) =
(const char *)(s2))[0]); if (l > 0 && __result =3D=3D 0) { __result =3D (((=
const unsigned char *) (const char *) (s1))[1] - ((const unsigned char *) (=
const char *) (s2))[1]); if (l > 1 && __result =3D=3D 0) { __result =3D (((=
const unsigned char *) (const char *) (s1))[2] - ((const unsigned char *) (=
const char *) (s2))[2]); if (l > 2 && __result =3D=3D 0) __result =3D (((co=
nst unsigned char *) (const char *) (s1))[3] - ((const unsigned char *) (co=
nst char *) (s2))[3]); } } __result; }))
# 868 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define __strcmp_cg(s1,s2,l1) (__extension__ ({ const unsigned char *__s2 =
=3D (const unsigned char *) (const char *) (s2); register int __result =3D =
(((const unsigned char *) (const char *) (s1))[0] - __s2[0]); if (l1 > 0 &&=
 __result =3D=3D 0) { __result =3D (((const unsigned char *) (const char *)=
 (s1))[1] - __s2[1]); if (l1 > 1 && __result =3D=3D 0) { __result =3D (((co=
nst unsigned char *) (const char *) (s1))[2] - __s2[2]); if (l1 > 2 && __re=
sult =3D=3D 0) __result =3D (((const unsigned char *) (const char *) (s1))[=
3] - __s2[3]); } } __result; }))
# 890 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define __strcmp_gc(s1,s2,l2) (__extension__ ({ const unsigned char *__s1 =
=3D (const unsigned char *) (const char *) (s1); register int __result =3D =
__s1[0] - ((const unsigned char *) (const char *) (s2))[0]; if (l2 > 0 && _=
_result =3D=3D 0) { __result =3D (__s1[1] - ((const unsigned char *) (const=
 char *) (s2))[1]); if (l2 > 1 && __result =3D=3D 0) { __result =3D (__s1[2=
] - ((const unsigned char *) (const char *) (s2))[2]); if (l2 > 2 && __resu=
lt =3D=3D 0) __result =3D (__s1[3] - ((const unsigned char *) (const char *=
) (s2))[3]); } } __result; }))
# 919 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define strncmp(s1,s2,n) (__extension__ (__builtin_constant_p (n) && ((__bu=
iltin_constant_p (s1) && strlen (s1) < ((size_t) (n))) || (__builtin_consta=
nt_p (s2) && strlen (s2) < ((size_t) (n)))) ? strcmp (s1, s2) : strncmp (s1=
, s2, n)))
# 934 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define strcspn(s,reject) __extension__ ({ char __r0, __r1, __r2; (__builti=
n_constant_p (reject) && __string2_1bptr_p (reject) ? ((__builtin_constant_=
p (s) && __string2_1bptr_p (s)) ? __builtin_strcspn (s, reject) : ((__r0 =
=3D ((const char *) (reject))[0], __r0 =3D=3D '\0') ? strlen (s) : ((__r1 =
=3D ((const char *) (reject))[1], __r1 =3D=3D '\0') ? __strcspn_c1 (s, __r0=
) : ((__r2 =3D ((const char *) (reject))[2], __r2 =3D=3D '\0') ? __strcspn_=
c2 (s, __r0, __r1) : (((const char *) (reject))[3] =3D=3D '\0' ? __strcspn_=
c3 (s, __r0, __r1, __r2) : __builtin_strcspn (s, reject)))))) : __builtin_s=
trcspn (s, reject)); })
# 968 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
extern __inline size_t __strcspn_c1 (const char *__s, int __reject);
extern __inline size_t
__strcspn_c1 (const char *__s, int __reject)
{
  register size_t __result =3D 0;
  while (__s[__result] !=3D '\0' && __s[__result] !=3D __reject)
    ++__result;
  return __result;
}

extern __inline size_t __strcspn_c2 (const char *__s, int __reject1,
         int __reject2);
extern __inline size_t
__strcspn_c2 (const char *__s, int __reject1, int __reject2)
{
  register size_t __result =3D 0;
  while (__s[__result] !=3D '\0' && __s[__result] !=3D __reject1
  && __s[__result] !=3D __reject2)
    ++__result;
  return __result;
}

extern __inline size_t __strcspn_c3 (const char *__s, int __reject1,
         int __reject2, int __reject3);
extern __inline size_t
__strcspn_c3 (const char *__s, int __reject1, int __reject2,
       int __reject3)
{
  register size_t __result =3D 0;
  while (__s[__result] !=3D '\0' && __s[__result] !=3D __reject1
  && __s[__result] !=3D __reject2 && __s[__result] !=3D __reject3)
    ++__result;
  return __result;
}
# 1010 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define strspn(s,accept) __extension__ ({ char __a0, __a1, __a2; (__builtin=
_constant_p (accept) && __string2_1bptr_p (accept) ? ((__builtin_constant_p=
 (s) && __string2_1bptr_p (s)) ? __builtin_strspn (s, accept) : ((__a0 =3D =
((const char *) (accept))[0], __a0 =3D=3D '\0') ? ((void) (s), (size_t) 0) =
: ((__a1 =3D ((const char *) (accept))[1], __a1 =3D=3D '\0') ? __strspn_c1 =
(s, __a0) : ((__a2 =3D ((const char *) (accept))[2], __a2 =3D=3D '\0') ? __=
strspn_c2 (s, __a0, __a1) : (((const char *) (accept))[3] =3D=3D '\0' ? __s=
trspn_c3 (s, __a0, __a1, __a2) : __builtin_strspn (s, accept)))))) : __buil=
tin_strspn (s, accept)); })
# 1044 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
extern __inline size_t __strspn_c1 (const char *__s, int __accept);
extern __inline size_t
__strspn_c1 (const char *__s, int __accept)
{
  register size_t __result =3D 0;

  while (__s[__result] =3D=3D __accept)
    ++__result;
  return __result;
}

extern __inline size_t __strspn_c2 (const char *__s, int __accept1,
        int __accept2);
extern __inline size_t
__strspn_c2 (const char *__s, int __accept1, int __accept2)
{
  register size_t __result =3D 0;

  while (__s[__result] =3D=3D __accept1 || __s[__result] =3D=3D __accept2)
    ++__result;
  return __result;
}

extern __inline size_t __strspn_c3 (const char *__s, int __accept1,
        int __accept2, int __accept3);
extern __inline size_t
__strspn_c3 (const char *__s, int __accept1, int __accept2, int __accept3)
{
  register size_t __result =3D 0;

  while (__s[__result] =3D=3D __accept1 || __s[__result] =3D=3D __accept2
  || __s[__result] =3D=3D __accept3)
    ++__result;
  return __result;
}







#define strpbrk(s,accept) __extension__ ({ char __a0, __a1, __a2; (__builti=
n_constant_p (accept) && __string2_1bptr_p (accept) ? ((__builtin_constant_=
p (s) && __string2_1bptr_p (s)) ? __builtin_strpbrk (s, accept) : ((__a0 =
=3D ((const char *) (accept))[0], __a0 =3D=3D '\0') ? ((void) (s), (char *)=
 NULL) : ((__a1 =3D ((const char *) (accept))[1], __a1 =3D=3D '\0') ? __bui=
ltin_strchr (s, __a0) : ((__a2 =3D ((const char *) (accept))[2], __a2 =3D=
=3D '\0') ? __strpbrk_c2 (s, __a0, __a1) : (((const char *) (accept))[3] =
=3D=3D '\0' ? __strpbrk_c3 (s, __a0, __a1, __a2) : __builtin_strpbrk (s, ac=
cept)))))) : __builtin_strpbrk (s, accept)); })
# 1120 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
extern __inline char *__strpbrk_c2 (const char *__s, int __accept1,
        int __accept2);
extern __inline char *
__strpbrk_c2 (const char *__s, int __accept1, int __accept2)
{

  while (*__s !=3D '\0' && *__s !=3D __accept1 && *__s !=3D __accept2)
    ++__s;
  return *__s =3D=3D '\0' ? ((void *)0) : (char *) (size_t) __s;
}

extern __inline char *__strpbrk_c3 (const char *__s, int __accept1,
        int __accept2, int __accept3);
extern __inline char *
__strpbrk_c3 (const char *__s, int __accept1, int __accept2, int __accept3)
{

  while (*__s !=3D '\0' && *__s !=3D __accept1 && *__s !=3D __accept2
  && *__s !=3D __accept3)
    ++__s;
  return *__s =3D=3D '\0' ? ((void *)0) : (char *) (size_t) __s;
}
# 1162 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define __strtok_r(s,sep,nextp) (__extension__ (__builtin_constant_p (sep) =
&& __string2_1bptr_p (sep) && ((const char *) (sep))[0] !=3D '\0' && ((cons=
t char *) (sep))[1] =3D=3D '\0' ? __strtok_r_1c (s, ((const char *) (sep))[=
0], nextp) : __strtok_r (s, sep, nextp)))







extern __inline char *__strtok_r_1c (char *__s, char __sep, char **__nextp)=
;
extern __inline char *
__strtok_r_1c (char *__s, char __sep, char **__nextp)
{
  char *__result;
  if (__s =3D=3D ((void *)0))
    __s =3D *__nextp;
  while (*__s =3D=3D __sep)
    ++__s;
  __result =3D ((void *)0);
  if (*__s !=3D '\0')
    {
      __result =3D __s++;
      while (*__s !=3D '\0')
 if (*__s++ =3D=3D __sep)
   {
     __s[-1] =3D '\0';
     break;
   }
    }
  *__nextp =3D __s;
  return __result;
}

#define strtok_r(s,sep,nextp) __strtok_r (s, sep, nextp)







extern char *__strsep_g (char **__stringp, const char *__delim);
#define __strsep(s,reject) __extension__ ({ char __r0, __r1, __r2; (__built=
in_constant_p (reject) && __string2_1bptr_p (reject) && (__r0 =3D ((const c=
har *) (reject))[0], ((const char *) (reject))[0] !=3D '\0') ? ((__r1 =3D (=
(const char *) (reject))[1], ((const char *) (reject))[1] =3D=3D '\0') ? __=
strsep_1c (s, __r0) : ((__r2 =3D ((const char *) (reject))[2], __r2 =3D=3D =
'\0') ? __strsep_2c (s, __r0, __r1) : (((const char *) (reject))[3] =3D=3D =
'\0' ? __strsep_3c (s, __r0, __r1, __r2) : __strsep_g (s, reject)))) : __st=
rsep_g (s, reject)); })
# 1220 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
extern __inline char *__strsep_1c (char **__s, char __reject);
extern __inline char *
__strsep_1c (char **__s, char __reject)
{
  register char *__retval =3D *__s;
  if (__retval !=3D ((void *)0) && (*__s =3D (__extension__ (__builtin_cons=
tant_p (__reject) && !__builtin_constant_p (__retval) && (__reject) =3D=3D =
'\0' ? (char *) __rawmemchr (__retval, __reject) : __builtin_strchr (__retv=
al, __reject)))) !=3D ((void *)0))
    *(*__s)++ =3D '\0';
  return __retval;
}

extern __inline char *__strsep_2c (char **__s, char __reject1, char __rejec=
t2);
extern __inline char *
__strsep_2c (char **__s, char __reject1, char __reject2)
{
  register char *__retval =3D *__s;
  if (__retval !=3D ((void *)0))
    {
      register char *__cp =3D __retval;
      while (1)
 {
   if (*__cp =3D=3D '\0')
     {
       __cp =3D ((void *)0);
   break;
     }
   if (*__cp =3D=3D __reject1 || *__cp =3D=3D __reject2)
     {
       *__cp++ =3D '\0';
       break;
     }
   ++__cp;
 }
      *__s =3D __cp;
    }
  return __retval;
}

extern __inline char *__strsep_3c (char **__s, char __reject1, char __rejec=
t2,
       char __reject3);
extern __inline char *
__strsep_3c (char **__s, char __reject1, char __reject2, char __reject3)
{
  register char *__retval =3D *__s;
  if (__retval !=3D ((void *)0))
    {
      register char *__cp =3D __retval;
      while (1)
 {
   if (*__cp =3D=3D '\0')
     {
       __cp =3D ((void *)0);
   break;
     }
   if (*__cp =3D=3D __reject1 || *__cp =3D=3D __reject2 || *__cp =3D=3D __r=
eject3)
     {
       *__cp++ =3D '\0';
       break;
     }
   ++__cp;
 }
      *__s =3D __cp;
    }
  return __retval;
}

#define strsep(s,reject) __strsep (s, reject)
# 1295 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define __need_malloc_and_calloc=20





extern char *__strdup (const char *__string) __attribute__ ((__nothrow__ , =
__leaf__)) __attribute__ ((__malloc__));
#define __strdup(s) (__extension__ (__builtin_constant_p (s) && __string2_1=
bptr_p (s) ? (((const char *) (s))[0] =3D=3D '\0' ? (char *) calloc ((size_=
t) 1, (size_t) 1) : ({ size_t __len =3D strlen (s) + 1; char *__retval =3D =
(char *) malloc (__len); if (__retval !=3D NULL) __retval =3D (char *) memc=
py (__retval, s, __len); __retval; })) : __strdup (s)))
# 1314 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#define strdup(s) __strdup (s)





extern char *__strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__));
#define __strndup(s,n) (__extension__ (__builtin_constant_p (s) && __string=
2_1bptr_p (s) ? (((const char *) (s))[0] =3D=3D '\0' ? (char *) calloc ((si=
ze_t) 1, (size_t) 1) : ({ size_t __len =3D strlen (s) + 1; size_t __n =3D (=
n); char *__retval; if (__n < __len) __len =3D __n + 1; __retval =3D (char =
*) malloc (__len); if (__retval !=3D NULL) { __retval[__len - 1] =3D '\0'; =
__retval =3D (char *) memcpy (__retval, s, __len - 1); } __retval; })) : __=
strndup (s, n)))
# 1349 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-a=
rm/build/build/tmp/sysroots/imx28evk/usr/include/bits/string2.h" 3 4
#undef __STRING_INLINE
# 634 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 2 3 4
# 642 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/string.h" 3 4

# 57 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/errno.h" 1 3 4
# 58 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 1 3 4
# 30 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 3 4
#define _GCC_LIMITS_H_=20



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include-fixed/syslimits.h" 1 3 4





#define _GCC_NEXT_LIMITS_H=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 1 3 4
# 168 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/limits.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/limits.h" 3 4
#define _LIBC_LIMITS_H_ 1







#define MB_LEN_MAX 16
# 132 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/limits.h" 3 4
#define LLONG_MIN (-LLONG_MAX-1)


#define LLONG_MAX __LONG_LONG_MAX__


#define ULLONG_MAX (LLONG_MAX * 2ULL + 1)





# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/posix1_lim.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/posix1_lim.h" 3 4
#define _BITS_POSIX1_LIM_H 1





#define _POSIX_AIO_LISTIO_MAX 2


#define _POSIX_AIO_MAX 1


#define _POSIX_ARG_MAX 4096



#define _POSIX_CHILD_MAX 25





#define _POSIX_DELAYTIMER_MAX 32



#define _POSIX_HOST_NAME_MAX 255


#define _POSIX_LINK_MAX 8


#define _POSIX_LOGIN_NAME_MAX 9


#define _POSIX_MAX_CANON 255



#define _POSIX_MAX_INPUT 255


#define _POSIX_MQ_OPEN_MAX 8


#define _POSIX_MQ_PRIO_MAX 32


#define _POSIX_NAME_MAX 14



#define _POSIX_NGROUPS_MAX 8






#define _POSIX_OPEN_MAX 20
# 96 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/posix1_lim.h" 3 4
#define _POSIX_PATH_MAX 256


#define _POSIX_PIPE_BUF 512



#define _POSIX_RE_DUP_MAX 255


#define _POSIX_RTSIG_MAX 8


#define _POSIX_SEM_NSEMS_MAX 256


#define _POSIX_SEM_VALUE_MAX 32767


#define _POSIX_SIGQUEUE_MAX 32


#define _POSIX_SSIZE_MAX 32767


#define _POSIX_STREAM_MAX 8


#define _POSIX_SYMLINK_MAX 255



#define _POSIX_SYMLOOP_MAX 8


#define _POSIX_TIMER_MAX 32


#define _POSIX_TTY_NAME_MAX 9



#define _POSIX_TZNAME_MAX 6
# 156 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/posix1_lim.h" 3 4
#define _POSIX_CLOCKRES_MIN 20000000



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/local_lim.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/local_lim.h" 3 4
#define __undef_NR_OPEN=20


#define __undef_LINK_MAX=20


#define __undef_OPEN_MAX=20


#define __undef_ARG_MAX=20



# 1 "../../include/linux/limits.h" 1 3 4

#define _LINUX_LIMITS_H=20

#define NR_OPEN 1024

#define NGROUPS_MAX 65536
#define ARG_MAX 131072
#define LINK_MAX 127
#define MAX_CANON 255
#define MAX_INPUT 255
#define NAME_MAX 255
#define PATH_MAX 4096
#define PIPE_BUF 4096
#define XATTR_NAME_MAX 255
#define XATTR_SIZE_MAX 65536
#define XATTR_LIST_MAX 65536

#define RTSIG_MAX 32
# 39 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/local_lim.h" 2 3 4



#undef NR_OPEN
#undef __undef_NR_OPEN



#undef LINK_MAX
#undef __undef_LINK_MAX



#undef OPEN_MAX
#undef __undef_OPEN_MAX



#undef ARG_MAX
#undef __undef_ARG_MAX



#define _POSIX_THREAD_KEYS_MAX 128

#define PTHREAD_KEYS_MAX 1024


#define _POSIX_THREAD_DESTRUCTOR_ITERATIONS 4

#define PTHREAD_DESTRUCTOR_ITERATIONS _POSIX_THREAD_DESTRUCTOR_ITERATIONS


#define _POSIX_THREAD_THREADS_MAX 64

#undef PTHREAD_THREADS_MAX



#define AIO_PRIO_DELTA_MAX 20


#define PTHREAD_STACK_MIN 16384


#define DELAYTIMER_MAX 2147483647


#define TTY_NAME_MAX 32


#define LOGIN_NAME_MAX 256


#define HOST_NAME_MAX 64


#define MQ_PRIO_MAX 32768


#define SEM_VALUE_MAX (2147483647)
# 161 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/posix1_lim.h" 2 3 4



#define SSIZE_MAX LONG_MAX
# 145 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/limits.h" 2 3 4



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/posix2_lim.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/posix2_lim.h" 3 4
#define _BITS_POSIX2_LIM_H 1



#define _POSIX2_BC_BASE_MAX 99


#define _POSIX2_BC_DIM_MAX 2048


#define _POSIX2_BC_SCALE_MAX 99


#define _POSIX2_BC_STRING_MAX 1000



#define _POSIX2_COLL_WEIGHTS_MAX 2



#define _POSIX2_EXPR_NEST_MAX 32


#define _POSIX2_LINE_MAX 2048



#define _POSIX2_RE_DUP_MAX 255



#define _POSIX2_CHARCLASS_NAME_MAX 14







#define BC_BASE_MAX _POSIX2_BC_BASE_MAX


#define BC_DIM_MAX _POSIX2_BC_DIM_MAX


#define BC_SCALE_MAX _POSIX2_BC_SCALE_MAX


#define BC_STRING_MAX _POSIX2_BC_STRING_MAX


#define COLL_WEIGHTS_MAX 255


#define EXPR_NEST_MAX _POSIX2_EXPR_NEST_MAX


#define LINE_MAX _POSIX2_LINE_MAX


#define CHARCLASS_NAME_MAX 2048



#define RE_DUP_MAX (0x7fff)
# 149 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/limits.h" 2 3 4
# 169 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 2 3 4
# 8 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include-fixed/syslimits.h" 2 3 4
#undef _GCC_NEXT_LIMITS_H
# 35 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 2 3 4
# 60 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 3 4
#define _LIMITS_H___=20


#undef CHAR_BIT
#define CHAR_BIT __CHAR_BIT__







#undef SCHAR_MIN
#define SCHAR_MIN (-SCHAR_MAX - 1)
#undef SCHAR_MAX
#define SCHAR_MAX __SCHAR_MAX__


#undef UCHAR_MAX



#define UCHAR_MAX (SCHAR_MAX * 2 + 1)




#undef CHAR_MIN



#define CHAR_MIN 0

#undef CHAR_MAX
#define CHAR_MAX UCHAR_MAX
# 103 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 3 4
#undef SHRT_MIN
#define SHRT_MIN (-SHRT_MAX - 1)
#undef SHRT_MAX
#define SHRT_MAX __SHRT_MAX__


#undef USHRT_MAX



#define USHRT_MAX (SHRT_MAX * 2 + 1)



#undef INT_MIN
#define INT_MIN (-INT_MAX - 1)
#undef INT_MAX
#define INT_MAX __INT_MAX__


#undef UINT_MAX
#define UINT_MAX (INT_MAX * 2U + 1U)



#undef LONG_MIN
#define LONG_MIN (-LONG_MAX - 1L)
#undef LONG_MAX
#define LONG_MAX __LONG_MAX__


#undef ULONG_MAX
#define ULONG_MAX (LONG_MAX * 2UL + 1UL)
# 59 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/param.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/param.h" 3 4
#define _SYS_PARAM_H 1

#define __need_NULL=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/param.h" 2 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 1 3 4
# 27 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/param.h" 2 3 4

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4
#define _SIGNAL_H=20






# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/sigset.h" 1 3 4
# 43 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigset.h" 3 4
#define _SIGSET_H_fns 1


#define _EXTERN_INLINE __extern_inline



#define __sigmask(sig) (((unsigned long int) 1) << (((sig) - 1) % (8 * size=
of (unsigned long int))))



#define __sigword(sig) (((sig) - 1) / (8 * sizeof (unsigned long int)))


#define __sigemptyset(set) (__extension__ ({ int __cnt =3D _SIGSET_NWORDS; =
sigset_t *__set =3D (set); while (--__cnt >=3D 0) __set->__val[__cnt] =3D 0=
; 0; }))




#define __sigfillset(set) (__extension__ ({ int __cnt =3D _SIGSET_NWORDS; s=
igset_t *__set =3D (set); while (--__cnt >=3D 0) __set->__val[__cnt] =3D ~0=
UL; 0; }))
# 103 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigset.h" 3 4
extern int __sigismember (const __sigset_t *, int);
extern int __sigaddset (__sigset_t *, int);
extern int __sigdelset (__sigset_t *, int);


#define __SIGSETFN(NAME,BODY,CONST) _EXTERN_INLINE int NAME (CONST __sigset=
_t *__set, int __sig) { unsigned long int __mask =3D __sigmask (__sig); uns=
igned long int __word =3D __sigword (__sig); return BODY; }
# 117 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigset.h" 3 4
extern __inline int __sigismember (const __sigset_t *__set, int __sig) { un=
signed long int __mask =3D (((unsigned long int) 1) << (((__sig) - 1) % (8 =
* sizeof (unsigned long int)))); unsigned long int __word =3D (((__sig) - 1=
) / (8 * sizeof (unsigned long int))); return (__set->__val[__word] & __mas=
k) ? 1 : 0; }
extern __inline int __sigaddset ( __sigset_t *__set, int __sig) { unsigned =
long int __mask =3D (((unsigned long int) 1) << (((__sig) - 1) % (8 * sizeo=
f (unsigned long int)))); unsigned long int __word =3D (((__sig) - 1) / (8 =
* sizeof (unsigned long int))); return ((__set->__val[__word] |=3D __mask),=
 0); }
extern __inline int __sigdelset ( __sigset_t *__set, int __sig) { unsigned =
long int __mask =3D (((unsigned long int) 1) << (((__sig) - 1) % (8 * sizeo=
f (unsigned long int)))); unsigned long int __word =3D (((__sig) - 1) / (8 =
* sizeof (unsigned long int))); return ((__set->__val[__word] &=3D ~__mask)=
, 0); }

#undef __SIGSETFN
# 33 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4





#define __sig_atomic_t_defined=20

typedef __sig_atomic_t sig_atomic_t;


#undef __need_sig_atomic_t







#undef __need_sigset_t





# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/signum.h" 1 3 4
# 22 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/signum.h" 3 4
#define SIG_ERR ((__sighandler_t) -1)
#define SIG_DFL ((__sighandler_t) 0)
#define SIG_IGN ((__sighandler_t) 1)







#define SIGHUP 1
#define SIGINT 2
#define SIGQUIT 3
#define SIGILL 4
#define SIGTRAP 5
#define SIGABRT 6
#define SIGIOT 6
#define SIGBUS 7
#define SIGFPE 8
#define SIGKILL 9
#define SIGUSR1 10
#define SIGSEGV 11
#define SIGUSR2 12
#define SIGPIPE 13
#define SIGALRM 14
#define SIGTERM 15
#define SIGSTKFLT 16
#define SIGCLD SIGCHLD
#define SIGCHLD 17
#define SIGCONT 18
#define SIGSTOP 19
#define SIGTSTP 20
#define SIGTTIN 21
#define SIGTTOU 22
#define SIGURG 23
#define SIGXCPU 24
#define SIGXFSZ 25
#define SIGVTALRM 26
#define SIGPROF 27
#define SIGWINCH 28
#define SIGPOLL SIGIO
#define SIGIO 29
#define SIGPWR 30
#define SIGSYS 31
#define SIGUNUSED 31

#define _NSIG 65


#define SIGRTMIN (__libc_current_sigrtmin ())
#define SIGRTMAX (__libc_current_sigrtmax ())



#define __SIGRTMIN 32
#define __SIGRTMAX (_NSIG - 1)
# 58 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4
# 74 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4
#define __need_timespec=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/time.h" 1 3 4
# 66 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_clock_t
# 82 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_time_t
# 94 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __clockid_time_t
# 106 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timer_t
# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timespec
# 76 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/siginfo.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/siginfo.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 1 3 4
# 18 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 3 4
#define __WORDSIZE 32
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/siginfo.h" 2 3 4




#define __have_sigval_t 1


typedef union sigval
  {
    int sival_int;
    void *sival_ptr;
  } sigval_t;




#define __have_siginfo_t 1

#define __SI_MAX_SIZE 128



#define __SI_PAD_SIZE ((__SI_MAX_SIZE / sizeof (int)) - 3)


typedef struct
  {
    int si_signo;
    int si_errno;

    int si_code;

    union
      {
 int _pad[((128 / sizeof (int)) - 3)];


 struct
   {
     __pid_t si_pid;
     __uid_t si_uid;
   } _kill;


 struct
   {
     int si_tid;
     int si_overrun;
     sigval_t si_sigval;
   } _timer;


 struct
   {
     __pid_t si_pid;
     __uid_t si_uid;
     sigval_t si_sigval;
   } _rt;


 struct
   {
     __pid_t si_pid;
     __uid_t si_uid;
     int si_status;
     __clock_t si_utime;
     __clock_t si_stime;
   } _sigchld;


 struct
   {
     void *si_addr;
   } _sigfault;


 struct
   {
     long int si_band;
     int si_fd;
   } _sigpoll;


 struct
   {
     void *_call_addr;
     int _syscall;
     unsigned int _arch;
   } _sigsys;
      } _sifields;
  } siginfo_t;



#define si_pid _sifields._kill.si_pid
#define si_uid _sifields._kill.si_uid
#define si_timerid _sifields._timer.si_tid
#define si_overrun _sifields._timer.si_overrun
#define si_status _sifields._sigchld.si_status
#define si_utime _sifields._sigchld.si_utime
#define si_stime _sifields._sigchld.si_stime
#define si_value _sifields._rt.si_sigval
#define si_int _sifields._rt.si_sigval.sival_int
#define si_ptr _sifields._rt.si_sigval.sival_ptr
#define si_addr _sifields._sigfault.si_addr
#define si_band _sifields._sigpoll.si_band
#define si_fd _sifields._sigpoll.si_fd
#define si_call_addr _sifields._sigsys._call_addr
#define si_syscall _sifields._sigsys._syscall
#define si_arch _sifields._sigsys._arch




enum
{
  SI_ASYNCNL =3D -60,
#define SI_ASYNCNL SI_ASYNCNL
  SI_TKILL =3D -6,
#define SI_TKILL SI_TKILL
  SI_SIGIO,
#define SI_SIGIO SI_SIGIO
  SI_ASYNCIO,
#define SI_ASYNCIO SI_ASYNCIO
  SI_MESGQ,
#define SI_MESGQ SI_MESGQ
  SI_TIMER,
#define SI_TIMER SI_TIMER
  SI_QUEUE,
#define SI_QUEUE SI_QUEUE
  SI_USER,
#define SI_USER SI_USER
  SI_KERNEL =3D 0x80
#define SI_KERNEL SI_KERNEL
};



enum
{
  ILL_ILLOPC =3D 1,
#define ILL_ILLOPC ILL_ILLOPC
  ILL_ILLOPN,
#define ILL_ILLOPN ILL_ILLOPN
  ILL_ILLADR,
#define ILL_ILLADR ILL_ILLADR
  ILL_ILLTRP,
#define ILL_ILLTRP ILL_ILLTRP
  ILL_PRVOPC,
#define ILL_PRVOPC ILL_PRVOPC
  ILL_PRVREG,
#define ILL_PRVREG ILL_PRVREG
  ILL_COPROC,
#define ILL_COPROC ILL_COPROC
  ILL_BADSTK
#define ILL_BADSTK ILL_BADSTK
};


enum
{
  FPE_INTDIV =3D 1,
#define FPE_INTDIV FPE_INTDIV
  FPE_INTOVF,
#define FPE_INTOVF FPE_INTOVF
  FPE_FLTDIV,
#define FPE_FLTDIV FPE_FLTDIV
  FPE_FLTOVF,
#define FPE_FLTOVF FPE_FLTOVF
  FPE_FLTUND,
#define FPE_FLTUND FPE_FLTUND
  FPE_FLTRES,
#define FPE_FLTRES FPE_FLTRES
  FPE_FLTINV,
#define FPE_FLTINV FPE_FLTINV
  FPE_FLTSUB
#define FPE_FLTSUB FPE_FLTSUB
};


enum
{
  SEGV_MAPERR =3D 1,
#define SEGV_MAPERR SEGV_MAPERR
  SEGV_ACCERR
#define SEGV_ACCERR SEGV_ACCERR
};


enum
{
  BUS_ADRALN =3D 1,
#define BUS_ADRALN BUS_ADRALN
  BUS_ADRERR,
#define BUS_ADRERR BUS_ADRERR
  BUS_OBJERR
#define BUS_OBJERR BUS_OBJERR
};


enum
{
  TRAP_BRKPT =3D 1,
#define TRAP_BRKPT TRAP_BRKPT
  TRAP_TRACE
#define TRAP_TRACE TRAP_TRACE
};


enum
{
  CLD_EXITED =3D 1,
#define CLD_EXITED CLD_EXITED
  CLD_KILLED,
#define CLD_KILLED CLD_KILLED
  CLD_DUMPED,
#define CLD_DUMPED CLD_DUMPED
  CLD_TRAPPED,
#define CLD_TRAPPED CLD_TRAPPED
  CLD_STOPPED,
#define CLD_STOPPED CLD_STOPPED
  CLD_CONTINUED
#define CLD_CONTINUED CLD_CONTINUED
};


enum
{
  POLL_IN =3D 1,
#define POLL_IN POLL_IN
  POLL_OUT,
#define POLL_OUT POLL_OUT
  POLL_MSG,
#define POLL_MSG POLL_MSG
  POLL_ERR,
#define POLL_ERR POLL_ERR
  POLL_PRI,
#define POLL_PRI POLL_PRI
  POLL_HUP
#define POLL_HUP POLL_HUP
};

#undef __need_siginfo_t





#define __have_sigevent_t 1


#define __SIGEV_MAX_SIZE 64



#define __SIGEV_PAD_SIZE ((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
# 289 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/siginfo.h" 3 4
typedef struct sigevent
  {
    sigval_t sigev_value;
    int sigev_signo;
    int sigev_notify;

    union
      {
 int _pad[((64 / sizeof (int)) - 3)];



 __pid_t _tid;

 struct
   {
     void (*_function) (sigval_t);
     pthread_attr_t *_attribute;
   } _sigev_thread;
      } _sigev_un;
  } sigevent_t;


#define sigev_notify_function _sigev_un._sigev_thread._function
#define sigev_notify_attributes _sigev_un._sigev_thread._attribute


enum
{
  SIGEV_SIGNAL =3D 0,
#define SIGEV_SIGNAL SIGEV_SIGNAL
  SIGEV_NONE,
#define SIGEV_NONE SIGEV_NONE
  SIGEV_THREAD,
#define SIGEV_THREAD SIGEV_THREAD

  SIGEV_THREAD_ID =3D 4
#define SIGEV_THREAD_ID SIGEV_THREAD_ID
};
# 81 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4




typedef void (*__sighandler_t) (int);




extern __sighandler_t __sysv_signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ , __leaf__));
# 100 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4


extern __sighandler_t signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ , __leaf__));
# 114 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4

# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4
extern int kill (__pid_t __pid, int __sig) __attribute__ ((__nothrow__ , __=
leaf__));






extern int killpg (__pid_t __pgrp, int __sig) __attribute__ ((__nothrow__ ,=
 __leaf__));




extern int raise (int __sig) __attribute__ ((__nothrow__ , __leaf__));




extern __sighandler_t ssignal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ , __leaf__));
extern int gsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));




extern void psignal (int __sig, const char *__s);




extern void psiginfo (const siginfo_t *__pinfo, const char *__s);
# 169 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4
extern int __sigpause (int __sig_or_mask, int __is_sig);
# 194 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4
#define sigmask(sig) __sigmask(sig)


extern int sigblock (int __mask) __attribute__ ((__nothrow__ , __leaf__)) _=
_attribute__ ((__deprecated__));


extern int sigsetmask (int __mask) __attribute__ ((__nothrow__ , __leaf__))=
 __attribute__ ((__deprecated__));


extern int siggetmask (void) __attribute__ ((__nothrow__ , __leaf__)) __att=
ribute__ ((__deprecated__));




#define NSIG _NSIG
# 217 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4
typedef __sighandler_t sig_t;





extern int sigemptyset (sigset_t *__set) __attribute__ ((__nothrow__ , __le=
af__)) __attribute__ ((__nonnull__ (1)));


extern int sigfillset (sigset_t *__set) __attribute__ ((__nothrow__ , __lea=
f__)) __attribute__ ((__nonnull__ (1)));


extern int sigaddset (sigset_t *__set, int __signo) __attribute__ ((__nothr=
ow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int sigdelset (sigset_t *__set, int __signo) __attribute__ ((__nothr=
ow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int sigismember (const sigset_t *__set, int __signo)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));
# 253 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/sigaction.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigaction.h" 3 4
struct sigaction
  {


    union
      {

 __sighandler_t sa_handler;

 void (*sa_sigaction) (int, siginfo_t *, void *);
      }
    __sigaction_handler;
#define sa_handler __sigaction_handler.sa_handler
#define sa_sigaction __sigaction_handler.sa_sigaction





    __sigset_t sa_mask;


    int sa_flags;


    void (*sa_restorer) (void);
  };


#define SA_NOCLDSTOP 1
#define SA_NOCLDWAIT 2
#define SA_SIGINFO 4


#define SA_ONSTACK 0x08000000


#define SA_RESTART 0x10000000
#define SA_NODEFER 0x40000000

#define SA_RESETHAND 0x80000000


#define SA_INTERRUPT 0x20000000


#define SA_NOMASK SA_NODEFER
#define SA_ONESHOT SA_RESETHAND
#define SA_STACK SA_ONSTACK



#define SIG_BLOCK 0
#define SIG_UNBLOCK 1
#define SIG_SETMASK 2
# 254 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4


extern int sigprocmask (int __how, const sigset_t *__restrict __set,
   sigset_t *__restrict __oset) __attribute__ ((__nothrow__ , __leaf__));






extern int sigsuspend (const sigset_t *__set) __attribute__ ((__nonnull__ (=
1)));


extern int sigaction (int __sig, const struct sigaction *__restrict __act,
        struct sigaction *__restrict __oact) __attribute__ ((__nothrow__ , =
__leaf__));


extern int sigpending (sigset_t *__set) __attribute__ ((__nothrow__ , __lea=
f__)) __attribute__ ((__nonnull__ (1)));






extern int sigwait (const sigset_t *__restrict __set, int *__restrict __sig=
)
     __attribute__ ((__nonnull__ (1, 2)));






extern int sigwaitinfo (const sigset_t *__restrict __set,
   siginfo_t *__restrict __info) __attribute__ ((__nonnull__ (1)));






extern int sigtimedwait (const sigset_t *__restrict __set,
    siginfo_t *__restrict __info,
    const struct timespec *__restrict __timeout)
     __attribute__ ((__nonnull__ (1)));



extern int sigqueue (__pid_t __pid, int __sig, const union sigval __val)
     __attribute__ ((__nothrow__ , __leaf__));
# 311 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4
extern const char *const _sys_siglist[65];
extern const char *const sys_siglist[65];


struct sigvec
  {
    __sighandler_t sv_handler;
    int sv_mask;

    int sv_flags;
#define sv_onstack sv_flags
  };


#define SV_ONSTACK (1 << 0)
#define SV_INTERRUPT (1 << 1)
#define SV_RESETHAND (1 << 2)







extern int sigvec (int __sig, const struct sigvec *__vec,
     struct sigvec *__ovec) __attribute__ ((__nothrow__ , __leaf__));



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/sigcontext.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigcontext.h" 3 4
#define sigcontext_struct sigcontext

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/sigcontext.h" 1 3 4

#define _ASMARM_SIGCONTEXT_H=20






struct sigcontext {
 unsigned long trap_no;
 unsigned long error_code;
 unsigned long oldmask;
 unsigned long arm_r0;
 unsigned long arm_r1;
 unsigned long arm_r2;
 unsigned long arm_r3;
 unsigned long arm_r4;
 unsigned long arm_r5;
 unsigned long arm_r6;
 unsigned long arm_r7;
 unsigned long arm_r8;
 unsigned long arm_r9;
 unsigned long arm_r10;
 unsigned long arm_fp;
 unsigned long arm_ip;
 unsigned long arm_sp;
 unsigned long arm_lr;
 unsigned long arm_pc;
 unsigned long arm_cpsr;
 unsigned long fault_address;
};
# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigcontext.h" 2 3 4


#define __need_NULL=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 32 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigcontext.h" 2 3 4
# 341 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4


extern int sigreturn (struct sigcontext *__scp) __attribute__ ((__nothrow__=
 , __leaf__));





#define __need_size_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 351 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4




extern int siginterrupt (int __sig, int __interrupt) __attribute__ ((__noth=
row__ , __leaf__));

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/sigstack.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigstack.h" 3 4
struct sigstack
  {
    void *ss_sp;
    int ss_onstack;
  };



enum
{
  SS_ONSTACK =3D 1,
#define SS_ONSTACK SS_ONSTACK
  SS_DISABLE
#define SS_DISABLE SS_DISABLE
};


#define MINSIGSTKSZ 2048


#define SIGSTKSZ 8192



typedef struct sigaltstack
  {
    void *ss_sp;
    int ss_flags;
    size_t ss_size;
  } stack_t;
# 358 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/ucontext.h" 1 3 4
# 21 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/ucontext.h" 3 4
#define _SYS_UCONTEXT_H 1


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/ucontext.h" 2 3 4



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/sigcontext.h" 1 3 4
# 29 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/ucontext.h" 2 3 4

typedef int greg_t;


#define NGREG 18


typedef greg_t gregset_t[18];


enum
{
  REG_R0 =3D 0,
#define REG_R0 REG_R0
  REG_R1 =3D 1,
#define REG_R1 REG_R1
  REG_R2 =3D 2,
#define REG_R2 REG_R2
  REG_R3 =3D 3,
#define REG_R3 REG_R3
  REG_R4 =3D 4,
#define REG_R4 REG_R4
  REG_R5 =3D 5,
#define REG_R5 REG_R5
  REG_R6 =3D 6,
#define REG_R6 REG_R6
  REG_R7 =3D 7,
#define REG_R7 REG_R7
  REG_R8 =3D 8,
#define REG_R8 REG_R8
  REG_R9 =3D 9,
#define REG_R9 REG_R9
  REG_R10 =3D 10,
#define REG_R10 REG_R10
  REG_R11 =3D 11,
#define REG_R11 REG_R11
  REG_R12 =3D 12,
#define REG_R12 REG_R12
  REG_R13 =3D 13,
#define REG_R13 REG_R13
  REG_R14 =3D 14,
#define REG_R14 REG_R14
  REG_R15 =3D 15
#define REG_R15 REG_R15
};

struct _libc_fpstate
{
  struct
  {
    unsigned int sign1:1;
    unsigned int unused:15;
    unsigned int sign2:1;
    unsigned int exponent:14;
    unsigned int j:1;
    unsigned int mantissa1:31;
    unsigned int mantissa0:32;
  } fpregs[8];
  unsigned int fpsr:32;
  unsigned int fpcr:32;
  unsigned char ftype[8];
  unsigned int init_flag;
};

typedef struct _libc_fpstate fpregset_t;





typedef struct sigcontext mcontext_t;


typedef struct ucontext
  {
    unsigned long uc_flags;
    struct ucontext *uc_link;
    stack_t uc_stack;
    mcontext_t uc_mcontext;
    __sigset_t uc_sigmask;
    unsigned long uc_regspace[128] __attribute__((__aligned__(8)));
  } ucontext_t;
# 361 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4





extern int sigstack (struct sigstack *__ss, struct sigstack *__oss)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated_=
_));



extern int sigaltstack (const struct sigaltstack *__restrict __ss,
   struct sigaltstack *__restrict __oss) __attribute__ ((__nothrow__ , __le=
af__));
# 396 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/sigthread.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigthread.h" 3 4
#define _BITS_SIGTHREAD_H 1
# 30 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sigthread.h" 3 4
extern int pthread_sigmask (int __how,
       const __sigset_t *__restrict __newmask,
       __sigset_t *__restrict __oldmask)__attribute__ ((__nothrow__ , __lea=
f__));


extern int pthread_kill (pthread_t __threadid, int __signo) __attribute__ (=
(__nothrow__ , __leaf__));
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/signal.h" 2 3 4






extern int __libc_current_sigrtmin (void) __attribute__ ((__nothrow__ , __l=
eaf__));

extern int __libc_current_sigrtmax (void) __attribute__ ((__nothrow__ , __l=
eaf__));




# 29 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/param.h" 2 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/param.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/param.h" 3 4
#define __undef_ARG_MAX=20



# 1 "../../include/linux/param.h" 1 3 4

#define _LINUX_PARAM_H=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/param.h" 1 3 4
# 1 "../../include/asm-generic/param.h" 1 3 4

#define __ASM_GENERIC_PARAM_H=20
# 11 "../../include/asm-generic/param.h" 3 4
#define HZ 100



#define EXEC_PAGESIZE 4096



#define NOGROUP (-1)


#define MAXHOSTNAMELEN 64
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/param.h" 2 3 4
# 5 "../../include/linux/param.h" 2 3 4
# 29 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/param.h" 2 3 4



#undef ARG_MAX
#undef __undef_ARG_MAX


#define MAXSYMLINKS 20




#define NOFILE 256
#define NCARGS 131072
# 32 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/param.h" 2 3 4




#define NBBY CHAR_BIT


#define NGROUPS NGROUPS_MAX





#define CANBSIZ MAX_CANON


#define MAXPATHLEN PATH_MAX
# 69 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/param.h" 3 4
#define NODEV ((dev_t) -1)




#define DEV_BSIZE 512



#define setbit(a,i) ((a)[(i)/NBBY] |=3D 1<<((i)%NBBY))
#define clrbit(a,i) ((a)[(i)/NBBY] &=3D ~(1<<((i)%NBBY)))
#define isset(a,i) ((a)[(i)/NBBY] & (1<<((i)%NBBY)))
#define isclr(a,i) (((a)[(i)/NBBY] & (1<<((i)%NBBY))) =3D=3D 0)



#define howmany(x,y) (((x) + ((y) - 1)) / (y))


#define roundup(x,y) (__builtin_constant_p (y) && powerof2 (y) ? (((x) + (y=
) - 1) & ~((y) - 1)) : ((((x) + ((y) - 1)) / (y)) * (y)))





#define powerof2(x) ((((x) - 1) & (x)) =3D=3D 0)


#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))
# 60 "util/util.h" 2

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
#define _DIRENT_H 1




# 62 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/dirent.h" 1 3 4
# 22 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/dirent.h" 3 4
struct dirent
  {




    __ino64_t d_ino;
    __off64_t d_off;

    unsigned short int d_reclen;
    unsigned char d_type;
    char d_name[256];
  };


struct dirent64
  {
    __ino64_t d_ino;
    __off64_t d_off;
    unsigned short int d_reclen;
    unsigned char d_type;
    char d_name[256];
  };


#define d_fileno d_ino

#undef _DIRENT_HAVE_D_NAMLEN
#define _DIRENT_HAVE_D_RECLEN=20
#define _DIRENT_HAVE_D_OFF=20
#define _DIRENT_HAVE_D_TYPE=20
# 63 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 2 3 4
# 86 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
#define _D_EXACT_NAMLEN(d) (strlen ((d)->d_name))

#define _D_ALLOC_NAMLEN(d) (((char *) (d) + (d)->d_reclen) - &(d)->d_name[0=
])
# 98 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
enum
  {
    DT_UNKNOWN =3D 0,
#define DT_UNKNOWN DT_UNKNOWN
    DT_FIFO =3D 1,
#define DT_FIFO DT_FIFO
    DT_CHR =3D 2,
#define DT_CHR DT_CHR
    DT_DIR =3D 4,
#define DT_DIR DT_DIR
    DT_BLK =3D 6,
#define DT_BLK DT_BLK
    DT_REG =3D 8,
#define DT_REG DT_REG
    DT_LNK =3D 10,
#define DT_LNK DT_LNK
    DT_SOCK =3D 12,
#define DT_SOCK DT_SOCK
    DT_WHT =3D 14
#define DT_WHT DT_WHT
  };


#define IFTODT(mode) (((mode) & 0170000) >> 12)
#define DTTOIF(dirtype) ((dirtype) << 12)





typedef struct __dirstream DIR;






extern DIR *opendir (const char *__name) __attribute__ ((__nonnull__ (1)));






extern DIR *fdopendir (int __fd);







extern int closedir (DIR *__dirp) __attribute__ ((__nonnull__ (1)));
# 166 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
extern struct dirent *readdir (DIR *__dirp) __asm__ ("" "readdir64")
     __attribute__ ((__nonnull__ (1)));






extern struct dirent64 *readdir64 (DIR *__dirp) __attribute__ ((__nonnull__=
 (1)));
# 190 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
extern int readdir_r (DIR *__restrict __dirp, struct dirent *__restrict __e=
ntry, struct dirent **__restrict __result) __asm__ ("" "readdir64_r")



                      __attribute__ ((__nonnull__ (1, 2, 3)));






extern int readdir64_r (DIR *__restrict __dirp,
   struct dirent64 *__restrict __entry,
   struct dirent64 **__restrict __result)
     __attribute__ ((__nonnull__ (1, 2, 3)));




extern void rewinddir (DIR *__dirp) __attribute__ ((__nothrow__ , __leaf__)=
) __attribute__ ((__nonnull__ (1)));





extern void seekdir (DIR *__dirp, long int __pos) __attribute__ ((__nothrow=
__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int telldir (DIR *__dirp) __attribute__ ((__nothrow__ , __leaf_=
_)) __attribute__ ((__nonnull__ (1)));





extern int dirfd (DIR *__dirp) __attribute__ ((__nothrow__ , __leaf__)) __a=
ttribute__ ((__nonnull__ (1)));
# 237 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
#define MAXNAMLEN NAME_MAX






#define __need_size_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 246 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 2 3 4
# 263 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
extern int scandir (const char *__restrict __dir, struct dirent ***__restri=
ct __namelist, int (*__selector) (const struct dirent *), int (*__cmp) (con=
st struct dirent **, const struct dirent **)) __asm__ ("" "scandir64")





                    __attribute__ ((__nonnull__ (1, 2)));
# 330 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
extern int alphasort (const struct dirent **__e1, const struct dirent **__e=
2) __asm__ ("" "alphasort64") __attribute__ ((__nothrow__ , __leaf__))


                   __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (=
1, 2)));
# 359 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4
extern __ssize_t getdirentries (int __fd, char *__restrict __buf, size_t __=
nbytes, __off64_t *__restrict __basep) __asm__ ("" "getdirentries64") __att=
ribute__ ((__nothrow__ , __leaf__))



                      __attribute__ ((__nonnull__ (2, 4)));






extern __ssize_t getdirentries64 (int __fd, char *__restrict __buf,
      size_t __nbytes,
      __off64_t *__restrict __basep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
2, 4)));
# 402 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/dirent.h" 3 4

# 62 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 3 4
#define _SYS_TIME_H 1




#define __need_time_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/time.h" 1 3 4
# 66 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_clock_t
# 82 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_time_t
# 94 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __clockid_time_t
# 106 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timer_t
# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timespec
# 27 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 2 3 4
#define __need_timeval=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 1 3 4
# 99 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 3 4
#undef __need_timeval
# 29 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 2 3 4
# 38 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 3 4

# 56 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 3 4
struct timezone
  {
    int tz_minuteswest;
    int tz_dsttime;
  };

typedef struct timezone *__restrict __timezone_ptr_t;
# 72 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 3 4
extern int gettimeofday (struct timeval *__restrict __tv,
    __timezone_ptr_t __tz) __attribute__ ((__nothrow__ , __leaf__)) __attri=
bute__ ((__nonnull__ (1)));




extern int settimeofday (const struct timeval *__tv,
    const struct timezone *__tz)
     __attribute__ ((__nothrow__ , __leaf__));





extern int adjtime (const struct timeval *__delta,
      struct timeval *__olddelta) __attribute__ ((__nothrow__ , __leaf__));




enum __itimer_which
  {

    ITIMER_REAL =3D 0,
#define ITIMER_REAL ITIMER_REAL

    ITIMER_VIRTUAL =3D 1,
#define ITIMER_VIRTUAL ITIMER_VIRTUAL


    ITIMER_PROF =3D 2
#define ITIMER_PROF ITIMER_PROF
  };



struct itimerval
  {

    struct timeval it_interval;

    struct timeval it_value;
  };






typedef int __itimer_which_t;




extern int getitimer (__itimer_which_t __which,
        struct itimerval *__value) __attribute__ ((__nothrow__ , __leaf__))=
;




extern int setitimer (__itimer_which_t __which,
        const struct itimerval *__restrict __new,
        struct itimerval *__restrict __old) __attribute__ ((__nothrow__ , _=
_leaf__));




extern int utimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));



extern int lutimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));


extern int futimes (int __fd, const struct timeval __tvp[2]) __attribute__ =
((__nothrow__ , __leaf__));
# 163 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 3 4
#define timerisset(tvp) ((tvp)->tv_sec || (tvp)->tv_usec)
#define timerclear(tvp) ((tvp)->tv_sec =3D (tvp)->tv_usec =3D 0)
#define timercmp(a,b,CMP) (((a)->tv_sec =3D=3D (b)->tv_sec) ? ((a)->tv_usec=
 CMP (b)->tv_usec) : ((a)->tv_sec CMP (b)->tv_sec))



#define timeradd(a,b,result) do { (result)->tv_sec =3D (a)->tv_sec + (b)->t=
v_sec; (result)->tv_usec =3D (a)->tv_usec + (b)->tv_usec; if ((result)->tv_=
usec >=3D 1000000) { ++(result)->tv_sec; (result)->tv_usec -=3D 1000000; } =
} while (0)
# 179 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 3 4
#define timersub(a,b,result) do { (result)->tv_sec =3D (a)->tv_sec - (b)->t=
v_sec; (result)->tv_usec =3D (a)->tv_usec - (b)->tv_usec; if ((result)->tv_=
usec < 0) { --(result)->tv_sec; (result)->tv_usec +=3D 1000000; } } while (=
0)
# 190 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/time.h" 3 4

# 63 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/time.h" 1 3 4
# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#define _TIME_H 1








#define __need_size_t=20
#define __need_NULL=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 38 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 2 3 4



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 1 3 4
# 40 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 3 4
#define _BITS_TIME_H 1







#define CLOCKS_PER_SEC 1000000l
# 61 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 3 4
#define CLOCK_REALTIME 0

#define CLOCK_MONOTONIC 1

#define CLOCK_PROCESS_CPUTIME_ID 2

#define CLOCK_THREAD_CPUTIME_ID 3

#define CLOCK_MONOTONIC_RAW 4

#define CLOCK_REALTIME_COARSE 5

#define CLOCK_MONOTONIC_COARSE 6

#define CLOCK_BOOTTIME 7

#define CLOCK_REALTIME_ALARM 8

#define CLOCK_BOOTTIME_ALARM 9


#define TIMER_ABSTIME 1
# 99 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 3 4
#undef __need_timeval
# 42 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 2 3 4
# 66 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_clock_t
# 82 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_time_t
# 94 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __clockid_time_t
# 106 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timer_t
# 127 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
#undef __need_timespec





struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  const char *tm_zone;




};








struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };


struct sigevent;
# 186 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4



extern clock_t clock (void) __attribute__ ((__nothrow__ , __leaf__));


extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ , __leaf__=
));


extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf=
__));





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__=
));

# 223 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     __locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));
# 236 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4



extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow_=
_ , __leaf__));



extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothr=
ow__ , __leaf__));





extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__))=
;



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf_=
_));





extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ , =
__leaf__));


extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ , __=
leaf__));







extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__ , __leaf__));



extern int daylight;
extern long int timezone;





extern int stime (const time_t *__when) __attribute__ ((__nothrow__ , __lea=
f__));





#define __isleap(year) ((year) % 4 =3D=3D 0 && ((year) % 100 !=3D 0 || (yea=
r) % 400 =3D=3D 0))
# 319 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf=
__));


extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ , __l=
eaf__));


extern int dysize (int __year) __attribute__ ((__nothrow__ , __leaf__)) __a=
ttribute__ ((__const__));
# 334 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __at=
tribute__ ((__nothrow__ , __leaf__));


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __at=
tribute__ ((__nothrow__ , __leaf__));


extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp=
)
     __attribute__ ((__nothrow__ , __leaf__));






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attri=
bute__ ((__nothrow__ , __leaf__));




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__ , __leaf__))=
;


extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ , _=
_leaf__));


extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ , =
__leaf__));


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__ , __leaf__));


extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__=
 , __leaf__));
# 430 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/time.h" 3 4

# 64 "util/util.h" 2

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/fnmatch.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/fnmatch.h" 3 4
#define _FNMATCH_H 1







#undef FNM_PATHNAME
#undef FNM_NOESCAPE
#undef FNM_PERIOD


#define FNM_PATHNAME (1 << 0)
#define FNM_NOESCAPE (1 << 1)
#define FNM_PERIOD (1 << 2)


#define FNM_FILE_NAME FNM_PATHNAME
#define FNM_LEADING_DIR (1 << 3)
#define FNM_CASEFOLD (1 << 4)
#define FNM_EXTMATCH (1 << 5)



#define FNM_NOMATCH 1
# 57 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/fnmatch.h" 3 4
extern int fnmatch (const char *__pattern, const char *__name, int __flags)=
;
# 66 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/assert.h" 1 3 4
# 35 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/assert.h" 3 4
#define _ASSERT_H 1





#define __ASSERT_VOID_CAST (void)
# 65 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/assert.h" 3 4



extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__)=
);


extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__)=
);




extern void __assert (const char *__assertion, const char *__file, int __li=
ne)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__)=
);




#define assert(expr) ((expr) ? __ASSERT_VOID_CAST (0) : __assert_fail (__ST=
RING(expr), __FILE__, __LINE__, __ASSERT_FUNCTION))
# 104 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/assert.h" 3 4
#define __ASSERT_FUNCTION __PRETTY_FUNCTION__
# 67 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 1 3 4
# 22 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
#define _REGEX_H 1


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/gnu/option-groups.h" 1 3 4
# 11 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/gnu/option-groups.h" 3 4
#define __GNU_OPTION_GROUPS_H=20

#define __OPTION_EGLIBC_ADVANCED_INET6 1
#define __OPTION_EGLIBC_BACKTRACE 1
#define __OPTION_EGLIBC_BIG_MACROS 1
#define __OPTION_EGLIBC_BSD 1
#define __OPTION_EGLIBC_CATGETS 1
#define __OPTION_EGLIBC_CHARSETS 1
#define __OPTION_EGLIBC_CRYPT 1
#define __OPTION_EGLIBC_CRYPT_UFC 1
#define __OPTION_EGLIBC_CXX_TESTS 1
#define __OPTION_EGLIBC_DB_ALIASES 1
#define __OPTION_EGLIBC_ENVZ 1
#define __OPTION_EGLIBC_FCVT 1
#define __OPTION_EGLIBC_FMTMSG 1
#define __OPTION_EGLIBC_FSTAB 1
#define __OPTION_EGLIBC_FTRAVERSE 1
#define __OPTION_EGLIBC_GETLOGIN 1
#define __OPTION_EGLIBC_IDN 1
#define __OPTION_EGLIBC_INET 1
#define __OPTION_EGLIBC_INET_ANL 1
#define __OPTION_EGLIBC_LIBM 1
#define __OPTION_EGLIBC_LIBM_BIG 1
#define __OPTION_EGLIBC_LOCALES 1
#define __OPTION_EGLIBC_LOCALE_CODE 1
#define __OPTION_EGLIBC_MEMUSAGE 1
#define __OPTION_EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE 32768
#define __OPTION_EGLIBC_NIS 1
#define __OPTION_EGLIBC_NSSWITCH 1
#define __OPTION_EGLIBC_RCMD 1
#define __OPTION_EGLIBC_RTLD_DEBUG 1
#define __OPTION_EGLIBC_SPAWN 1
#define __OPTION_EGLIBC_STREAMS 1
#define __OPTION_EGLIBC_SUNRPC 1
#define __OPTION_EGLIBC_UTMP 1
#define __OPTION_EGLIBC_UTMPX 1
#define __OPTION_EGLIBC_WORDEXP 1
#define __OPTION_POSIX_C_LANG_WIDE_CHAR 1
#define __OPTION_POSIX_REGEXP 1
#define __OPTION_POSIX_REGEXP_GLIBC 1
#define __OPTION_POSIX_WIDE_CHAR_DEVICE_IO 1
# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 2 3 4
# 36 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
typedef long int s_reg_t;
typedef unsigned long int active_reg_t;






typedef unsigned long int reg_syntax_t;
# 186 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
extern reg_syntax_t re_syntax_options;
# 283 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
#define REG_EXTENDED 1



#define REG_ICASE (REG_EXTENDED << 1)




#define REG_NEWLINE (REG_ICASE << 1)



#define REG_NOSUB (REG_NEWLINE << 1)
# 306 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
#define REG_NOTBOL 1


#define REG_NOTEOL (1 << 1)




#define REG_STARTEND (1 << 2)





typedef enum
{

  REG_ENOSYS =3D -1,


  REG_NOERROR =3D 0,
  REG_NOMATCH,



  REG_BADPAT,
  REG_ECOLLATE,
  REG_ECTYPE,
  REG_EESCAPE,
  REG_ESUBREG,
  REG_EBRACK,
  REG_EPAREN,
  REG_EBRACE,
  REG_BADBR,
  REG_ERANGE,
  REG_ESPACE,
  REG_BADRPT,


  REG_EEND,
  REG_ESIZE,
  REG_ERPAREN
} reg_errcode_t;
# 357 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
#define __RE_TRANSLATE_TYPE unsigned char *
# 366 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
#define __REPB_PREFIX(name) __ ##name


struct re_pattern_buffer
{



  unsigned char *__buffer;


  unsigned long int __allocated;


  unsigned long int __used;


  reg_syntax_t __syntax;




  char *__fastmap;





  unsigned char * __translate;


  size_t re_nsub;





  unsigned __can_be_null : 1;
# 414 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
  unsigned __regs_allocated : 2;



  unsigned __fastmap_accurate : 1;



  unsigned __no_sub : 1;



  unsigned __not_bol : 1;


  unsigned __not_eol : 1;


  unsigned __newline_anchor : 1;
};

typedef struct re_pattern_buffer regex_t;


typedef int regoff_t;
# 464 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
typedef struct
{
  regoff_t rm_so;
  regoff_t rm_eo;
} regmatch_t;
# 574 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/regex.h" 3 4
extern int regcomp (regex_t *__restrict __preg,
      const char *__restrict __pattern,
      int __cflags);

extern int regexec (const regex_t *__restrict __preg,
      const char *__restrict __string, size_t __nmatch,
      regmatch_t __pmatch[__restrict],
      int __eflags);

extern size_t regerror (int __errcode, const regex_t *__restrict __preg,
   char *__restrict __errbuf, size_t __errbuf_size);

extern void regfree (regex_t *__preg);
# 68 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/utime.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/utime.h" 3 4
#define _UTIME_H 1








#define __need_time_t=20




struct utimbuf
  {
    __time_t actime;
    __time_t modtime;
  };



extern int utime (const char *__file,
    const struct utimbuf *__file_times)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (=
1)));


# 69 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/wait.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/wait.h" 3 4
#define _SYS_WAIT_H 1






# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/resource.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/resource.h" 3 4
#define _SYS_RESOURCE_H 1




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/resource.h" 1 3 4
# 31 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/resource.h" 3 4
enum __rlimit_resource
{

  RLIMIT_CPU =3D 0,
#define RLIMIT_CPU RLIMIT_CPU


  RLIMIT_FSIZE =3D 1,
#define RLIMIT_FSIZE RLIMIT_FSIZE


  RLIMIT_DATA =3D 2,
#define RLIMIT_DATA RLIMIT_DATA


  RLIMIT_STACK =3D 3,
#define RLIMIT_STACK RLIMIT_STACK


  RLIMIT_CORE =3D 4,
#define RLIMIT_CORE RLIMIT_CORE





  __RLIMIT_RSS =3D 5,
#define RLIMIT_RSS __RLIMIT_RSS


  RLIMIT_NOFILE =3D 7,
  __RLIMIT_OFILE =3D RLIMIT_NOFILE,
#define RLIMIT_NOFILE RLIMIT_NOFILE
#define RLIMIT_OFILE __RLIMIT_OFILE


  RLIMIT_AS =3D 9,
#define RLIMIT_AS RLIMIT_AS


  __RLIMIT_NPROC =3D 6,
#define RLIMIT_NPROC __RLIMIT_NPROC


  __RLIMIT_MEMLOCK =3D 8,
#define RLIMIT_MEMLOCK __RLIMIT_MEMLOCK


  __RLIMIT_LOCKS =3D 10,
#define RLIMIT_LOCKS __RLIMIT_LOCKS


  __RLIMIT_SIGPENDING =3D 11,
#define RLIMIT_SIGPENDING __RLIMIT_SIGPENDING


  __RLIMIT_MSGQUEUE =3D 12,
#define RLIMIT_MSGQUEUE __RLIMIT_MSGQUEUE




  __RLIMIT_NICE =3D 13,
#define RLIMIT_NICE __RLIMIT_NICE



  __RLIMIT_RTPRIO =3D 14,
#define RLIMIT_RTPRIO __RLIMIT_RTPRIO




  __RLIMIT_RTTIME =3D 15,
#define RLIMIT_RTTIME __RLIMIT_RTTIME

  __RLIMIT_NLIMITS =3D 16,
  __RLIM_NLIMITS =3D __RLIMIT_NLIMITS
#define RLIMIT_NLIMITS __RLIMIT_NLIMITS
#define RLIM_NLIMITS __RLIM_NLIMITS
};





#define RLIM_INFINITY 0xffffffffffffffffuLL



#define RLIM64_INFINITY 0xffffffffffffffffuLL



#define RLIM_SAVED_MAX RLIM_INFINITY
#define RLIM_SAVED_CUR RLIM_INFINITY






typedef __rlim64_t rlim_t;


typedef __rlim64_t rlim64_t;


struct rlimit
  {

    rlim_t rlim_cur;

    rlim_t rlim_max;
  };


struct rlimit64
  {

    rlim64_t rlim_cur;

    rlim64_t rlim_max;
 };



enum __rusage_who
{

  RUSAGE_SELF =3D 0,
#define RUSAGE_SELF RUSAGE_SELF


  RUSAGE_CHILDREN =3D -1
#define RUSAGE_CHILDREN RUSAGE_CHILDREN
# 176 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/resource.h" 3 4
};

#define __need_timeval=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 1 3 4
# 99 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/time.h" 3 4
#undef __need_timeval
# 180 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/resource.h" 2 3 4







struct rusage
  {

    struct timeval ru_utime;

    struct timeval ru_stime;

    __extension__ union
      {
 long int ru_maxrss;
 __syscall_slong_t __ru_maxrss_word;
      };



    __extension__ union
      {
 long int ru_ixrss;
 __syscall_slong_t __ru_ixrss_word;
      };

    __extension__ union
      {
 long int ru_idrss;
 __syscall_slong_t __ru_idrss_word;
      };

    __extension__ union
      {
 long int ru_isrss;
  __syscall_slong_t __ru_isrss_word;
      };


    __extension__ union
      {
 long int ru_minflt;
 __syscall_slong_t __ru_minflt_word;
      };

    __extension__ union
      {
 long int ru_majflt;
 __syscall_slong_t __ru_majflt_word;
      };

    __extension__ union
      {
 long int ru_nswap;
 __syscall_slong_t __ru_nswap_word;
      };


    __extension__ union
      {
 long int ru_inblock;
 __syscall_slong_t __ru_inblock_word;
      };

    __extension__ union
      {
 long int ru_oublock;
 __syscall_slong_t __ru_oublock_word;
      };

    __extension__ union
      {
 long int ru_msgsnd;
 __syscall_slong_t __ru_msgsnd_word;
      };

    __extension__ union
      {
 long int ru_msgrcv;
 __syscall_slong_t __ru_msgrcv_word;
      };

    __extension__ union
      {
 long int ru_nsignals;
 __syscall_slong_t __ru_nsignals_word;
      };



    __extension__ union
      {
 long int ru_nvcsw;
 __syscall_slong_t __ru_nvcsw_word;
      };


    __extension__ union
      {
 long int ru_nivcsw;
 __syscall_slong_t __ru_nivcsw_word;
      };
  };


#define PRIO_MIN -20
#define PRIO_MAX 20



enum __priority_which
{
  PRIO_PROCESS =3D 0,
#define PRIO_PROCESS PRIO_PROCESS
  PRIO_PGRP =3D 1,
#define PRIO_PGRP PRIO_PGRP
  PRIO_USER =3D 2
#define PRIO_USER PRIO_USER
};



# 328 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/resource.h" 3 4

# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/resource.h" 2 3 4







# 43 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/resource.h" 3 4
typedef int __rlimit_resource_t;
typedef int __rusage_who_t;
typedef int __priority_which_t;
# 55 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/resource.h" 3 4
extern int getrlimit (__rlimit_resource_t __resource, struct rlimit *__rlim=
its) __asm__ ("" "getrlimit64") __attribute__ ((__nothrow__ , __leaf__))
                                                  ;





extern int getrlimit64 (__rlimit_resource_t __resource,
   struct rlimit64 *__rlimits) __attribute__ ((__nothrow__ , __leaf__));
# 74 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/resource.h" 3 4
extern int setrlimit (__rlimit_resource_t __resource, const struct rlimit *=
__rlimits) __asm__ ("" "setrlimit64") __attribute__ ((__nothrow__ , __leaf_=
_))

                  ;





extern int setrlimit64 (__rlimit_resource_t __resource,
   const struct rlimit64 *__rlimits) __attribute__ ((__nothrow__ , __leaf__=
));




extern int getrusage (__rusage_who_t __who, struct rusage *__usage) __attri=
bute__ ((__nothrow__ , __leaf__));





extern int getpriority (__priority_which_t __which, id_t __who) __attribute=
__ ((__nothrow__ , __leaf__));



extern int setpriority (__priority_which_t __which, id_t __who, int __prio)
     __attribute__ ((__nothrow__ , __leaf__));


# 32 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/wait.h" 2 3 4
# 93 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/wait.h" 3 4
#define WCOREFLAG __WCOREFLAG
#define WCOREDUMP(status) __WCOREDUMP (__WAIT_INT (status))
#define W_EXITCODE(ret,sig) __W_EXITCODE (ret, sig)
#define W_STOPCODE(sig) __W_STOPCODE (sig)




typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 115 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/wait.h" 3 4
extern __pid_t wait (__WAIT_STATUS __stat_loc);



#define WAIT_ANY (-1)
#define WAIT_MYPGRP 0
# 138 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/wait.h" 3 4
extern __pid_t waitpid (__pid_t __pid, int *__stat_loc, int __options);
# 147 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/wait.h" 3 4
#define __need_siginfo_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/siginfo.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/siginfo.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 1 3 4
# 18 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 3 4
#define __WORDSIZE 32
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/siginfo.h" 2 3 4
# 149 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/wait.h" 2 3 4
# 161 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/wait.h" 3 4
extern int waitid (idtype_t __idtype, __id_t __id, siginfo_t *__infop,
     int __options);





struct rusage;






extern __pid_t wait3 (__WAIT_STATUS __stat_loc, int __options,
        struct rusage * __usage) __attribute__ ((__nothrow__));




extern __pid_t wait4 (__pid_t __pid, __WAIT_STATUS __stat_loc, int __option=
s,
        struct rusage *__usage) __attribute__ ((__nothrow__));




# 70 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/poll.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/poll.h" 3 4
#define _SYS_POLL_H 1




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/poll.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/poll.h" 3 4
#define POLLIN 0x001
#define POLLPRI 0x002
#define POLLOUT 0x004



#define POLLRDNORM 0x040
#define POLLRDBAND 0x080
#define POLLWRNORM 0x100
#define POLLWRBAND 0x200
# 47 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/poll.h" 3 4
#define POLLERR 0x008
#define POLLHUP 0x010
#define POLLNVAL 0x020
# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/poll.h" 2 3 4
# 36 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/poll.h" 3 4
typedef unsigned long int nfds_t;


struct pollfd
  {
    int fd;
    short int events;
    short int revents;
  };



# 57 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/poll.h" 3 4
extern int poll (struct pollfd *__fds, nfds_t __nfds, int __timeout);
# 71 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/poll.h" 3 4

# 71 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 1 3 4
# 21 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
#define _SYS_SOCKET_H 1





# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/uio.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/uio.h" 3 4
#define _SYS_UIO_H 1








# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/uio.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/uio.h" 3 4
#define _BITS_UIO_H 1
# 39 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/uio.h" 3 4
#define UIO_MAXIOV 1024



struct iovec
  {
    void *iov_base;
    size_t iov_len;
  };
# 30 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/uio.h" 2 3 4
# 40 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/uio.h" 3 4
extern ssize_t readv (int __fd, const struct iovec *__iovec, int __count)
  ;
# 51 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/uio.h" 3 4
extern ssize_t writev (int __fd, const struct iovec *__iovec, int __count)
  ;
# 82 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/uio.h" 3 4
extern ssize_t preadv (int __fd, const struct iovec *__iovec, int __count, =
__off64_t __offset) __asm__ ("" "preadv64")

                     ;
extern ssize_t pwritev (int __fd, const struct iovec *__iovec, int __count,=
 __off64_t __offset) __asm__ ("" "pwritev64")

                      ;
# 104 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/uio.h" 3 4
extern ssize_t preadv64 (int __fd, const struct iovec *__iovec, int __count=
,
    __off64_t __offset) ;
# 116 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/uio.h" 3 4
extern ssize_t pwritev64 (int __fd, const struct iovec *__iovec, int __coun=
t,
     __off64_t __offset) ;




# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 2 3 4
#define __need_size_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 30 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 2 3 4
# 39 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/socket.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/socket.h" 3 4
#define __BITS_SOCKET_H=20





#define __need_size_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/socket.h" 2 3 4
# 38 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/socket.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/socket_type.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/socket_type.h" 3 4
enum __socket_type
{
  SOCK_STREAM =3D 1,

#define SOCK_STREAM SOCK_STREAM
  SOCK_DGRAM =3D 2,

#define SOCK_DGRAM SOCK_DGRAM
  SOCK_RAW =3D 3,
#define SOCK_RAW SOCK_RAW
  SOCK_RDM =3D 4,
#define SOCK_RDM SOCK_RDM
  SOCK_SEQPACKET =3D 5,

#define SOCK_SEQPACKET SOCK_SEQPACKET
  SOCK_DCCP =3D 6,
#define SOCK_DCCP SOCK_DCCP
  SOCK_PACKET =3D 10,


#define SOCK_PACKET SOCK_PACKET




  SOCK_CLOEXEC =3D 02000000,

#define SOCK_CLOEXEC SOCK_CLOEXEC
  SOCK_NONBLOCK =3D 00004000

#define SOCK_NONBLOCK SOCK_NONBLOCK
};
# 39 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/socket.h" 2 3 4


#define PF_UNSPEC 0
#define PF_LOCAL 1
#define PF_UNIX PF_LOCAL
#define PF_FILE PF_LOCAL
#define PF_INET 2
#define PF_AX25 3
#define PF_IPX 4
#define PF_APPLETALK 5
#define PF_NETROM 6
#define PF_BRIDGE 7
#define PF_ATMPVC 8
#define PF_X25 9
#define PF_INET6 10
#define PF_ROSE 11
#define PF_DECnet 12
#define PF_NETBEUI 13
#define PF_SECURITY 14
#define PF_KEY 15
#define PF_NETLINK 16
#define PF_ROUTE PF_NETLINK
#define PF_PACKET 17
#define PF_ASH 18
#define PF_ECONET 19
#define PF_ATMSVC 20
#define PF_RDS 21
#define PF_SNA 22
#define PF_IRDA 23
#define PF_PPPOX 24
#define PF_WANPIPE 25
#define PF_LLC 26
#define PF_CAN 29
#define PF_TIPC 30
#define PF_BLUETOOTH 31
#define PF_IUCV 32
#define PF_RXRPC 33
#define PF_ISDN 34
#define PF_PHONET 35
#define PF_IEEE802154 36
#define PF_CAIF 37
#define PF_ALG 38
#define PF_NFC 39
#define PF_MAX 40


#define AF_UNSPEC PF_UNSPEC
#define AF_LOCAL PF_LOCAL
#define AF_UNIX PF_UNIX
#define AF_FILE PF_FILE
#define AF_INET PF_INET
#define AF_AX25 PF_AX25
#define AF_IPX PF_IPX
#define AF_APPLETALK PF_APPLETALK
#define AF_NETROM PF_NETROM
#define AF_BRIDGE PF_BRIDGE
#define AF_ATMPVC PF_ATMPVC
#define AF_X25 PF_X25
#define AF_INET6 PF_INET6
#define AF_ROSE PF_ROSE
#define AF_DECnet PF_DECnet
#define AF_NETBEUI PF_NETBEUI
#define AF_SECURITY PF_SECURITY
#define AF_KEY PF_KEY
#define AF_NETLINK PF_NETLINK
#define AF_ROUTE PF_ROUTE
#define AF_PACKET PF_PACKET
#define AF_ASH PF_ASH
#define AF_ECONET PF_ECONET
#define AF_ATMSVC PF_ATMSVC
#define AF_RDS PF_RDS
#define AF_SNA PF_SNA
#define AF_IRDA PF_IRDA
#define AF_PPPOX PF_PPPOX
#define AF_WANPIPE PF_WANPIPE
#define AF_LLC PF_LLC
#define AF_CAN PF_CAN
#define AF_TIPC PF_TIPC
#define AF_BLUETOOTH PF_BLUETOOTH
#define AF_IUCV PF_IUCV
#define AF_RXRPC PF_RXRPC
#define AF_ISDN PF_ISDN
#define AF_PHONET PF_PHONET
#define AF_IEEE802154 PF_IEEE802154
#define AF_CAIF PF_CAIF
#define AF_ALG PF_ALG
#define AF_NFC PF_NFC
#define AF_MAX PF_MAX





#define SOL_RAW 255
#define SOL_DECNET 261
#define SOL_X25 262
#define SOL_PACKET 263
#define SOL_ATM 264
#define SOL_AAL 265
#define SOL_IRDA 266


#define SOMAXCONN 128


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/sockaddr.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/sockaddr.h" 3 4
#define _BITS_SOCKADDR_H 1



typedef unsigned short int sa_family_t;





#define __SOCKADDR_COMMON(sa_prefix) sa_family_t sa_prefix ##family


#define __SOCKADDR_COMMON_SIZE (sizeof (unsigned short int))
# 145 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/socket.h" 2 3 4


struct sockaddr
  {
    sa_family_t sa_family;
    char sa_data[14];
  };




#define __ss_aligntype unsigned long int
#define _SS_SIZE 128
#define _SS_PADSIZE (_SS_SIZE - (2 * sizeof (__ss_aligntype)))

struct sockaddr_storage
  {
    sa_family_t ss_family;
    unsigned long int __ss_align;
    char __ss_padding[(128 - (2 * sizeof (unsigned long int)))];
  };



enum
  {
    MSG_OOB =3D 0x01,
#define MSG_OOB MSG_OOB
    MSG_PEEK =3D 0x02,
#define MSG_PEEK MSG_PEEK
    MSG_DONTROUTE =3D 0x04,
#define MSG_DONTROUTE MSG_DONTROUTE





    MSG_CTRUNC =3D 0x08,
#define MSG_CTRUNC MSG_CTRUNC
    MSG_PROXY =3D 0x10,
#define MSG_PROXY MSG_PROXY
    MSG_TRUNC =3D 0x20,
#define MSG_TRUNC MSG_TRUNC
    MSG_DONTWAIT =3D 0x40,
#define MSG_DONTWAIT MSG_DONTWAIT
    MSG_EOR =3D 0x80,
#define MSG_EOR MSG_EOR
    MSG_WAITALL =3D 0x100,
#define MSG_WAITALL MSG_WAITALL
    MSG_FIN =3D 0x200,
#define MSG_FIN MSG_FIN
    MSG_SYN =3D 0x400,
#define MSG_SYN MSG_SYN
    MSG_CONFIRM =3D 0x800,
#define MSG_CONFIRM MSG_CONFIRM
    MSG_RST =3D 0x1000,
#define MSG_RST MSG_RST
    MSG_ERRQUEUE =3D 0x2000,
#define MSG_ERRQUEUE MSG_ERRQUEUE
    MSG_NOSIGNAL =3D 0x4000,
#define MSG_NOSIGNAL MSG_NOSIGNAL
    MSG_MORE =3D 0x8000,
#define MSG_MORE MSG_MORE
    MSG_WAITFORONE =3D 0x10000,
#define MSG_WAITFORONE MSG_WAITFORONE
    MSG_FASTOPEN =3D 0x20000000,
#define MSG_FASTOPEN MSG_FASTOPEN

    MSG_CMSG_CLOEXEC =3D 0x40000000


#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
  };




struct msghdr
  {
    void *msg_name;
    socklen_t msg_namelen;

    struct iovec *msg_iov;
    size_t msg_iovlen;

    void *msg_control;
    size_t msg_controllen;




    int msg_flags;
  };


struct cmsghdr
  {
    size_t cmsg_len;




    int cmsg_level;
    int cmsg_type;

    __extension__ unsigned char __cmsg_data [];

  };



#define CMSG_DATA(cmsg) ((cmsg)->__cmsg_data)



#define CMSG_NXTHDR(mhdr,cmsg) __cmsg_nxthdr (mhdr, cmsg)
#define CMSG_FIRSTHDR(mhdr) ((size_t) (mhdr)->msg_controllen >=3D sizeof (s=
truct cmsghdr) ? (struct cmsghdr *) (mhdr)->msg_control : (struct cmsghdr *=
) 0)


#define CMSG_ALIGN(len) (((len) + sizeof (size_t) - 1) & (size_t) ~(sizeof =
(size_t) - 1))

#define CMSG_SPACE(len) (CMSG_ALIGN (len) + CMSG_ALIGN (sizeof (struct cmsg=
hdr)))

#define CMSG_LEN(len) (CMSG_ALIGN (sizeof (struct cmsghdr)) + (len))

extern struct cmsghdr *__cmsg_nxthdr (struct msghdr *__mhdr,
          struct cmsghdr *__cmsg) __attribute__ ((__nothrow__ , __leaf__));




extern __inline struct cmsghdr *
__attribute__ ((__nothrow__ , __leaf__)) __cmsg_nxthdr (struct msghdr *__mh=
dr, struct cmsghdr *__cmsg)
{
  if ((size_t) __cmsg->cmsg_len < sizeof (struct cmsghdr))

    return (struct cmsghdr *) 0;

  __cmsg =3D (struct cmsghdr *) ((unsigned char *) __cmsg
          + (((__cmsg->cmsg_len) + sizeof (size_t) - 1) & (size_t) ~(sizeof=
 (size_t) - 1)));
  if ((unsigned char *) (__cmsg + 1) > ((unsigned char *) __mhdr->msg_contr=
ol
     + __mhdr->msg_controllen)
      || ((unsigned char *) __cmsg + (((__cmsg->cmsg_len) + sizeof (size_t)=
 - 1) & (size_t) ~(sizeof (size_t) - 1))
   > ((unsigned char *) __mhdr->msg_control + __mhdr->msg_controllen)))

    return (struct cmsghdr *) 0;
  return __cmsg;
}




enum
  {
    SCM_RIGHTS =3D 0x01
#define SCM_RIGHTS SCM_RIGHTS




  };
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/socket.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/socket.h" 1 3 4
# 1 "../../include/asm-generic/socket.h" 1 3 4

#define __ASM_GENERIC_SOCKET_H=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/sockios.h" 1 3 4
# 1 "../../include/asm-generic/sockios.h" 1 3 4

#define __ASM_GENERIC_SOCKIOS_H=20


#define FIOSETOWN 0x8901
#define SIOCSPGRP 0x8902
#define FIOGETOWN 0x8903
#define SIOCGPGRP 0x8904
#define SIOCATMARK 0x8905
#define SIOCGSTAMP 0x8906
#define SIOCGSTAMPNS 0x8907
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/sockios.h" 2 3 4
# 5 "../../include/asm-generic/socket.h" 2 3 4


#define SOL_SOCKET 1

#define SO_DEBUG 1
#define SO_REUSEADDR 2
#define SO_TYPE 3
#define SO_ERROR 4
#define SO_DONTROUTE 5
#define SO_BROADCAST 6
#define SO_SNDBUF 7
#define SO_RCVBUF 8
#define SO_SNDBUFFORCE 32
#define SO_RCVBUFFORCE 33
#define SO_KEEPALIVE 9
#define SO_OOBINLINE 10
#define SO_NO_CHECK 11
#define SO_PRIORITY 12
#define SO_LINGER 13
#define SO_BSDCOMPAT 14



#define SO_PASSCRED 16
#define SO_PEERCRED 17
#define SO_RCVLOWAT 18
#define SO_SNDLOWAT 19
#define SO_RCVTIMEO 20
#define SO_SNDTIMEO 21



#define SO_SECURITY_AUTHENTICATION 22
#define SO_SECURITY_ENCRYPTION_TRANSPORT 23
#define SO_SECURITY_ENCRYPTION_NETWORK 24

#define SO_BINDTODEVICE 25


#define SO_ATTACH_FILTER 26
#define SO_DETACH_FILTER 27

#define SO_PEERNAME 28
#define SO_TIMESTAMP 29
#define SCM_TIMESTAMP SO_TIMESTAMP

#define SO_ACCEPTCONN 30

#define SO_PEERSEC 31
#define SO_PASSSEC 34
#define SO_TIMESTAMPNS 35
#define SCM_TIMESTAMPNS SO_TIMESTAMPNS

#define SO_MARK 36

#define SO_TIMESTAMPING 37
#define SCM_TIMESTAMPING SO_TIMESTAMPING

#define SO_PROTOCOL 38
#define SO_DOMAIN 39

#define SO_RXQ_OVFL 40
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/socket.h" 2 3 4
# 344 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/socket.h" 2 3 4
# 377 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/socket.h" 3 4
struct linger
  {
    int l_onoff;
    int l_linger;
  };
# 40 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 2 3 4




struct osockaddr
  {
    unsigned short int sa_family;
    unsigned char sa_data[14];
  };




enum
{
  SHUT_RD =3D 0,
#define SHUT_RD SHUT_RD
  SHUT_WR,
#define SHUT_WR SHUT_WR
  SHUT_RDWR
#define SHUT_RDWR SHUT_RDWR
};
# 70 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
#define __SOCKADDR_ARG struct sockaddr *__restrict
#define __CONST_SOCKADDR_ARG const struct sockaddr *
# 114 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
extern int socket (int __domain, int __type, int __protocol) __attribute__ =
((__nothrow__ , __leaf__));





extern int socketpair (int __domain, int __type, int __protocol,
         int __fds[2]) __attribute__ ((__nothrow__ , __leaf__));


extern int bind (int __fd, const struct sockaddr * __addr, socklen_t __len)
     __attribute__ ((__nothrow__ , __leaf__));


extern int getsockname (int __fd, struct sockaddr *__restrict __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));
# 138 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
extern int connect (int __fd, const struct sockaddr * __addr, socklen_t __l=
en);



extern int getpeername (int __fd, struct sockaddr *__restrict __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));






extern ssize_t send (int __fd, const void *__buf, size_t __n, int __flags);






extern ssize_t recv (int __fd, void *__buf, size_t __n, int __flags);






extern ssize_t sendto (int __fd, const void *__buf, size_t __n,
         int __flags, const struct sockaddr * __addr,
         socklen_t __addr_len);
# 175 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
extern ssize_t recvfrom (int __fd, void *__restrict __buf, size_t __n,
    int __flags, struct sockaddr *__restrict __addr,
    socklen_t *__restrict __addr_len);







extern ssize_t sendmsg (int __fd, const struct msghdr *__message,
   int __flags);
# 203 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
extern ssize_t recvmsg (int __fd, struct msghdr *__message, int __flags);
# 220 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
extern int getsockopt (int __fd, int __level, int __optname,
         void *__restrict __optval,
         socklen_t *__restrict __optlen) __attribute__ ((__nothrow__ , __le=
af__));




extern int setsockopt (int __fd, int __level, int __optname,
         const void *__optval, socklen_t __optlen) __attribute__ ((__nothro=
w__ , __leaf__));





extern int listen (int __fd, int __n) __attribute__ ((__nothrow__ , __leaf_=
_));
# 244 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
extern int accept (int __fd, struct sockaddr *__restrict __addr,
     socklen_t *__restrict __addr_len);
# 262 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4
extern int shutdown (int __fd, int __how) __attribute__ ((__nothrow__ , __l=
eaf__));




extern int sockatmark (int __fd) __attribute__ ((__nothrow__ , __leaf__));







extern int isfdtype (int __fd, int __fdtype) __attribute__ ((__nothrow__ , =
__leaf__));
# 284 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/sys/socket.h" 3 4

# 72 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/ioctl.h" 1 3 4
# 19 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/ioctl.h" 3 4
#define _SYS_IOCTL_H 1






# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/ioctls.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/ioctls.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/ioctls.h" 1 3 4

#define __ASM_ARM_IOCTLS_H=20

#define FIOQSIZE 0x545E

# 1 "../../include/asm-generic/ioctls.h" 1 3 4

#define __ASM_GENERIC_IOCTLS_H=20

# 1 "../../include/linux/ioctl.h" 1 3 4

#define _LINUX_IOCTL_H=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/ioctl.h" 1 3 4
# 1 "../../include/asm-generic/ioctl.h" 1 3 4

#define _ASM_GENERIC_IOCTL_H=20
# 22 "../../include/asm-generic/ioctl.h" 3 4
#define _IOC_NRBITS 8
#define _IOC_TYPEBITS 8







#define _IOC_SIZEBITS 14



#define _IOC_DIRBITS 2


#define _IOC_NRMASK ((1 << _IOC_NRBITS)-1)
#define _IOC_TYPEMASK ((1 << _IOC_TYPEBITS)-1)
#define _IOC_SIZEMASK ((1 << _IOC_SIZEBITS)-1)
#define _IOC_DIRMASK ((1 << _IOC_DIRBITS)-1)

#define _IOC_NRSHIFT 0
#define _IOC_TYPESHIFT (_IOC_NRSHIFT+_IOC_NRBITS)
#define _IOC_SIZESHIFT (_IOC_TYPESHIFT+_IOC_TYPEBITS)
#define _IOC_DIRSHIFT (_IOC_SIZESHIFT+_IOC_SIZEBITS)







#define _IOC_NONE 0U



#define _IOC_WRITE 1U



#define _IOC_READ 2U


#define _IOC(dir,type,nr,size) (((dir) << _IOC_DIRSHIFT) | ((type) << _IOC_=
TYPESHIFT) | ((nr) << _IOC_NRSHIFT) | ((size) << _IOC_SIZESHIFT))
# 79 "../../include/asm-generic/ioctl.h" 3 4
#define _IOC_TYPECHECK(t) (sizeof(t))



#define _IO(type,nr) _IOC(_IOC_NONE,(type),(nr),0)
#define _IOR(type,nr,size) _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(size)=
))
#define _IOW(type,nr,size) _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(size=
)))
#define _IOWR(type,nr,size) _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_IOC_TYP=
ECHECK(size)))
#define _IOR_BAD(type,nr,size) _IOC(_IOC_READ,(type),(nr),sizeof(size))
#define _IOW_BAD(type,nr,size) _IOC(_IOC_WRITE,(type),(nr),sizeof(size))
#define _IOWR_BAD(type,nr,size) _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),sizeo=
f(size))


#define _IOC_DIR(nr) (((nr) >> _IOC_DIRSHIFT) & _IOC_DIRMASK)
#define _IOC_TYPE(nr) (((nr) >> _IOC_TYPESHIFT) & _IOC_TYPEMASK)
#define _IOC_NR(nr) (((nr) >> _IOC_NRSHIFT) & _IOC_NRMASK)
#define _IOC_SIZE(nr) (((nr) >> _IOC_SIZESHIFT) & _IOC_SIZEMASK)



#define IOC_IN (_IOC_WRITE << _IOC_DIRSHIFT)
#define IOC_OUT (_IOC_READ << _IOC_DIRSHIFT)
#define IOC_INOUT ((_IOC_WRITE|_IOC_READ) << _IOC_DIRSHIFT)
#define IOCSIZE_MASK (_IOC_SIZEMASK << _IOC_SIZESHIFT)
#define IOCSIZE_SHIFT (_IOC_SIZESHIFT)
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/ioctl.h" 2 3 4
# 5 "../../include/linux/ioctl.h" 2 3 4
# 5 "../../include/asm-generic/ioctls.h" 2 3 4
# 19 "../../include/asm-generic/ioctls.h" 3 4
#define TCGETS 0x5401
#define TCSETS 0x5402
#define TCSETSW 0x5403
#define TCSETSF 0x5404
#define TCGETA 0x5405
#define TCSETA 0x5406
#define TCSETAW 0x5407
#define TCSETAF 0x5408
#define TCSBRK 0x5409
#define TCXONC 0x540A
#define TCFLSH 0x540B
#define TIOCEXCL 0x540C
#define TIOCNXCL 0x540D
#define TIOCSCTTY 0x540E
#define TIOCGPGRP 0x540F
#define TIOCSPGRP 0x5410
#define TIOCOUTQ 0x5411
#define TIOCSTI 0x5412
#define TIOCGWINSZ 0x5413
#define TIOCSWINSZ 0x5414
#define TIOCMGET 0x5415
#define TIOCMBIS 0x5416
#define TIOCMBIC 0x5417
#define TIOCMSET 0x5418
#define TIOCGSOFTCAR 0x5419
#define TIOCSSOFTCAR 0x541A
#define FIONREAD 0x541B
#define TIOCINQ FIONREAD
#define TIOCLINUX 0x541C
#define TIOCCONS 0x541D
#define TIOCGSERIAL 0x541E
#define TIOCSSERIAL 0x541F
#define TIOCPKT 0x5420
#define FIONBIO 0x5421
#define TIOCNOTTY 0x5422
#define TIOCSETD 0x5423
#define TIOCGETD 0x5424
#define TCSBRKP 0x5425
#define TIOCSBRK 0x5427
#define TIOCCBRK 0x5428
#define TIOCGSID 0x5429
#define TCGETS2 _IOR('T', 0x2A, struct termios2)
#define TCSETS2 _IOW('T', 0x2B, struct termios2)
#define TCSETSW2 _IOW('T', 0x2C, struct termios2)
#define TCSETSF2 _IOW('T', 0x2D, struct termios2)
#define TIOCGRS485 0x542E
#define TIOCSRS485 0x542F
#define TIOCGPTN _IOR('T', 0x30, unsigned int)
#define TIOCSPTLCK _IOW('T', 0x31, int)
#define TCGETX 0x5432
#define TCSETX 0x5433
#define TCSETXF 0x5434
#define TCSETXW 0x5435

#define FIONCLEX 0x5450
#define FIOCLEX 0x5451
#define FIOASYNC 0x5452
#define TIOCSERCONFIG 0x5453
#define TIOCSERGWILD 0x5454
#define TIOCSERSWILD 0x5455
#define TIOCGLCKTRMIOS 0x5456
#define TIOCSLCKTRMIOS 0x5457
#define TIOCSERGSTRUCT 0x5458
#define TIOCSERGETLSR 0x5459
#define TIOCSERGETMULTI 0x545A
#define TIOCSERSETMULTI 0x545B

#define TIOCMIWAIT 0x545C
#define TIOCGICOUNT 0x545D
# 100 "../../include/asm-generic/ioctls.h" 3 4
#define TIOCPKT_DATA 0
#define TIOCPKT_FLUSHREAD 1
#define TIOCPKT_FLUSHWRITE 2
#define TIOCPKT_STOP 4
#define TIOCPKT_START 8
#define TIOCPKT_NOSTOP 16
#define TIOCPKT_DOSTOP 32

#define TIOCSER_TEMT 0x01
# 7 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/ioctls.h" 2 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/ioctls.h" 2 3 4


#define SIOCADDRT 0x890B
#define SIOCDELRT 0x890C
#define SIOCRTMSG 0x890D


#define SIOCGIFNAME 0x8910
#define SIOCSIFLINK 0x8911
#define SIOCGIFCONF 0x8912
#define SIOCGIFFLAGS 0x8913
#define SIOCSIFFLAGS 0x8914
#define SIOCGIFADDR 0x8915
#define SIOCSIFADDR 0x8916
#define SIOCGIFDSTADDR 0x8917
#define SIOCSIFDSTADDR 0x8918
#define SIOCGIFBRDADDR 0x8919
#define SIOCSIFBRDADDR 0x891a
#define SIOCGIFNETMASK 0x891b
#define SIOCSIFNETMASK 0x891c
#define SIOCGIFMETRIC 0x891d
#define SIOCSIFMETRIC 0x891e
#define SIOCGIFMEM 0x891f
#define SIOCSIFMEM 0x8920
#define SIOCGIFMTU 0x8921
#define SIOCSIFMTU 0x8922
#define SIOCSIFNAME 0x8923
#define SIOCSIFHWADDR 0x8924
#define SIOCGIFENCAP 0x8925
#define SIOCSIFENCAP 0x8926
#define SIOCGIFHWADDR 0x8927
#define SIOCGIFSLAVE 0x8929
#define SIOCSIFSLAVE 0x8930
#define SIOCADDMULTI 0x8931
#define SIOCDELMULTI 0x8932
#define SIOCGIFINDEX 0x8933
#define SIOGIFINDEX SIOCGIFINDEX
#define SIOCSIFPFLAGS 0x8934
#define SIOCGIFPFLAGS 0x8935
#define SIOCDIFADDR 0x8936
#define SIOCSIFHWBROADCAST 0x8937
#define SIOCGIFCOUNT 0x8938

#define SIOCGIFBR 0x8940
#define SIOCSIFBR 0x8941

#define SIOCGIFTXQLEN 0x8942
#define SIOCSIFTXQLEN 0x8943




#define SIOCDARP 0x8953
#define SIOCGARP 0x8954
#define SIOCSARP 0x8955


#define SIOCDRARP 0x8960
#define SIOCGRARP 0x8961
#define SIOCSRARP 0x8962



#define SIOCGIFMAP 0x8970
#define SIOCSIFMAP 0x8971



#define SIOCADDDLCI 0x8980
#define SIOCDELDLCI 0x8981
# 102 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/bits/ioctls.h" 3 4
#define SIOCDEVPRIVATE 0x89F0





#define SIOCPROTOPRIVATE 0x89E0
# 27 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/ioctl.h" 2 3 4


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/ioctl-types.h" 1 3 4
# 27 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/ioctl-types.h" 3 4
struct winsize
  {
    unsigned short int ws_row;
    unsigned short int ws_col;
    unsigned short int ws_xpixel;
    unsigned short int ws_ypixel;
  };

#define NCC 8
struct termio
  {
    unsigned short int c_iflag;
    unsigned short int c_oflag;
    unsigned short int c_cflag;
    unsigned short int c_lflag;
    unsigned char c_line;
    unsigned char c_cc[8];
};


#define TIOCM_LE 0x001
#define TIOCM_DTR 0x002
#define TIOCM_RTS 0x004
#define TIOCM_ST 0x008
#define TIOCM_SR 0x010
#define TIOCM_CTS 0x020
#define TIOCM_CAR 0x040
#define TIOCM_RNG 0x080
#define TIOCM_DSR 0x100
#define TIOCM_CD TIOCM_CAR
#define TIOCM_RI TIOCM_RNG




#define N_TTY 0
#define N_SLIP 1
#define N_MOUSE 2
#define N_PPP 3
#define N_STRIP 4
#define N_AX25 5
#define N_X25 6
#define N_6PACK 7
#define N_MASC 8
#define N_R3964 9
#define N_PROFIBUS_FDL 10
#define N_IRDA 11
#define N_SMSBLOCK 12
#define N_HDLC 13
#define N_SYNC_PPP 14
#define N_HCI 15
# 30 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/ioctl.h" 2 3 4






# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/ttydefaults.h" 1 3 4
# 41 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/ttydefaults.h" 3 4
#define _SYS_TTYDEFAULTS_H_=20




#define TTYDEF_IFLAG (BRKINT | ISTRIP | ICRNL | IMAXBEL | IXON | IXANY)
#define TTYDEF_OFLAG (OPOST | ONLCR | XTABS)
#define TTYDEF_LFLAG (ECHO | ICANON | ISIG | IEXTEN | ECHOE|ECHOKE|ECHOCTL)
#define TTYDEF_CFLAG (CREAD | CS7 | PARENB | HUPCL)
#define TTYDEF_SPEED (B9600)




#define CTRL(x) (x&037)
#define CEOF CTRL('d')

#define CEOL _POSIX_VDISABLE



#define CERASE 0177
#define CINTR CTRL('c')

#define CSTATUS _POSIX_VDISABLE



#define CKILL CTRL('u')
#define CMIN 1
#define CQUIT 034
#define CSUSP CTRL('z')
#define CTIME 0
#define CDSUSP CTRL('y')
#define CSTART CTRL('q')
#define CSTOP CTRL('s')
#define CLNEXT CTRL('v')
#define CDISCARD CTRL('o')
#define CWERASE CTRL('w')
#define CREPRINT CTRL('r')
#define CEOT CEOF

#define CBRK CEOL
#define CRPRNT CREPRINT
#define CFLUSH CDISCARD
# 37 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/ioctl.h" 2 3 4




extern int ioctl (int __fd, unsigned long int __request, ...) __attribute__=
 ((__nothrow__ , __leaf__));


# 73 "util/util.h" 2



# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/netinet/in.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/netinet/in.h" 3 4
#define _NETINET_IN_H 1


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stdint.h" 1 3 4
# 9 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stdint.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 3 4
#define _STDINT_H 1


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/wchar.h" 1 3 4
# 20 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/wchar.h" 3 4
#define _BITS_WCHAR_H 1



#define __WCHAR_MAX __WCHAR_MAX__
# 37 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/wchar.h" 3 4
#define __WCHAR_MIN L'\0'
# 27 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 2 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 1 3 4
# 18 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/wordsize.h" 3 4
#define __WORDSIZE 32
# 28 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 2 3 4
# 48 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 3 4
typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;
#define __uint32_t_defined=20




__extension__
typedef unsigned long long int uint64_t;






typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;



__extension__
typedef long long int int_least64_t;



typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;



__extension__
typedef unsigned long long int uint_least64_t;






typedef signed char int_fast8_t;





typedef int int_fast16_t;
typedef int int_fast32_t;
__extension__
typedef long long int int_fast64_t;



typedef unsigned char uint_fast8_t;





typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
__extension__
typedef unsigned long long int uint_fast64_t;
# 128 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 3 4
typedef unsigned int uintptr_t;
# 137 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 3 4
__extension__
typedef long long int intmax_t;
__extension__
typedef unsigned long long int uintmax_t;
# 152 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 3 4
#define __INT64_C(c) c ## LL
#define __UINT64_C(c) c ## ULL





#define INT8_MIN (-128)
#define INT16_MIN (-32767-1)
#define INT32_MIN (-2147483647-1)
#define INT64_MIN (-__INT64_C(9223372036854775807)-1)

#define INT8_MAX (127)
#define INT16_MAX (32767)
#define INT32_MAX (2147483647)
#define INT64_MAX (__INT64_C(9223372036854775807))


#define UINT8_MAX (255)
#define UINT16_MAX (65535)
#define UINT32_MAX (4294967295U)
#define UINT64_MAX (__UINT64_C(18446744073709551615))



#define INT_LEAST8_MIN (-128)
#define INT_LEAST16_MIN (-32767-1)
#define INT_LEAST32_MIN (-2147483647-1)
#define INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)

#define INT_LEAST8_MAX (127)
#define INT_LEAST16_MAX (32767)
#define INT_LEAST32_MAX (2147483647)
#define INT_LEAST64_MAX (__INT64_C(9223372036854775807))


#define UINT_LEAST8_MAX (255)
#define UINT_LEAST16_MAX (65535)
#define UINT_LEAST32_MAX (4294967295U)
#define UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))



#define INT_FAST8_MIN (-128)




#define INT_FAST16_MIN (-2147483647-1)
#define INT_FAST32_MIN (-2147483647-1)

#define INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)

#define INT_FAST8_MAX (127)




#define INT_FAST16_MAX (2147483647)
#define INT_FAST32_MAX (2147483647)

#define INT_FAST64_MAX (__INT64_C(9223372036854775807))


#define UINT_FAST8_MAX (255)




#define UINT_FAST16_MAX (4294967295U)
#define UINT_FAST32_MAX (4294967295U)

#define UINT_FAST64_MAX (__UINT64_C(18446744073709551615))
# 233 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 3 4
#define INTPTR_MIN (-2147483647-1)
#define INTPTR_MAX (2147483647)
#define UINTPTR_MAX (4294967295U)




#define INTMAX_MIN (-__INT64_C(9223372036854775807)-1)

#define INTMAX_MAX (__INT64_C(9223372036854775807))


#define UINTMAX_MAX (__UINT64_C(18446744073709551615))
# 255 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 3 4
#define PTRDIFF_MIN (-2147483647-1)
#define PTRDIFF_MAX (2147483647)



#define SIG_ATOMIC_MIN (-2147483647-1)
#define SIG_ATOMIC_MAX (2147483647)





#define SIZE_MAX (4294967295U)





#define WCHAR_MIN __WCHAR_MIN
#define WCHAR_MAX __WCHAR_MAX



#define WINT_MIN (0u)
#define WINT_MAX (4294967295u)
# 289 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/stdint.h" 3 4
#define INT8_C(c) c
#define INT16_C(c) c
#define INT32_C(c) c



#define INT64_C(c) c ## LL



#define UINT8_C(c) c
#define UINT16_C(c) c
#define UINT32_C(c) c ## U



#define UINT64_C(c) c ## ULL







#define INTMAX_C(c) c ## LL
#define UINTMAX_C(c) c ## ULL
# 10 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/g=
cc/arm-poky-linux-gnueabi/4.8.1/include/stdint.h" 2 3 4



#define _GCC_WRAP_STDINT_H=20
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/netinet/in.h" 2 3 4







enum
  {
    IPPROTO_IP =3D 0,
#define IPPROTO_IP IPPROTO_IP
    IPPROTO_HOPOPTS =3D 0,
#define IPPROTO_HOPOPTS IPPROTO_HOPOPTS
    IPPROTO_ICMP =3D 1,
#define IPPROTO_ICMP IPPROTO_ICMP
    IPPROTO_IGMP =3D 2,
#define IPPROTO_IGMP IPPROTO_IGMP
    IPPROTO_IPIP =3D 4,
#define IPPROTO_IPIP IPPROTO_IPIP
    IPPROTO_TCP =3D 6,
#define IPPROTO_TCP IPPROTO_TCP
    IPPROTO_EGP =3D 8,
#define IPPROTO_EGP IPPROTO_EGP
    IPPROTO_PUP =3D 12,
#define IPPROTO_PUP IPPROTO_PUP
    IPPROTO_UDP =3D 17,
#define IPPROTO_UDP IPPROTO_UDP
    IPPROTO_IDP =3D 22,
#define IPPROTO_IDP IPPROTO_IDP
    IPPROTO_TP =3D 29,
#define IPPROTO_TP IPPROTO_TP
    IPPROTO_DCCP =3D 33,
#define IPPROTO_DCCP IPPROTO_DCCP
    IPPROTO_IPV6 =3D 41,
#define IPPROTO_IPV6 IPPROTO_IPV6
    IPPROTO_ROUTING =3D 43,
#define IPPROTO_ROUTING IPPROTO_ROUTING
    IPPROTO_FRAGMENT =3D 44,
#define IPPROTO_FRAGMENT IPPROTO_FRAGMENT
    IPPROTO_RSVP =3D 46,
#define IPPROTO_RSVP IPPROTO_RSVP
    IPPROTO_GRE =3D 47,
#define IPPROTO_GRE IPPROTO_GRE
    IPPROTO_ESP =3D 50,
#define IPPROTO_ESP IPPROTO_ESP
    IPPROTO_AH =3D 51,
#define IPPROTO_AH IPPROTO_AH
    IPPROTO_ICMPV6 =3D 58,
#define IPPROTO_ICMPV6 IPPROTO_ICMPV6
    IPPROTO_NONE =3D 59,
#define IPPROTO_NONE IPPROTO_NONE
    IPPROTO_DSTOPTS =3D 60,
#define IPPROTO_DSTOPTS IPPROTO_DSTOPTS
    IPPROTO_MTP =3D 92,
#define IPPROTO_MTP IPPROTO_MTP
    IPPROTO_ENCAP =3D 98,
#define IPPROTO_ENCAP IPPROTO_ENCAP
    IPPROTO_PIM =3D 103,
#define IPPROTO_PIM IPPROTO_PIM
    IPPROTO_COMP =3D 108,
#define IPPROTO_COMP IPPROTO_COMP
    IPPROTO_SCTP =3D 132,
#define IPPROTO_SCTP IPPROTO_SCTP
    IPPROTO_UDPLITE =3D 136,
#define IPPROTO_UDPLITE IPPROTO_UDPLITE
    IPPROTO_RAW =3D 255,
#define IPPROTO_RAW IPPROTO_RAW
    IPPROTO_MAX
  };



typedef uint16_t in_port_t;


enum
  {
    IPPORT_ECHO =3D 7,
    IPPORT_DISCARD =3D 9,
    IPPORT_SYSTAT =3D 11,
    IPPORT_DAYTIME =3D 13,
    IPPORT_NETSTAT =3D 15,
    IPPORT_FTP =3D 21,
    IPPORT_TELNET =3D 23,
    IPPORT_SMTP =3D 25,
    IPPORT_TIMESERVER =3D 37,
    IPPORT_NAMESERVER =3D 42,
    IPPORT_WHOIS =3D 43,
    IPPORT_MTP =3D 57,

    IPPORT_TFTP =3D 69,
    IPPORT_RJE =3D 77,
    IPPORT_FINGER =3D 79,
    IPPORT_TTYLINK =3D 87,
    IPPORT_SUPDUP =3D 95,


    IPPORT_EXECSERVER =3D 512,
    IPPORT_LOGINSERVER =3D 513,
    IPPORT_CMDSERVER =3D 514,
    IPPORT_EFSSERVER =3D 520,


    IPPORT_BIFFUDP =3D 512,
    IPPORT_WHOSERVER =3D 513,
    IPPORT_ROUTESERVER =3D 520,


    IPPORT_RESERVED =3D 1024,


    IPPORT_USERRESERVED =3D 5000
  };



typedef uint32_t in_addr_t;
struct in_addr
  {
    in_addr_t s_addr;
  };







#define IN_CLASSA(a) ((((in_addr_t)(a)) & 0x80000000) =3D=3D 0)
#define IN_CLASSA_NET 0xff000000
#define IN_CLASSA_NSHIFT 24
#define IN_CLASSA_HOST (0xffffffff & ~IN_CLASSA_NET)
#define IN_CLASSA_MAX 128

#define IN_CLASSB(a) ((((in_addr_t)(a)) & 0xc0000000) =3D=3D 0x80000000)
#define IN_CLASSB_NET 0xffff0000
#define IN_CLASSB_NSHIFT 16
#define IN_CLASSB_HOST (0xffffffff & ~IN_CLASSB_NET)
#define IN_CLASSB_MAX 65536

#define IN_CLASSC(a) ((((in_addr_t)(a)) & 0xe0000000) =3D=3D 0xc0000000)
#define IN_CLASSC_NET 0xffffff00
#define IN_CLASSC_NSHIFT 8
#define IN_CLASSC_HOST (0xffffffff & ~IN_CLASSC_NET)

#define IN_CLASSD(a) ((((in_addr_t)(a)) & 0xf0000000) =3D=3D 0xe0000000)
#define IN_MULTICAST(a) IN_CLASSD(a)

#define IN_EXPERIMENTAL(a) ((((in_addr_t)(a)) & 0xe0000000) =3D=3D 0xe00000=
00)
#define IN_BADCLASS(a) ((((in_addr_t)(a)) & 0xf0000000) =3D=3D 0xf0000000)


#define INADDR_ANY ((in_addr_t) 0x00000000)

#define INADDR_BROADCAST ((in_addr_t) 0xffffffff)

#define INADDR_NONE ((in_addr_t) 0xffffffff)


#define IN_LOOPBACKNET 127


#define INADDR_LOOPBACK ((in_addr_t) 0x7f000001)



#define INADDR_UNSPEC_GROUP ((in_addr_t) 0xe0000000)
#define INADDR_ALLHOSTS_GROUP ((in_addr_t) 0xe0000001)
#define INADDR_ALLRTRS_GROUP ((in_addr_t) 0xe0000002)
#define INADDR_MAX_LOCAL_GROUP ((in_addr_t) 0xe00000ff)



struct in6_addr
  {
    union
      {
 uint8_t __u6_addr8[16];

 uint16_t __u6_addr16[8];
 uint32_t __u6_addr32[4];

      } __in6_u;
#define s6_addr __in6_u.__u6_addr8

#define s6_addr16 __in6_u.__u6_addr16
#define s6_addr32 __in6_u.__u6_addr32

  };

extern const struct in6_addr in6addr_any;
extern const struct in6_addr in6addr_loopback;
#define IN6ADDR_ANY_INIT { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 } } }
#define IN6ADDR_LOOPBACK_INIT { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1 } } }

#define INET_ADDRSTRLEN 16
#define INET6_ADDRSTRLEN 46



struct sockaddr_in
  {
    sa_family_t sin_family;
    in_port_t sin_port;
    struct in_addr sin_addr;


    unsigned char sin_zero[sizeof (struct sockaddr) -
      (sizeof (unsigned short int)) -
      sizeof (in_port_t) -
      sizeof (struct in_addr)];
  };


struct sockaddr_in6
  {
    sa_family_t sin6_family;
    in_port_t sin6_port;
    uint32_t sin6_flowinfo;
    struct in6_addr sin6_addr;
    uint32_t sin6_scope_id;
  };




struct ip_mreq
  {

    struct in_addr imr_multiaddr;


    struct in_addr imr_interface;
  };

struct ip_mreq_source
  {

    struct in_addr imr_multiaddr;


    struct in_addr imr_interface;


    struct in_addr imr_sourceaddr;
  };




struct ipv6_mreq
  {

    struct in6_addr ipv6mr_multiaddr;


    unsigned int ipv6mr_interface;
  };




struct group_req
  {

    uint32_t gr_interface;


    struct sockaddr_storage gr_group;
  };

struct group_source_req
  {

    uint32_t gsr_interface;


    struct sockaddr_storage gsr_group;


    struct sockaddr_storage gsr_source;
  };



struct ip_msfilter
  {

    struct in_addr imsf_multiaddr;


    struct in_addr imsf_interface;


    uint32_t imsf_fmode;


    uint32_t imsf_numsrc;

    struct in_addr imsf_slist[1];
  };

#define IP_MSFILTER_SIZE(numsrc) (sizeof (struct ip_msfilter) - sizeof (str=
uct in_addr) + (numsrc) * sizeof (struct in_addr))



struct group_filter
  {

    uint32_t gf_interface;


    struct sockaddr_storage gf_group;


    uint32_t gf_fmode;


    uint32_t gf_numsrc;

    struct sockaddr_storage gf_slist[1];
};

#define GROUP_FILTER_SIZE(numsrc) (sizeof (struct group_filter) - sizeof (s=
truct sockaddr_storage) + ((numsrc) * sizeof (struct sockaddr_storage)))







# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/in.h" 1 3 4
# 27 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/in.h" 3 4
#define IP_OPTIONS 4
#define IP_HDRINCL 3
#define IP_TOS 1
#define IP_TTL 2
#define IP_RECVOPTS 6

#define IP_RECVRETOPTS IP_RETOPTS
#define IP_RETOPTS 7
#define IP_MULTICAST_IF 32
#define IP_MULTICAST_TTL 33
#define IP_MULTICAST_LOOP 34
#define IP_ADD_MEMBERSHIP 35
#define IP_DROP_MEMBERSHIP 36
#define IP_UNBLOCK_SOURCE 37
#define IP_BLOCK_SOURCE 38
#define IP_ADD_SOURCE_MEMBERSHIP 39
#define IP_DROP_SOURCE_MEMBERSHIP 40
#define IP_MSFILTER 41

#define MCAST_JOIN_GROUP 42
#define MCAST_BLOCK_SOURCE 43
#define MCAST_UNBLOCK_SOURCE 44
#define MCAST_LEAVE_GROUP 45
#define MCAST_JOIN_SOURCE_GROUP 46
#define MCAST_LEAVE_SOURCE_GROUP 47
#define MCAST_MSFILTER 48
#define IP_MULTICAST_ALL 49
#define IP_UNICAST_IF 50

#define MCAST_EXCLUDE 0
#define MCAST_INCLUDE 1


#define IP_ROUTER_ALERT 5
#define IP_PKTINFO 8
#define IP_PKTOPTIONS 9
#define IP_PMTUDISC 10
#define IP_MTU_DISCOVER 10
#define IP_RECVERR 11
#define IP_RECVTTL 12
#define IP_RECVTOS 13
#define IP_MTU 14
#define IP_FREEBIND 15
#define IP_IPSEC_POLICY 16
#define IP_XFRM_POLICY 17
#define IP_PASSSEC 18
#define IP_TRANSPARENT 19
#define IP_MULTICAST_ALL 49


#define IP_ORIGDSTADDR 20
#define IP_RECVORIGDSTADDR IP_ORIGDSTADDR

#define IP_MINTTL 21



#define IP_PMTUDISC_DONT 0
#define IP_PMTUDISC_WANT 1
#define IP_PMTUDISC_DO 2
#define IP_PMTUDISC_PROBE 3


#define SOL_IP 0

#define IP_DEFAULT_MULTICAST_TTL 1
#define IP_DEFAULT_MULTICAST_LOOP 1
#define IP_MAX_MEMBERSHIPS 20





struct ip_opts
  {
    struct in_addr ip_dst;
    char ip_opts[40];
  };


struct ip_mreqn
  {
    struct in_addr imr_multiaddr;
    struct in_addr imr_address;
    int imr_ifindex;
  };


struct in_pktinfo
  {
    int ipi_ifindex;
    struct in_addr ipi_spec_dst;
    struct in_addr ipi_addr;
  };





#define IPV6_ADDRFORM 1
#define IPV6_2292PKTINFO 2
#define IPV6_2292HOPOPTS 3
#define IPV6_2292DSTOPTS 4
#define IPV6_2292RTHDR 5
#define IPV6_2292PKTOPTIONS 6
#define IPV6_CHECKSUM 7
#define IPV6_2292HOPLIMIT 8

#define SCM_SRCRT IPV6_RXSRCRT

#define IPV6_NEXTHOP 9
#define IPV6_AUTHHDR 10
#define IPV6_UNICAST_HOPS 16
#define IPV6_MULTICAST_IF 17
#define IPV6_MULTICAST_HOPS 18
#define IPV6_MULTICAST_LOOP 19
#define IPV6_JOIN_GROUP 20
#define IPV6_LEAVE_GROUP 21
#define IPV6_ROUTER_ALERT 22
#define IPV6_MTU_DISCOVER 23
#define IPV6_MTU 24
#define IPV6_RECVERR 25
#define IPV6_V6ONLY 26
#define IPV6_JOIN_ANYCAST 27
#define IPV6_LEAVE_ANYCAST 28
#define IPV6_IPSEC_POLICY 34
#define IPV6_XFRM_POLICY 35

#define IPV6_RECVPKTINFO 49
#define IPV6_PKTINFO 50
#define IPV6_RECVHOPLIMIT 51
#define IPV6_HOPLIMIT 52
#define IPV6_RECVHOPOPTS 53
#define IPV6_HOPOPTS 54
#define IPV6_RTHDRDSTOPTS 55
#define IPV6_RECVRTHDR 56
#define IPV6_RTHDR 57
#define IPV6_RECVDSTOPTS 58
#define IPV6_DSTOPTS 59

#define IPV6_RECVTCLASS 66
#define IPV6_TCLASS 67


#define IPV6_ADD_MEMBERSHIP IPV6_JOIN_GROUP
#define IPV6_DROP_MEMBERSHIP IPV6_LEAVE_GROUP
#define IPV6_RXHOPOPTS IPV6_HOPOPTS
#define IPV6_RXDSTOPTS IPV6_DSTOPTS


#define IPV6_PMTUDISC_DONT 0
#define IPV6_PMTUDISC_WANT 1
#define IPV6_PMTUDISC_DO 2
#define IPV6_PMTUDISC_PROBE 3


#define SOL_IPV6 41
#define SOL_ICMPV6 58


#define IPV6_RTHDR_LOOSE 0
#define IPV6_RTHDR_STRICT 1

#define IPV6_RTHDR_TYPE_0 0
# 356 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netinet/in.h" 2 3 4
# 364 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netinet/in.h" 3 4
extern uint32_t ntohl (uint32_t __netlong) __attribute__ ((__nothrow__ , __=
leaf__)) __attribute__ ((__const__));
extern uint16_t ntohs (uint16_t __netshort)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint32_t htonl (uint32_t __hostlong)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint16_t htons (uint16_t __hostshort)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/byteswap.h" 1 3 4
# 376 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netinet/in.h" 2 3 4
# 390 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netinet/in.h" 3 4
#define ntohl(x) __bswap_32 (x)
#define ntohs(x) __bswap_16 (x)
#define htonl(x) __bswap_32 (x)
#define htons(x) __bswap_16 (x)





#define IN6_IS_ADDR_UNSPECIFIED(a) (__extension__ ({ const struct in6_addr =
*__a =3D (const struct in6_addr *) (a); __a->s6_addr32[0] =3D=3D 0 && __a->=
s6_addr32[1] =3D=3D 0 && __a->s6_addr32[2] =3D=3D 0 && __a->s6_addr32[3] =
=3D=3D 0; }))







#define IN6_IS_ADDR_LOOPBACK(a) (__extension__ ({ const struct in6_addr *__=
a =3D (const struct in6_addr *) (a); __a->s6_addr32[0] =3D=3D 0 && __a->s6_=
addr32[1] =3D=3D 0 && __a->s6_addr32[2] =3D=3D 0 && __a->s6_addr32[3] =3D=
=3D htonl (1); }))







#define IN6_IS_ADDR_LINKLOCAL(a) (__extension__ ({ const struct in6_addr *_=
_a =3D (const struct in6_addr *) (a); (__a->s6_addr32[0] & htonl (0xffc0000=
0)) =3D=3D htonl (0xfe800000); }))




#define IN6_IS_ADDR_SITELOCAL(a) (__extension__ ({ const struct in6_addr *_=
_a =3D (const struct in6_addr *) (a); (__a->s6_addr32[0] & htonl (0xffc0000=
0)) =3D=3D htonl (0xfec00000); }))




#define IN6_IS_ADDR_V4MAPPED(a) (__extension__ ({ const struct in6_addr *__=
a =3D (const struct in6_addr *) (a); __a->s6_addr32[0] =3D=3D 0 && __a->s6_=
addr32[1] =3D=3D 0 && __a->s6_addr32[2] =3D=3D htonl (0xffff); }))






#define IN6_IS_ADDR_V4COMPAT(a) (__extension__ ({ const struct in6_addr *__=
a =3D (const struct in6_addr *) (a); __a->s6_addr32[0] =3D=3D 0 && __a->s6_=
addr32[1] =3D=3D 0 && __a->s6_addr32[2] =3D=3D 0 && ntohl (__a->s6_addr32[3=
]) > 1; }))







#define IN6_ARE_ADDR_EQUAL(a,b) (__extension__ ({ const struct in6_addr *__=
a =3D (const struct in6_addr *) (a); const struct in6_addr *__b =3D (const =
struct in6_addr *) (b); __a->s6_addr32[0] =3D=3D __b->s6_addr32[0] && __a->=
s6_addr32[1] =3D=3D __b->s6_addr32[1] && __a->s6_addr32[2] =3D=3D __b->s6_a=
ddr32[2] && __a->s6_addr32[3] =3D=3D __b->s6_addr32[3]; }))
# 487 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netinet/in.h" 3 4
#define IN6_IS_ADDR_MULTICAST(a) (((const uint8_t *) (a))[0] =3D=3D 0xff)



extern int bindresvport (int __sockfd, struct sockaddr_in *__sock_in) __att=
ribute__ ((__nothrow__ , __leaf__));


extern int bindresvport6 (int __sockfd, struct sockaddr_in6 *__sock_in)
     __attribute__ ((__nothrow__ , __leaf__));



#define IN6_IS_ADDR_MC_NODELOCAL(a) (IN6_IS_ADDR_MULTICAST(a) && ((((const =
uint8_t *) (a))[1] & 0xf) =3D=3D 0x1))



#define IN6_IS_ADDR_MC_LINKLOCAL(a) (IN6_IS_ADDR_MULTICAST(a) && ((((const =
uint8_t *) (a))[1] & 0xf) =3D=3D 0x2))



#define IN6_IS_ADDR_MC_SITELOCAL(a) (IN6_IS_ADDR_MULTICAST(a) && ((((const =
uint8_t *) (a))[1] & 0xf) =3D=3D 0x5))



#define IN6_IS_ADDR_MC_ORGLOCAL(a) (IN6_IS_ADDR_MULTICAST(a) && ((((const u=
int8_t *) (a))[1] & 0xf) =3D=3D 0x8))



#define IN6_IS_ADDR_MC_GLOBAL(a) (IN6_IS_ADDR_MULTICAST(a) && ((((const uin=
t8_t *) (a))[1] & 0xf) =3D=3D 0xe))
# 618 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netinet/in.h" 3 4

# 77 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/netinet/tcp.h" 1 3 4
# 33 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/netinet/tcp.h" 3 4
#define _NETINET_TCP_H 1






#define TCP_NODELAY 1
#define TCP_MAXSEG 2
#define TCP_CORK 3
#define TCP_KEEPIDLE 4
#define TCP_KEEPINTVL 5
#define TCP_KEEPCNT 6
#define TCP_SYNCNT 7
#define TCP_LINGER2 8
#define TCP_DEFER_ACCEPT 9
#define TCP_WINDOW_CLAMP 10
#define TCP_INFO 11
#define TCP_QUICKACK 12
#define TCP_CONGESTION 13
#define TCP_MD5SIG 14
#define TCP_COOKIE_TRANSACTIONS 15
#define TCP_THIN_LINEAR_TIMEOUTS 16
#define TCP_THIN_DUPACK 17
#define TCP_USER_TIMEOUT 18
#define TCP_REPAIR 19
#define TCP_REPAIR_QUEUE 20
#define TCP_QUEUE_SEQ 21
#define TCP_REPAIR_OPTIONS 22
#define TCP_FASTOPEN 23
# 101 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netinet/tcp.h" 3 4
struct tcphdr
  {
    u_int16_t source;
    u_int16_t dest;
    u_int32_t seq;
    u_int32_t ack_seq;

    u_int16_t res1:4;
    u_int16_t doff:4;
    u_int16_t fin:1;
    u_int16_t syn:1;
    u_int16_t rst:1;
    u_int16_t psh:1;
    u_int16_t ack:1;
    u_int16_t urg:1;
    u_int16_t res2:2;
# 130 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netinet/tcp.h" 3 4
    u_int16_t window;
    u_int16_t check;
    u_int16_t urg_ptr;
};


enum
{
  TCP_ESTABLISHED =3D 1,
  TCP_SYN_SENT,
  TCP_SYN_RECV,
  TCP_FIN_WAIT1,
  TCP_FIN_WAIT2,
  TCP_TIME_WAIT,
  TCP_CLOSE,
  TCP_CLOSE_WAIT,
  TCP_LAST_ACK,
  TCP_LISTEN,
  TCP_CLOSING
};

#define TCPOPT_EOL 0
#define TCPOPT_NOP 1
#define TCPOPT_MAXSEG 2
#define TCPOLEN_MAXSEG 4
#define TCPOPT_WINDOW 3
#define TCPOLEN_WINDOW 3
#define TCPOPT_SACK_PERMITTED 4
#define TCPOLEN_SACK_PERMITTED 2
#define TCPOPT_SACK 5
#define TCPOPT_TIMESTAMP 8
#define TCPOLEN_TIMESTAMP 10
#define TCPOLEN_TSTAMP_APPA (TCPOLEN_TIMESTAMP+2)

#define TCPOPT_TSTAMP_HDR (TCPOPT_NOP<<24|TCPOPT_NOP<<16|TCPOPT_TIMESTAMP<<=
8|TCPOLEN_TIMESTAMP)
# 173 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netinet/tcp.h" 3 4
#define TCP_MSS 512

#define TCP_MAXWIN 65535

#define TCP_MAX_WINSHIFT 14

#define SOL_TCP 6


#define TCPI_OPT_TIMESTAMPS 1
#define TCPI_OPT_SACK 2
#define TCPI_OPT_WSCALE 4
#define TCPI_OPT_ECN 8
#define TCPI_OPT_ECN_SEEN 16
#define TCPI_OPT_SYN_DATA 32


enum tcp_ca_state
{
  TCP_CA_Open =3D 0,
  TCP_CA_Disorder =3D 1,
  TCP_CA_CWR =3D 2,
  TCP_CA_Recovery =3D 3,
  TCP_CA_Loss =3D 4
};

struct tcp_info
{
  u_int8_t tcpi_state;
  u_int8_t tcpi_ca_state;
  u_int8_t tcpi_retransmits;
  u_int8_t tcpi_probes;
  u_int8_t tcpi_backoff;
  u_int8_t tcpi_options;
  u_int8_t tcpi_snd_wscale : 4, tcpi_rcv_wscale : 4;

  u_int32_t tcpi_rto;
  u_int32_t tcpi_ato;
  u_int32_t tcpi_snd_mss;
  u_int32_t tcpi_rcv_mss;

  u_int32_t tcpi_unacked;
  u_int32_t tcpi_sacked;
  u_int32_t tcpi_lost;
  u_int32_t tcpi_retrans;
  u_int32_t tcpi_fackets;


  u_int32_t tcpi_last_data_sent;
  u_int32_t tcpi_last_ack_sent;
  u_int32_t tcpi_last_data_recv;
  u_int32_t tcpi_last_ack_recv;


  u_int32_t tcpi_pmtu;
  u_int32_t tcpi_rcv_ssthresh;
  u_int32_t tcpi_rtt;
  u_int32_t tcpi_rttvar;
  u_int32_t tcpi_snd_ssthresh;
  u_int32_t tcpi_snd_cwnd;
  u_int32_t tcpi_advmss;
  u_int32_t tcpi_reordering;

  u_int32_t tcpi_rcv_rtt;
  u_int32_t tcpi_rcv_space;

  u_int32_t tcpi_total_retrans;
};



#define TCP_MD5SIG_MAXKEYLEN 80

struct tcp_md5sig
{
  struct sockaddr_storage tcpm_addr;
  u_int16_t __tcpm_pad1;
  u_int16_t tcpm_keylen;
  u_int32_t __tcpm_pad2;
  u_int8_t tcpm_key[80];
};


struct tcp_repair_opt
{
  u_int32_t opt_code;
  u_int32_t opt_val;
};


enum
{
  TCP_NO_QUEUE,
  TCP_RECV_QUEUE,
  TCP_SEND_QUEUE,
  TCP_QUEUES_NR,
};


#define TCP_COOKIE_MIN 8
#define TCP_COOKIE_MAX 16
#define TCP_COOKIE_PAIR_SIZE (2*TCP_COOKIE_MAX)


#define TCP_COOKIE_IN_ALWAYS (1 << 0)
#define TCP_COOKIE_OUT_NEVER (1 << 1)



#define TCP_S_DATA_IN (1 << 2)
#define TCP_S_DATA_OUT (1 << 3)

#define TCP_MSS_DEFAULT 536U
#define TCP_MSS_DESIRED 1220U

struct tcp_cookie_transactions
{
  u_int16_t tcpct_flags;
  u_int8_t __tcpct_pad1;
  u_int8_t tcpct_cookie_desired;
  u_int16_t tcpct_s_data_desired;
  u_int16_t tcpct_used;
  u_int8_t tcpct_value[536U];
};
# 78 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/arpa/inet.h" 1 3 4
# 19 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/arpa/inet.h" 3 4
#define _ARPA_INET_H 1
# 30 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/arpa/inet.h" 3 4




extern in_addr_t inet_addr (const char *__cp) __attribute__ ((__nothrow__ ,=
 __leaf__));


extern in_addr_t inet_lnaof (struct in_addr __in) __attribute__ ((__nothrow=
__ , __leaf__));



extern struct in_addr inet_makeaddr (in_addr_t __net, in_addr_t __host)
     __attribute__ ((__nothrow__ , __leaf__));


extern in_addr_t inet_netof (struct in_addr __in) __attribute__ ((__nothrow=
__ , __leaf__));



extern in_addr_t inet_network (const char *__cp) __attribute__ ((__nothrow_=
_ , __leaf__));



extern char *inet_ntoa (struct in_addr __in) __attribute__ ((__nothrow__ , =
__leaf__));




extern int inet_pton (int __af, const char *__restrict __cp,
        void *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));




extern const char *inet_ntop (int __af, const void *__restrict __cp,
         char *__restrict __buf, socklen_t __len)
     __attribute__ ((__nothrow__ , __leaf__));






extern int inet_aton (const char *__cp, struct in_addr *__inp) __attribute_=
_ ((__nothrow__ , __leaf__));



extern char *inet_neta (in_addr_t __net, char *__buf, size_t __len) __attri=
bute__ ((__nothrow__ , __leaf__));




extern char *inet_net_ntop (int __af, const void *__cp, int __bits,
       char *__buf, size_t __len) __attribute__ ((__nothrow__ , __leaf__));




extern int inet_net_pton (int __af, const char *__cp,
     void *__buf, size_t __len) __attribute__ ((__nothrow__ , __leaf__));




extern unsigned int inet_nsap_addr (const char *__cp,
        unsigned char *__buf, int __len) __attribute__ ((__nothrow__ , __le=
af__));



extern char *inet_nsap_ntoa (int __len, const unsigned char *__cp,
        char *__buf) __attribute__ ((__nothrow__ , __leaf__));



# 79 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
#define _NETDB_H 1
# 32 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/rpc/netdb.h" 1 3 4
# 37 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/rpc/netdb.h" 3 4
#define _RPC_NETDB_H 1



#define __need_size_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 43 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/rpc/netdb.h" 2 3 4



struct rpcent
{
  char *r_name;
  char **r_aliases;
  int r_number;
};

extern void setrpcent (int __stayopen) __attribute__ ((__nothrow__ , __leaf=
__));
extern void endrpcent (void) __attribute__ ((__nothrow__ , __leaf__));
extern struct rpcent *getrpcbyname (const char *__name) __attribute__ ((__n=
othrow__ , __leaf__));
extern struct rpcent *getrpcbynumber (int __number) __attribute__ ((__nothr=
ow__ , __leaf__));
extern struct rpcent *getrpcent (void) __attribute__ ((__nothrow__ , __leaf=
__));


extern int getrpcbyname_r (const char *__name, struct rpcent *__result_buf,
      char *__buffer, size_t __buflen,
      struct rpcent **__result) __attribute__ ((__nothrow__ , __leaf__));

extern int getrpcbynumber_r (int __number, struct rpcent *__result_buf,
        char *__buffer, size_t __buflen,
        struct rpcent **__result) __attribute__ ((__nothrow__ , __leaf__));

extern int getrpcent_r (struct rpcent *__result_buf, char *__buffer,
   size_t __buflen, struct rpcent **__result) __attribute__ ((__nothrow__ ,=
 __leaf__));



# 33 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 2 3 4
# 42 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/netdb.h" 1 3 4
# 26 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/bits/netdb.h" 3 4
struct netent
{
  char *n_name;
  char **n_aliases;
  int n_addrtype;
  uint32_t n_net;
};
# 43 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 2 3 4


#define _PATH_HEQUIV "/etc/hosts.equiv"
#define _PATH_HOSTS "/etc/hosts"
#define _PATH_NETWORKS "/etc/networks"
#define _PATH_NSSWITCH_CONF "/etc/nsswitch.conf"
#define _PATH_PROTOCOLS "/etc/protocols"
#define _PATH_SERVICES "/etc/services"







#define h_errno (*__h_errno_location ())


extern int *__h_errno_location (void) __attribute__ ((__nothrow__ , __leaf_=
_)) __attribute__ ((__const__));



#define HOST_NOT_FOUND 1
#define TRY_AGAIN 2

#define NO_RECOVERY 3

#define NO_DATA 4



#define NETDB_INTERNAL -1
#define NETDB_SUCCESS 0
#define NO_ADDRESS NO_DATA




#define IPPORT_RESERVED 1024
# 92 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern void herror (const char *__str) __attribute__ ((__nothrow__ , __leaf=
__));


extern const char *hstrerror (int __err_num) __attribute__ ((__nothrow__ , =
__leaf__));




struct hostent
{
  char *h_name;
  char **h_aliases;
  int h_addrtype;
  int h_length;
  char **h_addr_list;

#define h_addr h_addr_list[0]

};






extern void sethostent (int __stay_open);





extern void endhostent (void);






extern struct hostent *gethostent (void);






extern struct hostent *gethostbyaddr (const void *__addr, __socklen_t __len=
,
          int __type);





extern struct hostent *gethostbyname (const char *__name);
# 155 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern struct hostent *gethostbyname2 (const char *__name, int __af);
# 167 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int gethostent_r (struct hostent *__restrict __result_buf,
    char *__restrict __buf, size_t __buflen,
    struct hostent **__restrict __result,
    int *__restrict __h_errnop);

extern int gethostbyaddr_r (const void *__restrict __addr, __socklen_t __le=
n,
       int __type,
       struct hostent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct hostent **__restrict __result,
       int *__restrict __h_errnop);

extern int gethostbyname_r (const char *__restrict __name,
       struct hostent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct hostent **__restrict __result,
       int *__restrict __h_errnop);

extern int gethostbyname2_r (const char *__restrict __name, int __af,
        struct hostent *__restrict __result_buf,
        char *__restrict __buf, size_t __buflen,
        struct hostent **__restrict __result,
        int *__restrict __h_errnop);
# 198 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern void setnetent (int __stay_open);





extern void endnetent (void);






extern struct netent *getnetent (void);






extern struct netent *getnetbyaddr (uint32_t __net, int __type);





extern struct netent *getnetbyname (const char *__name);
# 237 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int getnetent_r (struct netent *__restrict __result_buf,
   char *__restrict __buf, size_t __buflen,
   struct netent **__restrict __result,
   int *__restrict __h_errnop);

extern int getnetbyaddr_r (uint32_t __net, int __type,
      struct netent *__restrict __result_buf,
      char *__restrict __buf, size_t __buflen,
      struct netent **__restrict __result,
      int *__restrict __h_errnop);

extern int getnetbyname_r (const char *__restrict __name,
      struct netent *__restrict __result_buf,
      char *__restrict __buf, size_t __buflen,
      struct netent **__restrict __result,
      int *__restrict __h_errnop);




struct servent
{
  char *s_name;
  char **s_aliases;
  int s_port;
  char *s_proto;
};






extern void setservent (int __stay_open);





extern void endservent (void);






extern struct servent *getservent (void);






extern struct servent *getservbyname (const char *__name, const char *__pro=
to);






extern struct servent *getservbyport (int __port, const char *__proto);
# 308 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int getservent_r (struct servent *__restrict __result_buf,
    char *__restrict __buf, size_t __buflen,
    struct servent **__restrict __result);

extern int getservbyname_r (const char *__restrict __name,
       const char *__restrict __proto,
       struct servent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct servent **__restrict __result);

extern int getservbyport_r (int __port, const char *__restrict __proto,
       struct servent *__restrict __result_buf,
       char *__restrict __buf, size_t __buflen,
       struct servent **__restrict __result);




struct protoent
{
  char *p_name;
  char **p_aliases;
  int p_proto;
};






extern void setprotoent (int __stay_open);





extern void endprotoent (void);






extern struct protoent *getprotoent (void);





extern struct protoent *getprotobyname (const char *__name);





extern struct protoent *getprotobynumber (int __proto);
# 374 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int getprotoent_r (struct protoent *__restrict __result_buf,
     char *__restrict __buf, size_t __buflen,
     struct protoent **__restrict __result);

extern int getprotobyname_r (const char *__restrict __name,
        struct protoent *__restrict __result_buf,
        char *__restrict __buf, size_t __buflen,
        struct protoent **__restrict __result);

extern int getprotobynumber_r (int __proto,
          struct protoent *__restrict __result_buf,
          char *__restrict __buf, size_t __buflen,
          struct protoent **__restrict __result);
# 395 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int setnetgrent (const char *__netgroup);







extern void endnetgrent (void);
# 412 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int getnetgrent (char **__restrict __hostp,
   char **__restrict __userp,
   char **__restrict __domainp);
# 423 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int innetgr (const char *__netgroup, const char *__host,
      const char *__user, const char *__domain);







extern int getnetgrent_r (char **__restrict __hostp,
     char **__restrict __userp,
     char **__restrict __domainp,
     char *__restrict __buffer, size_t __buflen);
# 451 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int rcmd (char **__restrict __ahost, unsigned short int __rport,
   const char *__restrict __locuser,
   const char *__restrict __remuser,
   const char *__restrict __cmd, int *__restrict __fd2p);
# 463 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int rcmd_af (char **__restrict __ahost, unsigned short int __rport,
      const char *__restrict __locuser,
      const char *__restrict __remuser,
      const char *__restrict __cmd, int *__restrict __fd2p,
      sa_family_t __af);
# 479 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int rexec (char **__restrict __ahost, int __rport,
    const char *__restrict __name,
    const char *__restrict __pass,
    const char *__restrict __cmd, int *__restrict __fd2p);
# 491 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int rexec_af (char **__restrict __ahost, int __rport,
       const char *__restrict __name,
       const char *__restrict __pass,
       const char *__restrict __cmd, int *__restrict __fd2p,
       sa_family_t __af);
# 505 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int ruserok (const char *__rhost, int __suser,
      const char *__remuser, const char *__locuser);
# 515 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int ruserok_af (const char *__rhost, int __suser,
         const char *__remuser, const char *__locuser,
         sa_family_t __af);
# 528 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int iruserok (uint32_t __raddr, int __suser,
       const char *__remuser, const char *__locuser);
# 539 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int iruserok_af (const void *__raddr, int __suser,
   const char *__remuser, const char *__locuser,
   sa_family_t __af);
# 551 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int rresvport (int *__alport);
# 560 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int rresvport_af (int *__alport, sa_family_t __af);






struct addrinfo
{
  int ai_flags;
  int ai_family;
  int ai_socktype;
  int ai_protocol;
  socklen_t ai_addrlen;
  struct sockaddr *ai_addr;
  char *ai_canonname;
  struct addrinfo *ai_next;
};
# 598 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
#define AI_PASSIVE 0x0001
#define AI_CANONNAME 0x0002
#define AI_NUMERICHOST 0x0004
#define AI_V4MAPPED 0x0008
#define AI_ALL 0x0010
#define AI_ADDRCONFIG 0x0020
# 615 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
#define AI_NUMERICSERV 0x0400


#define EAI_BADFLAGS -1
#define EAI_NONAME -2
#define EAI_AGAIN -3
#define EAI_FAIL -4
#define EAI_FAMILY -6
#define EAI_SOCKTYPE -7
#define EAI_SERVICE -8
#define EAI_MEMORY -10
#define EAI_SYSTEM -11
#define EAI_OVERFLOW -12
# 640 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
#define NI_MAXHOST 1025
#define NI_MAXSERV 32


#define NI_NUMERICHOST 1
#define NI_NUMERICSERV 2
#define NI_NOFQDN 4
#define NI_NAMEREQD 8
#define NI_DGRAM 16
# 662 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4
extern int getaddrinfo (const char *__restrict __name,
   const char *__restrict __service,
   const struct addrinfo *__restrict __req,
   struct addrinfo **__restrict __pai);


extern void freeaddrinfo (struct addrinfo *__ai) __attribute__ ((__nothrow_=
_ , __leaf__));


extern const char *gai_strerror (int __ecode) __attribute__ ((__nothrow__ ,=
 __leaf__));





extern int getnameinfo (const struct sockaddr *__restrict __sa,
   socklen_t __salen, char *__restrict __host,
   socklen_t __hostlen, char *__restrict __serv,
   socklen_t __servlen, int __flags);
# 713 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/netdb.h" 3 4

# 80 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/pwd.h" 1 3 4
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/pwd.h" 3 4
#define _PWD_H 1







#define __need_size_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 34 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/pwd.h" 2 3 4
# 50 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/pwd.h" 3 4
struct passwd
{
  char *pw_name;
  char *pw_passwd;
  __uid_t pw_uid;
  __gid_t pw_gid;
  char *pw_gecos;
  char *pw_dir;
  char *pw_shell;
};



#define __need_FILE=20
# 73 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/pwd.h" 3 4
extern void setpwent (void);





extern void endpwent (void);





extern struct passwd *getpwent (void);
# 95 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/pwd.h" 3 4
extern struct passwd *fgetpwent (FILE *__stream);







extern int putpwent (const struct passwd *__restrict __p,
       FILE *__restrict __f);






extern struct passwd *getpwuid (__uid_t __uid);





extern struct passwd *getpwnam (const char *__name);






#define NSS_BUFLEN_PASSWD 1024
# 140 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/pwd.h" 3 4
extern int getpwent_r (struct passwd *__restrict __resultbuf,
         char *__restrict __buffer, size_t __buflen,
         struct passwd **__restrict __result);


extern int getpwuid_r (__uid_t __uid,
         struct passwd *__restrict __resultbuf,
         char *__restrict __buffer, size_t __buflen,
         struct passwd **__restrict __result);

extern int getpwnam_r (const char *__restrict __name,
         struct passwd *__restrict __resultbuf,
         char *__restrict __buffer, size_t __buflen,
         struct passwd **__restrict __result);
# 164 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/pwd.h" 3 4
extern int fgetpwent_r (FILE *__restrict __stream,
   struct passwd *__restrict __resultbuf,
   char *__restrict __buffer, size_t __buflen,
   struct passwd **__restrict __result);
# 184 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/pwd.h" 3 4

# 81 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/inttypes.h" 1 3 4
# 23 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/inttypes.h" 3 4
#define _INTTYPES_H 1
# 34 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/inttypes.h" 3 4
typedef unsigned int __gwchar_t;





#define ____gwchar_t_defined 1
# 52 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/inttypes.h" 3 4
#define __PRI64_PREFIX "ll"
#define __PRIPTR_PREFIX=20





#define PRId8 "d"
#define PRId16 "d"
#define PRId32 "d"
#define PRId64 __PRI64_PREFIX "d"

#define PRIdLEAST8 "d"
#define PRIdLEAST16 "d"
#define PRIdLEAST32 "d"
#define PRIdLEAST64 __PRI64_PREFIX "d"

#define PRIdFAST8 "d"
#define PRIdFAST16 __PRIPTR_PREFIX "d"
#define PRIdFAST32 __PRIPTR_PREFIX "d"
#define PRIdFAST64 __PRI64_PREFIX "d"


#define PRIi8 "i"
#define PRIi16 "i"
#define PRIi32 "i"
#define PRIi64 __PRI64_PREFIX "i"

#define PRIiLEAST8 "i"
#define PRIiLEAST16 "i"
#define PRIiLEAST32 "i"
#define PRIiLEAST64 __PRI64_PREFIX "i"

#define PRIiFAST8 "i"
#define PRIiFAST16 __PRIPTR_PREFIX "i"
#define PRIiFAST32 __PRIPTR_PREFIX "i"
#define PRIiFAST64 __PRI64_PREFIX "i"


#define PRIo8 "o"
#define PRIo16 "o"
#define PRIo32 "o"
#define PRIo64 __PRI64_PREFIX "o"

#define PRIoLEAST8 "o"
#define PRIoLEAST16 "o"
#define PRIoLEAST32 "o"
#define PRIoLEAST64 __PRI64_PREFIX "o"

#define PRIoFAST8 "o"
#define PRIoFAST16 __PRIPTR_PREFIX "o"
#define PRIoFAST32 __PRIPTR_PREFIX "o"
#define PRIoFAST64 __PRI64_PREFIX "o"


#define PRIu8 "u"
#define PRIu16 "u"
#define PRIu32 "u"
#define PRIu64 __PRI64_PREFIX "u"

#define PRIuLEAST8 "u"
#define PRIuLEAST16 "u"
#define PRIuLEAST32 "u"
#define PRIuLEAST64 __PRI64_PREFIX "u"

#define PRIuFAST8 "u"
#define PRIuFAST16 __PRIPTR_PREFIX "u"
#define PRIuFAST32 __PRIPTR_PREFIX "u"
#define PRIuFAST64 __PRI64_PREFIX "u"


#define PRIx8 "x"
#define PRIx16 "x"
#define PRIx32 "x"
#define PRIx64 __PRI64_PREFIX "x"

#define PRIxLEAST8 "x"
#define PRIxLEAST16 "x"
#define PRIxLEAST32 "x"
#define PRIxLEAST64 __PRI64_PREFIX "x"

#define PRIxFAST8 "x"
#define PRIxFAST16 __PRIPTR_PREFIX "x"
#define PRIxFAST32 __PRIPTR_PREFIX "x"
#define PRIxFAST64 __PRI64_PREFIX "x"


#define PRIX8 "X"
#define PRIX16 "X"
#define PRIX32 "X"
#define PRIX64 __PRI64_PREFIX "X"

#define PRIXLEAST8 "X"
#define PRIXLEAST16 "X"
#define PRIXLEAST32 "X"
#define PRIXLEAST64 __PRI64_PREFIX "X"

#define PRIXFAST8 "X"
#define PRIXFAST16 __PRIPTR_PREFIX "X"
#define PRIXFAST32 __PRIPTR_PREFIX "X"
#define PRIXFAST64 __PRI64_PREFIX "X"



#define PRIdMAX __PRI64_PREFIX "d"
#define PRIiMAX __PRI64_PREFIX "i"
#define PRIoMAX __PRI64_PREFIX "o"
#define PRIuMAX __PRI64_PREFIX "u"
#define PRIxMAX __PRI64_PREFIX "x"
#define PRIXMAX __PRI64_PREFIX "X"



#define PRIdPTR __PRIPTR_PREFIX "d"
#define PRIiPTR __PRIPTR_PREFIX "i"
#define PRIoPTR __PRIPTR_PREFIX "o"
#define PRIuPTR __PRIPTR_PREFIX "u"
#define PRIxPTR __PRIPTR_PREFIX "x"
#define PRIXPTR __PRIPTR_PREFIX "X"





#define SCNd8 "hhd"
#define SCNd16 "hd"
#define SCNd32 "d"
#define SCNd64 __PRI64_PREFIX "d"

#define SCNdLEAST8 "hhd"
#define SCNdLEAST16 "hd"
#define SCNdLEAST32 "d"
#define SCNdLEAST64 __PRI64_PREFIX "d"

#define SCNdFAST8 "hhd"
#define SCNdFAST16 __PRIPTR_PREFIX "d"
#define SCNdFAST32 __PRIPTR_PREFIX "d"
#define SCNdFAST64 __PRI64_PREFIX "d"


#define SCNi8 "hhi"
#define SCNi16 "hi"
#define SCNi32 "i"
#define SCNi64 __PRI64_PREFIX "i"

#define SCNiLEAST8 "hhi"
#define SCNiLEAST16 "hi"
#define SCNiLEAST32 "i"
#define SCNiLEAST64 __PRI64_PREFIX "i"

#define SCNiFAST8 "hhi"
#define SCNiFAST16 __PRIPTR_PREFIX "i"
#define SCNiFAST32 __PRIPTR_PREFIX "i"
#define SCNiFAST64 __PRI64_PREFIX "i"


#define SCNu8 "hhu"
#define SCNu16 "hu"
#define SCNu32 "u"
#define SCNu64 __PRI64_PREFIX "u"

#define SCNuLEAST8 "hhu"
#define SCNuLEAST16 "hu"
#define SCNuLEAST32 "u"
#define SCNuLEAST64 __PRI64_PREFIX "u"

#define SCNuFAST8 "hhu"
#define SCNuFAST16 __PRIPTR_PREFIX "u"
#define SCNuFAST32 __PRIPTR_PREFIX "u"
#define SCNuFAST64 __PRI64_PREFIX "u"


#define SCNo8 "hho"
#define SCNo16 "ho"
#define SCNo32 "o"
#define SCNo64 __PRI64_PREFIX "o"

#define SCNoLEAST8 "hho"
#define SCNoLEAST16 "ho"
#define SCNoLEAST32 "o"
#define SCNoLEAST64 __PRI64_PREFIX "o"

#define SCNoFAST8 "hho"
#define SCNoFAST16 __PRIPTR_PREFIX "o"
#define SCNoFAST32 __PRIPTR_PREFIX "o"
#define SCNoFAST64 __PRI64_PREFIX "o"


#define SCNx8 "hhx"
#define SCNx16 "hx"
#define SCNx32 "x"
#define SCNx64 __PRI64_PREFIX "x"

#define SCNxLEAST8 "hhx"
#define SCNxLEAST16 "hx"
#define SCNxLEAST32 "x"
#define SCNxLEAST64 __PRI64_PREFIX "x"

#define SCNxFAST8 "hhx"
#define SCNxFAST16 __PRIPTR_PREFIX "x"
#define SCNxFAST32 __PRIPTR_PREFIX "x"
#define SCNxFAST64 __PRI64_PREFIX "x"



#define SCNdMAX __PRI64_PREFIX "d"
#define SCNiMAX __PRI64_PREFIX "i"
#define SCNoMAX __PRI64_PREFIX "o"
#define SCNuMAX __PRI64_PREFIX "u"
#define SCNxMAX __PRI64_PREFIX "x"


#define SCNdPTR __PRIPTR_PREFIX "d"
#define SCNiPTR __PRIPTR_PREFIX "i"
#define SCNoPTR __PRIPTR_PREFIX "o"
#define SCNuPTR __PRIPTR_PREFIX "u"
#define SCNxPTR __PRIPTR_PREFIX "x"





# 287 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/inttypes.h" 3 4
typedef struct
  {
    long long int quot;
    long long int rem;
  } imaxdiv_t;





extern intmax_t imaxabs (intmax_t __n) __attribute__ ((__nothrow__ , __leaf=
__)) __attribute__ ((__const__));


extern imaxdiv_t imaxdiv (intmax_t __numer, intmax_t __denom)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern intmax_t strtoimax (const char *__restrict __nptr,
      char **__restrict __endptr, int __base) __attribute__ ((__nothrow__ ,=
 __leaf__));


extern uintmax_t strtoumax (const char *__restrict __nptr,
       char ** __restrict __endptr, int __base) __attribute__ ((__nothrow__=
 , __leaf__));


extern intmax_t wcstoimax (const __gwchar_t *__restrict __nptr,
      __gwchar_t **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__));


extern uintmax_t wcstoumax (const __gwchar_t *__restrict __nptr,
       __gwchar_t ** __restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__));
# 377 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/inttypes.h" 3 4
__extension__
extern long long int __strtoll_internal (const char *__restrict __nptr,
      char **__restrict __endptr,
      int __base, int __group)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))=
) ;

extern __inline intmax_t
__attribute__ ((__nothrow__ , __leaf__)) strtoimax (const char *__restrict =
nptr, char **__restrict endptr, int base)

{
  return __strtoll_internal (nptr, endptr, base, 0);
}

__extension__
extern unsigned long long int __strtoull_internal (const char *
         __restrict __nptr,
         char **
         __restrict __endptr,
         int __base,
         int __group)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))=
) ;

extern __inline uintmax_t
__attribute__ ((__nothrow__ , __leaf__)) strtoumax (const char *__restrict =
nptr, char **__restrict endptr, int base)

{
  return __strtoull_internal (nptr, endptr, base, 0);
}

__extension__
extern long long int __wcstoll_internal (const __gwchar_t *__restrict __npt=
r,
      __gwchar_t **__restrict __endptr,
      int __base, int __group)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))=
) ;

extern __inline intmax_t
__attribute__ ((__nothrow__ , __leaf__)) wcstoimax (const __gwchar_t *__res=
trict nptr, __gwchar_t **__restrict endptr, int base)

{
  return __wcstoll_internal (nptr, endptr, base, 0);
}


__extension__
extern unsigned long long int __wcstoull_internal (const __gwchar_t *
         __restrict __nptr,
         __gwchar_t **
         __restrict __endptr,
         int __base,
         int __group)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))=
) ;

extern __inline uintmax_t
__attribute__ ((__nothrow__ , __leaf__)) wcstoumax (const __gwchar_t *__res=
trict nptr, __gwchar_t **__restrict endptr, int base)

{
  return __wcstoull_internal (nptr, endptr, base, 0);
}





# 82 "util/util.h" 2
# 1 "util/../../../include/linux/magic.h" 1

#define __LINUX_MAGIC_H__=20

#define ADFS_SUPER_MAGIC 0xadf5
#define AFFS_SUPER_MAGIC 0xadff
#define AFS_SUPER_MAGIC 0x5346414F
#define AUTOFS_SUPER_MAGIC 0x0187
#define CODA_SUPER_MAGIC 0x73757245
#define CRAMFS_MAGIC 0x28cd3d45
#define CRAMFS_MAGIC_WEND 0x453dcd28
#define DEBUGFS_MAGIC 0x64626720
#define SYSFS_MAGIC 0x62656572
#define SECURITYFS_MAGIC 0x73636673
#define SELINUX_MAGIC 0xf97cff8c
#define RAMFS_MAGIC 0x858458f6
#define TMPFS_MAGIC 0x01021994
#define HUGETLBFS_MAGIC 0x958458f6
#define SQUASHFS_MAGIC 0x73717368
#define EFS_SUPER_MAGIC 0x414A53
#define EXT2_SUPER_MAGIC 0xEF53
#define EXT3_SUPER_MAGIC 0xEF53
#define XENFS_SUPER_MAGIC 0xabba1974
#define EXT4_SUPER_MAGIC 0xEF53
#define BTRFS_SUPER_MAGIC 0x9123683E
#define HPFS_SUPER_MAGIC 0xf995e849
#define ISOFS_SUPER_MAGIC 0x9660
#define JFFS2_SUPER_MAGIC 0x72b6
#define ANON_INODE_FS_MAGIC 0x09041934

#define MINIX_SUPER_MAGIC 0x137F
#define MINIX_SUPER_MAGIC2 0x138F
#define MINIX2_SUPER_MAGIC 0x2468
#define MINIX2_SUPER_MAGIC2 0x2478
#define MINIX3_SUPER_MAGIC 0x4d5a

#define MSDOS_SUPER_MAGIC 0x4d44
#define NCP_SUPER_MAGIC 0x564c
#define NFS_SUPER_MAGIC 0x6969
#define OPENPROM_SUPER_MAGIC 0x9fa1
#define PROC_SUPER_MAGIC 0x9fa0
#define QNX4_SUPER_MAGIC 0x002f

#define REISERFS_SUPER_MAGIC 0x52654973


#define REISERFS_SUPER_MAGIC_STRING "ReIsErFs"
#define REISER2FS_SUPER_MAGIC_STRING "ReIsEr2Fs"
#define REISER2FS_JR_SUPER_MAGIC_STRING "ReIsEr3Fs"

#define SMB_SUPER_MAGIC 0x517B
#define USBDEVICE_SUPER_MAGIC 0x9fa2
#define CGROUP_SUPER_MAGIC 0x27e0eb

#define FUTEXFS_SUPER_MAGIC 0xBAD1DEA

#define STACK_END_MAGIC 0x57AC6E9D

#define DEVPTS_SUPER_MAGIC 0x1cd1
#define SOCKFS_MAGIC 0x534F434B
# 83 "util/util.h" 2
# 1 "util/types.h" 1

#define __PERF_TYPES_H=20





typedef unsigned long long u64;
typedef signed long long s64;
typedef unsigned int u32;
typedef signed int s32;
typedef unsigned short u16;
typedef signed short s16;
typedef unsigned char u8;
typedef signed char s8;
# 84 "util/util.h" 2
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/ttydefaults.h" 1 3 4
# 85 "util/util.h" 2


# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/iconv.h" 1 3 4
# 19 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/iconv.h" 3 4
#define _ICONV_H 1


#define __need_size_t=20
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 1 3 4
# 158 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 234 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_size_t
# 343 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 397 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/=
gcc/arm-poky-linux-gnueabi/4.8.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 24 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/iconv.h" 2 3 4





typedef void *iconv_t;







extern iconv_t iconv_open (const char *__tocode, const char *__fromcode);




extern size_t iconv (iconv_t __cd, char **__restrict __inbuf,
       size_t *__restrict __inbytesleft,
       char **__restrict __outbuf,
       size_t *__restrict __outbytesleft);





extern int iconv_close (iconv_t __cd);


# 88 "util/util.h" 2


extern const char *graph_line;
extern const char *graph_dotted_line;
# 113 "util/util.h"
#define PATH_SEP ':'



#define STRIP_EXTENSION ""



#define has_dos_drive_prefix(path) 0



#define is_dir_sep(c) ((c) =3D=3D '/')



#define NORETURN __attribute__((__noreturn__))
# 138 "util/util.h"
extern void usage(const char *err) __attribute__((__noreturn__));
extern void die(const char *err, ...) __attribute__((__noreturn__)) __attri=
bute__((format (printf, 1, 2)));
extern int error(const char *err, ...) __attribute__((format (printf, 1, 2)=
));
extern void warning(const char *err, ...) __attribute__((format (printf, 1,=
 2)));

# 1 "util/../../../include/linux/stringify.h" 1

#define __LINUX_STRINGIFY_H=20






#define __stringify_1(x...) #x
#define __stringify(x...) __stringify_1(x)
# 144 "util/util.h" 2

#define DIE_IF(cnd) do { if (cnd) die(" at (" __FILE__ ":" __stringify(__LI=
NE__) "): " __stringify(cnd) "\n"); } while (0)






extern void set_die_routine(void (*routine)(const char *err, va_list params=
) __attribute__((__noreturn__)));

extern int prefixcmp(const char *str, const char *prefix);

static inline const char *skip_prefix(const char *str, const char *prefix)
{
 size_t len =3D strlen(prefix);
 return (__extension__ (__builtin_constant_p (len) && ((__builtin_constant_=
p (str) && strlen (str) < ((size_t) (len))) || (__builtin_constant_p (prefi=
x) && strlen (prefix) < ((size_t) (len)))) ? __extension__ ({ size_t __s1_l=
en, __s2_len; (__builtin_constant_p (str) && __builtin_constant_p (prefix) =
&& (__s1_len =3D strlen (str), __s2_len =3D strlen (prefix), (!((size_t)(co=
nst void *)((str) + 1) - (size_t)(const void *)(str) =3D=3D 1) || __s1_len =
>=3D 4) && (!((size_t)(const void *)((prefix) + 1) - (size_t)(const void *)=
(prefix) =3D=3D 1) || __s2_len >=3D 4)) ? __builtin_strcmp (str, prefix) : =
(__builtin_constant_p (str) && ((size_t)(const void *)((str) + 1) - (size_t=
)(const void *)(str) =3D=3D 1) && (__s1_len =3D strlen (str), __s1_len < 4)=
 ? (__builtin_constant_p (prefix) && ((size_t)(const void *)((prefix) + 1) =
- (size_t)(const void *)(prefix) =3D=3D 1) ? __builtin_strcmp (str, prefix)=
 : (__extension__ ({ const unsigned char *__s2 =3D (const unsigned char *) =
(const char *) (prefix); register int __result =3D (((const unsigned char *=
) (const char *) (str))[0] - __s2[0]); if (__s1_len > 0 && __result =3D=3D =
0) { __result =3D (((const unsigned char *) (const char *) (str))[1] - __s2=
[1]); if (__s1_len > 1 && __result =3D=3D 0) { __result =3D (((const unsign=
ed char *) (const char *) (str))[2] - __s2[2]); if (__s1_len > 2 && __resul=
t =3D=3D 0) __result =3D (((const unsigned char *) (const char *) (str))[3]=
 - __s2[3]); } } __result; }))) : (__builtin_constant_p (prefix) && ((size_=
t)(const void *)((prefix) + 1) - (size_t)(const void *)(prefix) =3D=3D 1) &=
& (__s2_len =3D strlen (prefix), __s2_len < 4) ? (__builtin_constant_p (str=
) && ((size_t)(const void *)((str) + 1) - (size_t)(const void *)(str) =3D=
=3D 1) ? __builtin_strcmp (str, prefix) : (__extension__ ({ const unsigned =
char *__s1 =3D (const unsigned char *) (const char *) (str); register int _=
_result =3D __s1[0] - ((const unsigned char *) (const char *) (prefix))[0];=
 if (__s2_len > 0 && __result =3D=3D 0) { __result =3D (__s1[1] - ((const u=
nsigned char *) (const char *) (prefix))[1]); if (__s2_len > 1 && __result =
=3D=3D 0) { __result =3D (__s1[2] - ((const unsigned char *) (const char *)=
 (prefix))[2]); if (__s2_len > 2 && __result =3D=3D 0) __result =3D (__s1[3=
] - ((const unsigned char *) (const char *) (prefix))[3]); } } __result; })=
)) : __builtin_strcmp (str, prefix)))); }) : strncmp (str, prefix, len))) ?=
 ((void *)0) : str + len;
}



#define HAVE_STRCHRNUL=20
# 181 "util/util.h"
extern char *xstrdup(const char *str);
extern void *xrealloc(void *ptr, size_t size) __attribute__((weak));


static inline void *zalloc(size_t size)
{
 return calloc(1, size);
}

static inline int has_extension(const char *filename, const char *ext)
{
 size_t len =3D strlen(filename);
 size_t extlen =3D strlen(ext);

 return len > extlen && !memcmp(filename + len - extlen, ext, extlen);
}


#undef isascii
#undef isspace
#undef isdigit
#undef isxdigit
#undef isalpha
#undef isprint
#undef isalnum
#undef tolower
#undef toupper

extern unsigned char sane_ctype[256];
#define GIT_SPACE 0x01
#define GIT_DIGIT 0x02
#define GIT_ALPHA 0x04
#define GIT_GLOB_SPECIAL 0x08
#define GIT_REGEX_SPECIAL 0x10
#define GIT_PRINT_EXTRA 0x20
#define GIT_PRINT 0x3E
#define sane_istest(x,mask) ((sane_ctype[(unsigned char)(x)] & (mask)) !=3D=
 0)
#define isascii(x) (((x) & ~0x7f) =3D=3D 0)
#define isspace(x) sane_istest(x,GIT_SPACE)
#define isdigit(x) sane_istest(x,GIT_DIGIT)
#define isxdigit(x) (sane_istest(toupper(x), GIT_ALPHA | GIT_DIGIT) && toup=
per(x) < 'G')

#define isalpha(x) sane_istest(x,GIT_ALPHA)
#define isalnum(x) sane_istest(x,GIT_ALPHA | GIT_DIGIT)
#define isprint(x) sane_istest(x,GIT_PRINT)
#define tolower(x) sane_case((unsigned char)(x), 0x20)
#define toupper(x) sane_case((unsigned char)(x), 0)

static inline int sane_case(int x, int high)
{
 if (((sane_ctype[(unsigned char)(x)] & (0x04)) !=3D 0))
  x =3D (x & ~0x20) | high;
 return x;
}


#define FORCE_DIR_SET_GID S_ISGID
# 251 "util/util.h"
#define ST_CTIME_NSEC(st) ((unsigned int)((st).st_ctim.tv_nsec))
#define ST_MTIME_NSEC(st) ((unsigned int)((st).st_mtim.tv_nsec))



int mkdir_p(char *path, mode_t mode);
int copyfile(const char *from, const char *to);

s64 perf_atoll(const char *str);
char **argv_split(const char *str, int *argcp);
void argv_free(char **argv);
_Bool strglobmatch(const char *str, const char *pat);
_Bool strlazymatch(const char *str, const char *pat);
unsigned long convert_unit(unsigned long value, char *unit);


#define ESC 27


static inline _Bool is_exit_key(int key)
{
 char up;
 if (key =3D=3D ('c'&037) || key =3D=3D 27)
  return 1;
 up =3D sane_case((unsigned char)(key), 0);
 return up =3D=3D 'Q';
}

#define _STR(x) #x
#define STR(x) _STR(x)
# 19 "util/callchain.c" 2
# 1 "util/callchain.h" 1

#define __PERF_CALLCHAIN_H=20

# 1 "util/../perf.h" 1

#define _PERF_PERF_H=20

struct winsize;

void get_term_dimensions(struct winsize *ws);
# 67 "util/../perf.h"
# 1 "util/../../../arch/arm/include/asm/unistd.h" 1
# 14 "util/../../../arch/arm/include/asm/unistd.h"
#define __ASM_ARM_UNISTD_H=20

#define __NR_OABI_SYSCALL_BASE 0x900000


#define __NR_SYSCALL_BASE 0
# 28 "util/../../../arch/arm/include/asm/unistd.h"
#define __NR_restart_syscall (__NR_SYSCALL_BASE+ 0)
#define __NR_exit (__NR_SYSCALL_BASE+ 1)
#define __NR_fork (__NR_SYSCALL_BASE+ 2)
#define __NR_read (__NR_SYSCALL_BASE+ 3)
#define __NR_write (__NR_SYSCALL_BASE+ 4)
#define __NR_open (__NR_SYSCALL_BASE+ 5)
#define __NR_close (__NR_SYSCALL_BASE+ 6)

#define __NR_creat (__NR_SYSCALL_BASE+ 8)
#define __NR_link (__NR_SYSCALL_BASE+ 9)
#define __NR_unlink (__NR_SYSCALL_BASE+ 10)
#define __NR_execve (__NR_SYSCALL_BASE+ 11)
#define __NR_chdir (__NR_SYSCALL_BASE+ 12)
#define __NR_time (__NR_SYSCALL_BASE+ 13)
#define __NR_mknod (__NR_SYSCALL_BASE+ 14)
#define __NR_chmod (__NR_SYSCALL_BASE+ 15)
#define __NR_lchown (__NR_SYSCALL_BASE+ 16)


#define __NR_lseek (__NR_SYSCALL_BASE+ 19)
#define __NR_getpid (__NR_SYSCALL_BASE+ 20)
#define __NR_mount (__NR_SYSCALL_BASE+ 21)
#define __NR_umount (__NR_SYSCALL_BASE+ 22)
#define __NR_setuid (__NR_SYSCALL_BASE+ 23)
#define __NR_getuid (__NR_SYSCALL_BASE+ 24)
#define __NR_stime (__NR_SYSCALL_BASE+ 25)
#define __NR_ptrace (__NR_SYSCALL_BASE+ 26)
#define __NR_alarm (__NR_SYSCALL_BASE+ 27)

#define __NR_pause (__NR_SYSCALL_BASE+ 29)
#define __NR_utime (__NR_SYSCALL_BASE+ 30)


#define __NR_access (__NR_SYSCALL_BASE+ 33)
#define __NR_nice (__NR_SYSCALL_BASE+ 34)

#define __NR_sync (__NR_SYSCALL_BASE+ 36)
#define __NR_kill (__NR_SYSCALL_BASE+ 37)
#define __NR_rename (__NR_SYSCALL_BASE+ 38)
#define __NR_mkdir (__NR_SYSCALL_BASE+ 39)
#define __NR_rmdir (__NR_SYSCALL_BASE+ 40)
#define __NR_dup (__NR_SYSCALL_BASE+ 41)
#define __NR_pipe (__NR_SYSCALL_BASE+ 42)
#define __NR_times (__NR_SYSCALL_BASE+ 43)

#define __NR_brk (__NR_SYSCALL_BASE+ 45)
#define __NR_setgid (__NR_SYSCALL_BASE+ 46)
#define __NR_getgid (__NR_SYSCALL_BASE+ 47)

#define __NR_geteuid (__NR_SYSCALL_BASE+ 49)
#define __NR_getegid (__NR_SYSCALL_BASE+ 50)
#define __NR_acct (__NR_SYSCALL_BASE+ 51)
#define __NR_umount2 (__NR_SYSCALL_BASE+ 52)

#define __NR_ioctl (__NR_SYSCALL_BASE+ 54)
#define __NR_fcntl (__NR_SYSCALL_BASE+ 55)

#define __NR_setpgid (__NR_SYSCALL_BASE+ 57)


#define __NR_umask (__NR_SYSCALL_BASE+ 60)
#define __NR_chroot (__NR_SYSCALL_BASE+ 61)
#define __NR_ustat (__NR_SYSCALL_BASE+ 62)
#define __NR_dup2 (__NR_SYSCALL_BASE+ 63)
#define __NR_getppid (__NR_SYSCALL_BASE+ 64)
#define __NR_getpgrp (__NR_SYSCALL_BASE+ 65)
#define __NR_setsid (__NR_SYSCALL_BASE+ 66)
#define __NR_sigaction (__NR_SYSCALL_BASE+ 67)


#define __NR_setreuid (__NR_SYSCALL_BASE+ 70)
#define __NR_setregid (__NR_SYSCALL_BASE+ 71)
#define __NR_sigsuspend (__NR_SYSCALL_BASE+ 72)
#define __NR_sigpending (__NR_SYSCALL_BASE+ 73)
#define __NR_sethostname (__NR_SYSCALL_BASE+ 74)
#define __NR_setrlimit (__NR_SYSCALL_BASE+ 75)
#define __NR_getrlimit (__NR_SYSCALL_BASE+ 76)
#define __NR_getrusage (__NR_SYSCALL_BASE+ 77)
#define __NR_gettimeofday (__NR_SYSCALL_BASE+ 78)
#define __NR_settimeofday (__NR_SYSCALL_BASE+ 79)
#define __NR_getgroups (__NR_SYSCALL_BASE+ 80)
#define __NR_setgroups (__NR_SYSCALL_BASE+ 81)
#define __NR_select (__NR_SYSCALL_BASE+ 82)
#define __NR_symlink (__NR_SYSCALL_BASE+ 83)

#define __NR_readlink (__NR_SYSCALL_BASE+ 85)
#define __NR_uselib (__NR_SYSCALL_BASE+ 86)
#define __NR_swapon (__NR_SYSCALL_BASE+ 87)
#define __NR_reboot (__NR_SYSCALL_BASE+ 88)
#define __NR_readdir (__NR_SYSCALL_BASE+ 89)
#define __NR_mmap (__NR_SYSCALL_BASE+ 90)
#define __NR_munmap (__NR_SYSCALL_BASE+ 91)
#define __NR_truncate (__NR_SYSCALL_BASE+ 92)
#define __NR_ftruncate (__NR_SYSCALL_BASE+ 93)
#define __NR_fchmod (__NR_SYSCALL_BASE+ 94)
#define __NR_fchown (__NR_SYSCALL_BASE+ 95)
#define __NR_getpriority (__NR_SYSCALL_BASE+ 96)
#define __NR_setpriority (__NR_SYSCALL_BASE+ 97)

#define __NR_statfs (__NR_SYSCALL_BASE+ 99)
#define __NR_fstatfs (__NR_SYSCALL_BASE+100)

#define __NR_socketcall (__NR_SYSCALL_BASE+102)
#define __NR_syslog (__NR_SYSCALL_BASE+103)
#define __NR_setitimer (__NR_SYSCALL_BASE+104)
#define __NR_getitimer (__NR_SYSCALL_BASE+105)
#define __NR_stat (__NR_SYSCALL_BASE+106)
#define __NR_lstat (__NR_SYSCALL_BASE+107)
#define __NR_fstat (__NR_SYSCALL_BASE+108)


#define __NR_vhangup (__NR_SYSCALL_BASE+111)

#define __NR_syscall (__NR_SYSCALL_BASE+113)
#define __NR_wait4 (__NR_SYSCALL_BASE+114)
#define __NR_swapoff (__NR_SYSCALL_BASE+115)
#define __NR_sysinfo (__NR_SYSCALL_BASE+116)
#define __NR_ipc (__NR_SYSCALL_BASE+117)
#define __NR_fsync (__NR_SYSCALL_BASE+118)
#define __NR_sigreturn (__NR_SYSCALL_BASE+119)
#define __NR_clone (__NR_SYSCALL_BASE+120)
#define __NR_setdomainname (__NR_SYSCALL_BASE+121)
#define __NR_uname (__NR_SYSCALL_BASE+122)

#define __NR_adjtimex (__NR_SYSCALL_BASE+124)
#define __NR_mprotect (__NR_SYSCALL_BASE+125)
#define __NR_sigprocmask (__NR_SYSCALL_BASE+126)

#define __NR_init_module (__NR_SYSCALL_BASE+128)
#define __NR_delete_module (__NR_SYSCALL_BASE+129)

#define __NR_quotactl (__NR_SYSCALL_BASE+131)
#define __NR_getpgid (__NR_SYSCALL_BASE+132)
#define __NR_fchdir (__NR_SYSCALL_BASE+133)
#define __NR_bdflush (__NR_SYSCALL_BASE+134)
#define __NR_sysfs (__NR_SYSCALL_BASE+135)
#define __NR_personality (__NR_SYSCALL_BASE+136)

#define __NR_setfsuid (__NR_SYSCALL_BASE+138)
#define __NR_setfsgid (__NR_SYSCALL_BASE+139)
#define __NR__llseek (__NR_SYSCALL_BASE+140)
#define __NR_getdents (__NR_SYSCALL_BASE+141)
#define __NR__newselect (__NR_SYSCALL_BASE+142)
#define __NR_flock (__NR_SYSCALL_BASE+143)
#define __NR_msync (__NR_SYSCALL_BASE+144)
#define __NR_readv (__NR_SYSCALL_BASE+145)
#define __NR_writev (__NR_SYSCALL_BASE+146)
#define __NR_getsid (__NR_SYSCALL_BASE+147)
#define __NR_fdatasync (__NR_SYSCALL_BASE+148)
#define __NR__sysctl (__NR_SYSCALL_BASE+149)
#define __NR_mlock (__NR_SYSCALL_BASE+150)
#define __NR_munlock (__NR_SYSCALL_BASE+151)
#define __NR_mlockall (__NR_SYSCALL_BASE+152)
#define __NR_munlockall (__NR_SYSCALL_BASE+153)
#define __NR_sched_setparam (__NR_SYSCALL_BASE+154)
#define __NR_sched_getparam (__NR_SYSCALL_BASE+155)
#define __NR_sched_setscheduler (__NR_SYSCALL_BASE+156)
#define __NR_sched_getscheduler (__NR_SYSCALL_BASE+157)
#define __NR_sched_yield (__NR_SYSCALL_BASE+158)
#define __NR_sched_get_priority_max (__NR_SYSCALL_BASE+159)
#define __NR_sched_get_priority_min (__NR_SYSCALL_BASE+160)
#define __NR_sched_rr_get_interval (__NR_SYSCALL_BASE+161)
#define __NR_nanosleep (__NR_SYSCALL_BASE+162)
#define __NR_mremap (__NR_SYSCALL_BASE+163)
#define __NR_setresuid (__NR_SYSCALL_BASE+164)
#define __NR_getresuid (__NR_SYSCALL_BASE+165)


#define __NR_poll (__NR_SYSCALL_BASE+168)
#define __NR_nfsservctl (__NR_SYSCALL_BASE+169)
#define __NR_setresgid (__NR_SYSCALL_BASE+170)
#define __NR_getresgid (__NR_SYSCALL_BASE+171)
#define __NR_prctl (__NR_SYSCALL_BASE+172)
#define __NR_rt_sigreturn (__NR_SYSCALL_BASE+173)
#define __NR_rt_sigaction (__NR_SYSCALL_BASE+174)
#define __NR_rt_sigprocmask (__NR_SYSCALL_BASE+175)
#define __NR_rt_sigpending (__NR_SYSCALL_BASE+176)
#define __NR_rt_sigtimedwait (__NR_SYSCALL_BASE+177)
#define __NR_rt_sigqueueinfo (__NR_SYSCALL_BASE+178)
#define __NR_rt_sigsuspend (__NR_SYSCALL_BASE+179)
#define __NR_pread64 (__NR_SYSCALL_BASE+180)
#define __NR_pwrite64 (__NR_SYSCALL_BASE+181)
#define __NR_chown (__NR_SYSCALL_BASE+182)
#define __NR_getcwd (__NR_SYSCALL_BASE+183)
#define __NR_capget (__NR_SYSCALL_BASE+184)
#define __NR_capset (__NR_SYSCALL_BASE+185)
#define __NR_sigaltstack (__NR_SYSCALL_BASE+186)
#define __NR_sendfile (__NR_SYSCALL_BASE+187)


#define __NR_vfork (__NR_SYSCALL_BASE+190)
#define __NR_ugetrlimit (__NR_SYSCALL_BASE+191)
#define __NR_mmap2 (__NR_SYSCALL_BASE+192)
#define __NR_truncate64 (__NR_SYSCALL_BASE+193)
#define __NR_ftruncate64 (__NR_SYSCALL_BASE+194)
#define __NR_stat64 (__NR_SYSCALL_BASE+195)
#define __NR_lstat64 (__NR_SYSCALL_BASE+196)
#define __NR_fstat64 (__NR_SYSCALL_BASE+197)
#define __NR_lchown32 (__NR_SYSCALL_BASE+198)
#define __NR_getuid32 (__NR_SYSCALL_BASE+199)
#define __NR_getgid32 (__NR_SYSCALL_BASE+200)
#define __NR_geteuid32 (__NR_SYSCALL_BASE+201)
#define __NR_getegid32 (__NR_SYSCALL_BASE+202)
#define __NR_setreuid32 (__NR_SYSCALL_BASE+203)
#define __NR_setregid32 (__NR_SYSCALL_BASE+204)
#define __NR_getgroups32 (__NR_SYSCALL_BASE+205)
#define __NR_setgroups32 (__NR_SYSCALL_BASE+206)
#define __NR_fchown32 (__NR_SYSCALL_BASE+207)
#define __NR_setresuid32 (__NR_SYSCALL_BASE+208)
#define __NR_getresuid32 (__NR_SYSCALL_BASE+209)
#define __NR_setresgid32 (__NR_SYSCALL_BASE+210)
#define __NR_getresgid32 (__NR_SYSCALL_BASE+211)
#define __NR_chown32 (__NR_SYSCALL_BASE+212)
#define __NR_setuid32 (__NR_SYSCALL_BASE+213)
#define __NR_setgid32 (__NR_SYSCALL_BASE+214)
#define __NR_setfsuid32 (__NR_SYSCALL_BASE+215)
#define __NR_setfsgid32 (__NR_SYSCALL_BASE+216)
#define __NR_getdents64 (__NR_SYSCALL_BASE+217)
#define __NR_pivot_root (__NR_SYSCALL_BASE+218)
#define __NR_mincore (__NR_SYSCALL_BASE+219)
#define __NR_madvise (__NR_SYSCALL_BASE+220)
#define __NR_fcntl64 (__NR_SYSCALL_BASE+221)


#define __NR_gettid (__NR_SYSCALL_BASE+224)
#define __NR_readahead (__NR_SYSCALL_BASE+225)
#define __NR_setxattr (__NR_SYSCALL_BASE+226)
#define __NR_lsetxattr (__NR_SYSCALL_BASE+227)
#define __NR_fsetxattr (__NR_SYSCALL_BASE+228)
#define __NR_getxattr (__NR_SYSCALL_BASE+229)
#define __NR_lgetxattr (__NR_SYSCALL_BASE+230)
#define __NR_fgetxattr (__NR_SYSCALL_BASE+231)
#define __NR_listxattr (__NR_SYSCALL_BASE+232)
#define __NR_llistxattr (__NR_SYSCALL_BASE+233)
#define __NR_flistxattr (__NR_SYSCALL_BASE+234)
#define __NR_removexattr (__NR_SYSCALL_BASE+235)
#define __NR_lremovexattr (__NR_SYSCALL_BASE+236)
#define __NR_fremovexattr (__NR_SYSCALL_BASE+237)
#define __NR_tkill (__NR_SYSCALL_BASE+238)
#define __NR_sendfile64 (__NR_SYSCALL_BASE+239)
#define __NR_futex (__NR_SYSCALL_BASE+240)
#define __NR_sched_setaffinity (__NR_SYSCALL_BASE+241)
#define __NR_sched_getaffinity (__NR_SYSCALL_BASE+242)
#define __NR_io_setup (__NR_SYSCALL_BASE+243)
#define __NR_io_destroy (__NR_SYSCALL_BASE+244)
#define __NR_io_getevents (__NR_SYSCALL_BASE+245)
#define __NR_io_submit (__NR_SYSCALL_BASE+246)
#define __NR_io_cancel (__NR_SYSCALL_BASE+247)
#define __NR_exit_group (__NR_SYSCALL_BASE+248)
#define __NR_lookup_dcookie (__NR_SYSCALL_BASE+249)
#define __NR_epoll_create (__NR_SYSCALL_BASE+250)
#define __NR_epoll_ctl (__NR_SYSCALL_BASE+251)
#define __NR_epoll_wait (__NR_SYSCALL_BASE+252)
#define __NR_remap_file_pages (__NR_SYSCALL_BASE+253)


#define __NR_set_tid_address (__NR_SYSCALL_BASE+256)
#define __NR_timer_create (__NR_SYSCALL_BASE+257)
#define __NR_timer_settime (__NR_SYSCALL_BASE+258)
#define __NR_timer_gettime (__NR_SYSCALL_BASE+259)
#define __NR_timer_getoverrun (__NR_SYSCALL_BASE+260)
#define __NR_timer_delete (__NR_SYSCALL_BASE+261)
#define __NR_clock_settime (__NR_SYSCALL_BASE+262)
#define __NR_clock_gettime (__NR_SYSCALL_BASE+263)
#define __NR_clock_getres (__NR_SYSCALL_BASE+264)
#define __NR_clock_nanosleep (__NR_SYSCALL_BASE+265)
#define __NR_statfs64 (__NR_SYSCALL_BASE+266)
#define __NR_fstatfs64 (__NR_SYSCALL_BASE+267)
#define __NR_tgkill (__NR_SYSCALL_BASE+268)
#define __NR_utimes (__NR_SYSCALL_BASE+269)
#define __NR_arm_fadvise64_64 (__NR_SYSCALL_BASE+270)
#define __NR_pciconfig_iobase (__NR_SYSCALL_BASE+271)
#define __NR_pciconfig_read (__NR_SYSCALL_BASE+272)
#define __NR_pciconfig_write (__NR_SYSCALL_BASE+273)
#define __NR_mq_open (__NR_SYSCALL_BASE+274)
#define __NR_mq_unlink (__NR_SYSCALL_BASE+275)
#define __NR_mq_timedsend (__NR_SYSCALL_BASE+276)
#define __NR_mq_timedreceive (__NR_SYSCALL_BASE+277)
#define __NR_mq_notify (__NR_SYSCALL_BASE+278)
#define __NR_mq_getsetattr (__NR_SYSCALL_BASE+279)
#define __NR_waitid (__NR_SYSCALL_BASE+280)
#define __NR_socket (__NR_SYSCALL_BASE+281)
#define __NR_bind (__NR_SYSCALL_BASE+282)
#define __NR_connect (__NR_SYSCALL_BASE+283)
#define __NR_listen (__NR_SYSCALL_BASE+284)
#define __NR_accept (__NR_SYSCALL_BASE+285)
#define __NR_getsockname (__NR_SYSCALL_BASE+286)
#define __NR_getpeername (__NR_SYSCALL_BASE+287)
#define __NR_socketpair (__NR_SYSCALL_BASE+288)
#define __NR_send (__NR_SYSCALL_BASE+289)
#define __NR_sendto (__NR_SYSCALL_BASE+290)
#define __NR_recv (__NR_SYSCALL_BASE+291)
#define __NR_recvfrom (__NR_SYSCALL_BASE+292)
#define __NR_shutdown (__NR_SYSCALL_BASE+293)
#define __NR_setsockopt (__NR_SYSCALL_BASE+294)
#define __NR_getsockopt (__NR_SYSCALL_BASE+295)
#define __NR_sendmsg (__NR_SYSCALL_BASE+296)
#define __NR_recvmsg (__NR_SYSCALL_BASE+297)
#define __NR_semop (__NR_SYSCALL_BASE+298)
#define __NR_semget (__NR_SYSCALL_BASE+299)
#define __NR_semctl (__NR_SYSCALL_BASE+300)
#define __NR_msgsnd (__NR_SYSCALL_BASE+301)
#define __NR_msgrcv (__NR_SYSCALL_BASE+302)
#define __NR_msgget (__NR_SYSCALL_BASE+303)
#define __NR_msgctl (__NR_SYSCALL_BASE+304)
#define __NR_shmat (__NR_SYSCALL_BASE+305)
#define __NR_shmdt (__NR_SYSCALL_BASE+306)
#define __NR_shmget (__NR_SYSCALL_BASE+307)
#define __NR_shmctl (__NR_SYSCALL_BASE+308)
#define __NR_add_key (__NR_SYSCALL_BASE+309)
#define __NR_request_key (__NR_SYSCALL_BASE+310)
#define __NR_keyctl (__NR_SYSCALL_BASE+311)
#define __NR_semtimedop (__NR_SYSCALL_BASE+312)
#define __NR_vserver (__NR_SYSCALL_BASE+313)
#define __NR_ioprio_set (__NR_SYSCALL_BASE+314)
#define __NR_ioprio_get (__NR_SYSCALL_BASE+315)
#define __NR_inotify_init (__NR_SYSCALL_BASE+316)
#define __NR_inotify_add_watch (__NR_SYSCALL_BASE+317)
#define __NR_inotify_rm_watch (__NR_SYSCALL_BASE+318)
#define __NR_mbind (__NR_SYSCALL_BASE+319)
#define __NR_get_mempolicy (__NR_SYSCALL_BASE+320)
#define __NR_set_mempolicy (__NR_SYSCALL_BASE+321)
#define __NR_openat (__NR_SYSCALL_BASE+322)
#define __NR_mkdirat (__NR_SYSCALL_BASE+323)
#define __NR_mknodat (__NR_SYSCALL_BASE+324)
#define __NR_fchownat (__NR_SYSCALL_BASE+325)
#define __NR_futimesat (__NR_SYSCALL_BASE+326)
#define __NR_fstatat64 (__NR_SYSCALL_BASE+327)
#define __NR_unlinkat (__NR_SYSCALL_BASE+328)
#define __NR_renameat (__NR_SYSCALL_BASE+329)
#define __NR_linkat (__NR_SYSCALL_BASE+330)
#define __NR_symlinkat (__NR_SYSCALL_BASE+331)
#define __NR_readlinkat (__NR_SYSCALL_BASE+332)
#define __NR_fchmodat (__NR_SYSCALL_BASE+333)
#define __NR_faccessat (__NR_SYSCALL_BASE+334)
#define __NR_pselect6 (__NR_SYSCALL_BASE+335)
#define __NR_ppoll (__NR_SYSCALL_BASE+336)
#define __NR_unshare (__NR_SYSCALL_BASE+337)
#define __NR_set_robust_list (__NR_SYSCALL_BASE+338)
#define __NR_get_robust_list (__NR_SYSCALL_BASE+339)
#define __NR_splice (__NR_SYSCALL_BASE+340)
#define __NR_arm_sync_file_range (__NR_SYSCALL_BASE+341)
#define __NR_sync_file_range2 __NR_arm_sync_file_range
#define __NR_tee (__NR_SYSCALL_BASE+342)
#define __NR_vmsplice (__NR_SYSCALL_BASE+343)
#define __NR_move_pages (__NR_SYSCALL_BASE+344)
#define __NR_getcpu (__NR_SYSCALL_BASE+345)
#define __NR_epoll_pwait (__NR_SYSCALL_BASE+346)
#define __NR_kexec_load (__NR_SYSCALL_BASE+347)
#define __NR_utimensat (__NR_SYSCALL_BASE+348)
#define __NR_signalfd (__NR_SYSCALL_BASE+349)
#define __NR_timerfd_create (__NR_SYSCALL_BASE+350)
#define __NR_eventfd (__NR_SYSCALL_BASE+351)
#define __NR_fallocate (__NR_SYSCALL_BASE+352)
#define __NR_timerfd_settime (__NR_SYSCALL_BASE+353)
#define __NR_timerfd_gettime (__NR_SYSCALL_BASE+354)
#define __NR_signalfd4 (__NR_SYSCALL_BASE+355)
#define __NR_eventfd2 (__NR_SYSCALL_BASE+356)
#define __NR_epoll_create1 (__NR_SYSCALL_BASE+357)
#define __NR_dup3 (__NR_SYSCALL_BASE+358)
#define __NR_pipe2 (__NR_SYSCALL_BASE+359)
#define __NR_inotify_init1 (__NR_SYSCALL_BASE+360)
#define __NR_preadv (__NR_SYSCALL_BASE+361)
#define __NR_pwritev (__NR_SYSCALL_BASE+362)
#define __NR_rt_tgsigqueueinfo (__NR_SYSCALL_BASE+363)
#define __NR_perf_event_open (__NR_SYSCALL_BASE+364)
#define __NR_recvmmsg (__NR_SYSCALL_BASE+365)
#define __NR_accept4 (__NR_SYSCALL_BASE+366)




#define __ARM_NR_BASE (__NR_SYSCALL_BASE+0x0f0000)
#define __ARM_NR_breakpoint (__ARM_NR_BASE+1)
#define __ARM_NR_cacheflush (__ARM_NR_BASE+2)
#define __ARM_NR_usr26 (__ARM_NR_BASE+3)
#define __ARM_NR_usr32 (__ARM_NR_BASE+4)
#define __ARM_NR_set_tls (__ARM_NR_BASE+5)
# 420 "util/../../../arch/arm/include/asm/unistd.h"
#undef __NR_time
#undef __NR_umount
#undef __NR_stime
#undef __NR_alarm
#undef __NR_utime
#undef __NR_getrlimit
#undef __NR_select
#undef __NR_readdir
#undef __NR_mmap
#undef __NR_socketcall
#undef __NR_syscall
#undef __NR_ipc
# 68 "util/../perf.h" 2




#define rmb() ((void(*)(void))0xffff0fa0)()
#define cpu_relax() asm volatile("":::"memory")





# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/sys/syscall.h" 1 3 4
# 19 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/syscall.h" 3 4
#define _SYSCALL_H 1




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/unistd.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/syscall.h" 2 3 4






# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/syscall.h" 1 3 4
# 9 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/bits/syscall.h" 3 4
#define SYS_OABI_SYSCALL_BASE __NR_OABI_SYSCALL_BASE
#define SYS_SYSCALL_BASE __NR_SYSCALL_BASE
#define SYS__llseek __NR__llseek
#define SYS__newselect __NR__newselect
#define SYS__sysctl __NR__sysctl
#define SYS_accept __NR_accept
#define SYS_accept4 __NR_accept4
#define SYS_access __NR_access
#define SYS_acct __NR_acct
#define SYS_add_key __NR_add_key
#define SYS_adjtimex __NR_adjtimex
#define SYS_arm_fadvise64_64 __NR_arm_fadvise64_64
#define SYS_arm_sync_file_range __NR_arm_sync_file_range
#define SYS_bdflush __NR_bdflush
#define SYS_bind __NR_bind
#define SYS_brk __NR_brk
#define SYS_capget __NR_capget
#define SYS_capset __NR_capset
#define SYS_chdir __NR_chdir
#define SYS_chmod __NR_chmod
#define SYS_chown __NR_chown
#define SYS_chown32 __NR_chown32
#define SYS_chroot __NR_chroot
#define SYS_clock_adjtime __NR_clock_adjtime
#define SYS_clock_getres __NR_clock_getres
#define SYS_clock_gettime __NR_clock_gettime
#define SYS_clock_nanosleep __NR_clock_nanosleep
#define SYS_clock_settime __NR_clock_settime
#define SYS_clone __NR_clone
#define SYS_close __NR_close
#define SYS_connect __NR_connect
#define SYS_creat __NR_creat
#define SYS_delete_module __NR_delete_module
#define SYS_dup __NR_dup
#define SYS_dup2 __NR_dup2
#define SYS_dup3 __NR_dup3
#define SYS_epoll_create __NR_epoll_create
#define SYS_epoll_create1 __NR_epoll_create1
#define SYS_epoll_ctl __NR_epoll_ctl
#define SYS_epoll_pwait __NR_epoll_pwait
#define SYS_epoll_wait __NR_epoll_wait
#define SYS_eventfd __NR_eventfd
#define SYS_eventfd2 __NR_eventfd2
#define SYS_execve __NR_execve
#define SYS_exit __NR_exit
#define SYS_exit_group __NR_exit_group
#define SYS_faccessat __NR_faccessat
#define SYS_fallocate __NR_fallocate
#define SYS_fanotify_init __NR_fanotify_init
#define SYS_fanotify_mark __NR_fanotify_mark
#define SYS_fchdir __NR_fchdir
#define SYS_fchmod __NR_fchmod
#define SYS_fchmodat __NR_fchmodat
#define SYS_fchown __NR_fchown
#define SYS_fchown32 __NR_fchown32
#define SYS_fchownat __NR_fchownat
#define SYS_fcntl __NR_fcntl
#define SYS_fcntl64 __NR_fcntl64
#define SYS_fdatasync __NR_fdatasync
#define SYS_fgetxattr __NR_fgetxattr
#define SYS_finit_module __NR_finit_module
#define SYS_flistxattr __NR_flistxattr
#define SYS_flock __NR_flock
#define SYS_fork __NR_fork
#define SYS_fremovexattr __NR_fremovexattr
#define SYS_fsetxattr __NR_fsetxattr
#define SYS_fstat __NR_fstat
#define SYS_fstat64 __NR_fstat64
#define SYS_fstatat64 __NR_fstatat64
#define SYS_fstatfs __NR_fstatfs
#define SYS_fstatfs64 __NR_fstatfs64
#define SYS_fsync __NR_fsync
#define SYS_ftruncate __NR_ftruncate
#define SYS_ftruncate64 __NR_ftruncate64
#define SYS_futex __NR_futex
#define SYS_futimesat __NR_futimesat
#define SYS_get_mempolicy __NR_get_mempolicy
#define SYS_get_robust_list __NR_get_robust_list
#define SYS_getcpu __NR_getcpu
#define SYS_getcwd __NR_getcwd
#define SYS_getdents __NR_getdents
#define SYS_getdents64 __NR_getdents64
#define SYS_getegid __NR_getegid
#define SYS_getegid32 __NR_getegid32
#define SYS_geteuid __NR_geteuid
#define SYS_geteuid32 __NR_geteuid32
#define SYS_getgid __NR_getgid
#define SYS_getgid32 __NR_getgid32
#define SYS_getgroups __NR_getgroups
#define SYS_getgroups32 __NR_getgroups32
#define SYS_getitimer __NR_getitimer
#define SYS_getpeername __NR_getpeername
#define SYS_getpgid __NR_getpgid
#define SYS_getpgrp __NR_getpgrp
#define SYS_getpid __NR_getpid
#define SYS_getppid __NR_getppid
#define SYS_getpriority __NR_getpriority
#define SYS_getresgid __NR_getresgid
#define SYS_getresgid32 __NR_getresgid32
#define SYS_getresuid __NR_getresuid
#define SYS_getresuid32 __NR_getresuid32
#define SYS_getrusage __NR_getrusage
#define SYS_getsid __NR_getsid
#define SYS_getsockname __NR_getsockname
#define SYS_getsockopt __NR_getsockopt
#define SYS_gettid __NR_gettid
#define SYS_gettimeofday __NR_gettimeofday
#define SYS_getuid __NR_getuid
#define SYS_getuid32 __NR_getuid32
#define SYS_getxattr __NR_getxattr
#define SYS_init_module __NR_init_module
#define SYS_inotify_add_watch __NR_inotify_add_watch
#define SYS_inotify_init __NR_inotify_init
#define SYS_inotify_init1 __NR_inotify_init1
#define SYS_inotify_rm_watch __NR_inotify_rm_watch
#define SYS_io_cancel __NR_io_cancel
#define SYS_io_destroy __NR_io_destroy
#define SYS_io_getevents __NR_io_getevents
#define SYS_io_setup __NR_io_setup
#define SYS_io_submit __NR_io_submit
#define SYS_ioctl __NR_ioctl
#define SYS_ioprio_get __NR_ioprio_get
#define SYS_ioprio_set __NR_ioprio_set
#define SYS_kexec_load __NR_kexec_load
#define SYS_keyctl __NR_keyctl
#define SYS_kill __NR_kill
#define SYS_lchown __NR_lchown
#define SYS_lchown32 __NR_lchown32
#define SYS_lgetxattr __NR_lgetxattr
#define SYS_link __NR_link
#define SYS_linkat __NR_linkat
#define SYS_listen __NR_listen
#define SYS_listxattr __NR_listxattr
#define SYS_llistxattr __NR_llistxattr
#define SYS_lookup_dcookie __NR_lookup_dcookie
#define SYS_lremovexattr __NR_lremovexattr
#define SYS_lseek __NR_lseek
#define SYS_lsetxattr __NR_lsetxattr
#define SYS_lstat __NR_lstat
#define SYS_lstat64 __NR_lstat64
#define SYS_madvise __NR_madvise
#define SYS_mbind __NR_mbind
#define SYS_mincore __NR_mincore
#define SYS_mkdir __NR_mkdir
#define SYS_mkdirat __NR_mkdirat
#define SYS_mknod __NR_mknod
#define SYS_mknodat __NR_mknodat
#define SYS_mlock __NR_mlock
#define SYS_mlockall __NR_mlockall
#define SYS_mmap2 __NR_mmap2
#define SYS_mount __NR_mount
#define SYS_move_pages __NR_move_pages
#define SYS_mprotect __NR_mprotect
#define SYS_mq_getsetattr __NR_mq_getsetattr
#define SYS_mq_notify __NR_mq_notify
#define SYS_mq_open __NR_mq_open
#define SYS_mq_timedreceive __NR_mq_timedreceive
#define SYS_mq_timedsend __NR_mq_timedsend
#define SYS_mq_unlink __NR_mq_unlink
#define SYS_mremap __NR_mremap
#define SYS_msgctl __NR_msgctl
#define SYS_msgget __NR_msgget
#define SYS_msgrcv __NR_msgrcv
#define SYS_msgsnd __NR_msgsnd
#define SYS_msync __NR_msync
#define SYS_munlock __NR_munlock
#define SYS_munlockall __NR_munlockall
#define SYS_munmap __NR_munmap
#define SYS_name_to_handle_at __NR_name_to_handle_at
#define SYS_nanosleep __NR_nanosleep
#define SYS_nfsservctl __NR_nfsservctl
#define SYS_nice __NR_nice
#define SYS_open __NR_open
#define SYS_open_by_handle_at __NR_open_by_handle_at
#define SYS_openat __NR_openat
#define SYS_pause __NR_pause
#define SYS_pciconfig_iobase __NR_pciconfig_iobase
#define SYS_pciconfig_read __NR_pciconfig_read
#define SYS_pciconfig_write __NR_pciconfig_write
#define SYS_perf_event_open __NR_perf_event_open
#define SYS_personality __NR_personality
#define SYS_pipe __NR_pipe
#define SYS_pipe2 __NR_pipe2
#define SYS_pivot_root __NR_pivot_root
#define SYS_poll __NR_poll
#define SYS_ppoll __NR_ppoll
#define SYS_prctl __NR_prctl
#define SYS_pread64 __NR_pread64
#define SYS_preadv __NR_preadv
#define SYS_prlimit64 __NR_prlimit64
#define SYS_process_vm_readv __NR_process_vm_readv
#define SYS_process_vm_writev __NR_process_vm_writev
#define SYS_pselect6 __NR_pselect6
#define SYS_ptrace __NR_ptrace
#define SYS_pwrite64 __NR_pwrite64
#define SYS_pwritev __NR_pwritev
#define SYS_quotactl __NR_quotactl
#define SYS_read __NR_read
#define SYS_readahead __NR_readahead
#define SYS_readlink __NR_readlink
#define SYS_readlinkat __NR_readlinkat
#define SYS_readv __NR_readv
#define SYS_reboot __NR_reboot
#define SYS_recv __NR_recv
#define SYS_recvfrom __NR_recvfrom
#define SYS_recvmmsg __NR_recvmmsg
#define SYS_recvmsg __NR_recvmsg
#define SYS_remap_file_pages __NR_remap_file_pages
#define SYS_removexattr __NR_removexattr
#define SYS_rename __NR_rename
#define SYS_renameat __NR_renameat
#define SYS_request_key __NR_request_key
#define SYS_restart_syscall __NR_restart_syscall
#define SYS_rmdir __NR_rmdir
#define SYS_rt_sigaction __NR_rt_sigaction
#define SYS_rt_sigpending __NR_rt_sigpending
#define SYS_rt_sigprocmask __NR_rt_sigprocmask
#define SYS_rt_sigqueueinfo __NR_rt_sigqueueinfo
#define SYS_rt_sigreturn __NR_rt_sigreturn
#define SYS_rt_sigsuspend __NR_rt_sigsuspend
#define SYS_rt_sigtimedwait __NR_rt_sigtimedwait
#define SYS_rt_tgsigqueueinfo __NR_rt_tgsigqueueinfo
#define SYS_sched_get_priority_max __NR_sched_get_priority_max
#define SYS_sched_get_priority_min __NR_sched_get_priority_min
#define SYS_sched_getaffinity __NR_sched_getaffinity
#define SYS_sched_getparam __NR_sched_getparam
#define SYS_sched_getscheduler __NR_sched_getscheduler
#define SYS_sched_rr_get_interval __NR_sched_rr_get_interval
#define SYS_sched_setaffinity __NR_sched_setaffinity
#define SYS_sched_setparam __NR_sched_setparam
#define SYS_sched_setscheduler __NR_sched_setscheduler
#define SYS_sched_yield __NR_sched_yield
#define SYS_semctl __NR_semctl
#define SYS_semget __NR_semget
#define SYS_semop __NR_semop
#define SYS_semtimedop __NR_semtimedop
#define SYS_send __NR_send
#define SYS_sendfile __NR_sendfile
#define SYS_sendfile64 __NR_sendfile64
#define SYS_sendmmsg __NR_sendmmsg
#define SYS_sendmsg __NR_sendmsg
#define SYS_sendto __NR_sendto
#define SYS_set_mempolicy __NR_set_mempolicy
#define SYS_set_robust_list __NR_set_robust_list
#define SYS_set_tid_address __NR_set_tid_address
#define SYS_setdomainname __NR_setdomainname
#define SYS_setfsgid __NR_setfsgid
#define SYS_setfsgid32 __NR_setfsgid32
#define SYS_setfsuid __NR_setfsuid
#define SYS_setfsuid32 __NR_setfsuid32
#define SYS_setgid __NR_setgid
#define SYS_setgid32 __NR_setgid32
#define SYS_setgroups __NR_setgroups
#define SYS_setgroups32 __NR_setgroups32
#define SYS_sethostname __NR_sethostname
#define SYS_setitimer __NR_setitimer
#define SYS_setns __NR_setns
#define SYS_setpgid __NR_setpgid
#define SYS_setpriority __NR_setpriority
#define SYS_setregid __NR_setregid
#define SYS_setregid32 __NR_setregid32
#define SYS_setresgid __NR_setresgid
#define SYS_setresgid32 __NR_setresgid32
#define SYS_setresuid __NR_setresuid
#define SYS_setresuid32 __NR_setresuid32
#define SYS_setreuid __NR_setreuid
#define SYS_setreuid32 __NR_setreuid32
#define SYS_setrlimit __NR_setrlimit
#define SYS_setsid __NR_setsid
#define SYS_setsockopt __NR_setsockopt
#define SYS_settimeofday __NR_settimeofday
#define SYS_setuid __NR_setuid
#define SYS_setuid32 __NR_setuid32
#define SYS_setxattr __NR_setxattr
#define SYS_shmat __NR_shmat
#define SYS_shmctl __NR_shmctl
#define SYS_shmdt __NR_shmdt
#define SYS_shmget __NR_shmget
#define SYS_shutdown __NR_shutdown
#define SYS_sigaction __NR_sigaction
#define SYS_sigaltstack __NR_sigaltstack
#define SYS_signalfd __NR_signalfd
#define SYS_signalfd4 __NR_signalfd4
#define SYS_sigpending __NR_sigpending
#define SYS_sigprocmask __NR_sigprocmask
#define SYS_sigreturn __NR_sigreturn
#define SYS_sigsuspend __NR_sigsuspend
#define SYS_socket __NR_socket
#define SYS_socketpair __NR_socketpair
#define SYS_splice __NR_splice
#define SYS_stat __NR_stat
#define SYS_stat64 __NR_stat64
#define SYS_statfs __NR_statfs
#define SYS_statfs64 __NR_statfs64
#define SYS_swapoff __NR_swapoff
#define SYS_swapon __NR_swapon
#define SYS_symlink __NR_symlink
#define SYS_symlinkat __NR_symlinkat
#define SYS_sync __NR_sync
#define SYS_sync_file_range2 __NR_sync_file_range2
#define SYS_syncfs __NR_syncfs
#define SYS_sysfs __NR_sysfs
#define SYS_sysinfo __NR_sysinfo
#define SYS_syslog __NR_syslog
#define SYS_tee __NR_tee
#define SYS_tgkill __NR_tgkill
#define SYS_timer_create __NR_timer_create
#define SYS_timer_delete __NR_timer_delete
#define SYS_timer_getoverrun __NR_timer_getoverrun
#define SYS_timer_gettime __NR_timer_gettime
#define SYS_timer_settime __NR_timer_settime
#define SYS_timerfd_create __NR_timerfd_create
#define SYS_timerfd_gettime __NR_timerfd_gettime
#define SYS_timerfd_settime __NR_timerfd_settime
#define SYS_times __NR_times
#define SYS_tkill __NR_tkill
#define SYS_truncate __NR_truncate
#define SYS_truncate64 __NR_truncate64
#define SYS_ugetrlimit __NR_ugetrlimit
#define SYS_umask __NR_umask
#define SYS_umount2 __NR_umount2
#define SYS_uname __NR_uname
#define SYS_unlink __NR_unlink
#define SYS_unlinkat __NR_unlinkat
#define SYS_unshare __NR_unshare
#define SYS_uselib __NR_uselib
#define SYS_ustat __NR_ustat
#define SYS_utimensat __NR_utimensat
#define SYS_utimes __NR_utimes
#define SYS_vfork __NR_vfork
#define SYS_vhangup __NR_vhangup
#define SYS_vmsplice __NR_vmsplice
#define SYS_vserver __NR_vserver
#define SYS_wait4 __NR_wait4
#define SYS_waitid __NR_waitid
#define SYS_write __NR_write
#define SYS_writev __NR_writev
# 32 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/sys/syscall.h" 2 3 4
# 80 "util/../perf.h" 2

# 1 "util/../../../include/linux/perf_event.h" 1
# 15 "util/../../../include/linux/perf_event.h"
#define _LINUX_PERF_EVENT_H=20

# 1 "util/include/linux/types.h" 1

#define _PERF_LINUX_TYPES_H_=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/types.h" 1 3 4
# 1 "../../include/asm-generic/types.h" 1 3 4

#define _ASM_GENERIC_TYPES_H=20




# 1 "../../include/asm-generic/int-ll64.h" 1 3 4
# 9 "../../include/asm-generic/int-ll64.h" 3 4
#define _ASM_GENERIC_INT_LL64_H=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/bitsperlong.h" 1 3 4
# 1 "../../include/asm-generic/bitsperlong.h" 1 3 4

#define __ASM_GENERIC_BITS_PER_LONG=20
# 12 "../../include/asm-generic/bitsperlong.h" 3 4
#define __BITS_PER_LONG 32
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/bitsperlong.h" 2 3 4
# 12 "../../include/asm-generic/int-ll64.h" 2 3 4







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 8 "../../include/asm-generic/types.h" 2 3 4



typedef unsigned short umode_t;
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/types.h" 2 3 4
# 5 "util/include/linux/types.h" 2

#define DECLARE_BITMAP(name,bits) unsigned long name[BITS_TO_LONGS(bits)]
# 18 "util/../../../include/linux/perf_event.h" 2

# 1 "util/include/asm/byteorder.h" 1
# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/asm/types.h" 1 3 4
# 2 "util/include/asm/byteorder.h" 2
# 1 "util/include/../../../../include/linux/swab.h" 1

#define _LINUX_SWAB_H=20


# 1 "util/include/linux/compiler.h" 1

#define _PERF_LINUX_COMPILER_H_=20




#define __user=20




#define __used __attribute__((__unused__))
# 6 "util/include/../../../../include/linux/swab.h" 2
# 1 "util/include/asm/swab.h" 1
# 7 "util/include/../../../../include/linux/swab.h" 2





#define ___constant_swab16(x) ((__u16)( (((__u16)(x) & (__u16)0x00ffU) << 8=
) | (((__u16)(x) & (__u16)0xff00U) >> 8)))



#define ___constant_swab32(x) ((__u32)( (((__u32)(x) & (__u32)0x000000ffUL)=
 << 24) | (((__u32)(x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(x) & (__u32=
)0x00ff0000UL) >> 8) | (((__u32)(x) & (__u32)0xff000000UL) >> 24)))





#define ___constant_swab64(x) ((__u64)( (((__u64)(x) & (__u64)0x00000000000=
000ffULL) << 56) | (((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) | ((=
(__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(x) & (__u64)0=
x00000000ff000000ULL) << 8) | (((__u64)(x) & (__u64)0x000000ff00000000ULL) =
>> 8) | (((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(x) =
& (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(x) & (__u64)0xff00000000=
000000ULL) >> 56)))
# 32 "util/include/../../../../include/linux/swab.h"
#define ___constant_swahw32(x) ((__u32)( (((__u32)(x) & (__u32)0x0000ffffUL=
) << 16) | (((__u32)(x) & (__u32)0xffff0000UL) >> 16)))



#define ___constant_swahb32(x) ((__u32)( (((__u32)(x) & (__u32)0x00ff00ffUL=
) << 8) | (((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
# 46 "util/include/../../../../include/linux/swab.h"
static inline __attribute__ ((__const__)) __u16 __fswab16(__u16 val)
{



 return ((__u16)( (((__u16)(val) & (__u16)0x00ffU) << 8) | (((__u16)(val) &=
 (__u16)0xff00U) >> 8)));

}

static inline __attribute__ ((__const__)) __u32 __fswab32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x000000ffUL) << 24) | (((__u32)(=
val) & (__u32)0x0000ff00UL) << 8) | (((__u32)(val) & (__u32)0x00ff0000UL) >=
> 8) | (((__u32)(val) & (__u32)0xff000000UL) >> 24)));

}

static inline __attribute__ ((__const__)) __u64 __fswab64(__u64 val)
{







 return ((__u64)( (((__u64)(val) & (__u64)0x00000000000000ffULL) << 56) | (=
((__u64)(val) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(val) & (__=
u64)0x0000000000ff0000ULL) << 24) | (((__u64)(val) & (__u64)0x00000000ff000=
000ULL) << 8) | (((__u64)(val) & (__u64)0x000000ff00000000ULL) >> 8) | (((_=
_u64)(val) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(val) & (__u64=
)0x00ff000000000000ULL) >> 40) | (((__u64)(val) & (__u64)0xff00000000000000=
ULL) >> 56)));

}

static inline __attribute__ ((__const__)) __u32 __fswahw32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x0000ffffUL) << 16) | (((__u32)(=
val) & (__u32)0xffff0000UL) >> 16)));

}

static inline __attribute__ ((__const__)) __u32 __fswahb32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(v=
al) & (__u32)0xff00ff00UL) >> 8)));

}





#define __swab16(x) (__builtin_constant_p((__u16)(x)) ? ___constant_swab16(=
x) : __fswab16(x))
# 108 "util/include/../../../../include/linux/swab.h"
#define __swab32(x) (__builtin_constant_p((__u32)(x)) ? ___constant_swab32(=
x) : __fswab32(x))
# 117 "util/include/../../../../include/linux/swab.h"
#define __swab64(x) (__builtin_constant_p((__u64)(x)) ? ___constant_swab64(=
x) : __fswab64(x))
# 128 "util/include/../../../../include/linux/swab.h"
#define __swahw32(x) (__builtin_constant_p((__u32)(x)) ? ___constant_swahw3=
2(x) : __fswahw32(x))
# 139 "util/include/../../../../include/linux/swab.h"
#define __swahb32(x) (__builtin_constant_p((__u32)(x)) ? ___constant_swahb3=
2(x) : __fswahb32(x))
# 148 "util/include/../../../../include/linux/swab.h"
static inline __u16 __swab16p(const __u16 *p)
{



 return (__builtin_constant_p((__u16)(*p)) ? ((__u16)( (((__u16)(*p) & (__u=
16)0x00ffU) << 8) | (((__u16)(*p) & (__u16)0xff00U) >> 8))) : __fswab16(*p)=
);

}





static inline __u32 __swab32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u=
32)0x000000ffUL) << 24) | (((__u32)(*p) & (__u32)0x0000ff00UL) << 8) | (((_=
_u32)(*p) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(*p) & (__u32)0xff000000U=
L) >> 24))) : __fswab32(*p));

}





static inline __u64 __swab64p(const __u64 *p)
{



 return (__builtin_constant_p((__u64)(*p)) ? ((__u64)( (((__u64)(*p) & (__u=
64)0x00000000000000ffULL) << 56) | (((__u64)(*p) & (__u64)0x000000000000ff0=
0ULL) << 40) | (((__u64)(*p) & (__u64)0x0000000000ff0000ULL) << 24) | (((__=
u64)(*p) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(*p) & (__u64)0x0=
00000ff00000000ULL) >> 8) | (((__u64)(*p) & (__u64)0x0000ff0000000000ULL) >=
> 24) | (((__u64)(*p) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(*p=
) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(*p));

}







static inline __u32 __swahw32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u=
32)0x0000ffffUL) << 16) | (((__u32)(*p) & (__u32)0xffff0000UL) >> 16))) : _=
_fswahw32(*p));

}







static inline __u32 __swahb32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u=
32)0x00ff00ffUL) << 8) | (((__u32)(*p) & (__u32)0xff00ff00UL) >> 8))) : __f=
swahb32(*p));

}





static inline void __swab16s(__u16 *p)
{



 *p =3D __swab16p(p);

}




static inline void __swab32s(__u32 *p)
{



 *p =3D __swab32p(p);

}





static inline void __swab64s(__u64 *p)
{



 *p =3D __swab64p(p);

}







static inline void __swahw32s(__u32 *p)
{



 *p =3D __swahw32p(p);

}







static inline void __swahb32s(__u32 *p)
{



 *p =3D __swahb32p(p);

}
# 2 "util/include/asm/byteorder.h" 2
# 20 "util/../../../include/linux/perf_event.h" 2
# 28 "util/../../../include/linux/perf_event.h"
enum perf_type_id {
 PERF_TYPE_HARDWARE =3D 0,
 PERF_TYPE_SOFTWARE =3D 1,
 PERF_TYPE_TRACEPOINT =3D 2,
 PERF_TYPE_HW_CACHE =3D 3,
 PERF_TYPE_RAW =3D 4,
 PERF_TYPE_BREAKPOINT =3D 5,

 PERF_TYPE_MAX,
};






enum perf_hw_id {



 PERF_COUNT_HW_CPU_CYCLES =3D 0,
 PERF_COUNT_HW_INSTRUCTIONS =3D 1,
 PERF_COUNT_HW_CACHE_REFERENCES =3D 2,
 PERF_COUNT_HW_CACHE_MISSES =3D 3,
 PERF_COUNT_HW_BRANCH_INSTRUCTIONS =3D 4,
 PERF_COUNT_HW_BRANCH_MISSES =3D 5,
 PERF_COUNT_HW_BUS_CYCLES =3D 6,

 PERF_COUNT_HW_MAX,
};
# 66 "util/../../../include/linux/perf_event.h"
enum perf_hw_cache_id {
 PERF_COUNT_HW_CACHE_L1D =3D 0,
 PERF_COUNT_HW_CACHE_L1I =3D 1,
 PERF_COUNT_HW_CACHE_LL =3D 2,
 PERF_COUNT_HW_CACHE_DTLB =3D 3,
 PERF_COUNT_HW_CACHE_ITLB =3D 4,
 PERF_COUNT_HW_CACHE_BPU =3D 5,

 PERF_COUNT_HW_CACHE_MAX,
};

enum perf_hw_cache_op_id {
 PERF_COUNT_HW_CACHE_OP_READ =3D 0,
 PERF_COUNT_HW_CACHE_OP_WRITE =3D 1,
 PERF_COUNT_HW_CACHE_OP_PREFETCH =3D 2,

 PERF_COUNT_HW_CACHE_OP_MAX,
};

enum perf_hw_cache_op_result_id {
 PERF_COUNT_HW_CACHE_RESULT_ACCESS =3D 0,
 PERF_COUNT_HW_CACHE_RESULT_MISS =3D 1,

 PERF_COUNT_HW_CACHE_RESULT_MAX,
};







enum perf_sw_ids {
 PERF_COUNT_SW_CPU_CLOCK =3D 0,
 PERF_COUNT_SW_TASK_CLOCK =3D 1,
 PERF_COUNT_SW_PAGE_FAULTS =3D 2,
 PERF_COUNT_SW_CONTEXT_SWITCHES =3D 3,
 PERF_COUNT_SW_CPU_MIGRATIONS =3D 4,
 PERF_COUNT_SW_PAGE_FAULTS_MIN =3D 5,
 PERF_COUNT_SW_PAGE_FAULTS_MAJ =3D 6,
 PERF_COUNT_SW_ALIGNMENT_FAULTS =3D 7,
 PERF_COUNT_SW_EMULATION_FAULTS =3D 8,

 PERF_COUNT_SW_MAX,
};





enum perf_event_sample_format {
 PERF_SAMPLE_IP =3D 1U << 0,
 PERF_SAMPLE_TID =3D 1U << 1,
 PERF_SAMPLE_TIME =3D 1U << 2,
 PERF_SAMPLE_ADDR =3D 1U << 3,
 PERF_SAMPLE_READ =3D 1U << 4,
 PERF_SAMPLE_CALLCHAIN =3D 1U << 5,
 PERF_SAMPLE_ID =3D 1U << 6,
 PERF_SAMPLE_CPU =3D 1U << 7,
 PERF_SAMPLE_PERIOD =3D 1U << 8,
 PERF_SAMPLE_STREAM_ID =3D 1U << 9,
 PERF_SAMPLE_RAW =3D 1U << 10,

 PERF_SAMPLE_MAX =3D 1U << 11,
};
# 152 "util/../../../include/linux/perf_event.h"
enum perf_event_read_format {
 PERF_FORMAT_TOTAL_TIME_ENABLED =3D 1U << 0,
 PERF_FORMAT_TOTAL_TIME_RUNNING =3D 1U << 1,
 PERF_FORMAT_ID =3D 1U << 2,
 PERF_FORMAT_GROUP =3D 1U << 3,

 PERF_FORMAT_MAX =3D 1U << 4,
};

#define PERF_ATTR_SIZE_VER0 64




struct perf_event_attr {




 __u32 type;




 __u32 size;




 __u64 config;

 union {
  __u64 sample_period;
  __u64 sample_freq;
 };

 __u64 sample_type;
 __u64 read_format;

 __u64 disabled : 1,
    inherit : 1,
    pinned : 1,
    exclusive : 1,
    exclude_user : 1,
    exclude_kernel : 1,
    exclude_hv : 1,
    exclude_idle : 1,
    mmap : 1,
    comm : 1,
    freq : 1,
    inherit_stat : 1,
    enable_on_exec : 1,
    task : 1,
    watermark : 1,
# 216 "util/../../../include/linux/perf_event.h"
    precise_ip : 2,

    __reserved_1 : 47;

 union {
  __u32 wakeup_events;
  __u32 wakeup_watermark;
 };

 __u32 bp_type;
 __u64 bp_addr;
 __u64 bp_len;
};




#define PERF_EVENT_IOC_ENABLE _IO ('$', 0)
#define PERF_EVENT_IOC_DISABLE _IO ('$', 1)
#define PERF_EVENT_IOC_REFRESH _IO ('$', 2)
#define PERF_EVENT_IOC_RESET _IO ('$', 3)
#define PERF_EVENT_IOC_PERIOD _IOW('$', 4, __u64)
#define PERF_EVENT_IOC_SET_OUTPUT _IO ('$', 5)
#define PERF_EVENT_IOC_SET_FILTER _IOW('$', 6, char *)

enum perf_event_ioc_flags {
 PERF_IOC_FLAG_GROUP =3D 1U << 0,
};




struct perf_event_mmap_page {
 __u32 version;
 __u32 compat_version;
# 274 "util/../../../include/linux/perf_event.h"
 __u32 lock;
 __u32 index;
 __s64 offset;
 __u64 time_enabled;
 __u64 time_running;





 __u64 __reserved[123];
# 297 "util/../../../include/linux/perf_event.h"
 __u64 data_head;
 __u64 data_tail;
};

#define PERF_RECORD_MISC_CPUMODE_MASK (7 << 0)
#define PERF_RECORD_MISC_CPUMODE_UNKNOWN (0 << 0)
#define PERF_RECORD_MISC_KERNEL (1 << 0)
#define PERF_RECORD_MISC_USER (2 << 0)
#define PERF_RECORD_MISC_HYPERVISOR (3 << 0)
#define PERF_RECORD_MISC_GUEST_KERNEL (4 << 0)
#define PERF_RECORD_MISC_GUEST_USER (5 << 0)






#define PERF_RECORD_MISC_EXACT_IP (1 << 14)



#define PERF_RECORD_MISC_EXT_RESERVED (1 << 15)

struct perf_event_header {
 __u32 type;
 __u16 misc;
 __u16 size;
};

enum perf_event_type {
# 342 "util/../../../include/linux/perf_event.h"
 PERF_RECORD_MMAP =3D 1,
# 351 "util/../../../include/linux/perf_event.h"
 PERF_RECORD_LOST =3D 2,
# 361 "util/../../../include/linux/perf_event.h"
 PERF_RECORD_COMM =3D 3,
# 371 "util/../../../include/linux/perf_event.h"
 PERF_RECORD_EXIT =3D 4,
# 381 "util/../../../include/linux/perf_event.h"
 PERF_RECORD_THROTTLE =3D 5,
 PERF_RECORD_UNTHROTTLE =3D 6,
# 392 "util/../../../include/linux/perf_event.h"
 PERF_RECORD_FORK =3D 7,
# 402 "util/../../../include/linux/perf_event.h"
 PERF_RECORD_READ =3D 8,
# 437 "util/../../../include/linux/perf_event.h"
 PERF_RECORD_SAMPLE =3D 9,

 PERF_RECORD_MAX,
};

enum perf_callchain_context {
 PERF_CONTEXT_HV =3D (__u64)-32,
 PERF_CONTEXT_KERNEL =3D (__u64)-128,
 PERF_CONTEXT_USER =3D (__u64)-512,

 PERF_CONTEXT_GUEST =3D (__u64)-2048,
 PERF_CONTEXT_GUEST_KERNEL =3D (__u64)-2176,
 PERF_CONTEXT_GUEST_USER =3D (__u64)-2560,

 PERF_CONTEXT_MAX =3D (__u64)-4095,
};

#define PERF_FLAG_FD_NO_GROUP (1U << 0)
#define PERF_FLAG_FD_OUTPUT (1U << 1)
# 82 "util/../perf.h" 2
# 1 "util/../util/types.h" 1
# 83 "util/../perf.h" 2






#define PR_TASK_PERF_EVENTS_DISABLE 31
#define PR_TASK_PERF_EVENTS_ENABLE 32


#define NSEC_PER_SEC 1000000000ULL


static inline unsigned long long rdclock(void)
{
 struct timespec ts;

 clock_gettime(1, &ts);
 return ts.tv_sec * 1000000000ULL + ts.tv_nsec;
}




#define __user=20
#define asmlinkage=20

#define unlikely(x) __builtin_expect(!!(x), 0)
#define min(x,y) ({ typeof(x) _min1 =3D (x); typeof(y) _min2 =3D (y); (void=
) (&_min1 =3D=3D &_min2); _min1 < _min2 ? _min1 : _min2; })





static inline int
sys_perf_event_open(struct perf_event_attr *attr,
        pid_t pid, int cpu, int group_fd,
        unsigned long flags)
{
 attr->size =3D sizeof(*attr);
 return syscall((0 +364), attr, pid, cpu,
         group_fd, flags);
}

#define MAX_COUNTERS 256
#define MAX_NR_CPUS 256

struct ip_callchain {
 u64 nr;
 u64 ips[0];
};

extern _Bool perf_host, perf_guest;
# 5 "util/callchain.h" 2
# 1 "util/include/linux/list.h" 1
# 1 "util/include/../../../../include/linux/list.h" 1

#define _LINUX_LIST_H=20

# 1 "../../include/linux/stddef.h" 1

#define _LINUX_STDDEF_H=20



#undef NULL



#define NULL ((void *)0)
# 5 "util/include/../../../../include/linux/list.h" 2
# 1 "util/include/linux/poison.h" 1
# 1 "util/include/../../../../include/linux/poison.h" 1

#define _LINUX_POISON_H=20
# 14 "util/include/../../../../include/linux/poison.h"
#define POISON_POINTER_DELTA 0







#define LIST_POISON1 ((void *) 0x00100100 + POISON_POINTER_DELTA)
#define LIST_POISON2 ((void *) 0x00200200 + POISON_POINTER_DELTA)






#define TIMER_ENTRY_STATIC ((void *) 0x74737461)


#define PAGE_POISON 0xaa






#define RED_INACTIVE 0x09F911029D74E35BULL
#define RED_ACTIVE 0xD84156C5635688C0ULL

#define SLUB_RED_INACTIVE 0xbb
#define SLUB_RED_ACTIVE 0xcc


#define POISON_INUSE 0x5a
#define POISON_FREE 0x6b
#define POISON_END 0xa5
# 58 "util/include/../../../../include/linux/poison.h"
#define HUGETLB_POISON ((void *)(0x00300300 + POISON_POINTER_DELTA + PAGE_M=
APPING_ANON))


#define POISON_FREE_INITMEM 0xcc
# 70 "util/include/../../../../include/linux/poison.h"
#define JBD_POISON_FREE 0x5b
#define JBD2_POISON_FREE 0x5c


#define POOL_POISON_FREED 0xa7
#define POOL_POISON_ALLOCATED 0xa9


#define ATM_POISON_FREE 0x12
#define ATM_POISON 0xdeadbeef


#define NEIGHBOR_DEAD 0xdeadbeef
#define NETFILTER_LINK_POISON 0xdead57ac


#define MUTEX_DEBUG_INIT 0x11
#define MUTEX_DEBUG_FREE 0x22


#define FLEX_ARRAY_FREE 0x6c


#define KEY_DESTROY 0xbd


#define OSS_POISON_FREE 0xAB
# 1 "util/include/linux/poison.h" 2
# 6 "util/include/../../../../include/linux/list.h" 2
# 1 "util/include/linux/prefetch.h" 1

#define PERF_LINUX_PREFETCH_H=20

static inline void prefetch(void *a __attribute__((unused))) { }
# 7 "util/include/../../../../include/linux/list.h" 2
# 1 "util/include/asm/system.h" 1
# 8 "util/include/../../../../include/linux/list.h" 2
# 19 "util/include/../../../../include/linux/list.h"
struct list_head {
 struct list_head *next, *prev;
};

#define LIST_HEAD_INIT(name) { &(name), &(name) }

#define LIST_HEAD(name) struct list_head name =3D LIST_HEAD_INIT(name)


static inline void INIT_LIST_HEAD(struct list_head *list)
{
 list->next =3D list;
 list->prev =3D list;
}
# 41 "util/include/../../../../include/linux/list.h"
static inline void __list_add(struct list_head *new,
         struct list_head *prev,
         struct list_head *next)
{
 next->prev =3D new;
 new->next =3D next;
 new->prev =3D prev;
 prev->next =3D new;
}
# 64 "util/include/../../../../include/linux/list.h"
static inline void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);
}
# 78 "util/include/../../../../include/linux/list.h"
static inline void list_add_tail(struct list_head *new, struct list_head *h=
ead)
{
 __list_add(new, head->prev, head);
}
# 90 "util/include/../../../../include/linux/list.h"
static inline void __list_del(struct list_head * prev, struct list_head * n=
ext)
{
 next->prev =3D prev;
 prev->next =3D next;
}
# 103 "util/include/../../../../include/linux/list.h"
static inline void list_del(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 entry->next =3D ((void *) 0x00100100 + 0);
 entry->prev =3D ((void *) 0x00200200 + 0);
}
# 120 "util/include/../../../../include/linux/list.h"
static inline void list_replace(struct list_head *old,
    struct list_head *new)
{
 new->next =3D old->next;
 new->next->prev =3D new;
 new->prev =3D old->prev;
 new->prev->next =3D new;
}

static inline void list_replace_init(struct list_head *old,
     struct list_head *new)
{
 list_replace(old, new);
 INIT_LIST_HEAD(old);
}





static inline void list_del_init(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 INIT_LIST_HEAD(entry);
}






static inline void list_move(struct list_head *list, struct list_head *head=
)
{
 __list_del(list->prev, list->next);
 list_add(list, head);
}






static inline void list_move_tail(struct list_head *list,
      struct list_head *head)
{
 __list_del(list->prev, list->next);
 list_add_tail(list, head);
}






static inline int list_is_last(const struct list_head *list,
    const struct list_head *head)
{
 return list->next =3D=3D head;
}





static inline int list_empty(const struct list_head *head)
{
 return head->next =3D=3D head;
}
# 202 "util/include/../../../../include/linux/list.h"
static inline int list_empty_careful(const struct list_head *head)
{
 struct list_head *next =3D head->next;
 return (next =3D=3D head) && (next =3D=3D head->prev);
}





static inline void list_rotate_left(struct list_head *head)
{
 struct list_head *first;

 if (!list_empty(head)) {
  first =3D head->next;
  list_move_tail(first, head);
 }
}





static inline int list_is_singular(const struct list_head *head)
{
 return !list_empty(head) && (head->next =3D=3D head->prev);
}

static inline void __list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 struct list_head *new_first =3D entry->next;
 list->next =3D head->next;
 list->next->prev =3D list;
 list->prev =3D entry;
 entry->next =3D list;
 head->next =3D new_first;
 new_first->prev =3D head;
}
# 257 "util/include/../../../../include/linux/list.h"
static inline void list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 if (list_empty(head))
  return;
 if (list_is_singular(head) &&
  (head->next !=3D entry && head !=3D entry))
  return;
 if (entry =3D=3D head)
  INIT_LIST_HEAD(list);
 else
  __list_cut_position(list, head, entry);
}

static inline void __list_splice(const struct list_head *list,
     struct list_head *prev,
     struct list_head *next)
{
 struct list_head *first =3D list->next;
 struct list_head *last =3D list->prev;

 first->prev =3D prev;
 prev->next =3D first;

 last->next =3D next;
 next->prev =3D last;
}






static inline void list_splice(const struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head, head->next);
}






static inline void list_splice_tail(struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head->prev, head);
}
# 316 "util/include/../../../../include/linux/list.h"
static inline void list_splice_init(struct list_head *list,
        struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head, head->next);
  INIT_LIST_HEAD(list);
 }
}
# 333 "util/include/../../../../include/linux/list.h"
static inline void list_splice_tail_init(struct list_head *list,
      struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head->prev, head);
  INIT_LIST_HEAD(list);
 }
}







#define list_entry(ptr,type,member) container_of(ptr, type, member)
# 359 "util/include/../../../../include/linux/list.h"
#define list_first_entry(ptr,type,member) list_entry((ptr)->next, type, mem=
ber)







#define list_for_each(pos,head) for (pos =3D (head)->next; prefetch(pos->ne=
xt), pos !=3D (head); pos =3D pos->next)
# 381 "util/include/../../../../include/linux/list.h"
#define __list_for_each(pos,head) for (pos =3D (head)->next; pos !=3D (head=
); pos =3D pos->next)







#define list_for_each_prev(pos,head) for (pos =3D (head)->prev; prefetch(po=
s->prev), pos !=3D (head); pos =3D pos->prev)
# 399 "util/include/../../../../include/linux/list.h"
#define list_for_each_safe(pos,n,head) for (pos =3D (head)->next, n =3D pos=
->next; pos !=3D (head); pos =3D n, n =3D pos->next)
# 409 "util/include/../../../../include/linux/list.h"
#define list_for_each_prev_safe(pos,n,head) for (pos =3D (head)->prev, n =
=3D pos->prev; prefetch(pos->prev), pos !=3D (head); pos =3D n, n =3D pos->=
prev)
# 420 "util/include/../../../../include/linux/list.h"
#define list_for_each_entry(pos,head,member) for (pos =3D list_entry((head)=
->next, typeof(*pos), member); prefetch(pos->member.next), &pos->member !=
=3D (head); pos =3D list_entry(pos->member.next, typeof(*pos), member))
# 431 "util/include/../../../../include/linux/list.h"
#define list_for_each_entry_reverse(pos,head,member) for (pos =3D list_entr=
y((head)->prev, typeof(*pos), member); prefetch(pos->member.prev), &pos->me=
mber !=3D (head); pos =3D list_entry(pos->member.prev, typeof(*pos), member=
))
# 444 "util/include/../../../../include/linux/list.h"
#define list_prepare_entry(pos,head,member) ((pos) ? : list_entry(head, typ=
eof(*pos), member))
# 456 "util/include/../../../../include/linux/list.h"
#define list_for_each_entry_continue(pos,head,member) for (pos =3D list_ent=
ry(pos->member.next, typeof(*pos), member); prefetch(pos->member.next), &po=
s->member !=3D (head); pos =3D list_entry(pos->member.next, typeof(*pos), m=
ember))
# 470 "util/include/../../../../include/linux/list.h"
#define list_for_each_entry_continue_reverse(pos,head,member) for (pos =3D =
list_entry(pos->member.prev, typeof(*pos), member); prefetch(pos->member.pr=
ev), &pos->member !=3D (head); pos =3D list_entry(pos->member.prev, typeof(=
*pos), member))
# 483 "util/include/../../../../include/linux/list.h"
#define list_for_each_entry_from(pos,head,member) for (; prefetch(pos->memb=
er.next), &pos->member !=3D (head); pos =3D list_entry(pos->member.next, ty=
peof(*pos), member))
# 494 "util/include/../../../../include/linux/list.h"
#define list_for_each_entry_safe(pos,n,head,member) for (pos =3D list_entry=
((head)->next, typeof(*pos), member), n =3D list_entry(pos->member.next, ty=
peof(*pos), member); &pos->member !=3D (head); pos =3D n, n =3D list_entry(=
n->member.next, typeof(*n), member))
# 510 "util/include/../../../../include/linux/list.h"
#define list_for_each_entry_safe_continue(pos,n,head,member) for (pos =3D l=
ist_entry(pos->member.next, typeof(*pos), member), n =3D list_entry(pos->me=
mber.next, typeof(*pos), member); &pos->member !=3D (head); pos =3D n, n =
=3D list_entry(n->member.next, typeof(*n), member))
# 526 "util/include/../../../../include/linux/list.h"
#define list_for_each_entry_safe_from(pos,n,head,member) for (n =3D list_en=
try(pos->member.next, typeof(*pos), member); &pos->member !=3D (head); pos =
=3D n, n =3D list_entry(n->member.next, typeof(*n), member))
# 541 "util/include/../../../../include/linux/list.h"
#define list_for_each_entry_safe_reverse(pos,n,head,member) for (pos =3D li=
st_entry((head)->prev, typeof(*pos), member), n =3D list_entry(pos->member.=
prev, typeof(*pos), member); &pos->member !=3D (head); pos =3D n, n =3D lis=
t_entry(n->member.prev, typeof(*n), member))
# 559 "util/include/../../../../include/linux/list.h"
#define list_safe_reset_next(pos,n,member) n =3D list_entry(pos->member.nex=
t, typeof(*pos), member)
# 569 "util/include/../../../../include/linux/list.h"
struct hlist_head {
 struct hlist_node *first;
};

struct hlist_node {
 struct hlist_node *next, **pprev;
};

#define HLIST_HEAD_INIT { .first =3D NULL }
#define HLIST_HEAD(name) struct hlist_head name =3D { .first =3D NULL }
#define INIT_HLIST_HEAD(ptr) ((ptr)->first =3D NULL)
static inline void INIT_HLIST_NODE(struct hlist_node *h)
{
 h->next =3D ((void *)0);
 h->pprev =3D ((void *)0);
}

static inline int hlist_unhashed(const struct hlist_node *h)
{
 return !h->pprev;
}

static inline int hlist_empty(const struct hlist_head *h)
{
 return !h->first;
}

static inline void __hlist_del(struct hlist_node *n)
{
 struct hlist_node *next =3D n->next;
 struct hlist_node **pprev =3D n->pprev;
 *pprev =3D next;
 if (next)
  next->pprev =3D pprev;
}

static inline void hlist_del(struct hlist_node *n)
{
 __hlist_del(n);
 n->next =3D ((void *) 0x00100100 + 0);
 n->pprev =3D ((void *) 0x00200200 + 0);
}

static inline void hlist_del_init(struct hlist_node *n)
{
 if (!hlist_unhashed(n)) {
  __hlist_del(n);
  INIT_HLIST_NODE(n);
 }
}

static inline void hlist_add_head(struct hlist_node *n, struct hlist_head *=
h)
{
 struct hlist_node *first =3D h->first;
 n->next =3D first;
 if (first)
  first->pprev =3D &n->next;
 h->first =3D n;
 n->pprev =3D &h->first;
}


static inline void hlist_add_before(struct hlist_node *n,
     struct hlist_node *next)
{
 n->pprev =3D next->pprev;
 n->next =3D next;
 next->pprev =3D &n->next;
 *(n->pprev) =3D n;
}

static inline void hlist_add_after(struct hlist_node *n,
     struct hlist_node *next)
{
 next->next =3D n->next;
 n->next =3D next;
 next->pprev =3D &n->next;

 if(next->next)
  next->next->pprev =3D &next->next;
}





static inline void hlist_move_list(struct hlist_head *old,
       struct hlist_head *new)
{
 new->first =3D old->first;
 if (new->first)
  new->first->pprev =3D &new->first;
 old->first =3D ((void *)0);
}

#define hlist_entry(ptr,type,member) container_of(ptr,type,member)

#define hlist_for_each(pos,head) for (pos =3D (head)->first; pos && ({ pref=
etch(pos->next); 1; }); pos =3D pos->next)



#define hlist_for_each_safe(pos,n,head) for (pos =3D (head)->first; pos && =
({ n =3D pos->next; 1; }); pos =3D n)
# 681 "util/include/../../../../include/linux/list.h"
#define hlist_for_each_entry(tpos,pos,head,member) for (pos =3D (head)->fir=
st; pos && ({ prefetch(pos->next); 1;}) && ({ tpos =3D hlist_entry(pos, typ=
eof(*tpos), member); 1;}); pos =3D pos->next)
# 693 "util/include/../../../../include/linux/list.h"
#define hlist_for_each_entry_continue(tpos,pos,member) for (pos =3D (pos)->=
next; pos && ({ prefetch(pos->next); 1;}) && ({ tpos =3D hlist_entry(pos, t=
ypeof(*tpos), member); 1;}); pos =3D pos->next)
# 705 "util/include/../../../../include/linux/list.h"
#define hlist_for_each_entry_from(tpos,pos,member) for (; pos && ({ prefetc=
h(pos->next); 1;}) && ({ tpos =3D hlist_entry(pos, typeof(*tpos), member); =
1;}); pos =3D pos->next)
# 718 "util/include/../../../../include/linux/list.h"
#define hlist_for_each_entry_safe(tpos,pos,n,head,member) for (pos =3D (hea=
d)->first; pos && ({ n =3D pos->next; 1; }) && ({ tpos =3D hlist_entry(pos,=
 typeof(*tpos), member); 1;}); pos =3D n)
# 2 "util/include/linux/list.h" 2


#define PERF_LIST_H=20







static inline void list_del_range(struct list_head *begin,
      struct list_head *end)
{
 begin->prev->next =3D end->next;
 end->next->prev =3D begin->prev;
}
# 6 "util/callchain.h" 2
# 1 "util/include/linux/rbtree.h" 1
# 1 "util/include/../../../../include/linux/rbtree.h" 1
# 95 "util/include/../../../../include/linux/rbtree.h"
#define _LINUX_RBTREE_H=20

# 1 "util/include/linux/kernel.h" 1

#define PERF_LINUX_KERNEL_H_=20




# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/imx28evk/usr/include/assert.h" 1 3 4
# 25 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/assert.h" 3 4
#undef _ASSERT_H
#undef assert
#undef __ASSERT_VOID_CAST







#define _ASSERT_H 1





#define __ASSERT_VOID_CAST (void)
# 65 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm=
/build/build/tmp/sysroots/imx28evk/usr/include/assert.h" 3 4



extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__)=
);


extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__)=
);




extern void __assert (const char *__assertion, const char *__file, int __li=
ne)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__)=
);




#define assert(expr) ((expr) ? __ASSERT_VOID_CAST (0) : __assert_fail (__ST=
RING(expr), __FILE__, __LINE__, __ASSERT_FUNCTION))
# 104 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ar=
m/build/build/tmp/sysroots/imx28evk/usr/include/assert.h" 3 4
#define __ASSERT_FUNCTION __PRETTY_FUNCTION__
# 8 "util/include/linux/kernel.h" 2

#define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))

#define ALIGN(x,a) __ALIGN_MASK(x,(typeof(x))(a)-1)
#define __ALIGN_MASK(x,mask) (((x)+(mask))&~(mask))
# 26 "util/include/linux/kernel.h"
#define container_of(ptr,type,member) ({ const typeof(((type *)0)->member) =
* __mptr =3D (ptr); (type *)((char *)__mptr - offsetof(type, member)); })




#define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))


#define max(x,y) ({ typeof(x) _max1 =3D (x); typeof(y) _max2 =3D (y); (void=
) (&_max1 =3D=3D &_max2); _max1 > _max2 ? _max1 : _max2; })
# 50 "util/include/linux/kernel.h"
#define BUG_ON(cond) assert(!(cond))






#define cpu_to_le64(x) (x)
#define cpu_to_le32(x) (x)

static inline int
vscnprintf(char *buf, size_t size, const char *fmt, va_list args)
{
 int i;
 ssize_t ssize =3D size;

 i =3D vsnprintf(buf, size, fmt, args);

 return (i >=3D ssize) ? (ssize - 1) : i;
}

static inline int scnprintf(char * buf, size_t size, const char * fmt, ...)
{
 va_list args;
 ssize_t ssize =3D size;
 int i;

 __builtin_va_start(args,fmt);
 i =3D vsnprintf(buf, size, fmt, args);
 __builtin_va_end(args);

 return (i >=3D ssize) ? (ssize - 1) : i;
}

static inline unsigned long
simple_strtoul(const char *nptr, char **endptr, int base)
{
 return strtoul(nptr, endptr, base);
}

int eprintf(int level,
     const char *fmt, ...) __attribute__((format(printf, 2, 3)));


#define pr_fmt(fmt) fmt


#define pr_err(fmt,...) eprintf(0, pr_fmt(fmt), ##__VA_ARGS__)

#define pr_warning(fmt,...) eprintf(0, pr_fmt(fmt), ##__VA_ARGS__)

#define pr_info(fmt,...) eprintf(0, pr_fmt(fmt), ##__VA_ARGS__)

#define pr_debug(fmt,...) eprintf(1, pr_fmt(fmt), ##__VA_ARGS__)

#define pr_debugN(n,fmt,...) eprintf(n, pr_fmt(fmt), ##__VA_ARGS__)

#define pr_debug2(fmt,...) pr_debugN(2, pr_fmt(fmt), ##__VA_ARGS__)
#define pr_debug3(fmt,...) pr_debugN(3, pr_fmt(fmt), ##__VA_ARGS__)
#define pr_debug4(fmt,...) pr_debugN(4, pr_fmt(fmt), ##__VA_ARGS__)
# 98 "util/include/../../../../include/linux/rbtree.h" 2


struct rb_node
{
 unsigned long rb_parent_color;
#define RB_RED 0
#define RB_BLACK 1
 struct rb_node *rb_right;
 struct rb_node *rb_left;
} __attribute__((aligned(sizeof(long))));


struct rb_root
{
 struct rb_node *rb_node;
};


#define rb_parent(r) ((struct rb_node *)((r)->rb_parent_color & ~3))
#define rb_color(r) ((r)->rb_parent_color & 1)
#define rb_is_red(r) (!rb_color(r))
#define rb_is_black(r) rb_color(r)
#define rb_set_red(r) do { (r)->rb_parent_color &=3D ~1; } while (0)
#define rb_set_black(r) do { (r)->rb_parent_color |=3D 1; } while (0)

static inline void rb_set_parent(struct rb_node *rb, struct rb_node *p)
{
 rb->rb_parent_color =3D (rb->rb_parent_color & 3) | (unsigned long)p;
}
static inline void rb_set_color(struct rb_node *rb, int color)
{
 rb->rb_parent_color =3D (rb->rb_parent_color & ~1) | color;
}

#define RB_ROOT (struct rb_root) { NULL, }
#define rb_entry(ptr,type,member) container_of(ptr, type, member)

#define RB_EMPTY_ROOT(root) ((root)->rb_node =3D=3D NULL)
#define RB_EMPTY_NODE(node) (rb_parent(node) =3D=3D node)
#define RB_CLEAR_NODE(node) (rb_set_parent(node, node))

extern void rb_insert_color(struct rb_node *, struct rb_root *);
extern void rb_erase(struct rb_node *, struct rb_root *);

typedef void (*rb_augment_f)(struct rb_node *node, void *data);

extern void rb_augment_insert(struct rb_node *node,
         rb_augment_f func, void *data);
extern struct rb_node *rb_augment_erase_begin(struct rb_node *node);
extern void rb_augment_erase_end(struct rb_node *node,
     rb_augment_f func, void *data);


extern struct rb_node *rb_next(const struct rb_node *);
extern struct rb_node *rb_prev(const struct rb_node *);
extern struct rb_node *rb_first(const struct rb_root *);
extern struct rb_node *rb_last(const struct rb_root *);


extern void rb_replace_node(struct rb_node *victim, struct rb_node *new,
       struct rb_root *root);

static inline void rb_link_node(struct rb_node * node, struct rb_node * par=
ent,
    struct rb_node ** rb_link)
{
 node->rb_parent_color =3D (unsigned long )parent;
 node->rb_left =3D node->rb_right =3D ((void *)0);

 *rb_link =3D node;
}
# 1 "util/include/linux/rbtree.h" 2
# 7 "util/callchain.h" 2
# 1 "util/event.h" 1

#define __PERF_RECORD_H=20

# 1 "/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/=
build/build/tmp/sysroots/x86_64-linux/usr/lib/armv5te-poky-linux-gnueabi/gc=
c/arm-poky-linux-gnueabi/4.8.1/include-fixed/limits.h" 1 3 4
# 5 "util/event.h" 2


# 1 "util/map.h" 1

#define __PERF_MAP_H=20


# 1 "util/include/linux/list.h" 1
# 6 "util/map.h" 2
# 1 "util/include/linux/rbtree.h" 1
# 7 "util/map.h" 2




enum map_type {
 MAP__FUNCTION =3D 0,
 MAP__VARIABLE,
};

#define MAP__NR_TYPES (MAP__VARIABLE + 1)

extern const char *map_type__name[(MAP__VARIABLE + 1)];

struct dso;
struct ref_reloc_sym;
struct map_groups;
struct machine;

struct map {
 union {
  struct rb_node rb_node;
  struct list_head node;
 };
 u64 start;
 u64 end;
 enum map_type type;
 u32 priv;
 u64 pgoff;


 u64 (*map_ip)(struct map *, u64);

 u64 (*unmap_ip)(struct map *, u64);

 struct dso *dso;
 struct map_groups *groups;
};

struct kmap {
 struct ref_reloc_sym *ref_reloc_sym;
 struct map_groups *kmaps;
};

struct map_groups {
 struct rb_root maps[(MAP__VARIABLE + 1)];
 struct list_head removed_maps[(MAP__VARIABLE + 1)];
 struct machine *machine;
};


#define HOST_KERNEL_ID (-1)
#define DEFAULT_GUEST_KERNEL_ID (0)

struct machine {
 struct rb_node rb_node;
 pid_t pid;
 char *root_dir;
 struct list_head user_dsos;
 struct list_head kernel_dsos;
 struct map_groups kmaps;
 struct map *vmlinux_maps[(MAP__VARIABLE + 1)];
};

static inline
struct map *machine__kernel_map(struct machine *self, enum map_type type)
{
 return self->vmlinux_maps[type];
}

static inline struct kmap *map__kmap(struct map *self)
{
 return (struct kmap *)(self + 1);
}

static inline u64 map__map_ip(struct map *map, u64 ip)
{
 return ip - map->start + map->pgoff;
}

static inline u64 map__unmap_ip(struct map *map, u64 ip)
{
 return ip + map->start - map->pgoff;
}

static inline u64 identity__map_ip(struct map *map __attribute__((__unused_=
_)), u64 ip)
{
 return ip;
}



u64 map__rip_2objdump(struct map *map, u64 rip);
u64 map__objdump_2ip(struct map *map, u64 addr);

struct symbol;

typedef int (*symbol_filter_t)(struct map *map, struct symbol *sym);

void map__init(struct map *self, enum map_type type,
        u64 start, u64 end, u64 pgoff, struct dso *dso);
struct map *map__new(struct list_head *dsos__list, u64 start, u64 len,
       u64 pgoff, u32 pid, char *filename,
       enum map_type type, char *cwd, int cwdlen);
void map__delete(struct map *self);
struct map *map__clone(struct map *self);
int map__overlap(struct map *l, struct map *r);
size_t map__fprintf(struct map *self, FILE *fp);

int map__load(struct map *self, symbol_filter_t filter);
struct symbol *map__find_symbol(struct map *self,
    u64 addr, symbol_filter_t filter);
struct symbol *map__find_symbol_by_name(struct map *self, const char *name,
     symbol_filter_t filter);
void map__fixup_start(struct map *self);
void map__fixup_end(struct map *self);

void map__reloc_vmlinux(struct map *self);

size_t __map_groups__fprintf_maps(struct map_groups *self,
      enum map_type type, int verbose, FILE *fp);
void maps__insert(struct rb_root *maps, struct map *map);
struct map *maps__find(struct rb_root *maps, u64 addr);
void map_groups__init(struct map_groups *self);
int map_groups__clone(struct map_groups *self,
        struct map_groups *parent, enum map_type type);
size_t map_groups__fprintf(struct map_groups *self, int verbose, FILE *fp);
size_t map_groups__fprintf_maps(struct map_groups *self, int verbose, FILE =
*fp);

typedef void (*machine__process_t)(struct machine *self, void *data);

void machines__process(struct rb_root *self, machine__process_t process, vo=
id *data);
struct machine *machines__add(struct rb_root *self, pid_t pid,
         const char *root_dir);
struct machine *machines__find_host(struct rb_root *self);
struct machine *machines__find(struct rb_root *self, pid_t pid);
struct machine *machines__findnew(struct rb_root *self, pid_t pid);
char *machine__mmap_name(struct machine *self, char *bf, size_t size);
int machine__init(struct machine *self, const char *root_dir, pid_t pid);





static inline _Bool machine__is_default_guest(struct machine *self)
{
 return self ? self->pid =3D=3D (0) : 0;
}

static inline _Bool machine__is_host(struct machine *self)
{
 return self ? self->pid =3D=3D (-1) : 0;
}

static inline void map_groups__insert(struct map_groups *self, struct map *=
map)
{
 maps__insert(&self->maps[map->type], map);
 map->groups =3D self;
}

static inline struct map *map_groups__find(struct map_groups *self,
        enum map_type type, u64 addr)
{
 return maps__find(&self->maps[type], addr);
}

struct symbol *map_groups__find_symbol(struct map_groups *self,
           enum map_type type, u64 addr,
           struct map **mapp,
           symbol_filter_t filter);

struct symbol *map_groups__find_symbol_by_name(struct map_groups *self,
            enum map_type type,
            const char *name,
            struct map **mapp,
            symbol_filter_t filter);

static inline
struct symbol *machine__find_kernel_symbol(struct machine *self,
        enum map_type type, u64 addr,
        struct map **mapp,
        symbol_filter_t filter)
{
 return map_groups__find_symbol(&self->kmaps, type, addr, mapp, filter);
}

static inline
struct symbol *machine__find_kernel_function(struct machine *self, u64 addr=
,
          struct map **mapp,
          symbol_filter_t filter)
{
 return machine__find_kernel_symbol(self, MAP__FUNCTION, addr, mapp, filter=
);
}

static inline
struct symbol *map_groups__find_function_by_name(struct map_groups *self,
       const char *name, struct map **mapp,
       symbol_filter_t filter)
{
 return map_groups__find_symbol_by_name(self, MAP__FUNCTION, name, mapp, fi=
lter);
}

int map_groups__fixup_overlappings(struct map_groups *self, struct map *map=
,
       int verbose, FILE *fp);

struct map *map_groups__find_by_name(struct map_groups *self,
         enum map_type type, const char *name);
struct map *machine__new_module(struct machine *self, u64 start, const char=
 *filename);

void map_groups__flush(struct map_groups *self);
# 8 "util/event.h" 2




struct ip_event {
 struct perf_event_header header;
 u64 ip;
 u32 pid, tid;
 unsigned char __more_data[];
};

struct mmap_event {
 struct perf_event_header header;
 u32 pid, tid;
 u64 start;
 u64 len;
 u64 pgoff;
 char filename[4096];
};

struct comm_event {
 struct perf_event_header header;
 u32 pid, tid;
 char comm[16];
};

struct fork_event {
 struct perf_event_header header;
 u32 pid, ppid;
 u32 tid, ptid;
 u64 time;
};

struct lost_event {
 struct perf_event_header header;
 u64 id;
 u64 lost;
};




struct read_event {
 struct perf_event_header header;
 u32 pid, tid;
 u64 value;
 u64 time_enabled;
 u64 time_running;
 u64 id;
};

struct sample_event {
 struct perf_event_header header;
 u64 array[];
};

struct sample_data {
 u64 ip;
 u32 pid, tid;
 u64 time;
 u64 addr;
 u64 id;
 u64 stream_id;
 u64 period;
 u32 cpu;
 u32 raw_size;
 void *raw_data;
 struct ip_callchain *callchain;
};

#define BUILD_ID_SIZE 20

struct build_id_event {
 struct perf_event_header header;
 pid_t pid;
 u8 build_id[(((20)+((typeof(20))(sizeof(u64))-1))&~((typeof(20))(sizeof(u6=
4))-1))];
 char filename[];
};

enum perf_user_event_type {
 PERF_RECORD_HEADER_ATTR =3D 64,
 PERF_RECORD_HEADER_EVENT_TYPE =3D 65,
 PERF_RECORD_HEADER_TRACING_DATA =3D 66,
 PERF_RECORD_HEADER_BUILD_ID =3D 67,
 PERF_RECORD_FINISHED_ROUND =3D 68,
 PERF_RECORD_HEADER_MAX
};

struct attr_event {
 struct perf_event_header header;
 struct perf_event_attr attr;
 u64 id[];
};

#define MAX_EVENT_NAME 64

struct perf_trace_event_type {
 u64 event_id;
 char name[64];
};

struct event_type_event {
 struct perf_event_header header;
 struct perf_trace_event_type event_type;
};

struct tracing_data_event {
 struct perf_event_header header;
 u32 size;
};

typedef union event_union {
 struct perf_event_header header;
 struct ip_event ip;
 struct mmap_event mmap;
 struct comm_event comm;
 struct fork_event fork;
 struct lost_event lost;
 struct read_event read;
 struct sample_event sample;
 struct attr_event attr;
 struct event_type_event event_type;
 struct tracing_data_event tracing_data;
 struct build_id_event build_id;
} event_t;

void event__print_totals(void);

struct perf_session;

typedef int (*event__handler_t)(event_t *event, struct perf_session *sessio=
n);

int event__synthesize_thread(pid_t pid, event__handler_t process,
        struct perf_session *session);
void event__synthesize_threads(event__handler_t process,
          struct perf_session *session);
int event__synthesize_kernel_mmap(event__handler_t process,
    struct perf_session *session,
    struct machine *machine,
    const char *symbol_name);

int event__synthesize_modules(event__handler_t process,
         struct perf_session *session,
         struct machine *machine);

int event__process_comm(event_t *self, struct perf_session *session);
int event__process_lost(event_t *self, struct perf_session *session);
int event__process_mmap(event_t *self, struct perf_session *session);
int event__process_task(event_t *self, struct perf_session *session);

struct addr_location;
int event__preprocess_sample(const event_t *self, struct perf_session *sess=
ion,
        struct addr_location *al, symbol_filter_t filter);
int event__parse_sample(event_t *event, u64 type, struct sample_data *data)=
;

extern const char *event__name[];
# 8 "util/callchain.h" 2
# 1 "util/symbol.h" 1

#define __PERF_SYMBOL 1





# 1 "util/include/linux/list.h" 1
# 9 "util/symbol.h" 2
# 1 "util/include/linux/rbtree.h" 1
# 10 "util/symbol.h" 2


#define DEBUG_CACHE_DIR ".debug"


extern char *cplus_demangle(const char *, int);

static inline char *bfd_demangle(void __attribute__((__unused__)) *v, const=
 char *c, int i)
{
 return cplus_demangle(c, i);
}
# 33 "util/symbol.h"
int hex2u64(const char *ptr, u64 *val);
char *strxfrchar(char *s, char from, char to);
# 43 "util/symbol.h"
#define PERF_ELF_C_READ_MMAP ELF_C_READ_MMAP



#define DMGL_PARAMS (1 << 0)
#define DMGL_ANSI (1 << 1)


#define BUILD_ID_SIZE 20

struct symbol {
 struct rb_node rb_node;
 u64 start;
 u64 end;
 u16 namelen;
 char name[0];
};

void symbol__delete(struct symbol *self);

struct strlist;

struct symbol_conf {
 unsigned short priv_size;
 _Bool try_vmlinux_path,
   use_modules,
   sort_by_name,
   show_nr_samples,
   use_callchain,
   exclude_other,
   full_paths,
   show_cpu_utilization;
 const char *vmlinux_name,
   *field_sep;
 const char *default_guest_vmlinux_name,
   *default_guest_kallsyms,
   *default_guest_modules;
 const char *guestmount;
 const char *dso_list_str,
   *comm_list_str,
   *sym_list_str,
   *col_width_list_str;
       struct strlist *dso_list,
   *comm_list,
   *sym_list;
};

extern struct symbol_conf symbol_conf;

static inline void *symbol__priv(struct symbol *self)
{
 return ((void *)self) - symbol_conf.priv_size;
}

struct ref_reloc_sym {
 const char *name;
 u64 addr;
 u64 unrelocated_addr;
};

struct map_symbol {
 struct map *map;
 struct symbol *sym;
};

struct addr_location {
 struct thread *thread;
 struct map *map;
 struct symbol *sym;
 u64 addr;
 char level;
 _Bool filtered;
 unsigned int cpumode;
};

enum dso_kernel_type {
 DSO_TYPE_USER =3D 0,
 DSO_TYPE_KERNEL,
 DSO_TYPE_GUEST_KERNEL
};

struct dso {
 struct list_head node;
 struct rb_root symbols[(MAP__VARIABLE + 1)];
 struct rb_root symbol_names[(MAP__VARIABLE + 1)];
 u8 adjust_symbols:1;
 u8 slen_calculated:1;
 u8 has_build_id:1;
 enum dso_kernel_type kernel;
 u8 hit:1;
 u8 annotate_warned:1;
 unsigned char origin;
 u8 sorted_by_name;
 u8 loaded;
 u8 build_id[20];
 const char *short_name;
 char *long_name;
 u16 long_name_len;
 u16 short_name_len;
 char name[0];
};

struct dso *dso__new(const char *name);
struct dso *dso__new_kernel(const char *name);
void dso__delete(struct dso *self);

_Bool dso__loaded(const struct dso *self, enum map_type type);
_Bool dso__sorted_by_name(const struct dso *self, enum map_type type);

static inline void dso__set_loaded(struct dso *self, enum map_type type)
{
 self->loaded |=3D (1 << type);
}

void dso__sort_by_name(struct dso *self, enum map_type type);

struct dso *__dsos__findnew(struct list_head *head, const char *name);

int dso__load(struct dso *self, struct map *map, symbol_filter_t filter);
int dso__load_vmlinux_path(struct dso *self, struct map *map,
      symbol_filter_t filter);
int dso__load_kallsyms(struct dso *self, const char *filename, struct map *=
map,
         symbol_filter_t filter);
int machine__load_kallsyms(struct machine *self, const char *filename,
      enum map_type type, symbol_filter_t filter);
int machine__load_vmlinux_path(struct machine *self, enum map_type type,
          symbol_filter_t filter);

size_t __dsos__fprintf(struct list_head *head, FILE *fp);

size_t machine__fprintf_dsos_buildid(struct machine *self, FILE *fp, _Bool =
with_hits);
size_t machines__fprintf_dsos(struct rb_root *self, FILE *fp);
size_t machines__fprintf_dsos_buildid(struct rb_root *self, FILE *fp, _Bool=
 with_hits);

size_t dso__fprintf_buildid(struct dso *self, FILE *fp);
size_t dso__fprintf(struct dso *self, enum map_type type, FILE *fp);

enum dso_origin {
 DSO__ORIG_KERNEL =3D 0,
 DSO__ORIG_GUEST_KERNEL,
 DSO__ORIG_JAVA_JIT,
 DSO__ORIG_BUILD_ID_CACHE,
 DSO__ORIG_FEDORA,
 DSO__ORIG_UBUNTU,
 DSO__ORIG_BUILDID,
 DSO__ORIG_DSO,
 DSO__ORIG_GUEST_KMODULE,
 DSO__ORIG_KMODULE,
 DSO__ORIG_NOT_FOUND,
};

char dso__symtab_origin(const struct dso *self);
void dso__set_long_name(struct dso *self, char *name);
void dso__set_build_id(struct dso *self, void *build_id);
void dso__read_running_kernel_build_id(struct dso *self, struct machine *ma=
chine);
struct symbol *dso__find_symbol(struct dso *self, enum map_type type, u64 a=
ddr);
struct symbol *dso__find_symbol_by_name(struct dso *self, enum map_type typ=
e,
     const char *name);

int filename__read_build_id(const char *filename, void *bf, size_t size);
int sysfs__read_build_id(const char *filename, void *bf, size_t size);
_Bool __dsos__read_build_ids(struct list_head *head, _Bool with_hits);
int build_id__sprintf(const u8 *self, int len, char *bf);
int kallsyms__parse(const char *filename, void *arg,
      int (*process_symbol)(void *arg, const char *name,
       char type, u64 start));

int __machine__create_kernel_maps(struct machine *self, struct dso *kernel)=
;
int machine__create_kernel_maps(struct machine *self);

int machines__create_kernel_maps(struct rb_root *self, pid_t pid);
int machines__create_guest_kernel_maps(struct rb_root *self);

int symbol__init(void);
_Bool symbol_type__is_a(char symbol_type, enum map_type map_type);

size_t machine__fprintf_vmlinux_path(struct machine *self, FILE *fp);
# 9 "util/callchain.h" 2

enum chain_mode {
 CHAIN_NONE,
 CHAIN_FLAT,
 CHAIN_GRAPH_ABS,
 CHAIN_GRAPH_REL
};

struct callchain_node {
 struct callchain_node *parent;
 struct list_head brothers;
 struct list_head children;
 struct list_head val;
 struct rb_node rb_node;
 struct rb_root rb_root;
 unsigned int val_nr;
 u64 hit;
 u64 children_hit;
};

struct callchain_param;

typedef void (*sort_chain_func_t)(struct rb_root *, struct callchain_node *=
,
     u64, struct callchain_param *);

struct callchain_param {
 enum chain_mode mode;
 u32 print_limit;
 double min_percent;
 sort_chain_func_t sort;
};

struct callchain_list {
 u64 ip;
 struct map_symbol ms;
 struct list_head list;
};

static inline void callchain_init(struct callchain_node *node)
{
 INIT_LIST_HEAD(&node->brothers);
 INIT_LIST_HEAD(&node->children);
 INIT_LIST_HEAD(&node->val);

 node->children_hit =3D 0;
 node->parent =3D ((void *)0);
 node->hit =3D 0;
}

static inline u64 cumul_hits(struct callchain_node *node)
{
 return node->hit + node->children_hit;
}

int register_callchain_param(struct callchain_param *param);
int append_chain(struct callchain_node *root, struct ip_callchain *chain,
   struct map_symbol *syms, u64 period);

_Bool ip_callchain__valid(struct ip_callchain *chain, event_t *event);
# 20 "util/callchain.c" 2

_Bool ip_callchain__valid(struct ip_callchain *chain, event_t *event)
{
 unsigned int chain_size =3D event->header.size;
 chain_size -=3D (unsigned long)&event->ip.__more_data - (unsigned long)eve=
nt;
 return chain->nr * sizeof(u64) <=3D chain_size;
}

#define chain_for_each_child(child,parent) list_for_each_entry(child, &pare=
nt->children, brothers)


static void
rb_insert_callchain(struct rb_root *root, struct callchain_node *chain,
      enum chain_mode mode)
{
 struct rb_node **p =3D &root->rb_node;
 struct rb_node *parent =3D ((void *)0);
 struct callchain_node *rnode;
 u64 chain_cumul =3D cumul_hits(chain);

 while (*p) {
  u64 rnode_cumul;

  parent =3D *p;
  rnode =3D ({ const typeof(((struct callchain_node *)0)->rb_node) * __mptr=
 =3D (parent); (struct callchain_node *)((char *)__mptr - __builtin_offseto=
f (struct callchain_node, rb_node)); });
  rnode_cumul =3D cumul_hits(rnode);

  switch (mode) {
  case CHAIN_FLAT:
   if (rnode->hit < chain->hit)
    p =3D &(*p)->rb_left;
   else
    p =3D &(*p)->rb_right;
   break;
  case CHAIN_GRAPH_ABS:
  case CHAIN_GRAPH_REL:
   if (rnode_cumul < chain_cumul)
    p =3D &(*p)->rb_left;
   else
    p =3D &(*p)->rb_right;
   break;
  case CHAIN_NONE:
  default:
   break;
  }
 }

 rb_link_node(&chain->rb_node, parent, p);
 rb_insert_color(&chain->rb_node, root);
}

static void
__sort_chain_flat(struct rb_root *rb_root, struct callchain_node *node,
    u64 min_hit)
{
 struct callchain_node *child;

 for (child =3D ({ const typeof(((typeof(*child) *)0)->brothers) * __mptr =
=3D ((&node->children)->next); (typeof(*child) *)((char *)__mptr - __builti=
n_offsetof (typeof(*child), brothers)); }); prefetch(child->brothers.next),=
 &child->brothers !=3D (&node->children); child =3D ({ const typeof(((typeo=
f(*child) *)0)->brothers) * __mptr =3D (child->brothers.next); (typeof(*chi=
ld) *)((char *)__mptr - __builtin_offsetof (typeof(*child), brothers)); }))
  __sort_chain_flat(rb_root, child, min_hit);

 if (node->hit && node->hit >=3D min_hit)
  rb_insert_callchain(rb_root, node, CHAIN_FLAT);
}





static void
sort_chain_flat(struct rb_root *rb_root, struct callchain_node *node,
  u64 min_hit, struct callchain_param *param __attribute__((__unused__)))
{
 __sort_chain_flat(rb_root, node, min_hit);
}

static void __sort_chain_graph_abs(struct callchain_node *node,
       u64 min_hit)
{
 struct callchain_node *child;

 node->rb_root =3D (struct rb_root) { ((void *)0), };

 for (child =3D ({ const typeof(((typeof(*child) *)0)->brothers) * __mptr =
=3D ((&node->children)->next); (typeof(*child) *)((char *)__mptr - __builti=
n_offsetof (typeof(*child), brothers)); }); prefetch(child->brothers.next),=
 &child->brothers !=3D (&node->children); child =3D ({ const typeof(((typeo=
f(*child) *)0)->brothers) * __mptr =3D (child->brothers.next); (typeof(*chi=
ld) *)((char *)__mptr - __builtin_offsetof (typeof(*child), brothers)); }))=
 {
  __sort_chain_graph_abs(child, min_hit);
  if (cumul_hits(child) >=3D min_hit)
   rb_insert_callchain(&node->rb_root, child,
         CHAIN_GRAPH_ABS);
 }
}

static void
sort_chain_graph_abs(struct rb_root *rb_root, struct callchain_node *chain_=
root,
       u64 min_hit, struct callchain_param *param __attribute__((__unused__=
)))
{
 __sort_chain_graph_abs(chain_root, min_hit);
 rb_root->rb_node =3D chain_root->rb_root.rb_node;
}

static void __sort_chain_graph_rel(struct callchain_node *node,
       double min_percent)
{
 struct callchain_node *child;
 u64 min_hit;

 node->rb_root =3D (struct rb_root) { ((void *)0), };
 min_hit =3D ceil(node->children_hit * min_percent);

 for (child =3D ({ const typeof(((typeof(*child) *)0)->brothers) * __mptr =
=3D ((&node->children)->next); (typeof(*child) *)((char *)__mptr - __builti=
n_offsetof (typeof(*child), brothers)); }); prefetch(child->brothers.next),=
 &child->brothers !=3D (&node->children); child =3D ({ const typeof(((typeo=
f(*child) *)0)->brothers) * __mptr =3D (child->brothers.next); (typeof(*chi=
ld) *)((char *)__mptr - __builtin_offsetof (typeof(*child), brothers)); }))=
 {
  __sort_chain_graph_rel(child, min_percent);
  if (cumul_hits(child) >=3D min_hit)
   rb_insert_callchain(&node->rb_root, child,
         CHAIN_GRAPH_REL);
 }
}

static void
sort_chain_graph_rel(struct rb_root *rb_root, struct callchain_node *chain_=
root,
       u64 min_hit __attribute__((__unused__)), struct callchain_param *par=
am)
{
 __sort_chain_graph_rel(chain_root, param->min_percent / 100.0);
 rb_root->rb_node =3D chain_root->rb_root.rb_node;
}

int register_callchain_param(struct callchain_param *param)
{
 switch (param->mode) {
 case CHAIN_GRAPH_ABS:
  param->sort =3D sort_chain_graph_abs;
  break;
 case CHAIN_GRAPH_REL:
  param->sort =3D sort_chain_graph_rel;
  break;
 case CHAIN_FLAT:
  param->sort =3D sort_chain_flat;
  break;
 case CHAIN_NONE:
 default:
  return -1;
 }
 return 0;
}





static struct callchain_node *
create_child(struct callchain_node *parent, _Bool inherit_children)
{
 struct callchain_node *new;

 new =3D zalloc(sizeof(*new));
 if (!new) {
  perror("not enough memory to create child for code path tree");
  return ((void *)0);
 }
 new->parent =3D parent;
 INIT_LIST_HEAD(&new->children);
 INIT_LIST_HEAD(&new->val);

 if (inherit_children) {
  struct callchain_node *next;

  list_splice(&parent->children, &new->children);
  INIT_LIST_HEAD(&parent->children);

  for (next =3D ({ const typeof(((typeof(*next) *)0)->brothers) * __mptr =
=3D ((&new->children)->next); (typeof(*next) *)((char *)__mptr - __builtin_=
offsetof (typeof(*next), brothers)); }); prefetch(next->brothers.next), &ne=
xt->brothers !=3D (&new->children); next =3D ({ const typeof(((typeof(*next=
) *)0)->brothers) * __mptr =3D (next->brothers.next); (typeof(*next) *)((ch=
ar *)__mptr - __builtin_offsetof (typeof(*next), brothers)); }))
   next->parent =3D new;
 }
 list_add_tail(&new->brothers, &parent->children);

 return new;
}


struct resolved_ip {
 u64 ip;
 struct map_symbol ms;
};

struct resolved_chain {
 u64 nr;
 struct resolved_ip ips[0];
};





static void
fill_node(struct callchain_node *node, struct resolved_chain *chain, int st=
art)
{
 unsigned int i;

 for (i =3D start; i < chain->nr; i++) {
  struct callchain_list *call;

  call =3D zalloc(sizeof(*call));
  if (!call) {
   perror("not enough memory for the code path tree");
   return;
  }
  call->ip =3D chain->ips[i].ip;
  call->ms =3D chain->ips[i].ms;
  list_add_tail(&call->list, &node->val);
 }
 node->val_nr =3D chain->nr - start;
 if (!node->val_nr)
  eprintf(0, "Warning: empty node in callchain tree\n");
}

static void
add_child(struct callchain_node *parent, struct resolved_chain *chain,
   int start, u64 period)
{
 struct callchain_node *new;

 new =3D create_child(parent, 0);
 fill_node(new, chain, start);

 new->children_hit =3D 0;
 new->hit =3D period;
}






static void
split_add_child(struct callchain_node *parent, struct resolved_chain *chain=
,
  struct callchain_list *to_split, int idx_parents, int idx_local,
  u64 period)
{
 struct callchain_node *new;
 struct list_head *old_tail;
 unsigned int idx_total =3D idx_parents + idx_local;


 new =3D create_child(parent, 1);


 old_tail =3D parent->val.prev;
 list_del_range(&to_split->list, old_tail);
 new->val.next =3D &to_split->list;
 new->val.prev =3D old_tail;
 to_split->list.prev =3D &new->val;
 old_tail->next =3D &new->val;


 new->hit =3D parent->hit;
 new->children_hit =3D parent->children_hit;
 parent->children_hit =3D cumul_hits(new);
 new->val_nr =3D parent->val_nr - idx_local;
 parent->val_nr =3D idx_local;


 if (idx_total < chain->nr) {
  parent->hit =3D 0;
  add_child(parent, chain, idx_total, period);
  parent->children_hit +=3D period;
 } else {
  parent->hit =3D period;
 }
}

static int
__append_chain(struct callchain_node *root, struct resolved_chain *chain,
        unsigned int start, u64 period);

static void
__append_chain_children(struct callchain_node *root,
   struct resolved_chain *chain,
   unsigned int start, u64 period)
{
 struct callchain_node *rnode;


 for (rnode =3D ({ const typeof(((typeof(*rnode) *)0)->brothers) * __mptr =
=3D ((&root->children)->next); (typeof(*rnode) *)((char *)__mptr - __builti=
n_offsetof (typeof(*rnode), brothers)); }); prefetch(rnode->brothers.next),=
 &rnode->brothers !=3D (&root->children); rnode =3D ({ const typeof(((typeo=
f(*rnode) *)0)->brothers) * __mptr =3D (rnode->brothers.next); (typeof(*rno=
de) *)((char *)__mptr - __builtin_offsetof (typeof(*rnode), brothers)); }))=
 {
  unsigned int ret =3D __append_chain(rnode, chain, start, period);

  if (!ret)
   goto inc_children_hit;
 }

 add_child(root, chain, start, period);

inc_children_hit:
 root->children_hit +=3D period;
}

static int
__append_chain(struct callchain_node *root, struct resolved_chain *chain,
        unsigned int start, u64 period)
{
 struct callchain_list *cnode;
 unsigned int i =3D start;
 _Bool found =3D 0;






 for (cnode =3D ({ const typeof(((typeof(*cnode) *)0)->list) * __mptr =3D (=
(&root->val)->next); (typeof(*cnode) *)((char *)__mptr - __builtin_offsetof=
 (typeof(*cnode), list)); }); prefetch(cnode->list.next), &cnode->list !=3D=
 (&root->val); cnode =3D ({ const typeof(((typeof(*cnode) *)0)->list) * __m=
ptr =3D (cnode->list.next); (typeof(*cnode) *)((char *)__mptr - __builtin_o=
ffsetof (typeof(*cnode), list)); })) {
  struct symbol *sym;

  if (i =3D=3D chain->nr)
   break;

  sym =3D chain->ips[i].ms.sym;

  if (cnode->ms.sym && sym) {
   if (cnode->ms.sym->start !=3D sym->start)
    break;
  } else if (cnode->ip !=3D chain->ips[i].ip)
   break;

  if (!found)
   found =3D 1;
  i++;
 }


 if (!found)
  return -1;


 if (i - start < root->val_nr) {
  split_add_child(root, chain, cnode, start, i - start, period);
  return 0;
 }


 if (i - start =3D=3D root->val_nr && i =3D=3D chain->nr) {
  root->hit +=3D period;
  return 0;
 }


 __append_chain_children(root, chain, i, period);

 return 0;
}

static void filter_context(struct ip_callchain *old, struct resolved_chain =
*new,
      struct map_symbol *syms)
{
 int i, j =3D 0;

 for (i =3D 0; i < (int)old->nr; i++) {
  if (old->ips[i] >=3D PERF_CONTEXT_MAX)
   continue;

  new->ips[j].ip =3D old->ips[i];
  new->ips[j].ms =3D syms[i];
  j++;
 }

 new->nr =3D j;
}


int append_chain(struct callchain_node *root, struct ip_callchain *chain,
   struct map_symbol *syms, u64 period)
{
 struct resolved_chain *filtered;

 if (!chain->nr)
  return 0;

 filtered =3D zalloc(sizeof(*filtered) +
     chain->nr * sizeof(struct resolved_ip));
 if (!filtered)
  return -12;

 filter_context(chain, filtered, syms);

 if (!filtered->nr)
  goto end;

 __append_chain_children(root, filtered, 0, period);
end:
 free(filtered);

 return 0;
}

--------------010303080502020801060100--
