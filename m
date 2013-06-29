Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 79822612D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 12:14:55 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y10so2277924wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 05:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=stsYfFj2XNPBkTBpUDl5IIw1bfA3HLr8lYQmQjqMG38=;
	b=ESyqzguizdF0w/d6vLAyQI1h80uDIbYPLfXqFIRWyM+yIJoSn5eemQwurxUa8YzcKf
	u/VfW5pOlBHdxQv9+DhO3F2r0zkeuVA6B1iwmhLTmODSSFzHnb+LSwEY8zQQzJOzRXCq
	IlTQzBtY0OHfYxPes3sYpYZf9AIGORtjCgsAv+gPPwNrcU3eGbpTS+eIuwZyf6PYkgxf
	Z30mGqGRFCxC9BQsbAK4IGWXnIImFtJxCsSaisuOIEYeBUeAOYEUuLSU8Sds3VMH540W
	IEBS1M+313H1TY8rkubG0fWJqHuxf+RQaup4+9rGa6oA+qxQcEFp4yo0Z3BYUSpIRars
	zZPg==
X-Received: by 10.194.176.71 with SMTP id cg7mr13502600wjc.18.1372508095891;
	Sat, 29 Jun 2013 05:14:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm16708546eeu.2.2013.06.29.05.14.54 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 05:14:55 -0700 (PDT)
Date: Sat, 29 Jun 2013 14:15:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Wills Wang <wills.wang.open@gmail.com>
Message-ID: <20130629121536.GS3261@jama>
References: <CAC6FaqyMxgZP4ODaZiACA8qPBCNRZUAg=UV_WufTqe1hZkdUdw@mail.gmail.com>
	<CAC6FaqyHsqMPbvZa=gO4S8E+_ZyckNAvqe+X_O5cdJH5uYxexg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC6FaqyHsqMPbvZa=gO4S8E+_ZyckNAvqe+X_O5cdJH5uYxexg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4e: override variables OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Sat, 29 Jun 2013 12:14:55 -0000
X-Groupsio-MsgNum: 41195
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9uazBBczf8QSjDPd"
Content-Disposition: inline

--9uazBBczf8QSjDPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2013 at 08:12:51PM +0800, Wills Wang wrote:
> override variables OE_QMAKE_QT_CONFIG to compile Qt/Embedded apps

Thanks for forwarding it, btw it has extra line breaks, are you using
git send-email?

> diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
> index de2a68d..13b1050 100755
> --- a/meta/classes/qt4e.bbclass
> +++ b/meta/classes/qt4e.bbclass
> @@ -9,6 +9,7 @@ QT_LIBINFIX =3D "E"
>  # override variables set by qmake-base to compile Qt/Embedded apps
>  #
>  export QMAKESPEC =3D
> "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/${TARGET_OS}-oe-g++"
> +export OE_QMAKE_QT_CONFIG =3D
> "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/qconfig.pri"
>  export OE_QMAKE_INCDIR_QT =3D "${STAGING_INCDIR}/${QT_DIR_NAME}"
>  export OE_QMAKE_LIBDIR_QT =3D "${STAGING_LIBDIR}"
>  export OE_QMAKE_LIBS_QT =3D "qt"
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9uazBBczf8QSjDPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHOz+gACgkQN1Ujt2V2gBxA9ACfRHPbtUsLVOh6jMlcVHJ44WBK
690AoIrsfjQSyRJ8nUgajGnKgDmVpQ6Y
=UbBr
-----END PGP SIGNATURE-----

--9uazBBczf8QSjDPd--
