Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcPrB-0003OI-FP
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 00:37:09 +0200
Received: by wyg30 with SMTP id 30so2114775wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 15:33:25 -0700 (PDT)
Received: by 10.227.200.198 with SMTP id ex6mr2351394wbb.2.1309473205543;
	Thu, 30 Jun 2011 15:33:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fu18sm1932159wbb.61.2011.06.30.15.33.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 15:33:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1703bd12b68b86a3d73fe39e9fd9369ac0b027ca.1307895912.git.koen@dominion.thruhere.net>
Date: Fri, 1 Jul 2011 00:33:12 +0200
Message-Id: <29375D62-544F-457B-8393-79BF9DDA54BA@dominion.thruhere.net>
References: <cover.1307895912.git.koen@dominion.thruhere.net>
	<1703bd12b68b86a3d73fe39e9fd9369ac0b027ca.1307895912.git.koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/2] qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
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
X-List-Received-Date: Thu, 30 Jun 2011 22:37:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 12 jun 2011, om 18:26 heeft Koen Kooi het volgende geschreven:

> The ext3 format is pretty much mandatory for qemu usage, so always =
create it.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/conf/machine/include/qemu.inc |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/qemu.inc =
b/meta/conf/machine/include/qemu.inc
> index 9ef242f..e908f69 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?=3D =
"xserver-kdrive"
>=20
> MACHINE_FEATURES =3D "kernel26 apm alsa pcmcia bluetooth irda =
usbgadget screen"
>=20
> -IMAGE_FSTYPES ?=3D "tar.bz2 ext3"
> +IMAGE_FSTYPES +=3D "tar.bz2 ext3"
>=20
> ROOT_FLASH_SIZE =3D "280"
>=20
> --=20
> 1.6.6.1
>=20



