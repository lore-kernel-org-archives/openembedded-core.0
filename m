Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 43432 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Mar 2019 09:57:03 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740075.outbound.protection.outlook.com [40.107.74.75])
	by mail.openembedded.org (Postfix) with ESMTP id A37937C723
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=68yPkZ3/+Ef3BJS+wAvVPlXS5rRiz1sx1+K7RXPw2Zs=;
	b=TUJ+Hxeo6uGRlCGWREkUr0VOtSIzf9HRcJleLZTgoYUMrHhG4DhfuDbRJw+FHYi85OsCvT0xEj21G3SYk/E34wijTf5TnYtofqAgpIQh04wb5AneKolVp71CuGGgqh0w2s1xzMABwwr6kWLa+Qnzzd6i8Ysr0D0+Td4Gxc/dUcc=
Received: from MWHPR02MB2576.namprd02.prod.outlook.com (10.168.205.142) by
	MWHPR02MB2607.namprd02.prod.outlook.com (10.168.205.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.19; Mon, 11 Mar 2019 21:23:11 +0000
Received: from MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::1507:8ac:7899:47b2]) by MWHPR02MB2576.namprd02.prod.outlook.com
	([fe80::1507:8ac:7899:47b2%7]) with mapi id 15.20.1686.021;
	Mon, 11 Mar 2019 21:23:11 +0000
From: Chandana Kalluri <ckalluri@xilinx.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [OE-Core][master][PATCH] standard.py: Provide an
	additional option for devtool reset
Thread-Index: AQHUv1G3qeRqlEgPGEyIFOL8lvD5hKX8D96AgAsR9KA=
Date: Mon, 11 Mar 2019 21:23:10 +0000
Message-ID: <MWHPR02MB2576097F9990A1B4FEC6977AB0480@MWHPR02MB2576.namprd02.prod.outlook.com>
References: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
	<3413405.x9v3DxCAyA@localhost.localdomain>
In-Reply-To: <3413405.x9v3DxCAyA@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ckalluri@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8831e52-9dff-4323-cd54-08d6a667c371
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB2607; 
x-ms-traffictypediagnostic: MWHPR02MB2607:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; MWHPR02MB2607;
	23:tFD1Bq1Cc33uVPIyxAXcxoFE/Xy2kCgZud60cW+l7?=
	=?us-ascii?Q?ilfPpgdQiPIuhOLtm+ifGJrb3X5I/b9t8c5wGWS2e1eN063nqT4TtES6t2Aa?=
	=?us-ascii?Q?agLviEC9FB0OVHoGq+SLdUEVqGOn0I2qz+t6ehuc0/pCush1++gE1EytyXx9?=
	=?us-ascii?Q?QCH+3aVDarVn9yBnCeJ68mxscF559vnpIIxmbXkdFp5/uQOIoYshwbjNciYq?=
	=?us-ascii?Q?J/I8/LkkH/Y41qgFNlM6/K0y3q4JOKbEZJU9B1nTtXsBLiMM86UjBJ8PYYHD?=
	=?us-ascii?Q?matJiC4ybrUWImqA8GFV5KYDP5iRMwV4Zj0i+n999vPFCCO0JU93F2m5p4D7?=
	=?us-ascii?Q?+7Qw68N+ZndPS1Ijn3QUmJX8+mhW4HnkCFYSmxtdo+zln7A2So/JWg5mthiB?=
	=?us-ascii?Q?lfekBW9fT4vDqJARSkBCr6OnSz0gZR+2kRvi235HFqVVUNZTkufFybU0g0xC?=
	=?us-ascii?Q?gFLp33XGX8JyrjUpIou4q2LBkM030cT6Q3NWpWIL5Hk/D/nb9N7N4mFxsfpM?=
	=?us-ascii?Q?hY8Sdd3qwIcYJWnTyiItajUz3uL50dqJwdJD73KWsDrVjNPoPTKEOW7UAEvg?=
	=?us-ascii?Q?zyQdkE6LVoEypG6zyXH0XHKkyQ6+d78Hkbu5zICxhO36wHB8fsmAUhENWfHC?=
	=?us-ascii?Q?2d5sDA0HC4Ml5ISly7sLn8oHmnm9GvKtsWJVLYzhD9QBnzrq2z3FhTCpl2al?=
	=?us-ascii?Q?jdpNn4C4cb3X7zCF7er/REtDYjuhJXnUbYTS+/k7VRPI4kOOLVFVfvYjUusr?=
	=?us-ascii?Q?jcjcWAVbYs8adusrnncej41Y+tX/t90AAR+/BB+mvcgK/tMAigleVnVHYrUY?=
	=?us-ascii?Q?ogEv9W07+QxeN5jioudso8aWzvSbg8Kt9akhOR9gt0rcS5e/vbQB9UdTXRqN?=
	=?us-ascii?Q?UYx/UXWf7buSztP9vRQju1/ppPEZDnmkgSnp+fP1F/SLOUDoSxYVZODd+FFr?=
	=?us-ascii?Q?u90dw4eQqHzPsv/amCT7NjAPxoJXJMehqa//v+3hDidjo/prt4W8n2w/DVPN?=
	=?us-ascii?Q?SvDltXLGLUQzIrQXuHXl2x7LMudfsz9A3GCLe0cXykJhou1c0fOtPo1wlz3K?=
	=?us-ascii?Q?iM+9uUhj7GSyscTlCtGprPUYTtHqK5PdeTg1Ln8wndNfwjf15qslRvvQmvD/?=
	=?us-ascii?Q?PJLH2EBOzf2sFTG+g9xkMt4RaGOYTtcje8Wn1LtyIVnaY2lMLJEe93FUe6PZ?=
	=?us-ascii?Q?URIubQopv472VqmXocZNx+rgTRhOTYbRMz7TJpX51RCyl9qhmMvSC4R2CKMP?=
	=?us-ascii?Q?w3H6e2jo8vj94sKSxY=3D?=
