Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwrWp-000238-L2
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:12:39 +0200
Received: by wyf19 with SMTP id 19so2374938wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 01:07:51 -0700 (PDT)
Received: by 10.216.186.82 with SMTP id v60mr638078wem.58.1314346071412;
	Fri, 26 Aug 2011 01:07:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s49sm856753wec.1.2011.08.26.01.07.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 01:07:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314320399-10801-1-git-send-email-joelagnel@ti.com>
Date: Fri, 26 Aug 2011 10:07:48 +0200
Message-Id: <4E6D7599-53AA-4E76-8955-888FCCEEB4AB@dominion.thruhere.net>
References: <1314320399-10801-1-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Jason Kridner <jdk@ti.com>, k-kooi@ti.com
Subject: Re: [meta-ti PATCH 1/4] gedit: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 08:12:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

meta-oe, right?

Op 26 aug. 2011, om 02:59 heeft Joel A Fernandes het volgende =
geschreven:

> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb |   24 =
++++++++++++++++++++++++
> 1 files changed, 24 insertions(+), 0 deletions(-)
> create mode 100644 meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb
>=20
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb =
b/meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb
> new file mode 100644
> index 0000000..64ea644
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "GNOME editor"
> +SECTION =3D "x11/gnome"
> +LICENSE =3D "GPLv2+"
> +
> +DEPENDS =3D "enchant gconf gnome-common gnome-doc-utils-native =
glib-2.0 gtk+ gtksourceview2 iso-codes virtual/gettext"
> +RDEPENDS_${PN} +=3D " gtksourceview2"
> +
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> +
> +PR =3D "r2"

reset that

> +
> +inherit gnome
> +SRC_URI[archive.md5sum] =3D "aebd49797406fdde7b25624b71990860"
> +SRC_URI[archive.sha256sum] =3D =
"37598473372aab217e46f19726cff616ff0ea4121bbdbb170b4e264a4ca76690"
> +
> +EXTRA_OECONF =3D "--disable-scrollkeeper"
> +
> +do_configure_prepend () {
> +	cp ${STAGING_DATADIR}/gnome-common/data/omf.make ${S}
> +}
> +
> +FILES_${PN} +=3D "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
> +FILES_${PN}-dbg +=3D "${libdir}/gedit-2/plugin-loaders/.debug =
${libdir}/gedit-2/plugins/.debug"
> +
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



