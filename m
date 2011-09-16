Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R4Rwl-0007NK-C1
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 08:30:47 +0200
Received: by mail-ww0-f43.google.com with SMTP id 27so3664982wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:25:37 -0700 (PDT)
Received: by 10.216.221.207 with SMTP id r57mr254294wep.100.1316154337153;
	Thu, 15 Sep 2011 23:25:37 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p26sm10898829wbm.16.2011.09.15.23.25.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 23:25:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316137257.2384.71.camel@elmorro>
Date: Fri, 16 Sep 2011 08:25:35 +0200
Message-Id: <6FF03AAF-255D-4AF4-BFAD-849B91C9C755@dominion.thruhere.net>
References: <1316137257.2384.71.camel@elmorro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 2/5] liberation-fonts_1.04: add PN to RDEPENDS
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
X-List-Received-Date: Fri, 16 Sep 2011 06:30:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 sep. 2011, om 03:40 heeft Tom Zanussi het volgende geschreven:

> RDEPENDS is package-specific, so add ${PN} to it.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> .../ttf-fonts/liberation-fonts_1.04.bb             |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb =
b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> index 3b2d479..185bfd3 100644
> --- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> +++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> @@ -9,7 +9,7 @@ SECTION =3D "x11/fonts"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> PACKAGE_ARCH =3D "all"
> -RDEPENDS =3D "fontconfig-utils"
> +RDEPENDS_${PN} =3D "fontconfig-utils"
> PE =3D "1"

missing PR bump=


