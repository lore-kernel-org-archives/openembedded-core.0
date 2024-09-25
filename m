Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE05FCF9C6B
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:37:37 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.57])
 by mx.groups.io with SMTP id smtpd.web11.16404.1727271447829475626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 06:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=jVrL97bh;
 spf=pass (domain: cherry.de, ip: 40.107.249.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVCW6UXXVDKDyUmVcPWe63RH84ATaytSnXh/ICZa6j+4P59WqGTChQzu7dHi/O52TajT8fmWm+SIktyqDtxtEMY1Q6Sza6CNhNDTVQR7NsoNMPGJvu7MwCBuLlnGtG9LgYpbcoJTaOR0ticuAdTq3QcOPRBQcVTDqvKMEqXT4GKtZ4q8BLkBF+GerV7TVzwUD8OUeubEAC4pSXhIv7mSN20GtYArKbA6jHb7/qpu/CEFUPg4Ldnq7ADX7zzmqn9Q3jApuNj1P4u5zKB6wPzWrGtk+TgFark8phKXKfSH2XXEDeKWGzRA0o3rNysC8BMVyvQv3mwI8PS1L7nwAmTeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rZz9NJIa8vfXhtzM5WX2lNAWfITHc430ZqtbSmh33Q=;
 b=dgct28WkwF4T2IMBDxMPLa3cUGj846OhtwCekMF6KGN6zvlyjGhSJOKiYcjPCRbC1NqKa3YzaOuOp7IdMNCXWTX4hDQp78IzazwDnbuwwESWHKSV3qSxg8FzhD6MORnD6CNzGxDuLDOaVzD4adaxZ3MG7mIGHAkosKgk7CFA/etVyuyByl8Uvh7/m6O5daorl1cTOQdo0jZ0g/rLlHRePLz3SPqsu9GtbXqT2l7CXJ9qIRyAhqd0oP+hQiq7kXckVOg7EkfD+cYtPCUxYpcW7/7+za8oONYX31Cl4dWzje7YYTS4r5+JS2Z1xcZ3VbtMYRQ+Z/PN4wNy1SjYGuJorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rZz9NJIa8vfXhtzM5WX2lNAWfITHc430ZqtbSmh33Q=;
 b=jVrL97bhktXekHAw1bRbiucpQT057MFQ4Tc4QOAfVhkjqM22qyS4mK4zks0h2qu99qxncZnRGkfzS/z58lLogJUei3v8+k67FFS3Yu6iQE38XjGMPcMbQxHQOdxuePlhfxv/xFbu5A4+hpBHxNhcyjObUFRlvQ3qCN9SxjlY88I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DBBPR04MB7676.eurprd04.prod.outlook.com (2603:10a6:10:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 13:37:20 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Wed, 25 Sep 2024
 13:37:19 +0000
Message-ID: <bd0c9228-ac33-4334-ba40-5d739951b14d@cherry.de>
Date: Wed, 25 Sep 2024 15:37:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/5] linux-yocto-dev: bump to v6.11
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
 <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
 <4a44e457-b17b-41c6-8e10-18d9fbea4a88@cherry.de>
 <CADkTA4NqO5uGBJu7Oe79vurUss8cPBUW7wqVF+wRcj25WEf4vQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CADkTA4NqO5uGBJu7Oe79vurUss8cPBUW7wqVF+wRcj25WEf4vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::20) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DBBPR04MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f8a7a3-6eba-4e93-ad20-08dcdd672d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zedtobilBpNl/jMq+yxuJRbTxbLTsCBTnPq54saax4QcY5Z4B4RWXBtirSId?=
 =?us-ascii?Q?DtV9fjs8wuP2q4lbda21NB9kyLac8A4fzX2h5z6u1OsNwAxb4YtPG7EUTHTS?=
 =?us-ascii?Q?Y4NQfzfcdnlAYEh7yq7RBgTauTXM/HQBJh23W/yTGhhxz+z2B3wFaM4j0kZF?=
 =?us-ascii?Q?L5maWh9FT3TLz/4sSJwFuqstPmbBodeWziQQkxKFNS7XHhITiBA7awuFvf7C?=
 =?us-ascii?Q?oBzpUKEQ1b+3+FWZhuaakQSPr6Ik/leimpwUnHuTN0g7E0jbnMtUEF3p/eL2?=
 =?us-ascii?Q?uqhtJJDQSeB3gsMIGc9L69assbsiHguYPBMEBIhkVstpnwAdZAb1PxO93Xvz?=
 =?us-ascii?Q?9yu+kUwEPAPX8enBizKMrmjHg/mOytHMPHD53TlyfYYr/RXp0Jj8i3MpW0zS?=
 =?us-ascii?Q?U6pzRaFUYbvOVpkWIgZ3Fxyx9QzCYBblpBn3Sh3z72JAvtoh2qNhSQv4KyLy?=
 =?us-ascii?Q?7PSliFGmX0AzGrc54k8GV2ErX3wX9gzXAtBtETSF3aI6CDPYO8WXNfJJvSAR?=
 =?us-ascii?Q?uJsQl/ECwXOyd/FGJKA3SbKqpXeeCxdXIqBWq8WJyHtWK4RgkPkMnaWql+Ec?=
 =?us-ascii?Q?FgrHlhNGf/VfNWL7r9n1W5H0TfgwWs0JKBl3aXUDchvMkdX0UU4PfJ5PlZ8H?=
 =?us-ascii?Q?kO55v3kPbRfx3RtL63I1aVi/74QooEnF8L5naQMt+y7j9CHxTw978t/c5mWl?=
 =?us-ascii?Q?yRnjGzwubA9d17/mnkPMySbU2b58FkDY7mpjz4nHF5s09TrF6XPueuesqALg?=
 =?us-ascii?Q?aqZpcvhVETHrohFpyWX49ZRJrVqCq4cEXnJi8jaldItANSDIimdFM7L1fz37?=
 =?us-ascii?Q?qp4yLxIW+xovZi1r4q0KhQv3mz8GEIF3gh55+YwIXm6ifX/BqPdN7j0xin/g?=
 =?us-ascii?Q?QkIeG/i0jvgJXh6b5NrPGqfWg/tDiXAoH7LBDxWfZlxBvAacu+M3x/pwSmsa?=
 =?us-ascii?Q?OGrkVZf0m3Aj209mYEIhgd8lsicOZGk0jBBl6nx6Gi96KWjdYuKm1+20sbRl?=
 =?us-ascii?Q?ylAU28E6jAFUM39PEluIvJN7c3QTk/+N6VfkbyvsDhdmeMfr0BQOZSEsE8Yu?=
 =?us-ascii?Q?nYogQab9JgujL+b1TPYs/o7L6jtYhaQ0zkd7mqeUzjR9DBLbi8GYI14qSVh1?=
 =?us-ascii?Q?8DIvQtCBseIba9vZW1xZsXw2LnMo8X7DLk61YEfv4Kp8hVtPoqCzvxlirGJK?=
 =?us-ascii?Q?nTLjjkZ8Db9MBGqSEw7C7/YjCFPu5aQcM5CZmcrsbpz3qGGl8qIMZGroSVA?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZqWCzsf9634hrsXlcDw8o918gUj9VO9t+PtxeNrkLnvlCmjJlafbkvnWf+ZX?=
 =?us-ascii?Q?2mPRN8jlcrVa08vSYBFklzPlIp6NtgsXjBdoNJ64BppHySIyi4KovtqvXBjO?=
 =?us-ascii?Q?QVKzYKaSjUsUxqglYp3iYwdsdNXBndH9fZYkAZNcqfSb53Q57BzTFhAbNz+U?=
 =?us-ascii?Q?sFGqeZDd2xn9PNNXUy5QX1lYXIgrGoh9CLwaCf+EZDsx3Qki1et7HfIQFA8/?=
 =?us-ascii?Q?rn4AlKRo9owVudxEUUp+x5Ge/XjgFuvyBDVuSNPTTsCxyEiT9AwefNmj8qN/?=
 =?us-ascii?Q?rcp21RpO1vtNWO/d51iBLCnLNVjF9iodq/F+8+WlQOaZL0+p6ufCh62WraXT?=
 =?us-ascii?Q?X5n0WdjqFfKCZeaQcRxGezwPxn0ID0jMHpzZL0qgLbirQZWxFsXjddsH4GpF?=
 =?us-ascii?Q?tyVn+I+kZGimSQT80zHS1WFasxGfLcWS0lstHWrXvtygWDEYuFIkxEawHacI?=
 =?us-ascii?Q?P1LQYYdK5/qFa8yDZ2mOQ91kEfSqsBABekt54kLhRRCIrMlMZUrDudCKTMXA?=
 =?us-ascii?Q?6Z/F4Dqv1Q8bg74Cmzfj0gZGLrzoYL4bDr95v59PCy4pcj4X9D08sUxGGLob?=
 =?us-ascii?Q?AcK3Y2piPSJkbIgxVgjlb93ikSidN2GgR4+8Q2HJISqpCHOQOx8XyhHOokWJ?=
 =?us-ascii?Q?Q/i1PFQBbDB03f5lL7ij43kGpQBhIXHeAli+5Q5Y6atXfCLlcW5CXIDnb6NB?=
 =?us-ascii?Q?Q8CQsI4dwrraeEmCMYUhqDSCNT2x/1CzNTHffCEKJTZDvGvpS23PXtWOcnX5?=
 =?us-ascii?Q?zgThASU/jUko80VK8z/k4rvSGGM7EFAPqkp17Y6hbKgoM2EeIZ2wf/LhET0q?=
 =?us-ascii?Q?tY2uYGUBrY9a1ghghW1BN2LxcMOLtEnkM5O1H7FWZa2PSnC+QthDbvKl4LCz?=
 =?us-ascii?Q?ug72A0FMnunL/yKxAxbhy+6ovkhFghmartSJOvCNEnW+kvkY7g+bcYV2pdoU?=
 =?us-ascii?Q?BjRv4AdyY0BrHDYZ+/RgW4B5jBtYWS7FBEfZbtgg+8Pe17G8nNvvmWLJspX0?=
 =?us-ascii?Q?UGsDc5hDG/FudJx4ie8P2Cau9G8MkthuPv5/dISb5qw5eX0+sW1PVGOWoMz9?=
 =?us-ascii?Q?me5ZvdOkJOGIVfBl5fJfjt48P3gBswdLo2HNxnS6dbJFye6MPSc1FOGivuqr?=
 =?us-ascii?Q?3s+V5F+m4BCoJN8UWMvZ03JggwZT3LLd6bNFeWOishodzw7xWhCY1CZ/GZzl?=
 =?us-ascii?Q?vwJ/sIbupK3O5x+z4A9A+Si7Zv/QN4qlmLhN9Oid9yi0CJvPdJtzo417iCwE?=
 =?us-ascii?Q?/6P2BvY7/dMhh2/6efnTvGDFFi1Zx6qfmFNTnT+qqEAbGHU7LPS/w0x9gquG?=
 =?us-ascii?Q?Mi50e0RoAnrEnw+wWyrbuIqbxWadU7jX7KM2gVwB9FjfVwx+o3b0tFcIz4ya?=
 =?us-ascii?Q?3L/8e1I+syZ/Gs3CjAcpjK7lGFmDj67Mc7vEzfk1+xU6vczfVMQRq9MkgXdX?=
 =?us-ascii?Q?IlMKCr2duYDPEQ7VAKbjpTYMibcaFe/Chz9pzCnZ/MAlDKPi9i2cvrigmozM?=
 =?us-ascii?Q?irFZ3bAZ1oFknjy4RF6CuLLmfE77nMTFBD0frNV6iH8Z5TQ83v2d0QX7WwId?=
 =?us-ascii?Q?EAjNaVRnd7+lrpU4hqdD0435m9PPpknUx/d7hcZhaflQtbpFxQBorAOPRAGv?=
 =?us-ascii?Q?He4/N/sqhrQt3iVxWmpax6k=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f8a7a3-6eba-4e93-ad20-08dcdd672d82
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 13:37:19.6654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpbzgE2PxwsI60KCFyolcS3oIdS/vJh0hMguSptu62kImxEPdy9gIrNgnuhpIsybKejQoCk6o9Em6Ab3DV14OTpxAnnVp5Lmc9wFa/mP1Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7676
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 13:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204957

