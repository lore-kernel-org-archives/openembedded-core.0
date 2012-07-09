Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SoKgu-0002U7-3U
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 22:36:20 +0200
Received: from mail198-co1-R.bigfish.com (10.243.78.228) by
	CO1EHSOBE005.bigfish.com (10.243.66.68) with Microsoft SMTP Server id
	14.1.225.23; Mon, 9 Jul 2012 20:07:45 +0000
Received: from mail198-co1 (localhost [127.0.0.1])	by
	mail198-co1-R.bigfish.com (Postfix) with ESMTP id DFAD0D8028E;
	Mon,  9 Jul 2012 20:07:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz98dI9371Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail198-co1 (localhost.localdomain [127.0.0.1]) by mail198-co1
	(MessageSwitch) id 1341864463323794_22409;
	Mon,  9 Jul 2012 20:07:43 +0000 (UTC)
Received: from CO1EHSMHS031.bigfish.com (unknown [10.243.78.229])	by
	mail198-co1.bigfish.com (Postfix) with ESMTP id 43A95240044;
	Mon,  9 Jul 2012 20:07:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS031.bigfish.com
	(10.243.66.41) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 9 Jul 2012 20:07:43 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Mon, 9 Jul 2012 15:09:59 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libgomp: add libgomp (openmp) library, and
	build for powerpc targets by default
Thread-Index: AQHNXU8a5W1i8WJ3y0K+9ThoYsHus5cgN+iAgAF+0oA=
Date: Mon, 9 Jul 2012 20:09:58 +0000
Message-ID: <CAEsOVNe1zoUsMawDX4LOLWu9=gx3NBeyaCHnK0S9eBM9Xj=s+A@mail.gmail.com>
References: <1341549155-30728-1-git-send-email-msm@freescale.com>
	<4FF9F8F4.6050408@linux.intel.com> <4FF9F95F.8010300@linux.intel.com>
In-Reply-To: <4FF9F95F.8010300@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Mon, 09 Jul 2012 20:36:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6D45395CD625F44B97FA4523BC9EF708@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 8, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
>   /usr/share/info/dir

I don't see this dir on my build... perhaps it's the specific version
of gcc? or it's some munged text output?

If you still see if can you add it to the patch? v2 coming shortly.

-M=



