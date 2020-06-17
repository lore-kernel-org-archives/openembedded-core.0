Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.3520.1592385316931912677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 02:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ivfXmHTR;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id i3so1984024ljg.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JX6/o5yfqnHgOPtqugiQ71FAvhLFEegVK6tidsyjLSg=;
        b=ivfXmHTRZvXginBFS5MYIVyaq3zSWvcYhDv3MNlnHu3IoQE3MsqS0Rt9nOR3wUGCBr
         DxALp5lDM5Qz4dORx6QVeoUBuZgNg8NumrkyQOAXn5DQsnq78YtqLSQQgLTO9fwerGv6
         Ko1UoVHO+7dpLvBREpWneUA1XSIxhkwG53cIr97EnqmJjlbueaLKJeONpcs9HBzPIHl5
         xiIzqbPB4MfAOt+Lj8rOd6EzgeO/Y/Z/xsH/340dE3SiPmB6AwcKTYn/XvsZBThxgAfU
         J4KAbscr40V5Sy/FpOM9VFm2PW2qKXmuQcNjilyokY/hzu4esyg0GvbXMQcbsurHK4fB
         oDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JX6/o5yfqnHgOPtqugiQ71FAvhLFEegVK6tidsyjLSg=;
        b=n8kFNtl0sf2dg2ovj8dpVPTFWrxjFCwCO2XcbZQbZom5KUdTs48lurHjiOFNoHJOgT
         XOCNa3Y4FvbeXRZqZy4yUjjaL2/Gt/mDSIkQybDkDqyYZ/XYTYFKAfO9cQc71qkVZg7w
         UIWkBQ6iZ2bJAufC7sGl+Ai6djUyeAojdr6dwEDqvGLC1UG2/8iNabMdnqGUzNNi+5/g
         idLodrF0QbjSpBzYhLQFqrxvU+e5myTWaScgB4drkY5ZVVhT5HWfnSm293mYvWH8uzk/
         +haglJCx/6ZjSZ0UiQONsXA1R1zbEFADpRY7eticRE3Nd2WAoeKzyGNnyOtep2VDXBw9
         pzqw==
X-Gm-Message-State: AOAM533a/vHRi4lUHKbed9gRmdlCkm2LTgaIlgIOdoa8qcfwv3ZGyZO1
	0MVsOgqsPnl3Glz5emUd08ZKwiHu
X-Google-Smtp-Source: ABdhPJxW2IWhYzrfd4TCD2JNaPS8knkSx1x4RBH1LypfISbU79fNrG+22M0ORfKUCyEqTE8XVkpn1w==
X-Received: by 2002:a2e:3c0f:: with SMTP id j15mr3788353lja.443.1592385314610;
        Wed, 17 Jun 2020 02:15:14 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id n9sm4860199ljc.69.2020.06.17.02.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 02:15:13 -0700 (PDT)
Subject: Re: grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools?
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>,
 "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20190413144853.3765-1-jacob.kroon@gmail.com>
 <CACMJ4GaTed_mZsxhP2A_60AN1pmg-OfJDk=Zf-hTqZoC4YorjQ@mail.gmail.com>
 <7f904c18-4aa0-a671-557b-bc9136ed3a94@gmail.com>
Message-ID: <6cbda490-30ea-aab9-7657-b1fe809324dd@gmail.com>
Date: Wed, 17 Jun 2020 11:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7f904c18-4aa0-a671-557b-bc9136ed3a94@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/17/20 8:07 AM, Jacob Kroon wrote:
> On 6/17/20 4:28 AM, Christopher Clark wrote:
>> was: Re: [OE-core] [PATCH] grub-efi-native: Install grub-editenv
>>
>> On Sat, Apr 13, 2019 at 7:49 AM Jacob Kroon <jacob.kroon@gmail.com> 
>> wrote:
>>>
>>> Having a native version of grub-editenv around can be useful for
>>> setting the targets grub environment.
>>
>> Would it be acceptable to replace the tools being packaged in
>> grub-efi-native with a RDEPENDS from grub-efi-native to grub-native,
>> and so use the grub-mkimage and grub-editenv tools from the grub
>> recipe instead?
>>
>> The problem I'm encountering with the current dual packaging of
>> grub-mkimage and grub-editenv tools, in both grub and grub-efi
>> recipes, is that it prevents grub-native and grub-efi-native from
>> being installed concurrently, and breaks my image build:
>>
>> ERROR: xen-image-minimal-1.0-r0 do_image_wic: The file
>> /usr/bin/grub-mkimage is installed by both grub-efi-native and
>> grub-native, aborting
>>
>> There's a wic script here:
>> openembedded-core/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
>> that may also be affected since it creates a boot partition with both
>> legacy and EFI content.
>>
>> The patch below resolves the error that I encountered. Does this 
>> change look OK?
>>
>> Christopher
>>
>>
>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb
>> b/meta/recipes-bsp/grub/grub-efi_2.04.bb
>> index b9d6225d27..5dd3398540 100644
>> --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
>> @@ -6,6 +6,7 @@ GRUBPLATFORM = "efi"
>>
>>   DEPENDS_append_class-target = " grub-efi-native"
>>   RDEPENDS_${PN}_class-target = "grub-common virtual/grub-bootconf"
>> +RDEPENDS_${PN}_class-native = "grub-native"
>>
>>   SRC_URI += " \
>>              file://cfg \
>> @@ -61,9 +62,7 @@ do_install_append_class-target() {
>>   }
>>
>>   do_install_class-native() {
>> -       install -d ${D}${bindir}
>> -       install -m 755 grub-mkimage ${D}${bindir}
>> -       install -m 755 grub-editenv ${D}${bindir}
>> +        :
>>   }
>>
>>   do_install_class-target() {
>>
> 
> This change looks good to me. I added 'grub-editenv' before realizing 
> that the tools were duplicated in 'grub', and I believe they are 
> interchangeable.
> 

.. but this make grub-efi-native's sysroot empty in my build. Which then 
begs the question whether a native version of grub-efi is necessary at all ?

Jacob
