Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R0bL0-0006AT-Em
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 17:43:54 +0200
Received: by wwe32 with SMTP id 32so4252688wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2011 08:38:54 -0700 (PDT)
Received: by 10.227.36.213 with SMTP id u21mr2942869wbd.70.1315237134247;
	Mon, 05 Sep 2011 08:38:54 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gh14sm8586426wbb.17.2011.09.05.08.38.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Sep 2011 08:38:51 -0700 (PDT)
References: <1315229054-1859-1-git-send-email-denis@eukrea.com>
In-Reply-To: <1315229054-1859-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <FA68554D-DEC9-44B3-8971-AA7F01B068A8@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 5 Sep 2011 17:38:42 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4.inc: remove the optional documentation package from the demo's RRECOMMENDS
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
X-List-Received-Date: Mon, 05 Sep 2011 15:43:54 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 sep. 2011 om 15:24 heeft Denis Carikli <denis@eukrea.com> het volgende g=
eschreven:

> The documentation is 285M and doesn't fit on the NAND of many machines.

That does remove all the descriptions from the qtdemo app, so removing all d=
ocs isn't a good idea


>=20
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
> meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
> meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
> meta/recipes-qt/qt4/qt4.inc          |    3 +--
> 3 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt=
4-embedded.inc
> index d464a1d..9914c61 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> LICENSE =3D "LGPLv2.1 | GPLv3"
> HOMEPAGE =3D "http://qt.nokia.com"
> DEPENDS +=3D "directfb tslib"
> -INC_PR =3D "r29"
> +INC_PR =3D "r30"
>=20
> QT_BASE_NAME ?=3D "qt4-embedded"
> QT_BASE_LIB  ?=3D "libqt-embedded"
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt=
4-x11-free.inc
> index 234cb89..0a714be 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://qt.nokia.com"
> SECTION =3D "x11/libs"
> DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext libxr=
ender libxrandr libxcursor"
>=20
> -INC_PR =3D "r26"
> +INC_PR =3D "r27"
>=20
> QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '=
-no-opengl', d)} "
> QT_GLFLAGS_qemux86 =3D "-opengl"
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 5545be7..8a6b59a 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -124,8 +124,7 @@ RRECOMMENDS_${QT_BASE_NAME}-demos +=3D " \
>             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
>             ${QT_BASE_NAME}-plugin-imageformat-jpeg \
>             ${QT_BASE_NAME}-qml-plugins \
> -            ${QT_BASE_NAME}-assistant \
> -            ${PN}-doc"
> +            ${QT_BASE_NAME}-assistant"
> RRECOMMENDS_${QT_BASE_NAME}-examples +=3D " \
>             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
>             ${QT_BASE_NAME}-plugin-imageformat-jpeg \
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


