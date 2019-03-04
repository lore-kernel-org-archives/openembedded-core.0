Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 39649 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Mar 2019 12:18:11 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
	by mail.openembedded.org (Postfix) with ESMTP id A18F17C6A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 12:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4AWotAQi5wXF4oCkcrrk9np6xEZYjhcaLhsrbySruec=;
	b=2BuklbrFA6+Mf9qyh3AWnB9lF12/Jaun1bmnctCshkTrkANAT1SuCcfM0KlQD+6nYQBDwdyAV3Osf+LjeG7pGLr2hCm8tisYYYl/QD1pjlStHs7yfw9rPqB6aX9rPXdyFrjP583UYHdSt3e8U2j3mGi1yjNkJEUWOLXmWWcdEAE=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYAPR02MB4614.namprd02.prod.outlook.com (52.135.239.217) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.19; Mon, 4 Mar 2019 23:27:12 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::618e:ed5f:30ab:ad8b]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::618e:ed5f:30ab:ad8b%3]) with mapi id 15.20.1665.019;
	Mon, 4 Mar 2019 23:27:12 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Chandana Kalluri
	<ckalluri@xilinx.com>
Thread-Topic: [OE-core] [OE-Core][master][PATCH] standard.py: Provide an
	additional option for devtool reset
Thread-Index: AQHUv4gvHzgAkZBwCEGk7PW5g1KDPKX8D3GAgAA0IPA=
Date: Mon, 4 Mar 2019 23:27:11 +0000
Message-ID: <BYAPR02MB6005C04842C60A8C3A4DDF26B9710@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
	<3413405.x9v3DxCAyA@localhost.localdomain>
In-Reply-To: <3413405.x9v3DxCAyA@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 668ff3e0-d111-4865-4a92-08d6a0f8ee43
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR02MB4614; 
X-MS-TrafficTypeDiagnostic: BYAPR02MB4614:|BYAPR02MB4614:|BYAPR02MB4614:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; BYAPR02MB4614;
	23:BN3WVVuGextIS1cn4zAOMZVSOTZrckFZf7FBNGyFl?=
	=?us-ascii?Q?EU7Jl30i1qBUvVwMeO0jDdqU8/91tkxRq54Pu8fDp/jCLbgAao0v4Rz13PpW?=
	=?us-ascii?Q?Oqhazj61ARzIo7w6S9ihJF4EJP+Ac0PDN8wzXiYLYdhgAZP0EJfJBfYeJEza?=
	=?us-ascii?Q?RDYvnvOlfgPR6NG0CNW+74t3eoXRfl8jEhIhu70RBybXVM4FIboibaM2Fzl1?=
	=?us-ascii?Q?K+bnYIlRUKuyFd9jDKqzgjg2AROFrPMtC+05P+RuUuvTtmTl9trMmIhvCsPI?=
	=?us-ascii?Q?5EbLTaLDbP1R6kP6LPg1PxIIRnC+ZElcP5Xs7DIU8VWeqDs/A8//ZaJ1mril?=
	=?us-ascii?Q?EU2LO+OEd7N5KhEmyydrMhpeHAmeypR1x806/XBOPruBKFKvSRW9HbzrngT+?=
	=?us-ascii?Q?xUncKGH7gjVxuEaPiVxAI3bWLEZhWFfuzd3Nnv+DyqTmv5SKdVLi3AEDZWG4?=
	=?us-ascii?Q?wxWshESP/Dn+b9SDyijdjlcV3mwd9jwtRKgRT1JkkRzZBAyLuj83fSI0iaEn?=
	=?us-ascii?Q?7/gQY/NhjtcA5Y7ZBgYOsu8dpLaZcJv4f5/U/bBzYQKiJP9U4jWx9fvqEtSC?=
	=?us-ascii?Q?xYIl7WpmohKxJuP8TSLQ0jOQD8d5nDHq7+hObe0bOltIdt1fHfM9aQHlbcH2?=
	=?us-ascii?Q?1YkJPB6HO0/IC5cQIe9HaLUUdRIa11IjtwR1YgqPDD9UPhvvWciEUW4WKDNn?=
	=?us-ascii?Q?kbee/SO2oaL78TVBYou/br4aWS1UoeqxVFvHmDq/lcW1nBKRZfTbjPeMr3C8?=
	=?us-ascii?Q?bKPxxeDHnLl9qoe/YzzXKsxcOluiKBuDg5y1bVxNytUwYGEseHOj4i3CzvMp?=
	=?us-ascii?Q?A6t6YIaOLWkS2bzCzOjXAglxDhp26JtK/PmgVLoIVoWhLh7dYvZtKLd1mg6D?=
	=?us-ascii?Q?21Mf+snmiyFmQdQ/Z3SxFFH+1B92MPre67VTXwZ8Q7qlyXqgcuDQ8EokZBaX?=
	=?us-ascii?Q?dL0BOrMP5JOdj0xP/5j3piajnlEnr61HEG4NLVjCsrhyCefSljsd8DXv6It+?=
	=?us-ascii?Q?tJbnGp6CGdNIY2RwtcHOlI4GwAB9Rp6uPmIgN5kOpGQmLjxB5Z1/jPTgXKIb?=
	=?us-ascii?Q?0Bd1AbSzOSvRBQg9Oz9DSocQQePKctl2gOKMbRq3N2eECIYLx1VGsPXQG6im?=
	=?us-ascii?Q?GcTDNIikMrMc1cYVeDnUKtk43BejXUmTuMGish8jlwrVTsqjelYZ1qixOQy9?=
	=?us-ascii?Q?AqbgLX6mx+HXddzWjveQ3skLNWKNUZhTM3YbSoNsFFQ9DG3z6odB8r224FQi?=
	=?us-ascii?Q?gLubL+xv2llIt7y5OkdNA1SjNsFxS1PBghrAwtl?=
