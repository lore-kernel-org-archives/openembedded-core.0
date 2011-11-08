Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RNrmR-0004Ir-RP
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:56:24 +0100
Received: from mail96-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE015.bigfish.com (10.43.70.65) with Microsoft SMTP Server id
	14.1.225.22; Tue, 8 Nov 2011 19:49:43 +0000
Received: from mail96-ch1 (localhost.localdomain [127.0.0.1])	by
	mail96-ch1-R.bigfish.com (Postfix) with ESMTP id 74FBC578148	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 19:49:55 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail96-ch1 (localhost.localdomain [127.0.0.1]) by mail96-ch1
	(MessageSwitch) id 1320781793331640_18271;
	Tue,  8 Nov 2011 19:49:53 +0000 (UTC)
Received: from CH1EHSMHS003.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail96-ch1.bigfish.com (Postfix) with ESMTP id
	4560514D804F	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 19:49:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS003.bigfish.com
	(10.43.70.3) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 8 Nov 2011 19:50:02 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Tue, 8 Nov 2011 13:50:02 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Introduce biarch DISTRO_FEATURE
Thread-Index: AQHMk4RPSNNvOwcjRk+rCnxcs8KJIZWig6IAgAFZAYA=
Date: Tue, 8 Nov 2011 19:50:01 +0000
Message-ID: <CAEsOVNfcSiNnkJ3mL8ZOyDY1cbvfvbgsQ1tGj=QxfWoGtWKy4A@mail.gmail.com>
References: <1319505532-23199-1-git-send-email-julian.pidancet@gmail.com>
	<CAEsOVNen8kUVPge_jZDq5LjhC7BAG0YKx=wxO+ZysNGAd_KwQg@mail.gmail.com>
	<CAKZ=5EVjCrBdH2NBrVD_4UD52h6ZG=p6m-QS5L9K8xfpUcUr1g@mail.gmail.com>
In-Reply-To: <CAKZ=5EVjCrBdH2NBrVD_4UD52h6ZG=p6m-QS5L9K8xfpUcUr1g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] Introduce biarch DISTRO_FEATURE
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
X-List-Received-Date: Tue, 08 Nov 2011 19:56:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9749B5E0AA465E49922D4E8A194A4D00@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2011 at 5:14 PM, Julian Pidancet
<julian.pidancet@gmail.com> wrote:
> Hi Matthew, sorry for the late answer.
>
> I'm affraid I don't quite see what you mean by "the native gcc on the
> root file system". Are you refering to the version of GCC present on
> the build machine and built by OE ? Or are you refering instead about
> a potential version of GCC running on the target ?
>
> This patch should only make gcc-cross, and gcc running on the target
> "biarch". It would also probably make sense to build a biarch GCC in
> the meta-toolchain case.

This is what I was referring too... cross gcc in /opt/poky/ that can
build for multiple targets...

> To be honest, I have not really considered the meta-toolchain case as
> I've never used it before and not quite sure how it works.

It just builds an installable tarball with the toolchain components
and some other nativesdk components.

> I can respin a patch to handle the meta-toolchain case. But in the
> mean-time, it would be nice if I could get an opinion on wether this
> "biarch" feature is a good idea or not, or, if not, maybe some
> suggestions about how to address this specific 32bit/64bit use-case
> differently.

Can't really comment on your patch... but I know it would be nice to
generate a cross gcc that supports more than just the target yocto is
building for at the time. For instance, build support for all powerpc
or all x86 targets poky could possibly build for when building
meta-toolchain....

-M=



