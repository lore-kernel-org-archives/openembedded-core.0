Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Soc67-0004ro-UM
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:11:32 +0200
Received: from mail142-co1-R.bigfish.com (10.243.78.243) by
	CO1EHSOBE015.bigfish.com (10.243.66.78) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 14:58:01 +0000
Received: from mail142-co1 (localhost [127.0.0.1])	by
	mail142-co1-R.bigfish.com (Postfix) with ESMTP id 314FC880212	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 14:58:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail142-co1 (localhost.localdomain [127.0.0.1]) by mail142-co1
	(MessageSwitch) id 1341932279483545_2800;
	Tue, 10 Jul 2012 14:57:59 +0000 (UTC)
Received: from CO1EHSMHS002.bigfish.com (unknown [10.243.78.248])	by
	mail142-co1.bigfish.com (Postfix) with ESMTP id 74319C4004F	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 14:57:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS002.bigfish.com
	(10.243.66.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 14:57:59 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Tue, 10 Jul 2012 10:00:16 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] bitbake.conf: Add git-native to ASSUME_PROVIDED
Thread-Index: AQHNXqy2Cys5uAe9K0uKbTtL+17Lmw==
Date: Tue, 10 Jul 2012 15:00:15 +0000
Message-ID: <CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
References: <1341927124.24837.8.camel@ted>
In-Reply-To: <1341927124.24837.8.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 10 Jul 2012 15:11:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <85E489DE63511F4A8784A8F45ABDF482@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 8:32 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Originally, git was something new, not installed everywhere and had comma=
ndline
> stability problems. This has changed and git it no longer makes sense to
> continually build this when the system installed version is likely suffic=
ient.
>
> This speeds up build since recipes no longer have to wait for git-native =
to build
> if they're fetched from a git:// SRC_URI.
>
> Also add git to the sanity checks and drop the no unneeded svn reference.

What about testing the host system for presence of certain things?
Then one could

1) yum/apt/etc install the needed items

or

2) Build it if it's not present

-M=



