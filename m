Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7DAEB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 09:25:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.103870.1692005105306869181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 02:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ABtEg6yZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe167d4a18so38040865e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 02:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692005103; x=1692609903;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Es6TvhAqXS4Axmw4QqTTMdPlTk3VOHFIGjzZmtcgCI=;
        b=ABtEg6yZMBvizrqjUlJp/d6ToQFbGOIq7A23/xQeEGdSgabO8Gu9SKmQds1cwLW80Z
         OK4TWNm4Nyu8hR/ADG/xXA4G+SIWZWjWBBdI5vbbFMDPWkh7GIwNIsAWhi5ceqQbcBte
         GqTuXAGPUKA9gyRWZP6eZEaGbsaNwNYmTDeOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692005103; x=1692609903;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Es6TvhAqXS4Axmw4QqTTMdPlTk3VOHFIGjzZmtcgCI=;
        b=iRc08ZL1xZnVYHiKzCk6YHYml0hdmBvCoykg8Mp2f4irmaDLOt/VlkkTuED+3cyx/5
         wdeYmbQn0jQGh2OsAMlrR6grBj8hypIUiON4P6d3kgU0urdWASaSQACNqo/F8ITF90R0
         mdYSjOPRx2tF0EA5fjd4cRgLz75d6OBlzcPo9jettKo5yspT5PjfEFmzGyp7FIzCPTpM
         Mj1diTBxy565loTYnwKYcgc/7Ugm6kc/H/n8yFcBlnS9ongmu0/IZIGogSDzbC23rSi8
         /Qlqfe67mogcSCGgjgLSrUaMBBJBXjQIPjjAd0CBGDO0YSW1vDbJnByK46ojUVOmn6zE
         zP6A==
X-Gm-Message-State: AOJu0YxA7zRRwfz4RhkGVA1KkOR/DU/dqM9Ohf3lka0f9VLtd41N2GI0
	pRjIfJcvtQoz2jlOWJ5MO5wLLA==
