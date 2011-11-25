Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RTlIg-0003kS-25
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 03:14:02 +0100
Received: from mail134-ch1-R.bigfish.com (10.43.68.246) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.22; Fri, 25 Nov 2011 01:51:38 +0000
Received: from mail134-ch1 (localhost [127.0.0.1])	by
	mail134-ch1-R.bigfish.com (Postfix) with ESMTP id 1E9B028014A	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 01:51:06 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail134-ch1 (localhost.localdomain [127.0.0.1]) by mail134-ch1
	(MessageSwitch) id 132218586453557_19934;
	Fri, 25 Nov 2011 01:51:04 +0000 (UTC)
Received: from CH1EHSMHS035.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail134-ch1.bigfish.com (Postfix) with ESMTP id
	08C92640045	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 01:51:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS035.bigfish.com
	(10.43.70.35) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 25 Nov 2011 01:51:36 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Thu, 24 Nov 2011 19:52:05 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
Thread-Index: AQHMqwS+vCtx6Pv4A0Kv3YkijylUD5W9HcKAgAAaWAA=
Date: Fri, 25 Nov 2011 01:52:05 +0000
Message-ID: <CAEsOVNc3U4Vn_Qy54rGYxRxC4UL6qRLMpisEa_ev-hhYXjSZhw@mail.gmail.com>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
	<CAEsOVNe6ywzXK2b483FA-2T3A8x6-OwQXWKnsdMVWq5QTKh7sw@mail.gmail.com>
	<1322180245.10928.50.camel@ted>
In-Reply-To: <1322180245.10928.50.camel@ted>
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
X-List-Received-Date: Fri, 25 Nov 2011 02:14:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <83CE8869AA989A4A804815D0EF38431D@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 6:17 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This should mean you can't use 32 bit sstate files on a 64 bit system
> and vice versa already?

That would seem to be the case already:

SSTATE_PKG=3D"/home/mattsm/git/poky/sstate-cache/sstate-gcc-cross-ppce5500-=
fsl-linux-4.6.1+svnr175454-r10-x86_64_ppce5500-2-${BB_TASKHASH}"

SSTATE_PKG=3D"/home/mattsm/git/poky/sstate-cache/sstate-gcc-cross-ppce500mc=
-fsl-linux-4.6.1+svnr175454-r10-i686_ppce500mc-2-${BB_TASKHASH}"

So, I'm not 100% sure what is going on anymore...

-M=



