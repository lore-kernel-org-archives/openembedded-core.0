Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYDXQ-0003OU-8b
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Jun 2011 10:39:24 +0200
Received: by wwg12 with SMTP id 12so1314847wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2011 01:35:53 -0700 (PDT)
Received: by 10.216.65.130 with SMTP id f2mr740585wed.32.1308472551869;
	Sun, 19 Jun 2011 01:35:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id a1sm2254113wek.22.2011.06.19.01.35.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Jun 2011 01:35:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308420055-25820-1-git-send-email-koen@dominion.thruhere.net>
Date: Sun, 19 Jun 2011 10:35:48 +0200
Message-Id: <4C67BB87-AE11-4BCB-9B06-F178D19512A6@dominion.thruhere.net>
References: <1308420055-25820-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] glib-2.0 2.28.x: update to 2.28.8
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
X-List-Received-Date: Sun, 19 Jun 2011 08:39:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Disregard this one, I have some backports from OE.dev that need to go in =
first

Op 18 jun 2011, om 20:00 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb |   18 =
------------------
> meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb |   19 =
+++++++++++++++++++
> meta/recipes-core/glib-2.0/glib.inc           |    3 ++-
> 3 files changed, 21 insertions(+), 19 deletions(-)
> delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
> create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb =
b/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
> deleted file mode 100644
> index ca5f4c8..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require glib.inc
> -
> -PE =3D "1"
> -PR =3D "r1"
> -
> -SRC_URI =3D "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
> -           file://configure-libtool.patch \
> -           file://60_wait-longer-for-threads-to-die.patch \
> -           file://g_once_init_enter.patch \
> -          "
> -# Only apply this patch for target recipe on uclibc
> -SRC_URI_append_libc-uclibc =3D " ${@['', =
'file://no-iconv.patch']['${PN}' =3D=3D '${BPN}']}"
> -
> -SRC_URI[md5sum] =3D "7d8fc15ae70d5111c0cf2a79d50ef717"
> -SRC_URI[sha256sum] =3D =
"557fb7c39d21b9359fbac51fd6b0b883bc97a2561c0166eef993a4078312f578"
> -
> -SRC_URI_append_virtclass-native =3D " =
file://glib-gettextize-dir.patch"
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb =
b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> new file mode 100644
> index 0000000..dd34c78
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> @@ -0,0 +1,19 @@
> +require glib.inc
> +
> +PE =3D "1"
> +
> +SRC_URI =3D "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
> +           file://configure-libtool.patch \
> +           file://60_wait-longer-for-threads-to-die.patch \
> +           file://g_once_init_enter.patch \
> +          "
> +# Only apply this patch for target recipe on uclibc
> +SRC_URI_append_libc-uclibc =3D " ${@['', =
'file://no-iconv.patch']['${PN}' =3D=3D '${BPN}']}"
> +
> +SRC_URI_append_virtclass-native =3D " =
file://glib-gettextize-dir.patch"
> +
> +SRC_URI[md5sum] =3D "789e7520f71c6a4bf08bc683ec764d24"
> +SRC_URI[sha256sum] =3D =
"222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f"
> +
> +BBCLASSEXTEND =3D "native"
> +
> diff --git a/meta/recipes-core/glib-2.0/glib.inc =
b/meta/recipes-core/glib-2.0/glib.inc
> index 0488490..0800c85 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -31,7 +31,8 @@ EXTRA_OECONF =3D "--disable-debug =
--enable-included-printf=3Dno"
> EXTRA_OECONF_virtclass-native =3D ""
> EXTRA_OECONF_linuxstdbase =3D "--enable-included-printf=3Dno"
>=20
> -FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> +FILES_${PN} =3D "${libdir}/lib*${SOLIBS} =
${sysconfdir}/bash_completion.d ${datadir}/glib-2.0/schemas"
> FILES_${PN}-dev +=3D "${libdir}/glib-2.0/include"
> +FILES_${PN}-dbg +=3D "${datadir}/glib-2.0/gdb ${datadir}/gdb"
>=20
> ARM_INSTRUCTION_SET =3D "arm"
> --=20
> 1.6.6.1
>=20



