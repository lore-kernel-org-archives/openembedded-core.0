Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.8036.1617969975755490451
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 05:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=niRVd6I3;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id i9so2277589qvo.3
        for <Openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tDy6fyk/P2qwuXua99l8IqMkRKIYDXr5wQBpQg8nKgc=;
        b=niRVd6I39TV43ojOjtqc1EvyY5UgMB6kGsV6XrirovkgoFX7+/nt0GD7CZxfAh+ABR
         TmAOEm8f0ScbpPkQ/3Y9SxBPQENBJOjeN6wtfRT4umID8R/D3ihv55tnwmr500yxTcp+
         dv5tGJvtKIyxN/uDsPhBuw6YgKAg9Nux9pBbFWr2ySHglcrbkiVHTFlpnA2FRtfBbAk3
         tzmX/HiIV/rZEXycUw2kLluWv2avSj6XaF9lL2FKN/kHiLrqEPR+beK2fPUnlYgIjeCY
         P75TovItEY1mhPsn41cgV0L/AVjahJY/Eau8cVaL7FqtzWhTxfnnfbPSlK1ryF/yaQig
         ocfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tDy6fyk/P2qwuXua99l8IqMkRKIYDXr5wQBpQg8nKgc=;
        b=H5U66L6qwgFRR3v1YmQHdgw1jgV8leY2x5kbUlld5fq68IysH1ArS0Vac/G0HLTjsQ
         vgKHQReY5dzW/a0inxTy86I3wBu1Lzm26F/iVwUNiROuwVlAnO6SzrA/WFiSd2mJvcdZ
         D8We7tKmMlzPqcBZ5e53PjG6MjpTUTNCvIHFsfI1XFs74Lun4LuRoXx0zyf0qBA2SwtX
         d1u9sO0eiM+yRMuyyQYfry9lDkc8yBA9wDGIagN1RK3XhRSsG68U7oV2PaJjemtXhWW3
         HMAR8+NZ+UHd9ICCW0qtKr4xcAQkFaEZP9FfyK13ogUqocAxxTBtA/j/p8rO1yVQyRZP
         BRcA==
X-Gm-Message-State: AOAM531Mz64mqEeDwNeD9ZXVusORYcKo7G6aUWlRa4hkOn6f9yZRc90b
	NgDgarqQf+HrSB+yy4hmS4j3s8SpLNnYPedS3oU=
X-Google-Smtp-Source: ABdhPJxodfI7klGlgcMysQP+6FHEuiEa2yWNVIbbFqFW97b3dSGJHKToTWWA8hnyNwnSTpRnWh49QaX81TwCPtisJYk=
X-Received: by 2002:a0c:8421:: with SMTP id l30mr1201654qva.23.1617969974153;
 Fri, 09 Apr 2021 05:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcXbx5=c4GYhLC9U-4eytjoEDogJNsoMwA4wCn1d6AGZAQ@mail.gmail.com>
 <CANNYZj_8Fm0TmSD-8EU2Gu9UkRYwT6AdgWGhOuuNDtXXFM1dRQ@mail.gmail.com>
In-Reply-To: <CANNYZj_8Fm0TmSD-8EU2Gu9UkRYwT6AdgWGhOuuNDtXXFM1dRQ@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Fri, 9 Apr 2021 17:36:02 +0530
Message-ID: <CANUMPcXm+5n=ocb3GYvvv7fMMHaytp8ODOoRZcC7vjxAcHpkfA@mail.gmail.com>
Subject: Re: [OE-core] RUST test integration with oe-selftest.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Randy MacLeod <rwmacleod@gmail.com>, umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

>>Can you send the patch separately using 'git send-email' please?
Sent patch through "git send-email" as you requested. Please find the
same at below path,
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg147464.html

Regards,
Vinay

On Thu, Apr 8, 2021 at 1:28 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Can you send the patch separately using 'git send-email' please? Otherwise, it's very difficult to review, as it's impossible to write inline comments to attachments.
>
> Alex
>
> On Thu, 8 Apr 2021 at 09:22, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Hi,
>>
>> Please find the attached patch (rust-oe_selftest.patch) of rust cross
>> testing through oe-selftest method for review.
>> We have tested for x86, x86_64, mips, mips64, arm, arm64 and powerpc.
>> Also, attached  test summary (test_result_summary.txt) of each target.
>>
>> #command to trigger rust testing:
>> $oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
>>
>> Note:
>>     1. In the case of x86_64 target we were seeing build error as
>> below, since the target and build section in config.toml are
>> identical.
>>         `error: failed to run custom build command for `memchr v2.3.3`
>>  (When manually entered in config.toml)
>>
>>         Also, through poky "Exception:
>> configparser.DuplicateSectionError: Section
>> 'target.x86_64-unknown-linux-gnu' already exists
>>         config.tome
>>
>>         So, we have used "x86-poky-linux" as a target in case of
>> x86_64. To consider this in the rust test we are setting the path  of
>> "RUST_TARGET_PATH" to
>>         "${STAGING_LIBDIR_NATIVE}/rustlib".
>>
>>     2. In the case of mips64 target, we made changes in
>> "rust-common.bbclass" to generate a rust equivalent target
>> "mips64-unknown-linux-gnuabi64" .
>>
>> Regards,
>> Vinay
>>
>> 
>>
