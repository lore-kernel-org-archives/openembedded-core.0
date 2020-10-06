Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.677.1602008194365074044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 11:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastree3d-com.20150623.gappssmtp.com header.s=20150623 header.b=qGdNNjMA;
 spf=none, err=SPF record not found (domain: fastree3d.com, ip: 209.85.208.43, mailfrom: adrian.fiergolski@fastree3d.com)
Received: by mail-ed1-f43.google.com with SMTP id l17so14549562edq.12
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 11:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FBmxDva7TIJ4KqUc/aunQsKeXXadNK4sU3n0ZNKwOy8=;
        b=qGdNNjMAFNwFw5SmH/oGVkz/c2/QYa8DFo3kkAthi7HOFnWMjEr0YTC+oMxNSc/uHi
         eXvHb8Kj+W3Uwn7Npld6jplWKpjYTIHgJfeEGdD/4B1afNrE6gVVdyI+BvAMnydRx6Oe
         tuBr5vgXaj+X5cp2ZIMxeo4eweYlofhW+bopR/sQ4cqqEMIo0hm/TvVWZ/WmzBtkQ07d
         43UcNU881ady3BkOkn3eh5BDr6YZH1oJe3aGm8+wVCI3W3c0S0/Ah3Tjy/byfK2UY0kQ
         Y9UvjZJ6ZYsnIhc2bhfG7AhmEmbpw8lga9NXuwvqRw9ElXGqt8p9LCxObG9iGsXrb1HA
         j7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FBmxDva7TIJ4KqUc/aunQsKeXXadNK4sU3n0ZNKwOy8=;
        b=M9V8yCgZctcfeYL+TmvpyHNcTAT7sy6JBiaBKvbyWhYkQIHRqW2OmJHuuP0/eg1KZb
         MJlNTXhyqcSHsoIMeObdgfGRFv4nsG0P0W6DfEUCfn6ftkxcljSh8ZQf/RHz7mhkzlRY
         3j0toXwdX2xouPa4Q6dQlllFCiIaM5DVyEYVhj/JnEU1DqegQN0kfmjV8YIRFCkKUHOe
         DC1/Fw9LSrf6soOpzp4F0dpHySVFyPFJS/QeQS+QqJYCcUi9AdprY+gr6fu0KtSWEX0j
         SfYi1WT6roKIYQRs+o3wpzrLhpXm87Akqt74q/dC/ngjcUMQp6YJZiQ92vJgVI+Gu0YR
         myqA==
X-Gm-Message-State: AOAM530XX8cbpT8Lzsg7UQYVkwfUw49dcwkRzWzFLTt6UmZCeR8g8DVO
	7p7Mj2tWIs4vyNsQyNU2+4wMA/C3nSX2
X-Google-Smtp-Source: ABdhPJwjy//bnKX7kjxr5g0kvnMevUH8ZQeiFAbS1K+diN3MUCUgeNUIgbFvcy0n3BOmZUax3vxCGg==
X-Received: by 2002:a05:6402:1779:: with SMTP id da25mr6828210edb.60.1602008192221;
        Tue, 06 Oct 2020 11:16:32 -0700 (PDT)
Return-Path: <adrian.fiergolski@fastree3d.com>
Received: from [192.168.33.195] (fastree1.epfl.ch. [192.26.37.52])
        by smtp.gmail.com with ESMTPSA id u21sm2468386edo.23.2020.10.06.11.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 11:16:31 -0700 (PDT)
From: "Adrian" <adrian.fiergolski@fastree3d.com>
X-Google-Original-From: Adrian Fiergolski <Adrian.Fiergolski@fastree3d.com>
Subject: Re: [OE-core] [devtool] problem with PACKAGE_ARCH and TARGET_OS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 yocto@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <05aa33d7-b90a-f20d-9a55-a066681df83a@fastree3d.com>
 <91b95db23b9314f5adafa3e5264734fdd19bb673.camel@linuxfoundation.org>
 <044fcb83-3d37-a5d4-7685-a1662c772182@fastree3d.com>
Message-ID: <79e93538-dba5-d856-161c-7d1b0e0eca3e@fastree3d.com>
Date: Tue, 6 Oct 2020 20:16:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <044fcb83-3d37-a5d4-7685-a1662c772182@fastree3d.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

Hi Richard,

