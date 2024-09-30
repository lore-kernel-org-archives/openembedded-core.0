Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF6ECF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 10:09:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.85])
 by mx.groups.io with SMTP id smtpd.web10.50937.1727690977564373799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 03:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=g4mt8S/4;
 spf=pass (domain: cherry.de, ip: 40.107.20.85, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXd+3g+C7x3LBnytBmo2zr0PMNGTL0QvQh3wuOIHVt4yDwdP6tIhWKPAVGjZOMhCo47gNdlt2isScaZqxvboa1oLzRq1ma9kchlBk9Zj5TdpSRTkAUjq0oxqwnotEEzdwlZtN0AsaqSbJRJ3dlnhBRIKXBZfukTEFGs67LOvfMe7ZcEPnQNsGlSdothpQHlX0ILffRTSRjQtO/2RhUIwRdB6415tFMt9HbrSbGvk6Ze+4tP04svKTtsopCyWFJFDZyoqbESfnGZAevr57wjJrDpfFEwvo6L2lc5qQ6T3cQoNd1DwkbKL2UXMxpT7zd2qQEXov+X+Fj6h1t8Tw4kiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwQyZ1wFRzY2NPkCDqpKlFoFKD17KahHbrhqWBw+6DM=;
 b=KdpqJaKP+9UJu9rH970eWF2wqygGv2SiR/RTTUcrsaKGTRlJXuaRixhk6bu/0MRpyokspyGitaYy3Nux36s0SBo8CkyVwZEcBwo88S47ZXbBf0rM2j65r4LXx3BWbsROQPW5kWWYoG3CG2khIn7DGQ6u61ADoigEflBCUe5pO/2xOpkAAVR/IoU3bjUsU9uIytHzvrYMx9c+B8Rsjt+4uDAB4jLTnwCchpXZw6Z+VyHQKBgJeb42SaWpWKGDUvLjohM49ooXnC0Mb0B/aifTQRToknDzaQAmjjG4KV4BdeSHjVHe/QvnprbyC5OvVB03DzZklQ6/+vxySpRvEBQw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwQyZ1wFRzY2NPkCDqpKlFoFKD17KahHbrhqWBw+6DM=;
 b=g4mt8S/4fPNUWVBxrjw5F77inPLdNbSzl1eEHp15/FHFCXe5GH2JHNnnRbxPLMHbvIg/BT6OaV+mejnC69OS4zuVmeleiWYbuLjbDG6dIpEmp2PSJCsBmOrpPI6qn4ORMyp86BR66atM+kNBEpTjxpYezZgBBrpvDV66zwes7K8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA4PR04MB7501.eurprd04.prod.outlook.com (2603:10a6:102:ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 10:09:32 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Mon, 30 Sep 2024
 10:09:32 +0000
Message-ID: <6a946e21-1e4d-43ee-909e-5ae51d1f90d5@cherry.de>
Date: Mon, 30 Sep 2024 12:09:31 +0200
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
 <7422f5a8-b872-4f89-ba10-1bdc642993c2@cherry.de>
 <CADkTA4O=fOj3QCzV6VzcSxBg49g8b5nVu=DY6zcbT1Z689EwPg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CADkTA4O=fOj3QCzV6VzcSxBg49g8b5nVu=DY6zcbT1Z689EwPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA4PR04MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 223c50b3-893b-4844-cb25-08dce137fa79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7nxYLDbTM6Nk255PdrP1rZXARkOHN0lh9RYnangB20vzPrG81ZnIeRMuTyVw?=
 =?us-ascii?Q?i2SRyJAsX5tCTDk3Bzrr9b1Raio9c8hIjCk7c7QXl4vv1wi+A/rEj5bt88IK?=
 =?us-ascii?Q?VQJ4uqYRsSbbE19WCp1uZDK+pZgBtem0+jKLEkK1JAFBTvAFZ0TnERho4P5b?=
 =?us-ascii?Q?Y0daZJ1mCEY8bt/o9XEFiLbm1hg6C+dzlF1F40MrTBXrHXQ8cMKC43W4fIM5?=
 =?us-ascii?Q?ML/4UvRpC2JEc9PP0IEHED2cIRrGCBPd0FaKai2qm1+wbj8lxFpF9lTEQIWq?=
 =?us-ascii?Q?OVf7zgiYturyV658eauBrJqAPUlz4HtTX2/i6Cvq84aJBrk5L5FwSztmSvIe?=
 =?us-ascii?Q?vFQ0WX1vpcDqWshCqzecn/moio8/OwbmhCWPw4kVmlIQk927LrtrzhliHWij?=
 =?us-ascii?Q?pjgLAOkbYTvWrIc8zqGdhqyqmw4YyQlcBVoUOVixUsXh/j03F+9+4fkD2XLf?=
 =?us-ascii?Q?tYmgd3p68pnUjfZLhrF8G2iCsgAn5jGYaXvNf5eTqMDjzvXufm8kXPax3aC5?=
 =?us-ascii?Q?msNYYavpg+7sR8KSLlh0w+uH0p/baEpN6QQsB6vnbmQY0vgillIuEf3FWgg8?=
 =?us-ascii?Q?wpagDpOH+Rk8stufIgwT37akgfNK1xIxTUmBFjijeg3F5gwteBVZR9Hkfdcf?=
 =?us-ascii?Q?AePCUCZFWIs2Fk7iuIgaXcWA5jps4THdWeluGYtkYWsAM4tHddBWW+FihiW+?=
 =?us-ascii?Q?rHTobo3ZFMi0WGT+KrMIrTKYxFUyi/tTBgJ1o/X+HhShw9/rm7v69irrUFaU?=
 =?us-ascii?Q?E6N2WStTDEddrxyy1LadoS0V5q43XnM2veMOaBrNZuXQYoXM7A1FTXtSAWL4?=
 =?us-ascii?Q?BWcUdu02h7YbdsQsDIrsbA+kHixrEvkGARtW+1rMGyY/8WUUdlh1tS534+95?=
 =?us-ascii?Q?P0in9hKWXNKSe04CZxJfpCVNHDPZXUKVtu2iQpkkt4cktLWc/lx7vo5zcHbR?=
 =?us-ascii?Q?GNeKX2MG1p99vLwwQbtUqFxGpKNRLBIHMeLZzRdv+1CCRzrDJrqXuRB6L5gE?=
 =?us-ascii?Q?2eoHo9FB1mqL7WX1dRiGGObyxqX1m5XVf4T0CzQjZNw/Fo1d+eOr7JJZBmit?=
 =?us-ascii?Q?G1LXCuTVX06NsIWY630CSOWeGksEaLgE64dBIPSrtZPckMMEnDJ/oGRwIFX3?=
 =?us-ascii?Q?Nh2EvqPQGBBxkP02hg/J4XRiCEFQlvpFrjBlbh5E80OFkKO3MyZjYoObR/PX?=
 =?us-ascii?Q?MDMTvbXoXBzh3unBBiTam3xabHGMl9kD3tz9hzHuYqCz0jnTNXpA7gtEFU8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fNJSuDH6wKu2qNADP3lGMr1iyWto4U7KXeH1Fe/bVCsUDZbcsfHiCpWXOu9j?=
 =?us-ascii?Q?9yd2BTMoYLtyPr+YvbgW7SRqvjOFy+Ma7DMCoTZYENY+FjxSoJXqHtuk3dh9?=
 =?us-ascii?Q?8Hbon/RTUmxJK5t67K4WjODiDN99kewqO455Qe0VMCg3goRwZC1KF7ycl3Lx?=
 =?us-ascii?Q?ekNLRQm5oSMiY1BsDwvPIw2GIwJ+Oh0e02gOO9+Oo0DUo+hdSI3V0e62tUHH?=
 =?us-ascii?Q?awnHMkkWdChEn/RZLfsLoHOYpA/asMqsRCpP4mBOd8UghJVdXR4TpNSk08+a?=
 =?us-ascii?Q?4XO2AHROtHJqH0LUcYET+i+08zeSQFx2uenaiMilEa7Ca7SxpQoqBw+WIMpt?=
 =?us-ascii?Q?o3/LJB3cmYfG3qXlGUVEeGt6EHOAc7rI75chiYXEYm+5aUcBn3gc/rIfDmqP?=
 =?us-ascii?Q?VGcdXHglT3wwAX1xb6xUHhX6gzjWkyHkyWg8MXDR3XCuHeIiw7ND0DgoSUSb?=
 =?us-ascii?Q?2nA4VN7NhEbQ/9hZ4LiP0EDWPfvUWwqSakL2ifB3O2Gagmqm8w0Oegzgnus/?=
 =?us-ascii?Q?h5ICTNtk69OTlqExLpAwq+c337PjXVD9KomyDtNTKKnP8beiJW4VoGDupA0R?=
 =?us-ascii?Q?/STF+Xh/0bTRttQ1hNgCUhkjhquujNhZymn5l72RWeKsDwwujt7uVlgvOE1+?=
 =?us-ascii?Q?iCHaItdSNurct/Pnsy8ezONNbbzY4k9czvu4/r11ZDcUHePZoLzDtLYg5kxm?=
 =?us-ascii?Q?3LLGrB9DZfG0oSpwtTslO47x05THoACWo1n3C+OgD2w8I7zhoWeTA5HzLNAa?=
 =?us-ascii?Q?5NeW3f/HibvVi6C69HteZBMZ6lwWHWtmH+xnYquHH6FxQKL7JlrYAkAaEgze?=
 =?us-ascii?Q?f5VHxRqfIsacwF1GSTa/AR0MOOcsmcYXDk+NVielGIplU2p1ksCRFtFlZaEY?=
 =?us-ascii?Q?oovSajcCfdtEgPLtkvQtyY61WbqbJOsxdg4jsDR3hzAcEKfaY61H7zCiZl+R?=
 =?us-ascii?Q?X6PxMISLB5muW3x/65l9TrUG+gxF8bU+bml8ANoOBt9lzUKn7WPL+oWruves?=
 =?us-ascii?Q?3hYzpXi0k200qhlyVCXJ+Fif0IuOCKL0luvwCkXypcP3gr7488MjihstyLWk?=
 =?us-ascii?Q?YOzQVzevJKjXM00hxa2iCQhBRRSV3j41pzJ2ky9CO/xWF0e9mkoiCyINPP5A?=
 =?us-ascii?Q?9A0zPXkTDfF6aGmEtYqy0oF9+p1GqcE3rJlE7WjHY6F/wAFm6ylfXQc5OjY7?=
 =?us-ascii?Q?5kJcrwZvryPcgpAY2jBjK0o67SkUUbyeQSh9grpsTYlLfK1k0j2ZtNCz4pZ5?=
 =?us-ascii?Q?kWad2NNk1iuvYC7tWCGnnnBwCPts54r5Ikcia5M6RCNjKgPOWFJ8n/qh4gkb?=
 =?us-ascii?Q?QS2xr8gLi8L84Mq8GE4pHyZNz1ZTGEF+k3Z82Ini/9457qY+iyBoex3b/2/h?=
 =?us-ascii?Q?iHclX3fe6s28g+U3uWioWViNIhkabc3v4fkVwBK0o00mli/eE1ObS8f3lTN+?=
 =?us-ascii?Q?7F6bFHtm+QQMPbNEEPaj/Qn4KySW5x9S3JzvG98qC+t3GDDPilJP/tsy2oLi?=
 =?us-ascii?Q?H8xGnjFrdzBctTMj0p37TLkB/L+5FsN4C1XmQbWYM2lh8wG5FZH2KBn2PgfA?=
 =?us-ascii?Q?qETxVInYsM8N3XEyyoKmMDauzceL6XCbXMgRjgqw1hqOb2Fm9s5ekB4QIUZS?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 223c50b3-893b-4844-cb25-08dce137fa79
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 10:09:32.3380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZtaa9Da4NqVZvMpUn9EO3JNx0yZ0KYbcMHYm4PqLagBFh90osvsAMlPsy46eRmcaq301zMrRNA2OMT9rxyKMNqLVrpMAf8ONWp+l2zUgqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 10:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205111

Hi Bruce,

On 9/25/24 4:23 PM, Bruce Ashfield wrote:
> On Wed, Sep 25, 2024 at 10:07=E2=80=AFAM Quentin Schulz <quentin.schulz@c=
herry.de>
> wrote:
>=20
>> Hi Bruce,
>>
>> On 9/25/24 3:57 PM, Bruce Ashfield wrote:
>>> On Wed, Sep 25, 2024 at 9:37=E2=80=AFAM Quentin Schulz <quentin.schulz@=
cherry.de
>>>
>>> wrote:
>>>
>>>> Hi Bruce,
>>>>
>>>> On 9/24/24 4:11 PM, Bruce Ashfield wrote:
>>>>> On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Schulz <
>> quentin.schulz@cherry.de
>>>>>
>>>>> wrote:
>>>>>
>>>>>> Hi Bruce,
>>>>>>
>>>>>> On 8/11/24 8:04 PM, Bruce Ashfield via lists.openembedded.org wrote:
>>>>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>>>>
>>>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>>>> ---
>>>>>>>      meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
>>>>>>>      1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>>>>> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>>>>>> index 0097fec7b2..292897ce43 100644
>>>>>>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>>>>>> @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>>>>>      # provide this .inc to set specific revisions
>>>>>>>      include recipes-kernel/linux/linux-yocto-dev-revisions.inc
>>>>>>>
>>>>>>> -KBRANCH =3D "v6.10/standard/base"
>>>>>>> +KBRANCH =3D "v6.11/standard/base"
>>>>>>>      KMETA =3D "kernel-meta"
>>>>>>>
>>>>>>>      SRC_URI =3D "git://
>>>>>>
>>>>
>> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name=3Dmach=
ine;protocol=3Dhttps
>> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D=
;name=3Dmachine;protocol=3Dhttps>
>>>> <
>> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name=3Dmachine;protocol=3Dhttps
>>>
>>>>>> <
>>>>
>> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name=3Dmachine;protocol=3Dhttps
>>>>>
>>>>>> \
>>>>>>> @@ -28,7 +28,7 @@ SRC_URI =3D "git://
>>>>>> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name
>> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D=
;name>
>>>> <
>> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name
>>>
>>>>>> <
>>>>
>> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name
>>>>>
>>>>>>>      SRCREV_machine ?=3D
>>>>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>>>>>> "linux-yocto-dev", "${AUTOREV}",
>>>>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>>>>>>      SRCREV_meta ?=3D
>>>>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>>>>>> "linux-yocto-dev", "${AUTOREV}",
>>>>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>>>>>>
>>>>>>> -LINUX_VERSION ?=3D "6.10"
>>>>>>> +LINUX_VERSION ?=3D "6.11"
>>>>>>>      LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
>>>>>>>      PV =3D "${LINUX_VERSION}+git"
>>>>>>>
>>>>>>
>>>>>> I haven't tried to compile linux-yocto-dev but I have my own v6.11-r=
c6
>>>>>> based kernel recipe.
>>>>>>
>>>>>> It failed to build on Scarthgap because I was missing coreutils-nati=
ve
>>>>>> (specifically truncate binary) because CONFIG_KALLSYMS was enabled.
>> This
>>>>>> comes from
>>>>>>
>>>>>>
>>>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95
>>>>>>
>>>>>> It seems there are some config fragments in linux-yocto-cache
>>>>>> (ktypes/base/base.cfg) with it, so maybe we want to always add the
>>>>>> dependency (or is there a way to add a build time dependency from an
>>>>>> .scc file?).
>>>>>>
>>>>>
>>>>>
>>>>> Interesting!
>>>>>
>>>>> I build linux-yocto-dev nightly, so I can confidently say that this
>> isn't
>>>>> being seen with the reference recipe.
>>>>>
>>>>> I also do have KALLSYMS in the default .config, so I've worked throug=
h
>>>> the
>>>>> same new commit and enabling option.
>>>>>
>>>>> I get truncate in my kernel builds via hosttools, so the dependency
>>>>> wasn't/isn't needed.
>>>>>
>>>>
>>>> truncate isn't in HOSTTOOLS in any release yet, just master.
>>>>
>>>> c.f.
>>>>
>>>>
>> https://git.openembedded.org/openembedded-core/commit/?id=3D522000ce5c4f=
0201cbe42d7826b6a8489ed10117
>>>>
>>>> This means people won't be able to build 6.11 and later with
>>>> CONFIG_KALLSYMS enabled in Scarthgap and earlier releases...
>>>>
>>>> ... unless we backport this patch to still supported releases?
>>>>
>>>> BTW, I could reproduce on Scarthgap by checking out poky in its
>>>> scarthgap branch, then running `git checkout origin/master --
>>>> meta/recipes-kernel/linux/linux-yocto-dev.bb`, then adding
>>>> `PREFERRED_PROVIDER_virtual/kernel=3D"linux-yocto-dev"` to conf/local.=
conf
>>>> and then running `MACHINE=3Dqemuarm64 bitbake linux-yocto-dev` from ei=
ther
>>>> a kas-container (4.3.2) or Debian Bullseye.
>>>>
>>>
>>> Right. I only target linux-yocto-dev at the latest master where we do a=
ll
>>> our testing. The support matrix of ever newer kernels against the older
>>> releases can get complicated, but we can at least say a given release
>>> supports the reference kernels + the reference -dev kernel version.
>>>
>>> Anything more we do on a case by case basis.
>>>
>>
>> Oh for sure! I wasn't implying we aren't testing appropriately or that
>> we need to increase the number of kernels to support per release. Just
>> that **some** people (likely me.... :) ) may want to support 6.12 on
>> Scarthgap whenever it's out and that will be an issue. The answer to
>> that issue could very well be "upstream isn't interested in supporting
>> this for already-released versions, just handle this in your layer".
>>
>> I assume one could simply add HOSTTOOLS +=3D "truncate" in the kernel
>> recipe and be done with it? I would be worried to add it globally as it
>> could then break/change other stuff since the host's tool would be used
>> instead of the one in recipe-sysroot-native (is that even true?)?
>>
>=20
> That would mess with the configuration space from a recipe, and won't
> work. It's already gone into use long before the kernel starts to be
> parsed and built.
>=20
>=20
>>
>>> I'd go with that simple host tool addition, rather than adding
>>> coreutils-native
>>> as a dependency.
>>>
>>> I have a patch locally that can test hosttools and if truncate is missi=
ng
>>> conditionally add the dependency. That balances the speed vs supporting
>>> non-default host configuration.
>>>
>>
>> I'm not planning on using linux-yocto for our products so was hoping for
>> a generic solution maybe? If there's one :)
>>
>=20
> I really push back on polluting kernel.bbclass with any version specific
> dependencies and changes. It is best handled in the versioned recipes
> until it is no longer version specific.
>=20
>=20
>>
>> I guess adding truncate to HOSTTOOLS in conf/bitbake.conf in an
>> already-released version is just not something we want?
>>
>>
> I personally have no issue with it, the tool is tiny and I'd be shocked i=
f
> it wasn't on all the supported hosts for the release(s) in question.
>=20
> It is far preferable to doing kernel version specific tests and dependenc=
ies
> and/or adding coreutils-native unconditionally.
>=20
>=20
>=20
>> Just looking for guidance so I know which direction to go in 3/4 months
>> from now when I'll be supporting 6.12 :)
>>
>=20
> I'd append to HOSTTOOLS in your layer ! Or just copy into your
> kernel recipe what I'm about to add to linux-yocto-dev :)
>=20

Did you send something already? I think I missed it if you did?

Will send the backport patches as an RFC for scarthgap in any case but=20
I'm still interested to see what you came up with :)

Cheers,
Quentin

