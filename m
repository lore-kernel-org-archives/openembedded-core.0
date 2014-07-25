Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5C76F60D67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 20:12:43 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so1601315wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 13:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i5WWSN4X9m2EQAeHu5Jxc+lQqw6fdzr1UtAgYntCydQ=;
	b=XmYbuGqA5VASaAGm4rZ7uk3z6FSAIrMDBbKQIv7QcOuaPmHMmmPeMVV2rvKP1SxuA8
	RDVw7e6r7in0pT+ebKmfwPzy7XaHt7vX7zVjw2J2RvClVD46sN9Tgv8/Ukf9Ck2qw72S
	My0r4syttlRZq0snZvhUoldCbZzjCAkCmPoGFr/NwFhBxvrZLu3XnK1KbFzbsNfggmc1
	T3djDAuL8L90PRS6DvDT9BJ1kiuiU01HbnE/cf3OpYAzxj3ARjDDKt9P77gGVxFeZ91q
	9tkrobhF4gzRumsbaS4x6VpjwBwbPXZCXc2kKOtWw7n6z26cTASCe+c59i83edvMuhyZ
	t5Ww==
X-Received: by 10.194.122.73 with SMTP id lq9mr6879697wjb.133.1406319164906;
	Fri, 25 Jul 2014 13:12:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ey16sm9790773wid.14.2014.07.25.13.12.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 13:12:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Jul 2014 22:13:01 +0200
To: Stefan sat <stefansat@telenet.be>
Message-ID: <20140725201301.GX2492@jama>
References: <53D2A234.60303@telenet.be>
MIME-Version: 1.0
In-Reply-To: <53D2A234.60303@telenet.be>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Subversion does not support http protocol anymore
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
X-List-Received-Date: Fri, 25 Jul 2014 20:12:49 -0000
X-Groupsio-MsgNum: 55591
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PAKmkkBo0+rTwAqJ"
Content-Disposition: inline

--PAKmkkBo0+rTwAqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2014 at 08:30:12PM +0200, Stefan sat wrote:
> Hello since a certain time native subversion build of=20
> openembedded-oe-core does not support http protocol anymore.
>=20
> I found out that it is just the missing neon-config script file.
>=20
> Whitout this the subversion_1.7.10.bb builds whitout neon support.
>=20
> It was just ok by removing binconfig-disabled by=20
> meta/recipes-support/neon/neon_0.30.0.bb
>=20
> Then rebuild neon and subversion.
>=20
> Included git patch file

Wasn't it fixed recently by adding serf to oe-core?

> From 23996da1c500a6851e98f93706b09dd819f17312 Mon Sep 17 00:00:00 2001
> From: Christophe Van Reusel <christophe@stefan2l>
> Date: Fri, 25 Jul 2014 19:01:28 +0200
> Subject: [PATCH] Changed neon bb file to not inherit binconfig-disabled
>=20
> neon-config script file needed to compile subversion with http support.
>=20
>  Committer: Christophe Van Reusel <stefansat@telenet.be>
>=20
>  Changes to be committed:
>=20
> 	modified:   meta/recipes-support/neon/neon_0.30.0.bb
> ---
>  meta/recipes-support/neon/neon_0.30.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/neon/neon_0.30.0.bb b/meta/recipes-supp=
ort/neon/neon_0.30.0.bb
> index 61bd7d9..c257215 100644
> --- a/meta/recipes-support/neon/neon_0.30.0.bb
> +++ b/meta/recipes-support/neon/neon_0.30.0.bb
> @@ -16,7 +16,7 @@ SRC_URI[sha256sum] =3D "2962cfcb5d30f3272e3d2fa0e473434=
419770a3801afe3d46e5d165078
> =20
>  BINCONFIG =3D "${bindir}/neon-config"
> =20
> -inherit autotools binconfig-disabled lib_package pkgconfig
> +inherit autotools lib_package pkgconfig
> =20
>  EXTRA_OECONF =3D "--with-ssl=3Dgnutls --with-libxml2 --with-expat --enab=
le-shared"
>  EXTRA_OECONF +=3D "--without-gssapi"
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

--PAKmkkBo0+rTwAqJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPSuk0ACgkQN1Ujt2V2gBwrnACfSImNBF3a2NmNSyDjTKC6qx4d
mT4Anix3ib4k3EBq1P/Ia9cg9ygROesv
=bGOk
-----END PGP SIGNATURE-----

--PAKmkkBo0+rTwAqJ--