Hi Bruce,

On 9/24/24 4:11 PM, Bruce Ashfield wrote:
> On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Schulz <quentin.schulz@ch=
erry.de>
> wrote:
>=20
>> Hi Bruce,
>>
>> On 8/11/24 8:04 PM, Bruce Ashfield via lists.openembedded.org wrote:
>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> ---
>>>    meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>> index 0097fec7b2..292897ce43 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>> @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>    # provide this .inc to set specific revisions
>>>    include recipes-kernel/linux/linux-yocto-dev-revisions.inc
>>>
>>> -KBRANCH =3D "v6.10/standard/base"
>>> +KBRANCH =3D "v6.11/standard/base"
>>>    KMETA =3D "kernel-meta"
>>>
>>>    SRC_URI =3D "git://
>> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name=3Dmach=
ine;protocol=3Dhttps
>> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D=
;name=3Dmachine;protocol=3Dhttps>
>> \
>>> @@ -28,7 +28,7 @@ SRC_URI =3D "git://
>> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name
>> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D=
;name>
>>>    SRCREV_machine ?=3D
>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>> "linux-yocto-dev", "${AUTOREV}",
>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>>    SRCREV_meta ?=3D
>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>> "linux-yocto-dev", "${AUTOREV}",
>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>>
>>> -LINUX_VERSION ?=3D "6.10"
>>> +LINUX_VERSION ?=3D "6.11"
>>>    LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
>>>    PV =3D "${LINUX_VERSION}+git"
>>>
>>
>> I haven't tried to compile linux-yocto-dev but I have my own v6.11-rc6
>> based kernel recipe.
>>
>> It failed to build on Scarthgap because I was missing coreutils-native
>> (specifically truncate binary) because CONFIG_KALLSYMS was enabled. This
>> comes from
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95
>>
>> It seems there are some config fragments in linux-yocto-cache
>> (ktypes/base/base.cfg) with it, so maybe we want to always add the
>> dependency (or is there a way to add a build time dependency from an
>> .scc file?).
>>
>=20
>=20
> Interesting!
>=20
> I build linux-yocto-dev nightly, so I can confidently say that this isn't
> being seen with the reference recipe.
>=20
> I also do have KALLSYMS in the default .config, so I've worked through th=
e
> same new commit and enabling option.
>=20
> I get truncate in my kernel builds via hosttools, so the dependency
> wasn't/isn't needed.
>=20

