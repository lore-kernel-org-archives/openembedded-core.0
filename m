Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.47])
 by mx.groups.io with SMTP id smtpd.web08.23205.1617030276637762897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 08:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=aYXxqOut;
 spf=pass (domain: kpit.com, ip: 40.107.138.47, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYkTwtzNH3ZguDa6CDIhtgZauyGEwnBQiV3dpSWrWIQ//RXE9ATEzq/Ub0IYYhdOaSfg46AtGcDOAbRTt0q5+A1HGX9g4CWbxE5JtPjQH0dGIBl92XEH/WHI2k+cA08lItbDt76B310gIfEc8g56aYLhf+ppCO/0bdaI2CO8+tf3C2gTu5viBS6h7FR89HENfO3oIfCu+UdEyEP+rg6bcPvkN+G227/7ujC7Rcv9BzRn1FhyNMDAn+NOdieNvVNeJlohH2/xHjnYk3YDtchrlC8WilrlqUWjwkVKZcTv4rk3JKqR4KsGR6ihWyUdwZwP/lOJWv50bJ/r7Ai4Ua3qyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Odlr+cjj9xeUS0UpHdM0NmrZEkY44OS+cPzH2Rlgr58=;
 b=RFjGnvnuAglDqETP3mkKmA7CBS9ZFLaE7vrirRloYnle4htucQ/IDkVkd+kCyp2/0ZfRf6Fcmb6nTFcrDHF7FgcNdfeUa+m15D/HbS3gxfiSQ8Eb0fGdPh3hgUejVMf0wrV9ajrNONRGQDqBfuvYHzrEDjE0b/YJTLWz/MWpCVsxNaKZBu/lMKbu1brfFOV0sG/Bt2H7RYmx+HVjVI4OiORR696gt1P0sWdPCKNV0eBwMOhY6zniUhqStWlrRxi+ZD65m8nBwAP0/RX3d/5UoXK65rTuYWPvnguQqPCLW877QwcxYGUdc/RJo5MPDkuLnlQdDz6TtaG/ZOQ6YCmC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Odlr+cjj9xeUS0UpHdM0NmrZEkY44OS+cPzH2Rlgr58=;
 b=aYXxqOutmIqgaA+aXF0RcKVfPYTbwY65fePMmpoKP7FJSklZvrEZ20SkjSSAhq/zddjIx3IOxN/7YOdxvP12KM/TiPYnLBjTp0wJyoeEs3eq8EZEnU/LtpLYoc/kvO32yt9mG+R4EP2nitB71RjtarBsN4plem9jrw6l85AxTY0=
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR0101MB1475.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:20::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Mon, 29 Mar
 2021 15:04:25 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 15:04:25 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Nisha Parrakat
	<Nisha.Parrakat@kpit.com>
Subject: Re: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
Thread-Topic: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
Thread-Index: AQHXJKnIgakeZrXtB0uBtySNYELsNqqbC/WAgAACe7Y=
Date: Mon, 29 Mar 2021 15:04:25 +0000
Message-ID: 
 <BMXPR01MB235831D5134C15F33350AD479F7E9@BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <1617028952-12188-1-git-send-email-Neetika.Singh@kpit.com>,<CAMKF1spvzo5LyO1a1kO2vrT-uUiXHM+ZGHffKC0AJhubQ2=c8Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spvzo5LyO1a1kO2vrT-uUiXHM+ZGHffKC0AJhubQ2=c8Q@mail.gmail.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2409:4053:2e83:3ab9:7daf:a153:a495:7080]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c3d18456-0001-4f6b-0e4f-08d8f2c3f189
