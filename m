Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SBbM7-0007Fy-G9
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 01:30:47 +0100
Received: from mail196-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.23; Sun, 25 Mar 2012 00:06:33 +0000
Received: from mail196-ch1 (localhost [127.0.0.1])	by
	mail196-ch1-R.bigfish.com (Postfix) with ESMTP id 9D9FC100104	for
	<openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 00:06:32 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I936eK1432N98dKzz1202hzzz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail196-ch1 (localhost.localdomain [127.0.0.1]) by mail196-ch1
	(MessageSwitch) id 1332633990776383_12880;
	Sun, 25 Mar 2012 00:06:30 +0000 (UTC)
Received: from CH1EHSMHS007.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.234])	by mail196-ch1.bigfish.com (Postfix) with ESMTP id
	BB1773801EC	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 00:06:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS007.bigfish.com
	(10.43.70.7) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 25 Mar 2012 00:06:30 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Sat, 24 Mar 2012 19:06:40 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] should i assume "SERIAL_CONSOLES" is a typo?
Thread-Index: AQHNChsnT5X+fdwk2kq++4Zn8fzURw==
Date: Sun, 25 Mar 2012 00:06:40 +0000
Message-ID: <CAEsOVNdOp6GVeGusJXit2xocy-V7a7nzejTpo3aKT9y9-sxtjA@mail.gmail.com>
References: <alpine.DEB.2.02.1203240515560.21886@oneiric>
	<1332584294.9740.506.camel@ted>
	<alpine.DEB.2.02.1203240621540.25240@oneiric>
In-Reply-To: <alpine.DEB.2.02.1203240621540.25240@oneiric>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: should i assume "SERIAL_CONSOLES" is a typo?
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
X-List-Received-Date: Sun, 25 Mar 2012 00:30:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CD4699F75BCCC34E924D62FCE4D8B491@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 24, 2012 at 5:27 AM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
> On Sat, 24 Mar 2012, Richard Purdie wrote:
>
>> On Sat, 2012-03-24 at 05:16 -0400, Robert P. J. Day wrote:
>> > meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb: =A0 =A0tmp=3D"=
${SERIAL_CONSOLES}"
>>
>> Its not a typo, if you look at the code, it processes SERIAL_CONSOLE and
>> SERIAL_CONSOLES.
>
> =A0ah, i'd noticed that but i didn't see any example of a machine
> taking advantage of that. =A0and there's no mention of that variable in
> any of the docs that i can see.

Machines outside of oe-core can take advantage ;)

-M=



