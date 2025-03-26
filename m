Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C51C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 19:15:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.31518.1743016518714541249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 12:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FqCNCJkk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7E0A4444E;
	Wed, 26 Mar 2025 19:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743016517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71D5UxtyVqzQe30M6qaps7p0W+9nkB5uzOqsPPJt+Lg=;
	b=FqCNCJkkrVSqG/mzuzVTxGJTGCO9C4yHZlMGPAVR+q0Opz12v72bewtBfW/KtdTuEEc3uy
	rZxcEcLHgfnP8yCBN91nbR49RN34BnUzpHhv4k9bqzHHnhpB9brpkwUilbRcKybtidboJ7
	wjcAT8g6qlfTzuZEooiyyIIkTL2uZr67SxN1lUrtmt+FL3NB8iGR6JOXeaiIrE9Xo2Mr46
	Pi6Qr29K17za3u6SnI/06uGjwXGEwLLUs+OpEM1vwYMwfQXALMzOqQrXUjtArLEBWcMhlN
	0IEvEMUUDALGVffCMQnGJAV5yw7TpVK/ChK2qjb2zItXGf4xRFyl+ksH+kDIqA==
Message-ID: <29e667c7-c9d9-496c-b7b7-bf580c39eda4@bootlin.com>
Date: Wed, 26 Mar 2025 20:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap] recipe's sysroot misconfiguration in
 multilib
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Khem Raj <raj.khem@gmail.com>
References: <5be84788-6fa5-453c-83bc-d547246dc037@bootlin.com>
 <296b0e95be234db91dfaa8164e45d035973aa459.camel@linuxfoundation.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <296b0e95be234db91dfaa8164e45d035973aa459.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeifeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhohgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflohgrohcuofgrrhgtohhsucevohhsthgruceojhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkeegfeevtdetkeevjedtffffheekveffleeuueehledvfeffgffhvedvgfeifeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppedvtddtudemkeeiudemvddttdemfhhftgdtmegtheeitdemkeehudefmeegjegvfhemkeehhehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumedvtddtmehffhgttdemtgehiedtmeekhedufeemgeejvghfmeekheehfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemvddttdemfhhftgdtmegtheeitdemkeehudefmeegjegvfhemkeehhehfngdpmhgrihhlfhhrohhmpehjohgrohhmrghrtghoshdrtghoshhtrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhun
 hgurghtihhonhdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomh
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 19:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213658

Hello, Richard

Thanks for your reply

On 3/26/25 19:55, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2025-03-26 at 19:47 +0100, Joao Marcos Costa wrote:
>> I have been trying to set up a multilib environment to generate
>> libraries built with Control Flow Integrity support. The gcc toolchain
>> is already patched to support this custom multilib ABI, and it is indeed
>> capable of generating binaries with the CFI flags.
>>
>> I am, however, facing this strange issue where a header is not found in
>> the multilib recipe-sysroot (i.e., libcfi-recipe-sysroot) of a given
>> package (e.g., zstd), and do_compile task fails:
>>
(...)
>>
>> Besides my TUNE_*, DEFAULTTUNE, BASE_LIB values set up, I also added
>> 'GCCMULTILIB = "--enable-multilib"' to gcc-cross.inc, to enable multilib
>> for the cross toolchain. Could I be missing something, maybe with
>> recipes-devtools/gcc/gcc-multilib-config.inc?
> 
> I'm finding it odd that you have to add --enable-multilib since in
> general with gcc-cross, we use separate cross toolchains for each
> multilib. This kind of implies you're configuring the setup differently
> to how the system would expect.

If I don't, my cross toolchain is configured with "--disable-multilib". 
To confirm this, I ran gcc with "-v" from within the recipe's native 
sysroot, and the output is:

Target: riscv64-freedomusdkmllibcfi-linux
Configured with: 
../../../../../../work-shared/gcc-internal-13.2.0-r0/git/configure 
--build=x86_64-linux --host=x86_64-linux 
--target=riscv64-freedomusdkmllibcfi-linux --prefix=//host/usr 
--exec_prefix=//host/usr 
--bindir=//host/usr/bin/riscv64-freedomusdkmllibcfi-linux 
--sbindir=//host/usr/bin/riscv64-freedomusdkmllibcfi-linux 
--libexecdir=//host/usr/libexec/riscv64-freedomusdkmllibcfi-linux 
--datadir=//host/usr/share --sysconfdir=//host/etc 
--sharedstatedir=//host/com --localstatedir=//host/var 
--libdir=//host/usr/lib/riscv64-freedomusdkmllibcfi-linux 
--includedir=//host/usr/include --oldincludedir=//host/usr/include 
--infodir=//host/usr/share/info --mandir=//host/usr/share/man 
--disable-silent-rules --disable-dependency-tracking 
--with-libtool-sysroot=//host --enable-clocale=generic --with-gnu-ld 
--enable-shared --enable-languages=c,c++,fortran --enable-threads=posix 
--disable-multilib --enable-default-pie --enable-c99 --enable-long-long 
--enable-(...)

As a consequence, the build fails even before it gets to libcfi-zstd:

...libcfi-glibc-internal/2.37/recipe-sysroot-native/usr/bin/riscv64-freedomusdkmllibcfi-linux/../../libexec/riscv64-freedomusdkmllibcfi-linux/gcc/riscv64-freedomusdkmllibcfi-linux/13.2.0/ld.bfd: 
cannot find -lgcc: No such file or directory
| collect2: error: ld returned 1 exit status
| make[2]: *** [Makefile:1293: 
...libcfi-glibc-internal/2.37/build-riscv64-freedomusdkmllibcfi-linux/elf/librtld.map] 
Error 1


> 
> The recipe-sysroot-native/installeddeps/ directory will show you what
> is installed in each and might help narrow down the size difference.
> 

Oddly enough, both installeddeps seem to contain (at least) the same 
number of items:

$ ls -l zstd/1.5.5/recipe-sysroot-native/installeddeps/ | wc -l
74
$ ls 
../riscv64cfi-freedomusdkmllibcfi-linux/libcfi-zstd/1.5.5/recipe-sysroot-native/installeddeps/ 
-l | wc -l
75

But, to be honest, my comparison didn't go any further than comparing 
this line count.

> Cheers,
> 
> Richard

Thanks!

-- 
Best regards,
João Marcos Costa