truncate isn't in HOSTTOOLS in any release yet, just master.

c.f.=20
https://git.openembedded.org/openembedded-core/commit/?id=3D522000ce5c4f020=
1cbe42d7826b6a8489ed10117

This means people won't be able to build 6.11 and later with=20
CONFIG_KALLSYMS enabled in Scarthgap and earlier releases...

... unless we backport this patch to still supported releases?

BTW, I could reproduce on Scarthgap by checking out poky in its=20
scarthgap branch, then running `git checkout origin/master --=20
meta/recipes-kernel/linux/linux-yocto-dev.bb`, then adding=20
`PREFERRED_PROVIDER_virtual/kernel=3D"linux-yocto-dev"` to conf/local.conf=
=20
and then running `MACHINE=3Dqemuarm64 bitbake linux-yocto-dev` from either=
=20
a kas-container (4.3.2) or Debian Bullseye.

> If we do add the dependency, it is best done in the kernel recipes
> themselves, as they are versioned and we'll only pull it in when needed.
> Eventually, it migrates to a common dependency as all kernels gain the
> requirement over time.
>=20
> That being said, I'd rather not add coreutils as a dependency until I kno=
w
> it is really required.
>=20
> If you try building linux-yocto-dev on that same build machine, can you s=
ee
> if truncate is present in devshell ? I'm not seeing an obvious path throu=
gh

Sadly, kas-container doesn't allow me to run -c devshell :/ (well it=20
does, but then does nothing :) ).

truncate is available within the container though.

Cheers,
Quentin

