Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 53A8265DA3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 12:13:14 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so5549519wgh.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PKilUnFar4XPZMvHRTC+dnLVUUm+lFTBkRsSvMBqobk=;
	b=YCc4YJcobtLWWbEovnHcRGxBaL/nxgi1n/8tSEy8rWsbcmQVM0QOuQqqrsiJnkmOsN
	mAimHHOw3iSjZ9oLfR5WvBOplhZmCRxXLUkfo4SpdHkHq62qOUsuInQFX8pO+AN9anLm
	YnQCkgZe5du0XHSSUdYUny0iEdocm1hCFWvIh22x7QslTmPR4kwnU284nv/epcAiO1N4
	CoiiN/paihYllmQuyX8kfh3rqEeNtK3Igko2TgbZ2OR1yeo2Fk8uEa63XOoD6orEwIqO
	RU2V3k9FUREYyan2VhXGaPVhaNBW/NEOgGgjzOjsHaZzq3zfkWg4M7uJ+8x2swipZuRc
	RcKw==
X-Received: by 10.194.206.67 with SMTP id lm3mr32097279wjc.70.1407499994810;
	Fri, 08 Aug 2014 05:13:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej10sm6630997wib.12.2014.08.08.05.13.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 05:13:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Aug 2014 14:13:46 +0200
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20140808121346.GE14848@jama>
References: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
	<1407497829-9330-3-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1407497829-9330-3-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] opkg: Add runtime dep on gnupg if 'gpg' is in PACAKGECONFIG
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
X-List-Received-Date: Fri, 08 Aug 2014 12:13:20 -0000
X-Groupsio-MsgNum: 56149
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CkAEuVknXa3V+za6"
Content-Disposition: inline

--CkAEuVknXa3V+za6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 11:37:09AM +0000, Paul Barker wrote:
> The 'opkg-key' utility requires gpg to manage the list of trusted keys. T=
he
> ability to verify package signatures is not much use without the ability =
to add
> keys to the trusted list...
>=20
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  meta/recipes-devtools/opkg/opkg.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/=
opkg/opkg.inc
> index ba21d84..56c54b6 100644
> --- a/meta/recipes-devtools/opkg/opkg.inc
> +++ b/meta/recipes-devtools/opkg/opkg.inc
> @@ -27,7 +27,7 @@ OPKGLIBDIR =3D "${target_localstatedir}/lib"
> =20
>  PACKAGECONFIG ??=3D ""
> =20
> -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-error"
> +PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,gpgme libgpg-error,gn=
upg"

Shouldn't this be gpgme?

>  PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
>  PACKAGECONFIG[ssl-curl] =3D "--enable-ssl-curl,--disable-ssl-curl,curl o=
penssl"
>  PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
> --=20
> 2.0.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CkAEuVknXa3V+za6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPkvvoACgkQN1Ujt2V2gBx9AwCfUJxoZqjsVvBAQxBkTIqg4rlB
GzkAn3FVKL0I2dPzQ5Vgnaq+MZQyteWb
=NXgu
-----END PGP SIGNATURE-----

--CkAEuVknXa3V+za6--
