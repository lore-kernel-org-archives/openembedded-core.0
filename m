Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9LJ6-0002W0-BN
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:26:04 +0200
Received: from mail89-db3-R.bigfish.com (10.3.81.243) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 18:20:31 +0000
Received: from mail89-db3 (localhost.localdomain [127.0.0.1])	by
	mail89-db3-R.bigfish.com (Postfix) with ESMTP id D1E6C3E049F	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:20:30 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371K936eK1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail89-db3 (localhost.localdomain [127.0.0.1]) by mail89-db3
	(MessageSwitch) id 1317320389982787_22109;
	Thu, 29 Sep 2011 18:19:49 +0000 (UTC)
Received: from DB3EHSMHS010.bigfish.com (unknown [10.3.81.246])	by
	mail89-db3.bigfish.com (Postfix) with ESMTP id E8830B9804F	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:19:49 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS010.bigfish.com
	(10.3.87.110) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 18:19:45 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Thu, 29 Sep 2011 13:19:44 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 10/16] Fix mdadm for powerpc64
Thread-Index: AQHMftRcNrHa1wUMHEqCu9mPhkjzjw==
Date: Thu, 29 Sep 2011 18:19:43 +0000
Message-ID: <CAEsOVNcB-cLFSEp2i93YdpUeDD3VEH+fhJ-wfhb1YG+837KGwQ@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-10-git-send-email-msm@freescale.com>
	<1317311506.12332.100.camel@ted>
In-Reply-To: <1317311506.12332.100.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Thu, 29 Sep 2011 18:26:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3D3616E620B61B4088522F4A733467B7@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 10:51 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-09-28 at 23:21 -0500, Matthew McClintock wrote:
>> This fixes build failures from build warnings on powerpc64
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> =A0meta/recipes-extended/mdadm/mdadm_3.2.2.bb | =A0 =A03 ++-
>> =A01 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-e=
xtended/mdadm/mdadm_3.2.2.bb
>> index 5d29ae7..37ec32e 100644
>> --- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
>> +++ b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215=
e8d672dc4c32c317bb3 \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://mdmon.c;beginline=3D4;=
endline=3D18;md5=3Daf7d8444d9c4d3e5c7caac0d9d34039d \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://mdadm.h;beglinlne=3D4;=
endline=3D22;md5=3D462bc9936ac0d3da110191a3f9994161"
>>
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =A0SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.=
tar.bz2"
>>
>> @@ -16,6 +16,7 @@ SRC_URI[md5sum] =3D "12ee2fbf3beddb60601fb7a4c4905651"
>> =A0SRC_URI[sha256sum] =3D "0d1a04e688b082bc88846e3f524abd50bc782b6ffc061=
23140f7d358c8f9b906"
>>
>> =A0CFLAGS +=3D "-fno-strict-aliasing"
>> +EXTRA_OEMAKE_powerpc64 =3D "CXFLAGS=3D-Wno-error=3Dformat"
>
> Don't you want to append here rather than overwrite?

Seems reasonable. Will change.

-M=



