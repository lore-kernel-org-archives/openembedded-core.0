Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD564C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:54:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.34921.1743022486860078405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=etJpP+T2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AECA1443C7
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743022484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwK3X5Hi+Es6hYs+5vxclr8mm9t8tuHEx0VkodkUdnk=;
	b=etJpP+T2lCRau8zyALZnc6C5M9OFfk0AEy7d70yoXBYLU6bKCUpafEbqEOB6HvvWnR6mSo
	/IrzU/tlNb9fE3EmhvWXg5JRxoFdjILOy6HS6VWMNphUoUqF9fzEEsGSLmajZY/lE9pVIu
	/59mh4dzVtQP74M4tNrf0+KIrGfFP1nabeePMtD6iXreLjqspUf9Cv/58HGWpt/eSNvtvK
	AYvpyyyifunor/Tj3BSkxUltAyAZXL66rsIh4pKhr7qOD/f7al7947GzWoQ+SmkJaPFP8S
	FLLAHPqtY5aNAkngvpYqIK2jyoNmE+nGenRDkFxU0CphzD+bf9LF2/kFPr4p2g==
Message-ID: <9a00d30a-cd78-4c34-bd9f-c2bcbeee2a05@bootlin.com>
Date: Wed, 26 Mar 2025 21:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap] recipe's sysroot misconfiguration in
 multilib
To: openembedded-core@lists.openembedded.org
References: <5be84788-6fa5-453c-83bc-d547246dc037@bootlin.com>
 <296b0e95be234db91dfaa8164e45d035973aa459.camel@linuxfoundation.org>
 <29e667c7-c9d9-496c-b7b7-bf580c39eda4@bootlin.com>
 <CAMKF1srT0JWLi5+1gv+W2xu-HyfzgZRaGAgFAGeHVx75+YOdsg@mail.gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAMKF1srT0JWLi5+1gv+W2xu-HyfzgZRaGAgFAGeHVx75+YOdsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeiheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvfhfhohgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflohgrohcuofgrrhgtohhsucevohhsthgruceojhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffvdffgfejtdeihfduffehiedujeeuhfdtgfejgeeuheeuvdfgfeekgeegffffhfenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppedvtddtudemkeeiudemvddttdemfhhftgdtmegtheeitdemkeehudefmeegjegvfhemkeehhehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumedvtddtmehffhgttdemtgehiedtmeekhedufeemgeejvghfmeekheehfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemvddttdemfhhftgdtmegtheeitdemkeehudefmeegjegvfhemkeehhehfngdpmhgrihhlfhhrohhmpehjohgrohhmrghrtghoshdrtghoshhtrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213692

Hello,

