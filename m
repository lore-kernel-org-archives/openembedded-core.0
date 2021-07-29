Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.11567.1627574483893053988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 09:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sZEtDXR1;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id h27so4244249qtu.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4J5It2ZwwU4LAigueWmB0Z/WA+njLpeO0owga2pATRA=;
        b=sZEtDXR1yWDfvmGqqlpzd7XskYjP4k1vR+BFwJNXY6dcwqQQiHMp3u57b52218Lah5
         XvXkGocS99ClqxsZl+gUDMMEOqhD/oqUhn1MOvaDNuUHdFE5sPUG8pvMM/t/NLlAOBJn
         GHAhRp70chnVMDtuhfgRyIZFOa77A/2wrNVFgs+L2WWIog8t+lBWTqpI+/DBLei64v0D
         yNgLsIgj400atDc+YllkMjhtsS+/BDvsXKAyxmXzzoqhaDA2uYeJibpTXI73uwVWCwsO
         jaowCbk2iR9MWukS2+9K4rj4XOO/ZyAdcqf2mi+jwvELQa1P/QhFsVKByZxNtedd7vds
         xiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4J5It2ZwwU4LAigueWmB0Z/WA+njLpeO0owga2pATRA=;
        b=VqJw1Mv7tFiqZg1/BUQhCoy9UdEiQ/Imc9D7WlwD/4g3tShW21zhAi6E9fVwxkeuX+
         UueIR3RL5offizK7aI5tnJENEz6qicihEl9a4fYt3G4Fm8eDfIE0h4LDaxgfTs9vmodc
         6lrNQH6AQwVrgSwmXX53VyZtaA121or57glxIPRxEXwEf232y4jDFBjyesY/Ozjt02vW
         CeUYFm6FRxNEG1XFobQHLOXLJAv0E54SBQSJzVo624scw4r5GQ89aNUVsWFiZ2byHN3k
         v35832dKKSg9LxgJG0gbZ6nuMlqRE9hYXWEiLarNb3PJN4Tq+Sc6NnWFsJohuL1xDdMj
         5muA==
X-Gm-Message-State: AOAM530PPZLWvUgoNxRwRbZlf11OTYPcJueIZyOaKCVusd0tTfWbTjjr
	mU7sz7F+/PnWi+WOaSrT7/a2bTec+wVXjlgENhw=
X-Google-Smtp-Source: ABdhPJwq8r3s5GcijpohdFA+pqkDbnNesYHFh3qeLstC9IKCH4khMu4opvCCspu1JuRKiwBX8yVGyFPXWCK6lTa+gE0=
X-Received: by 2002:a05:622a:194:: with SMTP id s20mr4855693qtw.82.1627574482960;
 Thu, 29 Jul 2021 09:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210727201325.2215487-1-raj.khem@gmail.com> <48ff0915-6b83-bf8f-5331-d399c8ae3d84@gmail.com>
In-Reply-To: <48ff0915-6b83-bf8f-5331-d399c8ae3d84@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 29 Jul 2021 09:00:56 -0700
Message-ID: <CAMKF1sreXdb-s131XDtiPq-0f2VajYwaQNASUNKkmuAxozLA+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Fix build on musl
To: Robert Berger <oecore.mailinglist@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Luca Boccassi <luca.boccassi@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 29, 2021 at 5:55 AM Robert Berger
<oecore.mailinglist@gmail.com> wrote:
>
> Hi,
>
> Does this mean we have musl and systemd working together?
>

yes it was always there

> Regards,
>
> Robert
>
> On 27/07/2021 23:13, Khem Raj wrote:
> > Latest upgrade to 249 broke a working build on musl, this is incremental
> > fix to exisiting patches adapted to 249 release
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> >
> > 
> >
>
