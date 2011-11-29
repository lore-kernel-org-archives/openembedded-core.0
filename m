Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVQN8-00011o-4E
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 17:17:31 +0100
Received: from mail19-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.22; Tue, 29 Nov 2011 16:10:02 +0000
Received: from mail19-ch1 (localhost [127.0.0.1])	by mail19-ch1-R.bigfish.com
	(Postfix) with ESMTP id D81724A035C;
	Tue, 29 Nov 2011 16:10:06 +0000 (UTC)
X-SpamScore: -16
X-BigFish: VS-16(zz9371K1432N98dK4015Lzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail19-ch1 (localhost.localdomain [127.0.0.1]) by mail19-ch1
	(MessageSwitch) id 1322583006773682_22941;
	Tue, 29 Nov 2011 16:10:06 +0000 (UTC)
Received: from CH1EHSMHS026.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.252])	by mail19-ch1.bigfish.com (Postfix) with ESMTP id
	AF811700049;	Tue, 29 Nov 2011 16:10:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS026.bigfish.com
	(10.43.70.26) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 29 Nov 2011 16:09:58 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Tue, 29 Nov 2011 10:10:43 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] Introduce multiarch DISTRO_FEATURE
Thread-Index: AQHMq6VsUO05bOO/C0G8siH7/g/4OJW+pGYAgASTS4CAABdtAIAAAQ+AgADiWwCAAD2DAA==
Date: Tue, 29 Nov 2011 16:10:43 +0000
Message-ID: <CAEsOVNf7hckDk4i8gHx4_jXvzKzRxPkGfT4jP9ORSJvn_t=r=g@mail.gmail.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
	<CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
	<1322264404.25382.4.camel@ted>
	<CAEsOVNcAR_N2LszE41fTaA=FGXMgtOdnCTLvdMxyYC5+GkTkKg@mail.gmail.com>
	<1322520968.30225.23.camel@ted>
	<CAEsOVNcCc5ZOT6wi_0pwkrFsJWmCGGS_Co-uA-z=oeFCYSDe8g@mail.gmail.com>
	<1322569804.3166.5.camel@ted>
In-Reply-To: <1322569804.3166.5.camel@ted>
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
X-List-Received-Date: Tue, 29 Nov 2011 16:17:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D429A9FB84919B48A1DB506804FFB53B@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 6:30 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If you depend just on lib32-libgcc:do_populate_sysroot, it shouldn't
> build eglibc. You can do that with something like:
>
> do_compile[depends] +=3D "lib32-libgcc:do_populate_sysroot"

Thanks, I'll give this a try.

-M=



