Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5D64D6FF3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 17:34:31 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id y69so8102915pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=B2D8J3N9b6I6gwkawyQyXGIkVxEcvd3V+F8NroYztTc=;
	b=VQrd/VQkAtHP9tdp03ATMU50kcaWvZADIt6qPuoFjfIcqZZfRcsBNdEhy/e0XArN9V
	p0xLpAj0ihiow8u70PSmm0a1tRhJwYM60RDHWzo1jXLYuQ9n1mRq0z+p/uksnG7lKiMj
	k+gZFKctONGZstaCVSTgLwThcQ2FEywSRgZ7bCjqg3doL9zxxRDmbm7NNxY1gbkHLGRR
	ZDyYkhT0Bx6bL16QhqZczL7DNp58ZNMKL7NZ25AECncsMshgBsDckh82i6pOWjaUSp45
	9Oe41CFdMmHlJWrglDea8dtMPjIQAzQeGsbtMqaVM8Wcmlsqn5l65KigITHgf8MymwNb
	mmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=B2D8J3N9b6I6gwkawyQyXGIkVxEcvd3V+F8NroYztTc=;
	b=h7nXrlptN7TRnau1419IHHaQAQkGkqLd3IezhhaEa59PezltEMCJ0LUEOWMTp7VLd5
	zSg9xka8OfpZbaSOqV+Ysct7G4JeIZ/FjGaakahZdYhYe0sOMe4cFXfRjilLArZJVTXg
	K8R9npTKyCWS47FlPpmogxJPWS93Z66iehKSudqgjEr4rmKlZKLMcWi717x2lR5V9EK6
	HqKAlhv0/TvqncKZM6wM/6hx3uUrcfQjvJ8bUoNX3HTfdMIP1z5W7R28yAjW4x8AXQOQ
	6g7UdnD70mc+iuzb+5UZnCcEH+JYl19dwfd5v/9sf2gZvoPxjiBnuhpiZfRafib4L4NO
	MFmw==
X-Gm-Message-State: AOPr4FXds89HoN1ZShnCKiVJ6pofDt5eGCmWqX+7lzxfSWH9v3U7g90yJekMUtDSdSbh4w==
X-Received: by 10.98.29.137 with SMTP id d131mr60220991pfd.2.1462901672646;
	Tue, 10 May 2016 10:34:32 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:849:3ad9:b6cc:ba75?
	([2601:646:8800:5a9a:849:3ad9:b6cc:ba75])
	by smtp.gmail.com with ESMTPSA id
	p187sm5984985pfb.3.2016.05.10.10.34.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 10:34:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1462897329-21485-1-git-send-email-danismostlikely@gmail.com>
Date: Tue, 10 May 2016 10:34:43 -0700
Message-Id: <9ACA7F12-D225-4D8D-AA96-B03F5356FB29@gmail.com>
References: <1462897329-21485-1-git-send-email-danismostlikely@gmail.com>
To: danismostlikely@gmail.com
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH v2] pkgconfig: Fix build with gcc-6 and upgrade to 0.29.1
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
X-List-Received-Date: Tue, 10 May 2016 17:34:34 -0000
X-Groupsio-MsgNum: 81817
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1F58AAF6-1D74-40FB-9A30-8C5FFC30A984";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1F58AAF6-1D74-40FB-9A30-8C5FFC30A984
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Please look into my gcc-6 branch, this is fixed with

=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/gcc=
-6&id=3D64ff9cec84c28348fda7ec5b8e1d98cfe94c7949

> On May 10, 2016, at 9:22 AM, danismostlikely@gmail.com wrote:
>=20
> From: Dan McGregor <danismostlikely@gmail.com>
>=20
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>=20
> glib patch is backported from glib-2.0 upstream
> eventually we will throw it away once pkgconfig
> moves to newer glib
>=20
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> ...e-Move-warning-pragma-outside-of-function.patch | 39 =
++++++++++++++++++++++
> meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  6 ++--
> 2 files changed, 43 insertions(+), 2 deletions(-)
> create mode 100644 =
meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-o=
utside-of-function.patch
>=20
> diff --git =
a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma=
-outside-of-function.patch =
b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma=
-outside-of-function.patch
> new file mode 100644
> index 0000000..14c8293
> --- /dev/null
> +++ =
b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma=
-outside-of-function.patch
> @@ -0,0 +1,39 @@
> +=46rom 946d36266d8a30f04fe34d3183bf4929141934d2 Mon Sep 17 00:00:00 =
2001
> +From: coypu <coypu@sdf.org>
> +Date: Wed, 2 Mar 2016 19:38:48 +0200
> +Subject: [PATCH] gdate: Move warning pragma outside of function
> +
> +Commit 0817af40e8c74c721c30f6ef482b1f53d12044c7 breaks the build on
> +older versions of GCC, which don't allow pragma inside functions.
> +
> +https://bugzilla.gnome.org/761550
> +---
> +Upstream-Status: Backport
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> + glib/glib/gdate.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/glib/glib/gdate.c b/glib/glib/gdate.c
> +index 1978cf7..20e6c4a 100644
> +--- a/glib/glib/gdate.c
> ++++ b/glib/glib/gdate.c
> +@@ -2439,6 +2439,9 @@ win32_strftime_helper (const GDate     *d,
> +  *
> +  * Returns: number of characters written to the buffer, or 0 the =
buffer was too small
> +  */
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> ++
> + gsize
> + g_date_strftime (gchar       *s,
> +                  gsize        slen,
> +@@ -2549,3 +2552,5 @@ g_date_strftime (gchar       *s,
> +   return retval;
> + #endif
> + }
> ++
> ++#pragma GCC diagnostic pop
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb =
b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> index d34f608..f654eee 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> @@ -12,12 +12,13 @@ DEPENDS =3D "glib-2.0"
> DEPENDS_class-native =3D ""
> DEPENDS_class-nativesdk =3D ""
>=20
> -SRCREV =3D "5914edfe9604abfedd220103cbac382fc4d268bb"
> -PV =3D "0.29+git${SRCPV}"
> +SRCREV =3D "87152c05be88ca8be71a3a563f275b3686d32c28"
> +PV =3D "0.29.1+git${SRCPV}"
>=20
> SRC_URI =3D "git://anongit.freedesktop.org/pkg-config \
>            file://pkg-config-native.in \
>            file://fix-glib-configure-libtool-usage.patch \
> +           =
file://0001-gdate-Move-warning-pragma-outside-of-function.patch \
>            "
>=20
> S =3D "${WORKDIR}/git"
> @@ -27,6 +28,7 @@ inherit autotools
> EXTRA_OECONF =3D "--without-internal-glib"
> EXTRA_OECONF_class-native =3D "--with-internal-glib"
> EXTRA_OECONF_class-nativesdk =3D "--with-internal-glib"
> +CFLAGS_append_class-native =3D " -Wno-error=3Dformat-nonliteral"
>=20
> acpaths =3D "-I ."
>=20
> --
> 2.8.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_1F58AAF6-1D74-40FB-9A30-8C5FFC30A984
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcyG7cACgkQuwUzVZGdMxQHEQCeNANhKM6phwX5JgywzoKdh6H8
NxQAnjOXuNZW71W43UTONWaz/zFbLFK4
=ymP+
-----END PGP SIGNATURE-----

--Apple-Mail=_1F58AAF6-1D74-40FB-9A30-8C5FFC30A984--
