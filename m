Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 701027639E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:43:12 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so71962463wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WqwSb1SERdrlw38NUvYbxhLBCTI654ICqK8x9Ikm2Xo=;
	b=hoiNfc3AS79zrsZdS1TdKF75hBIzdJXr590ow1sDl8o2TG70o5EspUABTiyA9gVPFh
	zCVgCf+Riln//9SN1i+odY6GPVPgvsSXibVSi1/kM0tYmLk14UnwZiMMhRw0F0qs9Q05
	sWUc/9VZYczZy0D4gN0wvmWj1miELjr5zMJs2dKluc9v1ICC/esY9Gs14ADDAHEF8Gio
	T89a0+bWS9+DlLC6zWLB38SgSywAl6aQg13K1/JYhpkRBjSvuz5SuawfA7ydqkC60QLL
	5Q7F1oLeTgGG0hE5Lvw1Npua08U9o7yBStHiReq2C3AaJn9V8+1H0dWhQjHErRNBU03L
	jvlg==
X-Received: by 10.194.91.232 with SMTP id ch8mr84624263wjb.19.1438267392828;
	Thu, 30 Jul 2015 07:43:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id wx9sm2232581wjb.6.2015.07.30.07.43.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:43:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:43:27 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730144327.GL2457@jama>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
	<92e5275b2d09f7230def50f83e09e8189a28a09a.1438265949.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <92e5275b2d09f7230def50f83e09e8189a28a09a.1438265949.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 11/21] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Thu, 30 Jul 2015 14:43:16 -0000
X-Groupsio-MsgNum: 68745
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iK/wEI4vkfDmI6Zw"
Content-Disposition: inline

--iK/wEI4vkfDmI6Zw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 05:27:34PM +0300, Alexander Kanavin wrote:
> Recipe for the obsolete webkit-gtk 1.8.3 is removed in a separate commit

Why is it renamed from webkit-gtk to webkitgtk?

That will break at least one PACKAGECONFIG:
meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb:PACKAGECONFIG[helpbrowser]
=3D "--with-webkit, --without-webkit, webkit-gtk"

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.8.4.bb | 56 +++++++++++++++++++++++=
++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk_2.8.4.bb
>=20
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.4.bb b/meta/recipes-s=
ato/webkit/webkitgtk_2.8.4.bb
> new file mode 100644
> index 0000000..14b722e
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.8.4.bb
> @@ -0,0 +1,56 @@
> +SUMMARY =3D "WebKit web rendering engine for the GTK+ platform"
> +HOMEPAGE =3D "http://www.webkitgtk.org/"
> +BUGTRACKER =3D "http://bugs.webkit.org/"
> +
> +LICENSE =3D "BSD & LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c=
6d6397a5d84286dda758da57bd691 \
> +                    file://Source/WebKit/LICENSE;md5=3D4646f90082c40bcf2=
98c285f8bab0b12 \
> +                    file://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082=
c40bcf298c285f8bab0b12 \
> +		    file://Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde2b64ae177b2494=
445b79d21 \
> +		    file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33ef338abbaf8b8a=
7c36b6eec80 \
> +		   "
> +
> +SRC_URI =3D "\
> +  http://www.webkitgtk.org/releases/${PN}-${PV}.tar.xz \
> +  "
t> +SRC_URI[md5sum] =3D "50bde91beb882250e29dfd6837f56d97"
> +SRC_URI[sha256sum] =3D "30bd366bd970d4bac2f9ef5bff0fb935376bf91ea2aaa2a5=
183fe5fdbec20fbd"
> +
> +inherit cmake lib_package pkgconfig perlnative pythonnative
> +
> +DEPENDS =3D "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt l=
ibidn gnutls \
> +           gtk+ gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native=
 gperf-native sqlite3 \
> +	   pango icu bison-native gnome-common gawk intltool-native libwebp \
> +	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis=
 libxcomposite libxtst \
> +	   ruby-native libsecret libnotify gstreamer1.0-plugins-bad \
> +          "
> +DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtua=
l/libgl', '', d)}"
> +
> +EXTRA_OECMAKE =3D " \
> +		-DPORT=3DGTK \
> +		-DCMAKE_BUILD_TYPE=3DRelease \
> +		-DENABLE_INTROSPECTION=3DFalse \
> +		-DENABLE_MINIBROWSER=3DTrue \
> +	        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '-DENABLE_WEB=
GL=3DTrue', '-DENABLE_WEBGL=3DFalse', d)} \
> +		"
> +
> +# Javascript JIT is not supported on powerpc
> +# FIXME: This might be needed on powerpc64 as well, but can't be easily =
tested in poky.
> +EXTRA_OECMAKE_append_powerpc =3D " -DENABLE_JIT=3DFalse "
> +
> +# ARM JIT code does not build on ARMv5/6 anymore, apparently they test o=
nly on v7 onwards
> +EXTRA_OECMAKE_append_armv5 =3D " -DENABLE_JIT=3DFalse "
> +EXTRA_OECMAKE_append_armv6 =3D " -DENABLE_JIT=3DFalse "
> +
> +# binutils 2.25 has a bug on aarch64:
> +# https://sourceware.org/bugzilla/show_bug.cgi?id=3D18430
> +EXTRA_OECMAKE_append_aarch64 =3D " -DUSE_LD_GOLD=3DFalse "
> +
> +# JIT not supported on MIPS either
> +EXTRA_OECMAKE_append_mips =3D " -DENABLE_JIT=3DFalse "
> +EXTRA_OECMAKE_append_mips64 =3D " -DENABLE_JIT=3DFalse "
> +
> +FILES_${PN} +=3D "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtk=
injectedbundle.so"
> +FILES_${PN}-dbg +=3D "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/li=
bwebkit2gtkinjectedbundle.so"
> +FILES_${PN}-dbg +=3D "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
> +
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

--iK/wEI4vkfDmI6Zw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6OA8ACgkQN1Ujt2V2gByoZgCeNQVi9++6+i6w2GYcIozjgpLo
xQcAn2WEKbfHd7M7dFvjbmO0DuHLleb8
=bUvP
-----END PGP SIGNATURE-----

--iK/wEI4vkfDmI6Zw--
