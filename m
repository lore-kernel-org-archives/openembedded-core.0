Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 75D3B6BC09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 07:24:23 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so2746675ead.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 00:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RFeEdbrS6XWf34PAbCtKe02711qAtH5JPV7kHN3vRAs=;
	b=VRLO9tCXFAK//tW2zWZtC/p/rQqr1RrBP3413bzCZvE7ifnKsGVR0qVx5oBypLkel1
	WjoW2QLSe93Nhqye4DN0W86g1ZB7irEf9cC5DkCoICnlRnFOVItbcdMduoxok5xm7eLn
	PnnCuyBbTi7nI2c9+OZbii0mf1C7jsDcMy7fms98ZbOlh5oZKqiAr8u1pbcVE936VOlp
	wzGRxtPKd+r1PgTFXpYJiJgF0apunVFlCqogOJ8vFKp0pSF5/gf2I8FDYurb2d+lUMha
	/NJmoz4YUst4yqfxHOKE9eUxzeWnCmfeepWGMNEKqgU7ka9g5qONkcunTl6NfcCE3z2a
	b0bw==
X-Received: by 10.14.122.132 with SMTP id t4mr41599464eeh.20.1377674663289;
	Wed, 28 Aug 2013 00:24:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm34853417eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 00:24:22 -0700 (PDT)
Date: Wed, 28 Aug 2013 09:25:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130828072534.GD3544@jama>
References: <1377671501-19842-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1377671501-19842-1-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mirdori: use BPN instead of PN
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
X-List-Received-Date: Wed, 28 Aug 2013 07:24:26 -0000
X-Groupsio-MsgNum: 44176
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jPJw4wSVUvI9Tm/b"
Content-Disposition: inline

--jPJw4wSVUvI9Tm/b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 11:31:41PM -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Small typo in subject.
> ---
>  meta/recipes-sato/midori/midori_0.5.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-sato/midori/midori_0.5.5.bb b/meta/recipes-sato=
/midori/midori_0.5.5.bb
> index e545753..32bfcb6 100644
> --- a/meta/recipes-sato/midori/midori_0.5.5.bb
> +++ b/meta/recipes-sato/midori/midori_0.5.5.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
>  DEPENDS =3D "webkit-gtk libsoup-2.4 openssl python-native python-docutil=
s-native librsvg-native libnotify libunique"
> =20
> -SRC_URI =3D "http://www.midori-browser.org/downloads/${PN}_${PV}_all_.ta=
r.bz2 \
> +SRC_URI =3D "http://www.midori-browser.org/downloads/${BPN}_${PV}_all_.t=
ar.bz2 \
>  "
> =20
>  SRC_URI[md5sum] =3D "b99e87d4b73a4732ed1c1e591f0242ac"
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jPJw4wSVUvI9Tm/b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIdpe4ACgkQN1Ujt2V2gBz+4ACguP8DWamh/ldYsjeufSjpxoiL
0zoAnjBMx3wDvAXUvP4edABek7e22CP9
=y7+F
-----END PGP SIGNATURE-----

--jPJw4wSVUvI9Tm/b--
