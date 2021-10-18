Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCAAC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 06:39:12 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.33132.1634539150679117010
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 23:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=meT7CAw5;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id y15so65313712lfk.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 23:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vPzw5QszC/c/hbJUt8bmKmRhp6S6gqahf7XwzqTaQhg=;
        b=meT7CAw5Av+FeHioAk4R+efd+NQLn/uEv2Jl4o37g4lbgSYsf2MORLuznkv+S7INsQ
         3n0N/Q9lJqOiKGD6xdaG37aEnVIF50Tf1cu3Q1pB9UdCR80vG1hC3cPvxUg7B31W2odK
         XQfWHpgNWyJldOZPCAN7q7MV76netlbvlmXwOVPNMLxZWoW/5AuopQF09bqsnh9zWW/J
         XMid+okvm2bntuIPLFmzWLGbXvlmPHe6HuBKE/qUymI78DX0o5vIROkDocaozVzvDRfu
         UJRPb3d7uyHwtiCvSW2RjCjiAPgsxuQogXJvWtrcx/CpdRfoIGk+pW4RGLRRBi138s3e
         M04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vPzw5QszC/c/hbJUt8bmKmRhp6S6gqahf7XwzqTaQhg=;
        b=zNLwsMOniSQXheL/MP5M1fj5B7l1QslXSgAz0xwriEzKmUTjoxLF0hjZ5O6Cq7qI7k
         6irb6XtkAkkvOXwo3b5LLTEKf/KVKZ4bWxhVLixaNEXwldujL9T5Q116QqAI6r2SdO6c
         /lsqy7PywgvVUNf7HqOecEle6PAHOtuV+zS5KbRKHCnR9eYLrobtoUNOOO+gg4u3OUUD
         9t4Qqfn2SbRGiJbq8p/T99yktdn9IqG0xvxFCo/T4Z7hGZeDCS3uOHuQFEV9/m47AOHU
         xSXlZsXOxYRlp1WEe8/tP3rEBCNuNDwhq7ZeVQHZmPNF4lxQDkQmn2snPJtGh6fEfE6o
         3osg==
X-Gm-Message-State: AOAM530Z8f6X36NGEpp8EtcumULyp7qIDPIXjqZRVDDxOoS6apkIdfDd
	KhLb4FKytYgvdh4gmdgCCAA=
X-Google-Smtp-Source: 
 ABdhPJym4MDGpxp83HKsU1LidzefVyFSCvM1LLTyVep1xItQCHFZ4LOvZbUzw0W1WZBIcFMIUNa8ow==
X-Received: by 2002:a05:6512:3713:: with SMTP id
 z19mr12314913lfr.309.1634539148519;
        Sun, 17 Oct 2021 23:39:08 -0700 (PDT)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 q6sm1316557lfg.188.2021.10.17.23.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 23:39:07 -0700 (PDT)
Message-ID: <29fd6f53-b8fd-4c29-b547-41fa3dfee376@gmail.com>
Date: Mon, 18 Oct 2021 08:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [OE-core] linux-yocto: Set CONFIG_ATA_PIIX=y by default
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Saul Wold <Saul.Wold@windriver.com>
References: <16AE71B3ADB3BD09.11150@lists.openembedded.org>
 <086e00e6-0cd0-0304-8021-f25dcfeb7287@gmail.com>
 <CADkTA4PyZWTHrscZF7W7mVNKTs1+61rEDakfXex8Vv1=EQOxWQ@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <CADkTA4PyZWTHrscZF7W7mVNKTs1+61rEDakfXex8Vv1=EQOxWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 06:39:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157049

