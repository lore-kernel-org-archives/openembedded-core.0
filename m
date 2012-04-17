Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SK8f0-0002XR-W1; Tue, 17 Apr 2012 15:41:35 +0200
Received: by eekc1 with SMTP id c1so1323517eek.6
	for <multiple recipients>; Tue, 17 Apr 2012 06:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QoCZjsDNoHjDI53m9rCgDQFQwAyRci5ttMr2wdn10NU=;
	b=Qav4sUwKdStJlR4v6iBp5fVYSxWt75fA7qTiQEn1OjU45s5dxxx2yJ8TIUoSSAU4MJ
	+HBMYsrxoVBeLsFvC6RwVMRa06tcaDww9jCH4WSqBVSNGQFtz91bP++RewzbnOEvx07A
	EmRBMolnf1rcTf/H9sRPPLpjJl8inOg5MKBqLyzdBYAm+OOL1lzLIT2ulbx3dct6Fr1r
	ksIgIhkatiPCOWRjoEXFk5n+JpvvS+T4ekXUdFcO6Pv5bgBrsQTvplYDwrwf8xoUgsP1
	BhKmdh3htkk6kbirS8mYEgrdgMXfzYsok5Mm12QefhTbR6kcxQfeqX9URf62Cxvr75wT
	nBow==
Received: by 10.14.99.6 with SMTP id w6mr2312171eef.68.1334669528830;
	Tue, 17 Apr 2012 06:32:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n55sm102573908eef.6.2012.04.17.06.32.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 06:32:07 -0700 (PDT)
Date: Tue, 17 Apr 2012 15:32:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120417133207.GC3665@jama.jama.net>
References: <20120417131445.7F9BF10219@opal>
MIME-Version: 1.0
In-Reply-To: <20120417131445.7F9BF10219@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : gst-plugins-bad: Add missing PR bump after curl change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 13:41:35 -0000
X-Groupsio-MsgNum: 20882
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline

--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Please revert DISTRO_FEATURES_LIBC_DEFAULT change as it doesn't belong
to this commit.

On Tue, Apr 17, 2012 at 01:14:45PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 2865d01773e405212aa6f531139898d90a6819a8
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D2865d01773e405212aa6f531139898d90a6819a8
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Tue Apr 17 12:33:01 2012 +0100
>=20
> gst-plugins-bad: Add missing PR bump after curl change
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/conf/distro/include/default-distrovars.inc    |    4 +++-
>  .../gstreamer/gst-plugins-bad_0.10.23.bb           |    2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index 16b3108..f770919 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -10,12 +10,14 @@ LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
>  ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
>  LOCALE_UTF8_ONLY ?=3D "0"
> =20
> -DISTRO_FEATURES_LIBC ?=3D "ipv4 ipv6 libc-backtrace libc-big-macros libc=
-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> +DISTRO_FEATURES_LIBC_DEFAULT ?=3D "ipv4 ipv6 libc-backtrace libc-big-mac=
ros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
>  					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc=
-fstab libc-ftraverse \
>  					libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big libc-l=
ocales libc-locale-code \
>  					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc=
-spawn libc-streams libc-sunrpc \
>  					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix=
-regexp libc-posix-regexp-glibc \
>  					libc-posix-wchar-io"
> +DISTRO_FEATURES_LIBC ?=3D "${DISTRO_FEATURES_LIBC_DEFAULT}"
> +DISTRO_FEATURES_LIBC_virtclass-nativesdk =3D "${DISTRO_FEATURES_LIBC_DEF=
AULT}"
>  DISTRO_FEATURES ?=3D "alsa argp bluetooth ext2 irda largefile pcmcia usb=
gadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC}"
> =20
>  IMAGE_FEATURES ?=3D ""
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb=
 b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> index fbe1709..a277417 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e=
8d672dc4c32c317bb3 \
> =20
>  DEPENDS +=3D "gst-plugins-base libmusicbrainz tremor librsvg curl"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  inherit gettext
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+NcNcACgkQN1Ujt2V2gBzkTACeMqaUuKcN3szfUkgbsNvhMj5W
ujYAoKO6sMh8i/DHMGF52IZ6fInTl8O4
=/XzF
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
