Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SmTT3-0003wa-F6
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 19:34:21 +0200
Received: by wgbdr1 with SMTP id dr1so6879743wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EjIqXmjahJbaKLo9qdx/+4cLQj/MNUVLNnpZSn9A+s4=;
	b=JDJ9v6XbJGWNAKj0SB9SFuDlZ12T1/hhVyZ2oWU2DHzl8riK/tFskC/hcF/i+KFo0x
	OIPYGrsGNv/sSYG/hU79sFk2QgESzRrlJ28q1KgzAEpwKO6dQNqexo7FFhGyEyoWmO9s
	+WlHpDAkmwgSqYiKW4yoHwPnbQ1OU8ap8GMQUBR+MXtFwuqciQxEcGCy3C+WOXrGNfsu
	hCBr2IIDCZ5d0nTKFwgV6+QuC6qbPDH7I1cnFiU6FhkVgwd7udTyp2GODNmKxe2DqvNg
	Yau9n+jRBnr8CCw33pKl/gt55As2Cf5q7yUkzIAr6npJqvf7y41pDeSYm4rthDLfLriI
	T6dA==
Received: by 10.216.99.132 with SMTP id x4mr5273003wef.41.1341422598134;
	Wed, 04 Jul 2012 10:23:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm47943173wid.1.2012.07.04.10.23.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 10:23:15 -0700 (PDT)
Date: Wed, 4 Jul 2012 19:23:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120704172309.GF15100@jama.jama.net>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
	<1341298228-4412-5-git-send-email-laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1341298228-4412-5-git-send-email-laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 04/10] libdrm: upgrade to 2.4.35
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
X-List-Received-Date: Wed, 04 Jul 2012 17:34:21 -0000
X-Groupsio-MsgNum: 24676
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Content-Disposition: inline

--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2012 at 09:50:21AM +0300, Laurentiu Palcu wrote:
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

Is there specific reason that it wasn't upgraded to latest 2.4.37?

Maybe it was because intel test is failing in 2.4.37:
http://cgit.freedesktop.org/mesa/drm/commit/?id=3D8fad46b614a156e3a0e65cd0a=
f4c132a5820d29e

just wanted to be sure before rebasing glamo patch in meta-openmoko
layer for 2.4.35..

Cheers,

> ---
>  .../drm/{libdrm_2.4.34.bb =3D> libdrm_2.4.35.bb}     |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/drm/{libdrm_2.4.34.bb =3D> libdrm_2.4.35.bb=
} (62%)
>=20
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.34.bb b/meta/recipes-gr=
aphics/drm/libdrm_2.4.35.bb
> similarity index 62%
> rename from meta/recipes-graphics/drm/libdrm_2.4.34.bb
> rename to meta/recipes-graphics/drm/libdrm_2.4.35.bb
> index bf489cf..3677b8d 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.34.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.35.bb
> @@ -8,5 +8,5 @@ SRC_URI +=3D "file://installtests.patch \
>              file://GNU_SOURCE_definition.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "293cb2b31392d52caa02ab0861dfc2c9"
> -SRC_URI[sha256sum] =3D "a468570e7c85107b7c2f8eaceeebaa8f8a0da86482618f44=
5bb74fa0b0d0f8d0"
> +SRC_URI[md5sum] =3D "a40f5293dc0a7b49d2a1e959d7d60194"
> +SRC_URI[sha256sum] =3D "c390aee132f05910edb09398b70e108c6b53f9b69b21914a=
9ea3165eed6f1b21"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/0e/0ACgkQN1Ujt2V2gByftgCghiDXtVSslnXk4gntgkuaWxhg
sBQAn0oB2KsgkTOpOSKqkV9Wqzo0o/TA
=9v1v
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--
