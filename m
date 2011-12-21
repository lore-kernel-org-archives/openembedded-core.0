Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdG8I-0004Pc-Mi
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 07:58:34 +0100
Received: from mail179-ch1-R.bigfish.com (10.43.68.252) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Dec 2011 06:21:06 +0000
Received: from mail179-ch1 (localhost [127.0.0.1])	by
	mail179-ch1-R.bigfish.com (Postfix) with ESMTP id 1C1F0260086	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 06:21:37 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371I936eK542M1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h944hbe9n)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail179-ch1 (localhost.localdomain [127.0.0.1]) by mail179-ch1
	(MessageSwitch) id 132444849528858_17924;
	Wed, 21 Dec 2011 06:21:35 +0000 (UTC)
Received: from CH1EHSMHS006.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail179-ch1.bigfish.com (Postfix) with ESMTP id
	0236B180046	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 06:21:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS006.bigfish.com
	(10.43.70.6) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Dec 2011 06:21:04 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Wed, 21 Dec 2011 00:21:04 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc into the
	compatible host list
Thread-Index: AQHMv6i3W2Ig/m6mEkSq5CWDpb9K5Q==
Date: Wed, 21 Dec 2011 06:21:04 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010B9EEF@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324289521-10140-1-git-send-email-b19537@freescale.com>
	<C27D8181-0988-4BF7-A858-BC873D7C47F8@dominion.thruhere.net>
	<CA452391058F6D4E9715FB2C29D9312A010B915F@039-SN2MPN1-023.039d.mgd.msft.net>
	<1324297600.4568.170.camel@ted>
In-Reply-To: <1324297600.4568.170.camel@ted>
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
X-List-Received-Date: Wed, 21 Dec 2011 06:58:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Since nobody confirm that it works on mips, I will create a new patch to de=
fine COMPATIBLE_HOST as following, does it make sense?
	COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64|ppc|ppc64|arm).*-linux=
'


Best Regards,

Zhenhua


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-
> core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
> Sent: Monday, December 19, 2011 8:27 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH oe-core] valgrind: add powerpc into the com=
patible
> host list
>=20
> On Mon, 2011-12-19 at 10:32 +0000, Luo Zhenhua-B19537 wrote:
> > Sure, if valgrind can work on x86, powerpc, arm, COMPATIBLE_HOST can be
> removed, I will post a v2 patch.
>=20
> Can someone confirm it works on mips too please?
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




