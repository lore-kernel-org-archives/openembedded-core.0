Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qf5Xe-0004At-3n
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 09:32:02 +0200
Received: by fxh10 with SMTP id 10so2033815fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 00:28:09 -0700 (PDT)
Received: by 10.223.41.156 with SMTP id o28mr2652208fae.11.1310110089696;
	Fri, 08 Jul 2011 00:28:09 -0700 (PDT)
Received: from [10.105.55.80] (62-50-199-254.client.stsn.net [62.50.199.254])
	by mx.google.com with ESMTPS id
	v20sm7201739fai.31.2011.07.08.00.28.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 00:28:08 -0700 (PDT)
References: <cover.1310081443.git.sgw@linux.intel.com>
	<5058763548021532f1b569c63fefd996c4748c1d.1310081443.git.sgw@linux.intel.com>
In-Reply-To: <5058763548021532f1b569c63fefd996c4748c1d.1310081443.git.sgw@linux.intel.com>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <9519878B-1008-4E50-BC78-F7AF3E14B24D@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 8 Jul 2011 08:28:05 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] usbutils: Add RDEPENDS on bash
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
X-List-Received-Date: Fri, 08 Jul 2011 07:32:02 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

iirc only the ids package depends on bash, and only to check for wget. Fixin=
g the update script would be better

Op 8 jul. 2011 om 00:31 heeft Saul Wold <sgw@linux.intel.com> het volgende g=
eschreven:

> [YOCTO #1214]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-bsp/usbutils/usbutils_0.91.bb |    5 +++--
> 1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb b/meta/recipes-bsp=
/usbutils/usbutils_0.91.bb
> index 5d605c5..c5420d0 100644
> --- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
> +++ b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
> @@ -7,8 +7,7 @@ LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f"
>=20
> DEPENDS =3D "libusb zlib"
> -RDEPENDS_${PN} =3D "${PN}-ids"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.t=
ar.gz"
>=20
> @@ -26,3 +25,5 @@ do_install_append() {
> PACKAGES +=3D "${PN}-ids"
> FILES_${PN} +=3D "${datadir}/pkgconfig"
> FILES_${PN}-ids =3D "${datadir}/usb*"
> +
> +RDEPENDS_${PN} =3D "${PN}-ids bash"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


