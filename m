Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RApvR-0001v1-N9
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 23:19:49 +0200
Received: from mail90-db3-R.bigfish.com (10.3.81.243) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 21:14:17 +0000
Received: from mail90-db3 (localhost.localdomain [127.0.0.1])	by
	mail90-db3-R.bigfish.com (Postfix) with ESMTP id E25387D00F4	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:14:16 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail90-db3 (localhost.localdomain [127.0.0.1]) by mail90-db3
	(MessageSwitch) id 131767645625629_19154;
	Mon,  3 Oct 2011 21:14:16 +0000 (UTC)
Received: from DB3EHSMHS015.bigfish.com (unknown [10.3.81.246])	by
	mail90-db3.bigfish.com (Postfix) with ESMTP id 00E1618D8051	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:14:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS015.bigfish.com
	(10.3.87.115) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 21:14:14 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Mon, 3 Oct 2011 16:14:11 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 10/16] Fix mdadm for powerpc64
Thread-Index: AQHMggIJ6+1og7PNnEGyLP1+hESaEJVrcnwA
Date: Mon, 3 Oct 2011 21:14:10 +0000
Message-ID: <CAEsOVNcvCgboed7tx68aT_CemeN_pVd_k0JM_cWVDiMtRrCG0w@mail.gmail.com>
References: <1317322353-30258-1-git-send-email-msm@freescale.com>
	<4E8A0B81.1080507@gmail.com>
In-Reply-To: <4E8A0B81.1080507@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Mon, 03 Oct 2011 21:19:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <19BC758BEB23844B925F1DDA7C78560C@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 2:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =A0SRC_URI =3D
>> "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2"
>>
>> @@ -16,6 +16,7 @@ SRC_URI[md5sum] =3D "12ee2fbf3beddb60601fb7a4c4905651"
>> =A0SRC_URI[sha256sum] =3D
>> "0d1a04e688b082bc88846e3f524abd50bc782b6ffc06123140f7d358c8f9b906"
>>
>> =A0CFLAGS +=3D "-fno-strict-aliasing"
>> +EXTRA_OEMAKE_append_powerpc64 =3D "CXFLAGS=3D-Wno-error=3Dformat"
>>
>> =A0inherit autotools
>>
>
> what kind of errors do you get ? and I wonder why they dont show up on
> x86_64. It may be something to fix in the madadm code.

I can't find a log of this anywhere, it's probably the default
compiler warnings for our platform are different?

You could try enabling those errors and see if your build fails:

EXTRA_OEMAKE_append_x86-64 =3D "CXFLAGS=3D-Werror=3Dformat"

-M=



