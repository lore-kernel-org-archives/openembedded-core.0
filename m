Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TYs4f-0000dK-Ot
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 06:33:13 +0100
Received: from mail60-db3-R.bigfish.com (10.3.81.235) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.23; Thu, 15 Nov 2012 05:19:17 +0000
Received: from mail60-db3 (localhost [127.0.0.1])	by mail60-db3-R.bigfish.com
	(Postfix) with ESMTP id D62894C03D0;
	Thu, 15 Nov 2012 05:19:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(zz98dI9371I1432Izz1de0h1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh162dh1631hbe9i15d0l1155h)
Received: from mail60-db3 (localhost.localdomain [127.0.0.1]) by mail60-db3
	(MessageSwitch) id 1352956754953983_22212;
	Thu, 15 Nov 2012 05:19:14 +0000 (UTC)
Received: from DB3EHSMHS009.bigfish.com (unknown [10.3.81.247])	by
	mail60-db3.bigfish.com (Postfix) with ESMTP id E6A32140073;
	Thu, 15 Nov 2012 05:19:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS009.bigfish.com
	(10.3.87.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 15 Nov 2012 05:19:14 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.103]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0318.003; Thu, 15 Nov 2012 05:19:12 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Chris Larson <clarson@kergoth.com>
Thread-Topic: [OE-core] [PATCHv2] cryptodev kernel module recipe
Thread-Index: AQHNwvC/Ji7apJ26Nk+xX+ftXT6i6Q==
Date: Thu, 15 Nov 2012 05:19:13 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A7824B3@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1351894551-15670-1-git-send-email-yashpal.dutta@freescale.com>
	<CABcZAN=KvmuF49yw-NdCXmd9nTDg40=Fae7gOVNoC4rbwn=Sxw@mail.gmail.com>
In-Reply-To: <CABcZAN=KvmuF49yw-NdCXmd9nTDg40=Fae7gOVNoC4rbwn=Sxw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: the oe-core layer <openembedded-core@lists.openembedded.org>,
	Dutta Yashpal-B05456 <B05456@freescale.com>, Patches
Subject: Re: [PATCHv2] cryptodev kernel module recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2012 05:33:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8A4AC5471B37F647B67A6A3ECD8F8C27@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 5:45 PM, Chris Larson <clarson@kergoth.com> wrote:
>
>
> On Fri, Nov 2, 2012 at 3:15 PM, Yashpal Dutta <yashpal.dutta@freescale.co=
m>
> wrote:
>>
>> This is a /dev/crypto device driver, equivalent to those in OpenBSD or
>> FreeBSD.
>> The main idea is to access of existing ciphers in kernel space from
>> userspace,
>> thus enabling re-use of a hardware implementation of a cipher.
>>
>> Signed-off-by: Yashpal Dutta <yashpal.dutta@freescale.com>
>
>
> I would think that patches which add recipes to oe-core would do more tha=
n
> describe what it is, but also provide justification for its inclusion in
> oe-core vs some other layer. If that was already covered in a previous
> thread, that's fine, but I wanted to make sure it was explicit.

Honestly, I'm not really sure why it should be in OE-core other than
that ocf-linux which is semi-equivalent is here also. Maybe we should
look at a meta-crypto layer or just keep this our own layer. Not sure,
opening for discussion here.

-M=



