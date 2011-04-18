Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QBjSZ-000420-18
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:05:27 +0200
Received: by wye20 with SMTP id 20so4084329wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:03:06 -0700 (PDT)
Received: by 10.227.163.133 with SMTP id a5mr4591178wby.73.1303113786777;
	Mon, 18 Apr 2011 01:03:06 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	y29sm3088658wbd.21.2011.04.18.01.03.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:03:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <722785c0fb32db53c7499ed71fd2784accf996c4.1303113405.git.Martin.Jansa@gmail.com>
Date: Mon, 18 Apr 2011 10:03:05 +0200
Message-Id: <F7021822-B24C-446D-9A4E-8B1F7DAD9791@dominion.thruhere.net>
References: <cover.1303113405.git.Martin.Jansa@gmail.com>
	<722785c0fb32db53c7499ed71fd2784accf996c4.1303113405.git.Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/4] xf86-video-omapfb: add SRCREV to recipe
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
X-List-Received-Date: Mon, 18 Apr 2011 08:05:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr 2011, om 10:00 heeft Martin Jansa het volgende geschreven:

> * taken from meta/conf/distro/include/poky-default-revisions.inc for
>  those who want xf86-video-omapfb and are not using poky

Use the one in meta-oe :)

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
> 1.7.5.rc1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



