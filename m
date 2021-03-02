Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.41])
 by mx.groups.io with SMTP id smtpd.web08.3146.1614652237368249553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 18:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cMaVA440;
 spf=pass (domain: windriver.com, ip: 40.107.237.41, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqcrPMCCY9lENfJBAMschEgpq/FQqvKGzwDWUoFzuwn8ZYNUeWs5KaUgcg9noKuU+Oo+PSZI0zG/WV4aAR2Ezlt7KZzVvl9ksUcvX7eOyA+iAI4TB/x1pvDuTbTama+XcKtBdaCrMDq8UtnZOUIohZmnXEB9Xt83PZaUanm0Gp4wtTFmIkiADgta5/3InLd+OvNN2XkL0bCP+hE3XW0X29lbPBqE2ohhRvbWobey2CKRE8Wnve7d1P30+7RAqM1YChwSaIhf8PXEmjIKDilHv5dLNptHDtGDIIuZy+kwmmynRJNUywS0BxPfqWR7Chetn/UXTCwjmZ90+qRUEXiohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1H/xTIZPSB6YimXMOsqKsL6x8hye3wHrpp2VhqecaQ=;
 b=V6Ps1gluVf1KbuJMpTyRDXso/JVoYOaHUomI1mCvjG4K9cLYut+AHMwvfuA/wc3yUay3WDRIXSZ4e5Z0tvb7KSh09Ndzp9OlxU0oW/sI/p4z/rcuGXMQuhlAZY86fqm9FOjGor7+Vw05OgzTwnXprsUw4wuoLUrwODfm+QFgsLJBdkEEzWvCqiRD38fIiTkV7cm/N6HU32c5CO8tAJGbXTKsrpGUqgGySiR78b/lE/ElPkSLLp0HieYGwy7pKT0sG5iDQd3mazNo9kMmMZ5sjIlP44ZCvvomAoFZLu1fmJc8SN2xZ05ChqjfVGgSP/mtMSBJNWpj8+GvfysJFyV82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1H/xTIZPSB6YimXMOsqKsL6x8hye3wHrpp2VhqecaQ=;
 b=cMaVA440SnTXoIxmppMZdILxSgvkYUvoVlv6PF2Tk3Qsxk1XWnl7vI8ugBlVHyXfgUoWtxMrVpfBeVPQqCOyy7aKOskuOn3556HFkyTizwJ9Pq+gE8aSO1El5MMsAzWxnwkAmAYMqaAXUMovsCqxbxBK0aFGdLB/zPmVyuZwLZI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB0028.namprd11.prod.outlook.com (2603:10b6:4:67::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Mar
 2021 02:30:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 02:30:34 +0000
Subject: Re: [OE-core] [v2] Merge meta-rust to oe-core
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
 <20210225014823.397741-1-Randy.MacLeod@windriver.com>
 <ad16b82158c2fa88c01b8b0962cc0455595b5b64.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <cbf3676c-84c3-bce9-d48e-3fe3088f0590@windriver.com>
Date: Mon, 1 Mar 2021 21:30:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <ad16b82158c2fa88c01b8b0962cc0455595b5b64.camel@linuxfoundation.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BY5PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::31) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BY5PR16CA0018.namprd16.prod.outlook.com (2603:10b6:a03:1a0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Tue, 2 Mar 2021 02:30:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3a0d628-df2f-4700-70d5-08d8dd23283c
X-MS-TrafficTypeDiagnostic: DM5PR11MB0028:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB0028935EF25F035A713DC4B8F8999@DM5PR11MB0028.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1D8xhkmowzmElZHwXA8/+XaBv4QsehNJc304QQGS+ILUAH/cOO688MPNwsWocCQtW+6rZ5x8Eht1A/1HaoNtpcz7TmnznZMcmgG7dGV0lpi4djxGBMMUP4r6Dbx2QRvUEDq2d0QnfqeoCvfUCWJ9yIdDSM6JxcLMGEUpwUxLBri9Gj21S2v1dCDwI+QJh9oTLXyBKCbbK+c6e58xb65+03CUGIzPYLLHBmcLESy2biMyxJ0R7dVQI3c5x7liHxGdRZezpPtVT+zHjEuR0SAcjUyZxhi4rhhRuGyssigN35KMF0NyD9MgEzRfc+HA0eEE2XU6H01yLhcSwRwVBueH8AJHgo953RkYFKm5XtW7XYdS93VAEatZBYdqzoktCxlEj7bO7H83GdZGA7hUxiQccfVqFUAzA5rEqTxsxPq284rZA4myxnMp9ye9xu7uHJtd2VY7Nv54R4Fu9lr6xq92c7926YHItqqU6JNuSrumSmci0Hq6phpQ84fuTTCWkh5So4H6plzUIP/0e274m6xQhbQLIc2YLwfrouWyAr/s5PwAy079q9K+e6JY78CtszLIhV5Dhm1tD6ubigvrldJcjuCkafDQwBoY1NGrofGWbUM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(6486002)(26005)(53546011)(186003)(52116002)(8676002)(16526019)(83380400001)(31686004)(2616005)(31696002)(66556008)(316002)(478600001)(6666004)(16576012)(66946007)(36756003)(5660300002)(956004)(86362001)(66476007)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?rRCS398ZUMyROXq3sZfa9wyac9sHS5z67B7LUXUhwSnEmoX5ask9L2tjbRG4?=
 =?us-ascii?Q?L265tARj46/KFB/Q7weEJxe9gfxdnT4lM19sorn9S972PH3mIFyUjWNZgZ5o?=
 =?us-ascii?Q?ikcFA9jf2pj7pKir6NXW0hzDWlkhl+EBDuW9QEXSoWK0UODw9tEGEIM9WLoH?=
 =?us-ascii?Q?p669lr/zZyZQxY6WveHn0LlV0/TwUqxkOsvchizsQ5nLCpVmtIexEp5zBPe8?=
 =?us-ascii?Q?Y4wvibraCO1u8qGmQ6G7Uq6yr6Rfpsnac5fKoaRmSntsWkDCtxkZCVDhslmt?=
 =?us-ascii?Q?L79Ay1aPtASPOLoLwt3KsWbVclS9P9Vuay83LxUIm+GmABW2HZwq1VIycSgr?=
 =?us-ascii?Q?HiBEjOjD8eJn+5pY2IVKeNdJz4/+6hoSeeXy6MYcGVtc6H12oj90ZksSwhkW?=
 =?us-ascii?Q?5F/caNj/VhzL5W5rvsD0fRJF+GztpDn/GlHRgt8iHx5KV7yPgvmnzLT+39TW?=
 =?us-ascii?Q?Sx+m06eMnNrYHyZV4PH+B8F67pYIYiBnq+Ih9T3vu/WqFW6Q3lxyD1k8a1DT?=
 =?us-ascii?Q?DGozkIqxrqjV+qvwmNXJ37/S+/UChRn+CJ/cCPEqvW/HG4hwxxALJIwBQWHI?=
 =?us-ascii?Q?dlP/mWPT+ufLrb3qG+vqehZRJAcyBEGLVhZ014pMGLvdC+LACrPWu3xgs8mb?=
 =?us-ascii?Q?cVlb2/m1g+A7ItGcLCry9nOK8XtmkWOUNCncoRupyXcDkpgmo7L9pPyDLodZ?=
 =?us-ascii?Q?HUIgG7ZMKq+9Po1cX9RHG+aOQt3JDaO/ka+tV77G/y26Pzn2g/dbC6hpQgLZ?=
 =?us-ascii?Q?SiBg2bNmggQdMa50vFFcquISuuuOCM1HadypEQ2waVl31YA+jn3BBWNZDIw1?=
 =?us-ascii?Q?pPP0enEgijKSHIK9tiNMuXV/JnFTl2jyILCuCFJSwSe1wdCHsTlckkSyBzca?=
 =?us-ascii?Q?4puDOmuy4XJxu4RchLtxO9H54ekWUOzO7reb2KljAZJt8jc/T2XEKTY7T8My?=
 =?us-ascii?Q?aFzZin5AkfQH+StWljQJ5v7ZqdKEYEnhEhCbHPDhRdw+/BFxib30ktCgxwRW?=
 =?us-ascii?Q?E48PU1OBbhseyYh3ipkHLsBP8NCePo7IWd6142iWCnbzZCBNytLi+zprDyOb?=
 =?us-ascii?Q?ZBQao9qMZqsVVMOlH0F98AFvKk+epb/YLG0I7moyEM1bML1xAwST8NaSpK5U?=
 =?us-ascii?Q?HKCQtF0EEBs1kBbpC7WshbSwBswA1J561LDFLcCgizCMc1GrmyxP+wmHJrZz?=
 =?us-ascii?Q?GRvnNfA2y4+BV3ZQxkq0jq1pnnm9oLe2fIbv/ZLoXbjug+oiK4YpYMxIgQGx?=
 =?us-ascii?Q?+/FZzHo7uRjkPjQRya5F6OrZNams1W+RqYoMnqEq40DxmMN4mhPBGDSEYrSx?=
 =?us-ascii?Q?UXtkKuyV3P3pDWFjUxo+v2XS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a0d628-df2f-4700-70d5-08d8dd23283c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 02:30:34.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGkiTdbNzGILK3VK+vXp9+Ge3WgspWgjHKfj0+0/U2GdQzW6WXKOBw605qPsIPKvuldAc3tS+Ig5Crddd90/97med66lwgnwJ+8hbyO6DRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0028
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-CA

On 2021-02-25 11:55 a.m., Richard Purdie wrote:
> oe-selftest -r distrodata.Distrodata.test_maintainers
>
> so the maintainers entries aren't quite right which is easy to fix and

Yes fixing the rust/cargo maintainers entries was easy.

Of course there here was a 'simple' libdnf/dnf problem remaining and
what's odd is that it only shows up when using oe-core.
 =C2=A0=C2=A0=C2=A0 Unable to find recipes for the following entries in mai=
ntainers.inc:
 =C2=A0=C2=A0=C2=A0 dnf
 =C2=A0=C2=A0=C2=A0 libdnf

These two recipes are not being returned from:
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 for fn in tinfoil.all_recipe_files(variants=3DFalse):


Oddly enough, when using poky, there is no such error!

Have you seen such a problem before?
Any tips other than move onto the other issues?

../Randy

2021-03-01 20:35:52,119 -
oe-selftest - INFO -=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2021-03-01 20:35:52,119 - oe-selftest - INFO - FAIL: test_maintainers=20
(distrodata.Distrodata)
2021-03-01 20:35:52,119 - oe-selftest - INFO -=20
----------------------------------------------------------------------
2021-03-01 20:35:52,119 - oe-selftest - INFO - Traceback (most recent=20
call last):
File=20
"/home/src/distro/yocto/oe-core.git/meta/lib/oeqa/selftest/cases/distrodata=
.py",=20
line 122, in test_maintainers
self.fail("""
AssertionError:
Unable to find recipes for the following entries in maintainers.inc:
dnf
libdnf

Stdout:
WARNING: Duplicate inclusion for=20
/home/src/distro/yocto/oe-core.git/meta/conf/distro/include/maintainers.inc=
=20
in
/home/src/distro/yocto/oe-core.git/meta/conf/distro/defaultsetup.conf
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 850 .bb files complete (0 cached, 850 parsed). 1478 targets,=20
24 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message shown.




The tinfoil is remarkably hard to bash (or strace) my head though!
I'm learning how to do that albeit slowly.

Oh, I tried the obvious hammer approach of strace -f and
see that libdnf_ is opened in both logs:

 =C2=A0grep libdnf_ /tmp/*log
/tmp/oe-selftest-dd-poky.log:46926=20
stat("/home/src/distro/yocto/poky.git/meta/recipes-devtools/libdnf/libdnf_0=
.55.2.bb",=20
<unfinished ...>
/tmp/oe-selftest-dd-poky.log:46926=20
stat("/home/src/distro/yocto/poky.git/meta/recipes-devtools/libdnf/libdnf_0=
.55.2.bb",=20
<unfinished ...>
/tmp/oe-selftest-dd-poky.log:46926 openat(AT_FDCWD,=20
"/home/src/distro/yocto/poky.git/meta/recipes-devtools/libdnf/libdnf_0.55.2=
.bb",=20
O_RDONLY|O_CLOEXEC <unfinished ...>
/tmp/oe-selftest-dd-poky.log:46904=20
stat("/home/src/distro/yocto/poky.git/meta/recipes-devtools/libdnf/libdnf_0=
.55.2.bb",=20
{st_mode=3DS_IFREG|0664, st_size=3D1945, ...}) =3D 0
/tmp/oe-selftest-dd-poky.log:46904=20
stat("/home/src/distro/yocto/poky.git/meta/recipes-devtools/libdnf/libdnf_0=
.55.2.bb",=20
{st_mode=3DS_IFREG|0664, st_size=3D1945, ...}) =3D 0
/tmp/oe-selftest-dd-poky.log:46904 openat(AT_FDCWD,=20
"/home/src/distro/yocto/poky.git/meta/recipes-devtools/libdnf/libdnf_0.55.2=
.bb",=20
O_RDONLY|O_CLOEXEC) =3D 20
/tmp/oe-st-maint.log:13543=20
stat("/home/src/distro/yocto/oe-core.git/meta/recipes-devtools/libdnf/libdn=
f_0.55.2.bb",=20
<unfinished ...>
/tmp/oe-st-maint.log:13543=20
stat("/home/src/distro/yocto/oe-core.git/meta/recipes-devtools/libdnf/libdn=
f_0.55.2.bb",=20
<unfinished ...>
/tmp/oe-st-maint.log:13543 openat(AT_FDCWD,=20
"/home/src/distro/yocto/oe-core.git/meta/recipes-devtools/libdnf/libdnf_0.5=
5.2.bb",=20
O_RDONLY|O_CLOEXEC <unfinished ...>

I also put a new recipe in the same dir as libdnf and of course the test=20
complains about it.


--=20
# Randy MacLeod
# Wind River Linux

