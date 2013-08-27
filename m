Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6143461F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:48:38 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so2441165eek.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D6qkVl/Q77gMTbvr7jBhWJMvnuKi/JINBrvkFVenOM4=;
	b=SB2PMTtpX4u7cyAELv70GACXI4Nfz4bs3oXQySRwaeZgPwOK/FJ/s6AH5B9ZF2CcK2
	kxB0M/ySFSsuEy7wDK9FuvXt65eqMesqqAcxa2aHr7tAGOxTb4nfWKoXRK81LeBBWhR0
	0cGqzmDI9JAONlSySfINFnCidveKpLKVjzHfODcb9CcPGnXpVfdLznE0k+McpSaFHXCz
	325Y6Rkh678i4bnMpSrTXrvOo6sQf3WA1zPvqi+3YCGzLm5iopepkWWmiTJMDOjbDf3k
	n9R2nciasjh8Qzy2AUmzVqS6mYKGH/uHzbWDgdBC2aaZw/v8tB6No7aAslg4G8av7tT2
	d9Rg==
X-Received: by 10.14.219.198 with SMTP id m46mr35924668eep.41.1377625718544;
	Tue, 27 Aug 2013 10:48:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm30910474eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:48:37 -0700 (PDT)
Date: Tue, 27 Aug 2013 19:49:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130827174948.GZ3544@jama>
References: <cover.1377623208.git.raj.khem@gmail.com>
	<646151f2b0abdcc90f0777789be3816047e1ba02.1377623208.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <646151f2b0abdcc90f0777789be3816047e1ba02.1377623208.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/20] python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc
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
X-List-Received-Date: Tue, 27 Aug 2013 17:48:38 -0000
X-Groupsio-MsgNum: 44147
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NJ3GtppTlf/130kA"
Content-Disposition: inline

--NJ3GtppTlf/130kA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 10:15:19AM -0700, Khem Raj wrote:
> Fixes
>=20
> and from test-dependencies.sh run there is undeterministic lzma
> dependency:
>=20
> WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest lost
> dependency on  liblzma

I've already replied in the other thread that this isn't right fix.

> Reported-by: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.3.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/python/python3_3.3.2.bb b/meta/recipes=
-devtools/python/python3_3.3.2.bb
> index 6ff32d8..d2c7e37 100644
> --- a/meta/recipes-devtools/python/python3_3.3.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.3.2.bb
> @@ -197,6 +197,7 @@ FILES_${PN}-dbg +=3D "${libdir}/python${PYTHON_MAJMIN=
}/lib-dynload/.debug"
>  # catch all the rest (unsorted)
>  PACKAGES +=3D "${PN}-misc"
>  FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}"
> +RDEPENDS_${PN}-misc =3D "liblzma"
> =20
>  # catch manpage
>  PACKAGES +=3D "${PN}-man"
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NJ3GtppTlf/130kA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIc5rwACgkQN1Ujt2V2gBz4/wCfd2hVCoUzsxa27DYCdbU0cgpi
C/cAoIH8Og1XnoHfBedkJciycljDa11Z
=/Pdm
-----END PGP SIGNATURE-----

--NJ3GtppTlf/130kA--
