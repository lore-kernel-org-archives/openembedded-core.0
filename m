Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD1C7D596
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Apr 2019 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lM2FBoCMj0hc9tGNq30X9Lnaddd231tShLgi4+s0oj8=;
	b=zrVvL3qpxIIO5AqwfXJg5olkkIBAJqw9UNi3nj/GRBMy1bcssuEN71BV4q3WgI9R9JQv5QENwVzSHSFXSghsiPEbgTEWBD5dQN6fw/Gdf/alyt6GCq7kESYZEmjUh7xzcpGPaWM/J3V5uDBH8aqFziMQj2xFMfT6KchDj+Lkjrw=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYAPR02MB5750.namprd02.prod.outlook.com (20.179.62.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.20; Sat, 6 Apr 2019 16:51:03 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1dad:d1e3:42c7:e50c]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1dad:d1e3:42c7:e50c%4]) with mapi id 15.20.1771.016;
	Sat, 6 Apr 2019 16:51:03 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
Thread-Topic: [OE-core] Worries kernels supported
Thread-Index: AQHU6/or0jl+pKcIx0OGGfQgJSFtUKYvWcRQ
Date: Sat, 6 Apr 2019 16:51:03 +0000
Message-ID: <BYAPR02MB6005540B22A0BE6F3C33BD22B9520@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <cfd56541-43c4-5128-3d41-cddc356a3cb8@gmail.com>
	<CAMKF1sqftJeFBGrCyxdQQfNjGA3P16Uu2t+=W-gz-VJK4zUB5w@mail.gmail.com>
In-Reply-To: <CAMKF1sqftJeFBGrCyxdQQfNjGA3P16Uu2t+=W-gz-VJK4zUB5w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 383a4457-1482-4d4b-b4b1-08d6bab00e0f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR02MB5750; 
x-ms-traffictypediagnostic: BYAPR02MB5750:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR02MB57502FEA04F571C3D0267E5CB9520@BYAPR02MB5750.namprd02.prod.outlook.com>
x-forefront-prvs: 0999136621
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(366004)(396003)(346002)(136003)(39850400004)(13464003)(199004)(189003)(229853002)(8676002)(55016002)(54906003)(4326008)(106356001)(52536014)(256004)(110136005)(53936002)(6116002)(99286004)(3846002)(6506007)(305945005)(6436002)(9686003)(6246003)(66066001)(53546011)(6306002)(86362001)(105586002)(478600001)(71200400001)(71190400001)(316002)(2906002)(72206003)(14454004)(76176011)(97736004)(25786009)(966005)(33656002)(5660300002)(102836004)(11346002)(7736002)(476003)(26005)(81166006)(8936002)(74316002)(446003)(7696005)(186003)(486006)(81156014)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5750;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /8rr0b4bCW+uu4zGkRwgoatp4rkZkGeqUQht1YGgII5BIb/sCCfeFuO8yICfiYzjDYYLjLrM5mTF/jmFH1ZE/aHJZtAGCvUTP5EUHDZVlXwEL7Z+oeQwqIkFAapfH7rW7erE2l96091AZvOfcXBHDsRo0/9SgKQU3kDzCVH6mpEYJwE6Jmxy0H3dPae/FHlLVymE8HqM1+amEe3oPK35164JmyUnUawA2gBRrGJ9yjuG35Pzb84eQnq+OWZoItk7znMLCLK8XJVKrnpcW4X0l6e128C7QI+fZn6Vtj7c7Dl3/2pNZH/MkLF7buIVUo2Vltjl9CnHn4EQxgn+zOB+SDhTFY8zp97Zi7+WPFix0wx9M7b0IvrCJvIX/04bFZwmzv4RHXr05/+z5c6FaSlymvzv+ehIFPuti1sDgvKHrzE=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383a4457-1482-4d4b-b4b1-08d6bab00e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2019 16:51:03.1183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5750
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Worries kernels supported
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
X-List-Received-Date: Sat, 06 Apr 2019 16:51:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Khem Raj
> Sent: Friday, April 5, 2019 2:54 PM
> To: akuster808 <akuster808@gmail.com>
> Cc: yocto@yoctoproject.org; Patches and discussions about the oe-core lay=
er
> <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] Worries kernels supported
>=20
> On Thu, Apr 4, 2019 at 2:29 PM akuster808 <akuster808@gmail.com> wrote:
> >
> > Hello,
> >
> > I noticed there are 3 kernels in Warrior. 4.18, 4.19 an 5.0. Do we
> > really need 4.18?
> > I see its the default version for poky-tiny. 4.18 is EOL but
> > maintained by Windriver.
>=20
> I would prefer it to be 4.19 since thats at least LTS

I agree with Khem, keep 4.19 since it is LTS

>=20
> >
> > regards,
> > Armin
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

