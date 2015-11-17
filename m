Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 206C46057A;
	Tue, 17 Nov 2015 22:53:57 +0000 (UTC)
Received: by ioir85 with SMTP id r85so35296545ioi.1;
	Tue, 17 Nov 2015 14:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=lc1bbHt4RCTeOqytjhZt6tVaXJaeREY4z3HKXKadJxc=;
	b=hB7ebyUsyFe7LPeDw/ZYpwJJwg1tHPQP5p2glXDgZoOGvGxvcetN3HRHxprRCrRDT7
	GLKvVeREhPLIa1+leQ6Jectq7MzvPrPWDwzOiEYaw4bB58Pasyp3wPv4nyYMVQLRVbi+
	A2NPP0nvxudSDqs9SoaEDLTeVgdijrGzi1EkI2Dp1L5HmvV6gT3kmrhQSUV9287dFEIf
	kxueuvPTL94Ux242Kpk6sWY33ROxVi7zenuZDukXWGRHlw+fcZCdUz87Zi6gubjRd8tA
	ZcNDulrhMcrOzgytCC4AS72WniDh3hkPkF/ItefVAbFjnlMBXYxfmFsNepuOA994oRnq
	JGkw==
MIME-Version: 1.0
X-Received: by 10.107.135.30 with SMTP id j30mr19439iod.148.1447800837733;
	Tue, 17 Nov 2015 14:53:57 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Tue, 17 Nov 2015 14:53:57 -0800 (PST)
Date: Tue, 17 Nov 2015 23:53:57 +0100
Message-ID: <CALbNGRQp4XcpjKdHKq2xTWbANWe6LzxzKeWXNpLg5Db9LoTxvg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: target g++ oddities (with qt5-creator)
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
X-List-Received-Date: Tue, 17 Nov 2015 22:54:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I try to get qt5-creator running on target again. Up to now I had two
non working scenarios with gcc 5.2:

* Qt 5.5 + qt-creator 3.5.1: As soon as I select /usr/bin/g++ as
compiler (shipped by g++-symlinks) qt-creator crashes
* Qt 5.6aplpha + qtcreator 3.5.1: I can select g++ in qt-creator/Menu
Tools/Options/Build & Run/Tab Compiler. Unfortunately the compiler set
cannot be selected in Tab 'Kits'. The 'Compiler' combobox remains
disabled

I don't know if it is causing the problem but when I run 'g++
--target-help' I get (see error at the end)

[operator@bbone ~]$ g++ --target-help
The following options are target specific:
  -mabi=                      Specify an ABI
  -mabort-on-noreturn         Generate a call to abort if a noreturn
function returns
  -mandroid                   Generate code for the Android platform.
  -mapcs-float                Pass FP arguments in FP registers
  -mapcs-frame                Generate APCS conformant stack frames
  -mapcs-reentrant            Generate re-entrant, PIC code
  -march=                     Specify the name of the target architecture
  -marm                       Generate code in 32 bit ARM state.
  -masm-syntax-unified        Assume unified syntax for Thumb inline
assembly code.
  -mbig-endian                Assume target CPU is configured as big endian
  -mbionic                    Use Bionic C library
  -mcallee-super-interworking Thumb: Assume non-static functions may
be called from ARM code
  -mcaller-super-interworking Thumb: Assume function pointers may go
to non-Thumb aware code
  -mcpu=                      Specify the name of the target CPU
  -mfix-cortex-m3-ldrd        Avoid overlapping destination and
address registers on LDRD instructions that may trigger Cortex-M3
errata.
  -mfloat-abi=                Specify if floating point hardware should be used
  -mfp16-format=              Specify the __fp16 floating-point format
  -mfpu=                      Specify the name of the target floating
point hardware/format
  -mglibc                     Use GNU C library
  -mlittle-endian             Assume target CPU is configured as little endian
  -mlong-calls                Generate call insns as indirect calls,
if necessary
  -mneon-for-64bits           Use Neon to perform 64-bits operations
rather than core registers.
  -mnew-generic-costs         Use the new generic RTX cost tables if
new core-specific cost table not available (transitional).
  -mold-rtx-costs             Use the old RTX costing tables (transitional).
  -mpic-data-is-text-relative Assume data segments are relative to text segment.
  -mpic-register=             Specify the register to be used for PIC addressing
  -mpoke-function-name        Store function names in object code
  -mprint-tune-info           Print CPU tuning information as comment
in assembler file.  This is an option used only for regression testing
of the compiler and not
                              intended for ordinary use in compiling code.
  -mrestrict-it               Generate IT blocks appropriate for ARMv8.
  -msched-prolog              Permit scheduling of a function's
prologue sequence
  -msingle-pic-base           Do not load the PIC register in function prologues
  -mslow-flash-data           Assume loading data from flash is slower
than fetching instructions.
  -mstructure-size-boundary=  Specify the minimum bit alignment of structures
  -mthumb                     Generate code for Thumb state
  -mthumb-interwork           Support calls between Thumb and ARM
instruction sets
  -mtls-dialect=              Specify thread local storage scheme
  -mtp=                       Specify how to access the thread pointer
  -mtpcs-frame                Thumb: Generate (non-leaf) stack frames
