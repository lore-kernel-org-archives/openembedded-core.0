Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EB0C0015E
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 16:09:22 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.500.1689610157546872895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 09:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=m8uhUMVv;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-991fe70f21bso637217866b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689610156; x=1692202156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z4tPIDI06YRxnfBXbN2I0JcF0y3cN7afyuF+g1MtHQ=;
        b=m8uhUMVvYq/MBNyst7d7z+e4UB4LHqTcKp/WRgWxc72T48wu5B6c45LujsRb9tgL+b
         9bArfGaQOg82pJafm0A0PfkDHsg0F7od3TmM1ul/QVAhqgvLnFvSVEqTLpFBb0IKadvq
         yegv/b4KIzNX0vf3Nnmc5bBmzrMnv0GRRs75Ikoi0f/WOqMvJAQVuNHr5HjHoTJTqrRm
         CmjTxYhN7be5vd5Qx07BynSr9feGcMgogwLBd2eIxq6CulIOs84fdiOMYUfbvoVJem/a
         KXrCAr4LQtJsrtbIq00DcykHQcaO0kR8DvI3OLNd58RaRmfnuGp1D55Ivn/SUsaLM5xY
         qqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689610156; x=1692202156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Z4tPIDI06YRxnfBXbN2I0JcF0y3cN7afyuF+g1MtHQ=;
        b=C0y7LMri1EdbL0wJ/t1IxI6ZhUgKBx9NmAao5i75QyKJ26IMGcB2DaT6Ib0TvvXxaf
         YXtRF/MFF/Ydw88uVaVSpX6RWpom9dubUEjIAVWLzymAlAsl5rkWPxVSEYsVtzCVBySt
         ACYGq0h501X4Pcm9Cj5tYNarjgeXlh5w4ko8foo5E3c6Y0HhQOw8cu5mRmgLatxM3kXp
         fZ5hsUmLFgB6ox6MTKsuLcMghboTFB0GfwJalOCoqPIDBsEGzKMfeEIj12j8tr2xrGTn
         kweuRTLWO5uC0V0GAvD6buI40heClkJ6FE/Kp1vzTi1OK3PSyhyOEX3CXeqjv2O2XBw7
         IEzQ==
X-Gm-Message-State: ABy/qLaJKlC/GtmZP+hZfAzI3tBfILOjV53MSMn49xlUj4vpnxn56rKa
	Dt/Z3YcUd+iuH48o305Ex1BgMTY89Z0DysgXujvcY9yHDjn+mknyYqw=
X-Google-Smtp-Source: APBJJlFHHuJuL5x0ghWBBxBAPN+vVIucXoBtwFCLv30m4tomS7tr4P6v532h7g5lGYPzS4UdYPZVLOnRv3hwntmej5w=
X-Received: by 2002:a17:906:7a4e:b0:997:870d:e8fa with SMTP id
 i14-20020a1709067a4e00b00997870de8famr5379845ejo.1.1689610155712; Mon, 17 Jul
 2023 09:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <1771AA996BA380BB.28005@lists.openembedded.org> <6dc56bfa-5736-74b5-b13b-ef014a24ce9d@windriver.com>
In-Reply-To: <6dc56bfa-5736-74b5-b13b-ef014a24ce9d@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 17 Jul 2023 06:09:04 -1000
Message-ID: <CAOSpxdZ1Z3=o=TZDubjm00V69H9cibJKuipdSkf513vBbdENJw@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH 0/1] Cherry pick commit from master
 to update webkitgtk to 2.40.2
To: Kai <kai.kang@windriver.com>
Cc: Kai Kang <kai.kang@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184474

On Sun, Jul 16, 2023 at 3:34=E2=80=AFPM Kai <kai.kang@windriver.com> wrote:
>
> On 7/14/23 15:15, Kai Kang wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > Hi,
> >
> > I've discussed with webkitgtk maintainers about api compatable issues o=
n
> >
> > https://lists.webkit.org/pipermail/webkit-gtk/2023-March/003887.html
> >
> >> WebKitGTK 2.38.x is backwards compatible with 2.36.x, you can safely u=
pdate
> > without needing to change applications. In general, we always keep the =
API and
> > ABI backwards compatible.
> >
> > Note that the current stable releases (2.40.x) introduce a new API leve=
l
> > when using GTK4, but I suppose this is not a problem because most likel=
y you
> > are still using GTK3
> >
> >
> > I suggest we apply the update in mickledore too which solves lots of
> > CVEs.
>
> Hi Steve,
>
> I have no idea why the cover-letter is not in the same thread with the
> patch.
>
> So according to the reply from webkitgtk maintainer, would you like to
> re-consider
> to cherry-pick the commit to mickledore, please?

Sorry, still not possible, this is a major release bump that adds
features and APIs.  Please see:

https://wpewebkit.org/release/wpewebkit-2.40.0.html


> > Alexander Kanavin (1):
> >    webkitgtk: update 2.38.5 -> 2.40.2
> >
> >   meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
> >   ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
> >   ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++------=
-
> >   ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 ++++++++++++++++++
> >   ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
> >   ...ebkitgtk_2.38.5.bb =3D> webkitgtk_2.40.2.bb} | 15 +++++--
> >   6 files changed, 111 insertions(+), 48 deletions(-)
> >   create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-Jav=
aScriptCore-CMakeLists.txt-ensure-reproduc.patch
> >   create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab352=
58a6da9b13795c9b0f7894bf4.patch
> >   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b9=
0453bc4e100dcf967243ecd98.patch
> >   rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D> webkitgtk_2=
.40.2.bb} (90%)
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184253): https://lists.openembedded.org/g/openembed=
ded-core/message/184253
> > Mute This Topic: https://lists.openembedded.org/mt/100136728/3616933
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
kai.kang@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Kai Kang
> Wind River Linux
>

