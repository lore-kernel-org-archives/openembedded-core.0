Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.19431.1607871170556431303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 06:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=J+SVYRNT;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.174, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f174.google.com with SMTP id 22so3106798qkf.9
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 06:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NK+Twt87cmepZsuKSTUn+AtQWEGZ6jeVuKWggNMo4Cg=;
        b=J+SVYRNTDU2ctHb6E3maRbcTWKFh8CRXczJNLZ2GO10/7sCrcP0TuBrYhZGhDADIQH
         bcTfCyFUA5+cj3QiNm/T1b7aYTNB9v/k7/d6pcKrKwZoL9s3wr0PLzv9kRUrgLsTn7RA
         P4Tzk1bjB7XtvV6tlSD/4a3SWyma+nW3wXKqTAF9nBi1NyD+gC/v0SebYmIDzUtJgjMU
         HFf6qPbMaE+fUuC9fuuTQubew5NkJNN/1aH59IwSdHtPxIxgJ1Cmc/e8R0rHTEf/hUFs
         Zf/0dH3dBzZCGqgCBACsBmvJFKD3sAl86dsjBYPZnNSm8WEXKSkzcod2/gQSX4zSbfF2
         u4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NK+Twt87cmepZsuKSTUn+AtQWEGZ6jeVuKWggNMo4Cg=;
        b=fUo5b02945CT36cbz4HlfX41KuCgF6fF/sm401ro2R1rVpH/ofRF35Mw0kFKIRWDYe
         PVNr0kpBo75G9MnmK29bgsQ6+n9Q4hCD+oxGIQFbQfa7tipZAqX96Q7eFB+dz/kSqXem
         BLc7dQLi7eJUXdajDS6z8c1IgXSnsk789XF6agvxmUQRUxsibyEnoHwkAkRHjH20m8BX
         gzzHZAHy8JvVflQg3Jkk4eb5a0wKOcfA+V9nw1Pso3yoxz3FNwiHurIlRYJJxy8LueVS
         Gkrp9m3qxA1uxwICN0++kTQ9570ZwG6BCalmrIGYqSeAtOdO0df62weir8932cWMdHFR
         afhw==
X-Gm-Message-State: AOAM530XsZn+4q7bkx36qHU00DG2ZaqyYEEC2FUc0gQA2jtwktsFDAiD
	jM9raOJEkJw7A+U+EdI8E7mcqSkXCSxaHMUD
X-Google-Smtp-Source: ABdhPJzbFf8Fk3UxwfsIKBCeGDI7ayDM1HsZ3F2CrXJGW1ETjAHnDU0m1ByQJkYiU3ZE4cyuiLtPPA==
X-Received: by 2002:a37:e504:: with SMTP id e4mr21497285qkg.191.1607871169480;
        Sun, 13 Dec 2020 06:52:49 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id e11sm6763159qtg.46.2020.12.13.06.52.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Dec 2020 06:52:48 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id w79so13324663qkb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 06:52:48 -0800 (PST)
X-Received: by 2002:ae9:f506:: with SMTP id o6mr26819600qkg.414.1607871168462;
 Sun, 13 Dec 2020 06:52:48 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com>
In-Reply-To: <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com>
Date: Sun, 13 Dec 2020 11:52:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com>
Message-ID: <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com>
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

Em s=C3=A1b., 12 de dez. de 2020 =C3=A0s 23:30, Khem Raj <raj.khem@gmail.co=
m> escreveu:
> On Sat, Dec 12, 2020 at 3:52 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> > And this segfault is also happening inside the build. I ran the
> > readelf on them and it seems to have been modified to use the
> > uninative libc loader but I am in doubt how if this is the culprit.
> > Can someone shed any light on this?
>
> it seems relocation is not working in some cases. whats your host
> distro, are you using gold linker by any chance.

Ubuntu 20.04 inside Docker

The features are: DISTRO_FEATURES =3D argp ipv4 ipv6 systemd ldconfig



--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
