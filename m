Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE009.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RiTrK-0004SY-1P
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:38:38 +0100
Received: from mail74-tx2-R.bigfish.com (10.9.14.246) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.23; Wed, 4 Jan 2012 16:31:15 +0000
Received: from mail74-tx2 (localhost [127.0.0.1])	by mail74-tx2-R.bigfish.com
	(Postfix) with ESMTP id 8D0454E01D6	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 16:31:15 +0000 (UTC)
X-SpamScore: -1
X-BigFish: VS-1(zz9371I98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail74-tx2 (localhost.localdomain [127.0.0.1]) by mail74-tx2
	(MessageSwitch) id 1325694674464569_32035;
	Wed,  4 Jan 2012 16:31:14 +0000 (UTC)
Received: from TX2EHSMHS034.bigfish.com (unknown [10.9.14.236])	by
	mail74-tx2.bigfish.com (Postfix) with ESMTP id 6097322004A	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 16:31:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS034.bigfish.com
	(10.9.99.134) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 4 Jan 2012 16:31:13 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Wed, 4 Jan 2012 10:31:13 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] sstate compression
Thread-Index: AQHMyv5Fqkh967iiIk6cPo9OF6fMgw==
Date: Wed, 4 Jan 2012 16:31:12 +0000
Message-ID: <CAEsOVNcsY-dNYBz1Y6BVAQ-N7hVyaxOMcsniev9z455m9GYh5A@mail.gmail.com>
References: <1325689535.28005.59.camel@phil-desktop>
	<1325691189.20759.14.camel@ted>
In-Reply-To: <1325691189.20759.14.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: sstate compression
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
X-List-Received-Date: Wed, 04 Jan 2012 16:38:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EE815DF81D0784469C36AB3A0BD6690E@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2012 at 9:33 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> There has already been a patch allowing different compression mechanisms
> from Matthew posted on this mailing list. Its not been merged yet as I'd
> really prefer one format and we didn't (and still don't) have good
> statistics about what the tradeoffs are.

I think there will always be size/speed tradeoffs and we should keep
multiple types available.

-M=



