Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.6008.1631704096651998299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 04:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=1axN4fpp;
 spf=pass (domain: burtonini.com, ip: 209.85.128.52, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f52.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so3661883wmh.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 04:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LpEhiDkzyOCa/8/IBPniNWwqtqNpt+1tY55C+k/STDY=;
        b=1axN4fppjeD4pjSg6U/JWp13eqMTP03G3yFDWFdPoL5QPo/hdBZRSZ5NBMj9KOqbKI
         CPPS2SVeDFsCnYPFY1Uixd3d6RgIH7A9SsNy+D+T2z1caQLhp5bNI+2IIh8o6mlyYnl3
         T39F75uY+hPNlHkszABAFSBLOx2hgLf5K63TnO8zX28ggIbT1BIWMyPcfWamRgZah4Ue
         9z5imGaFpkqjFeICCRAi05Q0CGpv4mG3mHLZo1r2UHKTeRHYPQw4m2ptLafUstcCbJE7
         a9lfH7XCilmX6kiR+PGiiDlK4anRQAI9AiHk6nKwZb3rrFq1hzMyqC8gbXenyZrX8uVd
         yY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LpEhiDkzyOCa/8/IBPniNWwqtqNpt+1tY55C+k/STDY=;
        b=BvhDSEBy+ZLU4oL4NWZuXDs1dwwiN92VI1X8AtnqMsrx2cuoN6WmHPLbwgFuvXPB1o
         Rmw21iVA9aiXvHUu9hOaKGL0XmqOf/gx70kbgsTmOZMIuvrRpxxPihQXMoDgO8KrmsG/
         JkF1a1f0HLKkVZju60ddVuvflJ20slQeliGHF1Tn9ZOTLaKULzyb0ZYykYoA44n/XC/k
         oNpen17f89SixdqgNac1EjMQCE9gNHinH/oVGlxpbBh3MoaAYLNcpKH8itB1MN3x9xFN
         OWKQEaD0tQJSRlB41Rsnjx1436qjjcQ/nNQq1beqNOGEwIYBaouaG2gXf9mrc5ss7SEN
         9jsw==
X-Gm-Message-State: AOAM530iQWvLC+Mxw+rnqsEdzwJgtWfHFabZmlKvsMMc7wJ6fpQwBDZx
	3XR5Vzcg65Os4Kk99T1p9Z8xsUk56m7smpBic9MCxA==
X-Google-Smtp-Source: ABdhPJysi3OmBw79w1jRnjnJXChf3XKwgxj/WrMW1RvcpliRwqijlNR95NEky9jdE4wtCWiB+mO3MS+kl6ig9zpFiH4=
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr3719299wmj.184.1631704094978;
 Wed, 15 Sep 2021 04:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210912150121.8237296032A@nuc.router0800d9.com>
 <d6ad55b4fdcca27eee438031ea60b586c0f7f9da.camel@linuxfoundation.org>
 <16A41EB09718E439.21276@lists.openembedded.org> <CAOSpxda2cHN3d0WDMLszq8QJD0-Qa37e0NU57Xu21EXR672oFg@mail.gmail.com>
 <5a6a112b92ba3921ba31bc648f37f9cff2687f49.camel@linuxfoundation.org> <CAOSpxdbH9mEv0U8b641i7r+h1jpt--kNOT+PqKk3-e=FK4kw9Q@mail.gmail.com>
In-Reply-To: <CAOSpxdbH9mEv0U8b641i7r+h1jpt--kNOT+PqKk3-e=FK4kw9Q@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 15 Sep 2021 12:08:04 +0100
Message-ID: <CAAnfSTvQ-=BVCWh2wH9V7eWrXbctsOEBubb2xhAP_A86QurtJA@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Sept 2021 at 18:26, Steve Sakoman <steve@sakoman.com> wrote:

> Taking a quick look at the code in cve-update-db-native.bb I see that
> database updates can fail with a warning message printed.  So it could
> well be that the update failed for some reason, printed the warning,
> and then used the old database for the scan. That would explain what
> we are seeing.
>
> Perhaps someone who knows the code better can comment (Ross? I see
> you've mucked about in this section of the code!)
>
> Unfortunately I didn't enable cron logging on the machine that does
> the reports, but I will enable that now so that I can examine the cron
> output if this happens in the future.

That's indeed a good hypothesis, and having the log to hand would be
useful.  If you don't delete the tmpdir after the event then the
console logs will be available in there still.

A hunch is that if you have all three jobs running at once, they might
be rejecting some of your connections.  Maybe stagger the runs by ten
minutes?

Ross
