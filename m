Return-Path: <B41700@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe005.messaging.microsoft.com [65.55.88.15])
	by mail.openembedded.org (Postfix) with ESMTP id 2626B6B2CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 10:10:30 +0000 (UTC)
Received: from mail185-tx2-R.bigfish.com (10.9.14.253) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.22; Fri, 2 Aug 2013 10:10:30 +0000
Received: from mail185-tx2 (localhost [127.0.0.1])	by
	mail185-tx2-R.bigfish.com (Postfix) with ESMTP id 2F2822A011D;
	Fri,  2 Aug 2013 10:10:30 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz1432I4015Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzzz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail185-tx2 (localhost.localdomain [127.0.0.1]) by mail185-tx2
	(MessageSwitch) id 1375438228468012_32154;
	Fri,  2 Aug 2013 10:10:28 +0000 (UTC)
Received: from TX2EHSMHS021.bigfish.com (unknown [10.9.14.228])	by
	mail185-tx2.bigfish.com (Postfix) with ESMTP id 6E8021600B5;
	Fri,  2 Aug 2013 10:10:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS021.bigfish.com
	(10.9.99.121) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 2 Aug 2013 10:10:28 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.234]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.03.0136.001;
	Fri, 2 Aug 2013 10:10:27 +0000
From: Sardan Alexandru Cezar-B41700 <B41700@freescale.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Thread-Topic: [OE-core] Issue of Yocto multilib sdk
Thread-Index: AQHOigftN7u2YMLSlkGCqAetJTqJtpmBvORg
Date: Fri, 2 Aug 2013 10:10:27 +0000
Message-ID: <89483D19B008F748B6F04D85F328657A0EE1E1D1@039-SN1MPN1-002.039d.mgd.msft.net>
References: <CALaXJ9nQCTk==sDA2UySBBwRd_g_gqvO0F=_r7gK14gQE-rKwQ@mail.gmail.com>
	<loom.20130726T142233-407@post.gmane.org>
	<20130726135617.GA17824@lpalcu-linux>
In-Reply-To: <20130726135617.GA17824@lpalcu-linux>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.171.74.42]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issue of Yocto multilib sdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2013 10:10:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>=20
> There could be several issues here:
> 1. default library path for 64bit is wrong... You can inspect it by
> looking at SEARCH_DIR in the linker script. Just run:
>=20
> $CC -o mytest -Wl,-verbose mytest.c
>=20
> Then you can try to set the library path explicitly with -L. See if it
> works.
>=20
> 2. you don't have the 64bit libraries and it falls back to looking into
> /lib or /usr/lib which contain the 32bit libraries...
>=20
> Do you have any lib64/ usr/lib64/ in your target sysroot?
>=20

[Alex Sardan] Yes, it seems that the 64bit libraries are not being=20
installed in the sysroot.
What is the right way of adding them? I tried adding libgcc to=20
MULTILIB_IMAGE_INSTALL but it doesn't do the trick.

Thanks,
Alex


