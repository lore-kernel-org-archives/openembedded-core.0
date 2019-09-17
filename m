Return-Path: <JAEWON@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790044.outbound.protection.outlook.com [40.107.79.44])
	by mail.openembedded.org (Postfix) with ESMTP id E17177FD80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 23:35:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=E5t7MQ5Oc7hA+DtfU+Qnf3601qAE345x3aASrAq2TKmL9+ZTJDQ7KNnmpTHt3wkkzrSLEqhlEjEjY/5fvzIsRa497sgpuCIJci3ufmlmP+8yeAOYHDGLxfsT6vfyXj1ewrVxGJoXu8I6kawu6YGU84PCF6wfpsKfkc+adU4UGJgSoIuccvJP+dZF6/3HTDQb8Dal5NbqoyuxBifH3oBAlJtcHVlB8jEOj02XzDrhdA9GSDJdt4OE2tguIh8wEHLEdsgznrJYhv4paUNZyXNIPhjiutYmYhNXl8mEie8Mod0KDKq60E86Bx9+RrQd/itfDqvM4j7ll0cUcQkgmMpEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TbOrM7GW3t42XN70d8FZfTSsXUXM7FAdT02fRV88StA=;
	b=RJnRRy5Uf5HSmWPTQLoRCgP4HqK6ZoTqqR0UkD9e1h+C2d+Los7rulkBo0LRtp5rHh+0YlugOtNkAAvIVhGFTA8IwLyJ18bTrjRGowJi2YgkDgDu9YAEKOK6OQ8tUCRZK2OBV4pK27OpLLASuxZyDM8FgAZHm9ezBqEzYULRfzXxeZhmpgx2bwJRgvjWxcBB5nw+tSAsVZi1PgWHmEU3J5QCqznp23qm1ImTC+irlvZQclO6ZCU9i2rLcNLYJ57AfZsjnRhAeRM9fbRchE8B1EO6J25FFdVAeNFHaHIztpiPUgIWSFk8aDCL2L+HSlT1NUD6+L5aC2jS+6dRwC1BIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
	dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TbOrM7GW3t42XN70d8FZfTSsXUXM7FAdT02fRV88StA=;
	b=AID0Q5i1KSr6RXvYHJMM7rKTaOPkIv2yJxDxvQ01Wh1IYcWyCMqsF2TISMTmrpZvGaQZ7izBcqB614vN/s/GjdIJrCm+jvvf3lCdscszdgO6vru4LKzTY7zGAToIIYpSNMi6EtnZTVXxRzuQ7yOobOesCEG6C6y5Zg6jA2KYwZo=
Received: from BYAPR02MB5816.namprd02.prod.outlook.com (20.179.62.217) by
	BYAPR02MB4279.namprd02.prod.outlook.com (52.135.236.216) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2263.15; Tue, 17 Sep 2019 23:35:31 +0000
Received: from BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::fcb8:6742:6614:e8ea]) by
	BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::fcb8:6742:6614:e8ea%5]) with mapi id 15.20.2263.023;
	Tue, 17 Sep 2019 23:35:31 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [oe-core][master][PATCH] Introduce mechanism to keep
	nativesdk* sstate in esdk
Thread-Index: AQHU6OgD2JhQnI36fUOvfpDbvD40gqcTSFbQgB4tyoCAABZlEA==
Date: Tue, 17 Sep 2019 23:35:31 +0000
Message-ID: <BYAPR02MB5816B9224029E64C19CAE53AAF8F0@BYAPR02MB5816.namprd02.prod.outlook.com>
References: <1554163613-2791-1-git-send-email-jaewon.lee@xilinx.com>
	<BYAPR02MB5816F67E4B32AB35B425D15DAFA20@BYAPR02MB5816.namprd02.prod.outlook.com>
	<2420065.Evh0tLMQLu@linux.fritz.box>
