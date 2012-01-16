Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RmoFB-00032E-Tp
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 16:13:10 +0100
Received: from mail9-ch1-R.bigfish.com (10.43.68.241) by
	CH1EHSOBE007.bigfish.com (10.43.70.57) with Microsoft SMTP Server id
	14.1.225.23; Mon, 16 Jan 2012 15:05:29 +0000
Received: from mail9-ch1 (localhost [127.0.0.1])	by mail9-ch1-R.bigfish.com
	(Postfix) with ESMTP id 4F58E6805A0	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 15:05:30 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275dhz2dhc1ahc1bh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail9-ch1 (localhost.localdomain [127.0.0.1]) by mail9-ch1
	(MessageSwitch) id 1326726328245696_5574;
	Mon, 16 Jan 2012 15:05:28 +0000 (UTC)
Received: from CH1EHSMHS004.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail9-ch1.bigfish.com (Postfix) with ESMTP id
	37542600133 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 15:05:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS004.bigfish.com
	(10.43.70.4) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 16 Jan 2012 15:05:26 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Mon, 16 Jan 2012 09:05:29 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] bitbake/fetch2: add support for wrapper
	command
Thread-Index: AQHM1ArD8I/p7sL3vkG3nDK8RN3fjJYPUl2AgAAqmAA=
Date: Mon, 16 Jan 2012 15:05:29 +0000
Message-ID: <CAEsOVNcpOujgBKFwF_Z7XOOXpKQ1MamA_AaP8MeJtmX-DDvwVA@mail.gmail.com>
References: <1326409412-15507-1-git-send-email-msm@freescale.com>
	<4F13AD3B.50902@linux.intel.com> <1326717159.532.2.camel@ted>
In-Reply-To: <1326717159.532.2.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 1/2] bitbake/fetch2: add support for wrapper command
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
X-List-Received-Date: Mon, 16 Jan 2012 15:13:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <191EB5A9A2340F4F84B458EB7CF0794C@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2012 at 6:32 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> > + =A0 =A0cmd =3D "%s %s" % (bb.data.getVar("BB_FETCH_WRAPPER", d, True=
), cmd)
>> > +
>> I am guessing you really want a check here if BB_FETCH_WRAPPER is set,
>> otherwise I am not sure this will work correctly, did you test without
>> this new variable set?
>
> We've had this conversation on the bitbake list. I think Matthew has an
> alternative fix to use instead of this so we'll likely drop this patch
> anyway.

Yes, please drop this patch.

-M=



