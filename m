Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 030E87638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:35:38 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so23803228wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dEBEL8xex5o8amLT83RVhup2jMhqfjHF/4RIHZZUPKw=;
	b=ALd974BR97Ob+6ZrSSevSDd/KZP7Lkwlm08ro7jX9bGqV6jU0zilyhkm4U3YdtB4io
	26rTKwwXsG/xRv5V5pfltz+6A4v06rbv/W6lNBWZ2C7E2YeJ345kqsOcU2Eb6nucQB0K
	jIqXdiPxzC2b67PQNNxVebEUbmSPuqq+MmFyXg4ngbVDDTuKFXdn0cmYoCBbZV+w9JDY
	RfolmxdJrI+Lddyathw/28VJsEZaWCJocynduyV6gg6bnkGumwqJW8ioavGWpPvneo0z
	wNUD1ouMSSEML0Gi/E7YDNDWuJROx6fdn/4wIUgQTHad262wbKys3zPfs3wPsJCKT069
	uU5g==
X-Received: by 10.180.186.35 with SMTP id fh3mr7032297wic.7.1438266938539;
	Thu, 30 Jul 2015 07:35:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id x6sm30228146wiy.6.2015.07.30.07.35.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:35:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:35:52 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730143552.GJ2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<d5362f4afd2b421f9a6b628289bde50f60a9882b.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <d5362f4afd2b421f9a6b628289bde50f60a9882b.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 17/26] tremor: switch SRC_URI from svn to tarballs on debian mirrors
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
X-List-Received-Date: Thu, 30 Jul 2015 14:35:39 -0000
X-Groupsio-MsgNum: 68740
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mPTHnM80CEnHQ2WJ"
Content-Disposition: inline

--mPTHnM80CEnHQ2WJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:46PM +0300, Alexander Kanavin wrote:
> There is no support for checking svn repositories for new commits, so
> let's use debian tarballs and assume that Debian has a dedicated maintain=
er
> who would check the upstream now and then.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../{tremor-20120314 =3D> tremor}/obsolete_automake_macros.patch      | 0
>  .../tremor/{tremor-20120314 =3D> tremor}/tremor-arm-thumb2.patch      | 0
>  .../tremor/{tremor_20120314.bb =3D> tremor_18153.bb}                  | =
6 ++++--
>  3 files changed, 4 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/tremor/{tremor-20120314 =3D> tremor}/obso=
lete_automake_macros.patch (100%)
>  rename meta/recipes-multimedia/tremor/{tremor-20120314 =3D> tremor}/trem=
or-arm-thumb2.patch (100%)
>  rename meta/recipes-multimedia/tremor/{tremor_20120314.bb =3D> tremor_18=
153.bb} (66%)
>=20
> diff --git a/meta/recipes-multimedia/tremor/tremor-20120314/obsolete_auto=
make_macros.patch b/meta/recipes-multimedia/tremor/tremor/obsolete_automake=
_macros.patch
> similarity index 100%
> rename from meta/recipes-multimedia/tremor/tremor-20120314/obsolete_autom=
ake_macros.patch
> rename to meta/recipes-multimedia/tremor/tremor/obsolete_automake_macros.=
patch
> diff --git a/meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-th=
umb2.patch b/meta/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
> similarity index 100%
> rename from meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thu=
mb2.patch
> rename to meta/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
> diff --git a/meta/recipes-multimedia/tremor/tremor_20120314.bb b/meta/rec=
ipes-multimedia/tremor/tremor_18153.bb
> similarity index 66%
> rename from meta/recipes-multimedia/tremor/tremor_20120314.bb
> rename to meta/recipes-multimedia/tremor/tremor_18153.bb
> index afc78ac..c27fe8c 100644
> --- a/meta/recipes-multimedia/tremor/tremor_20120314.bb
> +++ b/meta/recipes-multimedia/tremor/tremor_18153.bb

PV going backwards isn't acceptable for package feeds

> @@ -8,12 +8,14 @@ DEPENDS =3D "libogg"
>  SRCDATE =3D "${PV}"
>  PR =3D "r1"
> =20
> -SRC_URI =3D "svn://svn.xiph.org/trunk;module=3DTremor;rev=3D18221;protoc=
ol=3Dhttp \
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/libv/libvorbisidec/libvorbisidec_1.0.=
2+svn${PV}.orig.tar.gz \
>             file://obsolete_automake_macros.patch;striplevel=3D0 \
>             file://tremor-arm-thumb2.patch \
>  "
> +SRC_URI[md5sum] =3D "4190859414c5d6760e316b5cf00fe7c5"
> +SRC_URI[sha256sum] =3D "4dc8c224289da3479fc10ce4e49ffbb85c790eb2fe55ef48=
0934a265ee0a6782"
> =20
> -S =3D "${WORKDIR}/Tremor"
> +S =3D "${WORKDIR}/libvorbisidec-1.0.2+svn${PV}"
> =20
>  inherit autotools pkgconfig
> =20
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mPTHnM80CEnHQ2WJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NkgACgkQN1Ujt2V2gBxX5ACeLh5+aNGKyjUS3dK2RmzeOgYn
5Y0AoJJXXvhKz/jAYqYZ54F5QWD0tjM3
=/dgo
-----END PGP SIGNATURE-----

--mPTHnM80CEnHQ2WJ--
