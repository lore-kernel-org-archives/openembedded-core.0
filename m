Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RYlX0-0008KD-3U
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 22:29:30 +0100
Received: from mail217-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.23; Thu, 8 Dec 2011 21:07:11 +0000
Received: from mail217-ch1 (localhost [127.0.0.1])	by
	mail217-ch1-R.bigfish.com (Postfix) with ESMTP id 0190150010A	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 21:07:20 +0000 (UTC)
X-SpamScore: -13
X-BigFish: VS-13(zz9371I936eK1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail217-ch1 (localhost.localdomain [127.0.0.1]) by mail217-ch1
	(MessageSwitch) id 1323378439910964_29299;
	Thu,  8 Dec 2011 21:07:19 +0000 (UTC)
Received: from CH1EHSMHS015.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail217-ch1.bigfish.com (Postfix) with ESMTP id
	CD3964A0045	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 21:07:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS015.bigfish.com
	(10.43.70.15) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 8 Dec 2011 21:07:08 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Thu, 8 Dec 2011 15:07:21 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Coordinating inter-layer dependencies
Thread-Index: AQHMte1fupm4FwcSGUOFKunAq7T74Q==
Date: Thu, 8 Dec 2011 21:07:20 +0000
Message-ID: <CAEsOVNfcoryUNUgE43YmoT9T+_NG4BMP4owXZP=HmzJ0n+Q=gw@mail.gmail.com>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<1323303457.971.5.camel@ted>
In-Reply-To: <1323303457.971.5.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 08 Dec 2011 21:29:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <25BCA4F100DA6D4ABD8074BA401FB696@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2011 at 6:17 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-12-01 at 12:23 +0100, Koen Kooi wrote:
>> During the past month there have been a number of updates to OE-core
>> recipes that triggered parsing errors due to bbappend in other layers.
>> A small seleciton:
>>
>> * netbase
>> * libdrm
>> * xserver-xorg
>> * clutter
>>
>> My view is that layer maintainers need to keep an eye on potential
>> breakage and have updates ready when patches land into OE-core.
>> Looking back I can see that while the situation is improving a bit,
>> it's still not working. The problem with slow updates to layers is
>> that (with my angstrom hat on) users (and with my TI hat on) customers
>> and coworkers can't do builds without rm'ing the bbappends or
>> disabling the layer.
>
>
> I've been thinking about this. I wondered if the notion of wildcards
> for .bbappend might help, e.g. a file called:
>
> netbase_%.bbappend
>
> would match all versions of the netbase recipe.
>
> The % is consistent with PREFERRED_VERSION, I'm a little reluctant to
> use * since its a shell quoting mess.
>
> It wouldn't be hard to allow bitbake to support this and would solve
> some of the issues we've been having...

For what it's worth, I like the wild card idea.

-M=