In-Reply-To: <2420065.Evh0tLMQLu@linux.fritz.box>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5166d78b-0a22-4c09-2579-08d73bc7bb07
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR02MB4279; 
x-ms-traffictypediagnostic: BYAPR02MB4279:|BYAPR02MB4279:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB42793D3B5DE3C1299BBEC0AFAF8F0@BYAPR02MB4279.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(13464003)(199004)(189003)(6916009)(478600001)(86362001)(74316002)(305945005)(7736002)(81156014)(71190400001)(71200400001)(6436002)(81166006)(2906002)(186003)(66556008)(76176011)(66476007)(64756008)(3846002)(6116002)(14444005)(66946007)(66446008)(76116006)(33656002)(256004)(52536014)(8936002)(14454004)(229853002)(4326008)(11346002)(25786009)(102836004)(316002)(446003)(53546011)(476003)(6506007)(8676002)(26005)(54906003)(6246003)(5660300002)(486006)(7696005)(66066001)(107886003)(99286004)(55016002)(9686003)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4279;
	H:BYAPR02MB5816.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +xa68pebZ4NVmN5FEZcJwtRxdsRssRR6WdamURN+RQ4xfi5JVa1GzDmTCl9KPCddSRM8J8ZjbMiuSGesbDc8Uz1eMxvJoVAoDb3VVclpRxRQvd4ZL7zwXh9X+9VogVc0m+1LzCAkAs4ll9DyKFWuJu20oCSEJEE42/b1ttuZ/aiBx3tZXAgBZSw2QAzvpoU6b8w6sTxGXNhR2mgyAqep/x/GAzIpzohe51PUaolKunyY/COBmioH5BlwNgngye9RE2d84BD2UnLe8zmXfyjhGjrR6Y0q0n1ygNNu8e2hEtzWku/TovSnt6OJ08U4FMCIp6Ih4P8Vsv3o/F9mPrFYxHujlx7gLkZRi31doiHXcskcTeHUqdsixUqctpBcibR1+siw7ILhpxiLD6RQX76/+m2UyUo7Zwrzw9lOtaJbcZ8=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5166d78b-0a22-4c09-2579-08d73bc7bb07
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 23:35:31.6773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0V/bA/fVzGRF6yG0Goca3OqscY/ujaVa71Y73k+T8aWeaIyryiRJ0RhknFyLzdLhFi7DC6cxxaYosSKQjZgc4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4279
Cc: Bruce Ashfield <brucea@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] Introduce mechanism to keep nativesdk* sstate in esdk
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
X-List-Received-Date: Tue, 17 Sep 2019 23:35:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

> -----Original Message-----
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> Sent: Tuesday, September 17, 2019 3:05 PM
> To: Jaewon Lee <JAEWON@xilinx.com>
> Cc: openembedded-core@lists.openembedded.org; Alejandro Enedino
> Hernandez Samaniego <alejandr@xilinx.com>; Manjukumar Harthikote
> Matha <MANJUKUM@xilinx.com>; Bruce Ashfield <brucea@xilinx.com>
> Subject: Re: [OE-core] [oe-core][master][PATCH] Introduce mechanism to
> keep nativesdk* sstate in esdk
>=20
> Hi Jaewon
>=20
> Richard was waiting for me to review this - unfortunately another one tha=
t
> fell between the cracks - sorry about that.
[Jaewon] No  problem!

>=20
> On Friday, 30 August 2019 5:13:39 AM NZST Jaewon Lee wrote:
> > > -----Original Message-----
> > > From: Jaewon Lee <jaewon.lee@xilinx.com>
> > > Sent: Monday, April 1, 2019 5:07 PM
> > > To: openembedded-core@lists.openembedded.org; Alejandro Enedino
> > > Hernandez Samaniego <alejandr@xilinx.com>; Manjukumar Harthikote
> > > Matha <MANJUKUM@xilinx.com>; Bruce Ashfield <brucea@xilinx.com>
> > > Cc: Jaewon Lee <JAEWON@xilinx.com>
> > > Subject: [oe-core][master][PATCH] Introduce mechanism to keep
> > > nativesdk* sstate in esdk
> > >
> > > Using SDK_INCLUDE_NATIVESDK flag to toggle inclusion of all
> > > nativesdk* sstate into esdk Currently locked-sigs.inc is generated
> > > during do_sdk_depends which doesn't pull in nativesdk packages.
> > > Generating another locked-sigs.inc in do_populate_sdk_ext and
> > > pruning it to only
> > > nativesdk* packages by using a modified version of the already
> > > existing function prune_locked_sigs and merging it with the current
> > > locked-sigs.inc Also adding SDK_INCLUDE_NATIVESDK tasklistfn to the
> > > logic surrounding setting tasklist file to not prune esdk sstate
> > > during creation
> > >
> > > Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
>=20
> The commit message doesn't actually explain why you are adding this
> functionality. You explained it elsewhere (bug 13261) but it needs to be =
in
> here. I would also recommend adding a "Fixes [YOCTO #13261]" at the end s=
o
> there's a reference back to the bug as well.
[Jaewon] Ok I will resend with commit fixed

>=20
> > > @@ -414,7 +433,7 @@ python copy_buildsystem () {
> > >
> > >      sdk_include_toolchain =3D (d.getVar('SDK_INCLUDE_TOOLCHAIN') =3D=
=3D '1')
> > >      sdk_ext_type =3D d.getVar('SDK_EXT_TYPE')
> > > -    if sdk_ext_type !=3D 'minimal' or sdk_include_toolchain or deriv=
ative:
> > > +    if (sdk_ext_type !=3D 'minimal' or sdk_include_toolchain or deri=
vative)
> and not sdk_include_nativesdk:
> > >          # Create the filtered task list used to generate the sstate =
cache
> shipped with the SDK
> > >          tasklistfn =3D d.getVar('WORKDIR') + '/tasklist.txt'
> > >          create_filtered_tasklist(d, baseoutpath, tasklistfn,
> > > conf_initpath) @@ -
>=20
> This logic change looks a bit odd. Are you sure this is correct?
[Jaewon] I kept the original logic and did a "and not" my flag=20
Because if flag sdk_include_nativesdk is set I want tasklistfn to be none s=
o esdksstate is not pruned during creation

Thanks,
Jaewon


