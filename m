Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 481A570030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 07:50:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0J7oQ16021820
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 23:50:26 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jan 2016 23:50:25 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <569DE54C.7090506@windriver.com> <569DEA11.30107@windriver.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <569DEAC0.9080204@windriver.com>
Date: Tue, 19 Jan 2016 15:50:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <569DEA11.30107@windriver.com>
Subject: Re: [BUG REPORT] failed to build valgrind on qemuarm
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
X-List-Received-Date: Tue, 19 Jan 2016 07:50:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年01月19日 15:47, Robert Yang wrote:
>
> On 01/19/2016 03:27 PM, Rongqing Li wrote:
>> 1. on qemuarm:
>
> There is a patch for this:
> [OE-core] [PATCH] valgrind: make it explicit that valgrind supports
> armv7a and above
>
> // Robert

which armv7 BSP is tested?

thanks

-Roy


>
>>
>> | arm-poky-linux-gnueabi-gcc  -march=armv5e -marm
>> --sysroot=/buildarea1/lirq/Yocto/poky/arm/tmp/sysroots/qemuarm
>> -DHAVE_CONFIG_H
>> -I. -I../../valgrind-3.11.0/memcheck -I.. -I../../valgrind-3.11.0
>> -I../../valgrind-3.11.0/include -I../../valgrind-3.11.0/VEX/pub
>> -I../VEX/pub
>> -DVGA_arm=1 -DVGO_linux=1 -DVGP_arm_linux=1
>> -DVGPV_arm_linux_vanilla=1  -O2 -g
>> -std=gnu99 -Wall -Wmissing-prototypes -Wshadow -Wpointer-arith
>> -Wstrict-prototypes -Wmissing-declarations -Wcast-qual -Wwrite-strings
>> -Wempty-body -Wformat -Wformat-security -Wignored-qualifiers
>> -Wmissing-parameter-type -Wold-style-declaration -fno-stack-protector
>> -fno-strict-aliasing -fno-builtin  -marm -mcpu=cortex-a8 -O -g
>> -fno-omit-frame-pointer -fno-strict-aliasing -fpic -fno-builtin
>> -fno-ipa-icf -O2
>> -O2 -pipe -g -feliminate-unused-debug-types -c -o
>> vgpreload_memcheck_arm_linux_so-mc_replace_strmem.o `test -f
>> 'mc_replace_strmem.c' || echo
>> '../../valgrind-3.11.0/memcheck/'`mc_replace_strmem.c
>> | for f in ; do \
>> |   if [ ! -e $f.dSYM  -o  $f -nt $f.dSYM ] ; then \
>> |       echo "dsymutil $f"; \
>> |       dsymutil $f; \
>> |   fi; \
>> | done
>> | ../../valgrind-3.11.0/memcheck/mc_malloc_wrappers.c:1:0: warning:
>> switch
>> -mcpu=cortex-a8 conflicts with -march=armv5e switch
>> |
>> |  ^
>> | mkdir -p ../.in_place; \
>> | for f in ; do \
>> |   rm -f ../.in_place/$f.dSYM; \
>> |   ln -f -s ../memcheck/$f.dSYM ../.in_place; \
>> | done
>> | ../../valgrind-3.11.0/memcheck/mc_leakcheck.c:1:0: warning: switch
>> -mcpu=cortex-a8 conflicts with -march=armv5e switch
>> |
>> |  ^
>> | ../../valgrind-3.11.0/memcheck/mc_replace_strmem.c:1:0: warning: switch
>> -mcpu=cortex-a8 conflicts with -march=armv5e switch
>> |
>> |  ^
>> | ../../valgrind-3.11.0/memcheck/mc_errors.c:1:0: warning: switch
>> -mcpu=cortex-a8 conflicts with -march=armv5e switch
>> |
>> |  ^
>> | ../../valgrind-3.11.0/memcheck/mc_translate.c:1:0: warning: switch
>> -mcpu=cortex-a8 conflicts with -march=armv5e switch
>> |
>> |  ^
>> | ../../valgrind-3.11.0/memcheck/mc_machine.c:1:0: warning: switch
>> -mcpu=cortex-a8 conflicts with -march=armv5e switch
>> |
>> |  ^
>> | ../../valgrind-3.11.0/memcheck/mc_main.c:1:0: warning: switch
>> -mcpu=cortex-a8
>> conflicts with -march=armv5e switch
>> |  /* -*- mode: C; c-basic-offset: 3; -*- */
>> |  ^
>> | {standard input}: Assembler messages:
>> | {standard input}:25: Error: selected processor does not support ARM
>> mode `movw
>> r3,#:lower16:primary_map'
>> | {standard input}:28: Error: selected processor does not support ARM
>> mode `movt
>> r3,#:upper16:primary_map'
>> | {standard input}:30: Error: selected processor does not support ARM
>> mode `uxth
>> r1,r0'
>> | {standard input}:31: Error: selected processor does not support ARM
>> mode `movw
>> r3,#0xAAAA'
>> | {standard input}:40: Error: selected processor does not support ARM
>> mode `movw
>> r3,#0x5555'
>> | {standard input}:61: Error: selected processor does not support ARM
>> mode `movw
>> r3,#:lower16:primary_map'
>> | {standard input}:64: Error: selected processor does not support ARM
>> mode `movt
>> r3,#:upper16:primary_map'
>> | {standard input}:66: Error: selected processor does not support ARM
>> mode `uxth
>> r1,r0'
>> | {standard input}:94: Error: selected processor does not support ARM
>> mode `movw
>> r3,#:lower16:primary_map'
>> | {standard input}:95: Error: selected processor does not support ARM
>> mode `uxth
>> r1,r0'
>> | {standard input}:96: Error: selected processor does not support ARM
>> mode `movt
>> r3,#:upper16:primary_map'
>> | {standard input}:135: Error: selected processor does not support ARM
>> mode
>> `movw r3,#:lower16:primary_map'
>> | {standard input}:136: Error: selected processor does not support ARM
>> mode
>> `uxth r1,r0'
>> | {standard input}:137: Error: selected processor does not support ARM
>> mode
>> `movt r3,#:upper16:primary_map'
>>
>>
>>
>> 2: on qemuarma9
>>
>>
>> | arm-wrs-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=softfp  -marm
>> -mthumb-interwork
>> --sysroot=/work/wr/buildarea/arm/bitbake_build/tmp/sysroots/qemuarma9
>> -DHAVE_CONFIG_H -I.
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests
>>
>> -I../..
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0
>>
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/include
>>
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind
>>
>> -I../../include
>> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/VEX/pub
>>
>> -I../../VEX/pub -DVGA_arm=1 -DVGO_linux=1 -DVGP_arm_linux=1
>> -DVGPV_arm_linux_vanilla=1   -Winline -Wall -Wshadow -Wno-long-long -g
>> -fno-stack-protector    -O2 -pipe -g  -fno-omit-frame-pointer
>> -fvisibility=default -O0 -c -o sh-mem-random.o
>> /work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests/sh-mem-random.c
>>
>>
>> | {standard input}: Assembler messages:
>> | {standard input}:1107: Error: selected processor does not support
>> ARM mode
>> `vld1.64 {d7},[r3]'
>> | {standard input}:1107: Error: selected processor does not support
>> ARM mode
>> `vst1.64 {d7},[r2]'
>> | Makefile:2467: recipe for target 'sh-mem-random.o' failed
>>
>>
>> and the codes are below:
>>
>> 194 #elif defined(__linux__) && defined(__arm__) && !defined(__aarch64__)
>> 195             /* On arm32, many compilers generate a 64-bit float move
>> 196                using two 32 bit integer registers, which completely
>> 197                defeats this test.  Hence force a 64-bit NEON load and
>> 198                store.  I guess this will break the build on non-NEON
>> 199                capable targets. */
>> 200             __asm__ __volatile__ (
>> 201                "vld1.64 {d7},[%0] ; vst1.64 {d7},[%1] "
>> 202                : : "r"(arr+src), "r"(arr+dst) : "d7","memory"
>> 203             );
>> 204 #else
>>
>>
>> -Roy
>

-- 
Best Reagrds,
Roy | RongQing Li

