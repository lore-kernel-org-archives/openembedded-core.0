Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T4S4q-0000Vb-Vv
	for Openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 09:43:41 +0200
Received: by wgbdr1 with SMTP id dr1so269093wgb.24
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pY0sUhngjjQM/0fqfyuBye3gz/uPDCTHbn9ZuDZk25s=;
	b=uuynAK7wyY+HazdhpGc8ylj6xG91UyD7AR30UsV/9ydpD3tgoVbNoKcE8VEfh4wSG8
	9kBOYDlF0QSYv7t4N2WNUxeIOvjpaJHGhEXbNm55ZLXqa3RQ7PQS5jSkNO1HnFGYAJFh
	0XF+X/vbnea/FeqdIzZB2e3gVMH3z9Obkh+DmvAPCvohe+64DdV0kfMyQBjBuO1iyFbd
	sqbrTg+zylcrI9gj2DYGuDxAD+R8xKauz6X60AxfIbJdaSssB6UQOb8k//7Qh359K7He
	bBKID4p+Y86vCVs79g8kZ7va5mr1+peXEshC1ZlAFTAg2VN1S3JKZkpMXomtL9WD+zIK
	9oQw==
Received: by 10.180.97.135 with SMTP id ea7mr12586224wib.11.1345707095006;
	Thu, 23 Aug 2012 00:31:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm43469585wib.7.2012.08.23.00.31.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 00:31:33 -0700 (PDT)
Date: Thu, 23 Aug 2012 09:31:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-ID: <20120823073139.GK3029@jama.jama.net>
References: <1345706669-28914-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1345706669-28914-2-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1345706669-28914-2-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libcap: fetch from Debian
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
X-List-Received-Date: Thu, 23 Aug 2012 07:43:41 -0000
X-Groupsio-MsgNum: 28119
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KjSGHOmKKB2VUiQn"
Content-Disposition: inline

--KjSGHOmKKB2VUiQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2012 at 09:24:29AM +0200, Marcin Juszkiewicz wrote:
> Original location was kernel.org and it was not restored after server
> was hacked.

So the SRC_URI checksums are different because it was repackaged? Please
include diff of content from those 2 archives in commit message.

Cheers,

>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta/recipes-support/libcap/libcap.inc     |    2 +-
>  meta/recipes-support/libcap/libcap_2.22.bb |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-suppor=
t/libcap/libcap.inc
> index 5b03671..5d7291e 100644
> --- a/meta/recipes-support/libcap/libcap.inc
> +++ b/meta/recipes-support/libcap/libcap.inc
> @@ -10,7 +10,7 @@ DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam'=
, 'libpam', '', d)}"
>  # attr and pam are disabled by EXTRA_OEMAKE_virtclass-native
>  DEPENDS_virtclass-native =3D "perl-native-runtime"
> =20
> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/libcap2=
/${BPN}-${PV}.tar.bz2"
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.g=
z"
> =20
>  PR =3D "r1"
> =20
> diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-su=
pport/libcap/libcap_2.22.bb
> index be1df54..b631c51 100644
> --- a/meta/recipes-support/libcap/libcap_2.22.bb
> +++ b/meta/recipes-support/libcap/libcap_2.22.bb
> @@ -2,5 +2,5 @@ require libcap.inc
> =20
>  PR =3D "r3"
> =20
> -SRC_URI[md5sum] =3D "ce64058bdb3f086ddbfca8ce6c919845"
> -SRC_URI[sha256sum] =3D "73ebbd4877b5f69dd28b72098e510c5b318bc480f8201c40=
61ac98b78c04050f"
> +SRC_URI[md5sum] =3D "b4896816b626bea445f0b3849bdd4077"
> +SRC_URI[sha256sum] =3D "e1cae65d8febf2579be37c255d2e058715785ead481a4e6a=
4357a06aff84721f"
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

--KjSGHOmKKB2VUiQn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA13FsACgkQN1Ujt2V2gBzKpQCfdW0Dds7d6TDPyxICvMThjUyn
SRoAoKnpQUR5t0QazE7cv2BBXSGNo121
=vuGf
-----END PGP SIGNATURE-----

--KjSGHOmKKB2VUiQn--
