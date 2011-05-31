Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRO5P-0001hA-Oh
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 14:30:16 +0200
Received: by wwb17 with SMTP id 17so4112480wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 05:26:59 -0700 (PDT)
Received: by 10.216.144.166 with SMTP id n38mr3498484wej.75.1306844817365;
	Tue, 31 May 2011 05:26:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ej7sm13469wbb.19.2011.05.31.05.26.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 05:26:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306844141.27470.360.camel@rex>
Date: Tue, 31 May 2011 14:26:54 +0200
Message-Id: <4F2950C9-0608-4BA7-A4C1-392C3DFB8DD4@dominion.thruhere.net>
References: <1306844141.27470.360.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: "all" architecture packages
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
X-List-Received-Date: Tue, 31 May 2011 12:30:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 mei 2011, om 14:15 heeft Richard Purdie het volgende geschreven:

> Hi,
>=20
> There have been various comments on the list and in the bugzilla about
> issues with "all" architecture recipes.
>=20
> To start cleaning this up I've merged:
>=20
> =
http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=3D26e5e5=
feb695864b11e47e24017e254c28f14494
>=20
> which creates an "allarch" class and starts to convert some recipes =
over
> to using it. There is further information in the commit message. Use =
of
> the class ensures the packages really are suitable for all =
architectures
> and that the sstate packages are reusable.
>=20
> The list of packages which still need attention are:
>=20
> meta/recipes-connectivity/resolvconf/resolvconf_1.48.bb                =
=20
> meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc =
=20
> meta/recipes-gnome/gnome/gnome-common_2.28.0.bb                        =
=20
> meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb                    =
=20
> meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb       =
=20
> meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb               =
=20
> meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb               =
=20
> meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb             =
=20
> =
meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_=
0.1.1.bb
> meta/recipes-graphics/xorg-font/encodings_1.0.4.bb                     =
=20
> meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb                    =
=20
> meta/recipes-graphics/xorg-font/font-util_1.2.0.bb                     =
=20
> meta/recipes-graphics/xorg-font/xorg-font-common.inc                   =
=20
> meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb                  =
=20
> meta/recipes-kernel/linux-firmware/linux-firmware_git.bb               =
=20
> meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc                  =
=20
> meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb             =
=20
> meta/recipes-support/hal/hal-info.inc                                  =
=20
>=20
> Some of these are easy, some trigger configure tests for the cross
> compiler and are harder to fix.
>=20
> If a package can't use allarch.bbclass, its a strong indicator it
> shouldn't be PACKAGE_ARCH =3D "all"...

What about recipes that have an arch component and noarch config files =
split out? A made-up example would be udev and udev-rules. Is it still =
possible to do PACKAGE_ARCH_udev-rules =3D "all" in the udev recipe?

regards,

Koen=


