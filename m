Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.1003.1615245964890357226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 15:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eGySPX/V;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id c16so5645805ply.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 15:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GjyzSJnXLW3nQZ+6wvtuoLwe3iDMtsANj7zL1QnJ5qg=;
        b=eGySPX/VyQuz91XQ5rMt6M/xsEwHdsuzYlTn6uMyHkB2UdiOwRCbaXR+pF3JZvOIdl
         w5RsUZngBF/SAyiKem4URWdHw1mNaoQGgha0SE7QVFXHfvzdouQf9K0OeRef9mju7NSz
         8ZPYYkJ0ggy8pKYeZJVGNtsIUi+9BDtDRXSYNUnSjrV0drPnl5wmgWTR5eA0bMvXTHid
         iNxFcROCQjojBWnbYMKWx8blux6YL3wMcKANfxr41wM8tenZYnG1khbB+IpxdxdtBiJw
         e/coj8PjYTHCn/z5znnRQ00hZAZEvvqMqGBn0IYkqFfapF58+aMb3wUMt/wusd04Bbbx
         gZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GjyzSJnXLW3nQZ+6wvtuoLwe3iDMtsANj7zL1QnJ5qg=;
        b=T30p4s46r+QDQtDXWb4mhcrszA0Xhjh8Q7Do5XJEjcV3MINUyQIDXN1he8+mearRnI
         o7VVkVdV75wicQSAyVCqVrTk/PpuTGxHZCarp8hDOOGDPSQc3S/4eROqIgwQx8CKmECv
         ssdVMzUDeslXi7NNoUtCzCO06KXU+mgrRFohWetAkpfYc066BXn0itcqFiOFMqHxtx5h
         YYjxOFiMwct11yO8w5DAD7ccod322/eBcy+KAoOU/X6UzGWZdQUbPRWmlx7MmVhGGI8J
         T4tNJ+4TwJEmgvC1RKLMLHn7iAeLBxu+nXzMY8W49YhhSzAUkFpiKvz7q2xjb5DKPcX6
         4BSQ==
X-Gm-Message-State: AOAM530tDN1QuQ8kFL6qpPRZ72Vx5CcMx7i+nEoM0fXH4SUVjZqLEG9y
	q7MyEx5+KtNpNggzEOvQ0f4=
X-Google-Smtp-Source: ABdhPJxa9F8Q6GeDZdpULIiK874WN8LsN83q1Zsg9URRz0RjTBDDgjhmlznod4gsMyssey85IKwo1A==
X-Received: by 2002:a17:902:cb0b:b029:e5:b670:d905 with SMTP id c11-20020a170902cb0bb02900e5b670d905mr23747297ply.18.1615245964103;
        Mon, 08 Mar 2021 15:26:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:e039:b4fe:1680:1244? ([2601:646:9200:a0f0:e039:b4fe:1680:1244])
        by smtp.gmail.com with ESMTPSA id mp19sm339369pjb.2.2021.03.08.15.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 15:26:03 -0800 (PST)
Subject: Re: [OE-core] [PATCH] resolvconf: add missing dependencies to RDEPENDS
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
References: <20210308193028.34418-1-raj.khem@gmail.com>
 <CAJ86T=WW59ZDOpvgEQXRCqwnJKCKpmVsUeFVPk8kUC5m8zCz=g@mail.gmail.com>
 <2a597a00-fbc0-470e-0f43-1d710c74aeaa@gmail.com>
 <CAJ86T=UbEJ730gFbj=WtrGUO2=6+bbgHpuxcuSChV6uGxve3-Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <71abca0e-fcf6-ecc3-ed79-d2269364884b@gmail.com>
Date: Mon, 8 Mar 2021 15:26:02 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UbEJ730gFbj=WtrGUO2=6+bbgHpuxcuSChV6uGxve3-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/8/21 2:25 PM, Andre McCurdy wrote:
> On Mon, Mar 8, 2021 at 2:15 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On 3/8/21 2:11 PM, Andre McCurdy wrote:
>>> On Mon, Mar 8, 2021 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> From: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
>>>>
>>>> resolvconf uses flock and readlink.
>>>> So explicitly added dependencies on util-linux (for flock) and coreutils
>>>> (for readlink).
>>>> Note that the options used with flock and readlink are not part of the
>>>> busybox implementations so full-fledged implementations are needed.
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>    meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
>>>> index 6df96b699c..6da8cd6023 100644
>>>> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
>>>> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
>>>> @@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
>>>>    LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
>>>>    AUTHOR = "Thomas Hood"
>>>>    HOMEPAGE = "http://packages.debian.org/resolvconf"
>>>> -RDEPENDS_${PN} = "bash"
>>>> +RDEPENDS_${PN} = "bash coreutils util-linux"
>>>
>>> util-linux-flock has its own package.
>>
>> yeah and busybox also provides flock too. Lets drop it
> 
> Busybox provides flock, but it doesn't support the -w option (wait
> with timeout). Either the util-linux flock is required or resolvconf
> needs to be patched to drop the -w option.
> 

right, its to explore possibilities to avoid the deps.

>>> Patching resolvconf to use readlink -f (instead of readlink -m) should
>>> be sufficient to allow it to work with busybox readlink.
>>>
>>>>    SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
>>>>               file://fix-path-for-busybox.patch \
>>>> --
>>>> 2.30.1
>>>>
>>>>
>>>> 
>>>>
