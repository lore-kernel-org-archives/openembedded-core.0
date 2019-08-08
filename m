Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720058.outbound.protection.outlook.com [40.107.72.58])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1F37F2F6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 20:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=MD1bKbMddYqfySf6s0zyIwnM3eESIrJFD6Riq7mPto49qrjbkAb178FQy+tRKxir8KUbB4jm5lGfiCOc4TmZF8Ad5rLO9Z0T3HK31kGQtfgKmT28b26bzZLOtY+GdJCYddSALyCc5BF6aJXgxgVmoVk2utT79niG3L2NhxLF1CKTfMUeMblgFKyNEbv02TNuqDrFh6osqjbXZ8c3+pUTDsqicRIk2yN3Z6StqZJTc8rgbiXy2UDwx73LMRZ8tslPjPd4LbPjHhSIfAGZQZWNLCHmrxN+c5mTryGeMTjDVnaG17kNlDzh2DZ03CqjNAnWTIxpWShgaXDBu2YIxmgxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lpYxl+pvOde0d6rXEB2Is/gygI7ZuMbztQfq+CKL9jg=;
	b=U0zZveaY6/sAySGKm0K33kU0PNgvi3Wjzj4flhSz/SAlYO/WnqwKBNOCih68vttYqaKfPaD798omaDkFkkD3+jwVCRiFKL6FOsQH+WzM5ppW7cdJ7b/6MIesMr0fxaSErGWQkfGZ78Vwb/byh37zj04B7NCywSDQVVJP6xRd2vSdvX5fEIDEieQh8A2m/6QZMHA5BzeqRL3unikSJVRjqzdrnSgBEPCD/6Hi5qtxIR0x5WXAoKuqx/naSlG/8lG+PY+LRdieu/fSs5II5/ZPVTy+oTK68DDiAqOAQRFXpGCDNDsKfFAnp/gJhMTLnHWH0WPSz24memQ9Xq0wqnosGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=xilinx.com;dmarc=pass action=none
	header.from=xilinx.com;dkim=pass header.d=xilinx.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lpYxl+pvOde0d6rXEB2Is/gygI7ZuMbztQfq+CKL9jg=;
	b=n5dBLJhYDC4O6hdfkZHPLvASzwqoedus/TYl2WMQa7u+ERLkchCfSA4Z8cdrXHx05wdJJ/x+97POPf2Xr54trkTnkcnO/KHU+26jWJOAtxmBLOFLdtu77o8E2bI8pr4gpWveEOpAJYkG4wm/XPtnn8eQce8r7gtiA5Ne0pLGMvQ=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYAPR02MB5959.namprd02.prod.outlook.com (20.179.88.211) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.17; Thu, 8 Aug 2019 20:17:27 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::c1d6:a776:ecd1:fd0a]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::c1d6:a776:ecd1:fd0a%7]) with mapi id 15.20.2157.015;
	Thu, 8 Aug 2019 20:17:27 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Chandana Kalluri
	<ckalluri@xilinx.com>, Bruce Ashfield <brucea@xilinx.com>
Thread-Topic: [OE-core] [OE-Core][master][PATCH] standard.py: Provide	an
	additional option for devtool reset
Thread-Index: AQHUv4gvHzgAkZBwCEGk7PW5g1KDPKX8D3GAgAA0IPCA9ol5MA==
Date: Thu, 8 Aug 2019 20:17:26 +0000
Message-ID: <BYAPR02MB6005A1297BC34875CB9623C0B9D70@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
	<3413405.x9v3DxCAyA@localhost.localdomain>
	<BYAPR02MB6005C04842C60A8C3A4DDF26B9710@BYAPR02MB6005.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB6005C04842C60A8C3A4DDF26B9710@BYAPR02MB6005.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00d4721b-b702-46be-424f-08d71c3d6eb9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR02MB5959; 
