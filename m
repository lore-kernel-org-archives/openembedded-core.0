Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.15103.1620919485002708876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 08:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qOt5dDmz;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id m124so21684867pgm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PNdXid1pD/93MIDXJiIo5+FnvlumAnJutrz3gmNIEZ4=;
        b=qOt5dDmzTHamp2m6FIA7F2T/CW0FmDXgw7wJ//p11Fy/ZMYIS0FNvLA2bcgN3Flfwg
         Xvhyfy23gMqMvnQDi0gcHQHf6Xvru9nPupjGrc6HvNyEp1ezAc4EAeoK3W1pGfp9Xq82
         L6Z7F0b67kWblk9hgFyuLYv7entE3TiSThHGc5s0dFOdoEEsS4kqZdX4e1hr8fwUsKgA
         T+bC4Xs1f7asitRczTM0MDjhaQ7DjycRGd3+OEn6X9XGGc2qCn2IM2ek2cu3BHWy0CNi
         uKNxl+skdPNfRKHLHOmuDYzsEO54UKMwaWQIlngow0TzFY1MtqSwHXHMuHB63tMe3uZP
         1vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PNdXid1pD/93MIDXJiIo5+FnvlumAnJutrz3gmNIEZ4=;
        b=W8AER33xUqrUo7zpWRnN1ljyz6CGVFBhMIl+wVbLRpbWpSD0jAflL9KjvPdI1sFykb
         Vgdeb6zL9vgAmAaKAsctecsCD5sX/xAJCufDI7MievZTEhfCJ2fyUU5lzqaHUHSWHvw7
         ilaNm2QXcNWLF7quz441ZyJsXDBrMJ5AEWbvg51wAq8AcycILQV1rDzJ4vnwUPNozW1j
         7cmeOA6arYcjeJaEwjtr8nzMFuSw9rkVSzxzI0FJKVLD2/H/byFLNRj/AlthPUXpUPnF
         LLAeMjmf6vuuftfQHKdzvnbZrjBC0+RVrOkeNFHKblvi9hnlkPvyck3wnAoyXpRhGQpy
         Er4A==
X-Gm-Message-State: AOAM531Xp/R4ZB5eGS+8Lhh7zW1j4WjTm5mSvs36YTfsFH8XxhNK7IBw
	wPs0VTVhwIv6xlGDtt+hrWo=
X-Google-Smtp-Source: ABdhPJxaU85idh6MeKbbDSiiOZpfer475MD8KWf+yKyT7E06XTa8LbkIf1QT9oJCq7/MT8ip6Y8pdg==
X-Received: by 2002:a17:90b:1b0a:: with SMTP id nu10mr11978062pjb.70.1620919484380;
        Thu, 13 May 2021 08:24:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::623b? ([2601:646:9200:a0f0::623b])
        by smtp.gmail.com with ESMTPSA id a16sm2353185pfc.37.2021.05.13.08.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 08:24:44 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] libnotify: Make gtk+3 dependency optional
To: Alexander Kanavin <alex.kanavin@gmail.com>, yocto@mac.mcrowe.com
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Mike Crowe <mac@mcrowe.com>
References: <20210513143632.1211604-1-mac@mcrowe.com>
 <CANNYZj8E6Rem_gy-NieFXyBBmb=qBB9rcX1C9D01dhtymFm9pQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ca6fe9a4-422c-4032-baca-807fbdd3a73f@gmail.com>
Date: Thu, 13 May 2021 08:24:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj8E6Rem_gy-NieFXyBBmb=qBB9rcX1C9D01dhtymFm9pQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/13/21 7:43 AM, Alexander Kanavin wrote:
> On Thu, 13 May 2021 at 16:36, Mike Crowe via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <yocto=mac.mcrowe.com@lists.openembedded.org 
> <mailto:mac.mcrowe.com@lists.openembedded.org>> wrote:
> 
>     +PACKAGECONFIG[gtk+] = "--enable-tests,--disable-tests,,gtk+3"
> 
> 
> Was the --enable-tests scenario tested? Specifying gtk+3 after two ,,s 
> seems weird.

it is valid if tests need gtk+3 at runtime, but not during build time, 
in that case you only create rdep as above.

> 
> Alex
> 
> 
> 
> 
