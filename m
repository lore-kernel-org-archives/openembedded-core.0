Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.1557.1585677189856968548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 10:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=0spoqU8B;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.194, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f194.google.com with SMTP id l25so24022523qki.7
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=BXh7dHQtD/cvkC6jw0U8ipr6OklEZPGJS8X6fImeevc=;
        b=0spoqU8B5ZKKfIs+xQuYn0duI7ZENZ1ihcUOyCVh8B2culgeEnRTaD1OGHBuzsTQ8A
         LujuUL/vMWlet8A3a/0QZKD36ePbq8DDzUaL+MamKKY9+7Y/rFFwIUoY4Kd9hwhZhgIN
         aVDq9D0Ih16Ruq4At4wxuuAsXOz3/sQfbrCcz2eSXlHUXbTasMs70/rEzcL0LegcPsql
         f/AMHRBflFhfpGR+Nf4RvVuWz6lh2/fbIXkdk59GfDoLXxt0bqAHHpnWMfuDJCTHuwkK
         NokoXx0OyUS4b59/TuoOlfENzBTRLBWi6VIPmkXoPbqGLzTu0YrA4oH7iejJVow8qGgK
         Bf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=BXh7dHQtD/cvkC6jw0U8ipr6OklEZPGJS8X6fImeevc=;
        b=o1i0oBlxnVLxX3THWnUQTGlXtu35ZQ5HfhPL8w3veLItRGGWMxGAe1uDJdQMvgccrm
         R0rVK13eDYLRQ7+ZmUbk/0qVkaA06PghUlsg2uJlgZ2U1srefuQAdaXRts1Wq5vuajr8
         +I6Tvoa+eNjR/XwG/tZh5rkn3uNxByojMzQe4XCL9k7kP3uRmMfMDdh/X9CPuP+7mpRh
         6PUNlHwbNPv1UGIG/O0F3iuvrsFyCUxUmBBCPkLcnFg1/vGJPGz+sNF+RXkJi0EsrQLC
         4uubEM0BV1vP1tZ4YDxGtmiLYNYm+5nyDlxyImt+dt4dwF3TyDcLcwjft7i9Q6Hj4y3j
         g/UQ==
X-Gm-Message-State: ANhLgQ3LcbqxL1ONFyqCEGAbzD3WRgKNqF2EpMdcl5PlwCRiGe3cUVfe
	n3a6Fn7iIUbRWyoDLeVpPvaUUI+HBn/J+A==
X-Google-Smtp-Source: ADFU+vv85hKyfLe0Uu661ykBf246sO4GQr9eQLE+tlo7z7jgn9h2y5JSImWkySrJbd9xdjz/b1bjVw==
X-Received: by 2002:a37:a08b:: with SMTP id j133mr6394973qke.265.1585677188726;
        Tue, 31 Mar 2020 10:53:08 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id 207sm13101793qkj.41.2020.03.31.10.53.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 10:53:07 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f175.google.com with SMTP id x3so24010785qki.4
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 10:53:07 -0700 (PDT)
X-Received: by 2002:a05:620a:9:: with SMTP id j9mr5608175qki.82.1585677186757;
 Tue, 31 Mar 2020 10:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200331151645.1030603-1-otavio@ossystems.com.br>
 <04006361-dc62-45a3-3cff-7f00004180e0@denx.de> <CAP9ODKqVEmRYzj6OOcXMjeZq-LwZgAQmSOiJ5v67NRueFBOGKQ@mail.gmail.com>
 <e7d00367-55ea-666b-2cd8-a9ab1fb3a09d@denx.de>
In-Reply-To: <e7d00367-55ea-666b-2cd8-a9ab1fb3a09d@denx.de>
Date: Tue, 31 Mar 2020 14:52:54 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoQshX1-i72Q1Q2o-Dd1J8p4FS-0RiaSomRNEDKr1=PmA@mail.gmail.com>
Message-ID: <CAP9ODKoQshX1-i72Q1Q2o-Dd1J8p4FS-0RiaSomRNEDKr1=PmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: Restore valid default environment for running system
To: Stefano Babic <sbabic@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>, 
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 31, 2020 at 2:03 PM Stefano Babic <sbabic@denx.de> wrote:
> On 31.03.20 18:44, Otavio Salvador wrote:
> > Hello Stefano,
> >
> > On Tue, Mar 31, 2020 at 12:32 PM Stefano Babic <sbabic@denx.de> wrote:
> >> On 31.03.20 17:16, Otavio Salvador wrote:
> > ...
> >>> - u-boot-initial-env on deploy
> >>> - fw_env.config on deploy
> >>
> >> Why do we need both of them in deploy ? For making system functional, we
> >> just need that both files are in /etc, that is ${PN}-env must be
> >> installed (and then you set RRECOMMENDS). But why in deploy ? Am I
> >> missing something ?
> >
> > This is used externally, as well as the u-boot binary. In our case, we
> > use this to add them to the UpdateHub package so we can upgrade the
> > U-Boot environment during the update process. Something similar can be
> > done using swupdate.
> >
>
> Ah, ok - got it.
>
> In your commit message, you stated that as side-effect after switching
> to libubootenv is to put the initial environment in deploy. Fine with me

What I meant was a side effect of the change itself.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
