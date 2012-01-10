Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RkVGu-0005TA-Vp
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:33:25 +0100
Received: from mail62-db3-R.bigfish.com (10.3.81.250) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jan 2012 06:25:54 +0000
Received: from mail62-db3 (localhost [127.0.0.1])	by mail62-db3-R.bigfish.com
	(Postfix) with ESMTP id DD5DD480180;
	Tue, 10 Jan 2012 06:25:54 +0000 (UTC)
X-SpamScore: -11
X-BigFish: VS-11(zz9371I168aJ542M1432Nzz1202hzzz2dhc1ahc1bh2a8h668h839h8e2h8e3h944hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail62-db3 (localhost.localdomain [127.0.0.1]) by mail62-db3
	(MessageSwitch) id 1326176754831096_22526;
	Tue, 10 Jan 2012 06:25:54 +0000 (UTC)
Received: from DB3EHSMHS001.bigfish.com (unknown [10.3.81.242])	by
	mail62-db3.bigfish.com (Postfix) with ESMTP id C70A8680045;
	Tue, 10 Jan 2012 06:25:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS001.bigfish.com
	(10.3.87.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jan 2012 06:25:54 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Tue, 10 Jan 2012 00:25:53 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core v6] linux-dtb: add multi-dtb build
	support and keep dtb in deploy cache package
Thread-Index: AQHMzn9tDrr0qwwVYki24aA62itX3pYFfRCA//+mzlA=
Date: Tue, 10 Jan 2012 06:25:52 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010CB0EA@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1326080274-1998-1-git-send-email-b19537@freescale.com>
	<4F0BCFEF.7000207@linux.intel.com>
In-Reply-To: <4F0BCFEF.7000207@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH oe-core v6] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Tue, 10 Jan 2012 06:33:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, January 10, 2012 1:43 PM
> > @@ -13,15 +13,21 @@ python __anonymous () {
> >   	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
> >   }
> >
> I am not sure how this worked, I am seeing a problem with building rootfs=
.
> |
>=20
> kernel-devicetree is needed by
> kernel-modules-
> 3.0.14+git1+6ae3d992cf546184010e87a0349810198f1d167c_1+58ffdb8000e34d2ba7=
c3ef278
> b26680b0886e8b5-r2.mpc8315e_rdb
>=20
> This might be a PR Bump issue?
[Luo Zhenhua-B19537] I didn't meet such issue during my build, do we need t=
o add a PR in linux-dtb.inc to solve this issue?


Best Regards,

Zhenhua



