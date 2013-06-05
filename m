Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9594E6A56D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 09:30:40 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id z12so472288wgg.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iZ30pv50BqCiWeEAfSZokQDY/3ux/n3vEcOlGxIENYg=;
	b=EwvTmHHTBT+x69wV1xxnVCN9nk2ajTtPHFOUSpQsJW/UxrViqvj1ZkhoSS8MSrIgg2
	L9X9OaXMaOJEEMj+vLK8/HYBR8/y2Xi4oZGoInCMXLcYary1ea57LTIBeAfKkkocoEcV
	ydpfFjGdSmFUYze0w+0vUoQ/lsGnnjIdefyrKSrDl3+iVlRI7/aYUdtypV1H3KSilxaL
	863c1D4jmOiihkJYCp5ee+0WN2n2nbealBcAirfrQboTtQBF4KWvaZk1V3D4dDBTD0MX
	G9mXD9XkuJwsUtpIm0mOnkGo6NGB0MLMhsP54WVNq357aIKSnLcsZ9aQUTgR4LHbJVgq
	fE7A==
X-Received: by 10.194.238.42 with SMTP id vh10mr17364738wjc.28.1370424640525; 
	Wed, 05 Jun 2013 02:30:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id h8sm9037167wiz.9.2013.06.05.02.30.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 02:30:39 -0700 (PDT)
Date: Wed, 5 Jun 2013 11:30:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20130605093056.GD30727@jama>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1370422910-24366-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Wed, 05 Jun 2013 09:30:40 -0000
X-Groupsio-MsgNum: 40176
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline

--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
> qconfig.pri was not being loaded by qmake properly. This means Qt
> qmake projects are unable to query QT_ARCH, QT_VERSION and other
> variables defined in qconfig.pri.
>=20
> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
> so that it can be located by qmake.

There is such patch already:
http://lists.openembedded.org/pipermail/openembedded-core/2013-May/078314.h=
tml

>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/classes/qmake2.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
> index 5eebd8e..ca6b0f0 100644
> --- a/meta/classes/qmake2.bbclass
> +++ b/meta/classes/qmake2.bbclass
> @@ -22,3 +22,4 @@ export OE_QMAKE_LIBS_X11 =3D "-lXext -lX11 -lm"
>  export OE_QMAKE_LIBS_X11SM =3D "-lSM -lICE"
>  export OE_QMAKE_LRELEASE =3D "${STAGING_BINDIR_NATIVE}/lrelease4"
>  export OE_QMAKE_LUPDATE =3D "${STAGING_BINDIR_NATIVE}/lupdate4"
> +export OE_QMAKE_QT_CONFIG =3D "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pr=
i"
> --=20
> 1.8.2.3
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGvBVAACgkQN1Ujt2V2gBzaxACfVipM8D70yl3abLwXk0yroCFl
aTwAn0u4fs0AMnXlEgOmQ/pgKnoIataV
=J6qq
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
