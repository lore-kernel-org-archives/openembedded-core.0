Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1SqNJp-0007MO-DU
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 13:48:57 +0200
Received: from mail109-ch1-R.bigfish.com (10.43.68.235) by
	CH1EHSOBE003.bigfish.com (10.43.70.53) with Microsoft SMTP Server id
	14.1.225.23; Sun, 15 Jul 2012 11:07:28 +0000
Received: from mail109-ch1 (localhost [127.0.0.1])	by
	mail109-ch1-R.bigfish.com (Postfix) with ESMTP id 85669A0569	for
	<openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 11:07:27 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371I936eI542M1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah107ahbe9i)
Received: from mail109-ch1 (localhost.localdomain [127.0.0.1]) by mail109-ch1
	(MessageSwitch) id 1342350445214966_20102;
	Sun, 15 Jul 2012 11:07:25 +0000 (UTC)
Received: from CH1EHSMHS014.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.247])	by mail109-ch1.bigfish.com (Postfix) with ESMTP id
	32EFD40048 for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 11:07:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS014.bigfish.com
	(10.43.70.14) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 15 Jul 2012 11:07:25 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.250]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Sun, 15 Jul 2012 06:07:24 -0500
From: Liu Ting-B28495 <B28495@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] linux-dtb.inc: update dtb name to keep it
	same in D and DEPLOYDIR
Thread-Index: AQHNYA8p4/eUsxkobEi4RNs0etZvL5clz7IAgARiFpA=
Date: Sun, 15 Jul 2012 11:07:23 +0000
Message-ID: <AF604684617F454390621992F367F169011A0067@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1342084646-23822-1-git-send-email-b28495@freescale.com>
	<1342084646-23822-2-git-send-email-b28495@freescale.com>
	<1342091022.22262.8.camel@ted>
In-Reply-To: <1342091022.22262.8.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.185.141]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] linux-dtb.inc: update dtb name to keep it same in D and DEPLOYDIR
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
X-List-Received-Date: Sun, 15 Jul 2012 11:48:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
Sent: Thursday, July 12, 2012 7:04 PM
To: Patches and discussions about the oe-core layer
Cc: McClintock Matthew-B29882
Subject: Re: [OE-core] [PATCH] linux-dtb.inc: update dtb name to keep it sa=
me in D and DEPLOYDIR

On Thu, 2012-07-12 at 04:17 -0500, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> Device tree binary is named as "devicetree-*" in ${D},=20
> "${KERNEL_IMAGETYPE}-*" in ${DEPLOYDIR}. Keep them the same.
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc=20
> b/meta/recipes-kernel/linux/linux-dtb.inc
> index 8aa1458..3dd4d41 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -1,5 +1,5 @@
>  # Support for device tree generation
> -FILES_kernel-devicetree =3D "/boot/devicetree*"
> +FILES_kernel-devicetree =3D "/boot/*.dtb"
>  KERNEL_DEVICETREE_FLAGS =3D "-R 8 -p 0x3000"
> =20
>  python __anonymous () {
> @@ -10,7 +10,7 @@ python __anonymous () {
>  	depends =3D d.getVar("DEPENDS", True)
>  	d.setVar("DEPENDS", "%s dtc-native" % depends)
>  	packages =3D d.getVar("PACKAGES", True)
> -	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
> +	d.setVar("PACKAGES", "kernel-devicetree %s" % packages)
>  }

Why did you need to change PACKAGES? There is no mention of this in the pat=
ch description.

Cheers,

Richard

[Liu Ting-B28495] Sorry for missing that. Because device tree binary is ren=
amed with prefix "${KERNEL_IMAGETYPE}, it will be packaged to kernel-image =
if not modifying the variable PACKAGES.



