Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web08.15463.1625259952266672572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 14:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=URFu28fo;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.181, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f181.google.com with SMTP id j10so6228198qtx.13
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 14:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G/tek3/jMZXbRb8zb1cTWXZCFQZlApB49ENStzhLgPk=;
        b=URFu28foct6n62E+HF9pPZm822NVl8tb/kJ3zS/6f6o5b3ndh61/dpJYGNAhK6D7IQ
         Y/b5bzK7ggprhTjHYWm8+fYn0Z/phQHdaeBus9lxxhbejJOmktf/f1/UOwOHNvCKuu6r
         TkpSdu1SrJVhJl2Pg6d1SAGgtTEUa8SFFXGxkDyIYD/zzxCIfV1rGxt5tAsaJdAT+674
         +8rVrDw0J+OApOZPYrrAdCuM+8J0Taj99B5LVVPU6XsSL7+nnvLiQMxMTmij4rQIGOaP
         Ar5oI/ad38lASjWNRublotO00xLPoGWTaNBoYMUbhoCDZGtsv1+X4P9bxhi5rwVdNs7G
         1N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G/tek3/jMZXbRb8zb1cTWXZCFQZlApB49ENStzhLgPk=;
        b=UAQiyxrTme7uL6TkPZ6bG7ii3f0SKK6rUKXw6408tWichTX92AjQ0YefpeAeAlnACs
         9+e6W/hvPMtOk9g1T+1XviFaKreWyF0wvJx0vRCzIqxQ29NX2u0UHugMGCwbLh7eN+EW
         6y63l44PelaN/wY8QxssxsRptWp0MDFMqthSxzVETMK+NaWmNTZtZAKhWgUBDGaJQTYv
         1r/jimrh6PWkZhor5Bry8S28Pd3Vmujl4jU+Xamy9E7v+Fxp2TlZhmFIAq+cA/N46cre
         +S4srLNgCLy412hwBdwZuCC8heuEHFhIHUrXZaDTHo33tETFXEAjmRJjiHFsGJAXfP/S
         X63Q==
X-Gm-Message-State: AOAM531P0TasdhcEVFKkfsDp2QvxqnjAupKJWLYE0T8DM4nDgcNDH8vu
	X6CSsm09SLYwnV/6mynl95Eaks9nMeAEv2oU
X-Google-Smtp-Source: ABdhPJxn+ArDNreRwKHlgnDPf0BtIDuKLUYAlJywvOs/eyV1IRTFR9Ey57kBsRnz2JAHeZt7XYvHtw==
X-Received: by 2002:ac8:7d06:: with SMTP id g6mr1634045qtb.231.1625259951246;
        Fri, 02 Jul 2021 14:05:51 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id 65sm1872628qkl.91.2021.07.02.14.05.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jul 2021 14:05:50 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id 19so10656098qky.13
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 14:05:50 -0700 (PDT)
X-Received: by 2002:a37:6d6:: with SMTP id 205mr27661qkg.197.1625259950333;
 Fri, 02 Jul 2021 14:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210702115900.19417-1-peter@berginkonsult.se>
In-Reply-To: <20210702115900.19417-1-peter@berginkonsult.se>
Date: Fri, 2 Jul 2021 18:05:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo4HQJ8tTq8se2nQjnZrEb1xXfu-gOWMYwicCX34MV6XQ@mail.gmail.com>
Message-ID: <CAP9ODKo4HQJ8tTq8se2nQjnZrEb1xXfu-gOWMYwicCX34MV6XQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
To: Peter Bergin <peter@berginkonsult.se>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>, Ming Liu <liu.ming50@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 2 de jul. de 2021 =C3=A0s 08:59, Peter Bergin
<peter@berginkonsult.se> escreveu:
>
> This reverts commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5.
>
> As there is no build dependency between libubootenv and the configuration
> of u-boot there is no reason to check for UBOOT_CONFIG or UBOOT_MACHINE
> by adding the class uboot-config. Revert this in order to remove useless
> workaround in bsp layer (meta-freescale).
>
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>

Thank you; I second the revert of this for sure.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
