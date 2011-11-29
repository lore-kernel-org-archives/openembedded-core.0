Received: from mail-bw0-f45.google.com ([209.85.214.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVWt4-0002Tn-1Y
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:14:54 +0100
Received: by bkar19 with SMTP id r19so1025057bka.32
	for <openembedded-core@openembedded.org>;
	Tue, 29 Nov 2011 15:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j9me36lSJD3H2qCRVs8UXe9ggkfkYeB/5/kwATVV2ss=;
	b=Tpwsppq4jFg5x+oLjjHu2Srca/tGvoP8GUN/dr3+XNzxzxRQHMKBw0jQOMD1l2VWHV
	r9XzrmP6UM6XJfEcoxM1TvnT1EU7pDK/t5zVOdcTMRf5rJjkBuURAc2IVTfeqD6Zdi8V
	XUE23YfXKtT3wZuWeNAMjvZDMLw3ttTUqGMy8=
Received: by 10.205.128.19 with SMTP id hc19mr53035219bkc.9.1322608094469;
	Tue, 29 Nov 2011 15:08:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e8sm40226702bkd.7.2011.11.29.15.08.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 15:08:13 -0800 (PST)
Date: Wed, 30 Nov 2011 00:08:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111129230811.GN7441@jama.jama.net>
References: <cover.1322607016.git.sgw@linux.intel.com>
	<63a8312e843e78942030e19786cc34ee752c851c.1322607016.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <63a8312e843e78942030e19786cc34ee752c851c.1322607016.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 20/26] libiconv: Update to 1.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 23:14:54 -0000
X-Groupsio-MsgNum: 13213
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6yHiY5vv/BiPjcMt"
Content-Disposition: inline

--6yHiY5vv/BiPjcMt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 03:00:20PM -0800, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../{libiconv_1.13.1.bb =3D> libiconv_1.14.bb}       |    3 ---
>  1 files changed, 0 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/libiconv/{libiconv_1.13.1.bb =3D> libiconv_1=
=2E14.bb} (88%)
>=20
> diff --git a/meta/recipes-support/libiconv/libiconv_1.13.1.bb b/meta/reci=
pes-support/libiconv/libiconv_1.14.bb
> similarity index 88%
> rename from meta/recipes-support/libiconv/libiconv_1.13.1.bb
> rename to meta/recipes-support/libiconv/libiconv_1.14.bb
> index 6471e32..3b0196d 100644
> --- a/meta/recipes-support/libiconv/libiconv_1.13.1.bb
> +++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
> @@ -13,9 +13,6 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>             file://autoconf.patch \
>            "
> =20
> -SRC_URI[md5sum] =3D "7ab33ebd26687c744a37264a330bbe9a"
> -SRC_URI[sha256sum] =3D "55a36168306089009d054ccdd9d013041bfc3ab26be7033d=
107821f1c4949a49"
> -

where are checksums now?

Cheers,

>  S =3D "${WORKDIR}/libiconv-${PV}"
> =20
>  inherit autotools pkgconfig gettext
> --=20
> 1.7.6.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6yHiY5vv/BiPjcMt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7VZdsACgkQN1Ujt2V2gBxuHACgkgmt4mk7U9skh/pvZ4lZih4k
0zsAoLc2+TT0pmffB03GFrr5gRtEc43p
=tEZN
-----END PGP SIGNATURE-----

--6yHiY5vv/BiPjcMt--
