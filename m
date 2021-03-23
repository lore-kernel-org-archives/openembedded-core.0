Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.10888.1616514135618187229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 08:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cGUcDkXP;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id q9so10662141qvm.6
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hdDJY9NBV0275YUi7RJ7db12/FWsdu/prO714J8FiH8=;
        b=cGUcDkXPum3PtgweiJp33fJ/4kiij8xjQp0ZNUPWLBUJyCqiR81k+sMCobKe6PfAC3
         9R7wDma60KS3askHxKjcBrQM3eiXtnZeXEg39bxRWQlirhRErW7AiKNRi8dRss3Rg6WF
         LrvsyOfb9u2StB+oG0Q+KwYuZhRmKkP0YtUHJsn3ycAeuPDabNMRHAFcm8UWjoEftZQp
         SVrOmhW+JvUN1a1cNR2mG/Wc78sDIYecP/CsoDU0CWXxN48tiTl5Ln6CaIn3BO+BL55y
         MlrYa3mV6FCuW1dLpRAlyYoOln3udTu274PsZon6LmuDdXoZX+RYIE1pETWASdqO74t2
         ipVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hdDJY9NBV0275YUi7RJ7db12/FWsdu/prO714J8FiH8=;
        b=ERj15PZUMNH7tyjy1oQpS6A9BXDSmI5wpoytvgS3bCvNpC0hm25hXslOkE2Y2aMSYz
         m/9M2QxFfhe4Lc1PsSzgxLj4niwn9CquGo7irwCRUo/eI12gyJPXR5nPSWGeUt64Bfwx
         iOHLRk1uY0H8/ZDl021DaCi/0tla0fisLWOR5GtwZjvv6RLrF9aaVQc/iti6wsPYPL2C
         wPHkxFJWayMg6R0dlqeXX4edRlu/WOuy774P70A9bYQEAKDMwmXjq/J/h7RFsKZpICn7
         trfxomI6CLRmCJijvu4zAxjdY8MCbO1b8sK6ifzTc9SAAyHtgdcLFY1sGKsIKimN0it2
         m8/Q==
X-Gm-Message-State: AOAM532vc5Yh5x3KyZI6hcld49MbDOS34XX/MvTGYei8LpvG2m3TUEZ4
	WXx3TyAwgrDFjM3Wo3nJwxYuMFOdU8IJzynppgA=
X-Google-Smtp-Source: ABdhPJz0F7qBLUq/4mz5ndzV6BzS7BKyQBaOfEMrdjJ/7Y1gWmsQha5EyDhVErfp9c0FMgcqlycRO5CGhdshc5HLr/o=
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr5434758qvb.50.1616514134740;
 Tue, 23 Mar 2021 08:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210319071433.23131-1-naveen.kumar.saini@intel.com>
 <CAMKF1sr1X99rgF2G1vdyrb-i3bfDPcj3NSxoXV-A8Mw7nxRbNw@mail.gmail.com> <4dae32cd7ff6573010af48a2d54eac0d6201cc94.camel@linuxfoundation.org>
In-Reply-To: <4dae32cd7ff6573010af48a2d54eac0d6201cc94.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 23 Mar 2021 08:41:48 -0700
Message-ID: <CAMKF1spgH_2m+1qCLA0RBAJ8xZHe1f8bjS1fjih9Uz-FEjvZbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] grub: upgrade 2.04 -> 2.06~rc1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"

I am seeing a build regression on riscv32 see

https://errors.yoctoproject.org/Errors/Details/574356/

any ideas?

On Fri, Mar 19, 2021 at 10:33 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-03-19 at 10:04 -0700, Khem Raj wrote:
> > I think renaming recipe to drop PV from its name is not a good as this
> > makes it harder for bbappends to be version specific or atleast cause
> > an  event  to upgrade
> >
>
> Having "~" in a filename probably isn't too sensible either though?
>
> Cheers,
>
> Richard
>
>
