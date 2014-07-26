Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id E1A1E6AC69
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 22:26:23 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id gf5so4278957lab.9
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 15:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uphPk6W7WdEncRjasqsXEUSvDGsub62O4OHIU7jW8iI=;
	b=cy9A5WjRdlUIVCAFbHdsLJagq0FQVuUalvsipxC0gtLbU1x1LMd55epZo2EFNwpmTf
	ZgGC152Yx+dnqiD98RiVPJ4ueoMxEBt4zHm2uJzhBTXsdEm/1Wpt9+YBjpVhv3SKHi/s
	3tDK4CiTf4ovdj/Aa6xyVQnaQRCFe4u5PDCJArN/0IWoJrgCXbT6oc9J+GaiPbiY9Gt0
	LrJVgiNFCKw8qsa1DEtjp7hVJI540zbIls8NcxPGhFVEAyk1fSvLYEgBLl4TYVOHSTUb
	A2/JNxYbQeIjVN0G7BVB1ZM4YqucoWj4MIdVkHSRS9qgw25+vdP5JEm5LMZWVFCuZoqj
	U9SQ==
MIME-Version: 1.0
X-Received: by 10.152.8.48 with SMTP id o16mr24440803laa.18.1406413584352;
	Sat, 26 Jul 2014 15:26:24 -0700 (PDT)
Received: by 10.112.207.9 with HTTP; Sat, 26 Jul 2014 15:26:24 -0700 (PDT)
In-Reply-To: <CAAQYJAu=uESMPjgfBBNSCEne5tHq6D_5r67AYFKabcFx7qQB2Q@mail.gmail.com>
References: <CAAQYJAt1sQtz_sb=5NdWG2Ypkwgz+BRYAYiRWgA+hh9EaszT8Q@mail.gmail.com>
	<CAMKF1sp=PD0RfP4_Un49N=QJex77UubaQv3BjFv5JX2Na-VhsA@mail.gmail.com>
	<CAAQYJAu=uESMPjgfBBNSCEne5tHq6D_5r67AYFKabcFx7qQB2Q@mail.gmail.com>
Date: Sun, 27 Jul 2014 00:26:24 +0200
Message-ID: <CAAQYJAuGMJjJBZccqh=rusHu2ttOVSBsgtmOPSWrL9i3uXtv1A@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Jul 2014 22:26:26 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 26, 2014 at 11:30 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Sat, Jul 26, 2014 at 6:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Jul 25, 2014 at 3:21 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>>> Hi, somehow this QA is repeatedly here:
>>>
>>> andrea@mizar:/oe/oe-core/build$ bitbake core-image-base
>>> Loading cache: 100% |###########################################| ETA:  00:00:00
>>> Loaded 2519 entries from dependency cache.
>>> Parsing recipes: 100% |#########################################| Time: 00:00:07
>>> Parsing of 2066 .bb files complete (2065 cached, 1 parsed). 2519
>>> targets, 115 skipped, 0 masked, 0 errors.
>>> NOTE: Resolving any missing task queue dependencies
>>>
>>> Build Configuration:
>>> BB_VERSION        = "1.23.1"
>>> BUILD_SYS         = "x86_64-linux"
>>> NATIVELSBSTRING   = "Ubuntu-14.04"
>>> TARGET_SYS        = "arm-oe-linux-gnueabi"
>>> MACHINE           = "poodle"
>>> DISTRO            = "nodistro"
>>> DISTRO_VERSION    = "nodistro.0"
>>> TUNE_FEATURES     = "arm armv5 thumb dsp"
>>> TARGET_FPU        = "soft"
>>> meta              = "master:188545ba82119d75f80dde322a73712ce1f0f762"
>>> meta-initramfs    = "master:1060b4a157c5854f071f0dd7b48d55faeef3f818"
>>> meta-handheld     = "master:b61b450a0639aaac6f17ec4656950e28545c90e0"
>>> meta-oe
>>> meta-networking   = "master:1060b4a157c5854f071f0dd7b48d55faeef3f818"
>>> meta-opie         = "master:369016695601cea46915fe47de1d86d31dd9acd7"
>>>
>>> NOTE: Preparing runqueue
>>> NOTE: Executing SetScene Tasks
>>> NOTE: Executing RunQueue Tasks
>>> NOTE: validating kernel config, see log.do_kernel_configcheck for details
>>> WARNING: QA Issue: ELF binary
>>> '/oe/oe-core/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/libgcrypt/usr/lib/libgcrypt.so.20.0.1'
>>> has relocations in .text [textrel]
>>> NOTE: Tasks Summary: Attempted 2368 tasks of which 1071 didn't need to
>>> be rerun and all succeeded.
>>>
>>> A quick inspection of the configurations shows th elibs are compiled
>>> -fPIC -DPIC  so one common cause seems ruled out.
>>>
>>> But I'm confused after reading
>>> http://lists.gnupg.org/pipermail/gnupg-devel/2014-January/028163.html
>>>
>>
>> Generally you use -fpic thats sufficient and optimal in most cases and
>> on most architectures, in some cases when GOT is really larger than
>> ABI limits you can use -fPIC it makes difference on architectures like
>> ppc
>> where it will use 3 instructions to access larger GOT whereas -fpic
>> will use 1 instruction.
>>
>> For this case it could be that there is some assembly file which is
>> not getting the right flags, try adding --enable-noexecstack thru
>> EXTRA_OECONF and see if that helps.
>>
>>
>
>
> Thanks for the hint but that doesn't help.
>
> I think we have a bug in the check in insane.bbclass: it matches
> TEXTREL              0x00000000
> in the output of objdump -p
>

