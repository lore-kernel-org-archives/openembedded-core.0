Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 413236FFDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 18:35:35 +0000 (UTC)
Received: by wmww144 with SMTP id w144so36735050wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 10:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AaWPxr7vnQuOPATOEeLBFysPxaqbZsTAnEcrsGZ4w1I=;
	b=kQO7Pcf0AZ7d2DtSXJ0HEEDFzN0xebFYqS6c2wY3z8aSeK7vt/HsmiyrMfqJM913bo
	f7osKifDVfD2iDHzJy2JvUJZmXy9DUnk5jq/GW00N13QSR2FuetdxfUkA9bNG9KI5Nw5
	HqJqKVei8sGxe9Lz7Em/r0MKot/a4MPfEHnzeXaogb0i6R19yhFx73FFu2sNTQOWpTdd
	8fHLk9/M7mCBYtHHZLEBlO/1HG1K2EISVf4fie34jA2PkOxMdmQ84/8NjRXrB0YKJqxo
	7cFxvFce4TWbG+ko18gq7sQspYv196GivmEH/22Y8Oec30wLVdpVua4nkYrX4qqXslFD
	mANA==
X-Received: by 10.28.32.22 with SMTP id g22mr608988wmg.43.1449772536463;
	Thu, 10 Dec 2015 10:35:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	uw6sm13590575wjc.42.2015.12.10.10.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 10:35:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Dec 2015 19:37:20 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20151210183720.GO2246@jama>
References: <1449772407-30369-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1449772407-30369-1-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] documentation.conf: document PREFERRED_VERSION wildcard limitations
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
X-List-Received-Date: Thu, 10 Dec 2015 18:35:37 -0000
X-Groupsio-MsgNum: 74621
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sj9mcRtP+pTWLOo"
Content-Disposition: inline

--6sj9mcRtP+pTWLOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 10:33:27AM -0800, Andre McCurdy wrote:
> PREFERRED_VERSION values containing the '%' wildcard should only be
> used when the wildcard pattern is known to only match one available
> recipe. See longer explanation in:
>=20
>   http://comments.gmane.org/gmane.comp.sysutils.bitbake.devel/1038

Thanks

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/documentation.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 845559a..c31c217 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -332,7 +332,7 @@ PN[doc] =3D "PN refers to a recipe name in the contex=
t of a file used by the OpenE
>  PNBLACKLIST[doc] =3D "Lists recipes you do not want the OpenEmbedded bui=
ld system to build."
>  PR[doc] =3D "The revision of the recipe. The default value for this vari=
able is 'r0'."
>  PREFERRED_PROVIDER[doc] =3D "If multiple recipes provide an item, this v=
ariable determines which recipe should be given preference."
> -PREFERRED_VERSION[doc] =3D "If there are multiple versions of recipes av=
ailable, this variable determines which recipe should be given preference."
> +PREFERRED_VERSION[doc] =3D "If there are multiple versions of recipes av=
ailable, this variable determines which recipe should be given preference. =
The '%' wildcard is supported but should be used with care, results are unp=
redictable if it matches more than one available version."
>  PREMIRRORS[doc] =3D "Specifies additional paths from which the OpenEmbed=
ded build system gets source code."
>  PRINC[doc] =3D "Causes the PR variable of .bbappend files to dynamically=
 increment. This increment minimizes the impact of layer ordering. This var=
iable defaults to '0'."
>  PRIORITY[doc] =3D "Indicates the importance of a package.  The default v=
alue is 'optional'.  Other standard values are 'required', 'standard' and '=
extra'."
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

--6sj9mcRtP+pTWLOo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZpxl8ACgkQN1Ujt2V2gBwo7wCgkOS5vVxjSjiWmtzEJAVtKHXt
ivUAoLa/c4LA78hHVHil1sXgpOtEceaC
=BKs5
-----END PGP SIGNATURE-----

--6sj9mcRtP+pTWLOo--
