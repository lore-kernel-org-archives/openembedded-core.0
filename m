Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 532C778490
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CFDE618525;
	Fri, 16 Jun 2017 14:36:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 8zRPenxMEHus; Fri, 16 Jun 2017 14:36:24 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 411621851E;
	Fri, 16 Jun 2017 14:36:24 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 289761A072;
	Fri, 16 Jun 2017 14:36:24 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D7E21A062;
	Fri, 16 Jun 2017 14:36:24 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 16 Jun 2017 14:36:24 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 115FE1FC;
	Fri, 16 Jun 2017 14:36:24 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 16 Jun 2017 14:36:24 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Fri, 16 Jun 2017 14:36:24 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/4] kconfig-frontends: Remove as only needed
	for	eglibc
Thread-Index: AQHS5nyH6Dj3GXQIck+MD18Grfa4w6InbQIg
Date: Fri, 16 Jun 2017 12:36:23 +0000
Message-ID: <867deeaf462e453b8de99a2fa9f609ec@XBOX02.axis.com>
References: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497602550-1491-3-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1497602550-1491-3-git-send-email-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 3/4] kconfig-frontends: Remove as only needed for	eglibc
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
X-List-Received-Date: Fri, 16 Jun 2017 12:36:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 16 juni 2017 10:42
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/4] kconfig-frontends: Remove as only needed
> for eglibc
>=20
> This was only added for eglibc. That is gone so we can drop this too.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/distro_alias.inc          |  1 -
>  .../kconfig-frontends_4.10.0.1.bb                  | 42 --------------
> --------
>  2 files changed, 43 deletions(-)
>  delete mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-
> frontends_4.10.0.1.bb
>=20
> diff --git a/meta/conf/distro/include/distro_alias.inc
> b/meta/conf/distro/include/distro_alias.inc
> index 489f5ea..bbeb105 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -153,7 +153,6 @@ DISTRO_PN_ALIAS_pn-inputproto =3D "Meego=3Dxorg-x11-
> proto-inputproto"
>  DISTRO_PN_ALIAS_pn-iproute2 =3D "OSPDT"
>  DISTRO_PN_ALIAS_pn-jpeg =3D "OpenSuSE=3Dlibjpeg Ubuntu=3Dlibjpeg62"
>  DISTRO_PN_ALIAS_pn-kbproto =3D "Meego=3Dxorg-x11-proto-kbproto
> Ubuntu=3Dx11proto-kb-dev Debian=3Dx11proto-kb-dev"
> -DISTRO_PN_ALIAS_pn-kconfig-frontends =3D "OSPDT"
>  DISTRO_PN_ALIAS_pn-kernel-devsrc =3D "Debian=3Dlinux-base Ubuntu=3Dlinux=
"
>  DISTRO_PN_ALIAS_pn-kernelshark =3D "Mandriva=3Dkernelshark
> Ubuntu=3Dkernelshark"
>  DISTRO_PN_ALIAS_pn-kern-tools-native =3D "Windriver"
> diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-
> frontends_4.10.0.1.bb b/meta/recipes-devtools/kconfig-
> frontends/kconfig-frontends_4.10.0.1.bb
> deleted file mode 100644
> index d427e98..0000000
> --- a/meta/recipes-devtools/kconfig-frontends/kconfig-
> frontends_4.10.0.1.bb
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
> -# Released under the MIT license (see COPYING.MIT for the terms)
> -
> -SUMMARY =3D "Linux kernel style configuration framework for other
> projects"
> -DESCRIPTION =3D "The kconfig-frontends project aims at centralising \
> -the effort of keeping an up-to-date, out-of-tree, packaging of the \
> -kconfig infrastructure, ready for use by third-party projects. \
> -The kconfig-frontends package provides the kconfig parser, as well as
> all \
> -the frontends"
> -HOMEPAGE =3D "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
> -LICENSE =3D "GPL-2.0"
> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D9b8cf60ff39767ff04b671fca8302408"
> -SECTION =3D "devel"
> -DEPENDS +=3D "ncurses flex bison gperf-native"
> -RDEPENDS_${PN} +=3D "python3 bash"
> -SRC_URI =3D "git://ymorin.is-a-geek.org/kconfig-frontends;branch=3D4.10.=
x
> \
> -           file://0001-Fix-installation-of-.pc-files.patch \
> -           file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch
> \
> -           file://missing-mkdir.patch"
> -
> -SRCREV =3D "f8ffe5e1c6f183cb7d5d515aa9381b7557de654e"
> -
> -S =3D "${WORKDIR}/git"
> -
> -inherit autotools pkgconfig
> -do_configure_prepend () {
> -	mkdir -p ${S}/scripts/.autostuff/m4
> -}
> -
> -do_install_append() {
> -	ln -s kconfig-conf ${D}${bindir}/conf
> -	ln -s kconfig-mconf ${D}${bindir}/mconf
> -}
> -
> -EXTRA_OECONF +=3D "--disable-gconf --disable-qconf"
> -
> -# Some packages have the version preceeding the .so instead properly
> -# versioned .so.<version>, so we need to reorder and repackage.
> -SOLIBS =3D "-${@d.getVar('PV')[:-2]}.so"
> -FILES_SOLIBSDEV =3D "${libdir}/libkconfig-parser.so"
> -
> -BBCLASSEXTEND =3D "native"
> --
> 2.7.4

Please move it to meta-oe if you remove it from OE-core. We rely on it.

//Peter


