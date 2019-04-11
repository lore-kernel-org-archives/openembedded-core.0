Return-Path: <prvs=9974216f9=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Apr 2019 10:47:50 UTC
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id 20AB57D3C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1554979673; x=1586515673;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=/rBoZnsVbg+rX5WapuZBX4atd/sYDXRCKltyNZotxqw=;
	b=CWmpkbg9DBuplslaIAeN5Dc7XvBm8ZQd8BUbKDwMc7eWOrNMjCH1/rf9
	PTyVzZMYpAryaaU2V7CMoj5Zm/K+9urGcFunTcdQkI9z6qja1dQbYiyex
	nrzcPlNFLE2vNrdElCcmEIW+l42oS97N+qSmSUVkW3FJRdZakxrVrMDE9 g=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 11 Apr 2019 12:40:44 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw6.muc with ESMTP/TLS;
	11 Apr 2019 12:40:43 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb4.muc with ESMTP/TLS; 11 Apr 2019 12:40:43 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Thu, 11 Apr 2019 12:40:43 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.003;
	Thu, 11 Apr 2019 12:40:43 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] elfutils: update LICENSE to include GPLv2 for shared
	libraries
Thread-Index: AQHU8EvHwq5Kg0KcjU+j6ELZHJRqhqY2o+YA
Date: Thu, 11 Apr 2019 10:40:43 +0000
Message-ID: <20190411104042.GE20077@hiutale>
References: <1554976120-21849-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1554976120-21849-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.45]
MIME-Version: 1.0
Subject: Re: [PATCH] elfutils: update LICENSE to include GPLv2 for shared libraries
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
X-List-Received-Date: Thu, 11 Apr 2019 10:47:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B9BFD1F8F278E458DC4BFD3723C260D@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 12:48:40PM +0300, Mikko Rapeli wrote:
> NEWS file in the sources says this about switch from GPLv2 to
> GPLv3 license:
>=20
> https://sourceware.org/git/?p=3Delfutils.git;a=3Dblob;f=3DNEWS;h=3D5a0604=
7f255e3c9a63828953759fd18a4ba9a3f3;hb=3DHEAD#l362
>=20
>  362 The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for st=
and-alone
>  363 programs. There is now also a formal CONTRIBUTING document describin=
g how to
>  364 submit patches.
>=20
> libasm, libdw and libelf are thus covered optionally by GPLv2 license.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.175.bb | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.175.bb
> index b0b9ddc..6d1279a 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Utilities and libraries for handling compiled object files"
>  HOMEPAGE =3D "https://sourceware.org/elfutils"
>  SECTION =3D "base"
> -LICENSE =3D "(GPLv3 & Elfutils-Exception)"
> +LICENSE =3D "(GPLv2 & LGPLv3+ & GPLv3+ & Elfutils-Exception)"

Can anyone find the Elfutils-Exception in current 0.175 or sumo 0.170 sourc=
es?

Debian is also listing libraries with GPLv2+ | LGPLv3+ and executables
with GPLv3+ in

https://tracker.debian.org/media/packages/e/elfutils/copyright-0.176-1

Should I also drop the Elfutils-Exception?

-Mikko

>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>  DEPENDS =3D "libtool bzip2 zlib virtual/libintl"
>  DEPENDS_append_libc-musl =3D " argp-standalone fts "
> @@ -53,6 +53,18 @@ BBCLASSEXTEND =3D "native nativesdk"
> =20
>  # Package utilities separately
>  PACKAGES =3D+ "${PN}-binutils libelf libasm libdw"
> +
> +# shared libraries are licensed GPLv2 or GPLv3+, binaries GPLv3+
> +# according to NEWS file:
> +# "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for sta=
nd-alone
> +# programs. There is now also a formal CONTRIBUTING document describing =
how to
> +# submit patches."
> +LICENSE_${PN}-binutils =3D "GPLv3+"
> +LICENSE_${PN} =3D "GPLv3+"
> +LICENSE_libelf =3D "GPLv2 | LGPLv3+"
> +LICENSE_libasm =3D "GPLv2 | LGPLv3+"
> +LICENSE_libdw =3D "GPLv2 | LGPLv3+"
> +
>  FILES_${PN}-binutils =3D "\
>      ${bindir}/eu-addr2line \
>      ${bindir}/eu-ld \
> --=20
> 1.9.1=

