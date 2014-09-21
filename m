Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id D7067609BF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Sep 2014 08:01:41 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 8F9EF2331F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Sep 2014 10:01:39 +0200 (CEST)
Message-ID: <541E85E3.7070901@pseudoterminal.org>
Date: Sun, 21 Sep 2014 10:01:39 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: internal compiler error while building valgrind ptest
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
X-List-Received-Date: Sun, 21 Sep 2014 08:01:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am trying to build valgrind. This ptest compile error occurs:

arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork 
-mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 
--sysroot=/home/build/OE/poky/build/tmp/sysroots/cubox-i -DHAVE_CONFIG_H 
-I. 
-I/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm 
-I../../.. 
-I/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0 
-I/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/include 
-I/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/coregrind 
-I../../../include 
-I/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/VEX/pub 
-DVGA_arm=1 -DVGO_linux=1 -DVGP_arm_linux=1 -DVGPV_arm_linux_vanilla=1   
-Winline -Wall -Wshadow -g -Wno-long-long  -O2 -pipe -g 
-feliminate-unused-debug-types -Wwrite-strings -fno-stack-protector 
-Wno-write-strings  -c -o vcvt_fixed_float_VFP.o 
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c: 
In function 'f64_to_s32_imm1':
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c:147:3: 
warning: dereferencing type-punned pointer will break strict-aliasing 
rules [-Wstrict-aliasing]
    return *(ULong*)(&block[3]);
    ^
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c: 
In function 'f64_to_s32_imm32':
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c:162:3: 
warning: dereferencing type-punned pointer will break strict-aliasing 
rules [-Wstrict-aliasing]
    return *(ULong*)(&block[3]);
    ^
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c: 
In function 'f64_to_u32_imm1':
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c:187:3: 
warning: dereferencing type-punned pointer will break strict-aliasing 
rules [-Wstrict-aliasing]
    return *(ULong*)(&block[3]);
    ^
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c: 
In function 'f64_to_u32_imm32':
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c:202:3: 
warning: dereferencing type-punned pointer will break strict-aliasing 
rules [-Wstrict-aliasing]
    return *(ULong*)(&block[3]);
    ^
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c: 
In function 's32_to_f32_imm1':
/home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c:12:1: 
internal compiler error: Max. number of generated reload insns per insn 
is achieved (90)

  }
  ^


If I remove ptest from the valgrind recipe, everything is OK.


Has anybody seen a similar error?

