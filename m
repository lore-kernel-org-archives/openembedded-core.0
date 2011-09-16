Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R4RwD-0007NK-9Y
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 08:30:13 +0200
Received: by mail-ww0-f43.google.com with SMTP id 27so3664982wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:25:03 -0700 (PDT)
Received: by 10.227.28.4 with SMTP id k4mr634984wbc.21.1316154302555;
	Thu, 15 Sep 2011 23:25:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p26sm10898829wbm.16.2011.09.15.23.25.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 23:25:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316137262.2384.74.camel@elmorro>
Date: Fri, 16 Sep 2011 08:25:01 +0200
Message-Id: <BCF25D41-2CC9-4406-A50C-8CF69B6D13A2@dominion.thruhere.net>
References: <1316137262.2384.74.camel@elmorro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 5/5] grub_1.99: add PN to RDEPENDS
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
X-List-Received-Date: Fri, 16 Sep 2011 06:30:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 sep. 2011, om 03:41 heeft Tom Zanussi het volgende geschreven:

> RDEPENDS is package-specific, so add ${PN} to it.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> meta/recipes-bsp/grub/grub_1.99.bb |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/grub/grub_1.99.bb =
b/meta/recipes-bsp/grub/grub_1.99.bb
> index d9df573..75196fa 100644
> --- a/meta/recipes-bsp/grub/grub_1.99.bb
> +++ b/meta/recipes-bsp/grub/grub_1.99.bb
> @@ -12,7 +12,7 @@ PRIORITY =3D "optional"
> LICENSE =3D "GPLv3"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
>=20
> -RDEPENDS =3D "diffutils freetype"
> +RDEPENDS_${PN} =3D "diffutils freetype"
> PR =3D "r0"

 missing PR bump=


