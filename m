Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S8d9h-0005We-FD
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:49:41 +0100
Received: by wibhj13 with SMTP id hj13so1192897wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 12:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=iPmT/BfR4RfrSRA91AvvbPv1RLcpEft/sZ4iE46DYmo=;
	b=dfvASFE1yTgoccpvMtDguUrSH6g26VS+BW1nqPk8r8l1BQb9+3GDzYsvY6Z65jCXkm
	ShjKbTIRbw0Cr5hHjPuETp8yJjG6ZAVLE0ZANS1mqrgwtSBfLkOIR3S7fROdXU3TONgR
	Li6sEJOOtt4xfwx2BEumGEUfXrJEoDHuqLQvUkbERgYm2iToQhXpTcJ1anQdiElZiyCg
	xeRYscIMrKNS2EN9GjTnFvtk0j0YX2Jp1bHxcsU3gBOy42dw+1RPgQZ4Rr/oV8ywMTNH
	HVAEUZGSZ1si8IrPTxeD7wIDO8kkH4/zFQYKb37/Rf+bTOQU3/bNye6F7CzwZeqV5sNz
	SRKg==
Received: by 10.180.94.33 with SMTP id cz1mr1133775wib.13.1331926853653;
	Fri, 16 Mar 2012 12:40:53 -0700 (PDT)
Received: from [10.68.37.3] ([87.111.147.121])
	by mx.google.com with ESMTPS id gp8sm1232326wib.5.2012.03.16.12.40.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Mar 2012 12:40:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <a5511eca1ef6ce9b8556257907a4023ec3dcf567.1331924409.git.paul.eggleton@linux.intel.com>
Date: Fri, 16 Mar 2012 20:40:36 +0100
Message-Id: <490619CF-CAC4-4860-A671-8473994D6DF4@dominion.thruhere.net>
References: <cover.1331924409.git.paul.eggleton@linux.intel.com>
	<a5511eca1ef6ce9b8556257907a4023ec3dcf567.1331924409.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQka1ulj7+G0aBzbr/rCvQGo2+dGxpsJZXr2JeRE/FyTi75X1Mm4vSmzcUR8Zw1NPBV2L3Xs
Subject: Re: [PATCH 6/6] qt4: add RPROVIDES/RREPLACES for qmake2 recipe
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
X-List-Received-Date: Fri, 16 Mar 2012 19:49:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mrt. 2012, om 20:01 heeft Paul Eggleton het volgende geschreven:

> OE-Classic and meta-oe provide a qmake2 recipe; since this has been
> obsoleted by the recent change to provide qmake within the tools =
package
> and (in the latter case) will soon be removed, add an RREPLACES to aid
> upgrades and RPROVIDES to make it easy to install.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
> meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
> meta/recipes-qt/qt4/qt4.inc          |    3 +++
> 3 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc =
b/meta/recipes-qt/qt4/qt4-embedded.inc
> index 0e57e5a..8c15352 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Qt is a versatile cross-platform =
application framework -- this is
> SECTION =3D "libs"
> HOMEPAGE =3D "http://qt.nokia.com"
> DEPENDS +=3D "directfb tslib"
> -INC_PR =3D "r42"
> +INC_PR =3D "r43"
>=20
> QT_BASE_LIB  ?=3D "libqt-embedded"
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc =
b/meta/recipes-qt/qt4/qt4-x11-free.inc
> index e1bef64..072c522 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://qt.nokia.com"
> SECTION =3D "x11/libs"
> DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext =
libxrender libxrandr libxcursor"
>=20
> -INC_PR =3D "r40"
> +INC_PR =3D "r41"
>=20
> QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', =
'-opengl', '-no-opengl', d)} "
> QT_GLFLAGS_qemux86 =3D "-opengl"
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 7f1f6f0..468a46f 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -155,6 +155,9 @@ RRECOMMENDS_${QT_BASE_NAME}-qmlviewer +=3D " \
> RRECOMMENDS_${QT_BASE_NAME}-doc +=3D " \
>             ${QT_BASE_NAME}-demos-doc"
>=20
> +RPROVIDES_${QT_BASE_NAME}-tools +=3D "qmake2"
> +RREPLACES_${QT_BASE_NAME}-tools +=3D "qmake2"
> +
> FILES_${QT_BASE_NAME}-tools                =3D =
"${bindir}/qttracereplay ${bindir}/qdoc* ${bindir}/qmake ${bindir}/moc =
${bindir}/uic* ${bindir}/rcc"
> FILES_${QT_BASE_NAME}-tools-dbg            =3D =
"${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc* =
${bindir}/.debug/qmake ${bindir}/.debug/uic* ${bindir}/.debug/moc =
${bindir}/.debug/rcc"
> FILES_${QT_BASE_NAME}-assistant            =3D "${bindir}/*assistant* =
${bindir}/qcollectiongenerator ${bindir}/qhelpconverter =
${bindir}/qhelpgenerator"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



