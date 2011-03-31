Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q5FY6-0002MT-2D
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 12:56:22 +0200
Received: by wye20 with SMTP id 20so2063221wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:54:10 -0700 (PDT)
Received: by 10.227.200.138 with SMTP id ew10mr2544636wbb.21.1301568424816;
	Thu, 31 Mar 2011 03:47:04 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id z13sm568305wbd.63.2011.03.31.03.47.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:47:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5beeeef8dc370f7238938edb4fcf0b617b856daa.1301567822.git.Martin.Jansa@gmail.com>
Date: Thu, 31 Mar 2011 12:47:03 +0200
Message-Id: <5BB7067B-8090-4880-BB51-510F4A05A3C6@dominion.thruhere.net>
References: <cover.1301567822.git.Martin.Jansa@gmail.com>
	<5beeeef8dc370f7238938edb4fcf0b617b856daa.1301567822.git.Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/3] xf86-video-omapfb: add SRCREV to recipe
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
X-List-Received-Date: Thu, 31 Mar 2011 10:56:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

FWIW, meta-oe has a recipe that has actually been tested on real =
hardware: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-openembedded/tr=
ee/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb



Op 31 mrt 2011, om 12:40 heeft Martin Jansa het volgende geschreven:

> * taken from meta/conf/distro/include/poky-default-revisions.inc for
>  those who want xf86-video-omapfb and are not using poky
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> .../xorg-driver/xf86-video-omapfb_git.bb           |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git =
a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb =
b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> index 2714786..5281665 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> @@ -13,6 +13,7 @@ PE =3D "1"
> PR =3D "r1"
> PV =3D "0.1.1+git${SRCPV}"
>=20
> +SRCREV =3D "044617665d6737f4909aab96f91b06261dff05d2"
> SRC_URI =3D "git://git.pingu.fi/xf86-video-omapfb.git;protocol=3Dhttp =
\
>             file://omap-revert-set-CRTC-limit.patch \
>             file://omap-revert-set-virtual-size.patch \
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



