Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6F5C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 08:34:24 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web12.5062.1654072463381280071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 01:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.194,
 mailfrom: marcel@ziswiler.com)
Received: from [10.10.1.194] ([81.221.243.92]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MfHtf-1nKGIa0CQV-00gsEL;
 Wed, 01 Jun 2022 10:34:19 +0200
Message-ID: <b448e78d04ef6dda6cfb2b974b5b5b7f8b7c3981.camel@ziswiler.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use
 aaf config for alsa-plugins
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Peter Bergin
	 <peter@berginkonsult.se>
Date: Wed, 01 Jun 2022 10:34:17 +0200
In-Reply-To: 
 <CANNYZj8QZH-PyopuyQ8oo8mL7K96Jh=3-659zL=B+LvT8HWAug@mail.gmail.com>
References: <20220531213206.7119-1-marcel@ziswiler.com>
	 <20220531213206.7119-2-marcel@ziswiler.com>
	 <CANNYZj8xMEOqAPXBuP4oPonqDsJWUK8G6ExRwmT=7zkTQJp1rg@mail.gmail.com>
	 <ab46486dd45aaedcfd1d00817e403572ef0b64d9.camel@ziswiler.com>
	 <CANNYZj8QZH-PyopuyQ8oo8mL7K96Jh=3-659zL=B+LvT8HWAug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (by Flathub.org)) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:qJgeePu/SxtevVY7reOFZayapEmzpzzTb4wgsF+T99s0tYQDzto
 0a8WUnQFlT2Ks0nA5hlG4Jk3zPLE7y5M59qk80bReV8xjibvNjALeujPqVIdsXu6qHneC6I
 vgFQuTTzzUkcV5buy32bXBlIfE4DszyCTeIAXPMzzyJsDPmEsU3wRDwTM/2F2fgaiLIqxx1
 NnQoTB109NETtDh07WYwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m516uPLJKw4=:NI1AN5SRV2Nj+ZAgz0ij+d
 ANePFjlg0d1/RMUnfoBujPYzbH+TJib7bz7l/OKFYZBtYdNTX2q79ZkLQbKDSKt5gfKXvJXdL
 FWiSWuYRBYCbkapkEtEBkBQv5RPiX1Y2GBDsBbshzns6Zr8B+dqGNb4iFIO6f4dTkR4LbKaNe
 RMDINphJvVKsQov5tO2j0yg/O4tR3FfGc8mkK580+P7Q4wE0jbtQinOAf216ARvmRHS5K0mhk
 7rNbaGuQeXmpcWOQx+BLyv1j6wKdqwerVlt561YTbg/OyaVC1mblDgoIHxD5yo02VI5AHmcGA
 elWNXzQ33suRDqOpAtuvCOJ9Hz5WyR6R+ev+HiK6VBDVWTS4UXHPvp0F/lGb4X9wBBb2FuCuD
 iYTyoK4HwYQUDfqY0QCOdYssFiio8p36vXcrO9tUYR2ImJhg3PBRwg2/cALNFqCWcMhhp3VAU
 xOHrf8tg9cvydTdUgXGnEMWHFaaaWo9vGe2VV+hykuJWCWg2beTFYIWkegnhEIOEE16SZ/hxP
 ZhFtVIUZuf7X1m7O+e+VJLF6QoPy/+g0/13s62quasau55r6S6m0+/O0G81Gqi0RTdz3POTPS
 bXkMmK8MoLJ8Jn7CAW1o3E+ueISLv5cyyeGGQJt+2jVzUbgr5jZ2K18YOfUMTierrTxtF6SKg
 OI7HKq8/ScpHXYd9IHkNijR9NzTyAiaEDfExMV0jk+wnj42cO89u9ef/ri9SDqbzrWdDiCN9U
 FUVbWfAtC3ig8EqDxYF9Wko1yMRLT6M86o6mJw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 08:34:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166366

