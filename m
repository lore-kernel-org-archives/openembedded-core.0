Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=DB3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RAqKS-0002KM-3K
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 23:45:40 +0200
Received: from mail86-db3-R.bigfish.com (10.3.81.250) by
	DB3EHSOBE004.bigfish.com (10.3.84.24) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 21:40:06 +0000
Received: from mail86-db3 (localhost.localdomain [127.0.0.1])	by
	mail86-db3-R.bigfish.com (Postfix) with ESMTP id 908EC888289	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:40:06 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail86-db3 (localhost.localdomain [127.0.0.1]) by mail86-db3
	(MessageSwitch) id 1317678004526681_8132;
	Mon,  3 Oct 2011 21:40:04 +0000 (UTC)
Received: from DB3EHSMHS001.bigfish.com (unknown [10.3.81.251])	by
	mail86-db3.bigfish.com (Postfix) with ESMTP id 70B1D3D0050	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:40:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS001.bigfish.com
	(10.3.87.101) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 21:40:03 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Mon, 3 Oct 2011 16:40:01 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] populate_sdk_rpm: Add missing /bin/sh from
	rpm ignore list for the SDK
Thread-Index: AQHMghUBt20VJTwJiUKYcyDbxlZ5xQ==
Date: Mon, 3 Oct 2011 21:40:01 +0000
Message-ID: <CAEsOVNey=kYC7MyBm9oMS5-LffU1r4rB6MrT1ZXfCNBeefR87A@mail.gmail.com>
References: <1317420972.4454.1.camel@ted>
In-Reply-To: <1317420972.4454.1.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] populate_sdk_rpm: Add missing /bin/sh from rpm ignore list for the SDK
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
X-List-Received-Date: Mon, 03 Oct 2011 21:45:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CD2A7C8CDB14E346BE966EE83C64DF40@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 5:16 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The target SDK packages don't need to fulfil a shell dependency
> so add /bin/sh to the list of packages we don't need to resolve.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Matthew McClintock <msm@freescale.com>=



