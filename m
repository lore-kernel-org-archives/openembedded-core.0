Return-Path: <B28495@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe005.messaging.microsoft.com [65.55.88.15])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA0A6AD93
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 02:01:37 +0000 (UTC)
Received: from mail215-tx2-R.bigfish.com (10.9.14.245) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.23; Thu, 4 Jul 2013 02:01:37 +0000
Received: from mail215-tx2 (localhost [127.0.0.1])	by
	mail215-tx2-R.bigfish.com (Postfix) with ESMTP id 7A28AAC0187;
	Thu,  4 Jul 2013 02:01:37 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I542I1432Izz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail215-tx2 (localhost.localdomain [127.0.0.1]) by mail215-tx2
	(MessageSwitch) id 1372903294452758_18336;
	Thu,  4 Jul 2013 02:01:34 +0000 (UTC)
Received: from TX2EHSMHS031.bigfish.com (unknown [10.9.14.241])	by
	mail215-tx2.bigfish.com (Postfix) with ESMTP id 6A4CDC8006F;
	Thu,  4 Jul 2013 02:01:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS031.bigfish.com
	(10.9.99.131) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 4 Jul 2013 02:01:33 +0000
Received: from 039-SN2MPN1-011.039d.mgd.msft.net ([169.254.1.25]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Thu, 4 Jul 2013 02:01:32 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH] qemu: use PACKAGECONFIG to address
	libaio/attr/libcap dependencies
Thread-Index: AQHOd9IEUYHJsvMokke6qm0sV/zVDplS9WmAgADPSSA=
Date: Thu, 4 Jul 2013 02:01:32 +0000
Message-ID: <AF604684617F454390621992F367F1690BA7E918@039-SN2MPN1-011.039d.mgd.msft.net>
References: <1372844710-15122-1-git-send-email-b28495@freescale.com>
	<3615537.9YYZDXbCb0@helios>
In-Reply-To: <3615537.9YYZDXbCb0@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.99]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: use PACKAGECONFIG to address libaio/attr/libcap dependencies
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
X-List-Received-Date: Thu, 04 Jul 2013 02:01:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Paul,

> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Wednesday, July 03, 2013 9:38 PM
> To: Liu Ting-B28495
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core][PATCH] qemu: use PACKAGECONFIG to
> address libaio/attr/libcap dependencies
>=20
> Hi Ting,
>=20
> On Wednesday 03 July 2013 17:45:10 b28495@freescale.com wrote:
> > From: Ting Liu <b28495@freescale.com>
> >
> > Move to using the PACKAGECONFIG mechanism to select configure options
> > and dependencies. Without this the system will attempt to discover
> > various dependencies, and sometimes does so incorrectly.
> >
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> > b/meta/recipes-devtools/qemu/qemu.inc index 7caef6e..8be3890 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -84,6 +84,8 @@ do_install_append() {  # END of qemu-mips workaround
> >
> >  PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[virtfs] =3D "--enable-virtfs
> > --enable-attr,--disable-virtfs,libcap attr,"
> > +PACKAGECONFIG[libaio] =3D
> > "--enable-linux-aio,--disable-linux-aio,libaio,"
>=20
> The latter should be "aio" and not "libaio" (since "aio" is the feature
> being enabled/disabled).

Good catch. Patch v2 sent out. Thanks.

-Ting

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre



