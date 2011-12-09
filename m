Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYvbI-0002xR-9z
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 09:14:36 +0100
Received: by eekb15 with SMTP id b15so1429014eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 00:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cIqmz57Uke+HbczLJ49P5QJNQGOX/vHXTmGpMSX6UUM=;
	b=eev7mZq0I9D4zDjv9uBlyeKL0g1BgUYuvPA+X1mTE+ByF19SwrnBF/DBMnbYivLl+W
	mIMOxkzN2cUKJ21jNie/8JiNcKUTm2E95tKDI0UDfMHosTY50VYdQE4UtAz8phtOCbdR
	iE+3xnQiEckEn2T7odRXdIxD7gwepI1xwm4Uk=
Received: by 10.14.17.155 with SMTP id j27mr648355eej.195.1323418065688;
	Fri, 09 Dec 2011 00:07:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm28148491eej.3.2011.12.09.00.07.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 00:07:44 -0800 (PST)
Date: Fri, 9 Dec 2011 09:07:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111209080731.GB3848@jama.jama.net>
References: <1323415475-21361-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20111209075504.GA4082@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20111209075504.GA4082@ad.chargestorm.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] u-boot: renamed dir from uboot to the more appropriate u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 08:14:36 -0000
X-Groupsio-MsgNum: 13919
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline

--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2011 at 08:55:05AM +0100, Anders Darander wrote:
> * Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [111209 08:25]:
>=20
> > recipe dirs normally have the name of the (main) package and the offici=
al name is u-boot
>=20
> From this I guess that there aren't any other changes in the patch,
> apart from the renames?
>=20
> Next time, could you add '-M' to `git format-patch`, to make git detect
> renames? That results in smaller and easier to review patches.

Just because of "Coordinating inter-layer dependencies" thread I have to
say, that this will break parsing for people using ie meta-openmoko and
meta-nokia BSP layers:

meta-nokia/recipes-bsp/uboot/u-boot_git.bb:require recipes-bsp/uboot/u-boot=
=2Einc
meta-openmoko/recipes-bsp/uboot/u-boot_git.bb:require recipes-bsp/uboot/u-b=
oot.inc

But I'll try to update meta-smartphone layers as soon as this change is
applied in oe-core..

meta-ti is already using recipes-bsp/u-boot so I guess it's worth
renaming.

Cheers,

>=20
> > Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> > ---
> >  .../u-boot/files/fix-arm920t-eabi.patch            |   22 +++++
> >  ...Drop-config.h-include-in-tools-imximage.h.patch |   39 +++++++++
> >  ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ++++++++++++=
++++++++
> >  ...Drop-config.h-include-in-tools-imximage.h.patch |   39 +++++++++
> >  ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ++++++++++++=
++++++++
> >  meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  |   31 ++++++++
> >  meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  |   29 +++++++
> >  meta/recipes-bsp/u-boot/u-boot.inc                 |   50 ++++++++++++
> >  meta/recipes-bsp/u-boot/u-boot_2011.03.bb          |   26 ++++++
> >  meta/recipes-bsp/u-boot/u-boot_2011.06.bb          |   26 ++++++
> >  .../recipes-bsp/uboot/files/fix-arm920t-eabi.patch |   22 -----
> >  ...Drop-config.h-include-in-tools-imximage.h.patch |   39 ---------
> >  ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ------------=
--------
> >  ...Drop-config.h-include-in-tools-imximage.h.patch |   39 ---------
> >  ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ------------=
--------
> >  meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb   |   31 --------
> >  meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb   |   29 -------
> >  meta/recipes-bsp/uboot/u-boot.inc                  |   50 ------------
> >  meta/recipes-bsp/uboot/u-boot_2011.03.bb           |   26 ------
> >  meta/recipes-bsp/uboot/u-boot_2011.06.bb           |   26 ------
> >  20 files changed, 426 insertions(+), 426 deletions(-)
>=20
> --=20
> Anders Darander
> ChargeStorm AB / eStorm AB
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7hwcMACgkQN1Ujt2V2gBx45gCdFOLFo5VF7GH55z8lgGK1rtc6
PrMAn3TX2Abjay190q1CENeTRXZg4FjH
=CBZG
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