On Wed, 2022-06-01 at 10:22 +0200, Alexander Kanavin wrote:
> As long as the dependency is optional and controlled via PACKAGECONFIG
> and off by default, the recipe does not have to be in core, and we
> have plenty of examples of similar arrangements.

Understood and agreed. Let me move it.

Still waiting on the resolution of the git hash tag vs. PV download dilemma=
 though...

Thanks!

> Alex

Cheers

Marcel

> On Wed, 1 Jun 2022 at 10:05, Marcel Ziswiler <marcel@ziswiler.com> wrote:
> >=20
> > On Wed, 2022-06-01 at 09:30 +0200, Alexander Kanavin wrote:
> > > This should go to meta-oe I think. Does it have to be in core, and if=
 so why?
> >=20
> > Good question. However, alsa-plugins (and gstreamer1.0-plugins-bad for =
that matter) also live there and may
> > depend on it.
> >=20
> > > Alex
> >=20
> > Cheers
> >=20
> > Marcel
> >=20
> > > On Tue, 31 May 2022 at 23:32, Marcel Ziswiler <marcel@ziswiler.com> w=
rote:
> > > >=20
> > > > From: Peter Bergin <peter@berginkonsult.se>
> > > >=20
> > > > In order to enable configuration option aaf (AVTP Audio Format)
> > > > used for AVB the library libavtp is a dependency but no recipe for
> > > > this library was present. aaf support for alsa-plugins was
> > > > introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> > > >=20
> > > > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > >=20
> > > > ---
> > > > Resurrect from mailing list [1] as this is still not upstream.
> > > > End-to-end tested on Verdin iMX8M Plus.
> > > > Will talk about it at the Embedded World Conference in the TSN & Li=
nux
> > > > track next month [2].
> > > >=20
> > > > [1] https://lore.kernel.org/all/20210604090216.553285-1-peter@bergi=
nkonsult.se/
> > > > [2] https://events.weka-fachmedien.de/embedded-world-conference/pro=
gram/
> > > >=20
> > > > Changes in v3:
> > > > - Rename recipe to officially released PV of 0.2.0.
> > > > - Drop PROVIDES of avtp which just works around alsa-plugins referi=
ng to
> > > > =C2=A0 it as such instead of libavtp. Will update PACKAGECONFIG in
> > > > =C2=A0 alsa-plugins instead.
> > > >=20
> > > > Changes in v2:
> > > > - Updated SRC_URI specifying mandatory protocol as https.
> > > > - Updated SRCREV to latest.
> > > >=20
> > > > =C2=A0meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb | 14 +++++++=
+++++++
> > > > =C2=A01 file changed, 14 insertions(+)
> > > > =C2=A0create mode 100644 meta/recipes-multimedia/libavtp/libavtp_0.=
2.0.bb
> > > >=20
> > > > diff --git a/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/met=
a/recipes-
> > > > multimedia/libavtp/libavtp_0.2.0.bb
> > > > new file mode 100644
> > > > index 0000000000..563debde3c
> > > > --- /dev/null
> > > > +++ b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> > > > @@ -0,0 +1,14 @@
> > > > +DESCRIPTION =3D "Open source implementation of Audio Video Transpo=
rt Protocol (AVTP) \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 specified in IEEE 1722-2016 spec."
> > > > +HOMEPAGE =3D "https://github.com/Avnu/libavtp"
> > > > +LICENSE =3D "BSD-3-Clause"
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7fcb4331e23e45e171cd569=
3c1ff7d3e"
> > > > +
> > > > +SRC_URI =3D "git://github.com/Avnu/libavtp.git;branch=3Dv${PV};pro=
tocol=3Dhttps;nobranch=3D1"
> > > > +SRCREV =3D "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +inherit meson pkgconfig
> > > > +
> > > > +EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
> > > > --
> > > > 2.36.1
> > > >=20
> > > >=20
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#166338): https://lists.openembedded.org/g/opene=
mbedded-core/message/166338
> > > > Mute This Topic: https://lists.openembedded.org/mt/91462033/1686489
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub=C2=A0[alex.kanavin@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

