Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.49])
 by mx.groups.io with SMTP id smtpd.web12.84.1619655488838228604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 17:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KOUkxXMH;
 spf=pass (domain: windriver.com, ip: 40.107.244.49, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2kELJN2tloz0lwkw7NFA+VjX00F6UoLPRmnZWy22XaOAtQuQLqvJWA8oGULPnhvE7gJAiLPhu+k3tWyAIBn12wtLlnU2vdxvqZqgeJEy8gn29GhWiU/p0lWuWk9ALehCJOoW+/aBCPQFkhMDJP/VtTgD0CvPWULgvpz3m7hmXUS6As1mE4wyNUPl+bwVkvhSKIMDbgCWfuP3T6nS2nofVl/WGhPvnxQO6ZO4FpJwqLuPMLoL1HjGUrDLP+k2osNBPmkS6NoqSRyGJyGBAHz1z7adpl53ypa1rXh01FsoCUsqiC//MVvg04DW1HFY0e/CyZ+YW9FET5Okfc/lvrR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laZDhfQB6E6iUhCxbBsUQb4QfYoB+3LYZdvqfH9apXA=;
 b=Ii9qfbNgByuFhX6yiuXDXCAtuDef2vQYS3J/5uwejuWEMupt7kVB7enwrdOIL8ui3BbQ2Ud00VhTFUNd5f6xHpgAXymX9mhoBHXFU6krUmAKp1lo8+eodJg7SQaUD9Owp6A2ZTV6lEn93Upq+Z20F8aJXWXCjJHke7sx3hcvJUE6DxWJ3sGXSnEpeUM5LOTDPeMLPESYgHDBAc753aM+AhmsH4MPKItG5JolLXy8UhppmAWUy1p1aXQ/fYoDHRH2FP4wvQBexaoziaKGhAnzESrG+yPwWFSTEriyEkzAQdLpHpeWsZuG0B78hEx4oVRUzjl95UElAuDKC4641lKZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laZDhfQB6E6iUhCxbBsUQb4QfYoB+3LYZdvqfH9apXA=;
 b=KOUkxXMHeMX2jW7yAMCq52co0LAdKrcay4l7zucxKVvLB9ZBi9pemG+uFEiQYx8yarDIV0eWuW8r/MlMK/b5YHuPFiecJ9//J0ZRyQQCfdRMMFtVNz8+TwF0VmzMsxuQ0/Evx0HUBxhbzC4D5b8XswulTS/RZvm/9i4zX8AnHXg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1692.namprd11.prod.outlook.com (2603:10b6:3:d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.23; Thu, 29 Apr 2021 00:18:06 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4087.025; Thu, 29 Apr 2021
 00:18:06 +0000
Subject: =?UTF-8?B?UmU6IFtsaW51eC15b2N0b10g5Zue5aSNOiBbUEFUQ0hdIHJ0LXRlc3RzOiBVcGRhdGUgdGhlIGxhdGVzdCBicmFuY2hlcw==?=
To: "Zhang, Qiang" <qiang.zhang@windriver.com>,
 "robert.joslyn@redrectangle.org" <robert.joslyn@redrectangle.org>,
 "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20210416090558.1681-1-qiang.zhang@windriver.com>
 <DM6PR11MB4202B29250ACE47E5FB8023BFF459@DM6PR11MB4202.namprd11.prod.outlook.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <4b33c47b-14b6-41b8-ba98-9c8cb098d68b@windriver.com>
Date: Wed, 28 Apr 2021 20:18:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <DM6PR11MB4202B29250ACE47E5FB8023BFF459@DM6PR11MB4202.namprd11.prod.outlook.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:40::38) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:40::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend Transport; Thu, 29 Apr 2021 00:18:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a35d135-e4fc-4db8-dd49-08d90aa442a6
X-MS-TrafficTypeDiagnostic: DM5PR11MB1692:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB169282F4C281267C69CE960BF85F9@DM5PR11MB1692.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	58NJVCzrIhnij+dDY1BuKVKYjUzjLaRj6Nhf4PP0ns2YJ+30PVt8XggDMbK/U1TaVQHr8UKfmgnnXQCNicd6Q/gWTgay/4eY9vmYxp1HGNX23CRm1/pKfLaeAymP1VVP2EFuPTNxe4KZPX/2rr4QR8QXl/XC0qKtBXCHOUb/lw/6KvcdbRna6Pxe7/Mw5SroLpW7Ijn127zR/RX+z9RviC7suqPoC+thf0JQodTSasrojd27lRhdBKekiJ+4U9iwynvuRf6MTGZFDuqXuzd7164NysecNGzf7m5shXqleXQQQ/dhk7xK1GTx+0DC1o6QQ4ASWWHEKc4tqxFyYZNL8YmKstn9PUpPwj1EM8EYkKZDb7ZqHcfayIw0pxAE4GDC6rejGqM5A3pQwH9B4R4i9kjwFWbo9viZzO4zsPFFRotqlU/2ikFYhE0gJezNCwies3ZtSj93CEg4uj/ob5cCLiyvLiqcSbTeTpvz9MBi2oNiJHVUhH+SsH3ui1ElG3j4UQjGsLryXS4G3Vl0I/fxG0ujEvKS4GBSGoYgSWqq8pOEYbL7LmVbcROZWnq5zMdHTQC4nezT5S/Cf6WKmpRdV5gWYeWsugVjm+4wuP3rv73qv7VADVyS0bBSqO/CXX8ZHhgxEc5ke+W4G/YNzu3H95QRq1teaglcdYLCktasb3fMX81KxTzmfB9p72Qut4mAP4Ke4hXu99zDTNa2J5RBs2yQ0UXzuMA3llnRphDCCzYL6FDfi/TNsmke7fN9vKmhF/CD7wlWls1BsHWS+vTmVklOIcZUxoa/YxGFSy0EL5M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(136003)(366004)(376002)(346002)(186003)(52116002)(8936002)(6486002)(478600001)(966005)(956004)(26005)(110136005)(316002)(16576012)(66556008)(66476007)(66946007)(15650500001)(53546011)(16526019)(4326008)(31696002)(6666004)(38100700002)(31686004)(38350700002)(86362001)(5660300002)(83380400001)(2616005)(2906002)(224303003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?dfeMBih8oj1m7DGro04RriEgSbumssYlpOuxnrUM8WtQqFLCK3P+X+f4o2u7?=
 =?us-ascii?Q?LwzGLFH7IrnRTHUPkzG6ASvCdb+4xowB9fC8Bo66lvNbJP+czBxq7+0euzXd?=
 =?us-ascii?Q?YES/mTHqej4nhkF3GQSDE/lk1au2XTX+JGFPs8kr8TyeL1IPTZ2Px3jCEcDy?=
 =?us-ascii?Q?SLzBV5ZpLhvpR4P8j5ai4nEtJijEe/3PGL+cMm7oZo1XOTXyjEfZiX2qcEmT?=
 =?us-ascii?Q?U0CMnO73Mgnw5WQRZhynH/IENUSpzmHpPrAjxMB1ryeYDQJG76tS+vVEclYE?=
 =?us-ascii?Q?HtUo6slmjh7KYaSsD5X8ivaE2zquKy5bs6dL4D11/nK0orzZo3Sr2hW8Ug8M?=
 =?us-ascii?Q?kc+7mERrRWOI3GuE+i1ZiUkSeUL5MSfKKx4SPLPKDOXAedFoQKe5AC+zuA0K?=
 =?us-ascii?Q?oks4JhncUVSvOWsMI4eh8SrS3nBgvhRbIxcfLYQxipkws2KfCYquujAph//C?=
 =?us-ascii?Q?HIKqAhxrLxRQ6CZ8RYD87FMrui1+eTUY2rI9hwV9qygesi0oRLS2xbiJZSDi?=
 =?us-ascii?Q?UP8hho38FofbUtC5FiNJ8EuPoMski+6wTaJQDGjUIU1v6ADGCDt8kGpJhiyD?=
 =?us-ascii?Q?yGVcZlL8ERP1917em+IWuBfNIIyrSLhAWoECff+6wpHrVXC6lwyL1aM3HoNN?=
 =?us-ascii?Q?KfT0drt3R9HMtR+17aNYCh/Kwbuy+KdJWUz5guIkHWQv5bTB9g4gwKK4n2Si?=
 =?us-ascii?Q?KRavzz2bhJUh1tzRKfgGQPN3BJutFVCF/aFSYpYhu6byyO6QWAJTtgBW71og?=
 =?us-ascii?Q?yPqOTpdBhTFY/q6jKc2ex8tD1NQVY1IwjsbgQeW5BWZxmve2JZeEyO/30GiJ?=
 =?us-ascii?Q?HQocLqg4P6QX0rfvEJMUHCpQczn52dcg4/u6BnjI39BCB3cQ+N3i/KdW/Zlk?=
 =?us-ascii?Q?XefyITHWD96HwFrNMG+7k/cr3jt+Y51KuPKwHJZubRYW8sWUYtTuYxO0hhHn?=
 =?us-ascii?Q?wwxaiyW6/yRk3pOOYST42CQrAWgbjJa37H5j+on+gub7IPk+MD4e7+vkO9Kt?=
 =?us-ascii?Q?dQklFhzTzt1b2IcZGY2a4of2MVW0H2jhjNb/UD8mgglKz0ycAqoDnN/vuMm9?=
 =?us-ascii?Q?STT5YYH/BjyAkuJzZGeZ/ozmlE20XOPjwua/64SAErMpH/+rjBFiH/E7JzAy?=
 =?us-ascii?Q?udpmgl4uk+jwKXzShSaNh1it36sg4sOljVBgXOFr+RM9lqCBV4/EuMJFXE/d?=
 =?us-ascii?Q?tgCd9d1EozYT+Y3ERVW4wJLoH7l6N498xpdhFGYzVN1ctGYNIfbPrzGo7kmx?=
 =?us-ascii?Q?IA0yln3GzMXPsiF4jiHlcOdOHFxhfD6+OR5XGnogQvhcSQjMw4VxLMUNhzTO?=
 =?us-ascii?Q?rZ7pq2jFFXdv2PRaCLTRrw7q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a35d135-e4fc-4db8-dd49-08d90aa442a6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 00:18:06.1000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJixqFrqCqsYWw6+WzCbWOyCd23lqbh429+JjhJUtOBxLxla6zO2sxnSX9bVuhQNoXfoEmwIB4jGsu5h0is3bHWOUk8Te7xpp2ayasK9Zcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1692
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

Dropping the yocto list since this might cause some people's filters
to misfile the patch and it's an oe-core patch so that's the only list=20
that needs to be CCed it seems.

On 2021-04-23 4:41 a.m., Zhang, Qiang wrote:
> Hello robert
>=20
>   This change didn't respond for a long time ,
>   look forward to your reply.
>=20
> Thanks
> Qiang
>=20
> ________________________________________
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Zhang, Qiang <qiang.zhang@windriver.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2021=E5=B9=B44=E6=9C=8816=E6=97=A5=
 17:05
> =E6=94=B6=E4=BB=B6=E4=BA=BA: robert.joslyn@redrectangle.org; bruce.ashfi=
eld@gmail.com
> =E6=8A=84=E9=80=81: openembedded-core@lists.openembedded.org; linux-yoct=
o@lists.yoctoproject.org
> =E4=B8=BB=E9=A2=98: [PATCH] rt-tests: Update the latest branches
>=20
> From: Zqiang <qiang.zhang@windriver.com>
>=20
> When run cyclictest, the parameter enable NUAM. but in some BSP

s/NUAM/NUMA/

> which not support NUMA, will causes the test program to exit
> directly and does not carry out subsequent operations, the
> latest changes have fixed this problem.
>=20
> "3aec580 rt-tests: Don't assume numa is available at runtime"
>=20
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>   meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-=
tests/rt-tests.inc
> index 9358f13d06..0c89bad91f 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,5 +1,5 @@
>   # Version 1.8
> -SRCREV =3D "32819581cc0509c9d58c33c3061f57abe0c40c88"
> +SRCREV =3D "6af88067da16c6e69243b376c3b6454ec694460b"

This adds 38 commits of the  240 commits on this branch.
I think that's all we needed for hardknott but now, on master, maybe
we want to update to HEAD. Is that right Qiang?

Maybe now that hardknott is released, you should be cherry-picking
a single commit to fix the problem you are seeing.

../Randy



$ git log --oneline 3281958..6af8806 | wc -l
38

$ git log --oneline 3281958... | wc -l
240
$ git log --oneline 3281958..6af8806
6af8806 (origin/unstable/devel/latest)
         signaltest: Add missing --output usage info
8d6c294 cyclicdeadline: Remove unused include header
95066b1 cyclicdeadline.c: Fix printf format specifier
f6881fc cyclictest: Fix printf format specifier
05a1170 rt-tests: cyclicdeadline.c: Remove dead code
e62593c rt-tests: remove rt_numa_bitmask_count in rt_numa.h
3aec580 rt-tests: Don't assume numa is available at runtime
6b9ac75 Revert "signaltest: Always use libnuma"
c30fa9f Revert "cyclictest: Always use libnuma"
bdb8350 Revert "cyclictest: Use affinity_mask for steering thread placemen=
t"
29884cf oslat: Fix --cpu-list won't allow to schedule on all possible core=
s
80299f1 sigwaittest: Add JSON output feature
bdb20cd signaltest: Add JSON output feature
7593a72 oslat: Add quiet command line option
c7a3abe rt-migrate-test: Add JSON output feature
4db4a76 oslat: Add JSON output feature
09edaef svsematest: Add JSON output feature
cbbe3e1 ptsematest: Add JSON output feature
e11e675 pmqtest: Add JSON output feature
68621f3 cyclicdeadline: Add JSON output feature
24aaf96 cyclictest: Add JSON output feature
e6ca039 rt-utils: Add JSON common header output helper
07445ec rt-tests: Rename error.h to rt-error.h
af0a1e9 rt-tests: oslat: Allocate memory for cpu_set
27511be oslat: Use cpuset size as upper bound
a1b862a rt-tests: oslat: print version string
eadb1a9 rt-numa: Use error message helpers
3079f1b signaltest: Always use libnuma
eb6c89c cyclictest: Move verbose message into main
1b00086 cyclicdeadline: Remove unused struct thread_param
2433a52 cyclicdeadline: Add missing step command line argument
890ce10 cyclictest: Remove libnuma API version 1 support
e09c649 ptsematest: Return correct exit code when showing help
8ac90e7 pip_stress: De-constify prio_min
8305e65 cyclictest: Use affinity_mask for steering thread placement
512d2b7 cyclictest: Always use libnuma
244f6eb cyclictest: Fix --affinity when intermediate CPUs are offline
1c65835 rt-tests: rm scripts/do-git-push

$ git branch -a --contains 6af8806
   remotes/origin/unstable/devel/latest

---


>   PE =3D "1"
>=20
>   SRC_URI =3D "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;=
branch=3Dunstable/devel/latest"
> --
> 2.29.2
>=20
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
