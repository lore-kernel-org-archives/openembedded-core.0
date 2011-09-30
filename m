Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9gm1-0007Oe-BL
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:21:21 +0200
Received: from mail18-ch1-R.bigfish.com (216.32.181.168) by
	CH1EHSOBE006.bigfish.com (10.43.70.56) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 17:00:38 +0000
Received: from mail18-ch1 (localhost.localdomain [127.0.0.1])	by
	mail18-ch1-R.bigfish.com (Postfix) with ESMTP id CC758C2020D	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 17:00:37 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail18-ch1 (localhost.localdomain [127.0.0.1]) by mail18-ch1
	(MessageSwitch) id 1317401980633026_12648;
	Fri, 30 Sep 2011 16:59:40 +0000 (UTC)
Received: from CH1EHSMHS029.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail18-ch1.bigfish.com (Postfix) with ESMTP id
	8A77318D8198	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 16:59:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS029.bigfish.com
	(10.43.70.29) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 16:59:01 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Fri, 30 Sep 2011 11:58:48 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 01/16] libnl2: Fix a race on
	route/pktloc_syntax.h
Thread-Index: AQHMfybENeCaQrDzXk+6c7ADKhUffZVl1nGAgACjaYA=
Date: Fri, 30 Sep 2011 16:58:47 +0000
Message-ID: <CAEsOVNfcJV6pBCt7+9C+Grip_QgXHmkcy0PJRa-EL8nRFqwpzg@mail.gmail.com>
References: <1317323496-1818-1-git-send-email-msm@freescale.com>
	<CAEsOVNdsWvCRj+nixWeE-vubRTGG3yrDkEiUCZCUpFyrUESY3g@mail.gmail.com>
	<20110930071333.GB2361@jama.jama.net>
In-Reply-To: <20110930071333.GB2361@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH v2 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Fri, 30 Sep 2011 17:21:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <67513C48BB781643990C95963CB63F63@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 2:13 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Sep 30, 2011 at 04:09:37AM +0000, McClintock Matthew-B29882 wrote=
:
>> On Thu, Sep 29, 2011 at 2:11 PM, Matthew McClintock <msm@freescale.com> =
wrote:
>> > From: Tom Rini <tom_rini@mentor.com>
>> >
>> > At issue is that route/pktloc.c (not generated) depends on
>> > route/pktloc_syntax.h (generated).
>> >
>> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
>> > Signed-off-by: Matthew McClintock <msm@freescale.com>
>>
>> Please ignore this patch as it does not seem to fix the issue.
>
> Why not use latest version of this patch?
> http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/libnl/libn=
l/fix-pktloc-dep-race.patch
> or meta-oe
> http://git.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recip=
es-support/libnl/libnl/fix-pktloc-dep-race.patch
>
> seems like you're missing pktloc_grammar.h here..
>
> and when you're at it, please also add packaging changes from meta-oe,
> so we can remove libnl from meta-oe and keep only libnl1 there.

I pulled this out of openembbeded repo. I guess I managed to mess
something up. Will resend/retest.

-M=



