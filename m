Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F47CF9C6F
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 13:02:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.18])
 by mx.groups.io with SMTP id smtpd.web11.13389.1727182930147940129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 06:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AIIoD5iZ;
 spf=pass (domain: cherry.de, ip: 52.101.65.18, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKMLko2ij+RA4r/EkHVjEupWmTpqr3xm8j8BWT73pwI679iJOJTqIZlrT0HiBR5/dj0FsRIQGdraUtv08Zfn14EJzQN+9kEMEAOzvVK8wKIp3UKC6qQshXEIrz6UVrI2yfmBt+CYe1G3vP20jf5o8Wlb9a0Goo3rTew4Tus3QbipRXSenCWdyWRRs0QIJyZmhD9pYFaSVV0p8lsS2xEV5r4/eCEALC34IxwQY7Eeo3NnkpdQ7/2UCR7WIKZTn/GCKH+JmhR4SwW3XyEFgPPdfbkoiUbuJ0Im/IyLCDm54R8J63Dqg/jr4zIZqKTrBkK2864cdKGY8RpwO/1+vh+25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh0fJZ9wbQuJ4UywGgMJiOhbynx6ZaeHbpKOfBk1o2g=;
 b=V5ibIdAsTa0vFzw+HmQBA/TfaR862lRPSOepB7rDw8Clbkj4NBrK5K+/9glOZqo7+1k4zW6xhGeh9HRxE4UsqURpPBE056KSH2vEvd5+iFkgVki2bLA752nak7hmO6f/42FlD46yN0tWWG3sXXSqXUgJyrMaaz0BcjoPImRxlV65nG53m8aTgtxQdnjEchXT9A/AQ/ML+nIL+7Yn772RqYPiXlB8IUzK/HAtcS4QiF+FmuAbeiAr1uskjt+Bd89av+puX5PhoO2TNoo68DQ3CXwHzNnxN4y1yMpOtjf3DhU24JG9yTcM/opc1IkywvlS9e0F6T4cpWT8xnAufOiuoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh0fJZ9wbQuJ4UywGgMJiOhbynx6ZaeHbpKOfBk1o2g=;
 b=AIIoD5iZn+YNjIeiu6DrdvzvQcGid6SLQe5xWmEd9+1gd701vkpEsA9GWHVNqa/CeFp5AMoPEY10NzqRxd9rYq5Z+gD3iUFdeT/gzsDwB62NLDZ8XAvsHdiclhEbuS5x4IZ2spw52m0NFqjNzM3N+7PWp5Houjmesc8uTPDS0T0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GV1PR04MB10632.eurprd04.prod.outlook.com (2603:10a6:150:206::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 13:02:00 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Tue, 24 Sep 2024
 13:02:00 +0000
Message-ID: <4a44e457-b17b-41c6-8e10-18d9fbea4a88@cherry.de>
Date: Tue, 24 Sep 2024 15:01:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/5] linux-yocto-dev: bump to v6.11
To: bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
 <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GV1PR04MB10632:EE_
X-MS-Office365-Filtering-Correlation-Id: a3211111-273b-438f-db38-08dcdc9913ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WFFkdWJJZHBEaFkyQ2FsV0w5TFJRdTA4STlwVk9kemhMYnJ6R1ErU3hraUo0?=
 =?utf-8?B?SzFuemgyNjJXS1pab3N6QjJJMFZJd1Bsd0p5UXFRelhjQ3Nvck4vVGp4Qm5N?=
 =?utf-8?B?eW1iK2tNTGJvUy80VjMwZjY1cmNBUlIzY0Z5bjMrNVJ0djV1bmR1YUx0UWtH?=
 =?utf-8?B?U2VlWFl0bUpqNjhXUE9vUEZubWxoZTJBNTBURThlcFBDOWo2bm8yTG5TMnZU?=
 =?utf-8?B?aDlQcndTTW5GQ0E1dkR2enBWYXdUTmR3aElOVzRHMWxtNGJUUzZMS0FqdjlB?=
 =?utf-8?B?cEpsQUFiOStmbVd5MGlFZEdXU2FKb2RkbWwwMUtwM0RmTHdOaitOelpPamhu?=
 =?utf-8?B?WUFvR3N3R1QzNWJhcm01M29jT3dGcmdyQnhmTjh6WEU0cG9UUm90NUxRZnpL?=
 =?utf-8?B?ajlzRDQxZytzVElDc1g4cS9CV3paUGZBWnVkQis5bnpINXBaVU5GMWhGK2o3?=
 =?utf-8?B?SWhRVlhBTEpGK0RtVzFRTmw3VGFxNDZMa1grYXd2N0I3QTE0VWRWaXp2T2k3?=
 =?utf-8?B?VTlJODF5QmhLTWFMZlBORVRhSk9reGQ0aVgxVno3djArd2dCL2dyRnU2SVpH?=
 =?utf-8?B?djdSYTYwM1UrZldJSFhYRHVhRVozNm5oLzhmbGE1Y09hNUJRSW81K1R5R290?=
 =?utf-8?B?R1hnUkh4d1RNOXFsclpnNzd3MHI5Zm9TeGZJVmtVcXA0QXBWS2ZkL1ExNlJv?=
 =?utf-8?B?YmRaNUg5MXJQcjFSUk9YMmo1K2t1cmxyVFpIS1JzQ1h4aWFDWUJNVmhMTzVM?=
 =?utf-8?B?TWs4dk1TOVRNVmUzcTRWbHdPand1akErbDdXa1JCWEdjekt0a0FOWWpidGJl?=
 =?utf-8?B?cFh5ck5rOW1HcVJBaHNIYiticzVXT3l2SDFFdnlJY0YvbGRuQVBpQ2U4S0dO?=
 =?utf-8?B?NlJNWE5mL0hBQWNRTGtiUUJjUGdNWHNoQXJxT3F3cm1heHpZZm1CZ2dhWWYx?=
 =?utf-8?B?ZTJ5ckNMZ2l6L1JxUUVQU2NHSXdDZWhSRmttd1JLaWl4QzFhc1o1SXc4RzFJ?=
 =?utf-8?B?alIvTzRoSkIrbVNYbW9PR2lVblUyWXVLQXBJVDB3OUQ5RUJ4Z3o3L2ZTNXVR?=
 =?utf-8?B?K1NmdVVlR2x4cjd5SmJ2cTJVYTdRNzJPSzVkeFBZNkVYQmVOcE0vajUwUXk4?=
 =?utf-8?B?TWh3TnBzdlNmc3F2VndsZnd0VmZ6TXBWQjBhZnRKN1FTZzR3Vyt0Q3dGdnBM?=
 =?utf-8?B?T1oyUkxEM3Q4TzhWVU1WSDZNbERjbWpNOTY5YS9TdnlXenFNMFd3bWpSSnlN?=
 =?utf-8?B?RlBBaytyZzFDUU43VElkR2NoZlJ1OVVjZ1FPUWhHVmg4dmsxWkFWR2wrRkFm?=
 =?utf-8?B?MzJleUdFekxqcElyR2VmazVzVDVoK2VSOU9iaStYcnlnYWxzVzlQdU5TYmpC?=
 =?utf-8?B?STc1bXVPRWlCNktBMWhwRWlRU2Vaemd0cFJhaU9Cbnh0U3c0R1k0dDVSdHRi?=
 =?utf-8?B?MUxvTUVWQm9oN2NyYVBTZ0lJN1BtbEhCTUN6Vm01TnE2YzViUnBHaXFlUnNL?=
 =?utf-8?B?UndleU5MTnREbTZjaXpLNlhYYTR1Z2pyVTEwbzBnbTY5dVRZRit2RUFTYkcx?=
 =?utf-8?B?VWd4ODIzTVlvdjM4b0NqWVJoaFUzekxmUXJJTjhTNE5qbzJmZGNEclBUZFdz?=
 =?utf-8?B?MFBwa0g1V2s1VXEzdTlrYTh6R2J2MGk1TzZuNm5rYU1KN0ZBVVl6WFNpa2Fj?=
 =?utf-8?B?TnlJTXJvRTFsVWowdU8yYjRYcXVadnZrUjdhcDBjbHloSmd3a1pPNHVnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnNWYVBhN3UwSWt3RUc2UittS3lpSUp4MFdmak42Ymg4ZjRKQzZqZlBldVg1?=
 =?utf-8?B?bGNSaXkzdWFodGlkanpnNE9NMXpDTjJYYkROZWliV0ZEY3U2UDVZQUNucThy?=
 =?utf-8?B?NmtEcXVjUkRmM09YUFB0TTYxZUdxckU3NUdOS2srY0hja3V4TzdwMHhlSVVB?=
 =?utf-8?B?Ync4anFtQkRad3ZFM1dDUWxVaHNGMEpucWRzb2p1YStCeEVYM3pacGJOMlZs?=
 =?utf-8?B?b21aL1lTZTVPdmJNTVZOdUFWb3NZVHEvaUFNNUNnTWhvY3ozd1g2VlFhVEpM?=
 =?utf-8?B?Ukh5RndIM2Q3T2MvbWZoSGFVbFhyMVIxb2xyQUd6UWszTDkwOHNtNlVFemg1?=
 =?utf-8?B?UThBWGM0MlQ4VVF5Q0xnQWxMemZhVHRVVVRxbWFWWXZTWjFQcHh3eG5ZM1Fp?=
 =?utf-8?B?TjU2Q0QrWk1nVDBGakhqUlZuWHpINUxzRVNUVEJtbHhvRVN1SlhMMUl3SlpU?=
 =?utf-8?B?d2RxZnpHL25hUEo5T3FmTjR3aHh2QWVGV3ZwUlBJaWl5WmI2MThHZCtQak1U?=
 =?utf-8?B?S3I5WktqMUV6TDI4UEJLbisvSi9QU216RDd6MzRYcnk4dUJnWFBLaVkrU2lM?=
 =?utf-8?B?WWh5NEFTNCtwdSt4QWpFc2VPbmVKRHFWSFpFaWdxeGpZV2l2VU96UUlrTXJB?=
 =?utf-8?B?QjNyOWdjSGxaRUNBbTQ5UExVbHFJQi9Cb1ptZlMxbWxUc3ZyRG5hZGJMMGJ2?=
 =?utf-8?B?azdMOHBVcXRoUmRSMzRsbHZVT0VpL09xeUZreXd6cEVvRDRDTlg3NXQ0SjBo?=
 =?utf-8?B?RzN1Yisva01oVHhObDZnMjRGU2Z1NkpoZ1hQUmpkRzBsS1VsTHpuM0Vha2sr?=
 =?utf-8?B?VEZld2FWOWJCcGFRYXJXa2V6TGVUK1FYN1B5emM3d1RObTk3cHNFS0dSZG90?=
 =?utf-8?B?alpkckNtK2JpQmRKMlNyTExzVXFoZ3J5aVBQcEp3b2J3emNpMEs4bjBFbVo0?=
 =?utf-8?B?c0EyV1lrZTYvM3R2ckVSNjhRSkJoN3hLQml3SXZIOWh2KzBqZGQzZGh3S0Zi?=
 =?utf-8?B?ZEJlNnRXZDZ6T2RweldiZm1kNk5td2pKaFZ4TDZCd0Jod1F0cTVvRFVxVmZS?=
 =?utf-8?B?Z08vcW9JQXVWcWh3bnAzdm5JL0NvQWNxdHkvN0NkNGIvbEFIRHN6aVRzQU5M?=
 =?utf-8?B?WGRZaXF4UmdqNmRxd2NieGJHdEx1VkVnb21JZVY5cnozVUxXNHY2c0VhdE4z?=
 =?utf-8?B?VVY4ZUd3OEdNbHlMOURWcGFnVDQ3VUJBY0pmTjlIRi9pMW94UTB4TmtBSjhK?=
 =?utf-8?B?eHVaRENQejdPekR1N0VOMkc1cnFCek9Ta2J5NmRyYzZFWnlRMXB5VWRZQXky?=
 =?utf-8?B?Y1R3dWVTeXl1dHZlcUg5RTN1eENISktXMWJFWWR5aVB2R25DaGhwZUhJbHow?=
 =?utf-8?B?UlQzSHpnK3VmRHdRcEVNU0RoVG1YVnowTkdyNUlpWVJMS2FIV0Z5ZkE2T25z?=
 =?utf-8?B?MVZxMjlaM3o4eGg3S1IrMHdiT1lkZkR2N1NTYW4vVnM3bEh6VTlPVkNnc1NF?=
 =?utf-8?B?SndUdWJySUZqd0k2NGNqS1R1T2dybDBQN0RLZkFZSk42QUhSa2dPWUVHTEFl?=
 =?utf-8?B?eUtWNmdjcTBwYmx6M002VXJ1U21CczZWS1pycU1ETXJGK3VjNlA2RXl0QzZG?=
 =?utf-8?B?cEJxc0lxZHRWOUZWb2RqV1kwQWZVNzJ1NVcvcXlCWTd2UGtZQ2JFWEVzMDdE?=
 =?utf-8?B?dzFwYUNWOStnNjNPUFlMbzUwUUE3NFA5MG1BQlV3K3ZZRng4TXJPWTlIdnE5?=
 =?utf-8?B?NSt1TE16eitHV1V1WFRJeVdnVElEck8zK0htSEJJeVV1MHpZc09pekdWYkxo?=
 =?utf-8?B?K2hWaDZXZ0V3eFZyclF6TnVvTXBmdUwrS0FaUlRDcmRHbnRrZ1EySFpBM2Jt?=
 =?utf-8?B?QjRHOFYrUzdIb3pSQWY5TWtHdTJ3N0l5WHRIRU9Oc3JlU1p4UDlrWnBWYjVI?=
 =?utf-8?B?MG02M3g0Qi9iWnpnVVpKYnkvNC9lVFNVd0w5N1Brdmo0TUI5MlZyQzR4bTN1?=
 =?utf-8?B?NFV1VnhRMXRzOFcwbk14ODRZL3VPcHJoaFBIUHhuYm5Pc3FZalJEWnhsdVhk?=
 =?utf-8?B?STlMUnhjdWVPbEN5YkM1RjlSd1BlUDFMMXJqeHdmUWZSbnZpemQ1N3V5TFNQ?=
 =?utf-8?B?Nm5tVHRoRDIvM0Y5NU0wZVNVTitldW1mcTRad1l4cElmdUE0bkxVNDBISW9m?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a3211111-273b-438f-db38-08dcdc9913ba
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 13:02:00.2087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6CImD/4nFIfNQFntS90dLaIQDIros8vlMlSPsVtHkibL4gaLxH23fJjPigTMFsZXMHQ5ntY2nra++sBpj/wH6ljwfqtD8Njn847dQf7BqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10632
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 13:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204861

Hi Bruce,

On 8/11/24 8:04 PM, Bruce Ashfield via lists.openembedded.org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 0097fec7b2..292897ce43 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
>   # provide this .inc to set specific revisions
>   include recipes-kernel/linux/linux-yocto-dev-revisions.inc
>   
> -KBRANCH = "v6.10/standard/base"
> +KBRANCH = "v6.11/standard/base"
>   KMETA = "kernel-meta"
>   
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
> @@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
>   SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>   SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>   
> -LINUX_VERSION ?= "6.10"
> +LINUX_VERSION ?= "6.11"
>   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>   PV = "${LINUX_VERSION}+git"
>   

I haven't tried to compile linux-yocto-dev but I have my own v6.11-rc6 
based kernel recipe.

It failed to build on Scarthgap because I was missing coreutils-native 
(specifically truncate binary) because CONFIG_KALLSYMS was enabled. This 
comes from 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1472464c6248575bf2d01c7f076b94704bb32c95

It seems there are some config fragments in linux-yocto-cache 
(ktypes/base/base.cfg) with it, so maybe we want to always add the 
dependency (or is there a way to add a build time dependency from an 
.scc file?).

Is there anything I can help with?

Cheers,
Quentin

