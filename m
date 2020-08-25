Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.15944.1598368595219808406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 08:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastree3d-com.20150623.gappssmtp.com header.s=20150623 header.b=QOywuPZh;
 spf=none, err=SPF record not found (domain: fastree3d.com, ip: 209.85.218.48, mailfrom: adrian.fiergolski@fastree3d.com)
Received: by mail-ej1-f48.google.com with SMTP id si26so17063449ejb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=F9ocrp4oIumqq0J/WcEZCOyZxbtd71j+CltB/IGRRwQ=;
        b=QOywuPZhoiuY+GyOKXTI8xdEXZYVSDXjGvsSq0Rk+TKPOEwG8rHRSOnysR5NaO65LI
         G9r1Gfn9/NfG/W7isperhdlfS+NBl6j5kbK27/dOMBvjK+bIV4ZHQAQIr9XTl24Lbn2/
         kriEM+aMpULqRcsAal5sngauJp1TmA20FTo3na8VKh17U5x9/cEuJRLjN/MkyaGltF4x
         c0V0lFPJv+E24UJqcdoKfEhxNFQlDqK0xrlwAsrOP7WKPwX+Ovhyt+nMvn/oKOmzDPeK
         RfrDqwT29Dje/iWPEnI4/NyPln9OPaSSvIhseRrtMCVndWQEF2FwrsPDbvEK0u90L1Xw
         62uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=F9ocrp4oIumqq0J/WcEZCOyZxbtd71j+CltB/IGRRwQ=;
        b=mzjP1qdyjIHH5hpqMXEkj6Vt322/ZJQHInokNJTEloLFgoPwSattXS6Fj3WzUDAAE8
         1uaB/ob8wTx+3bonTQ8wZ9L1Cl/FcpuVY9R3/Uf2/LI6kZPfBK68HNCTE5ls70vtix7m
         ZVPEvss/qBcm68d6u3+k/s+TbjvfmtGDsjGEw9uxT4WKsgioXMVDQuEzfQ2t455uWObb
         wuk3JgeXsatSmzYjK4t6Nsd/VuLqZBabDqWO5cpcLPjfAlo1GO1c7n0QRX6oCZzj+w/l
         CVSXJ8M5IWKsBltnCPc7I/lefi89G0kTxLT2F6aOjJelyMUutRPuyGNQlDnU6FzyHvtM
         4QsA==
X-Gm-Message-State: AOAM533fz39Kp7mEAgpt9MRtsmTnyIecIys3iMw3dvohEV701LfQpnBV
	GxI6kP6Mzv/gaj+G3bKhU6pT5JjbeXv8
X-Google-Smtp-Source: ABdhPJwYbHDj7bUrIqBNaYWHUXsBgTlL46HjoUipqma0C/DLmuBTC19yhd5qaHTAuYkd4meKyJnS+g==
X-Received: by 2002:a17:906:d28d:: with SMTP id ay13mr3319113ejb.537.1598368592990;
        Tue, 25 Aug 2020 08:16:32 -0700 (PDT)
Return-Path: <adrian.fiergolski@fastree3d.com>
Received: from [192.168.33.195] (fastree1.epfl.ch. [192.26.37.52])
        by smtp.gmail.com with ESMTPSA id w7sm13906462ejy.4.2020.08.25.08.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 08:16:32 -0700 (PDT)
From: "Adrian" <adrian.fiergolski@fastree3d.com>
X-Google-Original-From: Adrian Fiergolski <Adrian.Fiergolski@fastree3d.com>
Subject: Re: [OE-core] [devtool] problem with PACKAGE_ARCH and TARGET_OS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 yocto@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <05aa33d7-b90a-f20d-9a55-a066681df83a@fastree3d.com>
 <91b95db23b9314f5adafa3e5264734fdd19bb673.camel@linuxfoundation.org>
Message-ID: <044fcb83-3d37-a5d4-7685-a1662c772182@fastree3d.com>
Date: Tue, 25 Aug 2020 17:16:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <91b95db23b9314f5adafa3e5264734fdd19bb673.camel@linuxfoundation.org>
X-Groupsio-MsgNum: 141827
Content-Type: multipart/mixed;
 boundary="------------2B129FC6A551ED49F434C62B"
Content-Language: en-GB

--------------2B129FC6A551ED49F434C62B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Richard,

Thank you for your reply.

