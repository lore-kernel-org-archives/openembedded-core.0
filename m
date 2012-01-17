Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RnHIV-0003II-CE
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 23:14:31 +0100
Received: from mail4-db3-R.bigfish.com (10.3.81.249) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.23; Tue, 17 Jan 2012 20:41:12 +0000
Received: from mail4-db3 (localhost [127.0.0.1])	by mail4-db3-R.bigfish.com
	(Postfix) with ESMTP id 1F9FC500172	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 20:41:14 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275chz2dhc1ahc1bh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail4-db3 (localhost.localdomain [127.0.0.1]) by mail4-db3
	(MessageSwitch) id 132683287447545_7734; Tue, 17 Jan 2012 20:41:14 +0000
	(UTC)
Received: from DB3EHSMHS008.bigfish.com (unknown [10.3.81.245])	by
	mail4-db3.bigfish.com (Postfix) with ESMTP id 03D2868004B	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 20:41:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS008.bigfish.com
	(10.3.87.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 17 Jan 2012 20:41:12 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Tue, 17 Jan 2012 14:41:16 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] How to avoid spurious RPM dependencies?
Thread-Index: AQHM1VhbLcD2xovkgkOD+BFdhgIPhw==
Date: Tue, 17 Jan 2012 20:41:15 +0000
Message-ID: <CAEsOVNdLtXQqqvce+yxxSno212jebVOfUaPZCvm14nRH8d+jfQ@mail.gmail.com>
References: <0AB83639-9F7B-450B-9F50-5D1951F2F5C2@dominion.thruhere.net>
In-Reply-To: <0AB83639-9F7B-450B-9F50-5D1951F2F5C2@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: How to avoid spurious RPM dependencies?
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
X-List-Received-Date: Tue, 17 Jan 2012 22:14:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FC0DE96D7764574B8D5EAB69504F1E0B@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 2:14 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Hi,
>
> I'm running into a problem with vim that seems to be caused by overeager =
rpmdeps:
>
> | error: Failed dependencies:
> | =A0 =A0 =A0 /bin/csh is needed by vim-7.2.446-r10.3.armv7a
> | =A0 =A0 =A0 /usr/local/bin/python is needed by python-imaging-1.1.7-r0.=
armv7a
>
> For vim I thing it's being caused by this:
>
> ./usr/share/vim/vim72/tools/vim132:1:#!/bin/csh
>
> What's the best way to stop rpm from wanting csh? Python-imaging is actua=
lly broken:
>
> ./usr/bin/pilfile.py:1:#! /usr/local/bin/python
> ./usr/bin/pilprint.py:1:#! /usr/local/bin/python
> ./usr/bin/pilconvert.py:1:#! /usr/local/bin/python
>
> Is #!/usr/bin/env python still the preferred shebang?

One option is to break out the scripts to separate packages, then only
those separate packages will bring in the unwanted deps... e.g.
vim-extras

-M=



