Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6447A71997
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 14:38:16 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id p9so7788708vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 06:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tMDgnHoj/59RgmWTym9+Gp2S2Nz4PU5qGJzfrSqdopU=;
	b=pi5a8rwYWxaFvHGH+MBR1D0kUNz4GQ/KiqowdxyISHls1yf1dr8+9i/bLAs5WUHsGQ
	NmNikCM8dZBBt3R9SAC60zxJ9e3Qkij3f2ui7eXN6O4tt/15+jAW9q7F/1nuqzCcfZXX
	6XaCAMaMMYV/uKzQeeIlDi5stXsbgyB1j3EMXOMbf2cpCYgSnqiwdrYdwG49jFI352h+
	4u82890aNwWeLNAsYb7PlEBEpMKnx17KrV5+d0fhIzRl2fYhMFMlLePIOeLLAXPmML3t
	xGl4JxnfAIT0xlJhkJHs6+uj3mqKNjIuTm7ChDWsM6hHzEh3AKxT2uknLJpsvB+ZfR0X
	btWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tMDgnHoj/59RgmWTym9+Gp2S2Nz4PU5qGJzfrSqdopU=;
	b=TN7s1eT6pvzJMQrSEfNqAC/EaulP42zHgfspQzl3cDL4GQ02yHGmDzCvcWk0hAPUuo
	ebvmdAhQlqImrw7IAQeUpqggbRUfGN6sT2q0UT6D+C6uvyCBaI5FaMlLKSiZLTVxa476
	0eVwyNKHIQ5ZLZ5hFBNpQga3Eqs+MXjv/bED+hJp0PUT/6m5Uas2/rySx1QbTNyqAaXv
	vYHH79wx0RgDBraYxBI2alS9BhUdx+pZbRyeZKtyVHIa7yUFUSSIFhfN3n8+bhHPzm8Z
	z78q2te0YbojKugB70uYXs2YyrIpc5Bi87Hh6x4AuMkJMlpqPRDqsncVArfTNSNtvAI5
	J/pg==
X-Gm-Message-State: ABUngvcKI4YLHQ6T4zGnurwVLbQs+mgHofwtW1Insre092gwMh716/t2xSc4fKCz7u+95/UPByJaAzM2a2E00A==
X-Received: by 10.31.168.7 with SMTP id r7mr5900755vke.148.1478615898292; Tue,
	08 Nov 2016 06:38:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Tue, 8 Nov 2016 06:37:47 -0800 (PST)
In-Reply-To: <CAJTo0LbTtLuY8JEPY6nRN7AithNTrn8A3oFrQMaKke9GJZnDCQ@mail.gmail.com>
References: <20161108052325.11907-1-raj.khem@gmail.com>
	<CAJTo0LbTtLuY8JEPY6nRN7AithNTrn8A3oFrQMaKke9GJZnDCQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Nov 2016 06:37:47 -0800
Message-ID: <CAMKF1spXm-urpS=Px=1nsib=Rqe_Vs-24U0=suVGf-JUYjNE0w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: Update to latest on stable branch
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
X-List-Received-Date: Tue, 08 Nov 2016 14:38:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 8, 2016 at 3:07 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 November 2016 at 05:23, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> - Switch URI to use github mirror for reliabality
>> - Disable openCL code, its not used
>> - TEXTRELs are fixed, therefore dont skip QA check
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> Breaking here for x86-64.
>
> configure output:
>
> DEBUG: Executing shell function do_configure
> Unknown option --disable-static, ignored
> Found x86_64-poky-linux-gcc (GCC) 6.2.0
> Minimum version is yasm-1.2.0
> If you really want to compile without asm, configure with --disable-asm.
> WARNING: exit code 1 from a shell command.
>
> config.log:
>
> x264 configure script
> Command line options: "--prefix=/usr" "--host=x86_64-poky-linux"
> "--libdir=/usr/lib" "--cross-prefix=x86_64-poky-linux-"
> "--sysroot=/data/poky-master/tmp-glibc/sysroots/intel-corei7-64"
> "--enable-shared" "--enable-static" "--disable-lavf" "--disable-swscale"
> "--disable-opencl" "--enable-pic" "--disable-static"
>
> checking whether x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7
> -mfpmath=sse -msse4.2
> --sysroot=/data/poky-master/tmp-glibc/sysroots/intel-corei7-64 works... yes
> checking whether x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7
> -mfpmath=sse -msse4.2
> --sysroot=/data/poky-master/tmp-glibc/sysroots/intel-corei7-64 supports for(
> int i = 0; i < 9; i++ ); with -std=gnu99... yes
> checking for -mpreferred-stack-boundary=5... yes
> checking whether x86_64-poky-linux-gcc supports vpmovzxwd ymm0, xmm0... no
> Failed commandline was:
> --------------------------------------------------
> x86_64-poky-linux-gcc conftest.asm  -I. -I$(SRCPATH) -DARCH_X86_64=1
> -I$(SRCPATH)/common/x86/ -f elf64  -o conftest.o
> x86_64-poky-linux-gcc: error: elf64: No such file or directory
> x86_64-poky-linux-gcc: error: unrecognized command line option '-f'
> --------------------------------------------------
> Failed program was:
> --------------------------------------------------
> vpmovzxwd ymm0, xmm0
> --------------------------------------------------
>
> Ah, looks like the configure is respecting the AS environment variable that
> we set to 'as' in bitbake.conf, but it really actually wants yasm.  I added
> AS[unexport] = 1 to the recipe and it appears to work now for me.  Can you
> verify that it still works on the architectures you care about?

recipe is setting AS too here ,so that must be removed as well. I will send a V2

>
> Ross

