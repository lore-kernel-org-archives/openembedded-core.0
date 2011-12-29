Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rg5iK-0003Ui-AS
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 03:27:28 +0100
Received: from mail78-tx2-R.bigfish.com (10.9.14.237) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Thu, 29 Dec 2011 02:19:52 +0000
Received: from mail78-tx2 (localhost [127.0.0.1])	by mail78-tx2-R.bigfish.com
	(Postfix) with ESMTP id 16F78C01FF	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 02:20:25 +0000 (UTC)
X-SpamScore: -17
X-BigFish: VS-17(zz9371I1447M542M1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h944hbe9k61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail78-tx2 (localhost.localdomain [127.0.0.1]) by mail78-tx2
	(MessageSwitch) id 1325125224897059_2592;
	Thu, 29 Dec 2011 02:20:24 +0000 (UTC)
Received: from TX2EHSMHS042.bigfish.com (unknown [10.9.14.238])	by
	mail78-tx2.bigfish.com (Postfix) with ESMTP id D3FD040042	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 02:20:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS042.bigfish.com
	(10.9.99.142) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 29 Dec 2011 02:20:16 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Wed, 28 Dec 2011 20:20:13 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc to the
	compatible host and add eglibc-dbg in rdepends
Thread-Index: AQHMxS0fRftJ7JTB3UGUwYEWT6pqiJXxXI6A//+nkuCAAGo+AIAAA8mAgAAcxgCAAHOJgIAAE7lw
Date: Thu, 29 Dec 2011 02:20:12 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010BD9A2@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<CA452391058F6D4E9715FB2C29D9312A010BD589@039-SN2MPN1-023.039d.mgd.msft.net>
	<2295923.3R0Nmqr59V@helios>
	<80E8B5C9-63CE-4BFA-8C5F-39ABA85736C7@dominion.thruhere.net>
	<20111228121512.GB3995@jama.jama.net>
	<CAEsOVNc2qwW-Tz4MCmnpAA99qWirtu=SWwBUqLdMRHbsj2MLow@mail.gmail.com>
In-Reply-To: <CAEsOVNc2qwW-Tz4MCmnpAA99qWirtu=SWwBUqLdMRHbsj2MLow@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Dec 2011 02:27:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the good suggestions, a new version will be submitted.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: McClintock Matthew-B29882
> Sent: Thursday, December 29, 2011 3:39 AM
> To: Patches and discussions about the oe-core layer
> Cc: McClintock Matthew-B29882; Garg Vakul-B16394; Luo Zhenhua-B19537
> Subject: Re: [OE-core] [PATCH oe-core] valgrind: add powerpc to the compa=
tible
> host and add eglibc-dbg in rdepends
>=20
> On Wed, Dec 28, 2011 at 6:15 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >> > If a dependency on the libc debug packages is really needed you
> >> > could do something this instead:
> >> >
> >> > RRECOMMENDS_${PN} +=3D "${TCLIBC}-dbg"
>=20
> This seems better since it include uclibc if that was selected...
>=20
> >>
> >> Or:
> >>
> >> RECOMMENDS_libc-glibc =3D "glibc-dbg"
> >
> > with extra R and PN, right?
> > RRECOMMENDS_${PN}_libc-glibc =3D "glibc-dbg"
>=20
> This is only provided by eglibc now, so it leaves out uclibc... I think..=
.
>=20
>=20
> -M