x-ms-traffictypediagnostic: BYAPR02MB5959:
x-microsoft-antispam-prvs: <BYAPR02MB595976552FAB515F2CE258C7B9D70@BYAPR02MB5959.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(189003)(199004)(13464003)(3846002)(11346002)(55016002)(25786009)(476003)(446003)(53936002)(229853002)(486006)(86362001)(256004)(52536014)(66946007)(14444005)(66476007)(5660300002)(71190400001)(66556008)(64756008)(76116006)(66446008)(71200400001)(66066001)(305945005)(7736002)(99286004)(6636002)(81156014)(81166006)(74316002)(6246003)(110136005)(2501003)(6116002)(186003)(2906002)(76176011)(7696005)(6506007)(53546011)(14454004)(26005)(8936002)(33656002)(316002)(6436002)(478600001)(102836004)(9686003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5959;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sHI3f2MR/OJK21PhgilUnabrnUFizKaACt2Ps/g2yuyqqv1DHwiPBG5jdZ46gFIYNBF17S8krExflrdmblVFY6lYiU5syEs0BhOsDw6yr7cYr7N9gACG5N4LJw9MVkhUqx57KqS9mGidjOttmZMjzYu7Wn7UwP3cJ5tw1hfnuLtNugS8/hmMNeFegh+zVN47NhQoLB2x++jckqLbWSl8PIw7H0kqDMDX6oIJZrHfHoQRgIG+Lpx2NxY65XzXYBLlNuhfKIVcf3B+YLOtntsq26WVbVwW2WryNMl81L/yJSx303R/lmNpyEDvcZ4RNRmMF+i00vZnIJcHr6X7sWTCy0aeXIGKtETblfhRtyPVtMFsP4JSGb7WVdU3jjHSKlLQj5L7TsGuCQCEipmJfIMqFwIzr+D06OB32rSrn/Q3ELg=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d4721b-b702-46be-424f-08d71c3d6eb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 20:17:26.8474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5GTKwb1Zukmn3dkqjKx291hTRIkSPgyMPXwoIPtK03eSibUyax5KbbbFb0MuXRQ2pp+A1KGvdNA3mS2FcBRDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5959
Subject: Re: [master][PATCH] standard.py: Provide	an	additional option for devtool reset
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
X-List-Received-Date: Thu, 08 Aug 2019 20:17:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-core-bounces@lists.openembedded.org> On Behalf Of
> Manjukumar Harthikote Matha
> Sent: Monday, March 4, 2019 3:27 PM
> To: Paul Eggleton <paul.eggleton@linux.intel.com>; openembedded-
> core@lists.openembedded.org; Chandana Kalluri <ckalluri@xilinx.com>
> Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Provide an
> additional option for devtool reset
>=20
> Hi Paul,
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Paul Eggleton
> > Sent: Monday, March 04, 2019 12:17 PM
> > To: openembedded-core@lists.openembedded.org; Chandana Kalluri
> > <ckalluri@xilinx.com>
> > Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Provide
> > an additional option for devtool reset
> >
> > On Friday, 8 February 2019 2:57:32 PM NZDT Sai Hari Chandana Kalluri wr=
ote:
> > > The devtool reset command cleans the sysroot for a recipe in workspac=
e.
> > > It also removes the append file but leaves the source code as in
> > > workspace. The source is not cleaned intentionally and the user has
> > > to manually remove it before calling devtool modify again.
> > >
> > > Provide the user with an option to remove the source code from
> > > workspace by adding a flag to the devtool reset command. The
> > > --rm-source option for the devtool reset command will also clean the
> > > source code from the workspace along with the sysroot and the append =
file.
> > > Ex: devtool reset --rm-source zip or devtool reset -r zip
> >
> > When I wrote this I made a conscious decision not to delete the
> > source, in case the user has unsaved work in the source tree; at least
> > then the user has to take an explicit step (an additional rm -rf) in
> > order to delete it. You might argue that adding an option is the same
> > as that explicit step, but I am still hesitant as you might for
> > example pick a previously used command from your command history with
> > -r in it and only realise after you've run it that you've just blown aw=
ay a bunch
> of your work.
> >
> > However, I have received the feedback from a number of people that
> > they find it annoying that they have to delete the source themselves
> > before being able to run devtool on the recipe again. I'd like to hear
> > from the wider community on the following two questions:
> >
> > 1) Does the convenience of having this kind of option outweigh the
> > potential danger of deleting unsaved work?
> >
> > 2) Are there issues that anyone is experiencing that force you to run
> > devtool clean/finish and then re-run devtool modify (or add, or
> > upgrade), making this kind of situation come up more frequently? Or is
> > it mostly that the source directories end up being left around to stumb=
le over
> some time later?
>=20
> We have seen source directories end up being left around (taking more dis=
k
> space on certain projects), hence a solution to remove it might be optima=
l. If the
> preference is not have "-r" option to avoid command history mistake, then=
 a full
> command like devtool reset --rm-source is acceptable as well
>=20


Any update on this?  Is there a reason not to merge this feature?

Thanks,
Manju

