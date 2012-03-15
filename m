Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S8Chl-0002iO-5z
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 16:35:05 +0100
Received: from mail87-va3-R.bigfish.com (10.7.14.242) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	14.1.225.23; Thu, 15 Mar 2012 14:56:08 +0000
Received: from mail87-va3 (localhost [127.0.0.1])	by mail87-va3-R.bigfish.com
	(Postfix) with ESMTP id 1EAC84003E3	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 14:56:08 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail87-va3 (localhost.localdomain [127.0.0.1]) by mail87-va3
	(MessageSwitch) id 1331823365802602_14110;
	Thu, 15 Mar 2012 14:56:05 +0000 (UTC)
Received: from VA3EHSMHS012.bigfish.com (unknown [10.7.14.248])	by
	mail87-va3.bigfish.com (Postfix) with ESMTP id B5C8E3000AB	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 14:56:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS012.bigfish.com
	(10.7.99.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 15 Mar 2012 14:56:03 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Thu, 15 Mar 2012 09:56:01 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 8/8] gcc: enable multilib for target gcc
Thread-Index: AQHNAlXskg2PXW4H00ieB0Tmd3PnXpZrWbUAgABszgA=
Date: Thu, 15 Mar 2012 14:56:00 +0000
Message-ID: <CAEsOVNdX1oxNdq_TRV05Bxy9_xwsxwhNO78VN_VAats-4X+ahA@mail.gmail.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
	<ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
	<513484b0dacc94af1730ddf919b88f57adc63f53.1331776832.git.nitin.a.kamble@intel.com>
	<CAEsOVNdBma0dRbnzkq05avjSbtJfVuSC67ihWvLi17RK_duaxQ@mail.gmail.com>
	<1331799972.18586.67.camel@ted>
In-Reply-To: <1331799972.18586.67.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH 8/8] gcc: enable multilib for target gcc
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
X-List-Received-Date: Thu, 15 Mar 2012 15:35:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <467762F61F76E040812B482F783347F9@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2012 at 3:26 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Whilst I understand the desire, this is not what the patch series is
> intended for and I don't think it reasonable to try and change the patch
> series to fit that requirement.

Not insisting on anything just spurring further conversation...

> The big issue you face trying to do the above is iterating over the
> toolchain building libgcc and libc for each of the variants you mention.
> This is particularly hard since at least in the multilib case they have
> different libdir paths, in your non-multilib case, they would overlap.
>
> So no, I don't think its possible to do what you describe in this
> context.

I'm not sure of all the issues, but I know we make toolchains that
support all Freescale parts - that's something I'm looking to
reproduce with Yocto at some point.

Also, regarding multilib recipes (not gcc) have you given though to
having multilib sort of always in effect? I.E if I build a
lib32-binutils on a 64-bit machine - it should go generate the
sstate-cache that could be reused by a pure 32-bit machine?

Basically we are creating these one-off sstate-caches for this
scenario... sstate for lib64 on a lib32 machine or vice versa...

-M=



