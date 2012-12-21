Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tm32T-0001mD-UW
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 14:53:26 +0100
Received: by mail-pa0-f48.google.com with SMTP id fa1so2866565pad.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=hI1qLudcyFdlgkeB5+dhRcLAaYddurdOhGoir0/joZM=;
	b=yOKjRH24j/06hOVDEk0Mnp17dzHGq2oiRBUzAX1raMY0cwHt6rhKRRi8RPa7icxZ00
	UzebQrd8HDNXeeroPnjDajdvS6/neD4v4EjLt3PCw7yDnnXJUuyBDVdKGdbBYRnuTlcW
	+4YBVYDqSSVJdowEB35GobTbPCpTNmHk3FE4TGJRzC2A+B0/kGSGpcra8ssTNkJlYtz/
	ENz+seifD3nZJtSLMbCd+SZf0vbSFtC4eQEZzn4+vRToNO4DAf+kBJEFGP+meZRm9iX2
	zIN1FmUO0QCFb/Hp1tvQ6zJznSge/3UfnzCFmNGqojXWpCU2odTc7f8MUHZjAOcrXQmK
	++mQ==
X-Received: by 10.68.191.5 with SMTP id gu5mr39691564pbc.145.1356097119434;
	Fri, 21 Dec 2012 05:38:39 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hc4sm7017473pbc.30.2012.12.21.05.38.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 05:38:38 -0800 (PST)
Date: Fri, 21 Dec 2012 14:38:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Message-ID: <20121221133838.GS14543@jama.palm1.palmone.com>
References: <1356096407-16252-1-git-send-email-bogdan.a.marinescu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1356096407-16252-1-git-send-email-bogdan.a.marinescu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] subversion: updated tp 1.7.8 Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 13:53:26 -0000
X-Groupsio-MsgNum: 33010
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nSQp8DZZn7gZbDHt"
Content-Disposition: inline

--nSQp8DZZn7gZbDHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2012 at 03:26:47PM +0200, Bogdan Marinescu wrote:
> ---

s/tp/to/g

and SOB line does not belong to subject

>  .../fix-install-depends.patch                                      |    0
>  .../{subversion-1.7.7 =3D> subversion-1.7.8}/libtool2.patch          |  =
  0
>  .../subversion/{subversion_1.7.7.bb =3D> subversion_1.7.8.bb}        |  =
  4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/subversion/{subversion-1.7.7 =3D> subversio=
n-1.7.8}/fix-install-depends.patch (100%)
>  rename meta/recipes-devtools/subversion/{subversion-1.7.7 =3D> subversio=
n-1.7.8}/libtool2.patch (100%)
>  rename meta/recipes-devtools/subversion/{subversion_1.7.7.bb =3D> subver=
sion_1.7.8.bb} (88%)
>=20
> diff --git a/meta/recipes-devtools/subversion/subversion-1.7.7/fix-instal=
l-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.8/fix-ins=
tall-depends.patch
> similarity index 100%
> rename from meta/recipes-devtools/subversion/subversion-1.7.7/fix-install=
-depends.patch
> rename to meta/recipes-devtools/subversion/subversion-1.7.8/fix-install-d=
epends.patch
> diff --git a/meta/recipes-devtools/subversion/subversion-1.7.7/libtool2.p=
atch b/meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.patch
> similarity index 100%
> rename from meta/recipes-devtools/subversion/subversion-1.7.7/libtool2.pa=
tch
> rename to meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.patch
> diff --git a/meta/recipes-devtools/subversion/subversion_1.7.7.bb b/meta/=
recipes-devtools/subversion/subversion_1.7.8.bb
> similarity index 88%
> rename from meta/recipes-devtools/subversion/subversion_1.7.7.bb
> rename to meta/recipes-devtools/subversion/subversion_1.7.8.bb
> index f006217..1b1ca93 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.7.7.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.7.8.bb
> @@ -13,8 +13,8 @@ SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.b=
z2 \
>             file://libtool2.patch \
>             file://fix-install-depends.patch \
>  "
> -SRC_URI[md5sum] =3D "5a42b7d0f1366a8d60f9ad7d5890295d"
> -SRC_URI[sha256sum] =3D "fc85a9341d1dc275b279e470776014b02328a028e48a7ac7=
868ac07d4a40a321"
> +SRC_URI[md5sum] =3D "454b9f398415c3504435bf8c3f6ed127"
> +SRC_URI[sha256sum] =3D "fc83d4d98ccea8b7bfa8f5c20fff545c8baa7d035db93097=
7550c51c6ca23686"
> =20
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a14fd2da3134e40a087eb4326a4e=
cd4"
> =20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nSQp8DZZn7gZbDHt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDUZl4ACgkQN1Ujt2V2gBxRHACfe50UshkHlBCHKKNG7TKthW2k
PfoAn2FINQIzDADXj5ipQwBIxnP0AmEu
=BK/w
-----END PGP SIGNATURE-----

--nSQp8DZZn7gZbDHt--