X-Google-Smtp-Source: AGHT+IEFZus6L+8X8Wl1sMrUtYR+SwHuL7zKMtBtEtd2drFKXd6M8fOEd9oktUnJ3FtX8M9cB6IAQA==
X-Received: by 2002:a05:600c:3789:b0:3fe:1c11:7788 with SMTP id o9-20020a05600c378900b003fe1c117788mr7407758wmr.33.1692005103111;
        Mon, 14 Aug 2023 02:25:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a? ([2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c210a00b003fc02e8ea68sm16568676wml.13.2023.08.14.02.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 02:25:02 -0700 (PDT)
Message-ID: <01211f8f8eafbda39b341638bcbbab9ab4edeba0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] qemu: Add qemu-common package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, "Yu, Mingli"
	 <mingli.yu@eng.windriver.com>, openembedded-core@lists.openembedded.org, 
	alexandre.belloni@bootlin.com
Date: Mon, 14 Aug 2023 10:25:02 +0100
In-Reply-To: <ad4d8e98-9163-700d-32b8-5d67b6b127a2@windriver.com>
References: <177296216FD9611D.22245@lists.openembedded.org>
	 <ad4d8e98-9163-700d-32b8-5d67b6b127a2@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185927

On Mon, 2023-08-14 at 17:19 +0800, Yu, Mingli wrote:
> Ping.

https://lists.openembedded.org/g/openembedded-core/message/184574

"""
So why not just add:

RRECOMMENDS:${PN} +=3D "${PN}-system-all ${PN}-user-all"

as I think we've then covered all the options we need?
"""

I still haven't seen an answer to this?

I don't like the fact we've messed this packaging around multiple times
and still don't seem clear on the problem(s) we're solving.

Cheers,

Richard


>=20
> Thanks,
>=20
> On 7/17/23 15:11, Yu, Mingli wrote:
> > From: Mingli Yu <mingli.yu@windriver.com>
> >=20
> > We split the qemu package [1] to add support to make user can install
> > one qemu arch emulation rpm to ease the concerns who care much about
> > the rpm size in embedded device.
> >=20
> > But for the user who only install the qemu-*.rpm can't do anything
> > except they install the qemu emulation rpm like qemu-system-x86-64-*.rp=
m
> > explicitly.
> >=20
> > So add qemu-common package to package all thing into qemu-common when
> > not split the package, and package only the basic into qemu-common and
> > other arch related to each qemu arch emulation rpm when split the packa=
ge
> > to fix the backward compatibility.
> >=20
> > qenu-*.rpm which is meta package rdepends on qemu-common and the availa=
ble
> > qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.
> >=20
> > [1] https://git.openembedded.org/openembedded-core/commit/?id=3D893846e=
ad7ee54d53e9076150cd655e0c8bca5db
> >=20
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >=20
> > v3->v4: remove the added native-sdk dependency.
> >=20
> >   meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
> >   meta/recipes-devtools/qemu/qemu_8.0.3.bb |  2 +-
> >   2 files changed, 13 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> > index 16581db69d..76560f454d 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -225,15 +225,18 @@ PACKAGECONFIG[brlapi] =3D "--enable-brlapi,--disa=
ble-brlapi"
> >   PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack,"
> >   PACKAGECONFIG[debuginfo] =3D "--enable-libdw,--disable-libdw,elfutils=
"
> >  =20
> > -INSANE_SKIP:${PN} =3D "arch"
> > +INSANE_SKIP:${PN}-common =3D "arch"
> >  =20
> >   FILES:${PN} +=3D "${datadir}/icons"
> >  =20
> >   # For user who want to install all arch packages
> > -PACKAGES =3D+ "${PN}-system-all ${PN}-user-all"
> > +PACKAGES =3D+ "${PN}-common"
> > +RDEPENDS:${PN} +=3D "${PN}-common"
> >  =20
> > -ALLOW_EMPTY:${PN}-system-all =3D "1"
> > -ALLOW_EMPTY:${PN}-user-all =3D "1"
> > +ALLOW_EMPTY:${PN} =3D "1"
> > +FILES:${PN} =3D ""
> > +
> > +FILES:${PN}-common =3D "${bindir}/* ${includedir}/* ${libexecdir}/* ${=
datadir}/* ${localstatedir}"
> >  =20
> >   PACKAGES_DYNAMIC +=3D "^${PN}-user-.*  ^${PN}-system-.*"
> >  =20
> > @@ -241,15 +244,13 @@ PACKAGESPLITFUNCS =3D+ "split_qemu_packages"
> >  =20
> >   python split_qemu_packages () {
> >       archdir =3D d.expand('${bindir}/')
> > -    syspackages =3D do_split_packages(d, archdir, r'^qemu-system-(.*)$=
', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=
=3DTrue)
> > -    if syspackages:
> > -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.joi=
n(syspackages))
> > +    subpackages =3D do_split_packages(d, archdir, r'^qemu-system-(.*)$=
', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=
=3DTrue, extra_depends=3D'${PN}-common')
> >  =20
> > -    userpackages =3D do_split_packages(d, archdir, r'^qemu-((?!system|=
edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU f=
ull user emulation binaries(%s)' , prepend=3DTrue)
> > -    if userpackages:
> > -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(=
userpackages))
> > +    subpackages +=3D do_split_packages(d, archdir, r'^qemu-((?!system|=
edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU f=
ull user emulation binaries(%s)' , prepend=3DTrue, extra_depends=3D'${PN}-c=
ommon')
> > +    if subpackages:
> > +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpa=
ckages))
> >       mipspackage =3D d.getVar('PN') + "-user-mips"
> > -    if mipspackage in ' '.join(userpackages):
> > +    if mipspackage in ' '.join(subpackages):
> >           d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREF=
IX") + 'bash')
> >   }
> >  =20
> > diff --git a/meta/recipes-devtools/qemu/qemu_8.0.3.bb b/meta/recipes-de=
vtools/qemu/qemu_8.0.3.bb
> > index 42e133967e..5d3c47c3b0 100644
> > --- a/meta/recipes-devtools/qemu/qemu_8.0.3.bb
> > +++ b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
> > @@ -8,7 +8,7 @@ DEPENDS:append:libc-musl =3D " libucontext"
> >  =20
> >   CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEG=
L_NO_X11=3D1', d)}"
> >  =20
> > -RDEPENDS:${PN}:class-target +=3D "bash"
> > +RDEPENDS:${PN}-common:class-target +=3D "bash"
> >  =20
> >   EXTRA_OECONF:append:class-target =3D " --target-list=3D${@get_qemu_ta=
rget_list(d)}"
> >   EXTRA_OECONF:append:class-target:mipsarcho32 =3D "${@bb.utils.contain=
s('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
> >=20
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184432): https://lists.openembedded.org/g/openembed=
ded-core/message/184432
> > Mute This Topic: https://lists.openembedded.org/mt/100190357/3618448
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mingli.yu@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20