The check is valid!
Seems there are problems with the sources:

root@poodle:/# ./scanelf ./libgcrypt.so.20.0.1
 TYPE   FILE
ET_DYN ./libgcrypt.so.20.0.1
root@poodle:/# ./scanelf -lpqt ./libgcrypt.so.20.0.1
TEXTREL  ./libgcrypt.so.20.0.1
root@poodle:/# ./scanelf -qT ./libgcrypt.so.20.0.1
  libgcrypt.so.20.0.1: (memory/data?) [0x25D70] in (optimized out:
previous $a) [0x25878]
  libgcrypt.so.20.0.1: (memory/data?) [0x26270] in (optimized out:
previous _gcry_cast5_arm_decrypt_block) [0x25D78]
  libgcrypt.so.20.0.1: (memory/data?) [0x26B4C] in (optimized out:
previous _gcry_cast5_arm_enc_blk2) [0x26278]
  libgcrypt.so.20.0.1: (memory/data?) [0x277E0] in (optimized out:
previous _gcry_cast5_arm_dec_blk2) [0x26F10]
  libgcrypt.so.20.0.1: (memory/data?) [0x2CE18] in (optimized out:
previous $a) [0x2C4B0]
  libgcrypt.so.20.0.1: (memory/data?) [0x2DFC0] in (optimized out:
previous _gcry_aes_arm_decrypt_block) [0x2D658]
  libgcrypt.so.20.0.1: (memory/data?) [0x3F624] in (optimized out:
previous $a) [0x3EA50]
  libgcrypt.so.20.0.1: (memory/data?) [0x4063C] in (optimized out:
previous _gcry_camellia_arm_decrypt_block) [0x3FA70]
  ./libgcrypt.so.20.0.1
root@poodle:/#


Dissection with objdump:

