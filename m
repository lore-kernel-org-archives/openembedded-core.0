Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.485.1624914641657422001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 14:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qt+zzREH;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id 21so15305140pfp.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 14:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jxIkfiJI3/BiyRM9BBCClbnKahAEkTv1sXXqCHCJnZI=;
        b=qt+zzREH6VY0VI3iqqdoTuvCzhMSq6+Xvh6BY+u+9Pkcyhr6+LItCteIRXxxgs/oqZ
         k4nAJDFymVqRd+/EhjeMw7hxtixGpXSTQDsd82Oc23MpG8Py7er5T3M0yl+qs4Ups46K
         vl84OaIScScOYdGypwCtbUqCQG901fWu1bQ9JjQv45kgeFXNq4xbbDYdqatqt++/c8xw
         ugfs1hr4a6U0Oz/R25aBNWFwaQ1c8kpcAMxhQb/IGbm8etB63xCy9EUayyeH6H+fOTWp
         YCSm6AcYxPukeYiSapxGQLpb0+6WhCKe+PYxvE3LUV/qsh01q0LuzPSeCOtW+9CIH0BC
         DLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jxIkfiJI3/BiyRM9BBCClbnKahAEkTv1sXXqCHCJnZI=;
        b=VIw0Nl9wTSWRXtBlG7Jo/FLM3wgVdxzTNpVu+wC7vdn+CSeUPsbXywPXDk1ZIf/tXo
         d1VitL+Hi6LgB3BX5/2t6/CLUm2LktmEpuopMq0lln7rkYZIyROoFX6L9R9pGaoEciob
         7z4H2PW8BdbdalGU8G4ZsFIxDHbBa3QwPUYutOvU5YQVGOPFhHAsVfdooR1/jhQt0+sU
         nPIVkjgeGGYLV9ZSlkBR3lUKYofDHVEpWPsf47ZrlvLh5HFm04/mMYPcxazD/3ZFtYsv
         9NZlXauAI0e+od27M/l7wCvIlF2qKy6ECiKN1ltrIXVfskuDg+yjNVIsFrvANq3p+zjz
         9Xdw==
X-Gm-Message-State: AOAM532Tl70WCR2Np+SV3nfM0efUIYVbtr+t9GJpFZ7Mpzt6/+sFEBzE
	cQButYrB1edThRjpCp8pF5qo9Ak3HS5Z/Q==
X-Google-Smtp-Source: ABdhPJxgNwL8AeyUc2b45RkNFOw7UzB+0/cl6u6Wf+1B1JFe5uuV/luFVwj8AImMC/EHHy5Ky8hOHA==
X-Received: by 2002:a62:794c:0:b029:30b:6792:3a45 with SMTP id u73-20020a62794c0000b029030b67923a45mr10348179pfc.46.1624914640927;
        Mon, 28 Jun 2021 14:10:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:7ccb:5507:b206:6695? ([2601:646:9200:a0f0:7ccb:5507:b206:6695])
        by smtp.gmail.com with ESMTPSA id b1sm15271447pgb.91.2021.06.28.14.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 14:10:40 -0700 (PDT)
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Phil Blundell <pb@pbcl.net>
Cc: Andrea Adami <andrea.adami@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com>
 <CAAQYJAsGX9ExxsmoGUY8wO_Bp_JscSoRJ-pBiNJ4oBf5eBf5CQ@mail.gmail.com>
 <6e2bcb94-8b02-50c1-bf5b-8fc3ce464d91@gmail.com>
 <20210628191055.GF5525@pbcl.net>
 <CAMKF1sr1mXehpm31m_ByS8ytGmQ--Zf42qst+SqPQK1w53f_Sw@mail.gmail.com>
 <20210628195238.GG5525@pbcl.net>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f66a6a00-1a98-f8dd-e5d0-2c445147d5a7@gmail.com>
Date: Mon, 28 Jun 2021 14:10:39 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628195238.GG5525@pbcl.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/28/21 12:52 PM, Phil Blundell wrote:
> On Mon, Jun 28, 2021 at 12:42:55PM -0700, Khem Raj wrote:
>> On Mon, Jun 28, 2021 at 12:10 PM Phil Blundell <pb@pbcl.net> wrote:
>>>
>>> On Mon, Jun 28, 2021 at 11:46:08AM -0700, Khem Raj wrote:
>>>> I still hope that if we can add a proper neon detection patch to meson
>>>> they would be ok to accept it.
>>>
>>> Why doesn't the runtime detection work in the way that upstream clearly
>>> think it ought to?
>>
>> probably it does, someone has to test it on device without vfp.
>> Currently it is still failing to compile.
>> so first that needs to be fixed.
> 
> Okay, but if the runtime detection does in fact work then there's no need
> for any NEON detection in Meson, right?

well, if we can beat the compiler to not complain about using neon on a 
non-neon system then yes, but changing float ABI to make compiler happy 
seems a bit iffy, since compiler will generate code expecting VFP and 
that could trip the system.

> 
> p.
> 
