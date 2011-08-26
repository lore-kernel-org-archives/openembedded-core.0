Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwrPS-0001oy-Id
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:05:02 +0200
Received: by wyf19 with SMTP id 19so2370914wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 01:00:12 -0700 (PDT)
Received: by 10.216.37.198 with SMTP id y48mr336380wea.100.1314345612347;
	Fri, 26 Aug 2011 01:00:12 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id i51sm849802wed.19.2011.08.26.01.00.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 01:00:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314318504-9524-9-git-send-email-joelagnel@ti.com>
Date: Fri, 26 Aug 2011 10:00:11 +0200
Message-Id: <73D610E1-42B6-4B07-95FC-A5C73D42CECA@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<1314318504-9524-9-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH meta-oe 8/9] xsp: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 08:05:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende =
geschreven:

> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> .../recipes-multimedia/xsp/xsp/xsp-fix-pc.patch    |   10 ++++++++++
> meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb      |   15 =
+++++++++++++++
> 2 files changed, 25 insertions(+), 0 deletions(-)
> create mode 100644 meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
> create mode 100644 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch =
b/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
> new file mode 100644
> index 0000000..18bc67c
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
> @@ -0,0 +1,10 @@
> +--- Xsp/xsp.pc.in~	2009-01-07 13:06:07.000000000 +0100
> ++++ Xsp/xsp.pc.in	2009-01-07 13:06:07.000000000 +0100
> +@@ -6,5 +6,5 @@
> + Name: Xsp
> + Description: X Sputnik Library
> + Version: @PACKAGE_VERSION@
> +-Cflags: -I${includedir}  @XSP_CFLAGS@ @X_CFLAGS@
> +-Libs: -L${libdir} -lXsp @XSP_LIBS@ @X_LIBS@
> ++Cflags: -I${includedir}
> ++Libs: -L${libdir} -lXsp -lX11
> diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb =
b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
> new file mode 100644
> index 0000000..2bc3e83
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
> @@ -0,0 +1,15 @@
> +PR =3D "r2"

drop that

> +LICENSE=3D "MIT"
> +DESCRIPTION =3D "X Server Nokia 770 extensions library"
> +SECTION =3D "x11/libs"
> +PRIORITY =3D "optional"

That field isn't used anymore


> +DEPENDS =3D "virtual/libx11 libxext xpext"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dea2bda168c508c7cd8afa567b2fcc549"
> +SRC_URI =3D =
"http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/${PN}_${PV}.tar.=
gz \
> +           file://xsp-fix-pc.patch"
> +S =3D "${WORKDIR}/Xsp"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI[md5sum] =3D "2a0d8d02228d4cbd28b6e07bb7c17cf5"
> +SRC_URI[sha256sum] =3D =
"8b722b952b64841d996c70c3278499886c81bb5012991beed5f66f4158418f59"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



