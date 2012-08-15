Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T1V4J-0003vh-Br
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 06:18:55 +0200
Received: from mail40-va3-R.bigfish.com (10.7.14.251) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	14.1.225.23; Wed, 15 Aug 2012 04:06:59 +0000
Received: from mail40-va3 (localhost [127.0.0.1])	by mail40-va3-R.bigfish.com
	(Postfix) with ESMTP id 85AA82C02C7	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 04:06:59 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail40-va3 (localhost.localdomain [127.0.0.1]) by mail40-va3
	(MessageSwitch) id 1345003617909349_9606;
	Wed, 15 Aug 2012 04:06:57 +0000 (UTC)
Received: from VA3EHSMHS028.bigfish.com (unknown [10.7.14.252])	by
	mail40-va3.bigfish.com (Postfix) with ESMTP id DB59B400A8	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 04:06:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS028.bigfish.com
	(10.7.99.38) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 15 Aug 2012 04:06:57 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Tue, 14 Aug 2012 23:06:56 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core] udev: update rcS to auto-detect hostname
Thread-Index: AQHNeptong6tI+3OwEi6/t3P47FpqA==
Date: Wed, 15 Aug 2012 04:06:56 +0000
Message-ID: <CAEsOVNdyF6DSM0aU6NgEJ6s11g5TTD+GJdXPyTXZv4HrY-VZ9A@mail.gmail.com>
References: <1345000125-3865-1-git-send-email-b19537@freescale.com>
	<CAMKF1so5imbcuFU1Ad2FXD8zQmAyLSTbfSS0kNtvQSE_Wj9JbQ@mail.gmail.com>
In-Reply-To: <CAMKF1so5imbcuFU1Ad2FXD8zQmAyLSTbfSS0kNtvQSE_Wj9JbQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
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
X-List-Received-Date: Wed, 15 Aug 2012 04:18:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CC50DB1B02FC8E4996975BCBB8915890@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 14, 2012 at 10:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Aug 14, 2012 at 8:08 PM,  <b19537@freescale.com> wrote:
>> echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a-=
z]"`
>
> $ echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a=
-z]"`
> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>
> is that what we want ?

I think we need an option to turn it on or off and or make it
configurable from a BSP layer. We are looking for a way to make a rfs
for all e500v2 or e500mc, etc and say the right machine type on the
prompt.

-M

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



