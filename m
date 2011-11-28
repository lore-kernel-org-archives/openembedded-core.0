Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVAHt-00032W-A4
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 00:07:01 +0100
Received: from mail170-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.22; Mon, 28 Nov 2011 22:59:35 +0000
Received: from mail170-ch1 (localhost [127.0.0.1])	by
	mail170-ch1-R.bigfish.com (Postfix) with ESMTP id 7533124019E;
	Mon, 28 Nov 2011 22:59:36 +0000 (UTC)
X-SpamScore: -21
X-BigFish: VS-21(zz9371K936eK179dN1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail170-ch1 (localhost.localdomain [127.0.0.1]) by mail170-ch1
	(MessageSwitch) id 1322521174390851_26625;
	Mon, 28 Nov 2011 22:59:34 +0000 (UTC)
Received: from CH1EHSMHS019.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail170-ch1.bigfish.com (Postfix) with ESMTP id
	5A6CC4A0042;	Mon, 28 Nov 2011 22:59:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS019.bigfish.com
	(10.43.70.19) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 28 Nov 2011 22:59:33 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Mon, 28 Nov 2011 17:00:18 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] Introduce multiarch DISTRO_FEATURE
Thread-Index: AQHMq6VsUO05bOO/C0G8siH7/g/4OJW+pGYAgASTS4CAABdtAIAAAQ+A
Date: Mon, 28 Nov 2011 23:00:18 +0000
Message-ID: <CAEsOVNcCc5ZOT6wi_0pwkrFsJWmCGGS_Co-uA-z=oeFCYSDe8g@mail.gmail.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
	<CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
	<1322264404.25382.4.camel@ted>
	<CAEsOVNcAR_N2LszE41fTaA=FGXMgtOdnCTLvdMxyYC5+GkTkKg@mail.gmail.com>
	<1322520968.30225.23.camel@ted>
In-Reply-To: <1322520968.30225.23.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH v3] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Mon, 28 Nov 2011 23:07:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4454CC2A18AB2F4783443695B7D2CF17@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2011 at 4:56 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-11-28 at 21:32 +0000, McClintock Matthew-B29882 wrote:
>> On Fri, Nov 25, 2011 at 5:40 PM, Richard Purdie
>> > What specific problem are you trying to solve?
>>
>> The specific issue I'm having is for our 64-bit part that still uses a
>> 32-bit u-boot. Not sure the best approach really is...
>
> Hmm, does it really need libgcc?

I pretty sure... I don't think it uses much though.

>
>> I've tried utilizing multilib by adding the following to my u-boot
>> recipe, but it's just hacky...
>>
>> DEPENDS_e5500-64b_append =3D " lib32-gcc"
>> CC_e5500-64b =3D "powerpc-poky-linux-gcc -m32"
>>
>> I'd rather NOT recompile gcc/eglibc/etc just for this 32-bit build of
>> u-boot where we don't need libc. I'd rather just have a functional
>> 32bit/64bit compiler for our 64-bit target.
>
> The trouble is that you need glibc-intermediate to build gcc-cross
> (which builds a functional libgcc). You therefore can't short circuit
> this as much as you think :/.

Is there a way to skip eglibc then? That would make things much better.

-M=