On 3/26/25 20:26, Khem Raj via lists.openembedded.org wrote:
> On Wed, Mar 26, 2025 at 12:15 PM Joao Marcos Costa
> <joaomarcos.costa@bootlin.com> wrote:
>>
>> Hello, Richard
>>
>> Thanks for your reply
>>
>> On 3/26/25 19:55, Richard Purdie via lists.openembedded.org wrote:
>>> On Wed, 2025-03-26 at 19:47 +0100, Joao Marcos Costa wrote:
>>>> I have been trying to set up a multilib environment to generate
>>>> libraries built with Control Flow Integrity support. The gcc toolchain
>>>> is already patched to support this custom multilib ABI, and it is indeed
>>>> capable of generating binaries with the CFI flags.
>>>>
>>>> I am, however, facing this strange issue where a header is not found in
>>>> the multilib recipe-sysroot (i.e., libcfi-recipe-sysroot) of a given
>>>> package (e.g., zstd), and do_compile task fails:
>>>>
>> (...)
>>>>
>>>> Besides my TUNE_*, DEFAULTTUNE, BASE_LIB values set up, I also added
>>>> 'GCCMULTILIB = "--enable-multilib"' to gcc-cross.inc, to enable multilib
>>>> for the cross toolchain. Could I be missing something, maybe with
>>>> recipes-devtools/gcc/gcc-multilib-config.inc?
>>>
>>> I'm finding it odd that you have to add --enable-multilib since in
>>> general with gcc-cross, we use separate cross toolchains for each
>>> multilib. This kind of implies you're configuring the setup differently
>>> to how the system would expect.
>>
>> If I don't, my cross toolchain is configured with "--disable-multilib".
>> To confirm this, I ran gcc with "-v" from within the recipe's native
>> sysroot, and the output is:
>>
>> Target: riscv64-freedomusdkmllibcfi-linux
>> Configured with:
>> ../../../../../../work-shared/gcc-internal-13.2.0-r0/git/configure
>> --build=x86_64-linux --host=x86_64-linux
>> --target=riscv64-freedomusdkmllibcfi-linux --prefix=//host/usr
>> --exec_prefix=//host/usr
>> --bindir=//host/usr/bin/riscv64-freedomusdkmllibcfi-linux
>> --sbindir=//host/usr/bin/riscv64-freedomusdkmllibcfi-linux
>> --libexecdir=//host/usr/libexec/riscv64-freedomusdkmllibcfi-linux
>> --datadir=//host/usr/share --sysconfdir=//host/etc
>> --sharedstatedir=//host/com --localstatedir=//host/var
>> --libdir=//host/usr/lib/riscv64-freedomusdkmllibcfi-linux
>> --includedir=//host/usr/include --oldincludedir=//host/usr/include
>> --infodir=//host/usr/share/info --mandir=//host/usr/share/man
>> --disable-silent-rules --disable-dependency-tracking
>> --with-libtool-sysroot=//host --enable-clocale=generic --with-gnu-ld
>> --enable-shared --enable-languages=c,c++,fortran --enable-threads=posix
>> --disable-multilib --enable-default-pie --enable-c99 --enable-long-long
>> --enable-(...)
>>
>> As a consequence, the build fails even before it gets to libcfi-zstd:
>>
>> ...libcfi-glibc-internal/2.37/recipe-sysroot-native/usr/bin/riscv64-freedomusdkmllibcfi-linux/../../libexec/riscv64-freedomusdkmllibcfi-linux/gcc/riscv64-freedomusdkmllibcfi-linux/13.2.0/ld.bfd:
>> cannot find -lgcc: No such file or directory
>> | collect2: error: ld returned 1 exit status
>> | make[2]: *** [Makefile:1293:
> 
> OE's notion of multilib is at system level, which means it will need
> full runtimes for the chosen multilibs, GCC builds the compiler
> runtime and has its own
> directory naming structure to place them which may not be inline with
> what OE toolchain is doing. For hosted targets we do not build a
> toolchain with all
> possible multilibs for a given architecture which technically is
> possible with gcc. our mutlilibs are a small subset of that and that
> is what toolchain will recognise
> provided its placed in right locations in sysroot.
> 

Thanks, Khem.

After your reply and Richard's, I checked with a Poky build (arm64 + 
lib32 multilib), and doing the same test (i.e., gcc -v) I see both 
compilers (64-bit and 32-bit) were configured with "--disable-multilib". 
I will get rid of that GCCMULTILIB then.

Please tell me if I got your point correctly: each multilib ABI (lib32, 
lib64, libfoo, libbar) will have it's respective toolchain built, and as 
long as the toolchain's naming matches what OE expects in terms of 
sysroot structure, everything will work transparently.

In case I got you right, how can I tell what exactly OE expects of the 
sysroot locations and directory names? I ask this specially because in 
my arm64 + lib32 test, the target sysroots are:

lib32-zstd/1.5.6/lib32-recipe-sysroot/usr/lib
zstd/1.5.6/recipe-sysroot/usr/lib (with a symlink inside to lib64)
zstd/1.5.6/recipe-sysroot/usr/lib64

and to be fair, I was expecting the very opposite. Something like:
lib32-zstd/1.5.6/lib32-recipe-sysroot/usr/lib32
zstd/1.5.6/recipe-sysroot/usr/lib

In other words, the target architecture libdir would remain the same 
(i.e. usr/lib) and the multilib variant would be usr/lib32).

Thanks once more.

-- 
Best regards,
João Marcos Costa

