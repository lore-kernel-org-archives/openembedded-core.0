Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id DF81877298
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 18:23:02 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id 5so19782721igt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 10:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Lb3MqkI0Fd9HOLFHzfDGkpgYPNhOs+pVqCfn6EgP1AM=;
	b=S68YhgsVvwHaYPW0W52CHugOTKxwQK95dP3YemuUFXmBPfWlN6vvzyS6BmJikv2iWJ
	nKP3OTuOX6xq+LzIXCARvWwVFpiQyE/Tf3SiuxXcYW73MpPbUZDh/pOt/J4ZrA5TcqzJ
	V+zUtPlK1y1Vy9h3CTxFcezztowryPSJ5DVOKE+xdU24BIzn1joQ5BEBPzrlgO14q7Tm
	OrGy3v5J5kXrn2exDTWnr1XDgVfNByK7nPfGBye/rcngf+CCvqL4tNoYd4W6yOfauBPr
	/zHt0khhJI5VQMaTj5jFNCWVcyictQwQ5tbCCWvTC/kUF41DPKfXvten6EM3N7pM/ESG
	awsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Lb3MqkI0Fd9HOLFHzfDGkpgYPNhOs+pVqCfn6EgP1AM=;
	b=gXRY+T4ACKJPQqIYlMKJKZQuXnc1rZ2+4/S8SWfapvWLSV2lxwCk5o0LaHCctR6MTb
	3ttQOHT5RFII3LyxQhxihoADKaUbP478cbhnVwHdKyBY6by9BNo93jIxgbtSPIhgtbQa
	xpzo1dQrh5i+KrvMwLL3YsBWZA5ZCBartnjoGenlesSMKkfui8yhRci3x2bL+fVMQ7ZY
	S4YrMdk9a9pY7AMhME0DVl55gOVjxOFm8CO2THyZhAjogBU8T9XTn1+6OqcS6oN4UJHx
	Y5v233A1oPoSgvG31fjOtY1zi9Cck3LxWkbtOifPRoyyGHGVwkQMh5W6RK0xABVbNhpg
	uzzQ==
X-Gm-Message-State: AG10YOQq/R00z+WEqFqpPuskhSCryfOTQ6h4cZwLNGpCMfE1mDiWYYn5Rlif8wyGa9hXnUctDK5i7lhWiJHWZw==
X-Received: by 10.50.141.226 with SMTP id rr2mr10586729igb.75.1454696582946;
	Fri, 05 Feb 2016 10:23:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Fri, 5 Feb 2016 10:22:33 -0800 (PST)
In-Reply-To: <20160205173256.GA7728@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202210411.GA20640@mcrowe.com>
	<1454452885.27087.127.camel@linuxfoundation.org>
	<20160205173256.GA7728@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Feb 2016 10:22:33 -0800
Message-ID: <CAMKF1srahWOS2zu2G6JEXZiwcX9sgqXQ9LOb4z6n0te73H=RDg@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 05 Feb 2016 18:23:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 9:32 AM, Mike Crowe <mac@mcrowe.com> wrote:
> On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
>> > > > [snip] Set EXTRA_OEMAKE = "" in bitbake.conf
>
> On Tuesday 02 February 2016 at 16:01:14 +0000, Richard Purdie wrote:
>> > > Which architectures did you test? Often, x86 is a bad choice here and
>> > > we'd need something cross (arm/mips/ppc) to ensure it really is doing
>> > > the right things. We also need to assess a bit more than just sato.
>> > > We can run this up on the autobuilder and see what happens.
>
> On Tue, 2016-02-02 at 21:04 +0000, Mike Crowe wrote:
>> > I've compile-tested qemux86 and qemuarm for core-image-sato. qemumips
>> > is building now.
>
> Since then I've collected enough patches to make "bitbake world" build
> successfully for qemux86, qemuarm, qemuppc and qemumips. qemux86-64 is
> building now. The recipes that needed fixing to explicitly set
> EXTRA_OEMAKE = "-e MAKEFLAGS=" were:
>
>   meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
>   meta/recipes-bsp/libacpi/libacpi_0.2.bb
>   meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
>   meta/recipes-connectivity/openssl/openssl.inc
>   meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
>   meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
>   meta/recipes-devtools/perl/perl-native_5.22.1.bb
>   meta/recipes-devtools/perl/perl_5.22.1.bb
>   meta/recipes-extended/ed/ed_1.9.bb
>   meta/recipes-extended/iputils/iputils_s20151218.bb
>   meta/recipes-extended/pigz/pigz.inc
>   meta/recipes-extended/stat/stat_3.3.bb
>   meta/recipes-extended/sysklogd/sysklogd.inc
>   meta/recipes-extended/unzip/unzip_6.0.bb
>   meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
>   meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
>
> I will submit patches for these shortly.

then there are other layers besides OE-Core where this will be needed.
so phase it right so it doesnt cause land slide work for other layers

>
>> > We've been running with the previous version of the patch with our code
>> > for a while but now I look more closely that solution didn't have
>> > anywhere near as wide an impact so I'll switch us over to using these
>> > patches. That will runtime-test a few real mips and arm targets (and
>> > even x86 and x86-64 to a limited extent) but only with our customised
>> > set of packages.
>
> On Tuesday 02 February 2016 at 22:41:25 +0000, Richard Purdie wrote:
>> Thanks. Please do mention what tests have passed/failed just so I can
>> build some idea of the risk of the patch and decide if/as/when the
>> right time to merge it is.
>
> I've not yet done any more runtime tests. I hope to get the change into our
> tree tonight so everything gets rebuilt with it over the weekend and I can
> test next week.
>
>> > > A post to the architecture list is probably needed so everyone knows
>> > > this is happening (or at least being considered).
>
> I hope to send such a post later today.
>
> Mike.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

