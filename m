Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 205F77190D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 12:13:16 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id bs8so2445277wib.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 04:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7jzuyEsiREjSLCnJupytToIwKbHQH0tXP6c9m+tvbXw=;
	b=rxuiFFdeoszrPpsx5gE+VEXWWsw5OiyCOHyL4iXHZZA6BAY49bC2wy06Ij46YZl8r7
	SALIP30SQKrKsSoW/abKKxDFgrF6iRJ9l80gCwNnaThTJJ6Pcoki1A1L32LSfc+/UMWu
	/rdHpbUu6xwlnJo7O2cCZR85usOKfL6sWryOqcPWPf5eojIG1sPwSJGcK0kGxvkJZPWR
	n04Lu/xSqerZ+LJ/SGPBOZklzmeG0gYru+ZilEiCRJpEdxguj5ayuRYKb9S2pMz6l8XS
	+WPytwcD55md4NWtTLhiXMgC0IicB3zqv+0KFI5E9t2xJW4VSmiYYcF8PwRUqHT4YVrQ
	IK7Q==
X-Received: by 10.194.143.7 with SMTP id sa7mr13494263wjb.110.1415967196589;
	Fri, 14 Nov 2014 04:13:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vm8sm24460069wjc.6.2014.11.14.04.13.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Nov 2014 04:13:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Nov 2014 13:13:22 +0100
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20141114121322.GG2458@jama>
References: <1415959113-8920-1-git-send-email-diego.sueiro@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1415959113-8920-1-git-send-email-diego.sueiro@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtsystems: Change branch from stable to 5.3
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
X-List-Received-Date: Fri, 14 Nov 2014 12:13:18 -0000
X-Groupsio-MsgNum: 59675
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z0mFw3+mXTC5ycVe"
Content-Disposition: inline

--Z0mFw3+mXTC5ycVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2014 at 07:58:33AM -0200, Diego Sueiro wrote:
> Stable branch was removed on mainline and now 5.3
> is used.

Please resend to openembedded-devel@lists.openembedded.org

>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
> ---
>  recipes-qt/qt5/qtsystems_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_g=
it.bb
> index 45f6b0e..ac2fc86 100644
> --- a/recipes-qt/qt5/qtsystems_git.bb
> +++ b/recipes-qt/qt5/qtsystems_git.bb
> @@ -1,7 +1,7 @@
>  require qt5-git.inc
>  require ${PN}.inc
> =20
> -QT_MODULE_BRANCH =3D "stable"
> +QT_MODULE_BRANCH =3D "5.3"
> =20
>  # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-be=
ta1
>  # qt5-git PV is only to indicate that this recipe is compatible with qt5=
 5.2.1
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

--Z0mFw3+mXTC5ycVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRl8eIACgkQN1Ujt2V2gBw3+ACeIuPuZo7vMN9Np6X/Ebhc44UU
zVwAn1r+MqIrPnyiAn7JJermez8SY1Ee
=VEz5
-----END PGP SIGNATURE-----

--Z0mFw3+mXTC5ycVe--
