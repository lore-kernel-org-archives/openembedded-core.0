Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D49D1AD30
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 08:53:16 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.web10.18359.1729068787820570716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 01:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mFAtOHPC;
 spf=pass (domain: cherry.de, ip: 52.101.69.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mf2hCI7otye069Grti2YYrfp6UwpHxpDNfARJsMfjHxdhzabUGYMWIbukkH/WbhipXM0jnv6uBijyRG4sxYyEj3xA3agynd+4I1rtvZdmvgekz0C/MJ9oh+VyQpQcynH5oT9oGF2iWD7UdMe3zmsgyWbldHKGh6xkS4CHFNWF1kwi2aeH9A17Rc4IKDxagbFauHcqAnMHxlky6WAsDxj5hhehBhJLs2mHs/go1FFjEWbO5Kh0a7HOZlk/xovrc/9sp7r6sW3oTo9EHW3jmeT94evjqBiuWWsVSXyQsN/ENAig8LYpjBhXQFkPrZdR/WN1UBfeNWf03eAzsYfIdysCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy7dU/xr2tGOhJf1NbM1VfgInsQdXGx8fssGg6DzZUg=;
 b=nr/4Edf6OAHVIQgru+130yLSoUvrN4GejXzuW9LuWziecMv+aHzV9DhzG6mS0hkBBtGWL7Eq0wp5SxObVEst26EqvoXCaSSshqJKS++vRx71V0HbYtQyEPqdbU386BzJS6M07tf51ztd3/uN//ADY55cZ5xVR97IYQfQeYFrkJM0Wb5vJR1oAbhwuB6j1ihyJ31gpg3dKjYVN+PxFKPkm/jBUSfPerxynaF65vcWqWDXawuL8+y7YdRldHzO+fJ5+iGmjG2eeseaE2FoUdsXIcoPxGZTlRfaCH2gEE3C+6zG4gxpB1Xpr0i9AzJL0suSO+X4DZniV7/IvtDCJLTCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cy7dU/xr2tGOhJf1NbM1VfgInsQdXGx8fssGg6DzZUg=;
 b=mFAtOHPCE7y7m8xY5VSGaHZHX5DJdozN2z0kSsGnTu7n9v+97YJ2X7Faw28lskS2rfD9dp/X1+6+LNfdlNCHpz1P+0kHDC8mP66FoIlJ2t2Q1qfozhZuT1hdUReW0fT6GzPXZn3I/CiNc2HPTGIu9Q5DBkOtkGbWr2aZKzkybF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB11022.eurprd04.prod.outlook.com (2603:10a6:800:25e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 08:53:03 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 08:53:03 +0000
Message-ID: <f210e8dc-f120-410f-aa22-2104f8f5b402@cherry.de>
Date: Wed, 16 Oct 2024 10:53:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] u-boot: upgrade 2024.07 -> 2024.10
To: Fabio Estevam <festevam@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: marex@denx.de, Fabio Estevam <festevam@denx.de>
References: <20241015190452.1926300-1-festevam@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241015190452.1926300-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB11022:EE_
X-MS-Office365-Filtering-Correlation-Id: 65199ac3-a0d9-45b7-1680-08dcedbff195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TTBaRVEreW9EdmJrekxqbkhQOHBpaVlEZEZZak9MUFYwOWFDMEpNdS9Jc05N?=
 =?utf-8?B?THhtM01FcjR3Y095R28yNzVFUEpWYTBqUVAwNlZvazJyL0ZiZmJBQkg1N1Zw?=
 =?utf-8?B?Sm5SNkp4bmxMTnhLMCtEVkJuNHhMQlFnRjFWUUZRdVI4ek1SMXgxMXJHQk5r?=
 =?utf-8?B?R0hyMkdLOXM5RkR5TUwycGxySnIyQkN2TUpId2dQeVQvQTdVU3NTVnJQbHhj?=
 =?utf-8?B?MGJ6elZFSnRkWDZ0b1g5STBuYWdwRUVLUjRPeVRndnMrNlhLSFRXTUFVeXd1?=
 =?utf-8?B?c1ZFd0kwOHliK2V0OWxuRHFZNEJMMXlqN1ZwaDljQkVMNExBVlM5Wi9iYXQx?=
 =?utf-8?B?UEpBNDZvZTFDT1RtZVVtb21lSmRXVUdabkllaVZTSjRldDVVUSsvbVlsSVdq?=
 =?utf-8?B?VDA0Lytnd1VpLzZGN2tyN0R3SUdFNFVYNU1NdTc4R0l2ZExuUFQvSzYvV0x4?=
 =?utf-8?B?ZGp3eDg2cWhCR2JqREtxRlNSWWJ3clY4b3A0czY0TGRmOGRjN2I1WDdNbmZL?=
 =?utf-8?B?S0YrYzZMZi92UWVxdGVGTk5uRGhjbkE5VkV5RkFPMm8yV1I4Q0dJWDVLQkVr?=
 =?utf-8?B?QU9FVGI0aTkvdUxVeXVRKzZTM3ozeGhhWVhqMmpqaFdDc3RmT1pZdmdEa3dV?=
 =?utf-8?B?Qjc3NG5nNS9FNys4cS94YnBiNEsxMElUWXFIZzBBQ3pjK2Jnc1B4MnhVZmta?=
 =?utf-8?B?NzdHN3duZWtOSVFKM2NwODlDZGgzUjVIbnFBelpjNDRWYU9raHdDdVhuSG5n?=
 =?utf-8?B?TUtvdmJpWFhMNHRhNjBQdThIaEJ5SWh2NjlETzFVQTRCVEZMei9veHVEQ2NZ?=
 =?utf-8?B?SnZNRitpOW9JWTFibWxkVlo1ek1pdWFvN1NOUDhvTnQ2eFZyVVVydVBJVXIx?=
 =?utf-8?B?K1lHbHdHV2pRVUV5SHFCcEMzaHRaRityMDNvcTRNZTFlRCtheWQ3bkhhQkR3?=
 =?utf-8?B?WWJLQ3BuR0ROa3M3dEM4THd0by9NZTRNc0FibWtoZWVvQlhUQ0pJVFpxd3ZG?=
 =?utf-8?B?TzZydkQyNzNrcTBIdjc0MkVIaTgzLzZ4RXErYUpHWWhkdytESXZsNVd0WVc1?=
 =?utf-8?B?VmdMTzYxWURXclhtMC9vQzEzMmU3SXlybGtnMUdoR0JDWFBkY0hEUFdBZ0Rj?=
 =?utf-8?B?QURTNzkzTE41QlRUbDdUem5ENUxzWG5iNWJRaFNTT2pqVnB5NnF5NGxRdzdE?=
 =?utf-8?B?bGJRaFdYOFc5VUswR0Z1WVpnNCtPdUhEWGpqU1dlbFVaNjVqNEVrbmF1SlNF?=
 =?utf-8?B?U1NjdGpxK0dKWWl2UUtyb2t6K254NFd4Z1ZkMS9uRjk3ZW5ZRWdGQ2JIbkJB?=
 =?utf-8?B?Nmc3ZXlmZ1NRYVBrUXFPL3ptY1FTZVJWMHdKbUxIZFdWSEo3T3ZhTzJYZHlt?=
 =?utf-8?B?eTBJRkYxbnNBM0c5bkJpMGpsazRiU0RvQ3REdEk0NEF2SmpuYVFBNnhhQVJQ?=
 =?utf-8?B?VHZTVEh1WWZOaUV4RERHbmFCVkdUcTJ5N1BmcWs2QWxLVDYwVWYwaWZCR2c0?=
 =?utf-8?B?SFQzUSt6NjZFUERCRUtGTzcvcWNUZ2pRRlZRcmFNU0F5S1g4MHUzSGoyNWhh?=
 =?utf-8?B?QTNGZU05WWFvUkZ6L1JvNk9UZVBPUXIvWnhJMmh3aFREZ3h4SXA2N2NPYjhO?=
 =?utf-8?B?aVJadGVyTGhreVZMNWU2UUhhZityeW5DMDBrdUEremYvaHppc1I4UEdyNXRl?=
 =?utf-8?B?dUpCc3dsZGVySjM1VkU2NW55d3dmc1VaWDhwVEQvb2hVQUxFM0o3T2tnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGlkeGo3d3g4d1duQk1vaTFhaDFGc3pWTXNGLzk3ZEc4WHFyK1YwRlFsYVp3?=
 =?utf-8?B?VUd4cDJQUUtGZDFMZmNKWko1dFJlKzdvelFKUFcwdTNyVXVRSWtXREg4MkVr?=
 =?utf-8?B?QjdvS2g0czc5cFJxNUlxaXpyZHU1K21TVUpmNmx2dWZZV2Q1SjRHVnRIMTdC?=
 =?utf-8?B?eSt5M3VObExFRnNLckxXTHVPVFBpcGE0OVlYVGxzbE50Z3hzUjN5dVhueGxB?=
 =?utf-8?B?RUtYMDJIeWVmaGRVV3hnWVFWc2xNUWpWd1k1Z0tib2lJNm5JNTkrYWR3Q3VH?=
 =?utf-8?B?enhDdmFuMDFBYTFFYzVBMHN0bjIrbG5mK0l2bVNKNFhXMGYza2tMcFZmbTV6?=
 =?utf-8?B?S2NiWVVDb3R6WEZCOGlWL2RPWFpaNWpIOVNrV1AvdWhrOGtaZExBUDNFQTNG?=
 =?utf-8?B?R1YvSlVuQ1lBRE5NSEZMT2RKN1hWcmkydVlxaHA1TnAxS3hRenljalZhdFRS?=
 =?utf-8?B?eHRiVE4rRlNuNFpsaHFIZGxIZmRhYm0vdUJiTzFNcElKSXI1bm9HbmlGYjZG?=
 =?utf-8?B?RHhzbENraE1jazRDeTBhUjBkdlVrT3pFSmtyZ2I1ZGxQeWI1Z3IwOVVyUEdx?=
 =?utf-8?B?WWdnODNkYjNGa2R2Y1VCYU5TaWoyUVRLR3hsUUNOSGo2dFoxNG12Z2daWmoz?=
 =?utf-8?B?RUhJV1RDT25qbHBsdlhzOXZtYnpLM3ZOZmRVUmhqMHZVaDR5RTBxWThQOWV1?=
 =?utf-8?B?QzQ4ajg4V3ZaTkdMSlo0RDlJZnRLVGNkYkVud2c5RllvREhPNTEvTjlLcXBn?=
 =?utf-8?B?U1VLZHBVcVc4MXF4MlRtWXU5OEs1M0F0QkRmS1dmQ1NlNWlOQzFPUDkyelJp?=
 =?utf-8?B?c2Q2SEk2dWlCczQvWnlEbXVsd2Q0bUNpVlBLUWF5OUc0eStneFJNZjdkQVBC?=
 =?utf-8?B?RTNQbVFUK2w3N0kxcDl5MXpDaG4wd0pkcEhxc0RVYW03dzZ1SGNaeE5PRGdj?=
 =?utf-8?B?bWp1QXMwNXY1d3hZQnU1UmdBTUNxdjBlL2N3U2xETWxvNzR6Qlg5VFFXczlj?=
 =?utf-8?B?cFhiYVpEakFVWXJNQ1hyUy85Rjc3Rm12UzNjZ3MvMGkvT2tuTnZaWnpNTS9B?=
 =?utf-8?B?MkFLeTh5RStTdnNaYnpvWTluNUtpaU9sTUJZajdDUzhmM08vckV5Y0ZCZFhp?=
 =?utf-8?B?c21salJWcWdhUzAraXprR3ZVSU4rQ2FzYkk3OHdPc0dheVAxZXR3d2EzRy9j?=
 =?utf-8?B?R3ptRlBKTFVJMnI5ckRaOXhhRkVsV0toNUU1Yk1RQzBWc3Q1ZHF4WUpUYUx0?=
 =?utf-8?B?bWNrdzJrdm9xRzg5SVhHdzBuSWtrTnVuODBzMXQ5QnJCdGhyQ0gzNjhkaWxu?=
 =?utf-8?B?T0xrcXk1ZjMraFVmdWkya0czQ2ErRFVIK2NwTXlEUUhqQ3g2Y3AxVjVJWXVP?=
 =?utf-8?B?NDhQbStSNDU3ZUlkSFZIc3AvVUpKcjRldnQvN253QkFITStFVnZSTWh6MTgx?=
 =?utf-8?B?d0QrU3RON0dzak15MGJRMjMrS2xDaWc0dmJZc0xnNDVVZ1VsS0xMWGtDUDli?=
 =?utf-8?B?b1pLUW0rR29nVE9RZmlsV0dzUTVpNDQ4cGRDVWlyVEk1Q1hQVUFRZjdyRjZS?=
 =?utf-8?B?TEtKV1U0Y2ttTlA0elhtQVRiYzArMVFBTVZla1lxQUNFOHAyL1FOTEhMU2Nq?=
 =?utf-8?B?VUlmZWwvYjN5V0VvOHpWUFhNSjh5TTM0MGVkdW1oeFlUbUJnM213N3ZyUFJI?=
 =?utf-8?B?eXY5UkxFSjVRK3l4Wm96SWFsRU5HWTRpa3FjOVNOMnhTTEJZTUlwMVN4RWRL?=
 =?utf-8?B?QWR4a3BwQkVCZGl2V2dVQkVSaDIvNmtlT2t2RzQ3eVdRaFhEQ05CQnpWT3hZ?=
 =?utf-8?B?aEJBNkZNdmE4Y0wrUlhzVWNsQ28xaGZ2MDFVbk9nM054TDh3SDF5R0VqNHZ3?=
 =?utf-8?B?dUtFYUVWWUZ0UTA1QkNOcTlNNE0yamp3ajM5TjdmTkFnMkE4SVhXQ3dOZ3F0?=
 =?utf-8?B?c0hwVU5hQ3g2dmUvc3JhNm1tRHFvSzBaOUFKd3NFcC9OZzJkRE1ibkdLYWJm?=
 =?utf-8?B?Ry9sSjI2NDRJQkcwM1ZiZk54TkZVaE92YVl2U1prTFJva1I0WitRNWpzQWsr?=
 =?utf-8?B?VVRvTkRnMFU3N2ppOC9oUEthQUFtaUJubnN3MWJkVDQxVWRUaForWXlRSkJY?=
 =?utf-8?B?SFhrN1VZSDJRTlpLY0pLNFI3Wk5nbVA0QzF3OUdLVUhwaFN4Njh3SlJ5NFJl?=
 =?utf-8?Q?/MLS05c+Jy11KAuGOaBRZzs=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 65199ac3-a0d9-45b7-1680-08dcedbff195
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 08:53:03.0394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uBXnP8+UWwZIklGuDU3s/TeAK2zmbDcdz2bbS2DS6kq4EITXdZq2mAG1UtPtOFjlt/VSXyeG10LYGdAWIFoy3IxYLS8wnIZ/ssSunibj6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 08:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205958

Hi Fabio,

On 10/15/24 9:04 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Upgrade to U-Boot 2024.10.
> 
> Add the gnutls-native dependency because now U-Boot needs it installed
> on the host machine to handle the CONFIG_TOOLS_MKEFICAPSULE option.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

That's the proper hash and gnutls-native should be the dependency 
required to make the buildbot happy, therefore:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

