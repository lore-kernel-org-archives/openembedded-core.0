Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RV9xk-0004M8-Bx
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 23:46:12 +0100
Received: from mail116-ch1-R.bigfish.com (10.43.68.243) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.22; Mon, 28 Nov 2011 22:23:37 +0000
Received: from mail116-ch1 (localhost [127.0.0.1])	by
	mail116-ch1-R.bigfish.com (Postfix) with ESMTP id 508335C01CF	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 22:23:37 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail116-ch1 (localhost.localdomain [127.0.0.1]) by mail116-ch1
	(MessageSwitch) id 1322519017247456_3874;
	Mon, 28 Nov 2011 22:23:37 +0000 (UTC)
Received: from CH1EHSMHS018.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail116-ch1.bigfish.com (Postfix) with ESMTP id
	38EB66C0250	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 22:23:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS018.bigfish.com
	(10.43.70.18) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 28 Nov 2011 22:23:37 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Mon, 28 Nov 2011 16:24:23 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] Introduce multiarch DISTRO_FEATURE
Thread-Index: AQHMq6VsUO05bOO/C0G8siH7/g/4OJW+pGYAgASTS4CAAAvGgIAAAkOAgAAAagA=
Date: Mon, 28 Nov 2011 22:24:23 +0000
Message-ID: <CAEsOVNdVnCd14BnSv-=4oTJ68XT-tO1K+rDBKm=RD0TXqH7G+Q@mail.gmail.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
	<CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
	<1322264404.25382.4.camel@ted>
	<CAEsOVNcAR_N2LszE41fTaA=FGXMgtOdnCTLvdMxyYC5+GkTkKg@mail.gmail.com>
	<CAKZ=5EV8s7GQRPbUcXj44nDZK1xf=qBT3mvUZEb9+v5jGz3+9Q@mail.gmail.com>
	<CAMKF1sq7Pv4fqEOU2Pow4_Hsw27R6FOUZDf7O0kSEwgq_Moh-w@mail.gmail.com>
In-Reply-To: <CAMKF1sq7Pv4fqEOU2Pow4_Hsw27R6FOUZDf7O0kSEwgq_Moh-w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
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
X-List-Received-Date: Mon, 28 Nov 2011 22:46:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <50CBDEDCCD145E4A802CA8AB209ABD87@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2011 at 4:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I think we should make it inclusive
> ideally we should have bi-arch/tri-arch toolchain building multilib users=
pace.
> in which case we have single compiler for multilib as well as archness

I would like to see this as well.

-M=



