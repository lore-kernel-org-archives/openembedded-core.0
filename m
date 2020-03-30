Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.48674.1585571126101132193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 05:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ifrBB09a;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2030; q=dns/txt; s=axis-central1;
  t=1585571126; x=1617107126;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9Nod8bOWdXgkMIDFZDCwsQUl6eePvhaKxIfSNlfpUok=;
  b=ifrBB09aVOI2pU16OGkDQkuFr5gzSWa/v5lZ6znOybjcs2IBWbiojX9i
   08CJUAD10oe75D4d0tbXL894mnTnZr9ggRKB5c3DDCwqMs43EdWWjAPI8
   N/3A7J5S4ghgCBDjIogcFXNNACF5lN50cQA8X2zqAmx0KQopv1ylRF+qc
   YDIgEawoIfORNy1F1sD9qsUL8RLiPAxTjaXTf27J8b+JuxrfrIzJQiNUx
   uheqFyw2li/97DubRIEBhtj5o7k7eGTRrl3HGenPVhkWqixtE7B/scEF5
   trOB8IWCT0jj+mzQiLnXPrqm/y3UVY8WP/mz8io5MNb3vgoCyvpbft+kl
   Q==;
IronPort-SDR: /wrAVZ+rS6CG03612RalfWzIA3cTshhA7KLHYwuSkkSFIZJ2ZhxgYD7y5qpfchk/26vcWjh7AF
 CUMcV83iBdAyme1lV/MZB4dKMaw6ffLXqjfuXN0j/7kqa7w+ioiFuAaGP7sIGF9Secs3m2GOEf
 gbeNaBd9vz4k1KJtrhVf4v96Qah+cUcVqUnx8dobqdPBpRxi2txgDkXnNYaKeZQ6lCMckwO9z+
 WCG2h5aa4k8JKXGDdDFg4t+MFiplISQjqAJCAUlawy1TjLBhEvjewowABixg/NtdlSmLTA7CB4
 oHI=
X-IronPort-AV: E=Sophos;i="5.72,324,1580770800"; 
   d="scan'208";a="6905920"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] append_: adjust some appends to guarantee leading space
Thread-Topic: [OE-core] [PATCH] append_: adjust some appends to guarantee
 leading space
Thread-Index: AQHWBhK7HEzFrZUeFEqzI6Wpm7vjC6hhD08w
Date: Mon, 30 Mar 2020 12:25:24 +0000
Message-ID: <63d5d863bfb4420e933e3eb7415da630@XBOX03.axis.com>
References: <alpine.LFD.2.21.2003291739390.16161@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2003291739390.16161@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of rpjday@crashcourse.ca
> Sent: den 29 mars 2020 23:41
> To: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] [PATCH] append_: adjust some appends to guarantee lead=
ing space

Please split in one patch per recipe.

//Peter

>=20
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.178.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.178.bb
> index 8f5deb2c62..c500ae3c19 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.178.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.178.bb
> @@ -56,7 +56,7 @@ PACKAGECONFIG[xz] =3D "--with-lzma,--without-lzma,xz"
>=20
>  RDEPENDS_${PN}-ptest +=3D "libasm libelf bash make coreutils ${PN}-binut=
ils"
>=20
> -EXTRA_OECONF_append_class-target +=3D "--disable-tests-rpath"
> +EXTRA_OECONF_append_class-target =3D " --disable-tests-rpath"
>=20
>  RDEPENDS_${PN}-ptest_append_libc-glibc =3D " glibc-utils"
>=20
> diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devto=
ols/file/file_5.38.bb
> index 99c75988c2..b8f09107e8 100644
> --- a/meta/recipes-devtools/file/file_5.38.bb
> +++ b/meta/recipes-devtools/file/file_5.38.bb
> @@ -23,8 +23,8 @@ EXTRA_OECONF +=3D "--disable-libseccomp"
>  ALTERNATIVE_${PN} =3D "file"
>  ALTERNATIVE_LINK_NAME[file] =3D "${bindir}/file"
>=20
> -EXTRA_OEMAKE_append_class-target =3D "-e FILE_COMPILE=3D${STAGING_BINDIR=
_NATIVE}/file-native/file"
> -EXTRA_OEMAKE_append_class-nativesdk =3D "-e FILE_COMPILE=3D${STAGING_BIN=
DIR_NATIVE}/file-native/file"
> +EXTRA_OEMAKE_append_class-target =3D " -e FILE_COMPILE=3D${STAGING_BINDI=
R_NATIVE}/file-native/file"
> +EXTRA_OEMAKE_append_class-nativesdk =3D " -e FILE_COMPILE=3D${STAGING_BI=
NDIR_NATIVE}/file-native/file"
>=20
>  FILES_${PN} +=3D "${datadir}/misc/*.mgc"

//Peter

