Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Squ4Z-0003DV-K5
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 00:47:23 +0200
Received: from mail31-tx2-R.bigfish.com (10.9.14.240) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Mon, 16 Jul 2012 22:21:01 +0000
Received: from mail31-tx2 (localhost [127.0.0.1])	by mail31-tx2-R.bigfish.com
	(Postfix) with ESMTP id EA89AAC01B8	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 22:21:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371I936eI542M1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail31-tx2 (localhost.localdomain [127.0.0.1]) by mail31-tx2
	(MessageSwitch) id 1342477259423827_17811;
	Mon, 16 Jul 2012 22:20:59 +0000 (UTC)
Received: from TX2EHSMHS014.bigfish.com (unknown [10.9.14.253])	by
	mail31-tx2.bigfish.com (Postfix) with ESMTP id 5AC0F74004C	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 22:20:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS014.bigfish.com
	(10.9.99.114) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 16 Jul 2012 22:20:59 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Mon, 16 Jul 2012 17:20:58 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: update image name to keep it
	same in D and DEPLOYDIR
Thread-Index: AQHNYA8pklvBmjkjwUaztVTQpwzU0pclz30AgAS7WwCAAktNAA==
Date: Mon, 16 Jul 2012 22:20:57 +0000
Message-ID: <CAEsOVNd_FS+e0-1KU++Hk05X1TZEoi1mR+avCBkRhkvqOhEQmA@mail.gmail.com>
References: <1342084646-23822-1-git-send-email-b28495@freescale.com>
	<1342090978.22262.7.camel@ted>
	<AF604684617F454390621992F367F169011A007D@039-SN2MPN1-021.039d.mgd.msft.net>
In-Reply-To: <AF604684617F454390621992F367F169011A007D@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH] kernel.bbclass: update image name to keep it same in D and DEPLOYDIR
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
X-List-Received-Date: Mon, 16 Jul 2012 22:47:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <30733F336BCBCC4882D20A327E639A03@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 15, 2012 at 6:18 AM, Liu Ting-B28495 <B28495@freescale.com> wro=
te:
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
> Sent: Thursday, July 12, 2012 7:03 PM
> To: Patches and discussions about the oe-core layer
> Cc: McClintock Matthew-B29882
> Subject: Re: [OE-core] [PATCH] kernel.bbclass: update image name to keep =
it same in D and DEPLOYDIR
>
> On Thu, 2012-07-12 at 04:17 -0500, b28495@freescale.com wrote:
>> From: Ting Liu <b28495@freescale.com>
>>
>> Signed-off-by: Ting Liu <b28495@freescale.com>
>> ---
>>  meta/classes/kernel.bbclass |    7 ++++++-
>>  1 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 81c334b..420a1ec 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -122,7 +122,12 @@ kernel_do_install() {
>>       #
>>       install -d ${D}/${KERNEL_IMAGEDEST}
>>       install -d ${D}/boot
>> -     install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL=
_IMAGETYPE}-${KERNEL_VERSION}
>> +        install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KER=
NEL_IMAGE_BASE_NAME}.bin
>> +        cd ${D}/${KERNEL_IMAGEDEST}/
>> +        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAM=
E}.bin
>> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
>> +     cd -
>>       install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>>       install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>>       install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
>
> This is going to break users who rely on the existing naming/layout.
>
> The patch description is lacking on why we need to do this too, it just s=
ays what you're doing and not why.
>
> Cheers,
>
> Richard
>
>
> [Liu Ting-B28495] on our side, we used two ways to load the kernel images=
. 1) load from Ethernet 2) load from hard disk which deployed with the root=
fs image containing kernel image (installing the package 'kernel-image'). W=
e cannot use the same bootargs in u-boot due to the mismatched name.

Ting,

I understand what you said but what does this have to do with u-boot
bootargs? Need a bit more info here. Can you tell us what images are
generated before, and after your patch? And also, update the commit
message with this info?

-M

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



