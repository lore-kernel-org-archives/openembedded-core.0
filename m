Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0236.outbound.protection.outlook.com [207.46.163.236])
	by mail.openembedded.org (Postfix) with ESMTP id DBCE06E9E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 14:03:24 +0000 (UTC)
Received: from DM2PR03MB368.namprd03.prod.outlook.com (10.141.55.22) by
	BL2PR03MB162.namprd03.prod.outlook.com (10.255.230.145) with Microsoft
	SMTP Server (TLS) id 15.0.868.8; Tue, 28 Jan 2014 14:03:23 +0000
Received: from DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) by
	DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) with mapi id
	15.00.0859.020; Tue, 28 Jan 2014 14:03:23 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc linux
	verses linux-gnuspe"
Thread-Index: AQHPDhbUXOT9PA+PXESDVVjRhy4ospqCnDKAgAABToCAAZ4SAIAExmYAgAFgVoCABReK0IAACoyAgAMsSfCAAcCFgIAF0Mbw
Date: Tue, 28 Jan 2014 14:03:22 +0000
Message-ID: <f83172775cb74f1aba4c373b22287a90@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390326205.874.95.camel@ted>
	<c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
	<1390596961.24755.21.camel@e130.pbcl.net>
In-Reply-To: <1390596961.24755.21.camel@e130.pbcl.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0105DAA385
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(24454002)(377454003)(377424004)(199002)(189002)(13464003)(51704005)(81342001)(80976001)(81686001)(81816001)(81542001)(86362001)(94316002)(63696002)(50986001)(47976001)(47736001)(49866001)(93516002)(4396001)(80022001)(65816001)(66066001)(74876001)(74706001)(15202345003)(33646001)(56776001)(54316002)(54356001)(53806001)(76482001)(59766001)(47446002)(74662001)(77982001)(31966008)(74502001)(79102001)(51856001)(76576001)(93136001)(69226001)(46102001)(76786001)(76796001)(15975445006)(87936001)(2656002)(92566001)(19580395003)(90146001)(74316001)(19580405001)(56816005)(83322001)(85852003)(85306002)(83072002)(74366001)(87266001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB162;
	H:DM2PR03MB368.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:EEC4C885.900A6E2A.3AD0F5B3.8AE5DA40.202D3; InfoNoRecordsA:1;
	MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "catalin.udma@freescale.com" <catalin.udma@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Tue, 28 Jan 2014 14:03:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

See my comment inline.

Regards,
Alex

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Friday, January 24, 2014 10:56 PM
> To: Sardan Alexandru Cezar-B41700
> Cc: Udma Catalin-Dan-B32721; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc
> linux verses linux-gnuspe"
>=20
> On Thu, 2014-01-23 at 18:22 +0000, alexandru.sardan@freescale.com wrote:
> > [Alex Sardan] No. The more generic target powerpc-none-linux will not
> > generate SPE code and the powerpc-none-linux-gnuspe target that
> generates
> > SPE will not be able to generate Altivec.
>=20
> Why not?  As far as I can tell from the gcc configury, the target string
> only affects the defaults (i.e. powerpc-*-linux gets -mno-spe
> -mno-altivec, powerpc-*-linuxaltivec gets -maltivec -mno-spec, and
> powerpc-*-linuxspe gets -mno-altivec -mspe).  There doesn't seem to be
> any real impact beyond this that would make the compiler binary
> fundamentally incapable of generating either type of instruction if you
> pass the appropriate options on the command line.
>=20
> p.
[Alex Sardan] Trying to generate altivec instructions with the spe compiler
will yield the following error:

b41700@fsr-ub1264-102: [sandbox]$ powerpc-fsl_networking-linux-gnuspe-gcc -=
mcpu=3De6500 -mabi=3Dno-spe -mno-spe -mabi=3Daltivec -maltivec -S -c double=
.c=20
double.c:1:0: error: AltiVec and E500 instructions cannot coexist

Also trying to generate e500v2 code with powerpc-linux target:

b41700@fsr-ub1264-102: [sandbox]$ powerpc-poky-linux-gcc -mcpu=3D8548 -mabi=
=3Dspe -mspe -mfloat-gprs=3Ddouble -S -c double.c=20
double.c:1:0: error: not configured for SPE ABI
 double foo()
 ^
double.c:1:0: error: not configured for SPE instruction set

>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


