Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8939070EE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 12:58:11 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id u10so247029lbd.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8kC2bGVm6POVRV9wDQFecLYb4B0c+dAXf5in7dUMM0Q=;
	b=xrXLI6zBEjz4TQsTWxpb+o9Om+MP5bwA9esslTgBioMQWoIA6evhhEVGd2KVVCjU65
	xtmAuRBaZwsm3PMdFaXCEvmCnDARToDEHPv4X3KGCli099RszFCmupHtz9MEcGf6MVJf
	3yA/WJTUFvqS8uS5tHQHBURSJmhBZShhzxlcLPI7NtX0jLIoGG9+LEteOaTwz4YcZcU2
	sfZid94HxT3yIpSiQccybEzHu6bZ/H4gMEi1IvFBcCQ40AAaV07dXTHVOtNpqPRRA0En
	dtaOxVIQoOw+fimpMXZF5zdvJmi7o18hBoJzadaMkd1Aa20mAfcDiEuZsliyfCKBoew/
	6rVg==
MIME-Version: 1.0
X-Received: by 10.152.8.82 with SMTP id p18mr3374196laa.83.1409144292098; Wed,
	27 Aug 2014 05:58:12 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Wed, 27 Aug 2014 05:58:12 -0700 (PDT)
In-Reply-To: <53FDB8B5.8030802@windriver.com>
References: <53FDB8B5.8030802@windriver.com>
Date: Wed, 27 Aug 2014 08:58:12 -0400
Message-ID: <CADkTA4MepTkfGYS52k-bFYhAPwfo=SNS48_DLi7O_7QnEBfG6A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Question about aarch64 target
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
X-List-Received-Date: Wed, 27 Aug 2014 12:58:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 27, 2014 at 6:53 AM, Kang Kai <Kai.Kang@windriver.com> wrote:
> Hi Saul,
>
> I am working on Bug 6487 - Add Aarch64 qemu target. I take tune and config
> files from linaro then succeeds to build core-image-minimal and
> core-image-sato.
>
> And I have 2 question about it now:
> 1 What should the new qemu aarch64 bsp looks like at the end? Do the files
> in the patch attached are enough? And what more test should we do except to

I've said this *many* times, but no one has ever responded. We need the kernel
support to match the linux-yocto* home for the other core/emulated BSPs .. that
way I can help support, test and bring everything forward.

We have a 3.14 and 3.16+ version of the recipe available, and I've
looked into this
in the past ... the delta needed in those kernel versions is not significant.

Bruce



> build images such as core-image-sato,  core-image-sato even build world?
>
> 2 There 2 aarch64 configure files from linaro. First one is little endian
> and it is as default, and the other one is big endian. I take the little
> endian one as qemuarm64.conf as linaro does. Do we need add the other one as
> qemuarm64_be.conf or something like that?
>
> --
> Regards,
> Neil | Kai Kang
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