x-microsoft-antispam-prvs: <MWHPR02MB26076C19A73F50D4B2DFA9FBB0480@MWHPR02MB2607.namprd02.prod.outlook.com>
x-forefront-prvs: 09730BD177
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(366004)(136003)(396003)(346002)(13464003)(199004)(189003)(2906002)(4326008)(53546011)(256004)(86362001)(66066001)(99286004)(14444005)(71200400001)(71190400001)(229853002)(33656002)(3846002)(6506007)(6116002)(7696005)(76176011)(102836004)(97736004)(25786009)(68736007)(105586002)(106356001)(14454004)(7736002)(478600001)(8936002)(11346002)(305945005)(81166006)(8676002)(81156014)(26005)(476003)(446003)(6246003)(55016002)(74316002)(186003)(53936002)(6916009)(52536013)(6436002)(316002)(5660300002)(486006)(9686003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2607;
	H:MWHPR02MB2576.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EXqHDsoqxwEVP4jctIIwOaH6nIDbADGEjp+aAtlyfOFmMCjMNrf3PmXjW2rK//Lhom2qmqhY+KMV8HRa3GiuDISNszMy9hbbPkpbNzVaBqlA6+//DhBbUiyTBO85XTRp+7ck0CV37uvKW3cilXjvYRCU4slwanj0/I+G4euPxJCjGxxnpgG7QmsqwCDUGOBGOd0Nfs17cNPvQ72Ej45WSmYCple+Xz8r0jZP6OvsSqp4n1Sa6S2+J3WEFKaeUUGOhHCbOe8bHLfRnE9H1zLnensyByu3J9R/Af/Y/vGkGsYYTiVEMasyoLJHPBDRhw0/nkzBeWUpUnACADYX5QmGX6D+xLQlOH/DxLlMgw6ec1T7hIeP6eT5yWqvwexSg7vAxtV1fxckuzDJ0RrGeJ7LS/55VPLIPxk8LPPt+bh7qT4=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8831e52-9dff-4323-cd54-08d6a667c371
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2019 21:23:10.9560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2607
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] standard.py: Provide an additional option for devtool reset
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
X-List-Received-Date: Tue, 12 Mar 2019 09:57:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

For me this was more useful for second scenario where I had to run devtool =
finish and re run devtool modify.=20
This makes it easier to test changes or add new feature to devtool add/modi=
fy/ commands.=20

Thanks,
Chandana

-----Original Message-----
From: Paul Eggleton <paul.eggleton@linux.intel.com>=20
Sent: Monday, March 4, 2019 12:17 PM
To: openembedded-core@lists.openembedded.org; Chandana Kalluri <ckalluri@xi=
linx.com>
Subject: Re: [OE-core] [OE-Core][master][PATCH] standard.py: Provide an add=
itional option for devtool reset

On Friday, 8 February 2019 2:57:32 PM NZDT Sai Hari Chandana Kalluri wrote:
> The devtool reset command cleans the sysroot for a recipe in workspace.
> It also removes the append file but leaves the source code as in=20
> workspace. The source is not cleaned intentionally and the user has to=20
> manually remove it before calling devtool modify again.
>=20
> Provide the user with an option to remove the source code from=20
> workspace by adding a flag to the devtool reset command. The=20
> --rm-source option for the devtool reset command will also clean the=20
> source code from the workspace along with the sysroot and the append file=
.
> Ex: devtool reset --rm-source zip or devtool reset -r zip

When I wrote this I made a conscious decision not to delete the source, in =
case the user has unsaved work in the source tree; at least then the user h=
as to take an explicit step (an additional rm -rf) in order to delete it. Y=
ou might argue that adding an option is the same as that explicit step, but=
 I am still hesitant as you might for example pick a previously used comman=
d from your command history with -r in it and only realise after you've run=
 it that you've just blown away a bunch of your work.

However, I have received the feedback from a number of people that they fin=
d it annoying that they have to delete the source themselves before being a=
ble to run devtool on the recipe again. I'd like to hear from the wider com=
munity on the following two questions:

1) Does the convenience of having this kind of option outweigh the potentia=
l danger of deleting unsaved work?

2) Are there issues that anyone is experiencing that force you to run devto=
ol clean/finish and then re-run devtool modify (or add, or upgrade), making=
 this kind of situation come up more frequently? Or is it mostly that the s=
ource directories end up being left around to stumble over some time later?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre



