Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id D53506B4F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 09:19:58 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1896556eae.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4GuiYNZUThI6znblFLHIqflaCmZBhslJjlCxazVrAfk=;
	b=ZQKzXS3Yjl9993G1PdEjweOL0FrK+HQm8whyp01/3M2ZBGWhBFTjp1lseF3AGZ2Pkk
	WWcqX30L2u557X0UMqoNEgVkq5pi1Uj/idtL3WomybdbKzh6ougHGjvIe8FnGs4GbU7Y
	hOkqiclbO2sRIUtf7PeyKkK573fXAuKeTjAV5uuHx33HgmOLOeFxAbGDILifA1RZyoXS
	sxTQI7sNlbZiLND8ZmDIniZkwktvCao9b5RxrQhTD9padmPFdzMK+OjeQvYYcdTLAjJU
	V2oP69J5SMupiTuoFpCJmepurLgPePkYNPxM5xTahAyDadMW4PI8vn3LKa6UD8ZgmBIp
	fuhg==
X-Received: by 10.15.86.65 with SMTP id h41mr12084925eez.147.1376039998535;
	Fri, 09 Aug 2013 02:19:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm26958175eel.12.2013.08.09.02.19.57 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 02:19:58 -0700 (PDT)
Date: Fri, 9 Aug 2013 11:20:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130809092044.GE17945@jama>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
	<2db87529704491705f7288abb2ec787f90bcb3c1.1376038140.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <2db87529704491705f7288abb2ec787f90bcb3c1.1376038140.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] x264: add from meta-oe, update and tweak
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
X-List-Received-Date: Fri, 09 Aug 2013 09:19:59 -0000
X-Groupsio-MsgNum: 43151
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Content-Disposition: inline

--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2013 at 09:59:31AM +0100, Paul Eggleton wrote:
> This is required by the default configuration of libav being brought over
> from meta-oe. Changes from the meta-oe recipe:
>=20
> * Update to the latest revision from the stable branch (upstream does
>   not seem to provide stable releases.)
> * Add LICENSE_FLAGS =3D "commercial"
> * Enable PIC to fix text relocation warnings and disable warning for
>   i586 (since PIC can't be used there)
> * Make SUMMARY value slightly shorter
> * Indent SRC_URI properly

I think it was indented correctly and styleguide doesn't define how many
spaces should be used for multiline variables.

>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../don-t-default-to-cortex-a9-with-neon.patch     | 20 +++++++++
>  meta/recipes-multimedia/x264/x264_git.bb           | 52 ++++++++++++++++=
++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta/recipes-multimedia/x264/x264/don-t-default-to-co=
rtex-a9-with-neon.patch
>  create mode 100644 meta/recipes-multimedia/x264/x264_git.bb
>=20
> diff --git a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9=
-with-neon.patch b/meta/recipes-multimedia/x264/x264/don-t-default-to-corte=
x-a9-with-neon.patch
> new file mode 100644
> index 0000000..b844d88
> --- /dev/null
> +++ b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-n=
eon.patch
> @@ -0,0 +1,20 @@
> +-march flag is not in CFLAGS so this will always default to -mcpu=3Dcort=
ex-a8
> +-mfpu=3Dneon.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> +
> +Index: git/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure	2013-02-10 16:26:40.666343682 +0200
> ++++ git/configure	2013-02-10 16:27:49.198341677 +0200
> +@@ -703,9 +703,6 @@
> + fi
> +
> + if [ $asm =3D auto -a $ARCH =3D ARM ] ; then
> +-    # set flags so neon is built by default
> +-    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS=3D"$CFLAGS=
 -mcpu=3Dcortex-a8 -mfpu=3Dneon"
> +-
> +     if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE=
_ARMV6
> +         cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE=
_ARMV6T2
> +         cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE=
_NEON
> diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-mult=
imedia/x264/x264_git.bb
> new file mode 100644
> index 0000000..6c6e9a5
> --- /dev/null
> +++ b/meta/recipes-multimedia/x264/x264_git.bb
> @@ -0,0 +1,52 @@
> +SUMMARY =3D "A free software library and application for encoding video =
streams into the H.264/MPEG-4 AVC format"
> +HOMEPAGE =3D "http://www.videolan.org/developers/x264.html"
> +
> +LICENSE =3D "GPLv2"
> +LICENSE_FLAGS =3D "commercial"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +DEPENDS =3D "yasm-native"
> +
> +SRC_URI =3D "git://git.videolan.org/x264.git \
> +           file://don-t-default-to-cortex-a9-with-neon.patch \
> +           "
> +
> +SRCREV =3D "585324fee380109acd9986388f857f413a60b896"
> +
> +PV =3D "r2265+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit lib_package pkgconfig
> +
> +X264_DISABLE_ASM =3D ""
> +X264_DISABLE_ASM_armv4 =3D "--disable-asm"
> +X264_DISABLE_ASM_armv5 =3D "--disable-asm"
> +
> +EXTRA_OECONF =3D '--prefix=3D${prefix} \
> +                --host=3D${HOST_SYS} \
> +                --cross-prefix=3D${TARGET_PREFIX} \
> +                --sysroot=3D${STAGING_DIR_TARGET} \
> +                --enable-shared \
> +                --enable-static \
> +                --disable-lavf \
> +                --disable-swscale \
> +		--enable-pic \

Don't mix tabs and spaces.

> +                ${X264_DISABLE_ASM} \
> +               '
> +
> +do_configure() {
> +    ./configure ${EXTRA_OECONF}
> +}
> +
> +# Get rid of -e
> +EXTRA_OEMAKE =3D ""
> +AS =3D "${TARGET_PREFIX}gcc"
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +# PIC can't be enabled for 32-bit x86
> +INSANE_SKIP_${PN}_append_i586 =3D " textrel"
> +
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIEtGwACgkQN1Ujt2V2gBxO2gCaAnjGcD2ABZxCzjAB5maJ1M/5
mG4AnRpK06tVT2XwAFcrRkJlILdfC59p
=mL1M
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
