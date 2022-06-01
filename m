Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F64DC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 08:05:14 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by mx.groups.io with SMTP id smtpd.web12.4889.1654070711763313470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 01:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.197,
 mailfrom: marcel@ziswiler.com)
Received: from [10.10.1.194] ([81.221.243.92]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MVdcm-1oLhzD1Ms0-00RVfM;
 Wed, 01 Jun 2022 10:05:07 +0200
Message-ID: <ab46486dd45aaedcfd1d00817e403572ef0b64d9.camel@ziswiler.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use
 aaf config for alsa-plugins
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Peter Bergin
	 <peter@berginkonsult.se>
Date: Wed, 01 Jun 2022 10:05:04 +0200
In-Reply-To: 
 <CANNYZj8xMEOqAPXBuP4oPonqDsJWUK8G6ExRwmT=7zkTQJp1rg@mail.gmail.com>
References: <20220531213206.7119-1-marcel@ziswiler.com>
	 <20220531213206.7119-2-marcel@ziswiler.com>
	 <CANNYZj8xMEOqAPXBuP4oPonqDsJWUK8G6ExRwmT=7zkTQJp1rg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (by Flathub.org)) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:UPBnutFSWQFxyujYeFxN1kzFt9kPs3ZSOlTSygeIzA6rO1L0SYO
 au0GqDxHqSJVCLBvZCgQhr5tSIBJdSKDg2J3Zf7jJwbt1p8ZGx1Q8pqAF152KuhQsWsKUby
 DB0/v8Ii3Olx+zuhqSvoRY6frjOdm+3FnKZFeZsiHuCAJh/iHpGOd7RSrHVsvp6TKd2ggcL
 iMURlf9D2EPmlNzSewJpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2RKWvt+ITnc=:mCfPVqH60OZ3axLhXqtIN8
 ckr6m/i4AfXEfp1zZldrvpYR4ojRXdQ6ZgNezwtoiK2illXbvRp8OURDMQjvuUzeNzeJqW+tY
 zIqt+r07e48wrE7YurnsxzHfcy3wI39gXj3bTPBEtj3JMsozHrJbebQMxC1Ej+3RCxj9L8+6m
 Poxt1E/DIfAhJidHSXpwbW2+h1wn7T8uzUmJo57Vo9ZBSPdz3knx2Oj7rxyneNBwSkXWDNjrb
 i7dqnR/yPhBWtmqomAkTGezh70mHygi7PWq0/R1zTK3m9qyXRzHM0b7UnaZESQLsaRxcG5DBo
 bMMbKnOXGQilBYHjhQ2hr4nL/kK6vcuGAviZfgxT8ouhwbpAwxy0Yn5rBdPvrCJ44bRjWFxQV
 qejv3ZP1vlwT0miZVI7l6fZOxVeqE9wHYZvKRCJKuEe0EgObT31R8esnW05dy0Rqkv4D2Ue2c
 l4OEZkCwcXaEiK9PcZXvcFj0rzmVh3ejUvVXKHQcD+6vTs7pQNlcNQ/+ezhNGzobZ0MakWouo
 LgfsR43QfGQgaG2ek/JSrNUGz6f7DJnVcTt8w0E1KJukSjrluBLSO8bfVHFoxpH6XjsYMobJo
 lyud+Quk64mRw+d552hD47kZa1thRXBqWquPyPB+gWBHmzSSEOymzFhZfZ3INQ6+lJv+uCeSj
 E+nau89bEe+FiOX1A4ZvNjraiXfGiabG0XS7s2xPetv1ONN02dhRRR49MEuya0MypgBslDmbP
 2Xe0HXdZAJmU0ytGJz2EbSQwmAZb/r1nJa++eA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 08:05:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166362

On Wed, 2022-06-01 at 09:30 +0200, Alexander Kanavin wrote:
> This should go to meta-oe I think. Does it have to be in core, and if so =
why?

Good question. However, alsa-plugins (and gstreamer1.0-plugins-bad for that=
 matter) also live there and may
depend on it.

> Alex

Cheers

Marcel

> On Tue, 31 May 2022 at 23:32, Marcel Ziswiler <marcel@ziswiler.com> wrote=
:
> >=20
> > From: Peter Bergin <peter@berginkonsult.se>
> >=20
> > In order to enable configuration option aaf (AVTP Audio Format)
> > used for AVB the library libavtp is a dependency but no recipe for
> > this library was present. aaf support for alsa-plugins was
> > introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> >=20
> > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >=20
> > ---
> > Resurrect from mailing list [1] as this is still not upstream.
> > End-to-end tested on Verdin iMX8M Plus.
> > Will talk about it at the Embedded World Conference in the TSN & Linux
> > track next month [2].
> >=20
> > [1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkon=
sult.se/
> > [2] https://events.weka-fachmedien.de/embedded-world-conference/program=
/
> >=20
> > Changes in v3:
> > - Rename recipe to officially released PV of 0.2.0.
> > - Drop PROVIDES of avtp which just works around alsa-plugins refering t=
o
> > =C2=A0 it as such instead of libavtp. Will update PACKAGECONFIG in
> > =C2=A0 alsa-plugins instead.
> >=20
> > Changes in v2:
> > - Updated SRC_URI specifying mandatory protocol as https.
> > - Updated SRCREV to latest.
> >=20
> > =C2=A0meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb | 14 +++++++++++=
+++
> > =C2=A01 file changed, 14 insertions(+)
> > =C2=A0create mode 100644 meta/recipes-multimedia/libavtp/libavtp_0.2.0.=
bb
> >=20
> > diff --git a/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/meta/re=
cipes-
> > multimedia/libavtp/libavtp_0.2.0.bb
> > new file mode 100644
> > index 0000000000..563debde3c
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> > @@ -0,0 +1,14 @@
> > +DESCRIPTION =3D "Open source implementation of Audio Video Transport P=
rotocol (AVTP) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 specified in IEEE 1722-2016 spec."
> > +HOMEPAGE =3D "https://github.com/Avnu/libavtp"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7fcb4331e23e45e171cd5693c1f=
f7d3e"
> > +
> > +SRC_URI =3D "git://github.com/Avnu/libavtp.git;branch=3Dv${PV};protoco=
l=3Dhttps;nobranch=3D1"
> > +SRCREV =3D "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit meson pkgconfig
> > +
> > +EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
> > --
> > 2.36.1
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#166338): https://lists.openembedded.org/g/openembed=
ded-core/message/166338
> > Mute This Topic: https://lists.openembedded.org/mt/91462033/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
=C2=A0[alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

