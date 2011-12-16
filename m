Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbTHq-0006Kg-Sd
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 09:37:03 +0100
Received: from mail11-db3-R.bigfish.com (10.3.81.250) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 08:14:55 +0000
Received: from mail11-db3 (localhost [127.0.0.1])	by mail11-db3-R.bigfish.com
	(Postfix) with ESMTP id 725213605F9	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 08:15:03 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371I542M1432Nzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h944h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail11-db3 (localhost.localdomain [127.0.0.1]) by mail11-db3
	(MessageSwitch) id 1324023303396910_4988;
	Fri, 16 Dec 2011 08:15:03 +0000 (UTC)
Received: from DB3EHSMHS010.bigfish.com (unknown [10.3.81.248])	by
	mail11-db3.bigfish.com (Postfix) with ESMTP id 5C057400042	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 08:15:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS010.bigfish.com
	(10.3.87.110) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 08:14:54 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.68]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Fri, 16 Dec 2011 02:14:53 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] after modifying source code in work/, how to rebuild
	package?
Thread-Index: AQHMu8po2jDAegODPkOdRryE3MnfgpXegjEA//+bmKA=
Date: Fri, 16 Dec 2011 08:14:53 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A02CDF4@039-SN2MPN1-022.039d.mgd.msft.net>
References: <CAMvUbCzceL3owJH51JnUYYC90ExEHkbEOcd4887sjWAKEV83=A@mail.gmail.com>
	<4EEAFD28.1060609@bluegiga.com> <4EEAFDAA.7000100@bluegiga.com>
In-Reply-To: <4EEAFDAA.7000100@bluegiga.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: after modifying source code in work/, how to rebuild package?
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
X-List-Received-Date: Fri, 16 Dec 2011 08:37:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-
> core-bounces@lists.openembedded.org] On Behalf Of Lauri Hintsala
> Sent: Friday, December 16, 2011 4:14 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] after modifying source code in work/, how to rebui=
ld
> package?
>=20
> Sorry, this workflow will clean all your changes. How about that:
>=20
> bitbake projectname -c compile -f
> bitbake projectname
[Luo Zhenhua-B19537] Those commands should work.=20


Best Regards,

Zhenhua




