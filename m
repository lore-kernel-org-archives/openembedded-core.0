Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id A3AD760B24
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 19:12:59 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id r18so7179057edl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 11:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T5ydIz0lqxvBJCH9DRr7zH//307mXzNCn59Miicl/pc=;
	b=NPdtvKa3Jc241jAHfj3YWCI9mmaFMCozXG4SR5++ola1napt1gmf22fQa/m68vrBUu
	cPe78O6YIEd0LvpkpRQ/Ppv2W9MxT7vhgMzxX4bMVuqh+2azfo8RTPGhiL6V3PL6L3zT
	Hvn0q4wfHUTZbe0V2MAbJlhyDlSW9r5wHhs7eCBBKkgUHjCn4Yup0sSyCzyasfiPOeyV
	FwGpX6uwrTZbPcI1El9MqfQmg0vcOlIcYLaSJmf3DFLLfI2oiYI2wvGKmNeWWErX4kxW
	YRalJ1AYN9rhHAYcvQIRvhtklQ89/Qzsjf5k0lsgSHkmiIiHdl1G8GHmwMhyHRBTH6BY
	VISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T5ydIz0lqxvBJCH9DRr7zH//307mXzNCn59Miicl/pc=;
	b=B88cR4+Hn5zjca6MCfySrdEKEA/FJmSAXOudpVGJyG0cPCXsz4h88JB0z+AcuJBfUS
	sne3SUuBAj/M3iKp8Ph+5MM2EL8RcajE5XPtF8cp/ePFDVkqTOVVMFvOSnyLBGncDybj
	LfUySbYlixeNDdLoGYmDxQ6nU+ny+nzeY05B5Hak7p7UX7lKGUQ32ic3VsyFh1ytcxgY
	5652vuho8W6xLb9Q4U5BtwiKMXKSkmNluKUFv+389D+gf031eYER4aiLFeV5kbv5HzGh
	KP0nZir6MaKXwZus5uyskI8lb71Wyee1xoN7yzN6kh+GQanN8j4TSOurHqwcixJ4zQPf
	3pEg==
X-Gm-Message-State: APjAAAV2BW5PmV/k7r8c7dTv6CEfXXAy8ECZVK+VzZqcI9pRjO0rdPTu
	gGnIqkm2fSB72Y8+42H+SH6dtcBYsR25OMoh/a0=
X-Google-Smtp-Source: APXvYqyAAaudx05LmzOUqWilDoot3ZVlnfFLaIUWZj6T3wSjcwsUgJxO2+WwJtpFVHM08YQwHuHULZ3ho8W1NYBb34Q=
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr4308922edr.347.1581016380280; 
	Thu, 06 Feb 2020 11:13:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Feb 2020 14:12:49 -0500
Message-ID: <CADkTA4PZ4=V2vquGXV7=xPL5GWaPP6PMbg+bBgswCaY0tDDhQg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10][v2] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 06 Feb 2020 19:12:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 6, 2020 at 12:35 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> v2 adds a 10th patch to the series to fixup a config issue seen
> with qemuarm64. The other patches are unchanged.

Hold on queuing this quite yet.

On a clean build/test on a second machine, I saw the error pop back
up. I'll follow up shortly, once I've had a chance to look at that and
see if I missed something.

Bruce

>
> The original pull request text follows:
>
> ---------
>
> Hi all,
>
> I've kept the v5.4 content changes, as well as the kernel version default
> changes out of this series and instead focused it on the collection of
> kernel-yocto and kern-tools tweaks that I've gethered over the past few
> weeks.
>
> I have Martin's gold linker fixes included, as well as the re-org'ing of
> the linux-yocto tasks that Paul Barker did to make it usable as a single
> inherit of the bbclass.
>
> I also have a defconfig detection fix included that was sent to the list.
>
> I was able to confirm that my configuration was the same with this series
> enabled, and I was able to boot.
>
> That being said, I'll keep my eye out for any AB fallout and will continue
> some more build locally .. but I wanted to get this out today as promised.
>
> Cheers,
>
> Bruce
>
> The following changes since commit 3c6978c8db59f152693f9fae65dbab13ecfcaad4:
>
>   kernel-yocto.bbclass: export LD in the environment used by kconf_check (2020-02-04 15:56:29 +0000)
>
> are available in the Git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (3):
>   kern-tools: tweak symbol_why to be python safe
>   kern-tools: integrate merge_config fix for gold linker
>   kern-tools: fix merge_config when LD contains parameters
>
> Gavin Li (1):
>   kernel-yocto: fix defconfig detection in find_sccs()
>
> Martin Jansa (3):
>   kern-tools-native: use more common S value and oe_runmake
>   kernel-yocto.bbclass: set KERNEL_LD also for merge_config.sh
>   kernel-yocto.bbclass: do_kernel_configme: don't use +errexit,
>     merge_config_build.log and fail when /.config wasn't created
>
> Paul Barker (3):
>   kernel-yocto: Move defaults and tasks from linux-yocto.inc into
>     bbclass
>   kernel-yocto: Drop setting of unused variables in do_kernel_metadata
>   kernel-yocto: Only override CONFIG_LOCALVERSION if
>     LINUX_VERSION_EXTENSION is set
>
>  meta/classes/kernel-yocto.bbclass             | 49 +++++++++++++------
>  .../kern-tools/kern-tools-native_git.bb       | 13 +++--
>  meta/recipes-kernel/linux/linux-yocto.inc     | 21 --------
>  3 files changed, 42 insertions(+), 41 deletions(-)
>
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

