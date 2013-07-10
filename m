Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 62E3462009
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 15:16:27 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so4885946eek.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jZ71Mk6OsXG81wWV1xZPObG2j43bj8QBwyc5fzyO61k=;
	b=VxrrLhnw3Ah6b10r+YBQ6Gav9LGtmkcTwN8DqL23seyx4HrK/vNu80kbzE61oiN1Ef
	jxgx9VtAWx6YrkljwmJ+tWqUmDDs+7jrnmVhx/iX0Vbu1VuQFhldH6AR9tK/In7n/tw9
	9hvCY3jlAnCwV0u5OhSVVLcfoDbKKs7w2VAWylrvTvJNiL/3pA1d8U9ifTlQ0cSXw0Ip
	wUOl6PNapqI1Gd3mBik7TxnyhTW5NvC63jBh+Jxu+2Lp4aL3v5z9Kn8fFWtb66BCjiG3
	75wcPsOKahn4OMw2NhzAP0d8OaKv3G+F79yvVCSau3tuROiGVNwKlfG3fHfkiKM67Get
	4+AA==
X-Received: by 10.15.51.202 with SMTP id n50mr36447016eew.39.1373469387395;
	Wed, 10 Jul 2013 08:16:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm60673164eed.9.2013.07.10.08.16.26 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 08:16:26 -0700 (PDT)
Date: Wed, 10 Jul 2013 17:16:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
Message-ID: <20130710151637.GD3288@jama>
References: <cover.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<6c15f39c5d3d9c6d7d8788d1c76758078b446fbd.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
MIME-Version: 1.0
In-Reply-To: <6c15f39c5d3d9c6d7d8788d1c76758078b446fbd.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] docbook-sgml-dtd-4.1-native.bb: Add real PV inside the recipe
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
X-List-Received-Date: Wed, 10 Jul 2013 15:16:27 -0000
X-Groupsio-MsgNum: 41748
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="whpHMr7UwS4k4x4q"
Content-Disposition: inline

--whpHMr7UwS4k4x4q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2013 at 06:07:08PM +0300, Emilia Ciobanu wrote:
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> ---
>  .../docbook-sgml-dtd-4.1-native.bb                 |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-=
native.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-nat=
ive.bb
> index 88c9396..1f338fd 100644
> --- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.=
bb
> +++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.=
bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-OASIS;md5=3Dc608985d=
d5f7f215e669e7639a0b1d2e"
>  DTD_VERSION =3D "4.1"
> =20
>  PR =3D "${INC_PR}.0"
> +PV =3D "41"

Why not 4.1?

> =20
>  # Note: the upstream sources are not distributed with a license file.
>  # LICENSE-OASIS is included as a "patch" to workaround this. When
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--whpHMr7UwS4k4x4q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHdetUACgkQN1Ujt2V2gBySAQCfe1s04NIsKZmWfUdLS3jaXthR
nF8AoKVm7RuGSL03QNhSlQpX4Eonvx6o
=fo1U
-----END PGP SIGNATURE-----

--whpHMr7UwS4k4x4q--
