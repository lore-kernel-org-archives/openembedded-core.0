Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgXI1-0008RK-4V
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:21:53 +0200
Received: by wwi14 with SMTP id 14so2792219wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:17:56 -0700 (PDT)
Received: by 10.216.81.208 with SMTP id m58mr2884279wee.0.1310455065358;
	Tue, 12 Jul 2011 00:17:45 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm6242070wbh.60.2011.07.12.00.17.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 00:17:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5735193f441aa8b1fd10a33d9a9c6fd1316d0ce8.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 09:17:42 +0200
Message-Id: <31171571-5A4E-4710-A7B1-EA09F9E7F0C6@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<5735193f441aa8b1fd10a33d9a9c6fd1316d0ce8.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 21/26] gettext: Use bitbake default FILES for packaging
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
X-List-Received-Date: Tue, 12 Jul 2011 07:21:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

> This will ensure correct -dev and -staticdev packging

Missing PR bump

>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-core/gettext/gettext_0.16.1.bb   |    4 ++--
> meta/recipes-core/gettext/gettext_0.18.1.1.bb |   22 =
+++++++++++-----------
> 2 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb =
b/meta/recipes-core/gettext/gettext_0.16.1.bb
> index 73e5f55..7399c48 100644
> --- a/meta/recipes-core/gettext/gettext_0.16.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
> @@ -51,5 +51,5 @@ do_configure_prepend() {
> # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
>=20
> PACKAGES =3D+ "libgettextlib libgettextsrc"
> -FILES_libgettextlib =3D "${libdir}/libgettextlib-*.so*"
> -FILES_libgettextsrc =3D "${libdir}/libgettextsrc-*.so*"
> +FILES_libgettextlib =3D "${libdir}/libgettextlib-*${SOLIBS}"
> +FILES_libgettextsrc =3D "${libdir}/libgettextsrc-*${SOLIBS}"
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb =
b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index 0b11a90..6be3e77 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -53,27 +53,27 @@ acpaths =3D '-I ${S}/gettext-runtime/m4 \
> # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
>=20
> PACKAGES =3D+ "libgettextlib libgettextsrc"
> -FILES_libgettextlib =3D "${libdir}/libgettextlib-*.so*"
> -FILES_libgettextsrc =3D "${libdir}/libgettextsrc-*.so*"
> +FILES_libgettextlib =3D "${libdir}/libgettextlib-*${SOLIBS}"
> +FILES_libgettextsrc =3D "${libdir}/libgettextsrc-*${SOLIBS}"
>=20
> -PACKAGES =3D+ "gettext-runtime gettext-runtime-dev =
gettext-runtime-doc"
> +PACKAGES =3D+ "gettext-runtime gettext-runtime-dev =
gettext-runtime-staticdev gettext-runtime-doc"
>=20
> FILES_gettext-runtime =3D "${bindir}/gettext \
>                          ${bindir}/ngettext \
>                          ${bindir}/envsubst \
>                          ${bindir}/gettext.sh \
> -                         ${libdir}/libasprintf.so* \
> +                         ${libdir}/libasprintf${SOLIBS} \
>                          ${libdir}/GNU.Gettext.dll \
>                         "
> -FILES_gettext-runtime_append_libc-uclibc =3D " ${libdir}/libintl.so* =
\
> +FILES_gettext-runtime_append_libc-uclibc =3D " =
${libdir}/libintl${SOLIBS} \
>                                              ${libdir}/charset.alias \
>                                            "
> -FILES_gettext-runtime-dev +=3D "${libdir}/libasprintf.a \
> -                      ${includedir}/autosprintf.h \
> -                     "
> -FILES_gettext-runtime-dev_append_libc-uclibc =3D " =
${libdir}/libintl.a \
> -                                                 =
${includedir}/libintl.h \
> -                                               "
> +FILES_gettext-runtime-dev +=3D "${includedir}/autosprintf.h"
> +FILES_gettext-runtime-staticdev =3D "${libdir}/libasprintf.a"
> +FILES_gettext-runtime-dev_append_libc-uclibc =3D " =
${includedir}/libintl.h"
> +FILES_gettext-runtime-staticdev_append_libc-uclibc =3D " =
${libdir}/libintl.a"
> +RDEPENDS_gettext-runtime-staticdev =3D "gettext-runtime-dev (=3D =
${EXTENDPKGV})"
> +
> FILES_gettext-runtime-doc =3D "${mandir}/man1/gettext.* \
>                              ${mandir}/man1/ngettext.* \
>                              ${mandir}/man1/envsubst.* \
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



