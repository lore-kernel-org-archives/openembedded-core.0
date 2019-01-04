Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 70A817BDC1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 00:15:38 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l15-v6so31135427lja.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 16:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=usEFLWdi8tK6pe99G2UP+mkmF09vepHhxVM5Vcqe2+E=;
	b=OZkq1L5fG8RT+3hi5slfEBYasABmuq3dF6Ga/7iXglxaiQem7uOLNu0Z0kZmSq8DCq
	E4hea4LvHU+o5TqHbqHcIUGqfmbh7h4Z7vgUOiOEra0JU1dtd6ECJy4Nsung+U11WVNH
	3iycTEWQ016ZZHRBOW1WUKyal4nUgbcQ+zBAHu3T8cyWI9ZBowfrjYh/y4FqiOglQ8R6
	Hly8EVgMA0M0Px9xTKz6WU/bovVDURyge8prGPmKqD12vuPRLE47/Bwk8WPCJSEl/0jZ
	arfPo/gONqoUWKdIXSR6RZmeDHAMQ75xPqEHyTcv8WkuTjjOGLZwPXHoTjKD9j7qTN/b
	cAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=usEFLWdi8tK6pe99G2UP+mkmF09vepHhxVM5Vcqe2+E=;
	b=AHdkPSOavUfGnBf+idZKsa+Cup0acg9e7wsn9Xu5BryMF8XMeqMz9dPGzr7IQxjXJN
	3+W137Ot295mKAWSZr6sX+JVN919jasVxLK8N9giJY+TB0mS4jXAfmzXgkMVsx1+GAzp
	SRnsDetZVEh6KwTxPVgLybaR0qp73mjUwnJ6s8XaAkjQlamggqpwRLrcNHqjogUODPJH
	uKWeZrtilkI0gyUaYtoJ8XPS/LtTR/hCOFd3ZOcGfrhyzZMziSlo2ob3ruUeMoZi9jVR
	ZQ4tnh5ZgocQVgD2bqQ21iXS4dajWm69XPANdSJlveZqT+h3NfYX2Z8/USUYvwcXzCnY
	t4TQ==
X-Gm-Message-State: AJcUukdPxs+i+6Ok03PrC11IzzitLVId5a8G+QLo+ZistMCyxZuQxW+7
	/D6DxFzxujGYAOjUEJXZwaAF09G2lPvEzI8NTuo=
X-Google-Smtp-Source: ALg8bN6IcA87rpJd88S8i57ymnWiPlRMa/CiE8AHH4b40rnjsemdix7cmPMm68pCZxMbjlygMZS6nJbe8GLR5efDycs=
X-Received: by 2002:a2e:131a:: with SMTP id
	26-v6mr4069130ljt.107.1546560938879; 
	Thu, 03 Jan 2019 16:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20180614194507.93168-1-alistair.francis@wdc.com>
	<20180614194507.93168-3-alistair.francis@wdc.com>
	<CADkTA4PJuHARyOg7zU4vNktpniz+OFg_1iU7_nUQYWmM2uhxoA@mail.gmail.com>
In-Reply-To: <CADkTA4PJuHARyOg7zU4vNktpniz+OFg_1iU7_nUQYWmM2uhxoA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Jan 2019 16:15:12 -0800
Message-ID: <CAKmqyKPVc3iTwU8aU=r=q45FeYdtegw-ZMMs=6pZ1KmL1S+ofQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] recipes-kernel/linux: Add RISC-V support
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
X-List-Received-Date: Fri, 04 Jan 2019 00:15:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 14, 2018 at 3:12 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>
>
> On Thu, Jun 14, 2018 at 3:45 PM, Alistair Francis <alistair.francis@wdc.com> wrote:
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto.inc     | 4 ++++
>>  meta/recipes-kernel/linux/linux-yocto_4.15.bb | 5 ++++-
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 95ec2a2b41..70a13cdd1e 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -26,6 +26,10 @@ DEPENDS_append_nios2 = " libgcc"
>>  KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>>  KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>>
>> +DEPENDS_append_riscv64 = " libgcc"
>> +KERNEL_CC_append_riscv64 = " ${TOOLCHAIN_OPTIONS} ${SECURITY_NOPIE_CFLAGS}"
>> +KERNEL_LD_append_riscv64 = " -no-pie"
>> +
>>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>>
>>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>> index 693670c613..4ea368a011 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>> @@ -36,7 +36,10 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>
>> -COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>> +KBUILD_DEFCONFIG_qemuriscv64 = "defconfig"
>> +KCONFIG_MODE_qemuriscv64 = "--alldefconfig"
>
>
> This doesn't belong in linux-yocto.
>
> We use defined BSP and configuration fraagments, not in-tree defconfigs
>
> I'm happy to add a BSP definition to the kernel-cache, but this isn't the way to add configuration support for the linux-yocto trees

Hey Bruce,

I'm looking at this again as the 4.19 kernel now has full working
RISC-V support.

How can I add a BSP definition to the kernel-cache?

Also, what is the reason for not using the in-tree defconfigs?

Alistair

>
> Cheers,
>
> Bruce
>
>>
>> +
>> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemurisc532|qemuriscv64"
>>
>>  # Functionality flags
>>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

