Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TOwZJ-0005ZD-Us
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:19:50 +0200
Received: from mail150-co1-R.bigfish.com (10.243.78.227) by
	CO1EHSOBE013.bigfish.com (10.243.66.76) with Microsoft SMTP Server id
	14.1.225.23; Thu, 18 Oct 2012 20:06:29 +0000
Received: from mail150-co1 (localhost [127.0.0.1])	by
	mail150-co1-R.bigfish.com (Postfix) with ESMTP id 6DFB7D00061;
	Thu, 18 Oct 2012 20:06:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail150-co1 (localhost.localdomain [127.0.0.1]) by mail150-co1
	(MessageSwitch) id 1350590787518616_19133;
	Thu, 18 Oct 2012 20:06:27 +0000 (UTC)
Received: from CO1EHSMHS031.bigfish.com (unknown [10.243.78.248])	by
	mail150-co1.bigfish.com (Postfix) with ESMTP id 7AA42940059;
	Thu, 18 Oct 2012 20:06:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS031.bigfish.com
	(10.243.66.41) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 18 Oct 2012 20:06:27 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.88]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Thu, 18 Oct 2012 20:06:25 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] cryptodev kernel module recipe
Thread-Index: AQHNrWwNkWSgpKAgu0+LKa1V8BZDiA==
Date: Thu, 18 Oct 2012 20:06:25 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A7092EF@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<7A2134DD-519C-4FFB-ACEE-8E36E7A5A088@gmail.com>
	<50805F8F.5050604@linux.intel.com>
In-Reply-To: <50805F8F.5050604@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev kernel module recipe
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
X-List-Received-Date: Thu, 18 Oct 2012 20:19:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <21CB4836F5747F4E8A52B9A032AC808F@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 2:59 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>
>
> On 10/18/2012 02:14 AM, Khem Raj wrote:
>>
>> On Oct 18, 2012, at 2:57 AM, Yashpal Dutta <yashpal.dutta@freescale.com>=
 wrote:
>>
>>> +-install:
>>> ++modules_install:
>>> +    make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` modules_install
>>> +-   @echo "Installing cryptodev.h in /usr/include/crypto ..."
>>> +-   @install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
>>> ++   @echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
>>> ++   @install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/crypto=
dev.h
>>> +
>>
>> why is it installing linux headers under /usr/include shouldn't they be =
under usr/include/linux ?
>
> And shouldn't /usr/include be one of those ${*dir} variables?

That's a patch to a Makefile... not a recipe.

-M=



