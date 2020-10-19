Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.9373.1603096167661598008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 01:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ebpGs14a;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3291; q=dns/txt; s=axis-central1;
  t=1603096168; x=1634632168;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Bcqz8CQv7ZidC36HR0coMAOfRTzejG57GE12KcN4BKQ=;
  b=ebpGs14axGt9sPrBH6QKddfOi8s7ecfONDReDeOaMsymMl6JIdyxCJOy
   EDzg4lSUN4Zg86ZbDVJZ+j2G0CO4kLbzXnOnAOjk2I1EN/DNInk3JnJA6
   kI0THsjpMtSa0bLST5ZKlUYnaMdxTOg4cYzR1KOAzvHmo7NCsdsirn4Ai
   tSA9hCi4rQVO0Q+s1okgNNBEeJ30JREzvQ8xgARFOhvo8tzVMFvNyG8c9
   CPBujm07agLKyHJlvI5QwYOSIof+TfgYZ5vaVVBTrgADS/WcU0HX6Mqfz
   Sy9G8MDzp9Qip4WLMdKYUr5q+hVgHh7cUe9Afsh3Te2+N6aF3TGCYvLx8
   g==;
IronPort-SDR: JDi0LMyesFQ/MhoBQp5cFQJwZD1KVCEZ4YarjUoogCZO4cIaXC9Sp6uXcqPZL7oIPICmRd9psM
 hNKCiZmx3rqp3duMG9QWdO+Ff3qZ/dOhkFCjM+BPdyYS5tHg4eBVp9XXxwFYO2cmPI0zbJsopZ
 hpeuSBSe4nEkE+68prcceREIgqr83xLiWIl8ZdbS13V8oqKkTvQUxATO7s9QGqxtgdFVIS6vlH
 iwkXghfHqwFUxDUczqUSopZgfsR6hfMbKVoRpuEnA2dP8o2mKE8UxaV9l62uyCeGVOxgsNpwDu
 aA4=
X-IronPort-AV: E=Sophos;i="5.77,394,1596492000"; 
   d="scan'208";a="14155408"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 5/5] spirv-tools: fix identation
Thread-Topic: [OE-core] [PATCH v3 5/5] spirv-tools: fix identation
Thread-Index: AQHWpJIgLmSdhz/JOkeUkG2p2D/cQ6memT6A
Date: Mon, 19 Oct 2020 08:29:21 +0000
Message-ID: <fd4eccc67f224c21b957742e33988bfd@XBOX03.axis.com>
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
 <20201017142935.3605756-5-quaresma.jose@gmail.com>
In-Reply-To: <20201017142935.3605756-5-quaresma.jose@gmail.com>
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
> core@lists.openembedded.org> On Behalf Of Jose Quaresma
> Sent: den 17 oktober 2020 16:30
> To: openembedded-core@lists.openembedded.org
> Cc: Jose Quaresma <quaresma.jose@gmail.com>
> Subject: [OE-core] [PATCH v3 5/5] spirv-tools: fix identation
>=20
> replace tabs with spaces and remove extra spaces
>=20
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/recipes-graphics/spir/spirv-tools_git.bb | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes=
-graphics/spir/spirv-tools_git.bb
> index d1c2436cd9..8c4d4299ed 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_git.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
> @@ -9,12 +9,12 @@ SECTION =3D "graphics"
>  S =3D "${WORKDIR}/git"
>  DEST_DIR =3D "${S}/external"
>  SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;name=3Dspirv-=
tools \
> -	git://github.com/KhronosGroup/SPIRV-Headers.git;name=3Dspirv-headers;de=
stsuffix=3D${DEST_DIR}/spirv-headers \
> - 	git://github.com/google/effcee.git;name=3Deffcee;destsuffix=3D${DEST_D=
IR}/effcee \
> - 	git://github.com/google/re2.git;name=3Dre2;destsuffix=3D${DEST_DIR}/re=
2 \
> - 	git://github.com/google/googletest.git;name=3Dgoogletest;destsuffix=3D=
${DEST_DIR}/googletest \
> -        file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file=
.patch \
> -        file://0001-Avoid-pessimizing-std-move-3124.patch \
> +           git://github.com/KhronosGroup/SPIRV-Headers.git;name=3Dspirv-=
headers;destsuffix=3D${DEST_DIR}/spirv-headers \
> +           git://github.com/google/effcee.git;name=3Deffcee;destsuffix=
=3D${DEST_DIR}/effcee \
> +           git://github.com/google/re2.git;name=3Dre2;destsuffix=3D${DES=
T_DIR}/re2 \
> +           git://github.com/google/googletest.git;name=3Dgoogletest;dest=
suffix=3D${DEST_DIR}/googletest \
> +           file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-f=
ile.patch;destsuffix=3D${DEST_DIR}/effcee \
> +           file://0001-Avoid-pessimizing-std-move-3124.patch \
>  "
>  SRCREV_spirv-tools =3D "c413b982c316b14e784f50d941814fc737b55b4a"
>  SRCREV_spirv-headers =3D "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
> @@ -27,10 +27,10 @@ inherit cmake python3native
>  EXTRA_OECMAKE +=3D "-DSPIRV_WERROR=3DOFF"
>=20
>  do_install_append() {
> -	install -d ${D}/${includedir}/spirv
> -	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${in=
cludedir}/spirv
> -	install -d ${D}/${includedir}/spirv/unified1
> -	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}=
/${includedir}/spirv/unified1
> +    install -d ${D}/${includedir}/spirv
> +    install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/$=
{includedir}/spirv
> +    install -d ${D}/${includedir}/spirv/unified1
> +    install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* $=
{D}/${includedir}/spirv/unified1

Shell code in OE-Core is actually expected to be indented using tabs,=20
so this part should be reverted. However, while you are here, you=20
should change "${D}/${includedir}" to "${D}${includedir}".

>  }
>=20
>  FILES_SOLIBSDEV =3D ""
> --
> 2.28.0

//Peter

