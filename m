Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdvxZ-0002sE-LK
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 04:38:18 +0100
Received: from mail26-tx2-R.bigfish.com (10.9.14.253) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.23; Fri, 23 Dec 2011 03:15:47 +0000
Received: from mail26-tx2 (localhost [127.0.0.1])	by mail26-tx2-R.bigfish.com
	(Postfix) with ESMTP id CC8823000C5	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 03:16:50 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371I936eK542M1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9n61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail26-tx2 (localhost.localdomain [127.0.0.1]) by mail26-tx2
	(MessageSwitch) id 1324610210707188_25578;
	Fri, 23 Dec 2011 03:16:50 +0000 (UTC)
Received: from TX2EHSMHS032.bigfish.com (unknown [10.9.14.254])	by
	mail26-tx2.bigfish.com (Postfix) with ESMTP id A7BDA600042	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 03:16:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS032.bigfish.com
	(10.9.99.132) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 23 Dec 2011 03:15:47 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Thu, 22 Dec 2011 21:15:58 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc into the
	compatible host list
Thread-Index: AQHMv6i3W2Ig/m6mEkSq5CWDpb9K5ZXm6zGAgAEuTQCAAKShgA==
Date: Fri, 23 Dec 2011 03:15:58 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010BBDB0@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324289521-10140-1-git-send-email-b19537@freescale.com>
	<C27D8181-0988-4BF7-A858-BC873D7C47F8@dominion.thruhere.net>
	<CA452391058F6D4E9715FB2C29D9312A010B915F@039-SN2MPN1-023.039d.mgd.msft.net>
	<1324297600.4568.170.camel@ted>
	<CA452391058F6D4E9715FB2C29D9312A010B9EEF@039-SN2MPN1-023.039d.mgd.msft.net>
	<1324487225.18348.11.camel@ted>
	<CAFZPMobmLhrHoPo9devpvdgw_OSWXbR0_aiLc7bp5-ce+QG0yQ@mail.gmail.com>
In-Reply-To: <CAFZPMobmLhrHoPo9devpvdgw_OSWXbR0_aiLc7bp5-ce+QG0yQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH oe-core] valgrind: add powerpc into the compatible host list
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
X-List-Received-Date: Fri, 23 Dec 2011 03:38:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Can somebody confirm whether valgrind works for armv4/v5, please? =20


Best Regards,

Zhenhua


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-
> core-bounces@lists.openembedded.org] On Behalf Of Sergey Lapin
> Sent: Thursday, December 22, 2011 7:09 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH oe-core] valgrind: add powerpc into the com=
patible
> host list
>=20
> On Wed, Dec 21, 2011 at 9:07 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2011-12-21 at 06:21 +0000, Luo Zhenhua-B19537 wrote:
> >> Since nobody confirm that it works on mips, I will create a new patch =
to
> define COMPATIBLE_HOST as following, does it make sense?
> >> =A0 =A0 =A0 COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64|ppc|pp=
c64|arm).*-
> linux'
>=20
> Does it really work on armv4/v5?
>=20
> S.
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