I have tried with the latest version of Zeus
(d88d62c20d7d8da85f02edb170dae0280624ad7e) and the problem is not solved
yet. Do you need more information on my side?

Regards,

Adrian

On 25.08.2020 17:16, Adrian Fiergolski wrote:
> Hi Richard,
>
> Thank you for your reply.
>
> On 25.08.2020 15:05, Richard Purdie wrote:
>> On Tue, 2020-08-25 at 14:47 +0200, Adrian wrote:
>>> Hi,
>>>
>>> After recent update of poky, I started to experience an issue with
>>> devtool. Currently, I am using the latest zeus version. I have a
>>> multiconfig environment (Xilinx ZynqMP+ with ARM64 and Microblaze). I
>>> am
>>> modifying my recipe compiled from local sources. The custom target
>>> machine configuration sets DEAULTTUNE="cortexa53"
>>>
>>> When I call:
>>>
>>> $> devtool build peary
>>> $>devtool deploy-target peary root@192.168.33.167
>>>
>>> I get the error:
>>>
>>> ERROR: No files to deploy - have you built the peary recipe? If so,
>>> the
>>> install step has not installed any files.
>>>
>>> In fact, I see that 'devtool build' creates image under
>>> '/home/afiergol/poky/build/tmp/work/aarch64-poky-
>>> linux/peary/1.0+git999-r0/image',
>>> while 'devtool deploy-target' search for files under
>>> '/home/afiergol/poky/build/tmp/work/cortexa53-poky-linux-
>>> gnueabi/peary/1.0+git999-r0/image'
>>>
>>> If in the 'peary' recipe I add a line
>>>
>>> PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>
>>> 'devtool deploy-target' starts to search under
>>> '/home/afiergol/poky/build/tmp/work/aarch64-poky-linux-
>>> gnueabi/peary/1.0+git999-r0/image'
>>>
>>> If further, I fix in the 'peary' recipe:
>>>
>>> TARGET_OS = "linux"
>>>
>>> 'devtool deploy-target' properly deploys the binaries to the target
>>> machine.
>>>
>>> However, as I explained, I had to fix in the recipe PACKAGE_ARCH and
>>> TARGET_OS variables. It is required only for devtool to work, as
>>> bitbake
>>> builds properly my custom Linux image containing the recipe without
>>> those variables being set anywhere in my layer.
>>>
>>> Has anybody else experienced a similar issue? Could somebody give a
>>> reference (I didn't find) to documentation which explains why and how
>>> those variables need to be set (I especially concerned about
>>> TARGET_OS)?
>> devtool is working for other recipes in oe-core so this peary recipe is
>> probably doing something which is confusing devtool. Or its perhaps the
>> machine configuration. Is that a public recipe? If not, is there a
>> recipe you could share which shows the issue?
>>
>> Basically we need some way to reproduce the issue to be able to
>> comment. You certainly should not have to set those variables.
>>
>> Cheers,
>>
>> Richard
>>
> I am enclosing the recipe to this message (peary.bb).
>
> When it comes to the machine configuration, its an extension of
> meta-xilinx
> (https://github.com/adrianf0/meta-xilinx/tree/rel-v2020.1_fastree3d).
> Though, I can't share with you the full conf file, the issue related parts:
>
>     #@TYPE: Machine
>     #@NAME: falcon-zynqmp
>     #@DESCRIPTION: Machine support for Fastree SoC board.
>     #
>     SOC_VARIANT ?= "eg"
>     DEFAULTTUNE_falcon-zynqmp = "cortexa53"
>     require conf/machine/include/soc-zynqmp.inc
>     require conf/machine/include/machine-xilinx-default.inc
>
>     MACHINE_FEATURES = "rtc ext2 ext3 vfat"
>
>     SERIAL_CONSOLE = "115200 ttyPS0"
>     SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>
>     PREFERRED_PROVIDER_virtual/kernel ?= "linux-xlnx"
>     PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-xlnx"
>
>     EXTRA_IMAGEDEPENDS += " \
>             u-boot-zynq-scr \
>             arm-trusted-firmware \
>             virtual/boot-bin \
>             virtual/bootloader \
>             virtual/bitstream \
>             "
>
> The local.conf, has nothing special, probably this is the most related
> to the issue: MACHINE ??= "falcon-zynqmp"
>
> Regards,
>
> Adrian
>
