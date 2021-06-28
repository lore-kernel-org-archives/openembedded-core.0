Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.15693.1624905971170029365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 11:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eXc7vyOh;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id c5so14930271pfv.8
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DZMiXjgqwikmxF8U4KxiuCfcvPasA/grg3CCCnM5kYg=;
        b=eXc7vyOhHxmhx9hPfSipzRSecxHGJ/n0bnBN/F2tu/5PIMFhbUUhxGA5KlpaO9Ovn3
         +glor1JrnkGi+SqyZPHcFFFf9U9UfwfdrpQqhuwHThN6XU8iFZnMPLMjy6cawdimx+2u
         94ZoWhlbbfle3abZiMNtZkBkh79nw1XdMZU+I3aU57w1qCfudIVUV7HbO7PAlHz3CthG
         bJnkD186DofUJ+N+yH0ILkz7uR9pAR1b0NAh9pu3+SNfvuETHWT0U7I0ZcEbS0vnysS1
         nkDE34vIb2NIBIl+g8EsSEYpNzEJPOwIoRMw5pmQue2PhjvNgvSu4ApRaMWW1tVdS1hS
         AvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DZMiXjgqwikmxF8U4KxiuCfcvPasA/grg3CCCnM5kYg=;
        b=rrr3T/IXY9UFVDb1N4j4Br+sMhpsYJewKGg934TTyK5H6of7mW/uYW4/PVsr7D/X4e
         phPxBzY4owtCx6XN2Dc/x2vN8Ip4euiCl2V+iKWJKExI4y162t0q/iKhS63X7KpgZ5pz
         52REGRmb3TZt+ZvCiKaglI+VugCrlV2iMiAQlYUgBB3KOI48C+lmcS864+Std0Ry0gkm
         ClTtz02HishsMcLbyLrUf/JcYDsAUfulXsfJsK4uBTaqKe7ZJIHU5rXS98GSZg0PCuh8
         bQ9XltW/9RX/ElRi3sFFTfohDaqrCeBvSTmppwF65X9u/K/FocG49VN8DLXMvh6gy094
         +U+Q==
X-Gm-Message-State: AOAM531qHnK2QbApalJr+kwgCPaDbPTVKMfSuJyqPsLiwXKEPN9/M4xr
	589ONpuuhy0zLkKo/iFA2xB8TxiBLmRZAw==
X-Google-Smtp-Source: ABdhPJx+9Re1aHo8SYBoJXcjBKMsmmJgh2JB0gWNDXZD4z0ZhNG35iOE9eW3kDZf3xR3ZZO38R1cRQ==
X-Received: by 2002:aa7:828f:0:b029:200:6e27:8c8f with SMTP id s15-20020aa7828f0000b02902006e278c8fmr26052927pfm.44.1624905970430;
        Mon, 28 Jun 2021 11:46:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:7ccb:5507:b206:6695? ([2601:646:9200:a0f0:7ccb:5507:b206:6695])
        by smtp.gmail.com with ESMTPSA id x13sm15846808pjh.30.2021.06.28.11.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 11:46:10 -0700 (PDT)
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com>
 <CAAQYJAsGX9ExxsmoGUY8wO_Bp_JscSoRJ-pBiNJ4oBf5eBf5CQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6e2bcb94-8b02-50c1-bf5b-8fc3ce464d91@gmail.com>
Date: Mon, 28 Jun 2021 11:46:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAAQYJAsGX9ExxsmoGUY8wO_Bp_JscSoRJ-pBiNJ4oBf5eBf5CQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/28/21 11:20 AM, Andrea Adami wrote:
> On Mon, Jun 28, 2021 at 7:55 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Hi Andrea
>>
>> On 6/28/21 3:01 AM, Andrea Adami wrote:
>>> Hello,
>>>
>>> during a core-image-sato build for armv4 I got one single build
>>> failure with pulseaudio.
>>>
>>> This happens after commit 80bbea0 pulseaudio: switch build system from
>>> Autotools to Meson. In the commit text it is evidenced:
>>>
>>> "
>>> With Meson there's no option for disabling Neon optimizations if the
>>> compiler supports Neon. If -mfpu is set in CC or CFLAGS, it's ignored,
>>> because the build system adds -mfpu=neon at the end of the compiler
>>> command line, overriding any earlier -mfpu options. This shouldn't be
>>> a problem, because PulseAudio detects at runtime whether the CPU
>>> supports Neon instructions.
>>> "
>>>
>>> At the moment to build pulseaudio for armv4/5 I have reverted to using
>>> autotools.
>>>
>>>
>>> There was around a patch but has not been merged.
>>> https://lists.openembedded.org/g/openembedded-core/message/146375
>>>
>>
>> this patch is not right. It might let us compile but it will still emit
>> code that will expect VFP at runtime and hence fail to run.
>>
>>> Maybe a v2 will be accepted?
>>
>> right fix would be to add a proper neon support check in pulseaudio
>> meson'ary, and if PA has dropped the ball on non VFP ARM then it will be
>> hard to convince upstream to accept it but atleast you can try.
>>
> 
> Thank you for the review.
> I knew the patch was not right, I tried other workarounds and I
> failed. That's why the RFC was sent.
> 
> With my very limited knowledge about the matter it would be impossible
> for me to argue with L.P. upstream.
> My personal opinion is that the switch to meson was done too early, at
> least 14.x could have used autotools and less meson patches.
> 
> But if upstream deliberately breaks compatibility there isn't much we
> can do, maybe overpatching. sigh...
> 

I still hope that if we can add a proper neon detection patch to meson
they would be ok to accept it.


> Cheers
> A.A.
>>>
>>> Cheers
>>> A.A.
>>>
>>>
>>>
>>> 
>>>
