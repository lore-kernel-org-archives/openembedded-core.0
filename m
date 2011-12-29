Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rg5hO-0003Rl-Lk
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 03:26:31 +0100
Received: from mail35-tx2-R.bigfish.com (10.9.14.238) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Thu, 29 Dec 2011 02:18:45 +0000
Received: from mail35-tx2 (localhost [127.0.0.1])	by mail35-tx2-R.bigfish.com
	(Postfix) with ESMTP id E0A055C00ED	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 02:18:51 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371I936eK542M1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hbe9k62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail35-tx2 (localhost.localdomain [127.0.0.1]) by mail35-tx2
	(MessageSwitch) id 1325125131642832_9339;
	Thu, 29 Dec 2011 02:18:51 +0000 (UTC)
Received: from TX2EHSMHS046.bigfish.com (unknown [10.9.14.252])	by
	mail35-tx2.bigfish.com (Postfix) with ESMTP id 967A83C0045	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 02:18:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS046.bigfish.com
	(10.9.99.146) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 29 Dec 2011 02:18:44 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Wed, 28 Dec 2011 20:19:06 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc to the
	compatible host and add eglibc-dbg in rdepends
Thread-Index: AQHMxS0fRftJ7JTB3UGUwYEWT6pqiJXxXI6AgAC57QD///6vEA==
Date: Thu, 29 Dec 2011 02:19:05 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010BD995@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<1325103622.3089.8.camel@lenovo.internal.reciva.com>
In-Reply-To: <1325103622.3089.8.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Garg Vakul-B16394 <B16394@freescale.com>
Subject: Re: [PATCH oe-core] valgrind: add powerpc to the compatible host and add eglibc-dbg in rdepends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 29 Dec 2011 02:26:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-
> core-bounces@lists.openembedded.org] On Behalf Of Phil Blundell
> Sent: Thursday, December 29, 2011 4:20 AM
>=20
> On Wed, 2011-12-28 at 09:14 +0000, Paul Eggleton wrote:
> > On Wednesday 28 December 2011 14:55:08 b19537@freescale.com wrote:
> > > +RDEPENDS +=3D "eglibc-dbg"
> >
> > So I might be completely off-base here having never tried it, but what
> > if you're using uclibc?
>=20
> I don't really understand why valgrind is doing that at all. =20
[Luo Zhenhua-B19537] The reason is that valgrind requires non-stripped libr=
aries of glibc during running.=20


Best Regards,

Zhenhua




