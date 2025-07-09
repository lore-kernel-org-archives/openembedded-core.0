Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C74C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 14:29:45 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.17348.1752071375944690689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 07:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=G6Ua88vX;
 spf=pass (domain: konsulko.com, ip: 209.85.210.45, mailfrom: trini@konsulko.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-735a6faec9eso3154418a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752071375; x=1752676175; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbv0FLfYsBpKSxgx/1/JhNmdJtyEXkq3lDaU8vSIu1A=;
        b=G6Ua88vXUquWRP1gDVwyHw86PunGfVLQMj2GuIBAHsN8HtvFjAAjpYVWCtlA9awjhV
         BtRG1x9vBdLoD3/e2B386TFhYlo/fmfIXXOvNu5/T6YN8hmwVTVvNyVROVH0FiVJy21w
         aDMu8SiosdYlS1798o6wYyXAR3SUZw6jok9lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071375; x=1752676175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbv0FLfYsBpKSxgx/1/JhNmdJtyEXkq3lDaU8vSIu1A=;
        b=fGMGhvPIqgeS4oXFc+XoqGVguVbJLHr8mElJMKzM3vcTvlsPra5SSSK25YyZD4c28C
         acYiLIY+/P5MBI77oJEidhw/Nza/Apf/dNYw/oUgf1qYn1CRqVhJSiPmMX/LKGHupAWI
         N9HC70J6o8pv0vU6tgAmvShj3MdPrFP5dRAZcus/JXWLj1JmzqBJ/1awdDuNInbAr7EI
         V9X+S0oGdIAVlcgnVzEtlQhWhx7kSPOARMj9fVsmdMP9WGgfHsMhkbR7Qem+8R21QCPu
         v4rvUM76moix88z3uS03cSXRyvi2A151qqGmIMSMOcw064ftIkNPxxVdZWDMG3ItSd0q
         xKBg==
X-Forwarded-Encrypted: i=1; AJvYcCXASUW31Ou/qGkS9y+m12QVLMKV2a/wRNxIyzYKweP1vF67emMheVfVDdNwT73PzT+SUIEcT1Q1Qhdbwp1W+nYR5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4xqG/lrnsrVfeHO2CC2aJfmLqDk9Lovq5Kqf1I5EpqRaAaI4N
	838kgoMV9ooPVp4z6f/radFpVm52lMPfmRtaQUbo9w1sRB0SkezIgWjx6OhsjzzMVOg=
X-Gm-Gg: ASbGncvzwMU+dJ8rD+Yl3HdVfe2iWyB/tSXZ0CxtGsnErfZ7M2ZTyaq5c+gSsz6zsnV
	b0jMR2KQme1mwFF8DWp5rge/oEhG/ZE/jyo+GskUM8T5fNvKA1pPL5FhqyYJ46aNIi5H2T6Whx+
	KOngRCcjRdcxBB9z1mUeiQVGTGEumIW7+QFht6WtGznnIyytEEpsJwAqsjtGYR7FiYFLRJvXHH+
	kYPcwYbfziKdQAQIOuFDx2Z+IIYizTBX6OVtHvVMCDxWcNbgtKYOHL10ngbKX3TViVtb1LDAdM2
	mbKt8sEwiuLP/NeVaM6r1C6crS64649eZzcTP85S8aYNvdtUKu5to8/gmdBhLcrfW25ZlFKQ1K8
	KTMxDj9PuwKRy4PpIcE9O
X-Google-Smtp-Source: AGHT+IF4oESMYif8yMuFOEtpWTlSdj+BKMKCJECJm4oyd0BqD/relO1p46fKveyxpfOJ41yNoe7m8A==
X-Received: by 2002:a05:6830:aca:b0:73b:2751:eee2 with SMTP id 46e09a7af769-73cee023350mr115051a34.23.1752071374906;
        Wed, 09 Jul 2025 07:29:34 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73c9f961747sm2408078a34.58.2025.07.09.07.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:29:34 -0700 (PDT)
Date: Wed, 9 Jul 2025 08:29:32 -0600
From: Tom Rini <trini@konsulko.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	adrian.freihofer@siemens.com, Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
Message-ID: <20250709142932.GW6424@bill-the-cat>
References: <20250708012959.77522-1-festevam@gmail.com>
 <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
 <CAOMZO5BJBc0E0EfejEPmVdGBZiQrrvRWsHhy0Bxgi+jx6WiYRQ@mail.gmail.com>
 <20250708175732.GU6424@bill-the-cat>
 <DB7DN2I98ZYX.3V9C86PS14M9B@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WrsI65UlRukgNw7O"
Content-Disposition: inline
In-Reply-To: <DB7DN2I98ZYX.3V9C86PS14M9B@bootlin.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 14:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220089


--WrsI65UlRukgNw7O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 10:21:34AM +0200, Mathieu Dubois-Briand wrote:
> On Tue Jul 8, 2025 at 7:57 PM CEST, Tom Rini wrote:
> > On Tue, Jul 08, 2025 at 02:04:15PM -0300, Fabio Estevam wrote:
> >> Hi Mathieu,
> >>=20
> >> On Tue, Jul 8, 2025 at 9:37=E2=80=AFAM Mathieu Dubois-Briand
> >> <mathieu.dubois-briand@bootlin.com> wrote:
> >> >
> >> > On Tue Jul 8, 2025 at 3:29 AM CEST, Fabio Estevam via lists.openembe=
dded.org wrote:
> >> > > Upgrade to U-Boot 2025.07.
> >> > >
> >> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> >> > > ---
> >> >
> >> > Hi Fabio,
> >> >
> >> > Thanks for your patch.
> >> >
> >> > It looks like this is breaking selftests on the autobuilder:
> >> >
> >> > 2025-07-08 07:43:52,116 - oe-selftest - INFO - fitimage.UBootFitImag=
eTests.test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
> >> > 2025-07-08 07:43:52,118 - oe-selftest - INFO -  ... FAIL
> >> > ...
> >> > ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
> >> > ...
> >> > | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No =
such file or directory
> >> >
> >> >
> >> > Both on debian and armhost:
> >> >
> >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1=
923
> >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2=
077
> >> >
> >> > Can you have a look at these failures please?
> >>=20
> >> Thanks for the report.
> >>=20
> >> I am adding some folks on CC in case they have some ideas.
> >
> > Interesting. How can we trigger that outside of the autobuilder?
>=20
> Hi,
>=20
> It's not so easy to reproduce, as it looks like it is somehow linked
> with the host environment: this have been failing on debian workers but
> not on the fedora ones.
> So basic instructions are below, but this was not enough to reproduce it
> in the ubuntu 24.4 docker I've been using so far.
>=20
> git clone git://git.yoctoproject.org/poky-ci-archive -b autobuilder.yocto=
project.org/valkyrie/a-full-1972
> cd poky-ci-archive
> . oe-init-build-env
>=20
> Add following lines in conf/local.conf (I bet only the last one is
> really needed, but let's try to be as close as possible as the
> autobuilder configuration):
> MACHINE =3D "qemux86-64"
> DISTRO =3D "poky"
> SDKMACHINE =3D "x86_64"
> PACKAGE_CLASSES =3D "package_rpm"
> RPM_GPG_SIGN_CHUNK =3D '1'
> IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
> SANITY_TESTED_DISTROS =3D ''
>=20
> Add poky-ci-archive/meta-selftest in conf/bblayers.conf.
>=20
> And finally, run the tests:
> oe-selftest -r fitimage.UBootFitImageTests.test_sign_cascaded_uboot_fit_i=
mage
> oe-selftest -r fitimage.UBootFitImageTests.test_sign_standalone_uboot_atf=
_tee_fit_image

Yeah, looking at the logs it's not even Debian, it's Ubuntu 22.04, which
is what we use for our CI too. I guess I would suggest bisect'ing with
the autobuilder until finding out what commit breaks and then someone
=66rom the U-Boot side of things can chime in.

--=20
Tom

--WrsI65UlRukgNw7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmhufMgACgkQFHw5/5Y0
tyyxfwv/Z2vR5+szhMTIH5EYk3eipfwuJGVm4UosvvI7kvtH7daNY32pEgwgQaOZ
0NKLkL6nZ+pRrYviMK3EA6W/hw/vwqM+e8NbhwC5+GcFMjGEAjfsIuw6v6Chn05B
AG+qoARg+31BXhIdY9+RPVAdCGO1oe8yOCw31TX7/wgiyFaYfBXaPKPlrxOg8ir4
3xPbjryEnwzbpEPvcXd2kT3ggNzUZFeCt6noONjIJ/HPpIHubPHTAFdjj6Z8g/wq
0vttmJUQsT61A1joHOy+Aot2pN+42oZAOAR/qgipUGoUmrBPkDSm5t1zmepxUdfa
rf/EChOBZ4oB4DLOZvZ0hFch8L9pp92Py9ydXR53L7P3MS1FTjGVIdtMwOiuefDh
jM4Z/LGp/38fQeut4wrcEeLjxk6CCi17HYsNXxg5psttGPr0nSsxJHbAzGCHbNjY
VE/cgGTerI1zSd+yRBtAQwcZpqTIk2anVHH986Hrf3R6RCbIOBxV012QCEfbOHFo
j70p5Qur
=KGLE
-----END PGP SIGNATURE-----

--WrsI65UlRukgNw7O--

