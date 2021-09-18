Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.32.1631978814958265428
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Sep 2021 08:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iFtDN1+z;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so11445904pjb.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Sep 2021 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TCECgQ+suc3hf2e4n4SI6GLjRoZgAB8eXCZi9ObqH+A=;
        b=iFtDN1+zqF377AzwOOKT0fgOOad8o0zIQEfh7DyqNdBM+0Dc7JDLlDZMrmT1ZqLSIL
         qiAYah+Y2bKVvxbPvSKgDO8ZZtb1HTtP75ckLxZYiFWddJ/tZVTV+J5E58119SxmSpw/
         WvURNDjjIITaRfdSM0EgfLPDRMWx9yTYAh/mDKLpohnuL9Vb0wHoBp8LuRihtu+qxxqZ
         ytJthORLTKTiOUzxGC0fk3oEmPk+yIraE3OALvEUqHZ2UQletH19rLyXHX2HsMa5jHDU
         TJOXr2Xg/ladIhO2uWTYyKcrBpowNafFy/+vyK8fP5N/bFaXqYe76oFUZau8W3MMeXMq
         L68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TCECgQ+suc3hf2e4n4SI6GLjRoZgAB8eXCZi9ObqH+A=;
        b=h9R2QJGP7AGfAj42xR7mYnNWoq8lSmSQla1mLZKBA3C+u1p132X5yAll4gzuWM2igi
         HYEI5+EMXG8m+PbouqynaA4+TBPv4JDdaQjKUy25QPc8kGUqm5SqHwXSHCH2K6qXWR/i
         YJcEImH2pD2BxVC5P4rHdsQSnaV4ASR3q6tCKEjOb0xSOTqgfEg6DLdDpkHdN/oLY+HH
         4Fr1OwICMQavTdvwsgdioBHbLisw/nb5yjc4NPknTavcSWXxPRN84110XFUhPEffuFFA
         OmH/hd428xTyWS+4igO9ncLh4yiSiP9EahAWhEMGStQSdI4qoy78sYUMkZdWxo0EbpFi
         LkUQ==
X-Gm-Message-State: AOAM531GDzNUJhZnOnG3vAHOQ+80jMvT53pD2Fyj3+j4opmpYmK1M8li
	Ke4LsmkdvRMxl74bZkErw8jJrTiYu1k=
X-Google-Smtp-Source: ABdhPJzmW+W2x/WBVBe5omM3r5GZgl8z6RtxNvyoBGLx9Vbba2zH/kLiE2FS6ahqt113lyCWdgnLUA==
X-Received: by 2002:a17:90a:29a4:: with SMTP id h33mr18991606pjd.88.1631978814040;
        Sat, 18 Sep 2021 08:26:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2b6e:6174:9286:e61b? ([2601:202:4180:a5c0:2b6e:6174:9286:e61b])
        by smtp.gmail.com with ESMTPSA id z14sm9731552pfr.154.2021.09.18.08.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 08:26:53 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] systemd: Add tpm2 PACKAGECONFIG
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, kristian@klausen.dk
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 openembedded-core@lists.openembedded.org
References: <20210915102308.1892-1-kristian@klausen.dk>
 <20210915104818.43wown7ss2pcfnky@fedora> <YUHZe8zK2lV0lWPy@bob>
 <YUS4fOY2J2hoAsxx@piout.net>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <16d0b449-7019-8886-7f7d-8fdc91123a92@gmail.com>
Date: Sat, 18 Sep 2021 08:26:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUS4fOY2J2hoAsxx@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/17/21 8:47 AM, Alexandre Belloni wrote:
> On 15/09/2021 13:31:07+0200, Kristian Klausen via lists.openembedded.org wrote:
>> Den Wed, Sep 15, 2021 at 12:48:18 +0200 skrev Quentin Schulz:
>>> Hi Kristian,
>>>
>>> On Wed, Sep 15, 2021 at 12:23:08PM +0200, Kristian Klausen via lists.openembedded.org wrote:
>>>> The TPM2 support is used, among other things, for unlocking encrypted
>>>> volumes.
>>>>
>>>> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
>>>> ---
>>>>  meta/recipes-core/systemd/systemd_249.3.bb | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-core/systemd/systemd_249.3.bb
>>>> index c027b88fd6..f8c85dabf0 100644
>>>> --- a/meta/recipes-core/systemd/systemd_249.3.bb
>>>> +++ b/meta/recipes-core/systemd/systemd_249.3.bb
>>>> @@ -128,6 +128,7 @@ PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
>>>>  PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
>>>>  PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
>>>>  PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
>>>> +PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss,tpm2-tss libtss2 libtss2-tcti-device"
>>> Shouldn't the RDEPENDS part of the PACKAGECONFIG be pulled in
>>> automatically by Bitbake since I assume the libs they contained are used
>>> by the linker for systemd?
>>>
>>> Also looking at the tpm2-tss recipe, I'm not sure there's a package
>>> named libtss2-tcti-device?
>> Are we looking at the same recipe? It is defined in 
>> tpm2-tss_3.0.3.bb[1].
>>
>> [1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-security/tree/meta-tpm/recipes-tpm2/tpm2-tss/tpm2-tss_3.0.3.bb?id=e0fca90835169e21ffabe6f2e4b901678236d36e#n37
>>
> Then, shouldn't that be a bbappend in meta-security? Else, you run the
> risk of pulling a dependency for a recipe in a layer you don't have.


Well, this may help avoid the need for a bbappend, add this to the
systemd recipe:

PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'tpm2', d)}

or

PACKAGECONFIG += "${@bb.utils.contains_any('DISTRO_FEATURES', 'tpm
tpm2', 'tpm2', d)}"

Since tpm and tpm2 are required to enable things in meta-security.

- armin
>
>>> I would assume that
>>>
>>> PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss"
>>>
>>> would be enough except if there's dynamic loading of libraries or
>>> binaries from tpm2-tss that are required at runtime?
>> I my testing it didn't work, presumably due to systemd not linking with 
>> libtss2*.so but loading them with dlopen()[2].
>>
>> libtss2 is also using dlopen() for loading the TCTI implementation 
>> (libtss2-tcti-device in this case)[3].
>>
>> [2] https://github.com/systemd/systemd/blob/aff870ef61bda152ea6241f684dcab26a9265e78/src/shared/tpm2-util.c#L46-L81
>> [3] https://github.com/tpm2-software/tpm2-tss/blob/9288970a3e657cdee85d08d3813199ec864de3ad/src/tss2-tcti/tctildr-dl.c#L79-L125
>>
>> Cheers,
>> Kristian
>>
>>> Cheers,
>>> Quentin
>>
>>
>
>
> 
>

