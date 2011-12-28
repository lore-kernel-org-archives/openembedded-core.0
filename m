Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RfqRB-0005VL-G5
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 11:08:45 +0100
Received: from mail16-tx2-R.bigfish.com (10.9.14.250) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Wed, 28 Dec 2011 10:00:57 +0000
Received: from mail16-tx2 (localhost [127.0.0.1])	by mail16-tx2-R.bigfish.com
	(Postfix) with ESMTP id 04FE24401BB;
	Wed, 28 Dec 2011 10:01:00 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(zz9371I542M1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hbe9n62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail16-tx2 (localhost.localdomain [127.0.0.1]) by mail16-tx2
	(MessageSwitch) id 1325066459908696_4623;
	Wed, 28 Dec 2011 10:00:59 +0000 (UTC)
Received: from TX2EHSMHS045.bigfish.com (unknown [10.9.14.235])	by
	mail16-tx2.bigfish.com (Postfix) with ESMTP id D71BD4C0043;
	Wed, 28 Dec 2011 10:00:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS045.bigfish.com
	(10.9.99.145) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 28 Dec 2011 10:01:14 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Wed, 28 Dec 2011 04:01:13 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc to the
	compatible host and add eglibc-dbg in rdepends
Thread-Index: AQHMxS0fRftJ7JTB3UGUwYEWT6pqiJXxXI6A//+nkuA=
Date: Wed, 28 Dec 2011 10:01:13 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010BD589@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
In-Reply-To: <8285067.9cfZeAKmYZ@helios>
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
X-List-Received-Date: Wed, 28 Dec 2011 10:08:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Paul,

May I know what's the concern with eglibc instead of uclibc?


Best Regards,

Zhenhua


> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Wednesday, December 28, 2011 5:15 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Luo Zhenhua-B19537
> Subject: Re: [OE-core] [PATCH oe-core] valgrind: add powerpc to the compa=
tible
> host and add eglibc-dbg in rdepends
>=20
> On Wednesday 28 December 2011 14:55:08 b19537@freescale.com wrote:
> > +RDEPENDS +=3D "eglibc-dbg"
>=20
> So I might be completely off-base here having never tried it, but what if=
 you're
> using uclibc?
>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre




