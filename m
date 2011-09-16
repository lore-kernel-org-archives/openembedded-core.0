Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R4RwQ-0007NK-DF
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 08:30:26 +0200
Received: by mail-ww0-f43.google.com with SMTP id 27so3664982wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:25:16 -0700 (PDT)
Received: by 10.216.172.69 with SMTP id s47mr253791wel.95.1316154316336;
	Thu, 15 Sep 2011 23:25:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p26sm10898829wbm.16.2011.09.15.23.25.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 23:25:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316137255.2384.70.camel@elmorro>
Date: Fri, 16 Sep 2011 08:25:14 +0200
Message-Id: <1C587FC5-C7B4-441A-B4F6-1891CC2A2F34@dominion.thruhere.net>
References: <1316137255.2384.70.camel@elmorro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/5] initramfs-live-install: add PN to RDEPENDS
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
X-List-Received-Date: Fri, 16 Sep 2011 06:30:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 sep. 2011, om 03:40 heeft Tom Zanussi het volgende geschreven:

> RDEPENDS is package-specific, so add ${PN} to it.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git =
a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb =
b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> index 619b16c..fc35e5c 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> @@ -5,7 +5,7 @@ SRC_URI =3D "file://init-install.sh"
>=20
> PR =3D "r5"
>=20
> -RDEPENDS=3D"grub parted e2fsprogs-mke2fs"
> +RDEPENDS_${PN} =3D "grub parted e2fsprogs-mke2fs"

missing PR bump=


