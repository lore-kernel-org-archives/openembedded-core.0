Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T1QBz-0006LC-M6
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 01:06:31 +0200
Received: from mail203-va3-R.bigfish.com (10.7.14.235) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Tue, 14 Aug 2012 22:39:30 +0000
Received: from mail203-va3 (localhost [127.0.0.1])	by
	mail203-va3-R.bigfish.com (Postfix) with ESMTP id 0E2A27C007F	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 22:39:30 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzzz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail203-va3 (localhost.localdomain [127.0.0.1]) by mail203-va3
	(MessageSwitch) id 1344983968289927_2857;
	Tue, 14 Aug 2012 22:39:28 +0000 (UTC)
Received: from VA3EHSMHS015.bigfish.com (unknown [10.7.14.252])	by
	mail203-va3.bigfish.com (Postfix) with ESMTP id 3B5F1680045	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 22:39:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS015.bigfish.com
	(10.7.99.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 14 Aug 2012 22:39:27 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Tue, 14 Aug 2012 17:39:25 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: perf on older kernels
Thread-Index: AQHNem2nfB7df3ESVEOse2py7bZ/Lg==
Date: Tue, 14 Aug 2012 22:39:24 +0000
Message-ID: <CAEsOVNcP1hf8OqHqDYmt1QJTQ2S557-HjHOa5ihNxVt-veaqOg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: perf on older kernels
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
X-List-Received-Date: Tue, 14 Aug 2012 23:06:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3E381CBAA0A3724DA52D75A0A43C0620@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

I've had to fix / hack the perf_3.4.bb recipe to get it building on my
older kernel. Should we add perf_3.0.bb recipes in oe-core or my own
layer? Or try to keep one recipe working for all versions? I have no
strong opinions.

-M=



