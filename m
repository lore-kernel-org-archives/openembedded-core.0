Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web08.12348.1611937937839625509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 08:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=cQL37MNe;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.45, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f45.google.com with SMTP id j4so4703176qvk.6
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 08:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IRyEY/oSqv6GV5bR2rVjYxNPvtOjlysGmkfkEd1YHpw=;
        b=cQL37MNeUvKuHt8uXZY9U248sD2+904k7psGa8ea2qOJZvAARR1fhmo/fiNCyffxWB
         m0rSQi92aIwri1DMkUAZlrkp2w/T9RGzzU4m+XemgpFyb45sHQNplWndtwTm22jA1xw1
         k+DT6S6U6A90dtZR+BH+rfvn165X1o8v4/sBVAdKdWy+MZamhEobiWdUDcxIlrHHkHGu
         ynaRY2bh6skXa1X5kjdIRnyLXl6cWgMoHXuVLSUm4R2V8HbdE6rjlJgu0pydY6pvPbJ9
         8x1tymdK+BCgi3SvQ8itXNnAHvynjVOLk7vhNa7Uz5oeobSD/Lwa8CN9UdpxqUyuSIvk
         NhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IRyEY/oSqv6GV5bR2rVjYxNPvtOjlysGmkfkEd1YHpw=;
        b=JGDF9WZu7oFme9AqryCzb/vlIPxNdwcN3WqShoCZ2cwxgNKBKKcfSAvqBTmLBqyIEN
         56N6GFb12XEIiiZQ3BZAoAUsHpL/3MkchZoDQ0YVvLEWgo4uELHixnH8ArJns5CLLBxC
         kP5WY3OkWaDbZI3Tpt5nZYvp+Ql8vM2zy58fVM8AeCxQdLnL1+iDet5p/36ZQo/3KNF/
         FP3+kCz0UDcr0oFi8n5xrmSBjgUIIGd7R2Pf1tJxQIPuDmTn9Q5kIM4zobnMLKY8F0rD
         IcBPP17Wur0QUNjOmViGilLkYmjy8cY4SAxJW8Twl2SQexpjMpYdmH3uRlOpGM6r+aR6
         8UEw==
X-Gm-Message-State: AOAM532TjxJ77rfwqriC2RjVLfYsn9OdMN5ejoDKP/gzUgXu9Uu9U5P5
	TJOT/KyfOm7yovKzve2NK1lWa6MYRAelaQH7
X-Google-Smtp-Source: ABdhPJzm7Urv5izEiX90nED+0mBhXcRoo9mjMJoKLdapu+iwFIafyEzbdvRP4EaSTBBRerP97Dg7Zg==
X-Received: by 2002:a05:6214:c65:: with SMTP id t5mr4740716qvj.19.1611937936722;
        Fri, 29 Jan 2021 08:32:16 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id g131sm3559845qkb.91.2021.01.29.08.32.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jan 2021 08:32:16 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f180.google.com with SMTP id t17so7088090qtq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 08:32:16 -0800 (PST)
X-Received: by 2002:a05:622a:2d4:: with SMTP id a20mr5050040qtx.217.1611937935901;
 Fri, 29 Jan 2021 08:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20210129014259.7985-1-tom.hochstein@nxp.com> <CAMKF1srvbmYWe1EwDK-mLhgN0vDhKe7AfL1zznAy8CSTxv3G6Q@mail.gmail.com>
 <DBBPR04MB77537EC087756F1D28A99D13E2B99@DBBPR04MB7753.eurprd04.prod.outlook.com>
In-Reply-To: <DBBPR04MB77537EC087756F1D28A99D13E2B99@DBBPR04MB7753.eurprd04.prod.outlook.com>
Date: Fri, 29 Jan 2021 13:32:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrfyYz+Tu63y8hsAyO_asyPosZ0hs0UquZVkBviXPNufQ@mail.gmail.com>
Message-ID: <CAP9ODKrfyYz+Tu63y8hsAyO_asyPosZ0hs0UquZVkBviXPNufQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] glm: Fix packaging for header-only recipe
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 29 de jan. de 2021 =C3=A0s 13:06, Tom Hochstein
<tom.hochstein@nxp.com> escreveu:
> On Thu, Jan 28, 2021 at 10:57 PM Khem Raj <mailto:raj.khem@gmail.com> wro=
te:
> > On Thu, Jan 28, 2021 at 5:44 PM Tom Hochstein <mailto:tom.hochstein@nxp=
.com> wrote:
> > > Set ALLOW_EMPTY for the main package to "1" for this header-only reci=
pe. This
> > > allows the SDK to be created properly when there is an RDEPENDS on gl=
m.
> >
> > Runtime dependency on a header only package seems a bit iffy it's perha=
ps better to depend on glm-dev perhaps ?
>
> Well, it's all iffy in my mind since these are just different workarounds=
 for the root problem that header-only packages are not included in the SDK=
. If you think including the headers in the image is the better workaround,=
 then I will switch to that.

The allow empty seems to be the right workaround here as it allow
people to consistently use the `dev-pkgs` filter to populate the SDK.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
