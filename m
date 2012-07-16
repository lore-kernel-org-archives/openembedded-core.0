Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Sqtsr-0002xC-F0
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 00:35:17 +0200
Received: from mail145-tx2-R.bigfish.com (10.9.14.242) by
	TX2EHSOBE014.bigfish.com (10.9.40.34) with Microsoft SMTP Server id
	14.1.225.23; Mon, 16 Jul 2012 22:23:58 +0000
Received: from mail145-tx2 (localhost [127.0.0.1])	by
	mail145-tx2-R.bigfish.com (Postfix) with ESMTP id A68593C00E2	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 22:23:57 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371I936eI542M1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail145-tx2 (localhost.localdomain [127.0.0.1]) by mail145-tx2
	(MessageSwitch) id 1342477436209092_31517;
	Mon, 16 Jul 2012 22:23:56 +0000 (UTC)
Received: from TX2EHSMHS001.bigfish.com (unknown [10.9.14.240])	by
	mail145-tx2.bigfish.com (Postfix) with ESMTP id 26227460048	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 22:23:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS001.bigfish.com
	(10.9.99.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 16 Jul 2012 22:23:55 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Mon, 16 Jul 2012 17:23:55 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] linux-dtb.inc: update dtb name to keep it
	same in D and DEPLOYDIR
Thread-Index: AQHNYA8pEJG63la3rka2udoBnG3k2Jclz7IAgAS4BoCAAk9AgA==
Date: Mon, 16 Jul 2012 22:23:54 +0000
Message-ID: <CAEsOVNdfx2LW5Z-j+CmYk5yo0gd5AhqZ0QNZzbbOLDWiNYkbBA@mail.gmail.com>
References: <1342084646-23822-1-git-send-email-b28495@freescale.com>
	<1342084646-23822-2-git-send-email-b28495@freescale.com>
	<1342091022.22262.8.camel@ted>
	<AF604684617F454390621992F367F169011A0067@039-SN2MPN1-021.039d.mgd.msft.net>
In-Reply-To: <AF604684617F454390621992F367F169011A0067@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] linux-dtb.inc: update dtb name to keep it same in D and DEPLOYDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 16 Jul 2012 22:35:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F38757B5AC676649ABDF80313BF038D7@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 15, 2012 at 6:07 AM, Liu Ting-B28495 <B28495@freescale.com> wro=
te:
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
> Sent: Thursday, July 12, 2012 7:04 PM
> To: Patches and discussions about the oe-core layer
> Cc: McClintock Matthew-B29882
> Subject: Re: [OE-core] [PATCH] linux-dtb.inc: update dtb name to keep it =
same in D and DEPLOYDIR
>
> On Thu, 2012-07-12 at 04:17 -0500, b28495@freescale.com wrote:
>> From: Ting Liu <b28495@freescale.com>
>>
>> Device tree binary is named as "devicetree-*" in ${D},
>> "${KERNEL_IMAGETYPE}-*" in ${DEPLOYDIR}. Keep them the same.
>>
>> Signed-off-by: Ting Liu <b28495@freescale.com>
>> ---
>>  meta/recipes-kernel/linux/linux-dtb.inc |    9 ++++++---
>>  1 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>> b/meta/recipes-kernel/linux/linux-dtb.inc
>> index 8aa1458..3dd4d41 100644
>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> @@ -1,5 +1,5 @@
>>  # Support for device tree generation
>> -FILES_kernel-devicetree =3D "/boot/devicetree*"
>> +FILES_kernel-devicetree =3D "/boot/*.dtb"
>>  KERNEL_DEVICETREE_FLAGS =3D "-R 8 -p 0x3000"
>>
>>  python __anonymous () {
>> @@ -10,7 +10,7 @@ python __anonymous () {
>>       depends =3D d.getVar("DEPENDS", True)
>>       d.setVar("DEPENDS", "%s dtc-native" % depends)
>>       packages =3D d.getVar("PACKAGES", True)
>> -     d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
>> +     d.setVar("PACKAGES", "kernel-devicetree %s" % packages)
>>  }
>
> Why did you need to change PACKAGES? There is no mention of this in the p=
atch description.
>
> Cheers,
>
> Richard
>
> [Liu Ting-B28495] Sorry for missing that. Because device tree binary is r=
enamed with prefix "${KERNEL_IMAGETYPE}, it will be packaged to kernel-imag=
e if not modifying the variable PACKAGES.

Ok, so you reordered the packages so your device tree package get's to
grab the file first. Did you consider making the other package less
greedy and excluding these dtb files?

Why is any of this in an anonymous python function? Should it just be

DEPENDS_append
PACKAGES_append

?

-M=



