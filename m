Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TBiAQ-0004jN-5O
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 10:19:26 +0200
Received: from mail41-co1-R.bigfish.com (10.243.78.230) by
	CO1EHSOBE005.bigfish.com (10.243.66.68) with Microsoft SMTP Server id
	14.1.225.23; Wed, 12 Sep 2012 07:51:47 +0000
Received: from mail41-co1 (localhost [127.0.0.1])	by mail41-co1-R.bigfish.com
	(Postfix) with ESMTP id 73B2BA60163	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 07:51:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -6
X-BigFish: VS-6(zz9371I542M1432Izz1202h1d1ah1d2ahzzz2dh2a8h668h839h8e2h8e3h944hd25hf0ah107ah1220h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail41-co1 (localhost.localdomain [127.0.0.1]) by mail41-co1
	(MessageSwitch) id 1347436305517287_12562;
	Wed, 12 Sep 2012 07:51:45 +0000 (UTC)
Received: from CO1EHSMHS029.bigfish.com (unknown [10.243.78.242])	by
	mail41-co1.bigfish.com (Postfix) with ESMTP id 7B663240046	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 07:51:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS029.bigfish.com
	(10.243.66.39) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 12 Sep 2012 07:50:24 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.149]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Wed, 12 Sep 2012 02:50:24 -0500
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, St John Robert-RAT173
	<RAT173@freescale.com>
Thread-Topic: [OE-core] [oe-core] valgrind: fix debug info reading error
	when do memcheck on ppc targets
Thread-Index: AQHNkJaBUHkRambiZ0W6sPR/buMpEJeGaaEA///kOOA=
Date: Wed, 12 Sep 2012 07:50:23 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A012B7381@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1347421458-2044-1-git-send-email-b19537@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A671B9E@039-SN1MPN1-001.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A671B9E@039-SN1MPN1-001.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: valgrind: fix debug info reading error when do memcheck on ppc targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 08:19:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: McClintock Matthew-B29882
> Sent: Wednesday, September 12, 2012 12:03 PM
>=20
> >
> > diff --git
> > a/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-err
> > or-of-reading-debug-info.patch
> > b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-err
> > or-of-reading-debug-info.patch
>=20
> Patch needs Upstream-Status:
[Luo Zhenhua-B19537] should the status be Pending if the patch has not been=
 sent to upstream?=20

> > +SRC_URI_append_powerpc =3D " file://valgrind-3.7.0-fix-error-of-readin=
g-
> debug-info.patch"
> > +SRC_URI_append_powerpc64 =3D "file://valgrind-3.7.0-fix-error-of-
> reading-debug-info.patch"
[Luo Zhenhua-B19537] I think it is better to keep it for PPC before the iss=
ue is reported on targets of other arch.=20


Best Regards,

Zhenhua