x-ms-traffictypediagnostic: BM1PR0101MB1475:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR0101MB1475D930CE8D1CDCD7F6C64D9F7E9@BM1PR0101MB1475.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jEMQDEqrY3G34YwEE/yyHECZPCK46fZLFGVeWnWOMuZePlfXxQScAKeOArjRhR4IrjK7HZeqBxerZeen2Enn5jSrDdXp6qRs6ZS0Rx/x60xEVqHQVQPxjCDZDoe3y8msSsgqWZkxMAifdJ2a9e9Oj1Wanmo6pattp3i8FyCR6aPRzRcBI6AnUXgYn9u5Vdwh4pn0gkFm9ewJkgbibORsxws7vWQtp/OCY625Uj1lo7PKJVWYGnsKpGuBeHpyDSwZZNDZ7w3XQwxwX2axFlb5LAPaToe0j3MNi1tMVULqQSn+dq4JuPxBZQjmPvSCSz638n3yT3uYWKMt28Hc67qV9tHRKqQp+wFyiY2SrNFu+32/WcnMxRIWqAFm1Gzn3xageF6fseyTHGuZvDntNjf6+Wk25kSc3GfcqSY5TpPkQqXnW8raowKXhGq0GWOg++ZosSMzDtFK0B8ZFerRMToheTWCGH5k21IhTQBMbCLK+cfhc1+rB/pr22jM9vpKykKOT7C65W7n7bLfulBPsd5z0h8LQRMcYyO4P15r4R5qXg62DFqL+AJFgcJ5pcnLT/92XdnmAzf/gNkR9RukujNtpuglU+w1hFxbRV4uKpiVXycg/1eM1PmJ8HvC1bv/9GAz+/HPHfmWuzFDRxvvSi7PLUFEM1X5gdLZUhKgGKh9uf40b1Kqg6I5drxhKPP9lPPq/rthAw6otvMoqnw38PfO8VJJv+ForjavHTGVwwaklTNS5rpQGg5RdIWJhszFcYpvLyjzxnpphzXruZ/PCzRoNA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39850400004)(19627405001)(86362001)(8676002)(66476007)(6506007)(8936002)(2906002)(38100700001)(7696005)(55016002)(71200400001)(66446008)(52536014)(9686003)(186003)(5660300002)(107886003)(966005)(76116006)(66556008)(4326008)(30864003)(478600001)(33656002)(66574015)(53546011)(83380400001)(6916009)(64756008)(166002)(45080400002)(66946007)(54906003)(18265965003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?GbL/rHz01YwZ1Q49nPSp5qThiC8VfeLjriWPx0lvbt9SQPkcluR1+ZuVM+Ts?=
 =?us-ascii?Q?ctjBFSwy2uGj/47bzJQAiiz14zcDWwOuwIlJHdiCWnbteDpIDRAJE83yMiT5?=
 =?us-ascii?Q?DJWwxkVqOmwaaBKlFXJ9ReZpVhNlgzWd/hyNpXaMEow04txHygOjLbBm55ox?=
 =?us-ascii?Q?UDZ1ICrf9nbAp+6/xz+KR9JLbV9AoyfbycKXk36owwpb92UWeWw8tGNx5tM5?=
 =?us-ascii?Q?Ef9Ee+ZiONUOrRsqbDgVfu6sHfsaxqzLDNbwsSx1XUMn7sDTSWQbcxtKuDc2?=
 =?us-ascii?Q?QlVXPXO6bPdxF7+8yPoeBAc0dnl3bz3ssRI+C2PrkDzAX2LqvwEDIV7zqVRa?=
 =?us-ascii?Q?9uxdDNiZB/1Dvwuh2m+mWUftbzUD6D5Y+gD0RUIHZYt4u3kMIOEmpvy3oclk?=
 =?us-ascii?Q?uOHBEWO0zE0cDq9AKx5MY+cXa1wu/9kMX2PiL2I3e8SSu+CnkNB13jUMpF33?=
 =?us-ascii?Q?lTARokd4hw2k7WfRjcqS3S/DiCC0Z4YdF8B/DTVMM5rNO0uowMP+w+YYHAaU?=
 =?us-ascii?Q?sqT5i2sQN0UVu42saKvKEQ64KbnlOvP1eINRyM0mTENS6rcZ1sOD+tv1R5eC?=
 =?us-ascii?Q?oHs/xDmAyjMZultuzziumBX5i//4ZqxqDi1h36Wn8uu3H4TkMAiCpIi1aey7?=
 =?us-ascii?Q?14pkciwhgJkxhZfKBbnegTyVIhITFzYHU4pnqLYRbwllzmw+kPCfKDSKp0qX?=
 =?us-ascii?Q?fPYjqWjSSYBBlGf3f2eVwUSG2AkILVL18+RXatNUQTbAmsvM00jp6fsxXRD/?=
 =?us-ascii?Q?vWHwHqfS9SaDc9CPQHEzEur7MwqtIulAilGJ4gFemIxcu91Cn7hA1CNq79PF?=
 =?us-ascii?Q?7I3d9/kBpeQUhxvV7eDDAY1P4lleqYhFV/2JRpcZvdD7ZTHniibcrvZU3cd+?=
 =?us-ascii?Q?4UOCtx385mdQiFlnB8zHJ9gZ+Cw+OCBOl4XG86P1Wk/1PJCDPytsO8llSJ3f?=
 =?us-ascii?Q?G5zqyuG3Qf6E2Fxk3ugBYoairuT50vsHByJEDx0ZOO+8f415yQIlrbh/NYMn?=
 =?us-ascii?Q?EhGSVIejgxOgFmTmiq+ZsJXdHU09x1QSoKtywHVOfA/IBMsKrlWaWNPgMdb5?=
 =?us-ascii?Q?JCo/dyWJdzIq5jmElBuyXdfhBdPpLwRMNnlIgb8gUwq1R1nJeJ9h2eqgLmpo?=
 =?us-ascii?Q?dFrGcZ13LI/itmg6J5MmzpkEQeO0JmaNnppB5Yz88PUaOKvfqJ9kEN8OSOsf?=
 =?us-ascii?Q?pIE3UMca8LGCwY86f7MmlW1tu+i0p9CVNxXdjrKBJkcKxK5BilFP22C6Uqjj?=
 =?us-ascii?Q?jdo2xn5CSiDfI90AxGjttUsqAH8xndZsfsFdY6DT/wUj2wN6I3H5zYcQJX9o?=
 =?us-ascii?Q?IB3SMHL+iCXWGIRHZLLDIJp308AaWD6u+XmYkHpp6td4XO7WYi0NW4gYrlFc?=
 =?us-ascii?Q?A7MiPB4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d18456-0001-4f6b-0e4f-08d8f2c3f189
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 15:04:25.1634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74BPDIhsgSt2k70pi1oGgSZ0Vmg/mFjGsjQYKfx86WTwXwlnKDYBB/OpCgO0i2KM1YL8518qIq6ycv2ShjDBHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1475
Content-Language: en-IN
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB235831D5134C15F33350AD479F7E9BMXPR01MB2358INDP_"

--_000_BMXPR01MB235831D5134C15F33350AD479F7E9BMXPR01MB2358INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Raj,

I have verified locally and these changes are showing to me as up to date o=
n latest oe-core master branch.

git log origin/master..HEAD
commit 1abebf8d3ce044609ae29d7dee7a9b268e510ebd
Author: Neetika Singh <Neetika.Singh@kpit.com>
Date:   Fri Nov 20 18:35:15 2020 +0530

    libcroco: Add fix for CVE-2020-12825

    Added refreshed patch for CVE issue CVE-2020-12825
    Link: https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f790808=
63dda61593003b4c31f25

    Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>


 Thanks & Regards,
 Neetika Singh
 Product Engineering Services (PES)
 KPIT Technologies Limited


________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: 29 March 2021 20:18
To: Neetika Singh <Neetika.Singh@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@list=
s.openembedded.org>; Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825

On Mon, Mar 29, 2021 at 7:42 AM Neetika.Singh <Neetika.Singh@kpit.com> wrot=
e:
>
> From: Neetika Singh <Neetika.Singh@kpit.com>
>
> Added refreshed patch for CVE issue CVE-2020-12825
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgitlab.com%2Finkscape%2Finkscape%2F-%2Fcommit%2F203d62efefe6f79080863dda61=
593003b4c31f25&amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d=
4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261=
735464157%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DOkTKj7JQfH35aD1GkovrszMEQxQVkA=
TiTjdo6VpiCEk%3D&amp;reserved=3D0
>
> Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
> ---
>  .../libcroco/libcroco/CVE-2020-12825.patch         | 192 +++++++++++++++=
++++++
>  meta/recipes-support/libcroco/libcroco_0.6.13.bb   |  22 +++
>  2 files changed, 214 insertions(+)
>  create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825=
.patch
>  create mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb

libcroco is already there in oe-core, perhaps you can rebase this
patch on top of latest oe-core master branch and resend.

>
> diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch =
b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> new file mode 100644
> index 0000000..f813ded
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> @@ -0,0 +1,192 @@
> +From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@gnome.org>
> +Date: Thu, 13 Aug 2020 20:03:05 -0500
> +Subject: [PATCH] libcroco parser: limit recursion in block and any produ=
ctions
> +
> +If we don't have any limits, we can recurse forever and overflow the
> +stack.
> +
> +This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_core
> +in cr-parser.c.
> +
> +Bug: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgitlab.gnome.org%2FArchive%2Flibcroco%2F-%2Fissues%2F8&amp;data=3D04%7C01%=
7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637526261735464157%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3D1JQbRwD7xiTrBT1%2F9Kx8Nop84lOd3JT5ImU7eOYAfiU%3D&amp;reserved=3D=
0
> +Patch from https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgitlab.gnome.org%2FArchive%2Flibcroco%2F-%2Fmerge_requests%2F5&amp;d=
ata=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822=
%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;sdata=3D7jcaMq8meYRVhbA4o%2BN0XZZ1Hxz0jxqg31jxZUVHIV4%3D&a=
mp;reserved=3D0
> +
> +CVE: CVE-2020-12825
> +Upstream Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgitlab.com%2Finkscape%2Finkscape%2F-%2Fcommit%2F203d=
62efefe6f79080863dda61593003b4c31f25.patch&amp;data=3D04%7C01%7CNeetika.Sin=
gh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DHF=
%2FyBXMAOe4xpTBIMhyc25pEPaLSc2buc4ho910zbxk%3D&amp;reserved=3D0]
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + src/cr-parser.c | 44 ++++++++++++++++++++-----------
> + 1 file changed, 29 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/cr-parser.c b/src/cr-parser.c
> +index d85e71f0fc..cd7b6ebd4a 100644
> +--- a/src/cr-parser.c
> ++++ b/src/cr-parser.c
> +@@ -136,6 +136,8 @@ struct _CRParserPriv {
> +
> + #define CHARS_TAB_SIZE 12
> +
> ++#define RECURSIVE_CALLERS_LIMIT 100
> ++
> + /**
> +  * IS_NUM:
> +  *@a_char: the char to test.
> +@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_core =
(CRParser * a_this);
> +
> + static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_thi=
s);
> +
> +-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
> ++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
> ++                                               guint      n_calls);
> +
> +-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
> ++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
> ++                                                 guint      n_calls);
> +
> + static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
> +
> +@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +         cr_parser_try_to_skip_spaces_and_comments (a_this);
> +
> +         do {
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +         } while (status =3D=3D CR_OK);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
> +@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
> +                                       token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status,
> +                                       FALSE);
> +                 goto done;
> +@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
> +
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +-        status =3D cr_parser_parse_any_core (a_this);
> ++        status =3D cr_parser_parse_any_core (a_this, 0);
> +         CHECK_PARSING_STATUS (status, FALSE);
> +
> +         do {
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +
> +         } while (status =3D=3D CR_OK);
> +
> +@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
> +  *in chapter 4.1 of the css2 spec.
> +  *block ::=3D '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
> +  *@param a_this the current instance of #CRParser.
> ++ *@param n_calls used to limit recursion depth
> +  *FIXME: code this function.
> +  */
> + static enum CRStatus
> +-cr_parser_parse_block_core (CRParser * a_this)
> ++cr_parser_parse_block_core (CRParser * a_this,
> ++                            guint      n_calls)
> + {
> +         CRToken *token =3D NULL;
> +         CRInputPos init_pos;
> +@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_=
ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &t=
oken);
> +@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)
> +         } else if (token->type =3D=3D CBO_TK) {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, n_calls =
+ 1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         } else {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, n_calls + =
1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         }
> +@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknz=
r,
> +                                                token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 ref++;
> +                 goto continue_parsing;
> +@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknz=
r,
> +                                                token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +                 if (status =3D=3D CR_OK) {
> +                         ref++;
> +                         goto continue_parsing;
> +@@ -1162,10 +1162,12 @@
> +  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
> +  *
> +  *@param a_this the current instance of #CRParser.
> ++ *@param n_calls used to limit recursion depth
> +  *@return CR_OK upon successfull completion, an error code otherwise.
> +  */
> + static enum CRStatus
> +-cr_parser_parse_any_core (CRParser * a_this)
> ++cr_parser_parse_any_core (CRParser * a_this,
> ++                          guint      n_calls)
> + {
> +         CRToken *token1 =3D NULL,
> +                 *token2 =3D NULL;
> +@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &t=
oken1);
> +@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                  *We consider parameter as being an "any*" production.
> +                  */
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +--
> +GitLab
> diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/reci=
pes-support/libcroco/libcroco_0.6.13.bb
> new file mode 100644
> index 0000000..fd5927e
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Cascading Style Sheet (CSS) parsing and manipulation toolki=
t"
> +HOMEPAGE =3D "https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
%3A%2F%2Fwww.gnome.org%2F&amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8=
e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DZ9wmwFLA%2BuBT243Dv=
5a666ng67OAfytEYyAVv3sn4GA%3D&amp;reserved=3D0"
> +BUGTRACKER =3D "https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fbugzilla.gnome.org%2F&amp;data=3D04%7C01%7CNeetika.Singh%40kpit=
.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%=
7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DynFHfdJS8RU=
pg8kqJOBlTsQPz3%2FxMvoBgBiVMLAC0u4%3D&amp;reserved=3D0"
> +
> +LICENSE =3D "LGPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605 \
> +                    file://src/cr-rgb.c;endline=3D22;md5=3D31d5f0944d556=
c8589d04ea6055fcc66 \
> +                    file://tests/cr-test-utils.c;endline=3D21;md5=3D2382=
c27934cae1d3792fcb17a6142c4e"
> +
> +SECTION =3D "x11/utils"
> +DEPENDS =3D "glib-2.0 libxml2 zlib"
> +BBCLASSEXTEND =3D "native nativesdk"
> +EXTRA_OECONF +=3D "--enable-Bsymbolic=3Dauto"
> +
> +BINCONFIG =3D "${bindir}/croco-0.6-config"
> +
> +inherit gnomebase gtk-doc binconfig-disabled
> +
> +SRC_URI +=3D "file://CVE-2020-12825.patch"
> +
> +SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
> +SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e06=
3f92db585759b422570621d4"
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BMXPR01MB235831D5134C15F33350AD479F7E9BMXPR01MB2358INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Raj,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I have verified locally and these changes are showing to me as up to date o=
n latest oe-core master branch.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
git log origin/master..HEAD
<div>commit 1abebf8d3ce044609ae29d7dee7a9b268e510ebd</div>
<div>Author: Neetika Singh &lt;Neetika.Singh@kpit.com&gt;</div>
<div>Date: &nbsp; Fri Nov 20 18:35:15 2020 +0530</div>
<div><br>
</div>
<div>&nbsp; &nbsp; libcroco: Add fix for CVE-2020-12825</div>
<div>&nbsp; &nbsp; </div>
<div>&nbsp; &nbsp; Added refreshed patch for CVE issue CVE-2020-12825</div>
<div>&nbsp; &nbsp; Link: https://gitlab.com/inkscape/inkscape/-/commit/203d=
62efefe6f79080863dda61593003b4c31f25</div>
<div>&nbsp; &nbsp; </div>
<div>&nbsp; &nbsp; Signed-off-by: Neetika.Singh &lt;Neetika.Singh@kpit.com&=
gt;</div>
<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<font size=3D"3" face=3D"'Segoe UI',Sans-Serif"></font>
<div name=3D"divtagdefaultwrapper" style=3D"margin:0px">
<div name=3D"divtagdefaultwrapper" style=3D"margin:0px"><font style=3D"" si=
ze=3D"3" face=3D"'Segoe UI',Sans-Serif" color=3D"black"><span dir=3D"ltr" s=
tyle=3D"font-size: 12pt; background-color: white;">
<div id=3D"Signature"><font size=3D"2"><span style=3D"font-size:11pt"><font=
 style=3D"" color=3D"003366"><span style=3D"font-size:9pt" lang=3D"en-IN">&=
nbsp;</span></font></span>Thanks &amp; Regards,<br>
</font>
<div style=3D"margin:0"><font size=3D"2">&nbsp;<font style=3D"" color=3D"00=
3366">Neetika Singh<br>
&nbsp;Product Engineering Services (PES)</font></font></div>
<div style=3D"margin:0"><font size=3D"2"><font style=3D"" color=3D"003366">=
&nbsp;KPIT Technologies Limited<br>
</font></font></div>
<font size=3D"2"></font>
<div style=3D"margin:0"><br>
</div>
<font style=3D"" color=3D"00CCFF"></font>
<div style=3D"margin:0"><font style=3D"" color=3D"00CCFF"></font>
<div><font style=3D"" color=3D"00CCFF"></font>
<div style=3D"margin:0"><span style=3D"font-size:11pt"><font style=3D"" col=
or=3D"00CCFF"><b><span style=3D"font-size:9pt" lang=3D"en-IN"></span><span =
style=3D"font-size:9pt" lang=3D"en-IN"></span></b></font><font style=3D"" c=
olor=3D"#8EAADB"><span style=3D"font-size:10pt" lang=3D"en-IN"><b><br>
</b></span></font></span></div>
</div>
</div>
</div>
</span></font></div>
</div>
<font size=3D"3" face=3D"'Segoe UI',Sans-Serif"></font></div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> 29 March 2021 20:18<br>
<b>To:</b> Neetika Singh &lt;Neetika.Singh@kpit.com&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;openembedded=
-core@lists.openembedded.org&gt;; Nisha Parrakat &lt;Nisha.Parrakat@kpit.co=
m&gt;<br>
<b>Subject:</b> Re: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020=
-12825</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Mar 29, 2021 at 7:42 AM Neetika.Singh &lt;=
Neetika.Singh@kpit.com&gt; wrote:<br>
&gt;<br>
&gt; From: Neetika Singh &lt;Neetika.Singh@kpit.com&gt;<br>
&gt;<br>
&gt; Added refreshed patch for CVE issue CVE-2020-12825<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.com%2Finkscape%2Finkscape%2F-%2Fcommit%2F203d62efef=
e6f79080863dda61593003b4c31f25&amp;amp;data=3D04%7C01%7CNeetika.Singh%40kpi=
t.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C637526261735464157%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DOkTKj7=
JQfH35aD1GkovrszMEQxQVkATiTjdo6VpiCEk%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
com%2Finkscape%2Finkscape%2F-%2Fcommit%2F203d62efefe6f79080863dda61593003b4=
c31f25&amp;amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec=
7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375262617354=
64157%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DOkTKj7JQfH35aD1GkovrszMEQxQVkA=
TiTjdo6VpiCEk%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Neetika.Singh &lt;Neetika.Singh@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../libcroco/libcroco/CVE-2020-12825.patch&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 192 +++++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/libcroco/libcroco_0.6.13.bb&nbsp;&nbsp; |&n=
bsp; 22 +++<br>
&gt;&nbsp; 2 files changed, 214 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-20=
20-12825.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13=
.bb<br>
<br>
libcroco is already there in oe-core, perhaps you can rebase this<br>
patch on top of latest oe-core master branch and resend.<br>
<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.pat=
ch b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f813ded<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch<br>
&gt; @@ -0,0 +1,192 @@<br>
&gt; +From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Michael Catanzaro &lt;mcatanzaro@gnome.org&gt;<br>
&gt; +Date: Thu, 13 Aug 2020 20:03:05 -0500<br>
&gt; +Subject: [PATCH] libcroco parser: limit recursion in block and any pr=
oductions<br>
&gt; +<br>
&gt; +If we don't have any limits, we can recurse forever and overflow the<=
br>
&gt; +stack.<br>
&gt; +<br>
&gt; +This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_cor=
e<br>
&gt; +in cr-parser.c.<br>
&gt; +<br>
&gt; +Bug: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.gnome.org%2FArchive%2Flibcroco%2F-%2Fissues%2F8&amp=
;amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2=
c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261735464157%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3D1JQbRwD7xiTrBT1%2F9Kx8Nop84lOd3JT5ImU7eO=
YAfiU%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
gnome.org%2FArchive%2Flibcroco%2F-%2Fissues%2F8&amp;amp;data=3D04%7C01%7CNe=
etika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637526261735464157%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;a=
mp;sdata=3D1JQbRwD7xiTrBT1%2F9Kx8Nop84lOd3JT5ImU7eOYAfiU%3D&amp;amp;reserve=
d=3D0</a><br>
&gt; +Patch from <a href=3D"https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgitlab.gnome.org%2FArchive%2Flibcroco%2F-%2Fmerge_requ=
ests%2F5&amp;amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4c=
ec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63752626173=
5474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D7jcaMq8meYRVhbA4o%2BN0XZZ1Hx=
z0jxqg31jxZUVHIV4%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
gnome.org%2FArchive%2Flibcroco%2F-%2Fmerge_requests%2F5&amp;amp;data=3D04%7=
C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;amp;sdata=3D7jcaMq8meYRVhbA4o%2BN0XZZ1Hxz0jxqg31jxZUVHIV4%3D&amp;amp=
;reserved=3D0</a><br>
&gt; +<br>
&gt; +CVE: CVE-2020-12825<br>
&gt; +Upstream Status: Backport [<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.com%2Finkscape%2Finkscape%2F-%2=
Fcommit%2F203d62efefe6f79080863dda61593003b4c31f25.patch&amp;amp;data=3D04%=
7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C353945=
1eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;amp;sdata=3DHF%2FyBXMAOe4xpTBIMhyc25pEPaLSc2buc4ho910zbxk%3D&amp;am=
p;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgitlab.com%2Finkscape%2Finkscape%2F-%2Fcommit%2F203d62efefe6f79080=
863dda61593003b4c31f25.patch&amp;amp;data=3D04%7C01%7CNeetika.Singh%40kpit.=
com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DHF%2FyBX=
MAOe4xpTBIMhyc25pEPaLSc2buc4ho910zbxk%3D&amp;amp;reserved=3D0</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Neetika Singh &lt;Neetika.Singh@kpit.com&gt;<br>
&gt; +---<br>
&gt; + src/cr-parser.c | 44 ++++++++++++++++++++-----------<br>
&gt; + 1 file changed, 29 insertions(+), 15 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/cr-parser.c b/src/cr-parser.c<br>
&gt; +index d85e71f0fc..cd7b6ebd4a 100644<br>
&gt; +--- a/src/cr-parser.c<br>
&gt; ++++ b/src/cr-parser.c<br>
&gt; +@@ -136,6 +136,8 @@ struct _CRParserPriv {<br>
&gt; +<br>
&gt; + #define CHARS_TAB_SIZE 12<br>
&gt; +<br>
&gt; ++#define RECURSIVE_CALLERS_LIMIT 100<br>
&gt; ++<br>
&gt; + /**<br>
&gt; +&nbsp; * IS_NUM:<br>
&gt; +&nbsp; *@a_char: the char to test.<br>
&gt; +@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_co=
re (CRParser * a_this);<br>
&gt; +<br>
&gt; + static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_=
this);<br>
&gt; +<br>
&gt; +-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);<b=
r>
&gt; ++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guint&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; n_calls);<br>
&gt; +<br>
&gt; +-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);=
<br>
&gt; ++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guin=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n_calls);<br>
&gt; +<br>
&gt; + static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);=
<br>
&gt; +<br>
&gt; +@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cr_parser_try_to_ski=
p_spaces_and_comments (a_this);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_any_core (a_this, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } while (status =3D=
=3D CR_OK);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D cr_tknzr_=
get_next_token (PRIVATE (a_this)-&gt;tknzr,<br>
&gt; +@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; cr_tknzr_unget_token (PRIVATE (a_this)-&gt;tknz=
r,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; token);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; token =3D NULL;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_block_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_block_core (a_this, 0);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; CHECK_PARSING_STATUS (status,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; FALSE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; goto done;<br>
&gt; +@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_thi=
s)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RECORD_INITIAL_POS (=
a_this, &amp;init_pos);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_pars=
e_any_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_pars=
e_any_core (a_this, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHECK_PARSING_STATUS=
 (status, FALSE);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_any_core (a_this, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } while (status =3D=
=3D CR_OK);<br>
&gt; +<br>
&gt; +@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_thi=
s)<br>
&gt; +&nbsp; *in chapter 4.1 of the css2 spec.<br>
&gt; +&nbsp; *block ::=3D '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' =
S*;<br>
&gt; +&nbsp; *@param a_this the current instance of #CRParser.<br>
&gt; ++ *@param n_calls used to limit recursion depth<br>
&gt; +&nbsp; *FIXME: code this function.<br>
&gt; +&nbsp; */<br>
&gt; + static enum CRStatus<br>
&gt; +-cr_parser_parse_block_core (CRParser * a_this)<br>
&gt; ++cr_parser_parse_block_core (CRParser * a_this,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; guint&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n_calls)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRToken *token =3D N=
ULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRInputPos init_pos;=
<br>
&gt; +@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_return_val_if_fail=
 (a_this &amp;&amp; PRIVATE (a_this), CR_BAD_PARAM_ERROR);<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (n_calls &gt; RECURSIV=
E_CALLERS_LIMIT)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return CR_ERROR;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RECORD_INITIAL_POS (=
a_this, &amp;init_pos);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D cr_tknzr_=
get_next_token (PRIVATE (a_this)-&gt;tknzr, &amp;token);<br>
&gt; +@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (token-&gt=
;type =3D=3D CBO_TK) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; cr_tknzr_unget_token (PRIVATE (a_this)-&gt;tknz=
r, token);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; token =3D NULL;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_block_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_block_core (a_this, n_cal=
ls + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; CHECK_PARSING_STATUS (status, FALSE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; goto parse_block_content;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; cr_tknzr_unget_token (PRIVATE (a_this)-&gt;tknz=
r, token);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; token =3D NULL;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_any_core (a_this, n_calls=
 + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; CHECK_PARSING_STATUS (status, FALSE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; goto parse_block_content;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D cr_tknzr_unget_token (PRIVATE (a_thi=
s)-&gt;tknzr,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; token);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; token =3D NULL;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_block_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_block_core (a_this, 0);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; CHECK_PARSING_STATUS (status, FALSE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ref++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; goto continue_parsing;<br>
&gt; +@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D cr_tknzr_unget_token (PRIVATE (a_thi=
s)-&gt;tknzr,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; token);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; token =3D NULL;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; status =3D cr_parser_parse_any_core (a_this, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; if (status =3D=3D CR_OK) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 ref++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 goto continue_parsing;<br>
&gt; +@@ -1162,10 +1162,12 @@<br>
&gt; +&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FUNCTION | DASHM=
ATCH | '(' any* ')' | '[' any* ']' ] S*;<br>
&gt; +&nbsp; *<br>
&gt; +&nbsp; *@param a_this the current instance of #CRParser.<br>
&gt; ++ *@param n_calls used to limit recursion depth<br>
&gt; +&nbsp; *@return CR_OK upon successfull completion, an error code othe=
rwise.<br>
&gt; +&nbsp; */<br>
&gt; + static enum CRStatus<br>
&gt; +-cr_parser_parse_any_core (CRParser * a_this)<br>
&gt; ++cr_parser_parse_any_core (CRParser * a_this,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; guint&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n_calls)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRToken *token1 =3D =
NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; *token2 =3D NULL;<br>
&gt; +@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_return_val_if_fail=
 (a_this, CR_BAD_PARAM_ERROR);<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (n_calls &gt; RECURSIV=
E_CALLERS_LIMIT)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return CR_ERROR;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RECORD_INITIAL_POS (=
a_this, &amp;init_pos);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D cr_tknzr_=
get_next_token (PRIVATE (a_this)-&gt;tknzr, &amp;token1);<br>
&gt; +@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *We consider parameter as being an &quot;=
any*&quot; production.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stat=
us =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stat=
us =3D cr_parser_parse_any_core (a_this, n_calls + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; } while (status =3D=3D CR_OK);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ENSURE_PARSING_COND (status =3D=3D CR_PARSING_E=
RROR);<br>
&gt; +@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stat=
us =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stat=
us =3D cr_parser_parse_any_core (a_this, n_calls + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; } while (status =3D=3D CR_OK);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ENSURE_PARSING_COND (status =3D=3D CR_PARSING_E=
RROR);<br>
&gt; +@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stat=
us =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stat=
us =3D cr_parser_parse_any_core (a_this, n_calls + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; } while (status =3D=3D CR_OK);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ENSURE_PARSING_COND (status =3D=3D CR_PARSING_E=
RROR);<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/r=
ecipes-support/libcroco/libcroco_0.6.13.bb<br>
&gt; new file mode 100644<br>
&gt; index 0000000..fd5927e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb<br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +SUMMARY =3D &quot;Cascading Style Sheet (CSS) parsing and manipulatio=
n toolkit&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://apc01.safelinks.protection.outl=
ook.com/?url=3Dhttp%3A%2F%2Fwww.gnome.org%2F&amp;amp;data=3D04%7C01%7CNeeti=
ka.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DZ9wmwFLA%2BuBT243Dv5a666ng67OAfytEYyAVv3sn4GA%3D&amp;amp;reserved=
=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fww=
w.gnome.org%2F&amp;amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4=
a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63752=
6261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DZ9wmwFLA%2BuBT243Dv5a6=
66ng67OAfytEYyAVv3sn4GA%3D&amp;amp;reserved=3D0</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://apc01.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Fbugzilla.gnome.org%2F&amp;amp;data=3D04%7C01=
%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;amp;sdata=3DynFHfdJS8RUpg8kqJOBlTsQPz3%2FxMvoBgBiVMLAC0u4%3D&amp;amp;re=
served=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fbugzilla.gnome.org%2F&amp;amp;data=3D04%7C01%7CNeetika.Singh%40kpit.co=
m%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0=
%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DynFHfdJS8R=
Upg8kqJOBlTsQPz3%2FxMvoBgBiVMLAC0u4%3D&amp;amp;reserved=3D0</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;LGPLv2 &amp; LGPLv2.1&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPYING;md5=3D55ca=
817ccb7d5b5b66355690e9abc605 \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://src/cr-rgb.=
c;endline=3D22;md5=3D31d5f0944d556c8589d04ea6055fcc66">
file://src/cr-rgb.c;endline=3D22;md5=3D31d5f0944d556c8589d04ea6055fcc66</a>=
 \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://tests/cr-te=
st-utils.c;endline=3D21;md5=3D2382c27934cae1d3792fcb17a6142c4e">
file://tests/cr-test-utils.c;endline=3D21;md5=3D2382c27934cae1d3792fcb17a61=
42c4e</a>&quot;<br>
&gt; +<br>
&gt; +SECTION =3D &quot;x11/utils&quot;<br>
&gt; +DEPENDS =3D &quot;glib-2.0 libxml2 zlib&quot;<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; +EXTRA_OECONF +=3D &quot;--enable-Bsymbolic=3Dauto&quot;<br>
&gt; +<br>
&gt; +BINCONFIG =3D &quot;${bindir}/croco-0.6-config&quot;<br>
&gt; +<br>
&gt; +inherit gnomebase gtk-doc binconfig-disabled<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot;<a href=3D"file://CVE-2020-12825.patch">file://CVE=
-2020-12825.patch</a>&quot;<br>
&gt; +<br>
&gt; +SRC_URI[archive.md5sum] =3D &quot;c80c5a8385011a0260dce6bd0da93dce&qu=
ot;<br>
&gt; +SRC_URI[archive.sha256sum] =3D &quot;767ec234ae7aa684695b3a7355482248=
88132e063f92db585759b422570621d4&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB235831D5134C15F33350AD479F7E9BMXPR01MB2358INDP_--
