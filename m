Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id EB13B6A49F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 15:06:02 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id w58so324610wes.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2013 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pUTY2qtvwUs9JoDcTS2sPvWtw9sby3lc7kqaepX7BVc=;
	b=BYO1Z7ZRypv9oVHxfqa/Ip4mIVMmzPdAJTVNbNouKv7nBtpBDYpLvdRAMKTIoQ6cwa
	POz2xSSvpiEPPQHJrpB+SJuHIpjpMxmQd6H3ZSa9LINfgHU30cRJ0+4LvmkhAu2ufXx3
	fu87vNWL0Nvec/NWYSVv6ZK6v3GgipH2++RN3kmtTaC0otjTo/H0ApsRCxKAPE0rj7Ib
	1PMo+HLSX2QTj8GoMCmNQ2y1z17yF+RNaAMybkb5rx6MwA9WkKxN2l/XTbInZSEoCKPW
	o6sP5QGQHV6jKSn03h+4SQbH2pmi1MhfOa3ZleBMVYebT7SwODZO1vMIax3Ljmrr9LV5
	UD+g==
X-Received: by 10.180.21.167 with SMTP id w7mr1996189wie.2.1370358362518;
	Tue, 04 Jun 2013 08:06:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	dj7sm3235217wib.6.2013.06.04.08.06.01 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 08:06:01 -0700 (PDT)
Date: Tue, 4 Jun 2013 17:06:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130604150618.GB30727@jama>
References: <cover.1370012689.git.ross.burton@intel.com>
	<5bed792688d848b38d1565e2705b1f9dca7a17d5.1370012689.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <5bed792688d848b38d1565e2705b1f9dca7a17d5.1370012689.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/11] at-spi2: add -core and -atk, for GTK+ 3.8
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
X-List-Received-Date: Tue, 04 Jun 2013 15:06:04 -0000
X-Groupsio-MsgNum: 40154
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline

--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2013 at 04:05:38PM +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/atk/at-spi2-atk_2.8.1.bb  |   19 +++++++++++++++++++
>  meta/recipes-support/atk/at-spi2-core_2.8.0.bb |   17 +++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
>  create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb
>=20
> diff --git a/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb b/meta/recipes=
-support/atk/at-spi2-atk_2.8.1.bb
> new file mode 100644
> index 0000000..32cbe3b
> --- /dev/null
> +++ b/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "AT-SPI 2 Toolkit Bridge"
> +LICENSE =3D "LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9f288ba982d60518f375b5898283=
886"
> +
> +MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "854e36a2538bea50bc08d33aa9499bb2"
> +SRC_URI[sha256sum] =3D "eb659b94fde6dc0a2f584c9121a5e6d39a4c8aa297d21d8f=
9032f7a8a775fd06"
> +
> +DEPENDS =3D "dbus glib-2.0 atk at-spi2-core"
> +
> +inherit autotools
> +
> +PACKAGES =3D+ "${PN}-gnome ${PN}-gtk2"
> +
> +FILES_${PN}-gnome =3D "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
> +FILES_${PN}-gtk2 =3D "${libdir}/gtk-2.0/modules/libatk-bridge.*"
> +FILES_${PN}-dbg +=3D "${libdir}/gtk-2.0/modules/.debug"
> diff --git a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb b/meta/recipe=
s-support/atk/at-spi2-core_2.8.0.bb
> new file mode 100644
> index 0000000..29851bb
> --- /dev/null
> +++ b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Assistive Technology Service Provider Interface (dbus core)"
> +LICENSE =3D "LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9f288ba982d60518f375b5898283=
886"
> +
> +MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "93b57d5d56d15d1222ddf2386e2f869f"
> +SRC_URI[sha256sum] =3D "1861a30fc7f583d5a567a0ba547db67ce9bd294f0d1c9f74=
03c96a10a481c458"
> +
> +DEPENDS =3D "dbus glib-2.0 virtual/libx11 libxi"

libxtst is missing here

| configure:13325: checking for XTestFakeKeyEvent in -lXtst
| configure:13350: arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -mthumb -mthu=
mb-interwork --sysroot=3D/OE/oe-core/tmp-eglibc/sysroots/qemuarm -o conftes=
t -O2 -pipe -g -feliminate-unused-debug-types   -Wl,-O1 -Wl,--hash-style=3D=
gnu -Wl,--as-needed conftest.c -lXtst   -lSM -lICE -lX11   >&5
| /OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux=
-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.0/ld: cannot find -lXtst
| collect2: error: ld returned 1 exit status
=2E...
| configure:13359: result: no
| configure:13365: error: Couldn't find the Xtst library. Check config.log

> +
> +inherit autotools gtk-doc
> +
> +EXTRA_OECONF =3D "--disable-introspection --disable-xevie"
> +
> +FILES_${PN} +=3D "${datadir}/dbus-1/services/*.service"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGuAmoACgkQN1Ujt2V2gByhZACfYSL+zabguWpTiGidS8plX5ne
DcAAoJdS0L8qFfIh40Lxn3XJ+alRtP8N
=zAhz
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
