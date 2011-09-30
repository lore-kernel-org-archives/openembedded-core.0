Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9Ris-0001vC-FZ
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 03:17:06 +0200
Received: from mail177-ch1-R.bigfish.com (216.32.181.173) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 01:11:37 +0000
Received: from mail177-ch1 (localhost.localdomain [127.0.0.1])	by
	mail177-ch1-R.bigfish.com (Postfix) with ESMTP id A1DE08F03FE	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 01:11:37 +0000 (UTC)
X-SpamScore: -16
X-BigFish: VS-16(zz9371K1432N98dK4015Lzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail177-ch1 (localhost.localdomain [127.0.0.1]) by mail177-ch1
	(MessageSwitch) id 1317345097591235_13773;
	Fri, 30 Sep 2011 01:11:37 +0000 (UTC)
Received: from CH1EHSMHS022.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.242])	by mail177-ch1.bigfish.com (Postfix) with ESMTP id
	8B9381838050	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 01:11:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS022.bigfish.com
	(10.43.70.22) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 01:11:32 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Thu, 29 Sep 2011 20:11:32 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Build Times and Performance - Discussion + new ideas
Thread-Index: AQHMfw3jseFGRo0BskK8lcinwcHQ3A==
Date: Fri, 30 Sep 2011 01:11:31 +0000
Message-ID: <CAEsOVNc1Ckw-eCFSTGLngecojM=gR5rvphLFKP5TRfn17pobcg@mail.gmail.com>
References: <1317143228.26109.203.camel@ted>
In-Reply-To: <1317143228.26109.203.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Build Times and Performance - Discussion + new ideas
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
X-List-Received-Date: Fri, 30 Sep 2011 01:17:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C96BEAB4D90754439181657BE3B4C68D@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2011 at 12:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> https://wiki.yoctoproject.org/wiki/Build_Performance
>
> As detailed there I've setup a partition formatted with ext4 with no
> journal, no barriers and most importantly a long commit time. The intent
> here is to allow things to exist in memory and not block on disk IO.

Richard,

Can you comment on how much these settings effect build times vs.
saying running on ext3 which our build server happens to be using?

Thanks,
Matthew=



