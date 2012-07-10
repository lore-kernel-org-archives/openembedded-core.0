Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SodDP-00009N-S1
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:23:07 +0200
Received: from mail67-db3-R.bigfish.com (10.3.81.247) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 16:09:37 +0000
Received: from mail67-db3 (localhost [127.0.0.1])	by mail67-db3-R.bigfish.com
	(Postfix) with ESMTP id A6D4B220205	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 16:09:37 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail67-db3 (localhost.localdomain [127.0.0.1]) by mail67-db3
	(MessageSwitch) id 1341936575485760_12713;
	Tue, 10 Jul 2012 16:09:35 +0000 (UTC)
Received: from DB3EHSMHS015.bigfish.com (unknown [10.3.81.245])	by
	mail67-db3.bigfish.com (Postfix) with ESMTP id 729093C0044	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 16:09:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS015.bigfish.com
	(10.3.87.115) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 16:09:33 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Tue, 10 Jul 2012 11:11:51 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] bitbake.conf: Add git-native to ASSUME_PROVIDED
Thread-Index: AQHNXqy2Cys5uAe9K0uKbTtL+17Lm5ci/+KAgAAD6YA=
Date: Tue, 10 Jul 2012 16:11:50 +0000
Message-ID: <CAEsOVNfmMP0kjyA==CaSwYb4SBpyaD+dBmi8CAL+Qy=Ya=HtSQ@mail.gmail.com>
References: <1341927124.24837.8.camel@ted>
	<CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
	<1341935849.1294.2.camel@ted>
In-Reply-To: <1341935849.1294.2.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 10 Jul 2012 16:23:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <012DE80C321BE641B2BFE158D456A580@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 10:57 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Every time we put an if statement in like this, it basically means we
> should double the amount of QA, one for one path and one for the other.
>
> So whilst I've wondered about it, do we really need to do something like
> this?

I don't think we need it, it just has the possibility of improving the
initial user experience. What's the QA difference in testing all the
various differences in git (or whatever) on the distros we intend to
support? In a way ASSUME_PROVIDED +=3D "git" more than doubled the QA ;)

-M=



