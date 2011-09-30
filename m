Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9fPc-0004AU-Ti
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 17:54:09 +0200
Received: from mail78-ch1-R.bigfish.com (216.32.181.170) by
	CH1EHSOBE015.bigfish.com (10.43.70.65) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 15:48:39 +0000
Received: from mail78-ch1 (localhost.localdomain [127.0.0.1])	by
	mail78-ch1-R.bigfish.com (Postfix) with ESMTP id 549D6190398	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 15:48:39 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail78-ch1 (localhost.localdomain [127.0.0.1]) by mail78-ch1
	(MessageSwitch) id 1317397699778246_14270;
	Fri, 30 Sep 2011 15:48:19 +0000 (UTC)
Received: from CH1EHSMHS009.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.247])	by mail78-ch1.bigfish.com (Postfix) with ESMTP id
	AAE72BE8052 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 15:48:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS009.bigfish.com
	(10.43.70.9) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 15:48:18 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0323.007; Fri, 30 Sep 2011 10:48:18 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Add bash as RDEPENDS for gstreamer
Thread-Index: AQHMf4hfqtTcGzFVY0+/7FDdYAqquA==
Date: Fri, 30 Sep 2011 15:48:18 +0000
Message-ID: <CAEsOVNdKPk833GDMYrjGgjOMhmOxGWPzevEWUy3CzUsa2LCHSw@mail.gmail.com>
References: <1317347777-10288-1-git-send-email-msm@freescale.com>
	<1317374475.12332.134.camel@ted>
In-Reply-To: <1317374475.12332.134.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] Add bash as RDEPENDS for gstreamer
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
X-List-Received-Date: Fri, 30 Sep 2011 15:54:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <159861B3493BD845A27E95003B6D4C82@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 4:20 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> What image target are you building? I'm having trouble visualising an
> image that doesn't include bash or busybox and if either of these are
> present, that dependency should be met...
>
> If this is a toolchain/SDK, there were some recent tweaks which address
> this problem.

It was meta-toolchain-sdk, please drop this patch if that is the case.

-M=



