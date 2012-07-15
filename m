Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1SqN1Q-0006yy-Ig
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 13:29:56 +0200
Received: from mail152-co1-R.bigfish.com (10.243.78.241) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.23; Sun, 15 Jul 2012 11:18:39 +0000
Received: from mail152-co1 (localhost [127.0.0.1])	by
	mail152-co1-R.bigfish.com (Postfix) with ESMTP id C7A2D8804C8	for
	<openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 11:18:38 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371I936eI542M1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah107ahbe9i)
Received: from mail152-co1 (localhost.localdomain [127.0.0.1]) by mail152-co1
	(MessageSwitch) id 1342351116643135_2256;
	Sun, 15 Jul 2012 11:18:36 +0000 (UTC)
Received: from CO1EHSMHS009.bigfish.com (unknown [10.243.78.228])	by
	mail152-co1.bigfish.com (Postfix) with ESMTP id 917D5A00044	for
	<openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 11:18:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS009.bigfish.com
	(10.243.66.19) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 15 Jul 2012 11:18:36 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.250]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Sun, 15 Jul 2012 06:18:35 -0500
From: Liu Ting-B28495 <B28495@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: update image name to keep it
	same in D and DEPLOYDIR
Thread-Index: AQHNYA8p99xYXlwyIE28jo2qSUrTopclz30AgARkl7A=
Date: Sun, 15 Jul 2012 11:18:34 +0000
Message-ID: <AF604684617F454390621992F367F169011A007D@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1342084646-23822-1-git-send-email-b28495@freescale.com>
	<1342090978.22262.7.camel@ted>
In-Reply-To: <1342090978.22262.7.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.185.141]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH] kernel.bbclass: update image name to keep it same in D and DEPLOYDIR
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
X-List-Received-Date: Sun, 15 Jul 2012 11:29:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
Sent: Thursday, July 12, 2012 7:03 PM
To: Patches and discussions about the oe-core layer
Cc: McClintock Matthew-B29882
Subject: Re: [OE-core] [PATCH] kernel.bbclass: update image name to keep it=
 same in D and DEPLOYDIR

On Thu, 2012-07-12 at 04:17 -0500, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta/classes/kernel.bbclass |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass=20
> index 81c334b..420a1ec 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -122,7 +122,12 @@ kernel_do_install() {
>  	#
>  	install -d ${D}/${KERNEL_IMAGEDEST}
>  	install -d ${D}/boot
> -	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAG=
ETYPE}-${KERNEL_VERSION}
> +        install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERN=
EL_IMAGE_BASE_NAME}.bin
> +        cd ${D}/${KERNEL_IMAGEDEST}/
> +        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME=
}.bin
> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
> +	cd -
>  	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>  	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>  	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}

This is going to break users who rely on the existing naming/layout.=20

The patch description is lacking on why we need to do this too, it just say=
s what you're doing and not why.

Cheers,

Richard


[Liu Ting-B28495] on our side, we used two ways to load the kernel images. =
1) load from Ethernet 2) load from hard disk which deployed with the rootfs=
 image containing kernel image (installing the package 'kernel-image'). We =
cannot use the same bootargs in u-boot due to the mismatched name.



