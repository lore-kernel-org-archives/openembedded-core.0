Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 588CD75524
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 18:19:22 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id t12-v6so1628692ljc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 11:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YEnVKqG+tt971r0AF0Eb31/eBo1whaUTkOYYNGy6W68=;
	b=EUz1nlczaANDhZerdP3YipsW0xjN2ykB2gIYF4pOnlmsJ0/g/H6Opmpv0fb7BrR7BI
	qni0Ka9XCzT4aFV/Gg+BNKxgJJ8OZwuux+v+RveY8N8009c243LHhV1/uphaqakP/B43
	z3dgo79+MJeC4O4LO/pc6yDgZrkt+OjsNMTDqmnDMpRswEq1M6xltDcQo8Ac41Yvcui0
	Ukic2E5IXrXtlA/6/+A4vhrRggSLsosAuXkJHCTUFyRFbR7BFHOnaMe9LP5F5dKGOVhZ
	zHKcQZb5tqp8lAbpLhBnvLZLsoCZ2Z8M8IAKQRRJiKFzAiD/cLDPsNcLj2Yh3nkOkZXT
	ZqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YEnVKqG+tt971r0AF0Eb31/eBo1whaUTkOYYNGy6W68=;
	b=S/3w+v8AVbjBC8vcAf8yBye/tMepaOrnGc8ufAE+xuxB6ghXN84xVApDEgjS9P6gvG
	pOMeqeJmqYqCJDBgnO+bFH0E5c8hgt4Ec/owmvp2VErxMZEePdeEhvqtSSKArC1IGlJl
	/x0v/4+x9grzgur3HzIcXc0GO7NEPU3Ln+iky4hf2RUST1CE7hYjVLZZ/lb3SdNa8OZA
	nauLDIuCXlnHRS+qHw0/qR6YhFW9dNVE/HaJa7H+ZGZIyhTQdPnSBgUxxJmvP9sucHPE
	tkelyXqhwJM/VMe9xSTCdOizCa3RS75GKFi+btqNCpv80LIo6DuU9eGjQOLCzBw02/3a
	my2Q==
X-Gm-Message-State: APt69E2wXmH7aR7z3ZeO2AXJD5W8ObUhzjwE9Rupb8Mzmso5XaQr86tC
	OldBJ6wbEzbUpaBAsnoFdjGPYIE8X86xbwg+T7A=
X-Google-Smtp-Source: ADUXVKL5WjaOOF+07z1AiPrlc7M7VHq6bsznqFUJptTgMm1Ja1SBG8NM58JNhu/RKJ3kGv3SC0xSJx0ugX/jix1IFbk=
X-Received: by 2002:a2e:5111:: with SMTP id
	f17-v6mr1812428ljb.16.1529691562913; 
	Fri, 22 Jun 2018 11:19:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:4242:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 11:18:52
	-0700 (PDT)
In-Reply-To: <1f1ef3ab-20fb-4323-c9db-172f069768df@geanix.com>
References: <20180621212648.1556-1-alistair.francis@wdc.com>
	<20180621212648.1556-2-alistair.francis@wdc.com>
	<1f1ef3ab-20fb-4323-c9db-172f069768df@geanix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Jun 2018 11:18:52 -0700
Message-ID: <CAKmqyKO2C01H0bPnMKZafNK-dcKSgCWwUC0Fg-KWCt9KuKGsTA@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] recipes-support/nspr: Add RISC-V support
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
X-List-Received-Date: Fri, 22 Jun 2018 18:19:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2018 at 10:12 PM, Martin Hundeb=C3=B8ll <martin@geanix.com>=
 wrote:
