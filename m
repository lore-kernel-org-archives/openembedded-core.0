Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tb5F7-0003KY-6M
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 09:01:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so3745370eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 23:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=l1TMm+tclfIEt+ZByHmERKKinqnS1mTj6AyMLQ5J8FE=;
	b=0NwL+cS7+gB+iHoC8JrnDN25cbM9YTaQ/HdiTA4Ixu2HB503E4hbk4xqjay1GsuhaV
	4wyKAJwXehGmZ95rMNfZxhPFgTpYwqrc8cJKkRJAXT/b1T9pqpD41PZwPNB+0h/UTV4m
	2s985C24YumtFEXBH3APbygOLNmv6lxiqjkSCUsrQ+9yE6CYSRcActpWSWe/pHxwk6T/
	X/Rc9Uz7MA08Ia7PYnfxOBtLrze+dl5KjsCPLAKf3qAfHirWAHcUmkgH0WovbWPAFNPl
	hAS9JkdZ+Ygn7hiM2ml9zZZXwlUe+nV0GrzPmEAzmpg7H+x8uQ7+WDV+Nhiyq1RA3Ry/
	wB3w==
Received: by 10.14.194.72 with SMTP id l48mr42800509een.9.1353484024484;
	Tue, 20 Nov 2012 23:47:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm35567408eem.3.2012.11.20.23.47.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2012 23:47:03 -0800 (PST)
Date: Wed, 21 Nov 2012 08:46:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: fupan.li@windriver.com
Message-ID: <20121121074659.GF12637@jama.jama.net>
References: <1353465025-13655-1-git-send-email-fupan.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1353465025-13655-1-git-send-email-fupan.li@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Randy.MacLeod@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] move the benchmark package bonnie++ from meta-oe layer to oe-core and upgrade bonnie++ from 1.03c to 1.03e
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
X-List-Received-Date: Wed, 21 Nov 2012 08:01:10 -0000
X-Groupsio-MsgNum: 31589
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QNDPHrPUIc00TOLW"
Content-Disposition: inline

--QNDPHrPUIc00TOLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 10:30:25AM +0800, fupan.li@windriver.com wrote:
> From: fli <fupan.li@windriver.com>

Why do you think that bonnie++ is "core" enough to be in oe-core?

Cheers,

>=20
> Signed-off-by: fli <fupan.li@windriver.com>
> ---
>  recipes-benchmark/bonnie/bonnie++_1.03e.bb         |   32 ++++++++++++++=
++++++
>  .../bonnie/files/compiler-error-fix.patch          |   14 +++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 recipes-benchmark/bonnie/bonnie++_1.03e.bb
>  create mode 100644 recipes-benchmark/bonnie/files/compiler-error-fix.pat=
ch
>=20
> diff --git a/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/recipes-benchma=
rk/bonnie/bonnie++_1.03e.bb
> new file mode 100644
> index 0000000..848b206
> --- /dev/null
> +++ b/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> @@ -0,0 +1,32 @@
> +# bonnie OE build file
> +# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Rese=
rved
> +# Released under the GPLv4 license (see copyright.tx)
> +
> +DESCRIPTION=3D"Tests large file IO and creation/deletion of small files."
> +HOMEPAGE =3D "http://www.coker.com.au/bonnie++"
> +SECTION =3D "benchmark/tests"
> +LICENSE=3D"GPLv2"
> +
> +SRC_URI=3D"http://www.coker.com.au/bonnie++/${PN}-${PV}.tgz \
> +	file://compiler-error-fix.patch"
> +
> +SRC_URI[md5sum] =3D "750aa5b5051263a99c6c195888c74968"
> +SRC_URI[sha256sum] =3D "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876=
df8721f01ba2e2cb"
> +LIC_FILES_CHKSUM =3D "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a9150=
ae9cc3ee0"
> +
> +inherit autotools
> +
> +EXES=3D"bonnie++ zcav"
> +SCRIPTS=3D"bon_csv2html bon_csv2txt"
> +
> +PACKAGES +=3D "bonnie-scripts"
> +
> +do_install () {
> +	install -d ${D}/${bindir}
> +	install -d ${D}/${sbindir}
> +	install -m 0755 ${EXES} ${D}/${sbindir}
> +	install -m 0755 ${SCRIPTS} ${D}/${bindir}
> +}
> +
> +FILES_${PN} =3D "${sbindir}"
> +FILES_bonnie-scripts=3D"${bindir}"
> diff --git a/recipes-benchmark/bonnie/files/compiler-error-fix.patch b/re=
cipes-benchmark/bonnie/files/compiler-error-fix.patch
> new file mode 100644
> index 0000000..6655b88
> --- /dev/null
> +++ b/recipes-benchmark/bonnie/files/compiler-error-fix.patch
> @@ -0,0 +1,14 @@
> +---
> + zcav.cpp |    1 +
> + 1 file changed, 1 insertion(+)
> +
> +Index: bonnie++-1.03a/zcav.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bonnie++-1.03a.orig/zcav.cpp
> ++++ bonnie++-1.03a/zcav.cpp
> +@@ -15,6 +15,7 @@ using namespace std;
> + #else
> + #include <vector.h>
> + #endif
> ++#include <string.h>
> +
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

--QNDPHrPUIc00TOLW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCshvMACgkQN1Ujt2V2gBwfmwCeOS4vC/G+1TeGTdEd4x2+yGu5
dQMAoK/3XNKImj8oMlOtPlXr/QK401AR
=WxB2
-----END PGP SIGNATURE-----

--QNDPHrPUIc00TOLW--
