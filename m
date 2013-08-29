Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 096016BDA6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:58:16 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id q8so1054192lbi.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HJD0rwezB88PKmU1m84IYMNRTdYcD9l4rIlqwk864js=;
	b=nMUSeWkB87p69LlQ6VFrct59wlQfxoM9d0YoqePK6GlZmprTN5/exta4jogrcxf51F
	9ubio7c+nrY8lsOTB6Yc0qnM+PJUNfEIKGhGQx/3+8O1R58IQcmCvvkj7zUj5s8q/etf
	E4ONpSFSvz0D4uEz2IxaDrfG9fes5ILmgfMg9mSAME3vBek7o30/hjyCpyjuMH3w5r/7
	ZC41psYlG4C8RHm/V2pcAyK4R7Z0f8puXBsY16gMnV3mBVsfaAlk1zJGwJxeFqrtmwrP
	rltj7DEWdlCTcLoshYJiPdVJkt3eRdfeI3y9vhXPa9sJHucdYW8gplYTt/WkAS/czQJu
	IVkQ==
MIME-Version: 1.0
X-Received: by 10.112.158.225 with SMTP id wx1mr2916808lbb.37.1377802697020;
	Thu, 29 Aug 2013 11:58:17 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 11:58:16 -0700 (PDT)
In-Reply-To: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
References: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
Date: Thu, 29 Aug 2013 14:58:16 -0400
Message-ID: <CADkTA4NWhz3rmAqH=yB_5H4V4f11w4qZdYUTOG73SNLyv6R-=A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: rewitt@declaratino.com
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 18:58:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 2:53 PM,  <rewitt@declaratino.com> wrote:
>
>
>> -------- Original Message --------
>> Subject: Re: [OE-core] [oe-core] QEMU with ARM Cortex A9 with hard float
>> configuration - Kernel panic
>> From: Elvis Dowson <elvis.dowson@gmail.com>
>> Date: Thu, August 29, 2013 12:28 pm
>> To: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Cc: OpenEmbedded Core Mailing List
>> <openembedded-core@lists.openembedded.org>
>>
>>
>> On Aug 29, 2013, at 8:23 PM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>>
>> > On 13-08-29 10:02 AM, Elvis Dowson wrote:
>> >> Hi Bruce,
>> >>
>> >> On Aug 29, 2013, at 4:35 PM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>> >>
>> >>> With that, it's always been a manual setup for me in the past. The typical
>> >>> workflow is to test them via the usermode NFS boot. Have you given
>> >>> that a go ?
>> >>
>> >> Does yocto have some wrapper script/command to setup nfs boot automatically
>> >> without too much manual configuration? The runqemu and runqemu-internal
>> >> scripts seems to indicate that, but haven't tried this before.
>> >>
>> >> Let me know if it exists! If not, if you could point me to a link that describes how
>> >> to set NFS boot, and use it to load a beagleboard image it would be great!
>> >
>> > This is supported right out of the box, and it should be documented in
>> > the project docs.
>> >
>> > Search for users-space NFS in http://www.yoctoproject.org/docs/current/adt-manual/adt-manual.html
>>
>> I saw this, its only for the rootfs. what I've read on the net alluded to the fact that you need to have
>> xload, uboot and the kernel image on a specific partition inside an sdcard image. Those were
>> the boot procedures used for the beagleboard using qemu.
>>
>> This is for -M beagle, with qemu-system-arm.
>>
>> Anyway, I just need a way to boot vexpress-a9 using QEMU. I'll send a private email, with the
>> patch to you, so that you can start off from where I left, in terms of modifications to poky-master
>> and be able to debug the issue directly at your end.
>
> I actually set up a build to get a vexpress-a15 booting in qemu with
> neon support. However, I didn't use the yocto kernel and just pointed at
> my own defconfig and kernel version 3.10.7. If it would be helpful for
> you, I could put my changes up on github.
>
> The weirdest thing was if I just used the defconfig that is in the
> kernel for vexpress it wouldn't boot, I had to tweak it a bit.

I have a vexpress A15 that works here as well, but I wouldn't mind comparing
configs. If you send it along, I'd have a look.

I'm not surprised it needed some changes .. when going to qemu mileage varies
with in tree defconfigs.

Bruce


>
>> Best regards,
>>
>> Elvis Dowson
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