On 10/17/21 15:32, Bruce Ashfield wrote:
> On Sun, Oct 17, 2021 at 4:26 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>>
>> Hi Bruce and Saul,
>>
>> On 10/16/21 09:18, Jacob Kroon via lists.openembedded.org wrote:
>>> Hi Bruce,
>>>
>>> My Yocto images (which uses the linux-yocto kernel) stopped booting in
>>> QEMU some time ago, and after some debugging it turns out this was
>>> because the upstream Linux kernel removed the legacy IDE driver. Instead
>>> one should use the libata driver. However, I don't think the linux-yocto
>>> kernel has builtin support for the HW that is emulated by QEMU by
>>> default (PIIX), instead it is built as a module, CONFIG_ATA_PIIX=m. If I
>>> set CONFIG_ATA_PIIX=y, my images boot again.
>>>
>>> I did a "make ARCH=i386 defconfig" in Torvalds master linux tree, and
>>> the .config has CONFIG_ATA_PIIX=y.
>>>
>>> Do you think it would make sense to have the support builtin in
>>> linux-yocto aswell ?
>>>
>>
>> I'm using KMACHINE = "common-pc". CC:ing Saul Wold, since I see that
>> commit 0d4f5ed5dca41a48423ce738131e52f7863d8ca6 in yocto-kernel-cache did:
>>
>>> diff --git a/bsp/common-pc/common-pc-drivers.cfg b/bsp/common-pc/common-pc-drivers.cfg
>>> index 71608433..0b821903 100644
>>> --- a/bsp/common-pc/common-pc-drivers.cfg
>>> +++ b/bsp/common-pc/common-pc-drivers.cfg
>>> @@ -5,7 +5,8 @@ CONFIG_PCI_MSI=y
>>>   CONFIG_ATA=y
>>>   CONFIG_ATA_ACPI=y
>>>   CONFIG_ATA_SFF=y
>>> -CONFIG_ATA_PIIX=y
>>> +CONFIG_ATA_BMDMA=y
>>> +CONFIG_ATA_PIIX=m
>>>
>>>   CONFIG_INPUT=y
>>>   CONFIG_INPUT_MOUSEDEV=y
>>
>> which changed ATA_PIIX from a builtin to a module. Maybe this wasn't
>> intentional ?
> 
> It was definitely intentional.
>  > We try and keep the configuration space of the targets as small as
> possible. In particular, this is exactly why qemux86* was created, so
> we wouldn't have to enable options in either the h/w targets or the
> emulated targets that are specific to a use case on one (and vice
> versa). That being said, they still actually do share the same machine
> definitions in the kernel-cache, since nothing significant has forced
> me to use that namespace split.
> 
> qemux86 doesn't need PIIX out of the box to boot, and the Kconfig
> indicates "set it to N unless ...", and we do know the built-ins we
> want, so it is set to 'm' as a middle ground.
> 

When I start qemu-system-x86_64/qemu-system-i386 and type "info qtree" 
in the QEMU monitor (both version 5.2.0 and 6.1.0) I see "piix3-ide" for 
the IDE controller. Given that for older Yocto kernels the legacy IDE 
driver was builtin (CONFIG_BLK_DEV_PIIX=y), but is now removed in the 
kernel present on master, I'd figure ATA_PIIX=y would be required 
nowadays in order to get the kernels to boot in QEMU (since libata is 
replacing the old legacy IDE driver nowadays).

> That being said, it isn't out of the question to enable it (slippery
> slope to giant defconfig like beasts with everything and the kitchen
> sink enabled notwithstanding .. not that this is much of a step down
> that slope!) .. just let me ask a few more things first.
> 

Yeah, the only reason I'm asking is because I think I'm using default 
QEMU emulated hardware, and I'm sure we want a Yocto kernel to boot in 
default QEMU hardware.

> You say you are using KMACHINE='common-pc', that's good. But what else
> is at play ? What OE MACHINE are you building ? What image FStypes,
> etc ?
> 

It is a custom machine for

https://www.compulab.com/products/computer-on-modules/cm-itc/

machine/cm-itc.conf:
---
IMAGE_FSTYPES ?= "ext4"

require conf/machine/include/x86/tune-i686.inc
require conf/machine/include/x86/x86-base.inc

PREFERRED_PROVIDER_virtual/bootloader = "grub-efi"
---

> I won't be able to do some build testing until Monday, but do you
> happen to have the qemu command lines (via runqemu) and machine
> definitions for qemux88 and your machine?  I'd like to look at them
> and confirm exactly what image, and boot parameters are in play, since
> one boots and the other doesn't.
> 

I don't use the "runqemu"-script, I boot the images using Fedora 34 QEMU 
installation (QEMU version 5.2.0). Commandline is:

> qemu-system-x86_64 -m 1G -enable-kvm -nic user,hostfwd=tcp::10022-:22 -cpu n270 -bios /usr/share/edk2/ovmf-ia32/OVMF_CODE.fd -drive format=raw,file=<path-to-image>

I have the following bbappended in my yocto kernel recipe:
KMACHINE:cm-itc ?= "common-pc"
COMPATIBLE_MACHINE:cm-itc = "cm-itc"

together with some custom kernel configuration.

Regards Jacob

