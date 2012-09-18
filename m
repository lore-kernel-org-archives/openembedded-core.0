Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6cT-0000ca-9V
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:50:17 +0200
Received: from mail124-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:37:36 +0000
Received: from mail124-tx2 (localhost [127.0.0.1])	by
	mail124-tx2-R.bigfish.com (Postfix) with ESMTP id 506381201E5;
	Tue, 18 Sep 2012 22:37:36 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail124-tx2 (localhost.localdomain [127.0.0.1]) by mail124-tx2
	(MessageSwitch) id 1348007773768627_4962;
	Tue, 18 Sep 2012 22:36:13 +0000 (UTC)
Received: from TX2EHSMHS010.bigfish.com (unknown [10.9.14.251])	by
	mail124-tx2.bigfish.com (Postfix) with ESMTP id B788E4002B6;
	Tue, 18 Sep 2012 22:36:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS010.bigfish.com
	(10.9.99.110) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:36:13 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Tue, 18 Sep 2012 17:36:13 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] eglibc_2.16.bb: replace patch with updated
	version that supportds e6500
Thread-Index: AQHNleqzPTbAYSB8AEa+y/CUgrNCKZeQ/muA//+uK4CAAFW8gP//rLmAgABUUQD//6y2AA==
Date: Tue, 18 Sep 2012 22:36:12 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68B775@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B581@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1sqSCx4pc_mH6a9VoACPyn6RyLiSgqEoCjbfVgStz=PADw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B656@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1spFAru3unZSvd18cu555mgOCLgFf4on0xkZx=xeBM+5Xw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B723@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1soL2o+CmBxevKcLPXjvcuwEvgLuFeQ8hY916_rzQVbdhg@mail.gmail.com>
In-Reply-To: <CAMKF1soL2o+CmBxevKcLPXjvcuwEvgLuFeQ8hY916_rzQVbdhg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc_2.16.bb: replace patch with updated version that supportds e6500
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
X-List-Received-Date: Tue, 18 Sep 2012 22:50:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AA22C2BAD7604D4B8D1A0CCAD748EBCD@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 5:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Sep 18, 2012 at 3:32 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>
>> Internal patch name. I can change it if needed. But, then I have to
>> track patch names differences between internal and external.
>
> Not that I am opposed to it but its hard to review as I said.
> cant internal be changed ?

Ha ha ha...

;)

-M=