>
>
> On 2018-06-21 23:26, Alistair Francis wrote:
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   ...initions-for-the-RISC-V-architecture.patch | 150 ++++++++++++++++++
>>   meta/recipes-support/nspr/nspr_4.19.bb        |   1 +
>>   2 files changed, 151 insertions(+)
>>   create mode 100644
>> meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-=
architecture.patch
>>
>> diff --git
>> a/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-=
V-architecture.patch
>> b/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-=
V-architecture.patch
>> new file mode 100644
>> index 0000000000..aa32908d13
>> --- /dev/null
>> +++
>> b/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-=
V-architecture.patch
>> @@ -0,0 +1,150 @@
>> +# HG changeset patch
>> +# User Karsten Merker <merker@debian.org>
>> +# Date 1523974333 -7200
>> +# Node ID f47871e2aeb16b39d4f516690e25c81b04d6d05a
>> +# Parent  776db96f834cb86e8863052201d55f60a2da91cb
>> +Bug 1308584, Add type definitions for the RISC-V architecture, r=3Dkaie
>> +
>> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> +[ Changes by AF:
>> + - Rebase on other Yocto patches
>> +]
>> +Upstream-Status: Merged [
>> https://hg.mozilla.org/projects/nspr/rev/f47871e2aeb1 ]
>
>
> I don't think "merged" is a proper upstream status. Should be "backport"
> instead:
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_H=
eader_Recommendations:_Upstream-Status

Ah, this is handy, I always forget the status messages. I'll fix in v3.

Alistair

>
>
>> +
>> +diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
>> +--- a/pr/include/md/_linux.cfg
>> ++++ b/pr/include/md/_linux.cfg
>> +@@ -1015,16 +1015,108 @@
>> + #define PR_ALIGN_OF_FLOAT   4
>> + #define PR_ALIGN_OF_DOUBLE  4
>> + #define PR_ALIGN_OF_POINTER 4
>> + #define PR_ALIGN_OF_WORD    4
>> +
>> + #define PR_BYTES_PER_WORD_LOG2   2
>> + #define PR_BYTES_PER_DWORD_LOG2  3
>> +
>> ++#elif defined(__riscv) && (__riscv_xlen =3D=3D 32)
>> ++
>> ++#undef  IS_BIG_ENDIAN
>> ++#define IS_LITTLE_ENDIAN 1
>> ++#undef  IS_64
>> ++
>> ++#define PR_BYTES_PER_BYTE   1
>> ++#define PR_BYTES_PER_SHORT  2
>> ++#define PR_BYTES_PER_INT    4
>> ++#define PR_BYTES_PER_INT64  8
>> ++#define PR_BYTES_PER_LONG   4
>> ++#define PR_BYTES_PER_FLOAT  4
>> ++#define PR_BYTES_PER_DOUBLE 8
>> ++#define PR_BYTES_PER_WORD   4
>> ++#define PR_BYTES_PER_DWORD  8
>> ++
>> ++#define PR_BITS_PER_BYTE    8
>> ++#define PR_BITS_PER_SHORT   16
>> ++#define PR_BITS_PER_INT     32
>> ++#define PR_BITS_PER_INT64   64
>> ++#define PR_BITS_PER_LONG    32
>> ++#define PR_BITS_PER_FLOAT   32
>> ++#define PR_BITS_PER_DOUBLE  64
>> ++#define PR_BITS_PER_WORD    32
>> ++
>> ++#define PR_BITS_PER_BYTE_LOG2   3
>> ++#define PR_BITS_PER_SHORT_LOG2  4
>> ++#define PR_BITS_PER_INT_LOG2    5
>> ++#define PR_BITS_PER_INT64_LOG2  6
>> ++#define PR_BITS_PER_LONG_LOG2   5
>> ++#define PR_BITS_PER_FLOAT_LOG2  5
>> ++#define PR_BITS_PER_DOUBLE_LOG2 6
>> ++#define PR_BITS_PER_WORD_LOG2   5
>> ++
>> ++#define PR_ALIGN_OF_SHORT   2
>> ++#define PR_ALIGN_OF_INT     4
>> ++#define PR_ALIGN_OF_LONG    4
>> ++#define PR_ALIGN_OF_INT64   8
>> ++#define PR_ALIGN_OF_FLOAT   4
>> ++#define PR_ALIGN_OF_DOUBLE  8
>> ++#define PR_ALIGN_OF_POINTER 4
>> ++#define PR_ALIGN_OF_WORD    4
>> ++
>> ++#define PR_BYTES_PER_WORD_LOG2  2
>> ++#define PR_BYTES_PER_DWORD_LOG2 3
>> ++
>> ++#elif defined(__riscv) && (__riscv_xlen =3D=3D 64)
>> ++
>> ++#undef  IS_BIG_ENDIAN
>> ++#define IS_LITTLE_ENDIAN 1
>> ++#define IS_64
>> ++
>> ++#define PR_BYTES_PER_BYTE   1
>> ++#define PR_BYTES_PER_SHORT  2
>> ++#define PR_BYTES_PER_INT    4
>> ++#define PR_BYTES_PER_INT64  8
>> ++#define PR_BYTES_PER_LONG   8
>> ++#define PR_BYTES_PER_FLOAT  4
>> ++#define PR_BYTES_PER_DOUBLE 8
>> ++#define PR_BYTES_PER_WORD   8
>> ++#define PR_BYTES_PER_DWORD  8
>> ++
>> ++#define PR_BITS_PER_BYTE    8
>> ++#define PR_BITS_PER_SHORT   16
>> ++#define PR_BITS_PER_INT     32
>> ++#define PR_BITS_PER_INT64   64
>> ++#define PR_BITS_PER_LONG    64
>> ++#define PR_BITS_PER_FLOAT   32
>> ++#define PR_BITS_PER_DOUBLE  64
>> ++#define PR_BITS_PER_WORD    64
>> ++
>> ++#define PR_BITS_PER_BYTE_LOG2   3
>> ++#define PR_BITS_PER_SHORT_LOG2  4
>> ++#define PR_BITS_PER_INT_LOG2    5
>> ++#define PR_BITS_PER_INT64_LOG2  6
>> ++#define PR_BITS_PER_LONG_LOG2   6
>> ++#define PR_BITS_PER_FLOAT_LOG2  5
>> ++#define PR_BITS_PER_DOUBLE_LOG2 6
>> ++#define PR_BITS_PER_WORD_LOG2   6
>> ++
>> ++#define PR_ALIGN_OF_SHORT   2
>> ++#define PR_ALIGN_OF_INT     4
>> ++#define PR_ALIGN_OF_LONG    8
>> ++#define PR_ALIGN_OF_INT64   8
>> ++#define PR_ALIGN_OF_FLOAT   4
>> ++#define PR_ALIGN_OF_DOUBLE  8
>> ++#define PR_ALIGN_OF_POINTER 8
>> ++#define PR_ALIGN_OF_WORD    8
>> ++
>> ++#define PR_BYTES_PER_WORD_LOG2  3
>> ++#define PR_BYTES_PER_DWORD_LOG2 3
>> ++
>> + #else
>> +
>> + #error "Unknown CPU architecture"
>> +
>> + #endif
>> +
>> + #ifndef HAVE_LONG_LONG
>> + #define       HAVE_LONG_LONG
>> +diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
>> +--- a/pr/include/md/_linux.h
>> ++++ b/pr/include/md/_linux.h
>> +@@ -54,16 +54,20 @@
>> + #elif defined(__avr32__)
>> + #define _PR_SI_ARCHITECTURE "avr32"
>> + #elif defined(__m32r__)
>> + #define _PR_SI_ARCHITECTURE "m32r"
>> + #elif defined(__nios2__)
>> + #define _PR_SI_ARCHITECTURE "nios2"
>> + #elif defined(__or1k__)
>> + #define _PR_SI_ARCHITECTURE "or1k"
>> ++#elif defined(__riscv) && (__riscv_xlen =3D=3D 32)
>> ++#define _PR_SI_ARCHITECTURE "riscv32"
>> ++#elif defined(__riscv) && (__riscv_xlen =3D=3D 64)
>> ++#define _PR_SI_ARCHITECTURE "riscv64"
>> + #else
>> + #error "Unknown CPU architecture"
>> + #endif
>> + #define PR_DLL_SUFFIX         ".so"
>> +
>> + #define _PR_VMBASE              0x30000000
>> + #define _PR_STACK_VMBASE      0x50000000
>> + #define _MD_DEFAULT_STACK_SIZE        65536L
>> +
>> diff --git a/meta/recipes-support/nspr/nspr_4.19.bb
>> b/meta/recipes-support/nspr/nspr_4.19.bb
>> index de2c87131f..b43c78081d 100644
>> --- a/meta/recipes-support/nspr/nspr_4.19.bb
>> +++ b/meta/recipes-support/nspr/nspr_4.19.bb
>> @@ -11,6 +11,7 @@ SRC_URI =3D
>> "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
>>              file://remove-srcdir-from-configure-in.patch \
>>              file://0002-Add-nios2-support.patch \
>>              file://0001-md-Fix-build-with-musl.patch \
>> +
>> file://0003-Add-type-definitions-for-the-RISC-V-architecture.patch \
>>              file://nspr.pc.in \
>>   "
>>
>
>
> --
> Kind regards,
> Martin Hundeb=C3=B8ll
> Embedded Linux Consultant
>
> +45 61 65 54 61
> martin@geanix.com
>
> Geanix IVS
> DK39600706
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

