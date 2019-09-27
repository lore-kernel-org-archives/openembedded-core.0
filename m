Return-Path: <ckalluri@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820053.outbound.protection.outlook.com [40.107.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 09F1F7E544
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 20:12:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Dcdsr7yw3tG1ZNj/hb0/gHR6cgqDObaJcueHQOd5maDZPGEh26ggy98CFuzPHOW2Te0dqyQaksILYM6+qwhfE6NF/hU1MCvggF5shJo/znCgUVA2FY80KBlkxY5h+foClzWoF7PTzdI+nT+ETsfZkagXArHprx8u3AD3yIFoXJfy4xfAuVNMy8gjNx0qhYpQsgfIvddjzf7zbgufLJlPfATfQZZ/bll6HR19s53yIji98HnoyfN7vo2sD1TNe4G/V0YtyLcuxqYpNKvpfROxbruFiEQ6XhW1VLV6eIjN2DDMeJNKFe0NKwoa09xRTMQhSnoG40T8/MOkYp+ar0VvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qLXDmunpOdTiOaNRhJAW9WCXJ4g9MOXdeN8b5njamZQ=;
	b=MHZN41TK6T6GTqKon+s1wPCnPcYkUaE3lr71/aKa0MqHljHLzij7771XDMhzyMZXtkz1U3owbYI7bm7VGKKcVnTUAlQ1keW8Ebv80BSXnwGK4YNiEmiA00d5Cpmep16FScHitTA2IsKnbIw7tfnw9TQj30q8bk9je58Kuigq6/qrKs2JE+aLhygaClrneWaSkeJRHs/m5XIkAAK2/mX6hchOwI2MxnlQgUl1mQ3cabJ8KRA648E/n3JTwlK+hHceFvlZm+0tMihxcASe9yIE7VWdtMgDEun0nnGDjZvx2ah1rS5Brm2N7K0CRfTlfuHZTTL/NZ6nrevFM/a/tUssUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
	dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qLXDmunpOdTiOaNRhJAW9WCXJ4g9MOXdeN8b5njamZQ=;
	b=rABMkuJwMP5YJa7bDOXRLZdt0ZMCbOMdBbPGuWVQX1XFiZloeMSK1i+3tfYY/ISN6bA0+QAjUb6w5jwMDvkhrAN1vM5L2TNxpA46tf7FAhGkZHyfgN6rXZxuN8f/2XGXWC5PhWIHKPSzZ5nBjDjGbIUszFPPizhyw/NkHoxrO+E=
Received: from MWHPR02MB2576.namprd02.prod.outlook.com (10.168.205.142) by
	MWHPR02MB2878.namprd02.prod.outlook.com (10.175.49.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2284.21; Fri, 27 Sep 2019 20:12:28 +0000
Received: from MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::f4d9:193b:eb53:e815]) by
	MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::f4d9:193b:eb53:e815%12]) with mapi id 15.20.2284.023;
	Fri, 27 Sep 2019 20:12:28 +0000
From: Chandana Kalluri <ckalluri@xilinx.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Xilinx/meta-jupyter layer
Thread-Index: AdV1b67h6CGmnByNRcSC9yXNlUF9fA==
Date: Fri, 27 Sep 2019 20:12:28 +0000
Message-ID: <MWHPR02MB2576ADF2408BAAF0BF27D82BB0810@MWHPR02MB2576.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ckalluri@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed24965a-baab-4a98-f3d3-08d743870543
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:MWHPR02MB2878; 
x-ms-traffictypediagnostic: MWHPR02MB2878:|MWHPR02MB2878:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR02MB28780695AEE11C84769E3E77B0810@MWHPR02MB2878.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(199004)(189003)(53754006)(486006)(66066001)(33656002)(6306002)(3480700005)(9686003)(6436002)(55016002)(66946007)(66556008)(66476007)(52536014)(305945005)(107886003)(5660300002)(4326008)(476003)(54906003)(76116006)(66446008)(256004)(966005)(14454004)(6506007)(478600001)(2906002)(99286004)(8936002)(316002)(7696005)(25786009)(64756008)(102836004)(71190400001)(71200400001)(2501003)(3846002)(7736002)(86362001)(186003)(6116002)(81166006)(8676002)(74316002)(110136005)(81156014)(26005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2878;
	H:MWHPR02MB2576.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KQZ42ozXigUgAQ/yRznsMjbOThsBzzTyZcGNvtHtAyJTSl5eeCNZ9xU6dfHtr1qLevRTLGBMQhcXhopO5ZKiGAXibjhyrLvDgORpEpNMCQ5aemy5/qiW4peaB9JvChWLGB7YmKS++9c/YbvWw2Nuhm3z1cWuS4ukmyWogbh51/OSejTFHpfxeUipLhqICAv6IoLn6F65U2fFfm3GoGGh6MJlAsNXJmGr0XPkePSEmgcipi7AhHdUQpJCvOOheGRxvYvXXC62KcUe+mnLtdMTraa1ewIS7dCTWCPgggvGizaAERSo4YFVCTNpjq8qNx8R1M625NUqMU1zyzrMfIozdZ6SGZC2zntLYTKU5mqFqCeHiRyBjEKUFu0jifSe+jnF6+eUJT4hHUr4uMOWUE1qIzcuubxtBSdzyFrYep1WyEhI9MtBuc+pCAEcmC/Y0ks2G2PRcyoQwqw4A5A1ThoheA==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed24965a-baab-4a98-f3d3-08d743870543
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 20:12:28.2230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +C8CBmfy7/dkMLQ6VR+L1E8NJCtoffAxUcVF6VfDawUnaE79zrFBuw1GsFWZI3gdYeIfqqLBjXf0mvAHrbyiJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2878
Cc: "dmitry.n.kargin@gmail.com" <dmitry.n.kargin@gmail.com>
Subject: Xilinx/meta-jupyter layer
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
X-List-Received-Date: Fri, 27 Sep 2019 20:12:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

https://github.com/Xilinx/meta-jupyter is a meta-jupyter layer containing r=
ecipes for jupyter notebook. The initial recipes are based of Dmitry Kargin=
's meta-jupyter layer https://layers.openembedded.org/layerindex/branch/mas=
ter/layer/meta-jupyter/. This layer has not been updated for a while.=20

The Xilinx/meta-jupyter layer also adds recipes for python3 based notebooks=
 apart from existing python2 based notebooks.
This layer has been tested using Yocto thud layer and  by running jupyter n=
otebooks on Ultra96 community boards.=20
We would like to maintain Xilinx/meta-jupyter  layer actively and welcome c=
ontributions to this layer either through pull requests or via patches sent=
 to meta-xilinx mailing list until a mailing list for meta-jupyter is in pl=
ace. In the next cycle we will deprecate python2 recipes.=20

A question to community,
 - Would you recommend maintaining this layer separately in the current git=
hub.com/Xilinx location or be included under meta- openembedded layers.
- Would you suggest having a separate mailing list ?

Thanks,
Chandana


