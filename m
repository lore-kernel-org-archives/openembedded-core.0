Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6S8-0000Jx-Kj
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:39:36 +0200
Received: from mail59-va3-R.bigfish.com (10.7.14.250) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:26:55 +0000
Received: from mail59-va3 (localhost [127.0.0.1])	by mail59-va3-R.bigfish.com
	(Postfix) with ESMTP id 5AA4F4C020A;
	Tue, 18 Sep 2012 22:26:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail59-va3 (localhost.localdomain [127.0.0.1]) by mail59-va3
	(MessageSwitch) id 1348007212915803_5822;
	Tue, 18 Sep 2012 22:26:52 +0000 (UTC)
Received: from VA3EHSMHS025.bigfish.com (unknown [10.7.14.254])	by
	mail59-va3.bigfish.com (Postfix) with ESMTP id D88984A01FA;
	Tue, 18 Sep 2012 22:26:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS025.bigfish.com
	(10.7.99.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:26:48 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 18 Sep 2012 17:26:48 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] tune-ppce6500.inc: add e6500 tune files
Thread-Index: AQHNleu/UUhQvgnfTEmg+rI4BJwN+5eQrXAA
Date: Tue, 18 Sep 2012 22:26:47 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68B69A@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<1348006091-14992-4-git-send-email-msm@freescale.com>
	<CAMKF1srn10MhO5HT5G4VVnPp_n2t67rkTqN=pEhPH0mcLyZjTg@mail.gmail.com>
In-Reply-To: <CAMKF1srn10MhO5HT5G4VVnPp_n2t67rkTqN=pEhPH0mcLyZjTg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-ppce6500.inc: add e6500 tune files
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
X-List-Received-Date: Tue, 18 Sep 2012 22:39:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EB92E8EA2E7D3F48B37649F672F0F611@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 5:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Sep 18, 2012 at 3:08 PM, Matthew McClintock <msm@freescale.com> w=
rote:
>> Also supports a new altivec TUNE_FEATURE
>
> is altivec feature specific to e6500 ? I thought there should be more
> tunes using it

Nothing else AFAIK... other layers could be doing interesting things
here. 86xx parts were the last to have Altivec and those don't build
within Yocto.. they can use this TUNE_FEATURE :)

-M=



