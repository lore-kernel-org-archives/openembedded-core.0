Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TJ6Uy-0007kz-M8
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 19:43:13 +0200
Received: from mail28-ch1-R.bigfish.com (10.43.68.235) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.23; Tue, 2 Oct 2012 17:30:13 +0000
Received: from mail28-ch1 (localhost [127.0.0.1])	by mail28-ch1-R.bigfish.com
	(Postfix) with ESMTP id 7868822010E;
	Tue,  2 Oct 2012 17:30:13 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz17326ah8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail28-ch1 (localhost.localdomain [127.0.0.1]) by mail28-ch1
	(MessageSwitch) id 1349199011899030_11436;
	Tue,  2 Oct 2012 17:30:11 +0000 (UTC)
Received: from CH1EHSMHS035.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail28-ch1.bigfish.com (Postfix) with ESMTP id
	D85A01A00A4;	Tue,  2 Oct 2012 17:30:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS035.bigfish.com
	(10.43.70.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 2 Oct 2012 17:30:10 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Tue, 2 Oct 2012 12:30:09 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] chrpath: We should provide
	chrpath-replacement-native and install into a native specific directory
Thread-Index: AQHNoLoc26FFDKiYnkKd2cURalLMr5emiJ0A//+89wA=
Date: Tue, 2 Oct 2012 17:30:08 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6CA65A@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1349183622.15753.149.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A6CA2B9@039-SN1MPN1-001.039d.mgd.msft.net>
	<1349195382.18301.8.camel@ted>
In-Reply-To: <1349195382.18301.8.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] chrpath: We should provide chrpath-replacement-native and install into a native specific directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 17:43:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7E6CEEC6ED6B394EA446D67D949F5489@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 2, 2012 at 11:29 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-10-02 at 16:22 +0000, McClintock Matthew-B29882 wrote:
>> Docs need to be updated, there was also a build warning if it was not
>> installed - did that get removed too?
>
> You still need chrpath installed, this just avoids a different set of
> problems in nativesdk and corrected ASSUME_PROVIDED.

You still need it installed on your host?

-M

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



