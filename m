Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.35638.1585225639362077036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 05:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=DDTxL0zU;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id z12so4999691qtq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=MJp8v+zLPiZ1XjnhJqdeFLtrrWxxgFcG3PG3E1CR4lQ=;
        b=DDTxL0zUZbjZEWFKwHxWs87AtSza0jD7UmhAC5qNHnIkYgMqGvbcnKgaFcxfwDv9mu
         qka7XdPfx7VTKgaoVQZ9fxblRDYBVBHbNTzwZPKsUH6OSGREiMr57QqrgrAn3pi2pfVr
         PPrDpRh02/YsGpraZCOVy67r5JqZ+gxpKuPDVUyEyhcoz6eaM2ZkZizzFyzqRDssd+kU
         vaTVR49xJjl1V1QHrmm0ZCxAE64PBEYH1S/XiFDs8tqlKPfT8RQNDYkzSuRj6JZdsJYA
         9W2x1ASl6kWOWqq9Ocdn40ULoFA62oJnDDJv3HFzLONjxWGalswKTCok1hBue/a/sQPC
         1Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=MJp8v+zLPiZ1XjnhJqdeFLtrrWxxgFcG3PG3E1CR4lQ=;
        b=VndUM/Ocz6DwtJKxXimjhzMHt473firCgIc/YnL5d5z0ihGl93AA7p8mstawdFzRZ2
         MCdKTkpqJZIj6K3mzi4cU/uWpNsWsy770Ti72t4Zmjh9NfKCk3ZAR3YPTKaksYhLF488
         xsaamkH+yau6JwD5k60AkfRtoEOHmY2XxOz/C/gklxWYRVCyculR6idXU5d3zrioxhCj
         X5F0hZhAw/juCq9lcd6MEsyAg3DdEkL/7EFiAw3eMy/QmjquxDXxGpVAcR8O1U61gC1z
         pTfOVEYGAJvB/RE5ZhWI31A9L7dGosvGmYpZrPx+ZHaa2UnYlLeSI0TK48X8yS3uw+FF
         UAPw==
X-Gm-Message-State: ANhLgQ38S2BgJaFJGYVdiQaYmMbu6Dy50RxDvXuTEM+mc1xUSHvYXCQy
	P8amcatR4bEhHKpfry8f4SaKUENtvdT9mA==
X-Google-Smtp-Source: ADFU+vt8g2y+N+w3hUxLcdFjw/o8s1Hy90slRPQnu4gYqgOVU7QC1xOgpWGLXbhocEN8cEN4zr97Kg==
X-Received: by 2002:ac8:304e:: with SMTP id g14mr7909347qte.376.1585225638226;
        Thu, 26 Mar 2020 05:27:18 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id m92sm1436432qtd.94.2020.03.26.05.27.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 05:27:17 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f170.google.com with SMTP id j4so6027152qkc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 05:27:17 -0700 (PDT)
X-Received: by 2002:a37:b1c6:: with SMTP id a189mr2792265qkf.26.1585225637196;
 Thu, 26 Mar 2020 05:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
Date: Thu, 26 Mar 2020 09:27:05 -0300
X-Gmail-Original-Message-ID: <CAP9ODKooB5smjjX_TQ_dX4aar2pC20RrW2vzBW-Jo1ZX24+5Mw@mail.gmail.com>
Message-ID: <CAP9ODKooB5smjjX_TQ_dX4aar2pC20RrW2vzBW-Jo1ZX24+5Mw@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH 00/13] Systemd 245 and related updates
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

On Thu, Mar 26, 2020 at 5:54 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
...
> Alex Kiernan (13):
>   systemd: Use PACKAGE_BEFORE_PN, not =+
>   systemd: Package udev rules explicitly
>   systemd: Replace nonarch_base_libdir with rootlibexecdir
>   systemd: Reinstate systemd-hwdb-update.service
>   systemd: Add sch-fq-codel to RRECOMMENDS
>   systemd: Add PACKAGECONFIG for sysvinit
>   systemd: Remove X11 related files when disabled
>   systemd: Enable smack based on DISTRO_FEATURES
>   systemd: Enable audit based on DISTRO_FEATURES
>   systemd: Enable acl based on DISTRO_FEATURES
>   psplash: Set RemainAfterExit on systemd units
>   oeqa/runtime/cases: Disable and stop systemd-timesyncd

I'd like to ask if Richard could consider the above patches for merge,
they are bug fixes and minor improvements and suite well for the
current release.

>   systemd: upgrade v244.3 -> v245.2

I am not against merging this but if it is intended to be done, I'd
wait few days with the above ones merged.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
