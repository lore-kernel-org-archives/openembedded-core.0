Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE007.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9g6q-000607-Sn
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:38:49 +0200
Received: from mail71-tx2-R.bigfish.com (10.9.14.254) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 16:33:19 +0000
Received: from mail71-tx2 (localhost.localdomain [127.0.0.1])	by
	mail71-tx2-R.bigfish.com (Postfix) with ESMTP id A381D12E83A9	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 16:33:18 +0000 (UTC)
X-SpamScore: -22
X-BigFish: VS-22(zz9371K1b0bMdf9M1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail71-tx2 (localhost.localdomain [127.0.0.1]) by mail71-tx2
	(MessageSwitch) id 1317400341697832_22559;
	Fri, 30 Sep 2011 16:32:21 +0000 (UTC)
Received: from TX2EHSMHS007.bigfish.com (unknown [10.9.14.249])	by
	mail71-tx2.bigfish.com (Postfix) with ESMTP id 987161A801EE	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 16:30:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS007.bigfish.com
	(10.9.99.107) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 16:30:40 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Fri, 30 Sep 2011 11:30:40 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Add bash as RDEPENDS for gstreamer
Thread-Index: AQHMf4hfqtTcGzFVY0+/7FDdYAqquJVmcTqA
Date: Fri, 30 Sep 2011 16:30:39 +0000
Message-ID: <CAEsOVNcEkg_=xSWg2Z-k+NM7F21NqT_j2gLnjkQys1_RZU-jmg@mail.gmail.com>
References: <1317347777-10288-1-git-send-email-msm@freescale.com>
	<1317374475.12332.134.camel@ted>
	<CAEsOVNdKPk833GDMYrjGgjOMhmOxGWPzevEWUy3CzUsa2LCHSw@mail.gmail.com>
In-Reply-To: <CAEsOVNdKPk833GDMYrjGgjOMhmOxGWPzevEWUy3CzUsa2LCHSw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] Add bash as RDEPENDS for gstreamer
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
X-List-Received-Date: Fri, 30 Sep 2011 16:38:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CFD341C37DF9C6408AD5AB18B89444BC@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 10:47 AM, Matthew McClintock <msm@freescale.com> wr=
ote:
> On Fri, Sep 30, 2011 at 4:20 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> What image target are you building? I'm having trouble visualising an
>> image that doesn't include bash or busybox and if either of these are
>> present, that dependency should be met...
>>
>> If this is a toolchain/SDK, there were some recent tweaks which address
>> this problem.
>
> It was meta-toolchain-sdk, please drop this patch if that is the case.

FYI, I've been testing this on the 'edison' branch. Seems like this
should be addressed - assuming someone else can reproduce this
issue...

Any comments?

-M=



