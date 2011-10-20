Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGlTn-00072e-Ad
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 07:47:47 +0200
Received: by bkat8 with SMTP id t8so3326285bka.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 22:41:52 -0700 (PDT)
Received: by 10.223.36.193 with SMTP id u1mr5220640fad.27.1319089311917;
	Wed, 19 Oct 2011 22:41:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n18sm13890755fah.2.2011.10.19.22.41.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 22:41:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <04a2c43182d07a54ec535dea8c7434f6741014e1.1319064437.git.josh@linux.intel.com>
Date: Thu, 20 Oct 2011 07:41:50 +0200
Message-Id: <C07B2928-F2D1-4A85-BCFF-7D0360C8BFED@dominion.thruhere.net>
References: <cover.1319064436.git.josh@linux.intel.com>
	<04a2c43182d07a54ec535dea8c7434f6741014e1.1319064437.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 4/4] gst-plugins-good: correctly handle gconf schema
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
X-List-Received-Date: Thu, 20 Oct 2011 05:47:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 00:49 heeft Joshua Lock het volgende geschreven:

> Add the shipped gconf schema to the base package and inherit the gconf =
class
> so that scheme processing is handled via post* scripts.
>=20
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
> .../gstreamer/gst-plugins-good_0.10.30.bb          |    6 ++++--
> 1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb =
b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
> index 96855aa..d63b09a 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
> @@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
>=20
> DEPENDS +=3D "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib =
libid3tag flac \
> 	    speex libsoup-2.4 pulseaudio"
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> -inherit gettext
> +inherit gettext gconf
>=20
> EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 =
--disable-libcaca --disable-hal --without-check"
>=20
> @@ -20,3 +20,5 @@ do_configure_prepend() {
>=20
> SRC_URI[md5sum] =3D "62fd7a3ef187c4f99b3d7c352d58dae9"
> SRC_URI[sha256sum] =3D =
"b12cba90b27d8423cd0a808939098d19db3996cfb9bf528507c6321782e095f6"
> +
> +FILES_${PN} +=3D "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"

If think that schema needs to go into the gconf-elements plugin package, =
no?

regards,

Koen=


