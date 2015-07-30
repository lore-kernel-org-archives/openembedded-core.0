Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A7C16764B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:28:46 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so23547332wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J2z+kLDNYfxKMz6srxcAlgw+TGqcUrMWisbxnNukUBY=;
	b=FZXti/94297+KnSd3Wex/8XL09ckbs8U8MEfMb0iD2tjdS7jcu/YryEG4KXlKeZeia
	EFuFCtMY8TJgRdJ7M4YgiKvxc6wYO6PncI3Ng6gAs5TDv6FWh0Dn+ACf57+hKHxaCJ5Z
	FimomgydCIhorFA1hDPLzs0+TgkmI+YUUyc9aZPntyGg2cWL1yc7WxN3hwL9nycqt/lI
	0XYAEMzox0aNTLDO1FUnE3XzTTf8QkjULNNS4R4yV21+WRvzUlgkz1WrGhV6eCigfmB6
	NKfwpVa0Ano56QQ26ZL74Kqvm6Kgo8tP4z+Js93YvsZYJshwBsM6mAUEiaRBnHLeB+xr
	eDSQ==
X-Received: by 10.194.63.42 with SMTP id d10mr97202963wjs.92.1438266525934;
	Thu, 30 Jul 2015 07:28:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ed10sm30181366wic.0.2015.07.30.07.28.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:28:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:29:00 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730142900.GB2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<0c7f8aaf4b04cf1bb866dae6af21509af051fbe6.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <0c7f8aaf4b04cf1bb866dae6af21509af051fbe6.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/26] libproxy: update SRC_URI to not use Google Code
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
X-List-Received-Date: Thu, 30 Jul 2015 14:28:46 -0000
X-Groupsio-MsgNum: 68731
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:30PM +0300, Alexander Kanavin wrote:
> Google Code is shutting down soon, so libproxy tarball is now fetched
> from Debian mirrors
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-support/libproxy/libproxy_0.4.11.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/reci=
pes-support/libproxy/libproxy_0.4.11.bb
> index 9d388d6..06d0b9b 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
> @@ -8,12 +8,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c \
> =20
>  DEPENDS =3D "gconf glib-2.0"
> =20
> -SRC_URI =3D "http://libproxy.googlecode.com/files/libproxy-${PV}.zip \
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/libp/${BPN}/${BPN}_${PV}.orig.tar.gz \
>             file://0001-test-Include-sys-select.h-for-select.patch \
>            "
> -
> -SRC_URI[md5sum] =3D "06be230b8b612e64997f8f15af6373aa"
> -SRC_URI[sha256sum] =3D "3175abcb49c0b37fd82c697927783bf7d53de3884a8559bc=
594e59caa09bdb04"
> +SRC_URI[md5sum] =3D "3cd1ae2a4abecf44b3f24d6639d2cd84"
> +SRC_URI[sha256sum] =3D "dc3f33de54163718f82b3e7c496a7de97f8862578414b8ec=
aad3cbfe4821864b"

Why has debian mirror different checksums?

Include the diff in commit message and warn premirror maintainers that
they need to drop old file (otherwise it will fail) - which is very
annoying.

> =20
>  inherit cmake pkgconfig
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

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NKsACgkQN1Ujt2V2gBwUvACfb0OZRzvCmjxdXK7y9W0t61j8
Kq4AnRCO13/kCNv9DX3ASksBA+BFssoT
=4dwq
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
