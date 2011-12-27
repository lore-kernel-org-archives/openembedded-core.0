Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE007.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RfNmc-00021b-Pr
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 04:33:00 +0100
Received: from mail146-tx2-R.bigfish.com (10.9.14.245) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Tue, 27 Dec 2011 03:25:28 +0000
Received: from mail146-tx2 (localhost [127.0.0.1])	by
	mail146-tx2-R.bigfish.com (Postfix) with ESMTP id 471AB540125	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 03:26:55 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371I542M1432Nzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hbe9n61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail146-tx2 (localhost.localdomain [127.0.0.1]) by mail146-tx2
	(MessageSwitch) id 1324956415132376_32349;
	Tue, 27 Dec 2011 03:26:55 +0000 (UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.252])	by
	mail146-tx2.bigfish.com (Postfix) with ESMTP id 1746440046	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 03:26:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 27 Dec 2011 03:25:48 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Mon, 26 Dec 2011 21:25:41 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 oe-core] linux-dtb: add dtb into deploy cache package
Thread-Index: AQHMwR6PlUqQYNfOokWUmTRVTd0HdZXvDA/A
Date: Tue, 27 Dec 2011 03:25:41 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010BCCCD@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324609224-28618-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1324609224-28618-1-git-send-email-b19537@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 oe-core] linux-dtb: add dtb into deploy cache package
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
X-List-Received-Date: Tue, 27 Dec 2011 03:33:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore.=20

A new version will be submitted.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Friday, December 23, 2011 11:00 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Luo Zhenhua-B19537
> Subject: [PATCH v2 oe-core] linux-dtb: add dtb into deploy cache package
>=20
> From: Zhenhua Luo <b19537@freescale.com>
>=20
>     > current dtb is not included in the deploy cache package, dtb is mis=
sing
>       when build kernel from caches
>=20
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-
> kernel/linux/linux-dtb.inc
> index 7ec7584..e537d86 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -25,3 +25,11 @@ do_install_append() {
>      fi
>  }
>=20
> +do_deploy_append() {
> +    if test -n "${KERNEL_DEVICETREE}"; then
> +        install -d ${DEPLOYDIR}
> +        install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dt=
b
> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
> +        cd ${DEPLOYDIR}
> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME=
}.dtb
> +    fi
> +}
> --
> 1.7.0.4




