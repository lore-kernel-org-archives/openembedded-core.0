Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGHlM-0003XU-9c
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 01:08:28 +0200
Received: from mail158-co1-R.bigfish.com (10.243.78.229) by
	CO1EHSOBE003.bigfish.com (10.243.66.66) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 22:55:39 +0000
Received: from mail158-co1 (localhost [127.0.0.1])	by
	mail158-co1-R.bigfish.com (Postfix) with ESMTP id 6877C7000EE;
	Mon, 24 Sep 2012 22:55:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail158-co1 (localhost.localdomain [127.0.0.1]) by mail158-co1
	(MessageSwitch) id 1348527337473418_10126;
	Mon, 24 Sep 2012 22:55:37 +0000 (UTC)
Received: from CO1EHSMHS023.bigfish.com (unknown [10.243.78.230])	by
	mail158-co1.bigfish.com (Postfix) with ESMTP id 6FD2C440052;
	Mon, 24 Sep 2012 22:55:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS023.bigfish.com
	(10.243.66.33) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 22:55:37 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Mon, 24 Sep 2012 17:55:36 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/2] libx11.inc: disable warnings that don't
	work on certain compilers
Thread-Index: AQHNmo9Neh5HA2KHJUaVw2FGObezaJeZ6uwAgABg3ID//85qAA==
Date: Mon, 24 Sep 2012 22:55:36 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A3ABC@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<20120924200050.GF3295@jama.jama.net>
	<70CC66F5C30A414DADDA6973E4CA391A6A2D4F@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAJTo0Lbx9CoDzbKnMrdEwtTzJO-+LEatBTnZnF2f7tNWwhO+eA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbx9CoDzbKnMrdEwtTzJO-+LEatBTnZnF2f7tNWwhO+eA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libx11.inc: disable warnings that don't work on certain compilers
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
X-List-Received-Date: Mon, 24 Sep 2012 23:08:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9CE32F51CDBACE40A4557D2D48598DAD@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 3:52 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 24 September 2012 21:06, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>> Shouldn't it be applied only for -native? version?
>>
>> That's reasonable. But, suppressing warnings to compile logs also did
>> not seem to matter much since we don't go line by line on warnings in
>> compile logs (does anyone?). I'll go with the consensus though.
>
> I'd prefer this to be a -native only thing too.

I think the CWARNFLAGS needs to be on all the though (native,
nativesdk, etc), '-e' can go away entirely.

-M

>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



