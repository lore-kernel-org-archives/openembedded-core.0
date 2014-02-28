Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0239.outbound.protection.outlook.com [207.46.163.239])
	by mail.openembedded.org (Postfix) with ESMTP id BD42C6E74C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 12:52:01 +0000 (UTC)
Received: from BLUPR03MB407.namprd03.prod.outlook.com (10.141.78.24) by
	BLUPR03MB152.namprd03.prod.outlook.com (10.255.212.28) with Microsoft
	SMTP Server (TLS) id 15.0.888.9; Fri, 28 Feb 2014 12:52:01 +0000
Received: from BLUPR03MB357.namprd03.prod.outlook.com (10.141.75.151) by
	BLUPR03MB407.namprd03.prod.outlook.com (10.141.78.24) with Microsoft
	SMTP Server (TLS) id 15.0.888.9; Fri, 28 Feb 2014 12:52:01 +0000
Received: from BLUPR03MB357.namprd03.prod.outlook.com ([10.141.75.151]) by
	BLUPR03MB357.namprd03.prod.outlook.com ([10.141.75.151]) with mapi id
	15.00.0883.010; Fri, 28 Feb 2014 12:52:01 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: =?iso-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gcc: Enable SPE & AltiVec generation on
	powepc*linux target.
Thread-Index: AQHPM7Xu03MRgoF/TE2+TGM9K5LfS5rKnu4AgAAAUPA=
Date: Fri, 28 Feb 2014 12:51:59 +0000
Message-ID: <a0b7cec95c7e4882a394f74361902757@BLUPR03MB357.namprd03.prod.outlook.com>
References: <1393503455-17642-1-git-send-email-alexandru.sardan@freescale.com>
	<53108546.1090508@enea.com>
In-Reply-To: <53108546.1090508@enea.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(189002)(199002)(377424004)(377454003)(13464003)(51704005)(56816005)(19580405001)(74366001)(2656002)(63696002)(87936001)(66066001)(59766001)(56776001)(83072002)(85306002)(90146001)(80022001)(87266001)(95666003)(15975445006)(54316002)(33646001)(92566001)(19580395003)(83322001)(46102001)(31966008)(74316001)(80976001)(79102001)(65816001)(74876001)(54356001)(53806001)(76796001)(76576001)(93136001)(50986001)(81342001)(47976001)(95416001)(94316002)(74502001)(49866001)(81686001)(81542001)(47736001)(85852003)(94946001)(76786001)(77982001)(4396001)(51856001)(76482001)(74662001)(47446002)(81816001)(93516002)(74706001)(86362001)(211663006)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB407;
	H:BLUPR03MB357.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:E86D5DA6.ED1BDF3A.86D39B52.DAEC6D7F.2022C; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] gcc: Enable SPE & AltiVec generation on powepc*linux target.
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
X-List-Received-Date: Fri, 28 Feb 2014 12:52:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Will it be automatically cherry picked to Dora?

Regards,
Alex

> -----Original Message-----
> From: David Nystr=F6m [mailto:david.nystrom@enea.com]
> Sent: Friday, February 28, 2014 2:47 PM
> To: Sardan Alexandru Cezar-B41700; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] gcc: Enable SPE & AltiVec generation on
> powepc*linux target.
>=20
> On 2014-02-27 13:17, Alexandru-Cezar Sardan wrote:
> > [ADT bug #5761] --
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5761
> >
> > Also this patch adds symlinks to libgcc such that a GCC configured
> > by passing the target parameter without LIBCEXTENSION and ABIEXTENSION
> > specifiers to find the correct startup files from a libgcc configured
> > with these variables.
> >
> > Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> > ---
> >   meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
> >   ...AltiVec-generation-on-powepc-linux-target.patch |   42
> ++++++++++++++++++++
> >   meta/recipes-devtools/gcc/libgcc.inc               |   24 ++++++++++-
> >   3 files changed, 66 insertions(+), 1 deletion(-)
> >   create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-
> AltiVec-generation-on-powepc-linux-target.patch
> >
>=20
> +1
>=20
> I hope this patch will be considered for dora as well as long as we dont
> see any issues with it.
>=20
> Br,
> David
>=20
>=20


