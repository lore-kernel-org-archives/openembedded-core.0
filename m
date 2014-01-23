Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0237.outbound.protection.outlook.com [207.46.163.237])
	by mail.openembedded.org (Postfix) with ESMTP id D5CB66E38B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 18:23:02 +0000 (UTC)
Received: from BLUPR03MB357.namprd03.prod.outlook.com (10.141.75.151) by
	BLUPR03MB165.namprd03.prod.outlook.com (10.255.212.139) with Microsoft
	SMTP Server (TLS) id 15.0.859.15; Thu, 23 Jan 2014 18:23:00 +0000
Received: from BLUPR03MB357.namprd03.prod.outlook.com ([10.141.75.151]) by
	BLUPR03MB357.namprd03.prod.outlook.com ([10.141.75.151]) with mapi id
	15.00.0847.008; Thu, 23 Jan 2014 18:23:00 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc linux
	verses linux-gnuspe"
Thread-Index: AQHPDhbUXOT9PA+PXESDVVjRhy4ospqCnDKAgAABToCAAZ4SAIAExmYAgAFgVoCABReK0IAACoyAgAMsSfA=
Date: Thu, 23 Jan 2014 18:22:59 +0000
Message-ID: <c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390326205.874.95.camel@ted>
In-Reply-To: <1390326205.874.95.camel@ted>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(51704005)(377454003)(24454002)(189002)(199002)(13464003)(377424004)(31966008)(76576001)(59766001)(69226001)(63696002)(74502001)(15975445006)(81542001)(81816001)(87266001)(79102001)(76786001)(94316002)(54316002)(77982001)(56776001)(76796001)(74662001)(4396001)(47976001)(53806001)(2656002)(83072002)(47736001)(49866001)(74876001)(19580395003)(15202345003)(51856001)(33646001)(50986001)(86362001)(83322001)(19580405001)(54356001)(46102001)(74706001)(66066001)(56816005)(85306002)(65816001)(85852003)(47446002)(80022001)(76482001)(74366001)(81342001)(87936001)(80976001)(92566001)(93136001)(81686001)(93516002)(90146001)(74316001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB165;
	H:BLUPR03MB357.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:; InfoNoRecordsMX:1; A:1; LANG:en; 
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
X-List-Received-Date: Thu, 23 Jan 2014 18:23:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

See my comment inline.

Alex

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Tuesday, January 21, 2014 7:43 PM
> To: Sardan Alexandru Cezar-B41700
> Cc: Udma Catalin-Dan-B32721; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc
> linux verses linux-gnuspe"
>=20
> On Tue, 2014-01-21 at 17:39 +0000, alexandru.sardan@freescale.com wrote:
> > Yes, the gcc configured for SPE (--target=3Dpowerpc-fsl_networking-linu=
x-
> gnuspe)
> > can generate both SPE and non-SPE code provided that software
> > floating point is used.
> >
> > There are a couple of parameters (-mabi=3Dno-spe -mno-spe) that will tu=
rn
> > off SPE vector instructions generation. If the code contains floating
> > point arithmethic -msoft-float needs to be used as well. This means
> that
> > the GCC multilib setup has to be configured to include soft float and
> > build coresponding version of libgcc and target fragments.
> > But why would we want to generate code without SPE for e500v1/v2?
> > Soft-float comes with a major performance penalty.
> >
> > Maybe I didn't understand correctly what kind of toolchain you want to
> > be built in the end. Do you want to have a single GCC that builds all
> > powerpc targets (e500v2, e5500, e6500 etc) and a separate sysroot for
> each
> > target?
>=20
> Yes, this is exactly what is wanted. This is how the SDK is intended to
> operate. The alternative and what we had before was a separate compiler
> for each target which is rather wasteful.
>=20
> > This may be problematic since, for example, the compiler that can
> generate
> > SPE (for e500v2) can't generate altivec instructions (for e6500).
>=20
> Is there no way to configure gcc so it can generate for the different
> targets assuming you pass in the right runtime target options?

[Alex Sardan] No. The more generic target powerpc-none-linux will not
generate SPE code and the powerpc-none-linux-gnuspe target that generates
SPE will not be able to generate Altivec.
Maybe an exception can be added for e500v1/v2 targets so that a separate
compiler can be generated for them? All the other targets will work fine
with powerpc-none-linux using different runtime command line options.

>=20
> Cheers,
>=20
> Richard
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