00025878 <_gcry_cast5_arm_encrypt_block>:
   25878:       e92d5ff2        push    {r1, r4, r5, r6, r7, r8, r9,
sl, fp, ip, lr}
   2587c:       e59f74ec        ldr     r7, [pc, #1260] ; 25d70
<_gcry_cast5_arm_encrypt_block+0x4f8>
   25880:       e3a0bfff        mov     fp, #1020       ; 0x3fc


00025d78 <_gcry_cast5_arm_decrypt_block>:
   25d78:       e92d5ff2        push    {r1, r4, r5, r6, r7, r8, r9,
sl, fp, ip, lr}
   25d7c:       e59f74ec        ldr     r7, [pc, #1260] ; 26270
<_gcry_cast5_arm_decrypt_block+0x4f8>
   25d80:       e3a0bfff        mov     fp, #1020       ; 0x3fc

00026278 <_gcry_cast5_arm_enc_blk2>:
   26278:       e52de004        push    {lr}            ; (str lr, [sp, #-4]!)
   2627c:       e59f78c8        ldr     r7, [pc, #2248] ; 26b4c
<_gcry_cast5_arm_enc_blk2+0x8d4>
   26280:       e3a0bfff        mov     fp, #1020       ; 0x3fc

00026f10 <_gcry_cast5_arm_dec_blk2>:
   26f10:       e59f78c8        ldr     r7, [pc, #2248] ; 277e0
<_gcry_cast5_arm_dec_blk2+0x8d0>
   26f14:       e3a0bfff        mov     fp, #1020       ; 0x3fc

0002c4b0 <_gcry_aes_arm_encrypt_block>:
   2c4b0:       e92d5ff0        push    {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   2c4b4:       e3120003        tst     r2, #3
   2c4b8:       0a00001c        beq     2c530 <_gcry_aes_arm_encrypt_block+0x80>
   2c4bc:       e5d24000        ldrb    r4, [r2]

0002d658 <_gcry_aes_arm_decrypt_block>:
   2d658:       e92d5ff0        push    {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   2d65c:       e3120003        tst     r2, #3
   2d660:       0a00001c        beq     2d6d8 <_gcry_aes_arm_decrypt_block+0x80>

0003ea50 <_gcry_camellia_arm_encrypt_block>:
   3ea50:       e92d5ff2        push    {r1, r4, r5, r6, r7, r8, r9,
sl, fp, ip, lr}
   3ea54:       e59fcbc8        ldr     ip, [pc, #3016] ; 3f624
<_gcry_camellia_arm_encrypt_block+0xbd4>
   3ea58:       e3a0e0ff        mov     lr, #255        ; 0xff

0003fa70 <_gcry_camellia_arm_decrypt_block>:
   3fa70:       e92d5ff2        push    {r1, r4, r5, r6, r7, r8, r9,
sl, fp, ip, lr}
   3fa74:       e59fcbc0        ldr     ip, [pc, #3008] ; 4063c
<_gcry_camellia_arm_decrypt_block+0xbcc>
   3fa78:       e3a0e0ff        mov     lr, #255        ; 0xff


Any idea? Seems there is smthg wrong with cast5, aes, camellia

Cheers

Andrea



> andrea@mizar:/oe/oe-core/build$ ./arm-oe-linux-gnueabi-objdump -p
> ./libgcrypt.so.20.0.1
>
> ./libgcrypt.so.20.0.1:     file format elf32-littlearm
>
> Program Header:
> 0x70000001 off    0x00091450 vaddr 0x00091450 paddr 0x00091450 align 2**2
>          filesz 0x00000008 memsz 0x00000008 flags r--
>     LOAD off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**15
>          filesz 0x0009145c memsz 0x0009145c flags r-x
>     LOAD off    0x0009145c vaddr 0x0009945c paddr 0x0009945c align 2**15
>          filesz 0x00004618 memsz 0x00004904 flags rw-
>  DYNAMIC off    0x00091a28 vaddr 0x00099a28 paddr 0x00099a28 align 2**2
>          filesz 0x00000110 memsz 0x00000110 flags rw-
>     NOTE off    0x000000f4 vaddr 0x000000f4 paddr 0x000000f4 align 2**2
>          filesz 0x00000024 memsz 0x00000024 flags r--
>    STACK off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**4
>          filesz 0x00000000 memsz 0x00000000 flags rwx
>
> Dynamic Section:
>   NEEDED               libgpg-error.so.0
>   NEEDED               libcap.so.2
>   NEEDED               libc.so.6
>   SONAME               libgcrypt.so.20
>   INIT                 0x00004c00
>   FINI                 0x00073660
>   INIT_ARRAY           0x0009945c
>   INIT_ARRAYSZ         0x00000004
>   FINI_ARRAY           0x00099460
>   FINI_ARRAYSZ         0x00000004
>   GNU_HASH             0x00000118
>   STRTAB               0x00001ce0
>   SYMTAB               0x00000b70
>   STRSZ                0x000010d7
>   SYMENT               0x00000010
>   PLTGOT               0x00099b38
>   PLTRELSZ             0x00000238
>   PLTREL               0x00000011
>   JMPREL               0x000049c8
>   REL                  0x00003040
>   RELSZ                0x00001988
>   RELENT               0x00000008
>   TEXTREL              0x00000000
>   VERDEF               0x00002fe8
>   VERDEFNUM            0x00000002
>   VERNEED              0x00003020
>   VERNEEDNUM           0x00000001
>   VERSYM               0x00002db8
>   RELCOUNT             0x00000329
>
> Version definitions:
> 1 0x01 0x0f84f3d0 libgcrypt.so.20
> 2 0x00 0x0e5e9c66 GCRYPT_1.6
>
> Version References:
>   required from libc.so.6:
>     0x0d696914 0x00 03 GLIBC_2.4
> private flags = 5000202: [Version5 EABI] [soft-float ABI] [has entry point]
>
> andrea@mizar:/oe/oe-core/build$
>
>
>
>>> Worth opening a bug?
>>>
>>> Cheers
>>>
>>> Andrea
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

