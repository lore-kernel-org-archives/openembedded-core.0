Return-Path: <JAEWON@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750087.outbound.protection.outlook.com [40.107.75.87])
	by mail.openembedded.org (Postfix) with ESMTP id 22A8660685
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 23:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=eCJSoK2mr2S7G+F8UbJ8IB808oa9M7xqqr2ydrukQa0dm4r38sd81xsakaFvwjZSXnoQQSJ/udLbIS2m6uNG0G5PF0UqM1rIu5jqKDixfUSKCNIa9Xd6AjTTnRkg8KcI8b3estvXi3KRrnR4ZZJ1qUodknkmBrClLYBjLLzIWJ3x/5TXmTRpvVrfeGNMrqia8Z/MhW6sdVj+gWc4BFP4p08glsFUYvqb6e/NNY0YGcPO6j97ynVFBkNz7HiiheGiGJyIjlfxvjVPd6AwYSo1WCt106bekO92J6lJisz2f534Enas7I8wIWlSnPM3wMCKs5T5Me2yCLP1QzRkIZVF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rB9dLzetah2wfJng/kV1LK05nbCBE5ci+Rm7TltZ2xg=;
	b=BcZufeTRtV7UflLYhWir45erWUTdoBzfkhA9ajZI6JSlxqPZ3KFeTzy3bMy8+npto7P9WC2EJR2pA4HFzPRpAK1o/kPB+Q1ZTy4kUPZ3VNiEJqqYzwyXJN1L9C7Q0mqcfgReNtePy/B+89DGyFAe0sdSlM7QPV6St+ySZzd7Xsmora+ZgxeKAXIAe2RWATsas6CzL1ou9uZSpiN+xaijycyfC1SlVkGhiVWGQZEw/mrTn8ZO0NzvhvsgHTOtwEnOUfZP8QOvoK+Dz11AKJ8EnFqfs8FgjinojPB0/40ZBcAq/kNUip9n+0lyZ4dB0SfvxPvKxkObr3pCCBzgxr1F2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
	dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rB9dLzetah2wfJng/kV1LK05nbCBE5ci+Rm7TltZ2xg=;
	b=F9lSb5Jvr7MCW+Aw8oJWvW7G9Cn9vHpH7U9Qe7SBpm0GLYM2UuMUPMz7qo9J65r4R7P9mFWYsauzD0vr56HvJvaiaI4ijKG76vMTh3B74JKd9W/jMs+n/cYOD1ouiY99oOXvx1jhyq0odkxcpLh5q151LRgc5hUVTY9RUZSyqeQ=
Received: from BYAPR02MB5816.namprd02.prod.outlook.com (20.179.62.217) by
	BYAPR02MB4952.namprd02.prod.outlook.com (52.135.235.82) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.15; Wed, 2 Oct 2019 23:10:27 +0000
Received: from BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::8156:2fb5:9724:5120]) by
	BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::8156:2fb5:9724:5120%7]) with mapi id 15.20.2305.023;
	Wed, 2 Oct 2019 23:10:27 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: Jaewon Lee <JAEWON@xilinx.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul.eggleton@linux.intel.com"
	<paul.eggleton@linux.intel.com>, Manjukumar Harthikote Matha
	<MANJUKUM@xilinx.com>, Alejandro Enedino Hernandez Samaniego
	<alejandr@xilinx.com>
Thread-Topic: [OE-core][master][PATCH] standard.py: Not filtering devtool
	workspace for devtool finish
