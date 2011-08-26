Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwrUC-0001xL-QS
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:09:56 +0200
Received: by wyf19 with SMTP id 19so2373660wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 01:05:08 -0700 (PDT)
Received: by 10.227.19.202 with SMTP id c10mr659613wbb.18.1314345908473;
	Fri, 26 Aug 2011 01:05:08 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id el9sm1085977wbb.24.2011.08.26.01.05.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 01:05:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314320399-10801-4-git-send-email-joelagnel@ti.com>
Date: Fri, 26 Aug 2011 10:05:06 +0200
Message-Id: <01311A7B-CECC-45BF-AC6D-F94F17217CFC@dominion.thruhere.net>
References: <1314320399-10801-1-git-send-email-joelagnel@ti.com>
	<1314320399-10801-4-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Jason Kridner <jdk@ti.com>, k-kooi@ti.com
Subject: Re: [meta-ti PATCH 4/4] libgnomeprint: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 08:09:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

You mean meta-oe, right?

Op 26 aug. 2011, om 02:59 heeft Joel A Fernandes het volgende =
geschreven:

> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> .../recipes-gnome/gnome/libgnomeprint_2.18.7.bb    |   15 =
+++++++++++++++
> 1 files changed, 15 insertions(+), 0 deletions(-)
> create mode 100644 =
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb =
b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
> new file mode 100644
> index 0000000..57e7910
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
> @@ -0,0 +1,15 @@
> +LICENSE =3D "GPL"

Which version?

> +SECTION =3D "x11/gnome/libs"
> +
> +DEPENDS =3D "libxml2 libgnomecups glib-2.0 pango libart-lgpl =
fontconfig popt gnome-common"
> +
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> +
> +inherit pkgconfig gnome
> +
> +SRC_URI[archive.md5sum] =3D "d66b81ee8aa3b3a33f5efc9a47ce07e3"
> +SRC_URI[archive.sha256sum] =3D =
"8b34f81599423ef3da9c43775495da602f83cbbee069c9e760ffeae6aa4768e6"
> +
> +FILES_${PN}-dbg +=3D =
"${libdir}/libgnomeprint/${PV}/modules/transports/.debug \
> +		    ${libdir}/libgnomeprint/${PV}/modules/.debug  =
${libdir}/libgnomeprint/${PV}/modules/*/.debug"
> +
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



