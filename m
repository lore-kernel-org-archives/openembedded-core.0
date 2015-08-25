Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 09026734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 00:32:14 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so18156397pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 17:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Ew9Dsgju76SpiuTzR0cAD2EVHg9tB5wgiddpJOlcaeo=;
	b=kN+xJCo6nqPMg+QqEDZrAt0eebG1CRES0HDafIPA7/Rp6umcbYh6Hg2p3Uoczc4s0F
	iol1rJ58/29cuhz0bMjvb4EyRZquQN7sonSXt5NEz2q1tXtl+ZD71gtoG/lKn4VzlcVT
	kMZN5HyLTldhotPcBlj0NFBZrhfijhwWY8idblXfDx/8UxsUlr/6TMmBr2USpcVxlZe3
	5h49wEhOiMM7kc5PUY7FPhkJyiN0S0lWer3kAMd9TGtZzlq6TYpkzBkIQf47aouRhhcX
	tMvYEmXh2A3HR8BKnSf5Gi+MjqdD/LcJiPO3YNs8iRPC5oSefgDp6EubIHUBIwNvduvw
	eaFQ==
X-Received: by 10.66.228.71 with SMTP id sg7mr50916780pac.121.1440462735207;
	Mon, 24 Aug 2015 17:32:15 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ded:b62b:f72d:209d?
	([2601:646:8601:4580:4ded:b62b:f72d:209d])
	by smtp.gmail.com with ESMTPSA id
	pk8sm18744963pdb.54.2015.08.24.17.32.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Aug 2015 17:32:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <a4f5aee1dac48d9455c616c8fe75f780f2d4246e.1440454579.git.chris_larson@mentor.com>
Date: Mon, 24 Aug 2015 17:32:12 -0700
Message-Id: <1BF41B12-84C2-4B3E-B6D8-28513FB87A12@gmail.com>
References: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
	<cover.1440454579.git.chris_larson@mentor.com>
	<a4f5aee1dac48d9455c616c8fe75f780f2d4246e.1440454579.git.chris_larson@mentor.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] libatomic-ops: move to recipes-support, fix recipe name
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
X-List-Received-Date: Tue, 25 Aug 2015 00:32:20 -0000
X-Groupsio-MsgNum: 69960
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E8EFF500-FEFD-4917-AE30-5A20E7765C1D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E8EFF500-FEFD-4917-AE30-5A20E7765C1D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 24, 2015, at 3:19 PM, Christopher Larson <kergoth@gmail.com> =
wrote:
>=20
> - This recipe is useful for more than just pulseaudio, so move it to
>  recipes-support.
> - Rename to the correct upstream name, which corresponds to the =
library name.
>  Keep a PROVIDES of libatomics-ops for compatibility.
>=20

There have been few fixes especially for gcc5 see
=
https://github.com/ivmai/libatomic_ops/commit/437c10b73ae4b83306f77c851cf8=
385172ae3759
can you also bring those in while you are at it ?

> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
> meta/recipes-devtools/guile/guile_2.0.11.bb                            =
 | 2 +-
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc                      =
 | 2 +-
> meta/recipes-support/bdwgc/bdwgc_7.4.2.bb                              =
 | 2 +-
> .../libatomic-ops/libatomic-ops_7.4.2.bb}                              =
 | 1 +
> meta/recipes-support/libunwind/libunwind.inc                           =
 | 2 +-
> 5 files changed, 5 insertions(+), 4 deletions(-)
> rename meta/{recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb =3D> =
recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb} (96%)
>=20
> diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb =
b/meta/recipes-devtools/guile/guile_2.0.11.bb
> index 71f696e..4869694 100644
> --- a/meta/recipes-devtools/guile/guile_2.0.11.bb
> +++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
> @@ -37,7 +37,7 @@ BBCLASSEXTEND =3D "native"
>=20
> DEPENDS =3D "libunistring bdwgc gmp libtool libffi ncurses readline"
> # add guile-native only to the target recipe's DEPENDS
> -DEPENDS_append_class-target =3D " guile-native libatomics-ops"
> +DEPENDS_append_class-target =3D " guile-native libatomic-ops"
>=20
> RDEPENDS_${PN}_append_libc-glibc_class-target =3D =
"glibc-gconv-iso8859-1"
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc =
b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 3389ec9..a098473 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://GPL;md5=3D4325afd396febcb659c36b49533135d4 \
>                     file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 =
\
>                     =
file://src/pulsecore/resampler.h;beginline=3D4;endline=3D21;md5=3D09794012=
ae16912c0270f3280cc8ff84"
>=20
> -DEPENDS =3D "libatomics-ops liboil libsndfile1 libtool"
> +DEPENDS =3D "libatomic-ops liboil libsndfile1 libtool"
> # optional
> DEPENDS +=3D "udev alsa-lib glib-2.0 dbus gconf"
> DEPENDS +=3D "json-c gdbm speexdsp libxml-parser-perl-native libcap"
> diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb =
b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> index 23ec954..1ca8cf7 100644
> --- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> +++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> @@ -36,6 +36,6 @@ inherit autotools pkgconfig
>=20
> # by default use external libatomic-ops
> PACKAGECONFIG ??=3D "libatomic-ops"
> -PACKAGECONFIG[libatomic-ops] =3D =
"--with-libatomic-ops=3Dyes,--with-libatomic-ops=3Dno,libatomics-ops"
> +PACKAGECONFIG[libatomic-ops] =3D =
"--with-libatomic-ops=3Dyes,--with-libatomic-ops=3Dno,libatomic-ops"
>=20
> BBCLASSEXTEND =3D "native nativesdk"
> diff --git =
a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb =
b/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
> similarity index 96%
> rename from meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb
> rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
> index 26faabb..4d0e299 100644
> --- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb
> +++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
> @@ -1,6 +1,7 @@
> SUMMARY =3D "A library for atomic integer operations"
> HOMEPAGE =3D "https://github.com/ivmai/libatomic_ops/"
> SECTION =3D "optional"
> +PROVIDES +=3D "libatomics-ops"
> LICENSE =3D "GPLv2 & MIT"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
>                     =
file://doc/LICENSING.txt;md5=3De00dd5c8ac03a14c5ae5225a4525fa2d \
> diff --git a/meta/recipes-support/libunwind/libunwind.inc =
b/meta/recipes-support/libunwind/libunwind.inc
> index c8eab58..6660af2 100644
> --- a/meta/recipes-support/libunwind/libunwind.inc
> +++ b/meta/recipes-support/libunwind/libunwind.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "a portable and efficient C =
programming interface (API) to determi
> HOMEPAGE =3D "http://www.nongnu.org/libunwind"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D3fced11d6df719b47505837a51c16ae5"
> -DEPENDS +=3D "libatomics-ops"
> +DEPENDS +=3D "libatomic-ops"
>=20
> SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
>=20
> --
> 2.2.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_E8EFF500-FEFD-4917-AE30-5A20E7765C1D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXbt5AACgkQuwUzVZGdMxRQtACfUF3Ly74qCCP3ofa8wwv31y5G
DL8An121hsyZROJtwdBi431713za9A86
=0L7T
-----END PGP SIGNATURE-----

--Apple-Mail=_E8EFF500-FEFD-4917-AE30-5A20E7765C1D--
