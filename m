Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRhgM-00079D-2x
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 11:25:42 +0200
Received: by wye20 with SMTP id 20so4523169wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 02:22:31 -0700 (PDT)
Received: by 10.227.27.98 with SMTP id h34mr6912197wbc.113.1306920151752;
	Wed, 01 Jun 2011 02:22:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm599530wbh.59.2011.06.01.02.22.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 02:22:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306756909-18466-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 1 Jun 2011 11:22:29 +0200
Message-Id: <D6BCEE3E-A9B6-44E1-8833-D161C6829F6B@dominion.thruhere.net>
References: <1306756909-18466-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] u-boot: package up u-boot.bin for field upgrades
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
X-List-Received-Date: Wed, 01 Jun 2011 09:25:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 30 mei 2011, om 14:01 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-bsp/uboot/u-boot.inc        |   11 +++++++++++
> meta/recipes-bsp/uboot/u-boot_2011.03.bb |    2 +-
> 2 files changed, 12 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/uboot/u-boot.inc =
b/meta/recipes-bsp/uboot/u-boot.inc
> index 83dfb6f..2be9fc9 100644
> --- a/meta/recipes-bsp/uboot/u-boot.inc
> +++ b/meta/recipes-bsp/uboot/u-boot.inc
> @@ -21,6 +21,7 @@ python () {
> }
>=20
> UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.bin"
> +UBOOT_BINARY ?=3D "u-boot.bin"
> UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.bin"
> UBOOT_MAKE_TARGET ?=3D "all"
>=20
> @@ -32,6 +33,16 @@ do_compile () {
> 	oe_runmake ${UBOOT_MAKE_TARGET}
> }
>=20
> +do_install () {
> +    install -d ${D}/boot
> +    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +}
> +
> +FILES_${PN} =3D "/boot"
> +# no gnu_hash in uboot.bin, by design, so skip QA
> +INSANE_SKIP_${PN} =3D True
> +
> do_deploy () {
> 	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
>=20
> diff --git a/meta/recipes-bsp/uboot/u-boot_2011.03.bb =
b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
> index 0fbb9ba..07f0609 100644
> --- a/meta/recipes-bsp/uboot/u-boot_2011.03.bb
> +++ b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
> @@ -14,7 +14,7 @@ FILESDIR =3D =
"${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE
>=20
> SRCREV =3D "v2011.03"
> PV =3D "v2011.03+git${SRCPV}"
> -PR=3D"r3"
> +PR=3D"r4"
>=20
> SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit=
"
>=20
> --=20
> 1.6.6.1
>=20



