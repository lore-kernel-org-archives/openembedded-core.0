Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1375.1614887309482535599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 11:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=MpbCwmVo;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614887309;
  x=1646423309;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7OTB7/B+0ACDNeEFSjtfSL0uEQv3MUgLJGNc0/5xbuU=;
  b=MpbCwmVo0lOHThtN6IGXPO+vMnQBWr2cLUsW8RkTl89opwtzJmOGSDZq
   gYs0cbL33ObcOXvIyyTNh88h/2jNjkECy6NBkvlfwvLwH/9FkH7z72b6x
   tggm3XjkpD/LOsuzzrZSl5DSCk/Bvx4BEgudnTcOu54ZhTcIF9hvz2lsQ
   hRo3n5ekBBLVy+Cta4AfAtcXrJuMESezTdBouDvXVeNastpEe1uiQIz3W
   BJORgm6tKDzsipRNgeRDwI0RFPl2FmkvsqMTOQbOzI0sFOAlzDAh/fDmi
   1jmYbstwC4kdKnlfGeuOXhxqbacZA4lUZ2mHZbqFzwKI50u7cmwOWGQ58
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] uninative-tarball: Add a dependency on nativesdk-glibc-dbg
Thread-Topic: [OE-core] [PATCH] uninative-tarball: Add a dependency on
 nativesdk-glibc-dbg
Thread-Index: AQHXCu8mv2/pK4JlPUCglpfboltJoqp0SK4Q
Date: Thu, 4 Mar 2021 19:48:16 +0000
Message-ID: <0ade419d4dd14cc8bbae6102070b86c2@XBOX03.axis.com>
References: <1666CA5D9DB935C6.854@lists.openembedded.org>
In-Reply-To: <1666CA5D9DB935C6.854@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 24 februari 2021 21:54
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] uninative-tarball: Add a dependency on
> nativesdk-glibc-dbg
>=20
> This adds the debug symbols for the binaries included in the uninative
> tar ball. These are needed if one wants to run valgrind on a native
> binary when uninative is used. Or get complete backtraces using gdb.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> For the uninative tar ball for x86-64 that I built to test this change
> the size increased by ~4% (200 kB). I hope that is acceptable to
> consider this change.
>=20
>  meta/recipes-core/meta/uninative-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-
> core/meta/uninative-tarball.bb
> index c4a6c96b4d..bbdaebad94 100644
> --- a/meta/recipes-core/meta/uninative-tarball.bb
> +++ b/meta/recipes-core/meta/uninative-tarball.bb
> @@ -8,6 +8,7 @@ TOOLCHAIN_TARGET_TASK =3D ""
>  # utf-16, cp1252 - binutils-windres
>  TOOLCHAIN_HOST_TASK =3D "\
>      nativesdk-glibc \
> +    nativesdk-glibc-dbg \
>      nativesdk-glibc-gconv-ibm850 \
>      nativesdk-glibc-gconv-iso8859-1 \
>      nativesdk-glibc-gconv-utf-16 \
