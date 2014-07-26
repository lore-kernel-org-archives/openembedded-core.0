Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 37C2160B05
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 21:30:22 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id z11so4590320lbi.13
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 14:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pFj1jSVdU7rN2hwBlgKVfAPol+UyLKoTzJeKU3o10bc=;
	b=MHEWrzD31h3vQQUWp4D4atNAV6cJGTYUzos0IZIS/7T1ZPN8w3gH1rUk8Ew+5lJHyk
	lcYxIIeQ4C1kQFwfocMjcDtlT4SqybsErEXT2IvsBSxTjiS3xIk3Nu4aHA56uMWTcxTe
	UnLcVvXttFWsjaookzey+Hm5pvfDxdK4trztyQWodNPTVmO2nNVoy6NbjhN1fpHmH9QI
	X5u1cjqGfObXyPnfa3px3gn5Wg/aJ6T5+RsccGBJKZjmTcY1jRE0d2ARXfIH1jRhCUw6
	iPmRehiIcOlnZbXRNwmIu3qTp6Iz4y2dlUICiU9C9gZd56TZ5t7Q2V3p3EakVGUN5RF/
	jTnQ==
MIME-Version: 1.0
X-Received: by 10.112.155.129 with SMTP id vw1mr22970309lbb.7.1406410222853;
	Sat, 26 Jul 2014 14:30:22 -0700 (PDT)
Received: by 10.112.207.9 with HTTP; Sat, 26 Jul 2014 14:30:22 -0700 (PDT)
In-Reply-To: <CAMKF1sp=PD0RfP4_Un49N=QJex77UubaQv3BjFv5JX2Na-VhsA@mail.gmail.com>
References: <CAAQYJAt1sQtz_sb=5NdWG2Ypkwgz+BRYAYiRWgA+hh9EaszT8Q@mail.gmail.com>
	<CAMKF1sp=PD0RfP4_Un49N=QJex77UubaQv3BjFv5JX2Na-VhsA@mail.gmail.com>
Date: Sat, 26 Jul 2014 23:30:22 +0200
Message-ID: <CAAQYJAu=uESMPjgfBBNSCEne5tHq6D_5r67AYFKabcFx7qQB2Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] libgcrypt.so.20.0.1' has relocations in .text [textrel]
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
X-List-Received-Date: Sat, 26 Jul 2014 21:30:24 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 26, 2014 at 6:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jul 25, 2014 at 3:21 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> Hi, somehow this QA is repeatedly here:
>>
>> andrea@mizar:/oe/oe-core/build$ bitbake core-image-base
>> Loading cache: 100% |###########################################| ETA:  00:00:00
>> Loaded 2519 entries from dependency cache.
>> Parsing recipes: 100% |#########################################| Time: 00:00:07
>> Parsing of 2066 .bb files complete (2065 cached, 1 parsed). 2519
>> targets, 115 skipped, 0 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION        = "1.23.1"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Ubuntu-14.04"
>> TARGET_SYS        = "arm-oe-linux-gnueabi"
>> MACHINE           = "poodle"
>> DISTRO            = "nodistro"
>> DISTRO_VERSION    = "nodistro.0"
>> TUNE_FEATURES     = "arm armv5 thumb dsp"
>> TARGET_FPU        = "soft"
>> meta              = "master:188545ba82119d75f80dde322a73712ce1f0f762"
>> meta-initramfs    = "master:1060b4a157c5854f071f0dd7b48d55faeef3f818"
>> meta-handheld     = "master:b61b450a0639aaac6f17ec4656950e28545c90e0"
>> meta-oe
>> meta-networking   = "master:1060b4a157c5854f071f0dd7b48d55faeef3f818"
>> meta-opie         = "master:369016695601cea46915fe47de1d86d31dd9acd7"
>>
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> NOTE: validating kernel config, see log.do_kernel_configcheck for details
>> WARNING: QA Issue: ELF binary
>> '/oe/oe-core/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/libgcrypt/usr/lib/libgcrypt.so.20.0.1'
>> has relocations in .text [textrel]
>> NOTE: Tasks Summary: Attempted 2368 tasks of which 1071 didn't need to
>> be rerun and all succeeded.
>>
>> A quick inspection of the configurations shows th elibs are compiled
>> -fPIC -DPIC  so one common cause seems ruled out.
>>
>> But I'm confused after reading
>> http://lists.gnupg.org/pipermail/gnupg-devel/2014-January/028163.html
>>
>
> Generally you use -fpic thats sufficient and optimal in most cases and
> on most architectures, in some cases when GOT is really larger than
> ABI limits you can use -fPIC it makes difference on architectures like
> ppc
> where it will use 3 instructions to access larger GOT whereas -fpic
> will use 1 instruction.
>
> For this case it could be that there is some assembly file which is
> not getting the right flags, try adding --enable-noexecstack thru
> EXTRA_OECONF and see if that helps.
>
>


