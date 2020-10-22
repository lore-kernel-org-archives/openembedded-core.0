Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.8959.1603365059698830020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 04:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=e7u1fk6A;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3411; q=dns/txt; s=axis-central1;
  t=1603365060; x=1634901060;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XB96K2zYtttn96ZEvFlwMyIZiRhBJUTT2OCWqs3k5nM=;
  b=e7u1fk6AF7nKyqCFqhPvB6elPWgkSkBLZYYIDynuIWzWMPs6h14t53vM
   qEx0NED9SL4p1K3Wh11W3dgokOUEuLN5r8o31EowJjtp01qPNCuaIi4h9
   w53k1EMtas2dCzRC49HF/jdjebujB4aR3Xt45mbaGo/H+V1hDe4gLk0zi
   X7ob8BndeEN/xV3u/9Lu61WF8Slw5KLv7DPQN9X0JOundjyBDHR9JWEdU
   nc93hQ0g4M5Grdzf8k+wiigwYAn2e7OTwcsu0Qinv/s9+pvaQPXqWlKso
   8RVvJdYDL8qteOpEMNc9qanqsUxjW+/5u6bvJ0l7JKwSN/2lSC/iRI+kG
   A==;
IronPort-SDR: amk1UNmcoeI8i6G59VUU9MHZhs5Rt2Fi/r3rlBoY09Vv9j9F0Urwg/tMJxPPzFCJd5Ux5g/kX/
 PNmo8JIHn6fCy59vUNpaPMumUJryT+Yjt7NW6aGRwOQFnpvgQY8ustROISxDj91uHN06Eo/LHn
 kmzTnkQUmwajso/UaYP9Yo0ebp9SPJ4D14G56kdh0J4T7d0l6X1hjheb5mU3EG0ZSZsZ6UxCKi
 nP1FNHnoPYpnTGQc1KXpZCmx72VcWe8X3TXts0OCz0mZmXHshXCv1rphRynhhKPaOKtST6x19A
 1Z0=
X-IronPort-AV: E=Sophos;i="5.77,404,1596492000"; 
   d="scan'208";a="13804055"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "kweihmann@outlook.com" <kweihmann@outlook.com>
Subject: Re: [OE-core] [PATCH v2] Add new recipe for squashfs-tools-ng
Thread-Topic: [OE-core] [PATCH v2] Add new recipe for squashfs-tools-ng
Thread-Index: AQHWqFSPRaPfp/6H6kKVjenywzwP3qmjdTpQ
Date: Thu, 22 Oct 2020 11:10:56 +0000
Message-ID: <c746e94871f743bf81c38fdf18c9360d@XBOX03.axis.com>
References: <20201021155857.2841570-1-luca.boccassi@gmail.com>
 <20201022092000.2917248-1-luca.boccassi@gmail.com>
In-Reply-To: <20201022092000.2917248-1-luca.boccassi@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Luca Bocassi
> Sent: den 22 oktober 2020 11:20
> To: openembedded-core@lists.openembedded.org
> Cc: kweihmann@outlook.com
> Subject: [OE-core] [PATCH v2] Add new recipe for squashfs-tools-ng
>=20
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> The main difference with squashfs-tools is the availability
> of a shared library and a programmatic interface, rather
> than just command-line tools.
>=20
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: added MIT, Zlib and BSD-2-Clause to LICENSE
>=20
>  .../squashfs-tools-ng_git.bb                  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-
> tools-ng_git.bb
>=20
> diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_gi=
t.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> new file mode 100644
> index 0000000000..6479017ddb
> --- /dev/null
> +++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> @@ -0,0 +1,37 @@
> +SUMMARY =3D "New set of tools for working with SquashFS images"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv3+ & LGPL-3.0+ & MIT & BSD-2-Clause & Zlib"

Change "GPLv3+" to "GPL-3.0+" for consistency.

You have GPL-2.0 listed below too so it should probably be added=20
above as well.

> +LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3Dc0de2c0aca56349dab98e97992=
316f7e \
> +                    file://licenses/GPLv2.txt;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263 \
> +                    file://licenses/GPLv3.txt;md5=3D1ebbd3e34237af26da5d=
c08a4e440464 \
> +                    file://licenses/hash_table.txt;md5=3D874823605326cae=
aabaa95bfbd0f9fb0 \
> +                    file://licenses/LGPLv3.txt;md5=3D3000208d539ec061b89=
9bce1d9ce9404 \
> +                    file://licenses/LZ4.txt;md5=3Debc2ea4814a64de7708f15=
71904b32cc \
> +                    file://licenses/xxhash.txt;md5=3Df042a9be092bd6d7fe6=
f217d8d00f4ca \
> +                    file://licenses/xz.txt;md5=3D1c389b9610ccfdb25f7abae=
a6a0bb5a4 \
> +                    file://licenses/zlib.txt;md5=3Dae27c72096606131f760e=
5f59cf98b06 \
> +                    file://licenses/zstd.txt;md5=3D8df8137b630239cbdd4c0=
674124cb0c8"
> +
> +PV =3D "1.0.2"

Move the version to the file name.

> +SRCREV =3D "b96f0fc154feef531be76034bf6e38925636146f"
> +SRC_URI =3D "git://github.com/AgentD/squashfs-tools-ng.git;protocol=3Dht=
tps \
> +"

I'd remove that backslash and keep it as one line.

> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGECONFIG ??=3D "gzip xz lzo lz4 zstd ${@bb.utils.contains('DISTRO_F=
EATURES', 'selinux', 'selinux', '', d)}"

Change to:

PACKAGECONFIG ??=3D "gzip xz lzo lz4 zstd ${@bb.utils.filter('DISTRO_FEATUR=
ES', 'selinux', d)}"

> +PACKAGECONFIG[gzip] =3D "--with-gzip,--without-gzip,zlib"
> +PACKAGECONFIG[xz] =3D "--with-xz,--without-xz,xz"
> +PACKAGECONFIG[lzo] =3D "--with-lzo,--without-lzo,lzo"
> +PACKAGECONFIG[lz4] =3D "--with-lz4,--without-lz4,lz4"
> +PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zstd"
> +PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
> +
> +PACKAGES =3D+ "libsquashfs"
> +FILES_libsquashfs =3D "${libdir}/libsquashfs*${SOLIBS}"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +CVE_PRODUCT =3D "squashfs"
> --
> 2.20.1

//Peter

