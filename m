Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722C0CE7AAF
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 17:27:14 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.67069.1695662830855995659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 10:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fCcf4j0P;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-57b72cef02bso2955059eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695662830; x=1696267630; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSD0oVzXM/4lOD9on3Wegdyqaet82Dn+XSRI1z/XmsY=;
        b=fCcf4j0PP9C9JFA1QZHokeDx/ldvwsj3CyMKEGoVBuDHq4baTkkovuchciCXCIXQPA
         Nkb5cmcX8Dk7z82njudea5Et8XhLgSIXfX33PFpYNhCpsHo4yPgcnZ5H9G2BNZuvNoC2
         wM9CzoyUYwiIyxlt01/bPPf1IuJT2QNElGYLxvdl6Gz8n3yoSmz68NEAwgYYfM3txxDK
         ZOFH0Th84xQO5xFA7C3P4ucieFfS5/7HAgfkBVPvjTN6h0e3bzpvokFI3EP9BMgTGLvV
         +f5gnkp6K3A1PAC5Co8eSUCsdDAOa2mwI8uD2911FjCfmAvVOvLTBqm312nO2YN2dgWC
         Y3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695662830; x=1696267630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSD0oVzXM/4lOD9on3Wegdyqaet82Dn+XSRI1z/XmsY=;
        b=khFGBIow6m7PcDf5jLXZMxc45h+/VXu12CscWMey2/n8LkaY5NCHXucEWiCf8MipFy
         AYDrwLuI393xzsl3HhDmTHDeMAQRMweSR8W4cXIYC/u4pVgw4xnIPxzi2ekTJJ1RRScd
         k3otiN/YKa6BSr9UBOYnPgIYRgeUcN0+EXJny12J1modMnzc0oav0xZe1OdD1heu2F/z
         TQWa3EfZc4RKIKRXSXuSjdKh3kK4ZDh1bPWRJNbzbaN54kpyauNGEDiO/PIVejXsDDE2
         Kwe7sy+snKo0OAqvzo1QmEYh6SFcPkkCWXyW0sZPSeIBYaXbY0nX06Y1YUu13NCyyVD9
         FBSA==
X-Gm-Message-State: AOJu0YzPfAXdG5iCvtWyCW7l9Qa/xtrK2Y/gpMY5BGUtw8WJXuYzsoy9
	/CnWFwhje1xbZ2jLBX7s7DaLWcFnjgKtRl1Jys1Qafbkghql4Q==
X-Google-Smtp-Source: AGHT+IEMvEv2aOGyWA0wXz7syB0w4SPITepKR+iUC0x2tviDXyKQmCGvwpkCCenfpjWwSces9IvxF56U18hXi3agFfQ=
X-Received: by 2002:a05:6870:891a:b0:1dc:7e71:d475 with SMTP id
 i26-20020a056870891a00b001dc7e71d475mr10912877oao.4.1695662830022; Mon, 25
 Sep 2023 10:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230922210508.24087-1-raj.khem@gmail.com> <20230925160421c389ced3@mail.local>
In-Reply-To: <20230925160421c389ced3@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 10:26:44 -0700
Message-ID: <CAMKF1spfNRqdZFUv1ux-a9aW9J9Q+b2CsDdTXFSGeiOP-e5v1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/5] musl: Update to latest
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 17:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188200

On Mon, Sep 25, 2023 at 9:04=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> I had this with the series:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7848/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7876/st=
eps/12/logs/stdio
>
> make[2]: Entering directory '/home/root/buildtest/cpio-2.13/rmt'
>   CC       rmt.o
>   CCLD     rmt
> /usr/lib/gcc/i686-poky-linux-musl/13.2.0/../../../../i686-poky-linux-musl=
/bin/ld: rmt.o: in function `parse_opt':
> /home/root/buildtest/cpio-2.13/rmt/rmt.c:715:(.text+0x190): undefined ref=
erence to `error'
> /usr/lib/gcc/i686-poky-linux-musl/13.2.0/../../../../i686-poky-linux-musl=
/bin/ld: rmt.o: in function `main':
> /home/root/buildtest/cpio-2.13/rmt/rmt.c:780:(.text.startup+0x170): undef=
ined reference to `error'
> /usr/lib/gcc/i686-poky-linux-musl/13.2.0/../../../../i686-poky-linux-musl=
/bin/ld: /home/root/buildtest/cpio-2.13/rmt/rmt.c:783:(.text.startup+0x7af)=
: undefined reference to `error'
> collect2: error: ld returned 1 exit status
> make[2]: Leaving directory '/home/root/buildtest/cpio-2.13/rmt'
> make[2]: *** [Makefile:1221: rmt] Error 1
> make[1]: *** [Makefile:1282: all-recursive] Error 1
> make[1]: Leaving directory '/home/root/buildtest/cpio-2.13'
> make: *** [Makefile:1222: all] Error 2
>
>


Please cherry-pick -
https://patchwork.yoctoproject.org/project/oe-core/patch/20230923073100.851=
867-1-raj.khem@gmail.com/
on top

>
> On 22/09/2023 14:05:04-0700, Khem Raj wrote:
> > Brings following bug fixes
> >
> > * 79bdacff glob: fix wrong return code when aborting before any matches
> > * 7291c6c6 statvfs: allocate spare for f_type
> > * 39e43f08 math: fix ld80 powl(x,huge) and powl(LDBL_MAX,small)
> > * 6d101027 math: fix ld80 acoshl(x) for x < 0
> >
> > Drop MIRRORS and switch to etalabs.net for git fetch URI
> > original repo is not working correcting with git Fetcher
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v3: Update SRC_URI to fetchable location
> >
> >  meta/recipes-core/musl/musl_git.bb | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/mus=
l/musl_git.bb
> > index 4a4fe978f93..7dd949ffafd 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -4,21 +4,17 @@
> >  require musl.inc
> >  inherit linuxloader
> >
> > -SRCREV =3D "83b858f83b658bd34eca5d8ad4d145f673ae7e5e"
> > +SRCREV =3D "79bdacff83a6bd5b70ff5ae5eb8b6de82c2f7c30"
> >
> >  BASEVER =3D "1.2.4"
> >
> >  PV =3D "${BASEVER}+git"
> >
> > -# mirror is at git://github.com/kraj/musl.git
> > -
> > -SRC_URI =3D "git://git.musl-libc.org/git/musl.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> > +SRC_URI =3D "git://git.etalabs.net/git/musl;branch=3Dmaster;protocol=
=3Dhttps \
> >             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.=
patch \
> >             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes=
-to-l.patch \
> >            "
> >
> > -MIRRORS +=3D "git://git.musl-libc.org/git/musl.git git://github.com/kr=
aj/musl.git"
> > -
> >  S =3D "${WORKDIR}/git"
> >
> >  PROVIDES +=3D "virtual/libc virtual/libiconv virtual/libintl virtual/c=
rypt"
> > --
> > 2.42.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#188133): https://lists.openembedded.org/g/openembed=
ded-core/message/188133
> > Mute This Topic: https://lists.openembedded.org/mt/101529915/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

