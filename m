Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RTTqj-0007Ug-1L
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 08:36:02 +0100
Received: from mail107-db3-R.bigfish.com (10.3.81.244) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.22; Thu, 24 Nov 2011 07:28:46 +0000
Received: from mail107-db3 (localhost [127.0.0.1])	by
	mail107-db3-R.bigfish.com (Postfix) with ESMTP id D245560414	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 07:28:56 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K179dN98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail107-db3 (localhost.localdomain [127.0.0.1]) by mail107-db3
	(MessageSwitch) id 1322119736779108_20800;
	Thu, 24 Nov 2011 07:28:56 +0000 (UTC)
Received: from DB3EHSMHS010.bigfish.com (unknown [10.3.81.247])	by
	mail107-db3.bigfish.com (Postfix) with ESMTP id B9C8D80054	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 07:28:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS010.bigfish.com
	(10.3.87.110) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 24 Nov 2011 07:28:46 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Thu, 24 Nov 2011 01:29:26 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
Thread-Index: AQHMqloOvCtx6Pv4A0Kv3YkijylUD5W7xIkAgAAE6YCAAAA1gIAAOYoAgAACKgA=
Date: Thu, 24 Nov 2011 07:29:25 +0000
Message-ID: <CAEsOVNezsZu5dDEKZCiPd6ya8bmgyejMCmFvrgJ1br2JQQqs9w@mail.gmail.com>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
	<CAMKF1sqdUPP1=3wiAMTD+Jmf8mbJyDXq4GT7Ho06=mBee92pPw@mail.gmail.com>
	<CAEsOVNd+AuWWwHQAWmeyJ0jnNaVm2522pO_ykVdqzc1X9m96Tg@mail.gmail.com>
	<CAMKF1sov7U1oRZYDyBdWT3uYr1_P0+pAJxU7kLVsDfngJhG16Q@mail.gmail.com>
	<CAEsOVNe22kPLsNn0pmkuSycHwNfO6AFgJGxqMb=ex+VamAK9hw@mail.gmail.com>
	<CAEsOVNe-AvQ-DXUH-TMZFtmmAJ0oqSRveh+ovC-qvttrpguARg@mail.gmail.com>
	<CAMKF1sr8RdXbS3po2fz+e_Q9oKt133QmdJzs=+idSdeQ7MEWnQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr8RdXbS3po2fz+e_Q9oKt133QmdJzs=+idSdeQ7MEWnQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Nov 2011 07:36:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C47FF2C7199B7C4AB3547B06EC618752@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 1:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> hmmm I guess cross recipes are special they should not have been built
> under target recipes. Adding build arch to package name would be ok
> too but may be if they were built under directory of their own which
> was something like <build>-<host>-<target> then it would also solve
> the problem i think

I agree - this is the discussion I'm trying to start. ;)

-M=



