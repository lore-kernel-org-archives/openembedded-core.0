Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=AM1EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rj35e-000339-5T
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 07:15:46 +0100
Received: from mail31-am1-R.bigfish.com (10.3.201.247) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jan 2012 05:53:19 +0000
Received: from mail31-am1 (localhost [127.0.0.1])	by mail31-am1-R.bigfish.com
	(Postfix) with ESMTP id A321D58029F	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 05:53:19 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(zz9371I542M1432Nzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail31-am1 (localhost.localdomain [127.0.0.1]) by mail31-am1
	(MessageSwitch) id 1325829199537533_3177;
	Fri,  6 Jan 2012 05:53:19 +0000 (UTC)
Received: from AM1EHSMHS019.bigfish.com (unknown [10.3.201.245])	by
	mail31-am1.bigfish.com (Postfix) with ESMTP id 769B860004D	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 05:53:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS019.bigfish.com
	(10.3.206.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jan 2012 05:53:19 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Thu, 5 Jan 2012 23:53:17 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3 oe-core] linux-dtb: add multi-dtb build support and
	keep dtb in deploy cache package
Thread-Index: AQHMxEfrUiEX7JBY0UeW1sChP/p5QpX+5ibg
Date: Fri, 6 Jan 2012 05:53:17 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010C8F24@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324956860-6782-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1324956860-6782-1-git-send-email-b19537@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v3 oe-core] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Fri, 06 Jan 2012 06:15:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

A new version is submitted.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Tuesday, December 27, 2011 11:34 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Luo Zhenhua-B19537
> Subject: [PATCH v3 oe-core] linux-dtb: add multi-dtb build support and ke=
ep dtb
> in deploy cache package
>=20
> From: Zhenhua Luo <b19537@freescale.com>
>=20
>     1. add multiple dtb build support, define KERNEL_DEVICETREE as follow=
ing:
>            KERNEL_DEVICETREE=3D "${S}/arch/powerpc/boot/dts/p3041ds.dts \
>                                ${S}/arch/powerpc/boot/dts/p3041ds-usdpaa.=
dts"
>     2. keep dtb files are included in the deploy cache package
>=20
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc |   33 ++++++++++++++++++++++++-=
-----
>  1 files changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-
> kernel/linux/linux-dtb.inc
> index 7ec7584..de83e78 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -15,13 +15,32 @@ python __anonymous () {
>=20
>  do_install_append() {
>      if test -n "${KERNEL_DEVICETREE}"; then
> -	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
> ${KERNEL_DEVICETREE}
> -	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
> -	install -d ${DEPLOY_DIR_IMAGE}
> -	install -m 0644 devicetree
> ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
> -	cd ${DEPLOY_DIR_IMAGE}
> -	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> +            DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{print $=
1}'`
> +            DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
> ${DTS_FILE}
> +            install -m 0644 devicetree ${D}/boot/devicetree-${DTS_BASE_N=
AME}-
> ${KERNEL_VERSION}
> +            install -d ${DEPLOY_DIR_IMAGE}
> +            install -m 0644 devicetree ${DEPLOY_DIR_IMAGE}/${DTB_NAME}.d=
tb
> +            cd ${DEPLOY_DIR_IMAGE}
> +            rm -f ${DTB_SYMLINK_NAME}.dtb
> +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
> +            cd -
> +        done
>      fi
>  }
>=20
> +do_deploy_append() {
> +    if test -n "${KERNEL_DEVICETREE}"; then
> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> +            DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{print $=
1}'`
> +            DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +            install -d ${DEPLOYDIR}
> +            install -m 0644 ${DEPLOY_DIR_IMAGE}/${DTB_NAME}.dtb
> ${DEPLOYDIR}/${DTB_NAME}.dtb
> +            cd ${DEPLOYDIR}
> +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME=3D}.dtb
> +        done
> +    fi
> +}
> --
> 1.7.0.4




