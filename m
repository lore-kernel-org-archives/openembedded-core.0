Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.33163.1607945530455972737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 03:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=nNP4J9SU;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.51, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f51.google.com with SMTP id bd6so7624888qvb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 03:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4yzRgN1JAq9AsXgYTE6Hm5Wg1EyL3S3Ltn4Kr1gajLM=;
        b=nNP4J9SUMwLg9SeRca/WId+L9h94EkNOsDeFbtYklSkdcxInaVQvmkj82i5gj4bUEP
         MMd6JrVnR6jmwOlk6meyoomFXkk0NhM5ia8EfDx/I32MpempSC2UEq2EDDUClAiKDj0V
         DIxGNrbLuYxzgyoBdsHQFQ3C3JrlVttEvXkdXkOLZFFAjBB6QW1JQHP9YMcaRxQPoEJ2
         sac6u1trUb7oanh07UVpKWsCRvMcnT71Ef73exWQaIe6lH4tNbtjgs1e+cCZBNVFBH06
         q5jGKEG+p55KPQyXP6LE/uv53vPNxD+YXWDw09BFhhQz3o6WdY9e7vC7M9/0jKmMIQAW
         GDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4yzRgN1JAq9AsXgYTE6Hm5Wg1EyL3S3Ltn4Kr1gajLM=;
        b=PaMaAQprERvPxffmAPUic4f4H1RCXfZirB00KQydfoTnswEkXmjJX0YPh12OZtIqAS
         pMWqzgURYXBeEEkM7nSaqYYvt5/K2QWejzKeFvlb1gj7o67f3+BAOffTSM6R0ysC+Wf5
         H3cE6nieLy+74VPU0ZxLD/wKmjYKrdoBSS5JjhcAaet5dvgAUiW28s/j97SxQJ4zjape
         EZv82k8AcU1ZmiQRbeoun7QPJ7VlvSNtiZ8JydLlrzZ9wcHDiltkZgAftr4PjdX+fdSs
         Vv2wAG62EiLpRWNuHg433gIzwuZXBSVu4n+Nc0lpyJOr3Vfu6pa/8A7IXrmNNF5Ft9X2
         TKPQ==
X-Gm-Message-State: AOAM531uXDlQrjLD5PEZ9frNnjsrS703o8XKWcVNAedUjvPl/cuXWziH
	qRQ3vswGFQumklQzyA2+DXeT+xmAlpg+aRME
X-Google-Smtp-Source: ABdhPJxn7f9KZsuH1T7XT483jBGvKKX4rrLa/VspEauUbUFF0iENJpYWra4gH1nE0SPBRMumlHhiZw==
X-Received: by 2002:a05:6214:a14:: with SMTP id dw20mr31062111qvb.43.1607945529364;
        Mon, 14 Dec 2020 03:32:09 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id u20sm13708191qtw.88.2020.12.14.03.32.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 03:32:08 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f170.google.com with SMTP id z20so11579986qtq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 03:32:08 -0800 (PST)
X-Received: by 2002:ac8:690f:: with SMTP id e15mr29203737qtr.100.1607945528526;
 Mon, 14 Dec 2020 03:32:08 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com>
 <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com> <CAMKF1spBFaSKMXU77Rmx-usTw-mJN-dhbAb-=PKiFSFJ1-5hSg@mail.gmail.com>
In-Reply-To: <CAMKF1spBFaSKMXU77Rmx-usTw-mJN-dhbAb-=PKiFSFJ1-5hSg@mail.gmail.com>
Date: Mon, 14 Dec 2020 08:31:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoPuatKkZYK0Zy-6wfPh--G7HD3bz_QDRmqDR-gRhiLnA@mail.gmail.com>
Message-ID: <CAP9ODKoPuatKkZYK0Zy-6wfPh--G7HD3bz_QDRmqDR-gRhiLnA@mail.gmail.com>
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

Em seg., 14 de dez. de 2020 =C3=A0s 00:49, Khem Raj <raj.khem@gmail.com> es=
creveu:
> On Sun, Dec 13, 2020 at 6:52 AM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> > Em s=C3=A1b., 12 de dez. de 2020 =C3=A0s 23:30, Khem Raj <raj.khem@gmai=
l.com> escreveu:
> > > On Sat, Dec 12, 2020 at 3:52 PM Otavio Salvador
> > > <otavio.salvador@ossystems.com.br> wrote:
> > > > And this segfault is also happening inside the build. I ran the
> > > > readelf on them and it seems to have been modified to use the
> > > > uninative libc loader but I am in doubt how if this is the culprit.
> > > > Can someone shed any light on this?
> > >
> > > it seems relocation is not working in some cases. whats your host
> > > distro, are you using gold linker by any chance.
> >
> > Ubuntu 20.04 inside Docker
> >
> > The features are: DISTRO_FEATURES =3D argp ipv4 ipv6 systemd ldconfig
>
> Does it happen outside docker ?

Yes as it fails on our CI as well; however in this specific host I
cannot avoid the Docker use as my host is NixOS.

How can I debug it?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
