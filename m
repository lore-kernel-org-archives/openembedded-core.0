Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R4Rvx-0007NK-An
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 08:29:57 +0200
Received: by wwf27 with SMTP id 27so3664982wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:24:45 -0700 (PDT)
Received: by 10.216.88.212 with SMTP id a62mr938356wef.43.1316154285105;
	Thu, 15 Sep 2011 23:24:45 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p26sm10898829wbm.16.2011.09.15.23.24.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 23:24:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316137261.2384.73.camel@elmorro>
Date: Fri, 16 Sep 2011 08:24:43 +0200
Message-Id: <E9BA91B5-1BE1-4DE0-93A7-A0BDA99BE728@dominion.thruhere.net>
References: <1316137261.2384.73.camel@elmorro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 4/5] ttf-bitstream-vera_1.10: add PN to RDEPENDS
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
X-List-Received-Date: Fri, 16 Sep 2011 06:29:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 sep. 2011, om 03:41 heeft Tom Zanussi het volgende geschreven:

> RDEPENDS is package-specific, so add ${PN} to it.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git =
a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb =
b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
> index f1a8265..c96294e 100644
> --- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
> +++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
> @@ -9,7 +9,7 @@ LICENSE =3D "Bitstream_Vera"
> LIC_FILES_CHKSUM =3D =
"file://COPYRIGHT.TXT;md5=3D27d7484b1e18d0ee4ce538644a3f04be"
> PACKAGE_ARCH =3D "all"
> PR =3D "r3"
> -RDEPENDS =3D "fontconfig-utils"
> +RDEPENDS_${PN} =3D "fontconfig-utils"

missing PR bump=


