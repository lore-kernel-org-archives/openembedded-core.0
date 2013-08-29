Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 352556BEE3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:40:37 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so781746lab.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7cf5vWIzrBdy6/OslL5zVSSipnSFtx5IFgBDBtBuwco=;
	b=gRrZIU+GPpP3ZVrGwSFppNQLoXlMGgzwekGeK57PyNhGkoFkCZyvLVaQJJ7kAX8y6g
	u7iMwsfh4m5DepFPYVbOpNaPT4xZyK0OWPsHYbxBymo1SlVXmR+qTg2ULSvH5oG3WK67
	08QBoHlgefsT+0FY+Zk6o7lnmq+BuBNdYSH/VX1S+rvX2J4kqd9TdZjIBtZd3Os9+xn8
	FmNsNxBM9U8WUl0zyAQc3WT2WNpcF1Vb3wv+3Cpy7V8IKB6NPISVkEC16rNWW+K8lLEe
	mxxSk6+YvhH7+Sa8z/08VxuzCJHyqPstrwqeP5NJLSF0wHqOQySuUK5LKGjtBHxXYhsk
	nRxQ==
MIME-Version: 1.0
X-Received: by 10.112.143.3 with SMTP id sa3mr4494212lbb.12.1377805236968;
	Thu, 29 Aug 2013 12:40:36 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 12:40:36 -0700 (PDT)
In-Reply-To: <20130829123223.a5c5c4a29245e5c988b774ab8f895ac5.70f3d16c25.wbe@email15.secureserver.net>
References: <20130829123223.a5c5c4a29245e5c988b774ab8f895ac5.70f3d16c25.wbe@email15.secureserver.net>
Date: Thu, 29 Aug 2013 15:40:36 -0400
Message-ID: <CADkTA4Pfuj7PZ_va9w8iio+s4o2wL-EKnCi5z5Vq5favz2Xbyg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: rewitt <rewitt@declaratino.com>
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
X-List-Received-Date: Thu, 29 Aug 2013 19:40:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 3:32 PM,  <rewitt@declaratino.com> wrote:
>
>
>> -------- Original Message --------
>> Subject: Re: [OE-core] [oe-core] QEMU with ARM Cortex A9 with hard float
>> configuration - Kernel panic
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Date: Thu, August 29, 2013 3:16 pm
>> To: Elvis Dowson <elvis.dowson@gmail.com>
>> Cc: rewitt <rewitt@declaratino.com>,  OpenEmbedded Core Mailing List
>> <openembedded-core@lists.openembedded.org>
>>
>>
>> On Thu, Aug 29, 2013 at 3:01 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>> >
>> > On Aug 29, 2013, at 10:53 PM, <rewitt@declaratino.com> wrote:
>> >
>> >> I actually set up a build to get a vexpress-a15 booting in qemu with
>> >> neon support. However, I didn't use the yocto kernel and just pointed at
>> >> my own defconfig and kernel version 3.10.7. If it would be helpful for
>> >> you, I could put my changes up on github.
>> >>
>> >> The weirdest thing was if I just used the defconfig that is in the
>> >> kernel for vexpress it wouldn't boot, I had to tweak it a bit.
>> >
>> > This is the thing, I was using this as an excuse to learn linux-yocto
>> > kernel. I actually put off using linux-yocto for a while, and tended
>> > to use the official linux kernel, or vendor specific kernels (Xilinx,
>> > TI Arago, Freescale, etc) for actual target devices.
>> >
>> > If you could share your defconfig, I'll try it with the standard
>> > linux kernel.
>>
>> linux-yocto-3.10 is pretty much the standard kernel, unless you want to use
>> the extra features I've merged, it is vanilla.
>>
>> You are going overboard with the definitions. What the build really needs, it'll
>> generate on it's own. If you want to make an official/controlled BSP
>> ... only then
>> do you actually need .scc files, etc.
>>
>> If you add compatbility with the linux-yocto recipe, put a defconfig in the
>> SRC_URI and you are done.
>>
>> Bruce
>
> Ok here is the defconfig I used for a15. I disabled SMP because it was
> annoying me more than helping. I did have to use the dtb generated as
> well, otherwise it wouldn't work.
>
> This is the typical qemu command line I used:
>
> qemu-system-arm -cpu cortex-a15 -M vexpress-a15 -kernel
> images/zImage-qemuarmv7a.bin -append"console=ttyAMA0 mem=512M
> root=/dev/mmcblk0 rw" -m 512 -dtb

Aha. That's the part that has always caused me trouble. Booting directly from
the mmc means I don't have to try and get a platform with sata or other
support that isn't in the real hardware.

> tmp/deploy/images/zImage-vexpress-v2p-ca15_a7.dtb -sd
> tmp/deploy/images/core-image-minimal-qemuarmv7a.ext3 -net nic -net
> user,hostfwd=tcp::2400-:22 -nographic
>
> I also made my own machine configuration so of course the name of the
> rootfilesystem file will be different. As Bruce said, I'm sure this
> could be plumbed in to the yocto infrastructure so that runqemu and the
> various helpers could be used, but I was trying to get an sdk out to
> someone fairly quickly.

:) that sounds familiar, I'll poke around with this over the weekend and see
if it works for me too.

Cheers,

Bruce

>
>> >
>> > I'm doing this to get the process of using Yocto to build a representative
>> > QEMU emulator, and then using LaunchPad and Soyuz locally to
>> > build Ubuntu on a virtual machine, rather than just re-use the official
>> > Ubuntu binary packages. This way, I have more control over the
>> > toolchain, and options, rather than use the existing armel or armhf
>> > machine configurations supplied by Debian/Ubuntu.
>> >
>> > Best regards,
>> >
>> > Elvis Dowson
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

