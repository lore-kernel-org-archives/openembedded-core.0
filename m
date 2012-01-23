Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RpFj8-0006DC-5e
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 09:58:10 +0100
Received: by wgbdt11 with SMTP id dt11so3259216wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:50:26 -0800 (PST)
Received: by 10.180.19.138 with SMTP id f10mr14936269wie.3.1327308626124;
	Mon, 23 Jan 2012 00:50:26 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t6sm11727980wid.1.2012.01.23.00.50.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:50:25 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8c85b0c040a43949d8bdccfd100a3012b0180b52.1327255445.git.shane.wang@intel.com>
Date: Mon, 23 Jan 2012 09:50:20 +0100
Message-Id: <3FE09ABE-FB4A-44DE-9100-ECC53D398D5E@dominion.thruhere.net>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
	<8c85b0c040a43949d8bdccfd100a3012b0180b52.1327255445.git.shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQljvCl+6V2gcBGcEeMRX4r0E6sqPIT+KngHCPB1emB/LViYr3e4TE5uhqLPR/XyX6rhp5yI
Subject: Re: [PATCH 02/18] pixman: upgrade to 0.24.2
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
X-List-Received-Date: Mon, 23 Jan 2012 08:58:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This has a bbappend in meta-oe, please give an heads up when it's going =
in to avoid parsing breakage.


Op 22 jan. 2012, om 19:06 heeft Shane Wang het volgende geschreven:

> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
> .../{pixman_0.24.0.bb =3D> pixman_0.24.2.bb}         |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
> rename meta/recipes-graphics/xorg-lib/{pixman_0.24.0.bb =3D> =
pixman_0.24.2.bb} (83%)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb =
b/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
> similarity index 83%
> rename from meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb
> rename to meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
> index d96fe75..b55e547 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
> @@ -18,6 +18,6 @@ PR =3D "r0"
>=20
> EXTRA_OECONF=3D"--disable-gtk"
>=20
> -SRC_URI[md5sum] =3D "db5ffcd50064421176e8afb7b85fd1a7"
> -SRC_URI[sha256sum] =3D =
"744e8b36b29ba76bdfe8f7cbc45585fb237533ac8d716a27e306874dcfa1cf44"
> +SRC_URI[md5sum] =3D "2ce7d12750664d2eebd51bf0a07b6205"
> +SRC_URI[sha256sum] =3D =
"32f74f3e3c1feea33e6ad3e2fd66cb3eb816805c384b346ea1636a87c9057dbf"
>=20
> --=20
> 1.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