x-microsoft-antispam-prvs: <BYAPR02MB4614AB5210425BA9BC60E536B9710@BYAPR02MB4614.namprd02.prod.outlook.com>
x-forefront-prvs: 09669DB681
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(39860400002)(346002)(376002)(136003)(13464003)(189003)(199004)(6636002)(9686003)(11346002)(486006)(81166006)(2906002)(105586002)(305945005)(81156014)(256004)(106356001)(71200400001)(55016002)(86362001)(7696005)(72206003)(99286004)(76176011)(14444005)(8936002)(7736002)(74316002)(66066001)(6246003)(71190400001)(476003)(53936002)(316002)(33656002)(229853002)(2501003)(186003)(6506007)(68736007)(53546011)(6436002)(14454004)(5660300002)(26005)(102836004)(110136005)(97736004)(478600001)(52536013)(6116002)(3846002)(25786009)(446003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4614;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9wDMKcwttcT2tUE83wMoeAtWOatSdPsDohFTRBhZ9GyBAc6l/2VPMaKXI6EA0SXK0NChzYqlehRzANPqj2PBvzR4LNFJGQsyNI/Jc1rzyxtVMF9lZ6V0Tl4MvNLWqGEbq3VRPCZoo3SyzUvkedeWK0aecR0Jdq1K+9d5mbWNCt32hZR3CmwfxARFF2mIkzZyRvjC8NptbE/1B3AJz95oKSDe18uv3RdRq+Q4RlsvTnOcYApEQLwCjFvBvECGwPtO/w6LFgbvLgOxBMq+IOaSaeCJdQZpg9Mkn2ock1Erdp6pKhCUuYkJcFNfe0bDrTladcB/eablbrUFquOn+ngsmY9fkXNzHJt50Vtkgn6oJLCrqZwGc3ob4YweIxAVNDZvfrEmkWOY+cvNnM1aA0+ws9ObxxpTMNvLXHBCu48JrfY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 668ff3e0-d111-4865-4a92-08d6a0f8ee43
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2019 23:27:12.7333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4614
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4614;
	23:Q98cNTkbgTkD5OTlTJCm+pRQVq3HTVdLsxRw0Jk9YmMI+8Gemtuk+QgkfoWNvj/mHjAzj5x1OdjhCDJybuM/sCW3PvNqPB8WTP7vFLxI063LP+geB52iMaoSI9ZQErOYJVJ64SHWRENdu6dhdcn5qw==
X-OriginatorOrg: xilinx.com
Subject: Re: [master][PATCH] standard.py: Provide an	additional option for devtool reset
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
X-List-Received-Date: Tue, 05 Mar 2019 12:18:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Pa=
ul
> Eggleton
> Sent: Monday, March 04, 2019 12:17 PM
> To: openembedded-core@lists.openembedded.org; Chandana Kalluri
> <ckalluri@xilinx.com>
> Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Provide an a=
dditional
> option for devtool reset
>=20
> On Friday, 8 February 2019 2:57:32 PM NZDT Sai Hari Chandana Kalluri wrot=
e:
> > The devtool reset command cleans the sysroot for a recipe in workspace.
> > It also removes the append file but leaves the source code as in
> > workspace. The source is not cleaned intentionally and the user has to
> > manually remove it before calling devtool modify again.
> >
> > Provide the user with an option to remove the source code from
> > workspace by adding a flag to the devtool reset command. The
> > --rm-source option for the devtool reset command will also clean the
> > source code from the workspace along with the sysroot and the append fi=
le.
> > Ex: devtool reset --rm-source zip or devtool reset -r zip
>=20
> When I wrote this I made a conscious decision not to delete the source, i=
n case the
> user has unsaved work in the source tree; at least then the user has to t=
ake an
> explicit step (an additional rm -rf) in order to delete it. You might arg=
ue that adding
> an option is the same as that explicit step, but I am still hesitant as y=
ou might for
> example pick a previously used command from your command history with -r =
in it
> and only realise after you've run it that you've just blown away a bunch =
of your
> work.
>=20
> However, I have received the feedback from a number of people that they f=
ind it
> annoying that they have to delete the source themselves before being able=
 to run
> devtool on the recipe again. I'd like to hear from the wider community on=
 the
> following two questions:
>=20
> 1) Does the convenience of having this kind of option outweigh the potent=
ial danger
> of deleting unsaved work?
>=20
> 2) Are there issues that anyone is experiencing that force you to run dev=
tool
> clean/finish and then re-run devtool modify (or add, or upgrade), making =
this kind of
> situation come up more frequently? Or is it mostly that the source direct=
ories end up
> being left around to stumble over some time later?

We have seen source directories end up being left around (taking more disk =
space on certain projects), hence a solution to remove it might be optimal.=
 If the preference is not have "-r" option to avoid command history mistake=
, then a full command like devtool reset --rm-source is acceptable as well

Thanks,
Manju

<...>