even if not needed
  -mtpcs-leaf-frame           Thumb: Generate (leaf) stack frames even
if not needed
  -mtune=                     Tune code for the given processor
  -muclibc                    Use uClibc C library
  -munaligned-access          Enable unaligned word and halfword
accesses to packed data.
  -mvectorize-with-neon-double Use Neon double-word (rather than
quad-word) registers for vectorization
  -mvectorize-with-neon-quad  Use Neon quad-word (rather than
double-word) registers for vectorization
  -mword-relocations          Only generate absolute relocations on
word sized values.

  Known ARM ABIs (for use with the -mabi= option):
    aapcs aapcs-linux apcs-gnu atpcs iwmmxt

  Known ARM architectures (for use with the -march= option):
    armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te
armv6 armv6-m armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7
armv7-a armv7-m armv7-r armv7e-m
    armv7ve armv8-a armv8-a+crc iwmmxt iwmmxt2 native

  Known __fp16 formats (for use with the -mfp16-format= option):
    alternative ieee none

  Known ARM FPUs (for use with the -mfpu= option):
    crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16
neon neon-fp-armv8 neon-fp16 neon-vfpv4 vfp vfp3 vfpv3 vfpv3-d16
vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd
    vfpv3xd-fp16 vfpv4 vfpv4-d16

  Valid arguments to -mtp=:
    auto cp15 soft

  Known floating-point ABIs (for use with the -mfloat-abi= option):
    hard soft softfp

  Known ARM CPUs (for use with the -mcpu= and -mtune= options):
    arm1020e arm1020t arm1022e arm1026ej-s arm10e arm10tdmi arm1136j-s
arm1136jf-s arm1156t2-s arm1156t2f-s arm1176jz-s arm1176jzf-s arm2
arm250 arm3 arm6 arm60 arm600
    arm610 arm620 arm7 arm70 arm700 arm700i arm710 arm7100 arm710c
arm710t arm720 arm720t arm740t arm7500 arm7500fe arm7d arm7di arm7dm
arm7dmi arm7m arm7tdmi arm7tdmi-s
    arm8 arm810 arm9 arm920 arm920t arm922t arm926ej-s arm940t
arm946e-s arm966e-s arm968e-s arm9e arm9tdmi cortex-a12 cortex-a15
cortex-a15.cortex-a7 cortex-a17
    cortex-a17.cortex-a7 cortex-a5 cortex-a53 cortex-a57
cortex-a57.cortex-a53 cortex-a7 cortex-a72 cortex-a72.cortex-a53
cortex-a8 cortex-a9 cortex-m0
    cortex-m0.small-multiply cortex-m0plus
cortex-m0plus.small-multiply cortex-m1 cortex-m1.small-multiply
cortex-m3 cortex-m4 cortex-m7 cortex-r4 cortex-r4f cortex-r5
    cortex-r7 ep9312 exynos-m1 fa526 fa606te fa626 fa626te fa726te
fmp626 generic-armv7-a iwmmxt iwmmxt2 marvell-pj4 mpcore mpcorenovfp
native strongarm strongarm110
    strongarm1100 strongarm1110 xgene1 xscale

  TLS dialect to use:
    gnu gnu2

Assembler options
=================

Use "-Wa,OPTION" to pass "OPTION" to the assembler.

 ARM-specific assembler options:
  -k                      generate PIC code
  -mthumb                 assemble Thumb code
  -mthumb-interwork       support ARM/Thumb interworking
  -mapcs-32               code uses 32-bit program counter
  -mapcs-26               code uses 26-bit program counter
  -mapcs-float            floating point args are in fp regs
  -mapcs-reentrant        re-entrant code
  -matpcs                 code is ATPCS conformant
  -mbig-endian            assemble for big-endian
  -mlittle-endian         assemble for little-endian
  -mapcs-frame            use frame pointer
  -mapcs-stack-check      use stack size checking
  -mno-warn-deprecated    do not warn on use of deprecated feature
  -mcpu=<cpu name>      assemble for CPU <cpu name>
  -march=<arch name>      assemble for architecture <arch name>
  -mfpu=<fpu name>      assemble for FPU architecture <fpu name>
  -mfloat-abi=<abi>      assemble for floating point ABI <abi>
  -meabi=<ver>          assemble for eabi version <ver>
  -mimplicit-it=<mode>      controls implicit insertion of IT instructions
  -mccs              TI CodeComposer Studio syntax compatibility mode
  -EB                     assemble code for a big-endian cpu
  -EL                     assemble code for a little-endian cpu
  --fix-v4bx              Allow BX in ARMv4 code

Linker options
==============

Use "-Wl,OPTION" to pass "OPTION" to the linker.

/usr/lib/gcc/arm-angstrom-linux-gnueabi/5.2.0/../../../../arm-angstrom-linux-gnueabi/bin/ld:
--target-help: unknown option
/usr/lib/gcc/arm-angstrom-linux-gnueabi/5.2.0/../../../../arm-angstrom-linux-gnueabi/bin/ld:
use the --help option for usage information
collect2: error: ld returned 1 exit status



Help appreciated.

Andreas

