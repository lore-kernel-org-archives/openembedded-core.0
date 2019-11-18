Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
	by mail.openembedded.org (Postfix) with ESMTP id 07CE07F88E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:52:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ar/4MhWNHj1t8dEAfI3NaNJaP7KwqO/iuxwIEUgTrjmhGBuklcHeyjOgPvuukQBGbN3Rcu6bwK+9n/LfyEXoEEHr6lZrFkL6XUYtkNG7wVjXNh7JJHM9VCLGA1egerqw5xbHa5Ahp8QM7/YnvC42/fwJNlkvOe6DrhBEJFTehGLi7PbmBBWK9iTS54/hKUC0/sBKpnwMREyzlBc3S2nwpjL6AaGdNW6N3wDhFvoGrY/7rbIEHIiTKCndA7kMQvJHagL1/SvjNw30UCqpmB/76LlMTAEfzTpPE/bepZzliFVO928qRtoqio97QfQcG7F6KHWfYEHgUIawsbQQRmoPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=L1C7TIbah5uovXRNKH7aIRA0MJSg5gFrkrCnvhdFuM8=;
	b=E4H1vO3th3Xz6Kr2OkWPlp4tutU9wqXLkagAMbpU4IeELRk+3cC/34yEtKITJmsTe1dm28b1d0vxGTiri2eDh/C+0K1/SJiOj6EsmBioiyxaXPStVcFxYM0ctwPhZp0LOvXnZMyM6KoM5WWHr2sIPOrkAgwOisxICpgNbPt6ZsBzfM0EBvvqOahpfY+TwVbaFtyKy6oXzdNHUSqQnH7ODXtLfvhslhp9z5/2poBoTBEAPGJTnju1Erjcpktl/TntCxy8IRSIcT+lSbHGU9WJOE00KD7Ue1uFwtXpURvSsHQ5GE4Cx8V3Gkb+Tw4Ra0N7i8+oJsRCxJooWQ9Uw8fYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
	dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=L1C7TIbah5uovXRNKH7aIRA0MJSg5gFrkrCnvhdFuM8=;
	b=drS7QfRXwqHBdhnmpzWvG8pzVRCXFq1zWkKwLO98BWy/lku3tgNFzSX2IPYd0I3+vF6P76N6AOA7/xwV/BlzcpZ0khqcz9eYbv5K5JGuxGgfDHs/k3AI4BtMo0VQw1a/PaTUsSH04w1WgGcwEdHvHyFkk4x+APrnf2SBMAk9w3k=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.62.146) by
	BYAPR02MB5541.namprd02.prod.outlook.com (20.178.1.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.29; Mon, 18 Nov 2019 16:52:02 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::3543:cc29:b226:32c2]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::3543:cc29:b226:32c2%3]) with mapi id 15.20.2451.029;
	Mon, 18 Nov 2019 16:52:02 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 09/13] Revert "devtool/standard.py: Not
	filtering devtool workspace for devtool finish"
Thread-Index: AQHVni9unRNwkgMbhUyhPs4cQVmxraeRJDZA
Date: Mon, 18 Nov 2019 16:52:01 +0000
Message-ID: <BYAPR02MB6005F49140DEC79D6F993EB8B94D0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-9-alex.kanavin@gmail.com>
	<9cefac866172047d73121778c13de58fc215904d.camel@linuxfoundation.org>
In-Reply-To: <9cefac866172047d73121778c13de58fc215904d.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cea88573-e4a7-4cc9-403d-08d76c47a274
x-ms-traffictypediagnostic: BYAPR02MB5541:
x-microsoft-antispam-prvs: <BYAPR02MB5541363865ABEA391EE0DDA6B94D0@BYAPR02MB5541.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(199004)(189003)(13464003)(7736002)(486006)(9686003)(14444005)(476003)(14454004)(446003)(33656002)(76116006)(55016002)(76176011)(7696005)(6506007)(71190400001)(71200400001)(53546011)(6246003)(4001150100001)(11346002)(81166006)(256004)(2501003)(74316002)(186003)(81156014)(8936002)(102836004)(26005)(229853002)(66066001)(6436002)(5660300002)(6116002)(8676002)(305945005)(478600001)(25786009)(99286004)(86362001)(66946007)(2906002)(66476007)(66556008)(66446008)(64756008)(110136005)(316002)(3846002)(52536014)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5541;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lZHNFXsmk5oN+mfWTxLugYccyOwycHPgs0SrwDhm8bkLldBNNBbiDYYT4VpXXrrbdxd+hisVYAKS/+OHMLuR+RIeRdvFm6SyYcw8ccYoOCagqa86+IbNjau7suvdX9xlXDGigC2p1noEwvhEhU13w81ZSq+65IV2/G0CGEZsPEXxxyr8DIhO67OuET9xUP4hxqXWyh+iOxbysepIDFlP5qL+h5BuisCEbhBz/fZZZMIalYArHd87QfaDH6DVlktndnOMjjiC93LWPUHee5NfJ2vaJm/8zcKUf6ry9pH4CoD82bTqzIxbLyY/MpRCERBMxpO2PRxIGxCfFr7USGe6brLzyEcD/JlqBztMcmYRCgeyOeRhj1Y4XDe9Z3TX9jqDdcsmhDutP6qc0eYBN1cIQwiNhkgIjyN1c57QpZP3jV1bmg5r/rDQ2dH38H+Guxcv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea88573-e4a7-4cc9-403d-08d76c47a274
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 16:52:01.8460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CqP3VEmmgo3ACU56BcVq0hXbm4NPkjQAnFEcxLLwGKn7QF1zPj1kz3QfyRYZx3u8vx2BiGhuJ3bWG1WOKdYMzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5541
Subject: Re: [PATCH 09/13] Revert "devtool/standard.py: Not filtering devtool workspace for devtool finish"
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
X-List-Received-Date: Mon, 18 Nov 2019 16:52:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Richard
> Purdie
> Sent: Monday, November 18, 2019 8:44 AM
> To: Alexander Kanavin <alex.kanavin@gmail.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 09/13] Revert "devtool/standard.py: Not fil=
tering
> devtool workspace for devtool finish"
>=20
> On Mon, 2019-11-18 at 15:28 +0100, Alexander Kanavin wrote:
> > This reverts commit 41d225f4a37d02e9f79bdbfb79caac8cd3d291ce.
> >
> > Unfortunately this change broke 'devtool upgrade' functionality,
> > causing 'devtool finish' to write out an upgraded recipe that no
> > longer includes the original upstream source in SRC_URI.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  scripts/lib/devtool/standard.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py index 8d9c1a30225..1c0cd8ab51b
> > 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -2021,7 +2021,7 @@ def finish(args, config, basepath, workspace):
> >      remove_work=3Dargs.remove_work
> >      tinfoil =3D setup_tinfoil(basepath=3Dbasepath, tracking=3DTrue)
> >      try:
> > -        rd =3D parse_recipe(config, tinfoil, args.recipename, True,
> > False)
> > +        rd =3D parse_recipe(config, tinfoil, args.recipename, True)
> >          if not rd:
> >              return 1
>=20
> Are we missing a test case for something here?
>=20
> If yes, would that be worth noting in bugzilla whilst we know about it?
>=20

We will work on adding some of the test cases as well. The functionality of=
 devtool is broad, it has various features and patches sent are missing tes=
ting every single functionality

Thanks,
Manju

