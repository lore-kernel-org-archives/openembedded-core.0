Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T1VX4-00086o-Nj
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 06:48:38 +0200
Received: from mail229-tx2-R.bigfish.com (10.9.14.238) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Wed, 15 Aug 2012 04:21:38 +0000
Received: from mail229-tx2 (localhost [127.0.0.1])	by
	mail229-tx2-R.bigfish.com (Postfix) with ESMTP id 921EB4800A7	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 04:21:38 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail229-tx2 (localhost.localdomain [127.0.0.1]) by mail229-tx2
	(MessageSwitch) id 13450044975092_23956;
	Wed, 15 Aug 2012 04:21:37 +0000 (UTC)
Received: from TX2EHSMHS019.bigfish.com (unknown [10.9.14.240])	by
	mail229-tx2.bigfish.com (Postfix) with ESMTP id E9549700044	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 04:21:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS019.bigfish.com
	(10.9.99.119) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 15 Aug 2012 04:21:36 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Tue, 14 Aug 2012 23:21:35 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core] udev: update rcS to auto-detect hostname
Thread-Index: AQHNeptong6tI+3OwEi6/t3P47FpqJdalukAgAACgYA=
Date: Wed, 15 Aug 2012 04:21:35 +0000
Message-ID: <CAEsOVNcvHaLz1oG_rGPjuQjb80RqEjBpKQzGNJG0d2rM7NeYJA@mail.gmail.com>
References: <1345000125-3865-1-git-send-email-b19537@freescale.com>
	<CAMKF1so5imbcuFU1Ad2FXD8zQmAyLSTbfSS0kNtvQSE_Wj9JbQ@mail.gmail.com>
	<CAEsOVNdyF6DSM0aU6NgEJ6s11g5TTD+GJdXPyTXZv4HrY-VZ9A@mail.gmail.com>
	<CABcZANmHkcwmgSPAXD6NwrOfjtgD+7Hvo8X4O81WWZbhPBiMbw@mail.gmail.com>
In-Reply-To: <CABcZANmHkcwmgSPAXD6NwrOfjtgD+7Hvo8X4O81WWZbhPBiMbw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: udev: update rcS to auto-detect hostname
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
X-List-Received-Date: Wed, 15 Aug 2012 04:48:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B6B1709968E7964EA2F262453E4A4D9E@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 14, 2012 at 11:12 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Aug 14, 2012 at 9:06 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Tue, Aug 14, 2012 at 10:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Tue, Aug 14, 2012 at 8:08 PM,  <b19537@freescale.com> wrote:
>>>> echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[=
a-z]"`
>>>
>>> $ echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "=
[a-z]"`
>>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>>> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>>>
>>> is that what we want ?
>>
>> I think we need an option to turn it on or off and or make it
>> configurable from a BSP layer. We are looking for a way to make a rfs
>> for all e500v2 or e500mc, etc and say the right machine type on the
>> prompt.
>
> This sounds like something that really does belong in your own
> supplementary layer, rather than oe-core.

Seemed like a valuable option for making rfs for multiple machines /
targets, but if we don't want it (or some of the bits) in oe-core
that's fine by me too.

-M

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



