Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Tb5Pm-0003Xg-DU
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 09:12:14 +0100
Received: from mail187-co1-R.bigfish.com (10.243.78.249) by
	CO1EHSOBE015.bigfish.com (10.243.66.78) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Nov 2012 07:12:41 +0000
Received: from mail187-co1 (localhost [127.0.0.1])	by
	mail187-co1-R.bigfish.com (Postfix) with ESMTP id B4671840171	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 07:12:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz9371I542M1432Izz1de0h1202h1d1ah1d2ahzz8275ch17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh162dh1631hbe9i15d0l1155h)
Received: from mail187-co1 (localhost.localdomain [127.0.0.1]) by mail187-co1
	(MessageSwitch) id 1353481959370404_4786;
	Wed, 21 Nov 2012 07:12:39 +0000 (UTC)
Received: from CO1EHSMHS003.bigfish.com (unknown [10.243.78.234])	by
	mail187-co1.bigfish.com (Postfix) with ESMTP id 4EED8940105	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 07:12:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS003.bigfish.com
	(10.243.66.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Nov 2012 07:12:39 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.54]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0318.003;
	Wed, 21 Nov 2012 07:12:38 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [Yocto] [meta-fsl-ppc denzil v2] cryptodev kernel module recipe
Thread-Index: AQHNx7c0N9ij8cLHtku1jIiJtlqJvpfz32WA
Date: Wed, 21 Nov 2012 07:12:37 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A01353582@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1351894551-15670-1-git-send-email-yashpal.dutta@freescale.com>
In-Reply-To: <1351894551-15670-1-git-send-email-yashpal.dutta@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Dutta Yashpal-B05456 <B05456@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [Yocto] [meta-fsl-ppc denzil v2] cryptodev kernel module recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 08:12:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Wrong operation, please ignore.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: yocto-bounces@linux.freescale.net [mailto:yocto-
> bounces@linux.freescale.net] On Behalf Of Luo Zhenhua-B19537
> Sent: Wednesday, November 21, 2012 3:32 PM
> To: yocto@linux.freescale.net; openembedded-core@lists.openembedded.org
> Cc: Dutta Yashpal-B05456
> Subject: [Yocto] [meta-fsl-ppc denzil v2] cryptodev kernel module recipe
>=20
> From: Yashpal Dutta <yashpal.dutta@freescale.com>
>=20
> This is a /dev/crypto device driver, equivalent to those in OpenBSD or
> FreeBSD.
> The main idea is to access of existing ciphers in kernel space from
> userspace, thus enabling re-use of a hardware implementation of a cipher.
>=20
> Signed-off-by: Yashpal Dutta <yashpal.dutta@freescale.com>
>=20
> ---
> meta/recipes-kernel/cryptodev/cryptodev_1.5.bb     |   17 +++++++++++++
>  .../cryptodev/files/makefile_fixup.patch           |   26
> ++++++++++++++++++++
>  2 files changed, 43 insertions(+), 0 deletions(-)  create mode 100644
> meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
>  create mode 100644 meta/recipes-
> kernel/cryptodev/files/makefile_fixup.patch
>=20
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
> b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
> new file mode 100644
> index 0000000..0696e2a
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
> @@ -0,0 +1,17 @@
> +SECTION =3D "devel"
> +SUMMARY =3D "Linux Cryptodev KERNEL MODULE"
> +DESCRIPTION =3D "The Cryptodev package contains the kernel /dev/crypto
> module"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +RCONFLICTS_${PN} =3D "ocf-linux"
> +
> +inherit module
> +
> +SRCREV =3D "1c24a0aa996630518d47826a2e3fea129ea094c7"
> +
> +SRC_URI =3D "git://repo.or.cz/cryptodev-linux.git;protocol=3Dgit \
> +           file://makefile_fixup.patch"
> +
> +EXTRA_OEMAKE=3D'KERNEL_DIR=3D"${STAGING_KERNEL_DIR}" PREFIX=3D"${D}"'
> +
> +S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> new file mode 100644
> index 0000000..323aacd
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> @@ -0,0 +1,26 @@
> +diff --git a/Makefile b/Makefile
> +index 2be8825..b36d68c 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,6 +1,7 @@
> + KBUILD_CFLAGS +=3D -I$(src)
> + KERNEL_DIR =3D /lib/modules/$(shell uname -r)/build  VERSION =3D 1.5
> ++PREFIX =3D
> +
> + cryptodev-objs =3D ioctl.o main.o cryptlib.o authenc.o zc.o util.o
> +
> +@@ -12,10 +13,10 @@ build: version.h
> + version.h: Makefile
> + 	@echo "#define VERSION \"$(VERSION)\"" > version.h
> +
> +-install:
> ++modules_install:
> + 	make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` modules_install
> +-	@echo "Installing cryptodev.h in /usr/include/crypto ..."
> +-	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
> ++	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
> ++	@install -D crypto/cryptodev.h
> ++$(PREFIX)/usr/include/crypto/cryptodev.h
> +
> + clean:
> + 	make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` clean
> _______________________________________________
> Yocto mailing list
> Yocto@linux.freescale.net
> http://linux.freescale.net/mailman/listinfo/yocto



