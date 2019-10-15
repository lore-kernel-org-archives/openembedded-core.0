Return-Path: <danc@opengear.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720089.outbound.protection.outlook.com [40.107.72.89])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1447F2FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 07:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=bOV+a0lFaRAIow+3efiWAm+CPaxLupkUhfvXX9uayJLPhsottSzwvx1OAECzIuGfyBDtGY0QMp8eJUTtx33t2NPSRoH51qVMaH3spuC5URUOrKFhLLsnD7aL0jHsjjwgBLngNDqpOOvS6ZScG1adRim5pfYNeITliO8sZILXLPf4+0Z5KDbvNwnNEl+xUfn/857wBRn8EvhwskfPLduVLShIVRL7XviT1WvW/ypb//0gtdbzEB4Wj+0YxirN75Hkzk8V5I+5qDSrQAkfrUc2B20z2BnqQ4QHNaDHbNTGHCkzZ50kGhsCHDlwyfuVz3eXTRN2o/fR8UbMdZDKg/x/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oMInGNNmKVaHMhs35eCQKVmkksB6NmCpRXhtyflzWbc=;
	b=fYd0ZRb1CrfjsM51f5i1o+lA8K8stDqsZtAM2AVV9o0IUuO3NvAjPz/V+Lb7uc/9uGJmYnXfHEvJW1yrKAlvcy35Etg/pSOKAPndc9J8InaweE+qwxXuS4P/EbYMD01r5Q40UC7pmb8M71/qiQWQLmYcTlYmkBLNDQacgNFVu15AVbpTbrl3J626d8pi5FteDVddvzBfIOrEHyoJCuhB6g0ZJg/cruXFGdaBNEaXwI+/vJqvpPFthrU9bFU1Nbe+jK4gV0vHr5HLHWu1/+YpzdvU+tpZ6nvJUw7lBuRPWpMNkC9oUDhHPU+U7ElFIp7PYsKxbw8xnsAfInPrkFpKEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oMInGNNmKVaHMhs35eCQKVmkksB6NmCpRXhtyflzWbc=;
	b=etQfNQ4C66uLEaeyH8r4LN+LiNDqSW258orgq3qufpNE4z71g8oEfS3kbLSKpsqoDXijxrxWFtg91C4caQ3SAoDg5Pzb4n2GLQV7Zor6fhgjN5Tiehy0RIHXJ+mBUywHgI1M9SgGT7g/6reL/zawiVIPXf2UODAxe2hFWa5n1NI=
