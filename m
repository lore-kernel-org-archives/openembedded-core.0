Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RTQW4-0006tw-Qt
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 05:02:29 +0100
Received: from mail25-ch1-R.bigfish.com (10.43.68.244) by
	CH1EHSOBE003.bigfish.com (10.43.70.53) with Microsoft SMTP Server id
	14.1.225.22; Thu, 24 Nov 2011 03:55:14 +0000
Received: from mail25-ch1 (localhost [127.0.0.1])	by mail25-ch1-R.bigfish.com
	(Postfix) with ESMTP id B112D2002C1	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 03:54:49 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail25-ch1 (localhost.localdomain [127.0.0.1]) by mail25-ch1
	(MessageSwitch) id 1322106887650454_5741;
	Thu, 24 Nov 2011 03:54:47 +0000 (UTC)
Received: from CH1EHSMHS026.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail25-ch1.bigfish.com (Postfix) with ESMTP id
	998AA180045 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 03:54:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS026.bigfish.com
	(10.43.70.26) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 24 Nov 2011 03:55:11 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Wed, 23 Nov 2011 21:55:52 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
Thread-Index: AQHMqloOvCtx6Pv4A0Kv3YkijylUD5W7xIkAgAAE6YCAAAA1gA==
Date: Thu, 24 Nov 2011 03:55:51 +0000
Message-ID: <CAEsOVNe-AvQ-DXUH-TMZFtmmAJ0oqSRveh+ovC-qvttrpguARg@mail.gmail.com>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
	<CAMKF1sqdUPP1=3wiAMTD+Jmf8mbJyDXq4GT7Ho06=mBee92pPw@mail.gmail.com>
	<CAEsOVNd+AuWWwHQAWmeyJ0jnNaVm2522pO_ykVdqzc1X9m96Tg@mail.gmail.com>
	<CAMKF1sov7U1oRZYDyBdWT3uYr1_P0+pAJxU7kLVsDfngJhG16Q@mail.gmail.com>
	<CAEsOVNe22kPLsNn0pmkuSycHwNfO6AFgJGxqMb=ex+VamAK9hw@mail.gmail.com>
In-Reply-To: <CAEsOVNe22kPLsNn0pmkuSycHwNfO6AFgJGxqMb=ex+VamAK9hw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
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
X-List-Received-Date: Thu, 24 Nov 2011 04:02:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <816773A2B4B4ED41A976A783EA9AD039@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 9:54 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> On Wed, Nov 23, 2011 at 9:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> isnt BUILD_ARCH in signature
>>>
>>> This is a TARGET recipe, so it should *not* be right?
>>
>> no this is a cross recipe.
>
> This is built in tmp/work/ppce5500-fsl-linux/gcc-cross-*
>
> That's a TARGET package, even though it run on on the HOST... changing
> from x86 to X86-64 causes problems - hence the whole problem?

Actually the reverse causes the problem: x86-64 to x86... because the
packages won't be recompiled and the 64bit stuff won't run on 32bit
host?

-M=



