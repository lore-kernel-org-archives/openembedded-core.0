Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.4904.1594295584882932004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 04:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=FZIbEwnP;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id i3so1356707qtq.13
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=caOcrEiJf+Qzjh1KYTbNIA+iikRTWx0n5qPMMYeRC+w=;
        b=FZIbEwnPSYNYr8sTX8XcjS5Vwgg/+N+0C7GFuTfqYklxLFNd4MQ4xybIkPnnRsmFSM
         gy+b6URRXoO4P+pO8kfu5iH2xTp4FNLe58UmP9kEWWtzoxQP6KUpjAQd2T+o7ADPMpqE
         46vFcxw+o+9+Fzn8ly0zmt4HUaq8AoQxQE7RpJdqqk7via2iqkOoF3BQ6zWCN87ef03k
         l64trZDz88oKy0uMdnhgvz6gP795bq8P4cS5JbHsWyCyqbPX8Xf54iECZdBRancFHP0u
         zHNB0jcXlJWXGUcdnE2aEpqsnTSZqcWGQHG8wHaztTUSehPyiKQ/jGTEQpum5awjkP45
         SzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=caOcrEiJf+Qzjh1KYTbNIA+iikRTWx0n5qPMMYeRC+w=;
        b=XZBg4DzP4cxgn/0M8Tb/pSyqYuXMOZ5kPWmyG6SCXRdTOjpgwhRHO2nicmcuQQ1ypY
         kdaB8fD89hm91v8mMRZWTcMiHqgD4IsP8tkjIaY6SWrNJ1qobf+FyQ3rqzK9yz1FKu/R
         evDQUMcBHblrAiD3xAiuDT8KuV/OKvFxfjNUwa2ko4FKVaQMRkqDkVbqVlZ2Un0AO/t8
         UJ5sF7fdPpGHxYYzWFGxnXjfF2UbG2engYiIlzEsOtEUUodaQDFOrLicFZ/764Vz/VLn
         Yv/kARR5z9PKE4UUH5Yaz9SEFHSQm7nn7kOF2xGoWnlgsDGvFU/VPbrUflmzPbtbZdmU
         OKAQ==
X-Gm-Message-State: AOAM531VEr+YlXB98vNz1AuHA0VqIgV5L1axL/01NvnPhUaAQv/e/3XP
	+fUQKZd4lgVdRb5cnCMcqC1/e5vC8WuURA==
X-Google-Smtp-Source: ABdhPJxBjKNHK30Jz5wIJ2w6PpHCMC5chmRU1A7dFTPZSiXQfSXVEAoq+eYV+psJee5USsz+RM60cA==
X-Received: by 2002:aed:22ef:: with SMTP id q44mr61807357qtc.333.1594295583681;
        Thu, 09 Jul 2020 04:53:03 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id p63sm3516117qkc.80.2020.07.09.04.53.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 04:53:03 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f171.google.com with SMTP id b185so1455006qkg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 04:53:02 -0700 (PDT)
X-Received: by 2002:a05:620a:24b:: with SMTP id q11mr62626674qkn.277.1594295582225;
 Thu, 09 Jul 2020 04:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200708195756.760-1-sno@netbsd.org> <CAP9ODKosgPup-Y3Ee-of+N9d9t+3GPHfZ4ZkfpE8PhJoxAkjTg@mail.gmail.com>
 <B0E130E3-E9C3-4D39-BFB1-9CE1D59345BE@gmail.com>
In-Reply-To: <B0E130E3-E9C3-4D39-BFB1-9CE1D59345BE@gmail.com>
Date: Thu, 9 Jul 2020 08:52:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo9u6qQydVg_qhiSpZP_YwsHBO0EipQh8f2cemtY+PPng@mail.gmail.com>
Message-ID: <CAP9ODKo9u6qQydVg_qhiSpZP_YwsHBO0EipQh8f2cemtY+PPng@mail.gmail.com>
Subject: Re: [OE-core][PATCH] toolchain-scripts.bbclass: also recognize ${SDK_SYS} env setups
To: Jens Rehsack <rehsack@gmail.com>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jens,

I've added Richard on Cc.

Em qui., 9 de jul. de 2020 =C3=A0s 01:13, Jens Rehsack <rehsack@gmail.com> =
escreveu:
> > Am 08.07.2020 um 23:20 schrieb Otavio Salvador <otavio.salvador@ossyste=
ms.com.br>:
> >
> > Em qua., 8 de jul. de 2020 =C3=A0s 16:58, Jens Rehsack <rehsack@gmail.c=
om> escreveu:
> >>
> >> Instead of recognizing only environment-setup scripts in
> >> ${STAGING_DIR_TARGET} or ${STAGING_DIR_NATIVE}, respectively - lurk al=
so into
> >> ${SDKPATH}/buildtools/sysroots/${SDK_SYS} where nativesdk-openssl inst=
alls
> >> setup files.
> >>
> >> Remove overwriting of OPENSSL_CONF from buildtools-tarball.bb to clari=
fy
> >> whether nativesdk-openssl installs wrong content or buildtools-tarball=
:
> >>    (nativesdk-openssl) tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
> >>    (buildtools-tarball) buildtools/sysroots/x86_64-pokysdk-linux/etc/s=
sl/openssl.cnf
> >>
> >> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> >
> > I did not understand the openssl related change. Is it possible to
> > rework the commit log so it is more detailed?
>
> For sure, but maybe I'm completely wrong. Let me try explaining it first.=
..
>
> If - and only if - one creates an SDK which included openssl (and not lib=
ressl, mbedssl, ...),
> nativesdk-openssl packages an ${SDKPATHNATIVE}/environment-setup.d/openss=
l.sh
>
> OTOH - meta/recipes-core/meta/buildtools-tarball.bb creates a script whic=
h is sourced
> at the very end of SDK environment setup and writes what's included in
> {SDKPATHNATIVE}/environment-setup.d/openssl.sh on it's own - with maybe s=
lightly
> different location - what guides me to add:
> ... to clarify whether nativesdk-openssl installs wrong content or buildt=
ools-tarball:
>    (nativesdk-openssl) tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
>    (buildtools-tarball) buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/=
openssl.cnf
>
> Maybe they way how nativesdk-cmake is doing it is the right way. Then, ma=
ybe
> nativesdk-openssl should be reworked. This is for clarification.
>
> Does it explain something better?

Yes and generating it directly might indeed be not the best option.
Ideally, it'd generate a new source script which would run later and
do any need adjustment. Do you agree?

Either way, this commit seems to be mixing two changes and I'd prefer
if you split it. This allow for nicer review as well as better commit
messages of individual changes.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
