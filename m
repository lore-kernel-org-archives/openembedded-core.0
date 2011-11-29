Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVRM4-0002lH-AK
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 18:20:28 +0100
Received: from mail175-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE004.bigfish.com (10.43.70.54) with Microsoft SMTP Server id
	14.1.225.22; Tue, 29 Nov 2011 16:57:46 +0000
Received: from mail175-ch1 (localhost [127.0.0.1])	by
	mail175-ch1-R.bigfish.com (Postfix) with ESMTP id EEED620039A	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 16:57:33 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail175-ch1 (localhost.localdomain [127.0.0.1]) by mail175-ch1
	(MessageSwitch) id 1322585853893036_15241;
	Tue, 29 Nov 2011 16:57:33 +0000 (UTC)
Received: from CH1EHSMHS003.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail175-ch1.bigfish.com (Postfix) with ESMTP id
	CDACD260048	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 16:57:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS003.bigfish.com
	(10.43.70.3) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 29 Nov 2011 16:57:45 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Tue, 29 Nov 2011 10:58:32 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] rpm_5.4.0.bb: Build rpm without xz
Thread-Index: AQHMrrC72mMs0BwS40qDyF/VyM5hEw==
Date: Tue, 29 Nov 2011 16:58:31 +0000
Message-ID: <CAEsOVNfY7W1857tL0MupfW9vg2y1hYfRF=PNfGggwZ13QzpE4Q@mail.gmail.com>
References: <1322070364.15626.17.camel@ted>
	<1322515367-22100-1-git-send-email-msm@freescale.com>
	<4ED502CA.7070505@linux.intel.com> <4ED50CB2.4060409@windriver.com>
In-Reply-To: <4ED50CB2.4060409@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] rpm_5.4.0.bb: Build rpm without xz
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
X-List-Received-Date: Tue, 29 Nov 2011 17:20:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0646B27B5A611E419B0C6E9C13B08122@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 10:47 AM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
> Sorry, I didn't see this earlier. =A0We may need XZ support, externally, =
to
> work with packages from folks like Red Hat.
>
> I'm not asking to revert this change.. just pointing out that people who =
are
> using RPM functionality should watch and see if this causes any negative
> impacts on their systems.

Then the v1 of this patch exists to add xz to RPM deps if needed...

-M=