On 25.08.2020 15:05, Richard Purdie wrote:
> On Tue, 2020-08-25 at 14:47 +0200, Adrian wrote:
>> Hi,
>>
>> After recent update of poky, I started to experience an issue with
>> devtool. Currently, I am using the latest zeus version. I have a
>> multiconfig environment (Xilinx ZynqMP+ with ARM64 and Microblaze). I
>> am
>> modifying my recipe compiled from local sources. The custom target
>> machine configuration sets DEAULTTUNE="cortexa53"
>>
>> When I call:
>>
>> $> devtool build peary
>> $>devtool deploy-target peary root@192.168.33.167
>>
>> I get the error:
>>
>> ERROR: No files to deploy - have you built the peary recipe? If so,
>> the
>> install step has not installed any files.
>>
>> In fact, I see that 'devtool build' creates image under
>> '/home/afiergol/poky/build/tmp/work/aarch64-poky-
>> linux/peary/1.0+git999-r0/image',
>> while 'devtool deploy-target' search for files under
>> '/home/afiergol/poky/build/tmp/work/cortexa53-poky-linux-
>> gnueabi/peary/1.0+git999-r0/image'
>>
>> If in the 'peary' recipe I add a line
>>
>> PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>> 'devtool deploy-target' starts to search under
>> '/home/afiergol/poky/build/tmp/work/aarch64-poky-linux-
>> gnueabi/peary/1.0+git999-r0/image'
>>
>> If further, I fix in the 'peary' recipe:
>>
>> TARGET_OS = "linux"
>>
>> 'devtool deploy-target' properly deploys the binaries to the target
>> machine.
>>
>> However, as I explained, I had to fix in the recipe PACKAGE_ARCH and
>> TARGET_OS variables. It is required only for devtool to work, as
>> bitbake
>> builds properly my custom Linux image containing the recipe without
>> those variables being set anywhere in my layer.
>>
>> Has anybody else experienced a similar issue? Could somebody give a
>> reference (I didn't find) to documentation which explains why and how
>> those variables need to be set (I especially concerned about
>> TARGET_OS)?
> devtool is working for other recipes in oe-core so this peary recipe is
> probably doing something which is confusing devtool. Or its perhaps the
> machine configuration. Is that a public recipe? If not, is there a
> recipe you could share which shows the issue?
>
> Basically we need some way to reproduce the issue to be able to
> comment. You certainly should not have to set those variables.
>
> Cheers,
>
> Richard
>
I am enclosing the recipe to this message (peary.bb).

When it comes to the machine configuration, its an extension of
meta-xilinx
(https://github.com/adrianf0/meta-xilinx/tree/rel-v2020.1_fastree3d).
Though, I can't share with you the full conf file, the issue related parts:

    #@TYPE: Machine
    #@NAME: falcon-zynqmp
    #@DESCRIPTION: Machine support for Fastree SoC board.
    #
    SOC_VARIANT ?= "eg"
    DEFAULTTUNE_falcon-zynqmp = "cortexa53"
    require conf/machine/include/soc-zynqmp.inc
    require conf/machine/include/machine-xilinx-default.inc

    MACHINE_FEATURES = "rtc ext2 ext3 vfat"

    SERIAL_CONSOLE = "115200 ttyPS0"
    SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"

    PREFERRED_PROVIDER_virtual/kernel ?= "linux-xlnx"
    PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-xlnx"

    EXTRA_IMAGEDEPENDS += " \
            u-boot-zynq-scr \
            arm-trusted-firmware \
            virtual/boot-bin \
            virtual/bootloader \
            virtual/bitstream \
            "

The local.conf, has nothing special, probably this is the most related
to the issue: MACHINE ??= "falcon-zynqmp"

Regards,

Adrian


--------------2B129FC6A551ED49F434C62B
Content-Type: text/plain; charset=UTF-8;
 name="peary.bb"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="peary.bb"

REVTQ1JJUFRJT04gPSAiREFRIGZyYW1ld29yayBmb3IgdGhlIENhcmlib3UgREFRIFN5c3RlbSIK
CkxJQ0VOU0UgPSAiTEdQTHYzIgpMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1k
O21kNT1jMTYwZGQ0MTdjMTIzZGFmZjdhNjI4NTI3NjFkODcwNiIKClNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0bGFiLmNlcm4uY2gvQ2FyaWJvdS9wZWFyeS5naXQ7cHJvdG9jb2w9aHR0cHM7IgoKUFYgPSAi
MS4wK2dpdCR7U1JDUFZ9IgpTUkNSRVYgPSAiMjI3NGMwODczNDUzZGNkNjY3YjMwZWE2MTc3OWIx
MjczYjMyOWY4MCIKClMgPSAiJHtXT1JLRElSfS9naXQiCgppbmhlcml0IGNtYWtlIHBrZ2NvbmZp
ZwoKREVQRU5EUyA9ICJpMmMtdG9vbHMgcmVhZGxpbmUgbGliaWlvIgoKIyBTcGVjaWZ5IGFueSBv
cHRpb25zIHlvdSB3YW50IHRvIHBhc3MgdG8gY21ha2UgdXNpbmcgRVhUUkFfT0VDTUFLRToKRVhU
UkFfT0VDTUFLRSA9ICIgLURCVUlMRF9leGFtcGxlPU9OIFwKCSAgICAgICAgICAtRElOU1RBTExf
UFJFRklYPS91c3IvIFwKCQkgIC1EQ01BS0VfU0tJUF9SUEFUSD1PTiBcCgkJICAtRENNQUtFX0JV
SUxEX1RZUEU9UmVsZWFzZSBcCgkJICAtREJVSUxEX3NlcnZlcj1PTiBcCgkgICAgICAgIgpGSUxF
U18ke1BOfSArPSAiJHtGSUxFU19TT0xJQlNERVZ9IgpGSUxFU18ke1BOfSArPSAiJHtsaWJkaXJ9
LyoiCkZJTEVTXyR7UE59ICs9ICJ1c3IvZXRjLyoiCgpGSUxFU18ke1BOfS1kZXYgPSAiJHtpbmNs
dWRlZGlyfSB1c3Ivc2hhcmUvKiIKCg==

--------------2B129FC6A551ED49F434C62B--
