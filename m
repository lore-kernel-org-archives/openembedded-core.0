Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 38BDC7638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:33:37 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so23728851wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=19xlpryyi+uYeekVVFCLy5t+PCGzACvRin7XiQugl/s=;
	b=mItF7SjII5roOF+qGJJt9GQgCKtOxKDFQ/D/9xgBwdoVhNj2+aavSXQbvfJWXGPZWn
	HCMFcFnu1ZL3hHtgWSWQspZtzK4g4vWXfI/VgYRZSknJ0rqkePgXad4pugdGC2BTStX1
	ALW4IxcE0HAawARNr3KdA1EcuHfuhgl2URBNqXqd1eQUK93yDG2hmsRK60vj7dlB8v0s
	OFRnDCROBomlRvBxvK/GZbRaTFqcBRS/7ra3sOzCP/4Y0EtqcsXU3724GgOSgbUlMA2G
	V9DSHD+cIe1bOR9YlhSl1MRTWXfh0e/h4VOTXvZhWjsy99p3vNmwTtA7xEZVVFusPDqn
	J6NQ==
X-Received: by 10.180.7.129 with SMTP id j1mr7202636wia.39.1438266818078;
	Thu, 30 Jul 2015 07:33:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ho10sm2152465wjb.39.2015.07.30.07.33.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:33:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:33:53 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730143353.GG2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<85e7e6014242705a3e1e06ec5862358e95641a3a.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <85e7e6014242705a3e1e06ec5862358e95641a3a.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 11/26] nss: reorder SRC_URI lines to fix upstream version check
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
X-List-Received-Date: Thu, 30 Jul 2015 14:33:38 -0000
X-Groupsio-MsgNum: 68737
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline

--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:40PM +0300, Alexander Kanavin wrote:
> The source tarball should be listed first
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-support/nss/nss.inc       | 2 +-
>  meta/recipes-support/nss/nss_3.17.3.bb | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/=
nss.inc
> index 665e4e6..b21dc39 100644
> --- a/meta/recipes-support/nss/nss.inc
> +++ b/meta/recipes-support/nss/nss.inc
> @@ -12,7 +12,7 @@ LICENSE =3D "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 =
& LGPL-2.1+)"
> =20
>  LIC_FILES_CHKSUM =3D "file://nss/lib/freebl/mpi/doc/LICENSE;md5=3D491f15=
8d09d948466afce85d6f1fe18f \
>                      file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=3D6bf9=
6825e3d7ce4de25621ae886cc859"
> -SRC_URI =3D "\
> +SRC_URI +=3D "\
>      file://nss-fix-support-cross-compiling.patch \
>      file://nss-no-rpath-for-cross-compiling.patch \
>      file://nss-fix-incorrect-shebang-of-perl.patch \
> diff --git a/meta/recipes-support/nss/nss_3.17.3.bb b/meta/recipes-suppor=
t/nss/nss_3.17.3.bb
> index e7d0780..b22eb95 100644
> --- a/meta/recipes-support/nss/nss_3.17.3.bb
> +++ b/meta/recipes-support/nss/nss_3.17.3.bb
> @@ -1,7 +1,7 @@
> -require nss.inc
> -
> -SRC_URI +=3D "\
> +SRC_URI =3D "\
>      http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_1=
7_3_RTM/src/${BP}.tar.gz \
>  "

Why don't you move this to .inc file and replace "3_17_3_RTM" with some
variable set in .bb, it would be easier to read than this reorder and
require .inc later..

>  SRC_URI[md5sum] =3D "fba7489e1b26f2a0bfe5527430fd61e1"
>  SRC_URI[sha256sum] =3D "f4d5e9035a2f84f25f35c283de3b0ff60d72e918748de25e=
af017ed201fa21d5"
> +
> +require nss.inc
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

--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NdAACgkQN1Ujt2V2gBybmgCgm0qzz2QDe+esQDdoymEKCUOI
0t4AoIR491/p0WjNK3/5117YRfQgZeFr
=Tr11
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--