Thread-Index: AQHVb0hAmZ6ygbxDLUWNXMtBQvdZFqdIDpDQ
Date: Wed, 2 Oct 2019 23:10:27 +0000
Message-ID: <BYAPR02MB5816E371E89C380F99923768AF9C0@BYAPR02MB5816.namprd02.prod.outlook.com>
References: <1568938409-5070-1-git-send-email-jaewon.lee@xilinx.com>
In-Reply-To: <1568938409-5070-1-git-send-email-jaewon.lee@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5360c244-8060-42e6-d1e9-08d7478db66a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR02MB4952:|BYAPR02MB4952:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4952489518701549A6A40EE4AF9C0@BYAPR02MB4952.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(199004)(13464003)(189003)(26005)(81166006)(7696005)(229853002)(102836004)(6636002)(14454004)(6506007)(53546011)(2906002)(33656002)(76176011)(478600001)(81156014)(8676002)(7736002)(2501003)(316002)(25786009)(305945005)(52536014)(74316002)(476003)(11346002)(55016002)(446003)(256004)(5660300002)(14444005)(486006)(2201001)(9686003)(66066001)(66946007)(66446008)(186003)(6436002)(71190400001)(71200400001)(64756008)(86362001)(76116006)(99286004)(8936002)(66556008)(66476007)(3846002)(6246003)(6116002)(110136005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4952;
	H:BYAPR02MB5816.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y9y1QU/DzpAgYEbt7THnWZ0IePRLbzyEFa1Kkmy/WuhL3Vm6MVqxtZzwlrbrB+zJktN3n+HWzcF6dVyA3MXiSmEToE/rEIqCtf6R31xbuFBIv8IJUPDrqrWvpGHAwVklWdM0/LZqdZQQ1+66AG5OQdgwRHvjv5NvtprYd8GKlV1IMO3qfm51pxgZBIW78rYlK2J6c+dJBTBcLwdDKYaDrZQhcZUGahi/BntUZS4d6wDKlJL3/8qpZQoTUlgjHjBfl8QsPsXUWu4YMms8QowqA4/AzL7bHfMHLnXz10GELbdB/+hX1AI92MmTgKf6Ob0E1kLrBR9gYjKr4uo663ISBIqH/8nesmGT6eW9Zruxvunt47mEEjMlOautqdTa3Km8OuDZuOTSt28ySlvxxvHzHuRplSqC8aljGorE4rhKLkw=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5360c244-8060-42e6-d1e9-08d7478db66a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 23:10:27.1589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dCCJ/LcVYnW+Bwf2TWVIGc3J1k4Uaxh7yUdoyXvQ6b0h/NpQ4KXTEgDUnwLSsyyq5lkjRHcVuFJCgS8Y23TvxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4952
Subject: Re: [master][PATCH] standard.py: Not filtering devtool workspace for devtool finish
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
X-List-Received-Date: Wed, 02 Oct 2019 23:10:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Jaewon Lee <jaewon.lee@xilinx.com>
> Sent: Thursday, September 19, 2019 5:13 PM
> To: openembedded-core@lists.openembedded.org;
> paul.eggleton@linux.intel.com; Manjukumar Harthikote Matha
> <MANJUKUM@xilinx.com>; Alejandro Enedino Hernandez Samaniego
> <alejandr@xilinx.com>
> Cc: Jaewon Lee <JAEWON@xilinx.com>
> Subject: [OE-core][master][PATCH] standard.py: Not filtering devtool
> workspace for devtool finish
>=20
> All devtool commands right now are filtering out the devtool workspace
> bbappends in build/workspace/appends when calling parse_recipe. While
> this may make sense for devtool add and modify, we need devtool finish to
> include those appends.
>=20
> A specific breakage that is caused because devtool finish filters devtool
> appends is the cmake/cml1 flow where a file is created in the WORKDIR tha=
t
> finish needs access to, to commit those files. Particularly for git packa=
ges with
> SRCPV in PV, SRCPV is only changed to 999 when using external source,
> hence when creating the cfg or cmake config files using for instance bitb=
ake -
> c diffconfig, these files are created in the
> git999 workdir correctly (as in the devtool bbapends, we are inheriting
> externalsrc class). But when devtool finish is run, the devtool appends a=
re
> not parsed, hence SRCPV is not changed to 999 and devtool is looking for =
the
> fragment files in the wrong WORKDIR.
>=20
> Changing the parse_recipe call just in devtool finish to not filter out t=
he
> devtool workspace.
>=20
> Fixes [YOCTO #13533]
>=20
> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> ---
>  scripts/lib/devtool/standard.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index 9eeaefb..e87b433 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -2011,7 +2011,7 @@ def finish(args, config, basepath, workspace):
>      no_clean =3D False
>      tinfoil =3D setup_tinfoil(basepath=3Dbasepath, tracking=3DTrue)
>      try:
> -        rd =3D parse_recipe(config, tinfoil, args.recipename, True)
> +        rd =3D parse_recipe(config, tinfoil, args.recipename, True,
> + False)
>          if not rd:
>              return 1
>=20
> --
> 2.7.4


