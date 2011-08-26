Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwrV5-00020G-JH
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:10:51 +0200
Received: by wwe32 with SMTP id 32so2551535wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 01:06:03 -0700 (PDT)
Received: by 10.216.160.66 with SMTP id t44mr1514872wek.56.1314345963238;
	Fri, 26 Aug 2011 01:06:03 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id el9sm1085977wbb.24.2011.08.26.01.06.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 01:06:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314320399-10801-2-git-send-email-joelagnel@ti.com>
Date: Fri, 26 Aug 2011 10:06:01 +0200
Message-Id: <45A6D3EA-A30B-411C-A348-57C99244448B@dominion.thruhere.net>
References: <1314320399-10801-1-git-send-email-joelagnel@ti.com>
	<1314320399-10801-2-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Jason Kridner <jdk@ti.com>, k-kooi@ti.com
Subject: Re: [meta-ti PATCH 2/4] gtksourceview: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 08:10:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

meta-oe, right?

Op 26 aug. 2011, om 02:59 heeft Joel A Fernandes het volgende =
geschreven:

>=20
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.0.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION =3D "Portable C library for multiline text editing"
> +HOMEPAGE =3D "http://projects.gnome.org/gtksourceview/"
> +LICENSE =3D "LGPL"

which version?

> +DEPENDS =3D "gtk+ libgnomeprint virtual/gettext"
> +
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> +
> +PNAME =3D "gtksourceview"
> +
> +S =3D "${WORKDIR}/${PNAME}-${PV}"
> +
> +inherit gnome lib_package
> +
> +# overrule SRC_URI from gnome.conf
> +SRC_URI =3D =
"${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2=
;name=3Darchive"
> +SRC_URI[archive.md5sum] =3D "04279db5d4fda41a35bf3d9aafa3a6c1"
> +SRC_URI[archive.sha256sum] =3D =
"a72484ff661d3515130911b59f78a88afc1344421431e05e99e9dab791be948f"
> +
> +SRC_URI +=3D " \
> +           file://gtk-doc.make \
> +"
> +
> +do_configure_prepend() {
> +    cp ${WORKDIR}/gtk-doc.make ${S}/
> +    sed -i -e s:docs::g ${S}/Makefile.am
> +    echo "EXTRA_DIST =3D version.xml" > gnome-doc-utils.make
> +}
> +
> +FILES_${PN} +=3D " ${datadir}/gtksourceview-2.0"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



