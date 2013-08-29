Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id B15C06BCF4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:16:53 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id u14so1066770lbd.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 12:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9773mW7WUm8agdY421/psqX2TT6sMlxIw7uZ20zHZAs=;
	b=kDeFixc7MJ8cbBVTB03EqnQ9DyL2jarcCNUWbtq+H4k80HlnJnWuXr9sDBDjM+ROfj
	wjGg7//e83yrFwK1/fjs/n/k8Zh2biV/xsCiYDtNy2ljr65PeqTN8VDRwL5WKlzJSlqL
	F4IHT7Gcx65uAfN0MX/ymH0PytSLq8lNrKToAKzDyjWNDtt1Fj/5aIclL8D8Plvgg2VX
	PxhgEh8ac/6ApFMmvacLvFCJX8JlDA8ptoLw7xf3rTiJMFCld3YWEUqZKkGE7yPguIYg
	AC3QYBOYBawQjComi9838XOh0h17jP9vCwcZBbjM4M/9BlB5+YNIKTy5IWYGH0FaQ/W2
	OS+w==
MIME-Version: 1.0
X-Received: by 10.152.26.72 with SMTP id j8mr4257636lag.19.1377803813793; Thu,
	29 Aug 2013 12:16:53 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 12:16:53 -0700 (PDT)
In-Reply-To: <A259F4C4-2C7F-4835-961E-3F2EEF8F0FD6@gmail.com>
References: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
	<A259F4C4-2C7F-4835-961E-3F2EEF8F0FD6@gmail.com>
Date: Thu, 29 Aug 2013 15:16:53 -0400
Message-ID: <CADkTA4M2hEpX25DVY-pGNM1-JrL-8t5M4Mjf72gUPg78DowxkQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2013 19:16:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 3:01 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> On Aug 29, 2013, at 10:53 PM, <rewitt@declaratino.com> wrote:
>
>> I actually set up a build to get a vexpress-a15 booting in qemu with
>> neon support. However, I didn't use the yocto kernel and just pointed at
>> my own defconfig and kernel version 3.10.7. If it would be helpful for
>> you, I could put my changes up on github.
>>
>> The weirdest thing was if I just used the defconfig that is in the
>> kernel for vexpress it wouldn't boot, I had to tweak it a bit.
>
> This is the thing, I was using this as an excuse to learn linux-yocto
> kernel. I actually put off using linux-yocto for a while, and tended
> to use the official linux kernel, or vendor specific kernels (Xilinx,
> TI Arago, Freescale, etc) for actual target devices.
>
> If you could share your defconfig, I'll try it with the standard
> linux kernel.

linux-yocto-3.10 is pretty much the standard kernel, unless you want to use
the extra features I've merged, it is vanilla.

You are going overboard with the definitions. What the build really needs, it'll
generate on it's own. If you want to make an official/controlled BSP
... only then
do you actually need .scc files, etc.

If you add compatbility with the linux-yocto recipe, put a defconfig in the
SRC_URI and you are done.

Bruce

>
> I'm doing this to get the process of using Yocto to build a representative
> QEMU emulator, and then using LaunchPad and Soyuz locally to
> build Ubuntu on a virtual machine, rather than just re-use the official
> Ubuntu binary packages. This way, I have more control over the
> toolchain, and options, rather than use the existing armel or armhf
> machine configurations supplied by Debian/Ubuntu.
>
> Best regards,
>
> Elvis Dowson
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

