Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.2368.1592595316307029593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 12:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gJHsQBbK;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id dp18so11337188ejc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 12:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ia70SGMuRE/OLQgmJDbBoYw/fBAVZSEraucUyHtFFpE=;
        b=gJHsQBbKSFsgn4ekC5JSBAAvpa4nHTc0kIzfdVtq+rKzt7wgiGcNBcWB4HKng7tVma
         Z0xHlza9HcrRlwDKiQz76CN1XDWbRZlMjE9wCwknDU7xtfaea+Og4wacxUOuvyMZmZJ0
         dKKgfRGKvRzmx5N3xKe+t7NAvCgHI1+QLoSoTQS/kPsOTUDLVBmE7UHpL9I0NnFjV2Xk
         FP6QeGhOACz32GMdVUIGSuYAcabIx9OaMd1U85jbRiR3barFEDqPlqFdATJf8LQK2S2n
         +gnGfwFU6OGx9mYbKoR7uHx5dVJ4vqElY+cB3gytt+jb1OCe8yLleKfT7ueOb8CtsWBz
         DJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ia70SGMuRE/OLQgmJDbBoYw/fBAVZSEraucUyHtFFpE=;
        b=s6xR22GCZiwo0o/XsUYZz+VLkQ1cvqHwNEB4V4UGpDs6lPxFrflHbtmG3NeLAGA8Gs
         hLYFccdAk1Us+H+Uvp8w0f5yCAzl9jO8NWymEzcAQAK9SzIWauSqyfs6fiMun/l9FfxI
         Yq4y6JIg25wZygEvT4w0y1T645Fzqa/pOgnrk5KRicAuo2kY1dxu64BST/JP/iSeUKYV
         ZKHGe51iLWezAiwHRfJCIpUtCEgzQKnvaGTZxtpm8ydv6JPgRpcAWPYtvcaGaim6aTvu
         279ecfv/zLm6pz1O4R63Z3gXKSXSIK2GWA5ahhN/A9symy8d2DmiYCBYvt6qDWzUuRbX
         u2cA==
X-Gm-Message-State: AOAM531Zl6IUQ9IBaRc78/nqXwuax9+LVUtqIgXbhlFOLJCatq1x7M2r
	9HFmDMi/dXpR4Kn67P6tIho58KcE
X-Google-Smtp-Source: ABdhPJzV6hC9YuDZ7PoG+5nv8tmPWxlMAQbsR2Ycee7QsboSsRTsXFdrxkmI9o5bHxMZ39OWdls47Q==
X-Received: by 2002:a17:906:9381:: with SMTP id l1mr5213389ejx.380.1592595314444;
        Fri, 19 Jun 2020 12:35:14 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id lo20sm146794ejb.62.2020.06.19.12.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 12:35:13 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20200617230710.9163-1-christopher.w.clark@gmail.com>
 <afb6222235af73893eb979a1f486108e902d4eaf.camel@linuxfoundation.org>
 <a2dcab79-dd9f-168a-c391-07897ad1b556@gmail.com>
 <CACMJ4GZGKQGGoZ=qA1SRvMuesRNDTkOVs4rcm_8xrU=Eur78nA@mail.gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <ca209cf1-0c89-634f-ff18-e1049e57034e@gmail.com>
Date: Fri, 19 Jun 2020 21:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CACMJ4GZGKQGGoZ=qA1SRvMuesRNDTkOVs4rcm_8xrU=Eur78nA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/18/20 11:58 PM, Christopher Clark wrote:
> On Thu, Jun 18, 2020 at 1:27 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>>
>> On 6/18/20 1:12 AM, Richard Purdie wrote:
>>> On Wed, 2020-06-17 at 16:07 -0700, Christopher Clark wrote:
>>>> Both grub-native and grub-efi-native included packaging for the
>>>> grub-mkimage and grub-editenv tools, which prevented concurrent
>>>> installation of both the grub-native and grub-efi-native packages.
>>>> This caused errors on image generation with wic when populating
>>>> partitions with both legacy and efi boot support, so resolve this by
>>>> removing the duplicated tools from grub-efi-native and add a
>>>> runtime dependency from it to grub-native.> >>
>>>
>>> I think we want to PROVIDES_append_class-native = " grub-efi-native" in
>>> grub and then drop the BBCLASSEXTEND from grub-efi?
>>
>> Just for the record, I tested building grub-native (x86-64) both with
>> platform "pc" and "efi", and in the same build directory, and all tools
>> in ${bindir} were binary identical. Asking in #grub on freenode also
>> confirmed this, apparently Debian packaging also assumes this.
>>
>> So no grub-efi-native required, and we can remove that
>> _class_target/_class_native special handling as well.
> 
> I'm not as confident as I was about the results of the binary
> comparison that I did, since objdump definitely wasn't showing the
> strings differences that were clearly present between those binaries.
> I think that proposing this change was a mistake since there could
> well be other layers that depend on core having separate packages with
> behaviour specific to those that is needed. Sorry for the noise.
> 

I dug some more into this. That GRUB_PKGLIBDIR define which references 
the recipe specific install sysroot is actually unused and could be 
removed. But there are 3 other values that contain the install sysroot 
being encoding in the binaries:

GRUB_DATADIR = 
$TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/share

GRUB_LIBDIR = 
$TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/lib

GRUB_SYSCONFDIR = 
$TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/etc

But all three values refer to directories that are not expected to 
exists at the time they are executed, right ? At least not for me using 
rm_work.bbclass. Where grub-mkimage is used in the efi recipe, -d is 
passed to override the libdir.

So I'd still vote for removing grub-efi-native.

Jacob
