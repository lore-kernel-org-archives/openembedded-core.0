Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2537DCF9C6F
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 14:07:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.14])
 by mx.groups.io with SMTP id smtpd.web10.17028.1727273219628424913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 07:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=LAhi8G9A;
 spf=pass (domain: cherry.de, ip: 52.101.67.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg6NEjbJnIY5SlJFZl2EhyddW0Jo136+WDiuOSlvjhbbK/qO2oTpISeQVp2Qh8sL4Y1IcSeHi01NQP+HAj/lijhB5/qd/HM68cJj/AgVGhlSQ60nz7591D7Cnu88QZk9898dcR968caFSTyQfeZIxNLbXREEWuOxIZ3LSAcESPdpE8/Zr4wZo05nNkXzC6uaImCQ3EK40fPezU52uzfzlF/+96BKbvKo9IZoPasPaK3pV1UGlgljou+/tEywg4X9v2SFedgk93Wqi8EhCxhLdyVNej7uztiHHiRxMJa40Iz7A/GoVZVzRiXIUDm+Tl4xls1ikA4XWLzB7OWJHUsOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmNkfz2IWvjQYmkurfKK5/Ig3Rdbt8qwAUsDW3St668=;
 b=hM8bN5TgorZWIdrHc7TLBXytWRRYTEwSHVhz/Un9/z5S6Aart82sKj3sdhzp8OeDWSs7zpWynYuv7NQt8AfJyI6ePKW707GsRxIM7+zos5aZkY/h0CxwSl9TmwwJ2g4bfvfy8RNjJBKGVCucqSwTw6AD4kspivaVx8LAkLvdEcLk0CeJYrSGxhjCkgnSAdjGJp8sVWTrYMdHg1Lu0WdmRpyQuBsjmucS3PTLVHSEWI6bqzjfsVWDFAXueJokFGnxZv992dJL1JWUqOb8xSkyzglGA/RJxIv91v43ehwQ/qjnOMuNvgF5ztdlEJxDZAAK8y1nJH60Ek6xDUnYgV9XuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmNkfz2IWvjQYmkurfKK5/Ig3Rdbt8qwAUsDW3St668=;
 b=LAhi8G9A3AH/+35uonfgdksx+y8Z5P+R+UpMwRpBTPkVwGm/ehsoOh7vMrY7mngmPJniDzyLIx2/MiPrhNk/9KrbiMLnufFDBxl0jfKQ9qqXWWTw4eR3eX6Xws3775+mp4hs5UD/X1h0TB4Evret+xVAoXCNJ1vYBlT6pxG5Bt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GVXPR04MB10971.eurprd04.prod.outlook.com (2603:10a6:150:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 14:06:50 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Wed, 25 Sep 2024
 14:06:50 +0000
Message-ID: <7422f5a8-b872-4f89-ba10-1bdc642993c2@cherry.de>
Date: Wed, 25 Sep 2024 16:06:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/5] linux-yocto-dev: bump to v6.11
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
 <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
 <4a44e457-b17b-41c6-8e10-18d9fbea4a88@cherry.de>
 <CADkTA4NqO5uGBJu7Oe79vurUss8cPBUW7wqVF+wRcj25WEf4vQ@mail.gmail.com>
 <bd0c9228-ac33-4334-ba40-5d739951b14d@cherry.de>
 <CADkTA4Mk8wCpLGTEeYZXOp2OFEM2FObwU28bKK3gN=huD_6a+w@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CADkTA4Mk8wCpLGTEeYZXOp2OFEM2FObwU28bKK3gN=huD_6a+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GVXPR04MB10971:EE_
X-MS-Office365-Filtering-Correlation-Id: 942cc281-e5ad-4925-4721-08dcdd6b4cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kL9j6Rw3oezx+iVvpppjLw43+jpoBvDVyXPXD8BxcWbrpLzoWtiPRs9VFxm7?=
 =?us-ascii?Q?ilVgOJGRzTUJr66QtUEewJSLLMRNnATwn9ltdFLmovEHErggq5ZDqmv9gkyr?=
 =?us-ascii?Q?cZHALI3W4rRZSz/JJ3C0kHGZhWsbWS6pvLc/A1+J7fA7MAeTzHbZFpvY0QTq?=
 =?us-ascii?Q?Xw/6wCyMSscdKxM20xiiVz0PWRqqC1Pkb5W9TyAjlzb1dGOrN79izuSmZSk4?=
 =?us-ascii?Q?NuYggRTypas70L0I41Hej2wf2zpvok557CbtYSheWn1COzqeH+1rM1dbOBZc?=
 =?us-ascii?Q?BiQB36Gf9V8JDPoyxoQ4OHCFl33U+TPFx1a6baNtOyS3iRauZ9aNsxDn5oUJ?=
 =?us-ascii?Q?O51FmZVBc5OvO8A5/XbVf8jib2+icD1NyjHlkjg5WdSE5mkWslJB96l+TEZ3?=
 =?us-ascii?Q?MzApHxnUOquerT+2v4gVLbVsDgSzkCSJzXCTCKiIn2U6z6u7qH8pHhPmOg0g?=
 =?us-ascii?Q?6gCKunjWDLOy2h9NGQF5thpGlBPpkzRSsNb4UEHf6PZvi0YHGXFkCLiIcLf5?=
 =?us-ascii?Q?694M73xR/9kh/TDDocwoDW3G+5JZkZjE6LGCRWYPHMHIhYWl2b9jbir2YRWw?=
 =?us-ascii?Q?KbLyTYhl0WxET1XVR5ztO+KANTnoWCZ9+9jMUZSJ3UXB1KgTih9oBkKFVppA?=
 =?us-ascii?Q?mD+K61nfznsuSk72FwoZYQEeTO6ZG/S4x3XlPdpsEnaManV1K3fNRzWcX/dQ?=
 =?us-ascii?Q?gyb9x0TL+uJV+tvYwPOt6MHNPAHXm6c/KiveuQ2e7jsjTgMSeadIE6voUEnQ?=
 =?us-ascii?Q?GU9Xg2kWQ7FHYXHMtR8JH86ufMRZssyxvt5CTaR+c894IkE0kJZAdLUZFwsb?=
 =?us-ascii?Q?m+zOk+zvgcd2SGdt9+4NVOV6MRrS33EokSdsNYBR1BhrEo86rk0OVLvllHn7?=
 =?us-ascii?Q?bYoa3WAYTTUdzNpceAdXzka3B48siErr0L5JDwgJ9ao5lKVFC+M8uvgwN4nj?=
 =?us-ascii?Q?+y4MFmly3iyLi/I1q98BJxXNwz1dvWf5YQ53groV6l2bWYxDFZQ3xTJLuUM/?=
 =?us-ascii?Q?IbjENMJPubZDINe4cXOFq9+QOGKtoKqmlROhpyOICsX+HWXYrppXCy486q8K?=
 =?us-ascii?Q?OwH6ewef9d0PlBxdk+YUKVdhgGTgOLcllGq3/mAApmjJCfAeFeC4KzOU1cTA?=
 =?us-ascii?Q?LBV20x2UpgZQycb58nZx8AeqSxSDLDi23UAa9Z2KvtYjM4dMpCl1lq/UQQT/?=
 =?us-ascii?Q?h2bmV0gF6FTgTwTIVJLtwZd3C8crNkdTPXJhkNpuOMTfTU+ff6GDhT7g4ui1?=
 =?us-ascii?Q?bN17YryP8MfAoThN/AgrHLEBC/T1wmL8s961w/tOSVMIadndcWlCCSYIs5Lj?=
 =?us-ascii?Q?e38=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JXULOcgIuD+8owGTt8T0YRoeYv5manyBN2LVKcVLyhMHcZTjLnATr9NRu3DK?=
 =?us-ascii?Q?h6kj3KwlbUt2zPUV9yknFeERbvyYxo8WLt7MIXkVybpmzIQPa3dYut3erEcl?=
 =?us-ascii?Q?OSL7GMbm2pkpXPyLVZH3TP6s2PvPY//NZcLM98Sf5d2euO8pXZrLH0LLD2tw?=
 =?us-ascii?Q?TVLrYaISCmMxIJUO3ghC6qsHXzehvcTybIu01jMJRoPDI55xJkP3qaHeZdQa?=
 =?us-ascii?Q?UNQR09nI/ekkvBt8p80oOQTpjr4cC1gl4IJvKpcwaSVsfRfEX2DrOHfkY2cL?=
 =?us-ascii?Q?z2Z49FKxwjZNlMhxNG4ZqwdL+xKvfPTffCpaOqmNu1eF2b483NtdSTn31nCG?=
 =?us-ascii?Q?k6yB2oQuWTwMa1FHFOokld/H3OSDyM27gl3oMvMGrYVjpBaq6exwJT/hYvUm?=
 =?us-ascii?Q?MRPDycxmw4uamw42ns8fUHfzEjRf6yoUSiH5Cn3+UX8WtIA0drdgwqMZqrKk?=
 =?us-ascii?Q?UKEdOh6ikqP35amECKiEJWdMG7AZcnwE5PjVNRuMV291ncRG3WGGiheNFRlo?=
 =?us-ascii?Q?FGMCIgq7Al+plHt7a1sMVPqz1jfvGXz7sJfppolMoMVord4wj0GBsxeMgWzh?=
 =?us-ascii?Q?2KWdGMjAcAN+HvgVOWBQwSq8iHzHsD4ZU5t5/+3cKq4sxgl5xCMP+Q+MVJN6?=
 =?us-ascii?Q?Oo+IWZuhltLPD92oXKmDArrP/FKTfHLfUv/Bc61SRfZnv06HYGE3iTWtA0jY?=
 =?us-ascii?Q?tOeh0Z2YaYXMrarea8Gg2Dlphk2Q5nsrR31Tfu+mY3OvL7npOOoEid8DUANm?=
 =?us-ascii?Q?nTa4fz0ER15EsZ7B7hNQ9Mmd8WRXUX5T1VPRIXCWT421FhoJZozpnlI+aUo2?=
 =?us-ascii?Q?ieKiX281dit8iWeIfW8TnagLMbUgN1qRcyrcXnwN92LyQIKwt79KOfVXGAQz?=
 =?us-ascii?Q?cMmSwuYVLq7U/+VIQMgIZljUFw+jJPUnBcc2PYkjeOqAQv2EQ/vv3/X72Czp?=
 =?us-ascii?Q?HRNPTUKpZmaRwZ/ho69edSKqKyCDpjwwvJ5jYfvwhuuP1y9UmpNTTXI3EufS?=
 =?us-ascii?Q?ni33T0XJZJhD+opNG/GiWRxvLWNBqk6Mpgp5bQtI20fk6vtS4FFPmJl2iyl0?=
 =?us-ascii?Q?n3sW56mretoD1L5o1n5KeOatTPIu34SJuw0Ityfy/d543+AIAEmxvB+UEhLH?=
 =?us-ascii?Q?Fax7B1PuTZ3QPH2ZZa7Z57MMZsnnWKF6wmRD9qHyNcufTaYUq9x31X+/XWjL?=
 =?us-ascii?Q?C/OQ06xKMRiguDKHQyxbVgrhinRUvtNViIroaKdTcsghBSnJAQXEkFK4OGRV?=
 =?us-ascii?Q?4mHcTAFNR5VOzR0nS7wOe3lstTd69QvV+vakjCOMFFOq7vEVFUIvwDznWfRz?=
 =?us-ascii?Q?hHs1mTRxdXgjxWk8eAEs14d00sceS9UdMGYdagHieQnKaZBxMIM/G4g9nY5A?=
 =?us-ascii?Q?KuNL38bh0LDJDivqPv2dJ2K2X0DbHG9HBBwtVZiyUGtWmNG0DMNAIVADhUwx?=
 =?us-ascii?Q?Gwz0pqI18qOKSrZYgys/bkikzZy3srW8/Wokh1gGYK6Mw6Y8/u/K992IBWBw?=
 =?us-ascii?Q?OPCRKDwdGIATSY18C2xiJsViqMmAwWVa7H9SVIxxvViofCp4TSG+yYsMYTum?=
 =?us-ascii?Q?MD/Hns+OowOX5DwG7qUOC96mgYHFUw0wxzIQ2NnNKDpHpElMfyIf4/rkqM0x?=
 =?us-ascii?Q?duCZsqyM0mgGeupZ9akeho8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 942cc281-e5ad-4925-4721-08dcdd6b4cea
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 14:06:50.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbcKwFbTlqigLqkhdhCfOsWH66H09WBqyAfKfC2lyWNfQKSt+72fVe34dcGlZd+J/Ixu1XKn10GhfFjoGuXIN44c6WSDq14N+9apJFhoS1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10971
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 14:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204959

Hi Bruce,

On 9/25/24 3:57 PM, Bruce Ashfield wrote:
> On Wed, Sep 25, 2024 at 9:37=E2=80=AFAM Quentin Schulz <quentin.schulz@ch=
erry.de>
> wrote:
>=20
>> Hi Bruce,
>>
>> On 9/24/24 4:11 PM, Bruce Ashfield wrote:
>>> On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Schulz <quentin.schulz@=
cherry.de
>>>
>>> wrote:
>>>
>>>> Hi Bruce,
>>>>
>>>> On 8/11/24 8:04 PM, Bruce Ashfield via lists.openembedded.org wrote:
>>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>>
>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>> ---
>>>>>     meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>>> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>>>> index 0097fec7b2..292897ce43 100644
>>>>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>>>> @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>>>     # provide this .inc to set specific revisions
>>>>>     include recipes-kernel/linux/linux-yocto-dev-revisions.inc
>>>>>
>>>>> -KBRANCH =3D "v6.10/standard/base"
>>>>> +KBRANCH =3D "v6.11/standard/base"
>>>>>     KMETA =3D "kernel-meta"
>>>>>
>>>>>     SRC_URI =3D "git://
>>>>
>> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name=3Dmach=
ine;protocol=3Dhttps
>> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D=
;name=3Dmachine;protocol=3Dhttps>
>>>> <
>> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name=3Dmachine;protocol=3Dhttps
>>>
>>>> \
>>>>> @@ -28,7 +28,7 @@ SRC_URI =3D "git://
>>>> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name
>> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D=
;name>
>>>> <
>> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name
>>>
>>>>>     SRCREV_machine ?=3D
>>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>>>> "linux-yocto-dev", "${AUTOREV}",
>>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>>>>     SRCREV_meta ?=3D
>>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>>>> "linux-yocto-dev", "${AUTOREV}",
>>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>>>>
>>>>> -LINUX_VERSION ?=3D "6.10"
>>>>> +LINUX_VERSION ?=3D "6.11"
>>>>>     LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
>>>>>     PV =3D "${LINUX_VERSION}+git"
>>>>>
>>>>
>>>> I haven't tried to compile linux-yocto-dev but I have my own v6.11-rc6
>>>> based kernel recipe.
>>>>
>>>> It failed to build on Scarthgap because I was missing coreutils-native
>>>> (specifically truncate binary) because CONFIG_KALLSYMS was enabled. Th=
is
>>>> comes from
>>>>
>>>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95
>>>>
>>>> It seems there are some config fragments in linux-yocto-cache
>>>> (ktypes/base/base.cfg) with it, so maybe we want to always add the
>>>> dependency (or is there a way to add a build time dependency from an
>>>> .scc file?).
>>>>
>>>
>>>
>>> Interesting!
>>>
>>> I build linux-yocto-dev nightly, so I can confidently say that this isn=
't
>>> being seen with the reference recipe.
>>>
>>> I also do have KALLSYMS in the default .config, so I've worked through
>> the
>>> same new commit and enabling option.
>>>
>>> I get truncate in my kernel builds via hosttools, so the dependency
>>> wasn't/isn't needed.
>>>
>>
>> truncate isn't in HOSTTOOLS in any release yet, just master.
>>
>> c.f.
>>
>> https://git.openembedded.org/openembedded-core/commit/?id=3D522000ce5c4f=
0201cbe42d7826b6a8489ed10117
>>
>> This means people won't be able to build 6.11 and later with
>> CONFIG_KALLSYMS enabled in Scarthgap and earlier releases...
>>
>> ... unless we backport this patch to still supported releases?
>>
>> BTW, I could reproduce on Scarthgap by checking out poky in its
>> scarthgap branch, then running `git checkout origin/master --
>> meta/recipes-kernel/linux/linux-yocto-dev.bb`, then adding
>> `PREFERRED_PROVIDER_virtual/kernel=3D"linux-yocto-dev"` to conf/local.co=
nf
>> and then running `MACHINE=3Dqemuarm64 bitbake linux-yocto-dev` from eith=
er
>> a kas-container (4.3.2) or Debian Bullseye.
>>
>=20
> Right. I only target linux-yocto-dev at the latest master where we do all
> our testing. The support matrix of ever newer kernels against the older
> releases can get complicated, but we can at least say a given release
> supports the reference kernels + the reference -dev kernel version.
>=20
> Anything more we do on a case by case basis.
>=20

Oh for sure! I wasn't implying we aren't testing appropriately or that=20
we need to increase the number of kernels to support per release. Just=20
that **some** people (likely me.... :) ) may want to support 6.12 on=20
Scarthgap whenever it's out and that will be an issue. The answer to=20
that issue could very well be "upstream isn't interested in supporting=20
this for already-released versions, just handle this in your layer".

I assume one could simply add HOSTTOOLS +=3D "truncate" in the kernel=20
recipe and be done with it? I would be worried to add it globally as it=20
could then break/change other stuff since the host's tool would be used=20
instead of the one in recipe-sysroot-native (is that even true?)?

> I'd go with that simple host tool addition, rather than adding
> coreutils-native
> as a dependency.
>=20
> I have a patch locally that can test hosttools and if truncate is missing
> conditionally add the dependency. That balances the speed vs supporting
> non-default host configuration.
>=20

I'm not planning on using linux-yocto for our products so was hoping for=20
a generic solution maybe? If there's one :)

I guess adding truncate to HOSTTOOLS in conf/bitbake.conf in an=20
already-released version is just not something we want?

Just looking for guidance so I know which direction to go in 3/4 months=20
from now when I'll be supporting 6.12 :)

Cheers,
Quentin

