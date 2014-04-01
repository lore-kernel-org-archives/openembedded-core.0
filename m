Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id D54B36F956
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:47:21 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id z2so3108386wiv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=blR/HXwCkgA9vuO/9AVji2Z2FyVg7y0OuwEDVwLOEJ4=;
	b=tx8HgK50r8umn7kVWnfH7yi3upJ7g2lyLOONEvoZT3z8Ry7K+lsAR9FkRYrJo0ObyY
	6NllbmD0Uqkxge56gtccSRRi/fKc7lAr+KflD5+CgR0WGsCNmXfGD3tlNvNSEKZltSdU
	83VW9yBtCw8LKzsAPIiFTU2bifm+7K7x3jST/k+JT1pASasx80yqmtSo9ZacsORZZbRy
	Uw9N0i3Yko+mCDeGvo9CbWHma0donpGV/NNDrxrbmXAsspgRbuObEH5YNSpjibXfJ2My
	ClCkm6FB6m5W84OIP5adG/JsjosmTPW53aI2VpttJvaaxI1ZmSNntw9YTbUnw25HtxA8
	S5oA==
X-Received: by 10.180.39.173 with SMTP id q13mr1580155wik.26.1396349242585;
	Tue, 01 Apr 2014 03:47:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm39681129eew.25.2014.04.01.03.47.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 03:47:20 -0700 (PDT)
Date: Tue, 1 Apr 2014 12:47:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
Message-ID: <20140401104720.GK2425@jama>
References: <1396347400-9699-1-git-send-email-florin.sarbu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1396347400-9699-1-git-send-email-florin.sarbu@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpcap.inc: Add PACKAGECONFIG support for bluez
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 10:47:23 -0000
X-Groupsio-MsgNum: 52005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vJI8q/aziP9idhqk"
Content-Disposition: inline

--vJI8q/aziP9idhqk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 01:16:40PM +0300, Florin Sarbu wrote:
> This patch adds support for having bluez5 in PACKAGECONFIG
> and get libpcap DEPEND on bluez5.
>=20
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> ---
>  meta/recipes-connectivity/libpcap/libpcap.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes=
-connectivity/libpcap/libpcap.inc
> index a984e05..1613567 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> @@ -10,8 +10,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d4b03665579=
51c84a94fabe3529f867 \
>                      file://pcap.h;beginline=3D1;endline=3D34;md5=3D8d6cf=
7e17d5745010d633e30bc529ea9"
>  DEPENDS =3D "flex-native bison-native libnl"
> =20
> -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'b=
luetooth', '', d)}"
> -PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth,--disable-bluetooth,blu=
ez4"
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'b=
luez4', '', d)}"
> +PACKAGECONFIG[bluez4] =3D "--enable-bluetooth,--disable-bluetooth,bluez4"
> +PACKAGECONFIG[bluez5] =3D "--enable-bluetooth,--disable-bluetooth,bluez5"

Does it work correctly?

If you don't enable both you will always get at least one
--disable-bluetooth and depending on order how packageconfigs were
processed it will be disabled or not.

>  PACKAGECONFIG[canusb] =3D "--enable-canusb,--enable-canusb=3Dno,libusb"
>  PACKAGECONFIG[libnl1] =3D "--with-libnl,--without-libnl,libnl1,libnl1"
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vJI8q/aziP9idhqk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM6mTgACgkQN1Ujt2V2gByIbQCeNDbs2TOUHJzGg+xQJU47A9cx
ZFcAmwbKSXhJWIjTkW/viujeeQY2ip6l
=ftJw
-----END PGP SIGNATURE-----

--vJI8q/aziP9idhqk--
