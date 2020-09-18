Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.9928.1600425180123841589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Iyg7nan0;
 spf=pass (domain: burtonini.com, ip: 209.85.167.65, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f65.google.com with SMTP id q8so5576092lfb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gz7WBcpdf1Zh0FjPWtaVFFd6WZW5GX/VfPgOnodzcds=;
        b=Iyg7nan03xReTnwfgELAIouy600tT72HW3D1IMGFmZnLtVeI3pj1AW6oRbFGGfar/D
         jUgmFhGBpPHbUUe/OlqRQdMlBJquy2nu1Is6Sb7kGLO9UyQqOcMQSX0Zvr0QwDU2qs9Z
         YYdwc2WmOG/i4XlbE2MRdrUEBRV0k8eNoVywb2ba2mdt1hrJnHEzhO1zzqD699ZsqEfx
         KGE7dMWMEjaWnXcximXDpZ73P/rY7Lw0DNodZGoEmw4RissB7Vaa8ClsZ+QgrqKYqBsB
         qsYeF7jsSdxXmHXWQU1i/rMmHLnAYqOJLIfKtHovu2WD6TrQVQf/NalFI+cxleT/jCRF
         5CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gz7WBcpdf1Zh0FjPWtaVFFd6WZW5GX/VfPgOnodzcds=;
        b=Kh1q9jYCexyspVxq2BLrir4tZQC+XLFDAddISaCOdmLPNjtT/sOGCYVrkb+eFOZ7zT
         p/lhRXxBOLU0uVSahOHwqWb0WGrhjUcUMAR+6ug3bs8wR6RlKYt+ALHZSRcHPvo6l1Kg
         ytqkUY0CvbPsDuhndPy8jZrZJpJ3wEv+d8o7OxGLsdooQr5vnFy2sCmpGA/KNP//QP7e
         DKG9j1jcWXUk0tafCPaXUWxzTPyh1WXzLiL8ya8Ko3mHzaV027NMocCGHds654iRDbsO
         bQraqhvWdS0HcomGN0COSdW6UbulvDrl9iykifiPNR6AsuFLQw5tiA2ZAVNIH6CLv4i4
         FCrA==
X-Gm-Message-State: AOAM531X6vsbO4ae+wiY/g189qCmHTX7BiqLcJZRPbwvKpuRCpt/pFAS
	YOdBRUcYGX+8vcryLgYLTtu/3woUKlwc9fdsMnhxRA==
X-Google-Smtp-Source: ABdhPJwTKSA/nZxheSUwHXpJ8CX1RqJOQV0/WfTIwHBg1O7llsSGtIs0NWOhosh6orFZMFvKQgZAPoxK7sjCoJP2tYI=
X-Received: by 2002:a19:457:: with SMTP id 84mr10420711lfe.205.1600425177787;
 Fri, 18 Sep 2020 03:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200918095004.34894-1-christian.perkonig@sigmatek.at>
In-Reply-To: <20200918095004.34894-1-christian.perkonig@sigmatek.at>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 18 Sep 2020 11:32:47 +0100
Message-ID: <CAAnfSTuFBJ_-jKqkxzmDi-tpW+pVCvsZPGScxWqScJ7O6oqWVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] meson: remove shell wrapper for meson
To: christian.perkonig@sigmatek.at
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sep 2020 at 10:50, Christian Perkonig via
lists.openembedded.org
<christian.perkonig=sigmatek.at@lists.openembedded.org> wrote:
>
> The nativesdk-meson creates a shell wrapper which adds cross-file option to the meson command. This option causes problems because it is only uses for the setup command. If you use meson for testing like 'meson test' the cross-file option is discarded.

So why is this a problem for test if the option is discarded?

Ross
