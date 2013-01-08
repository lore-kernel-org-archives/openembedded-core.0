Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TsgHF-0002S4-He
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 22:00:13 +0100
Received: from mail225-tx2-R.bigfish.com (10.9.14.236) by
	TX2EHSOBE013.bigfish.com (10.9.40.33) with Microsoft SMTP Server id
	14.1.225.23; Tue, 8 Jan 2013 20:44:53 +0000
Received: from mail225-tx2 (localhost [127.0.0.1])	by
	mail225-tx2-R.bigfish.com (Postfix) with ESMTP id 956EFA0019E;
	Tue,  8 Jan 2013 20:44:53 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -7
X-BigFish: VS-7(zz98dI9371I1432I1470Mzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758hbe9i1155h)
Received: from mail225-tx2 (localhost.localdomain [127.0.0.1]) by mail225-tx2
	(MessageSwitch) id 1357677891926600_18991;
	Tue,  8 Jan 2013 20:44:51 +0000 (UTC)
Received: from TX2EHSMHS041.bigfish.com (unknown [10.9.14.236])	by
	mail225-tx2.bigfish.com (Postfix) with ESMTP id D919590005A;
	Tue,  8 Jan 2013 20:44:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS041.bigfish.com
	(10.9.99.141) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 8 Jan 2013 20:44:51 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.21]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0318.003; Tue, 8 Jan 2013 20:44:51 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Donn Seeley <donn.seeley@windriver.com>
Thread-Topic: [OE-core] anyone interested in CentOS 5 fixes for dpkg-native?
Thread-Index: AQHN7eEBrzL0soWRnkW5Uhi9rw/T/Q==
Date: Tue, 8 Jan 2013 20:44:50 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A81A7F6@039-SN1MPN1-002.039d.mgd.msft.net>
References: <201301081756.r08Huv1l013540@ibapah.eng.bsdi.com>
In-Reply-To: <201301081756.r08Huv1l013540@ibapah.eng.bsdi.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: anyone interested in CentOS 5 fixes for dpkg-native?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 21:00:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8662465910B1DE48A5636C277A0BEEF4@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 8, 2013 at 11:56 AM, Donn Seeley <donn.seeley@windriver.com> wr=
ote:
> We recently tried to build using 'PACKAGE_CLASSES =3D package_deb' and
> found that our ancient CentOS 5 build VMs couldn't compile and link
> dpkg-native.  (We support CentOS 5 for very conservative customers, so
> we run test builds with it regularly.)
>
> Given that package_deb isn't used frequently and that CentOS 5 is so
> old, I thought that I would ask first before submitting fixes for that
> configuration.  Do we want the patches in oe-core?

I vote yes, additionally these patches don't look too complex or intrusive.

-M=