Thanks for the hint but that doesn't help.

I think we have a bug in the check in insane.bbclass: it matches
TEXTREL              0x00000000
in the output of objdump -p

andrea@mizar:/oe/oe-core/build$ ./arm-oe-linux-gnueabi-objdump -p
./libgcrypt.so.20.0.1

./libgcrypt.so.20.0.1:     file format elf32-littlearm

Program Header:
0x70000001 off    0x00091450 vaddr 0x00091450 paddr 0x00091450 align 2**2
         filesz 0x00000008 memsz 0x00000008 flags r--
    LOAD off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**15
         filesz 0x0009145c memsz 0x0009145c flags r-x
    LOAD off    0x0009145c vaddr 0x0009945c paddr 0x0009945c align 2**15
         filesz 0x00004618 memsz 0x00004904 flags rw-
 DYNAMIC off    0x00091a28 vaddr 0x00099a28 paddr 0x00099a28 align 2**2
         filesz 0x00000110 memsz 0x00000110 flags rw-
    NOTE off    0x000000f4 vaddr 0x000000f4 paddr 0x000000f4 align 2**2
         filesz 0x00000024 memsz 0x00000024 flags r--
   STACK off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**4
         filesz 0x00000000 memsz 0x00000000 flags rwx

Dynamic Section:
  NEEDED               libgpg-error.so.0
  NEEDED               libcap.so.2
  NEEDED               libc.so.6
  SONAME               libgcrypt.so.20
  INIT                 0x00004c00
  FINI                 0x00073660
  INIT_ARRAY           0x0009945c
  INIT_ARRAYSZ         0x00000004
  FINI_ARRAY           0x00099460
  FINI_ARRAYSZ         0x00000004
  GNU_HASH             0x00000118
  STRTAB               0x00001ce0
  SYMTAB               0x00000b70
  STRSZ                0x000010d7
  SYMENT               0x00000010
  PLTGOT               0x00099b38
  PLTRELSZ             0x00000238
  PLTREL               0x00000011
  JMPREL               0x000049c8
  REL                  0x00003040
  RELSZ                0x00001988
  RELENT               0x00000008
  TEXTREL              0x00000000
  VERDEF               0x00002fe8
  VERDEFNUM            0x00000002
  VERNEED              0x00003020
  VERNEEDNUM           0x00000001
  VERSYM               0x00002db8
  RELCOUNT             0x00000329

Version definitions:
1 0x01 0x0f84f3d0 libgcrypt.so.20
2 0x00 0x0e5e9c66 GCRYPT_1.6

Version References:
  required from libc.so.6:
    0x0d696914 0x00 03 GLIBC_2.4
private flags = 5000202: [Version5 EABI] [soft-float ABI] [has entry point]

andrea@mizar:/oe/oe-core/build$



>> Worth opening a bug?
>>
>> Cheers
>>
>> Andrea
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

