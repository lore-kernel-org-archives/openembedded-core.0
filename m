Return-Path: <B19537@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe003.messaging.microsoft.com [207.46.163.26])
	by mail.openembedded.org (Postfix) with ESMTP id 54C2660EB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 08:52:18 +0000 (UTC)
Received: from mail156-co9-R.bigfish.com (10.236.132.252) by
	CO9EHSOBE011.bigfish.com (10.236.130.74) with Microsoft SMTP Server id
	14.1.225.22; Thu, 17 Oct 2013 08:52:19 +0000
Received: from mail156-co9 (localhost [127.0.0.1])	by
	mail156-co9-R.bigfish.com (Postfix) with ESMTP id 6CEF1320173;
	Thu, 17 Oct 2013 08:52:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(zzbb2dI98dI9371I936eI542I1432Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275dh1de097h186068h8275bhz2dh2a8h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h2184h21a6hbe9i1155h)
Received: from mail156-co9 (localhost.localdomain [127.0.0.1]) by mail156-co9
	(MessageSwitch) id 1381999938323314_3430;
	Thu, 17 Oct 2013 08:52:18 +0000 (UTC)
Received: from CO9EHSMHS001.bigfish.com (unknown [10.236.132.241])	by
	mail156-co9.bigfish.com (Postfix) with ESMTP id 3F55140033A;
	Thu, 17 Oct 2013 08:52:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS001.bigfish.com
	(10.236.130.11) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 17 Oct 2013 08:52:18 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.21]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.03.0158.002; Thu, 17 Oct 2013 08:52:16 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Rongqing Li <rongqing.li@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] populate_sdk_base: repeat to tar archive
	file five time
Thread-Index: AQHOyjheh8EdnOFrVEecqj40GI+DB5n23xoAgABebgCAAOeygIAAclCw
Date: Thu, 17 Oct 2013 08:52:16 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0177C4B0@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
	<CAP9ODKpm_zpo+TyFDe0TSAXHs=MvFjouPjRNE0GcE9i6Lk_7Aw@mail.gmail.com>
	<525E3378.3070604@windriver.com> <1381925550.29912.463.camel@ted>
	<525F450B.4030908@windriver.com>
In-Reply-To: <525F450B.4030908@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.81]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: repeat to tar archive file five time
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
X-List-Received-Date: Thu, 17 Oct 2013 08:52:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It is worth to give a try to add PSEUDO_UNLOAD=3D1 sync before tar. The iss=
ue doesn't appear on my CentOS 5.9 after doing that.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Rongqing Li
> Sent: Thursday, October 17, 2013 10:02 AM
> To: Richard Purdie
> Cc: Otavio Salvador; Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] populate_sdk_base: repeat to tar archive
> file five time
>=20
>=20
>=20
> On 10/16/2013 08:12 PM, Richard Purdie wrote:
> > On Wed, 2013-10-16 at 14:34 +0800, Rongqing Li wrote:
> >>
> >> On 10/16/2013 02:24 PM, Otavio Salvador wrote:
> >>> On Wed, Oct 16, 2013 at 2:53 AM,  <rongqing.li@windriver.com> wrote:
> >>>> From: Roy Li <rongqing.li@windriver.com>
> >>>>
> >>>> [YOCTO #5287]
> >>>>
> >>>> tar failed and reported that file changed as we read it, now we
> >>>> workaround it
> >>>>
> >>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >>>
> >>> You must be kidding right?! loop 5 times?!? why not fix the root
> >>> cause of the change?
> >>>
> >>
> >> Sorry, I do not know the root cause, and I see many people spent lots
> >> of efforts to investigate, but do not find the root cause, sometime
> >> we suspect it is the building servers kernel issue, if it is true, we
> >> can not fix the building servers, we only workaround the code.
> >
> > This workaround is not going into master, its horrid. Do we know which
> > versions of the kernel on the server have the issue. I'd much rather
> > tell people to fix their broken filesystems for example and refuse to
> > run on them.
> >
>=20
> I saw it happened on CentOS 5.9 and RedHat 5.5, and We deployed lots of
> them, it is hard to replace them.
>=20
> The bug did not happen everytime, only intermittently, this workaround is
> ugly, but it is better than fixing the servers, or declaring them as
> unsupported server.
>=20
>=20
> -Roy
>=20
>=20
>=20
> > Cheers,
> >
> > Richard
> >
> >
> >
>=20
> --
> Best Reagrds,
> Roy | RongQing Li
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



