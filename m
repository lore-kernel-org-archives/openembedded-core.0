Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 34E806013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 15:54:28 +0000 (UTC)
Received: by iepj10 with SMTP id j10so108006880iep.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kqZ8CSulsLTe8Rq1hkcONoa/CdpboLVHHrar5CgYRVk=;
	b=zhMWZzosBjSRz1M0xAYlsEWFrRA0cu7Ekxchrnnx8dnioJQrxVtA3N7Sdmyt9usowR
	rYDKPC4v364v2wPRYnLR/gJT0/pACNH1q6bdHkkVBbqzhZxjW0cZU5skn8C+jIBRxrLG
	0oQ/8hxmhEtze7wYUcj9dhTU02OnpiGLdeXKcaKyhjue9/+W9OLQ/FRNWTj/cEZhpLc6
	TRsv/76K+bbDM0+hVoxAYfLstwcCD9fApPCvRBmlQDN4YCqdz687QvZNDMLIwtdn612D
	avLZ12s0VA0WxN5gkSPb2YQ5jdmsB4W2L4dU5JhWpouMDVYBjktP1b5hI+lvVrfJr0HK
	ZVrQ==
X-Received: by 10.50.117.35 with SMTP id kb3mr13915095igb.13.1431359666547;
	Mon, 11 May 2015 08:54:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 08:53:56 -0700 (PDT)
In-Reply-To: <1431350446.30971.56.camel@linuxfoundation.org>
References: <1431350446.30971.56.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 May 2015 08:53:56 -0700
Message-ID: <CAMKF1sptEocAHMM98RwUzsUUuE4a+3c1Y72E1wmfGzua-G8hdQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto and gcc 5.x
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
X-List-Received-Date: Mon, 11 May 2015 15:54:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 11, 2015 at 6:20 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> One of the things we're looking at in 1.9 is gcc 5.x support by default.
> One of the areas this has significant impact is on the kernels,
> linux-yocto in particular. I'm starting to see a potential problem here
> since the kernels don't appear to work well with gcc 5.x:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150&order_by=RECIPE
>

as mentioned in another thread. linux-yocto needs to backport
https://patchwork.ozlabs.org/patch/403787/
to beging with. I have 3.8 running on beaglebone white but thats not linux-yocto

https://github.com/koenkooi/meta-beagleboard/commit/07e27c22e707e26f3f321f51999c4f6a294b5b18
https://github.com/koenkooi/meta-beagleboard/commit/765e7f35af7e4358573868389d4ea144eacd6b7a

there is a patch or two in there that needs to go upstream into kernel
as well but I havent bothered yet.

I was not able to boot linux yocto 3.19 few weeks ago on any of
emulators when build with gcc5
rootfs did not have any issues.

I also have 3.10 compiling and booting on another Arm platform


> (this is a test build I ran just to see how bad things were).
>
> Are we going to be in a position to get 5.x support backported into 3.14
> (and maybe 3.10)? Or was we going to have to wait for later versions?
>
> Cheers,