Received: from BN8PR15CA0052.namprd15.prod.outlook.com (2603:10b6:408:80::29)
	by BYAPR15MB3479.namprd15.prod.outlook.com (2603:10b6:a03:106::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18;
	Tue, 15 Oct 2019 07:21:08 +0000
Received: from SN1NAM04FT055.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::200) by BN8PR15CA0052.outlook.office365.com
	(2603:10b6:408:80::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.22 via
	Frontend Transport; Tue, 15 Oct 2019 07:21:08 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT055.mail.protection.outlook.com (10.152.89.20) with Microsoft
	SMTP Server id 15.20.2347.16 via Frontend Transport;
	Tue, 15 Oct 2019 07:21:07 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 9F392E84FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 17:21:06 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 9647A4294606; Tue, 15 Oct 2019 17:21:06 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
In-reply-to: <e41fa2a4-1744-993c-d38a-f98229726251@gmail.com>
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
	<20191015061510.21803-1-dan.callaghan@opengear.com>
	<e41fa2a4-1744-993c-d38a-f98229726251@gmail.com>
Date: Tue, 15 Oct 2019 17:21:04 +1000
Message-Id: <1571123420-sup-6304@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39840400004)(396003)(346002)(376002)(136003)(448002)(174874002)(199004)(189003)(52314003)(58126008)(14444005)(5024004)(316002)(36906005)(305945005)(103686004)(21480400003)(4001150100001)(42186006)(7636002)(26005)(229853002)(6266002)(8676002)(6246003)(246002)(8936002)(356004)(568964002)(186003)(5660300002)(6306002)(76176011)(70206006)(70586007)(2906002)(426003)(71190400001)(126002)(476003)(235185007)(33964004)(446003)(76130400001)(11346002)(2870700001)(26826003)(478600001)(44832011)(6916009)(336012)(486006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR15MB3479;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a582d997-cb07-4022-3063-08d751403f4d
X-MS-TrafficTypeDiagnostic: BYAPR15MB3479:
X-Microsoft-Antispam-PRVS: <BYAPR15MB34797A3514035756E083D00DB8930@BYAPR15MB3479.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 01917B1794
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IyN4bb4h96aAm6jk2A/EK1HOI33vx4bibL8fE+15bA1VVbw+JqkHt/HgAuRn9XuioBQLZn7VjVrrKXZH4Ro3BSDwDKx6nxo5SrBOTecb7KgNpsbFmWrbPYEk4ohOH/tloZbLvcCrjlUo202L9YiwRNqs58uXRMhDH/TXTjYEObAHj2z8w3pfeHCMLbJJpOHjQUjmFbF0EJWNl2fpBF2V/LufXonJBbrlOJa31DfrXXPqLmvD/XYHGcGylnwgQxl6NwkSwVINsilvtJLGywAOCqqGlkvkYtHFU02jwu9PkyZ2FwRN1Yg6g3M0VmhzX4lZ3lV1K0C5VBSB6SEyyGuPBUu8uh2azIDqdZ0kkoUzLARHh9Esz6HB6qCz08Ezmkb6ABmJkKjore5G1l1D/vfETMnbNYrScul6JhKvJi54Ilg=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 07:21:07.3919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a582d997-cb07-4022-3063-08d751403f4d
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3479
Subject: Re: [PATCH v2] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 15 Oct 2019 07:21:09 -0000
X-Groupsio-MsgNum: 130131
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha256"; boundary="=-1571124066-580428-1981-683-2-="

--=-1571124066-580428-1981-683-2-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Jacob Kroon's message of 2019-10-15 08:59:56 +02:00:
> Den 2019-10-15 kl. 08:15, skrev Dan Callaghan:
> > @@ -46,8 +46,12 @@ SRC_URI[sha256sum] =

> > =3D "fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc
> >
> >   inherit autotools gettext ptest
> >
> > -EXTRA_OECONF =3D "--program-prefix=3Deu- --without-lzma"
> > -EXTRA_OECONF_append_class-native =3D " --without-bzlib"
> > +EXTRA_OECONF =3D "--program-prefix=3Deu-"
> > +
> > +PACKAGECONFIG ??=3D "bzip2"
> > +PACKAGECONFIG[bzip2] =3D "--with-bzlib,--without-bzlib,bzip2"
> > +PACKAGECONFIG[xz] =3D "--with-lzma,--without-lzma,xz"
> > +
> >   RDEPENDS_${PN}-ptest +=3D "libasm libelf bash make coreutils ${PN}-=
binutils"
> >
> >   EXTRA_OECONF_append_class-target +=3D "--disable-tests-rpath"
> >
> =

> If I get it correctly, previously the recipe depended on bzip2, but for=

> native it was actually disabled at configure time. Can't we just skip i=
t
> for native then, since it hasn't been required sofar ?
> =

> You can do
> =

> PACKAGECONFIG_class-native =3D ""

Yes true, that would work, although it seems like needless complication =

to have different build configurations for the target recipe and native =

variant.

Anyway, I figured out why the --without-bzlib was originally added for =

the native variant. The commit message wasn't clear to me, but I have =

seen the problem in action now.

I saw that elfutils-native correctly depends on bzip2-native, and the =

build worked on my PC. But it was actually the host bzip2 library =

leaking into the build.

Poky has "bzip2-native" in ASSUME_PROVIDED. Presumably, this is because =

bzip2 (the command line program) is a required host tool and so there is =

no need to build bzip2-native just to get a working bzip2 program.

However that also means that bzip2-native libraries and headers are =

silently omitted from the recipe-sysroot-native for elfutils-native, =

even though it depends on bzip2-native. On our Jenkins, which has a very =

minimal build environment and lacks the bzip2 headers, elfutils-native =

fails to configure:

    | checking for library containing BZ2_bzdopen... no
    | configure: error: missing -lbz2 for --with-bzlib

It seems to me the real problem here is that "bzip2-native" does not =

really belong in ASSUME_PROVIDED. Recipes can assume that the host =

provides the bzip2 *command* but not necessarily its headers and =

libraries.

So now I am not quite sure what to do...

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1571124066-580428-1981-683-2-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAl2lc2AACgkQQuSr4gkX
maSBJg/+NsnXCE3miPrz7OWRxdHgiXTXSeaAj3Lk/9FP1yyEGxeWw/DznndDDrjG
Q7QuUm0XAfQKx4BuJN0ko40MFmcZ8IDfE57haBhX53B5He2zlqXtmOgRUvKrm9pc
p7tdaKQfrIRflTrcmGiUdrFdOzxS35aX8AFVZbLReM0xKC/1DuW0zh268ZVewefG
9cS5sXYlM4HmfUPGWf7BjmgI/n22+Tlwog4/2G+B/W7mrFmModK1E9TmGuilZJm7
PR8TF2rQ7Bf+HU1A3eL2crWSt/H+03zUQXQnR6e1gxXpE/Hj3pVtSIBg+UBKTGvu
iO+9ZkKjgSq96ay8br0FD+Hnwsv+rgk1gZ1S4rDoUMvJwdOPuvIk7AQe9bQ8G2J3
3djzTpIKWRkLfArV9K93gFxnZ7FLlLNgre3H2D3LesHfRSeuLa3N28rXHOGXdsjV
idNFVGMuzl+nisBoEusRi/XsnpA3iXCbnx3GNijnun1rhstpsukDwi9IWSzO2w3D
DaSWtroP+tlUnJCAwCQOkZz2Sc+10tb5cPiGrlpD3vEeZLnj3+1b5YarX/nUii08
YctjPKUH4+lyiOBwR+macGDbGCr4Mdi8WhyyFx6jgtImcEcb3xrZjEK6FZ8EC6B+
8K9ii6/bLNKtB7Qo8AUA4pNhRGq8ro+r1s87g/bH6VBnpJFWDMY=
=99G1
-----END PGP SIGNATURE-----

--=-1571124066-580428-1981-683-2-=--
