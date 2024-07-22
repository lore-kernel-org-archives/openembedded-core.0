Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE8CC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 08:23:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.138])
 by mx.groups.io with SMTP id smtpd.web11.13792.1721636624725204464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 01:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Cr8fBAZX;
 spf=pass (domain: cherry.de, ip: 52.101.65.138, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeKHIDnHsPWb4KYZCXi9LkdjlJ/ckmtEj5gRfyTgzLdsfE1TgO+r2UjGnDUuxHzS1sUw25z5rIZCoxhoLGHqRS5bdotW0ERMRfx0N7j41duTNPJMZBTrCkH4ykxGUWRn+bV+n2Y8EYZqo/GP1bMzAhUXAd+SRuGXdhvyUi2mvaIrfzyg3qqyYZNIADqaTf06cf/ls/Ex5lUnxMUH8C2G+Fo4ZfFOIX2ZAS7iyqMuqc9XUBaAkGZMX5487BwQnfX4doIgI+cwIRm+8VCgekqhufk8nGr+C8NZ5fGDsaoS+up23M9+NUCVNoeu1uTGcRtF0M76IrdrAl6FrutyubkHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHSrUF+yuk+FxvF5m8v8KDkrodCSB3uJRbAgb3rzruc=;
 b=xYYjjPxlZlLQPcuzeyRFunyDsXrKIrfBXxkbUgb+tVERF7qC0jMAx4lwA3anAeZuQxxUJOLGFBN+Rx5cGfqfzx3jGgLHSUX7NOwAYbNPXpcWWKHcsbt4f+ufMtpZE0qykPQ8rWU73cd5fdhW/ZKXi/NIZj8zwbtgAsYvVDhIiqczWYvCUqWTx2O28HUAdiz3uc9msZuqFjgRMktQWNcBfVKwW8Qp60rtULrky4HvYFqjbddUIvGJ3ux7T+KooqyiKCPYwL5PC1bw/vV0N2qfgnxE8Yucedh+ZnVXJLeY0AUD79rz04jmbZQu8YxaZcckAstkV9zWaXd6ky5q9il34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHSrUF+yuk+FxvF5m8v8KDkrodCSB3uJRbAgb3rzruc=;
 b=Cr8fBAZXX+xOIu0kFTAbYR/sA4Qibh98xlZg6oBsfzvki8jRRKwjXer59QpjeWebMHfKI0e+13trU+pY14hjkvfNzXtY1F8wIMF+m2ENf1pD+/han+WrCnNJcAVqKe2s9TBdC1W0ELRsQRVoiEFhxVcqHaeuEANcADRCzB2nZ0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA4PR04MB7791.eurprd04.prod.outlook.com (2603:10a6:102:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 08:23:41 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 08:23:41 +0000
Message-ID: <a3aba116-882c-497b-aa14-748022989d43@cherry.de>
Date: Mon, 22 Jul 2024 10:23:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCHv3] mesa: update 24.0.7 -> 24.1.4
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
References: <20240720133626.1223952-1-f_l_k@t-online.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240720133626.1223952-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::6) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA4PR04MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: feda7e4e-3e2e-4396-493f-08dcaa2797c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VGdMKzRMUTRhb3NFS3ZiNWFkbW1iK3JmZHdlMFpnVE1CS0h1RlNaV2s4ZjNq?=
 =?utf-8?B?Ty9oTEJ2bFN5bmVqOUNUMlk3MU41WnhLbHIvY1BXYi9pT3djdnBxQVBmNEFO?=
 =?utf-8?B?ZmxteEtHMlM3WUNteXdJYjlQTmRnMkpkeVpobzN0T3JVekE5dm53VFdJWVJl?=
 =?utf-8?B?K1JOZXlQeXcySnM0cmQ4OWZ3WVA1YjFrTEkyUEwrNFNVWnl3WnYrUSs4YW54?=
 =?utf-8?B?T0N4WXdCN1FqUmFZNjVSUGpWclpaZHdCZnAvbUhOdy9VbzJYKzh4TEExeWhh?=
 =?utf-8?B?RWlRVHBrNDFLK3NsY2FlSzJTdm4zQUxURkk2eTUzVm43b1JtdEw1eWgrRWVp?=
 =?utf-8?B?MnUvZlB4VEl0LzRjUURMZmpKUE5BRzlRdG5WYW40bjBsOW1JS2RFbm42SURF?=
 =?utf-8?B?OXFpZjFHajVEbW9CcWZjaVpZNC9sdG03TkhYRW9HNGxTMENpWHk2TkVNU2x0?=
 =?utf-8?B?d2dvRzBKSVErY3pDZG9KOEJiM0JRL2xLS0JzUUczQjZ2ZjFrSE8zM1NBOUwr?=
 =?utf-8?B?TDVydVY5RVg4RGltV1IzNmpmUU0xWk94dU5oU3FBazJlSGY1S3pLMXpWckMr?=
 =?utf-8?B?QkVQUlo5NDAzZkxHa1NMbGlpY01VdC8xcWd3V2NOQkxsUTdqTktlMnhtb0RO?=
 =?utf-8?B?WHBJZzdQSjVSWU1Rb2F2S2tTZ3lqYkNob1dBbTNWS2FlRXByQzgrVVpQc2hy?=
 =?utf-8?B?RWRMYjFaVWVqcE96dktDUkZjV0Z1NVM4Y3RJaEZrK0dIYkpGMWFyNU1wcGR3?=
 =?utf-8?B?T1lnYjhtbUM2dm4wckdNWmJJNHpmQS8wZ1pITTM2dDFYdGFjZXhqVTFnYzBN?=
 =?utf-8?B?Uld0SE15a25WUU05Vm1xcCtVd1lzTDdJR1REQjZyRVpHVGFRcGttSGlURUtw?=
 =?utf-8?B?aUtsYWwvSXhMaXZMOWV5Z2lmaWlHTVo5TXJSaVVXbGQxTG8xZENnSEJ4Z2tV?=
 =?utf-8?B?UHpzd2R0R2VaaWYzSU9qdWwxQmY0YU1lOG9Lam5OUHk2Z0dFU2swSU5KWkxp?=
 =?utf-8?B?VGRNaWw1aUlXdmlpazlGUi9NWFhVSks0dU0xNFFGMEY5SDdVb1VZcmhOR1Z5?=
 =?utf-8?B?MHRPdGZjaGxwdkRMWldZNDNIVWVCZ3pEQjNqdUFqQUNDYmdSNXFzWnlCV3JB?=
 =?utf-8?B?UzNnMzB0Mkt6VVVWb3VOVTkxb0FVdWpBalkwSDdHY3Zwbk92M3FnamtuaGR6?=
 =?utf-8?B?U1J4RDdXMzZzdyt3Zm1pN2Z2eEZvWUt1dUtpNEFZNVE1MkNkQ3hMZ0xzQXRr?=
 =?utf-8?B?WTh4blVEdXJ3ZWhyWjNPT1M2czlRRmJwT2VuWWJlN2Y4bEFUMnIzd1h6aDNL?=
 =?utf-8?B?OUZFMzE5anFhenI2RTJwTHVwWGFhbjl5VWkxeGxBRGROSHk1U2VJWlhobzg5?=
 =?utf-8?B?TytmS3ZkZmhkWDNKVE1FZmhORnJ6RmM2S05oKzNpallKTDczOHRLaGw3OWtm?=
 =?utf-8?B?eXVvVGpqYWdhWGpoVUYxZE9VZ3JmUnlQMHdQdGcwUjdRclFteTZSRWNnbFBU?=
 =?utf-8?B?Uk93bitLN05EdmNEUHg1dVlFR2lROGdQWHI5NkhhWUR3VFZOYlNReVpvZ3Y1?=
 =?utf-8?B?Vm5taU1KK0NCTlFPSHJQcU9OZDBvYkZtYTFBakIrMXM3SExQRnNHOWdzREdq?=
 =?utf-8?B?VkRtUFNISnBVeFJyMndWOGJ0S3VReXZvaEc0d1BmTUpYK2ZabFN5WUkxQ0lM?=
 =?utf-8?B?UWE0V1FVUTRwTGJncFNOSFlGbVNWSFRRR1d4YzBVcW9SeGtEOThOeE5tTFN4?=
 =?utf-8?Q?VcZ9WgxIBnJgDHlMeI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFExTCtZT2FCanpjbXBENWtVQTVKVitrajRHa1pJY09idTJ2Q1hqN3JnbC90?=
 =?utf-8?B?T0lPRUZPVlYrd0g3RFdYTnpEb2NhWkxUVmM5b2pYcmMveXBGTU5NMkIwSWhQ?=
 =?utf-8?B?Qm5ma2ZGQXhRN2xwMzRRbU1OclpWOWZTTnhuaUZvdXFoMUl6cG5mQnlMamE0?=
 =?utf-8?B?ZnNzeFlIVmdIOWtRQnp0VHpoVGc0T1VOd1lqY0JoVEw0ZWRUR3JGamo3R2dt?=
 =?utf-8?B?WHAxand2U1BBQmcyUzlRU2lYNEF3bWhmOEhHZk5BM1ZvcFlPVENYWDlJMVJm?=
 =?utf-8?B?SXpDS3pBR2VIVG44c2JDNlo3cGtHUHRDdzhaRDVFRytHMGJxdFRWb0pBVU1u?=
 =?utf-8?B?Nyt4QWNLZmxXUnNGczZ5Ty91L0l3cFM3QzUvc3ZhazJDZTU1c2pSK2p0UzMv?=
 =?utf-8?B?Kzd6QS95eXFGaUxLNndSZ2dSU0FSeHBleFRGdjY4eVRacVN5SnAxSkU5TzNY?=
 =?utf-8?B?bUkzdnhpSDhZdFRMMDBzRXBBdEk2bEZwalEzYzNTRHNta0hrV3RFMCtTN3c5?=
 =?utf-8?B?ZWZDTWkvbUVHb0lxMy8wTUFrQlg3b0NkamlYeEVVOE5Ma3RyLzQwc1d2WS84?=
 =?utf-8?B?Sk1jVXpwelExR1Q0MHNONGJVRjJTbi8vYlA4QUpiS2pqdGZuN1lFNXRGSW9q?=
 =?utf-8?B?VEJ3NFpDeU5YN3FtcHZ2Wk5jYU95NEtVb0J4K0pzTlNMem1VSmpITVVXMnYw?=
 =?utf-8?B?L00vL0R0MVovMzZ3T2Q3SEVFbk5zb1Vkb2QrKzkzTTVnWlN0Z3duamFyUVps?=
 =?utf-8?B?aFFwRUxZdjVwYnJUY0R5cVM4L1JLcjN5VWU5dG4xcEdhalRtVHM4K24rN20r?=
 =?utf-8?B?blNENTUra2hDdEJmL0drc0YrQmZOWkIyaVlhUmswMFYxQm1rbWE1YWJ4bnpz?=
 =?utf-8?B?RkQvZ1luK3FqQTZLeXZmeDNXZHlZTUdmN2dueGdYQi9zY0FVRFhpVkxLQ2g1?=
 =?utf-8?B?MWY2cXViUU1vaVFPdW43dWFFQkFQUndmNU5Ybkg3eCs2OXNySmI1bDJyNjBQ?=
 =?utf-8?B?N2hPWmt1RXNwVUM3R0s2UExQYXU0OWhoTUJ4RU1DQjRaTmlzdXFSUForLzlY?=
 =?utf-8?B?MUFjeXVPZlBrSTdlQWZoNUVlWkpFa1gyODVhMlBiemtnbWZOUmIvTTFEYVhm?=
 =?utf-8?B?akFIVldXcFpyWWxFYjFIYXFKN09nUk5XRGRKRzAyS0Z3TlB3T25mODF4MTQx?=
 =?utf-8?B?Tms5ZlZzRWY5alBkT1hXb2FBRGU3MDVRS09BamxZcHJ6U3dsRzJXZjErQjBx?=
 =?utf-8?B?YzVpTFprZ1Z0LzlyWlpOZFpmVFVPYkNzeGxsS04ycnBoWTVSTmo3a0NkQWRz?=
 =?utf-8?B?UlZZblJ5Z09jNTdnMTB1T0hwcEtidnJHeVRmbitmUktaQWFiV0QwQ3JuWkhx?=
 =?utf-8?B?VjdwTGNnWUMydi9raVJnS1RxWTlqWXJCUFlnTjZsZERQZUY5NGhBT1V1QVpN?=
 =?utf-8?B?MVpWR1FidHpxYmNDS2ViV3FBa3BPUE9SbzBNQXEvRzZPRU51bFg5OTBUdUgz?=
 =?utf-8?B?R3FIenlCaXhsZEZHaDBpSE1Sbk1scy82OFJqdnFPYytkRXBvSDczZXpnNHVr?=
 =?utf-8?B?TndIMEN3SVNadmFqVXBMZTdVVE8vSkpYNGxBUUdPaytvT0Y4dHBoK3dRS2c4?=
 =?utf-8?B?aDFYREZhUTdTVWUvR0RBdGJ3b2NLejNGdzVBYW1TcGErVU9xM3hiVGhhbGVj?=
 =?utf-8?B?YVlZbTFHZXc4RFh5UXhMRzJHWUUrd2Z1YWlhL3NZbmM4QXdyeHVnaUhMYVB5?=
 =?utf-8?B?UDNDc1BMSVY5QWpmcWV1SVBFS0lrUDI4T1JZZnJwVjhKTU1ST05JTVdyWUFS?=
 =?utf-8?B?N25Yei9acnRqVU43cTFBNWthb0xWdUh3bGtmSGdLT2JTd3RFeEM5QWV4MFRE?=
 =?utf-8?B?UHc3MEF5OWRESHIyYzBRbFY3Z0dFWDk1UUpBWHloVnJUbzFyVVJwSmxzQ1ND?=
 =?utf-8?B?aFZsc2NTbDVtMEhjUkhzOWdCQzZHOWYwWjFuaXowb3RwamlTdVJ1cHdoVXU3?=
 =?utf-8?B?bWFoSzRVZ3RKWm1SeU44bHVmZ1l1M3BGTWcrRWFEYWNJZzVrL0d3VDZwOTky?=
 =?utf-8?B?cEF3YnRUWHYyeHBjMlVqR0Z2Ty81aU81OFZMSmFCTmFhemZUbkNaSWphaitF?=
 =?utf-8?B?TDBaUWFhb1NXTSt5NHl2WFN3V256SThobWxHQlR2TWxWSytRRyswR2tzMXRj?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: feda7e4e-3e2e-4396-493f-08dcaa2797c2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 08:23:40.9607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0GhYJKnZHtfJYxyrFceGBHEybKWOBqXayNcmV4RZrFF8K16u1CC0QNTbNKSIyU4snHFQ76l4rDRdM4c3xbouLKxlPipNf6nnNifDAlW1Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7791
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 08:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202310

Hi Markus,

On 7/20/24 3:36 PM, Markus Volk via lists.openembedded.org wrote:
>   - Remove two patches that have been merged upstream
>   - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>     Upstream managed to fix this:
>     https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L839
>   - Drop OPENCL_NATIVE since the according option has been removed from meson_options.txt
>   - Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch
>   - gallium-iris and intel-vulkan both require libclc. Make them dependent opn opencl
>     PACKAGECONFIG
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   ...-meson-do-not-pull-in-clc-for-clover.patch | 53 --------------
>   .../0001-drisw-fix-build-without-dri3.patch   | 58 ---------------
>   ...on-t-encode-build-path-into-binaries.patch | 71 +++++++++++++++----
>   ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 -----------
>   .../{mesa-gl_24.0.7.bb => mesa-gl_24.1.4.bb}  |  0
>   meta/recipes-graphics/mesa/mesa.inc           | 23 +++---
>   .../mesa/{mesa_24.0.7.bb => mesa_24.1.4.bb}   |  0
>   7 files changed, 68 insertions(+), 179 deletions(-)
>   delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>   delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
>   delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
>   rename meta/recipes-graphics/mesa/{mesa-gl_24.0.7.bb => mesa-gl_24.1.4.bb} (100%)
>   rename meta/recipes-graphics/mesa/{mesa_24.0.7.bb => mesa_24.1.4.bb} (100%)
> 
> diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> deleted file mode 100644
> index 1711e22585..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Fri, 8 Mar 2024 15:53:11 +0100
> -Subject: [PATCH] Revert "meson: do not pull in clc for clover"
> -
> -This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
> -Upstream-Status: Inappropriate [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27783/diffs?commit_id=a976f2c9f0c07f9e06cc9affd9124b45bc60c2bd]
> -
> -Once the merge request above was added, it will only be possible to provide opencl spir-v with gallium-rusticl=true. This is not yet supported in the mesa recipe.
> -For now reverting this commit allows to still use clover with opencl-spirv, which would otherwise be broken starting from mesa 24.0.2.
> -
> -After it was merged, this patch needs to be removed and rusticl support will be required
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ----
> - meson.build              | 3 ++-
> - src/compiler/meson.build | 2 +-
> - 2 files changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 2db6185..741b5d1 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -813,6 +813,7 @@ if _opencl != 'disabled'
> -     error('The Clover OpenCL state tracker requires rtti')
> -   endif
> -
> -+  with_clc = true
> -   with_gallium_opencl = true
> -   with_opencl_icd = _opencl == 'icd'
> - else
> -@@ -837,7 +838,7 @@ if with_gallium_rusticl
> - endif
> -
> - dep_clc = null_dep
> --if with_gallium_opencl or with_clc
> -+if with_clc
> -   dep_clc = dependency('libclc')
> - endif
> -
> -diff --git a/src/compiler/meson.build b/src/compiler/meson.build
> -index 8d73544..1dae56d 100644
> ---- a/src/compiler/meson.build
> -+++ b/src/compiler/meson.build
> -@@ -79,7 +79,7 @@ subdir('nir')
> -
> - subdir('spirv')
> -
> --if with_clc
> -+if with_opencl_spirv
> -   subdir('clc')
> - endif
> - if with_gallium
> diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
> deleted file mode 100644
> index ab16152090..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Tue, 6 Feb 2024 09:47:09 +0100
> -Subject: [PATCH 1/2] drisw: fix build without dri3
> -
> -commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
> -added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
> -can be build without dri3.
> -
> -  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
> -  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
> -  collect2: error: ld returned 1 exit status
> -
> -Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
> -dri3_check_multibuffer().
> -
> -Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/glx/drisw_glx.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
> -index 3d3f752..4b19e2d 100644
> ---- a/src/glx/drisw_glx.c
> -+++ b/src/glx/drisw_glx.c
> -@@ -32,7 +32,9 @@
> - #include <dlfcn.h>
> - #include "dri_common.h"
> - #include "drisw_priv.h"
> -+#ifdef HAVE_DRI3
> - #include "dri3_priv.h"
> -+#endif
> - #include <X11/extensions/shmproto.h>
> - #include <assert.h>
> - #include <vulkan/vulkan_core.h>
> -@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
> -        goto handle_error;
> -    }
> -
> -+#ifdef HAVE_DRI3
> -    if (pdpyp->zink) {
> -       bool err;
> -       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
> -@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
> -          goto handle_error;
> -       }
> -    }
> -+#endif
> -
> -    glx_config_destroy_list(psc->base.configs);
> -    psc->base.configs = configs;
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> index 5975ab4472..38871b6d11 100644
> --- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> @@ -1,4 +1,4 @@
> -From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
> +From 66d73feaac088d1a588a44a1780f2eaf4335fccf Mon Sep 17 00:00:00 2001
>   From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>   Date: Tue, 16 Jul 2024 12:32:47 +0300
>   Subject: [PATCH] freedreno: don't encode build path into binaries
> @@ -13,33 +13,76 @@ it manually when running the tests.
>   Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206]
>   Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>   ---
> + meson.build                      | 1 +
> + meson_options.txt                | 7 +++++++
>    src/freedreno/afuc/meson.build   | 4 ++++
>    src/freedreno/decode/meson.build | 4 +++-
> - src/freedreno/meson.build        | 2 +-
> - 3 files changed, 8 insertions(+), 2 deletions(-)
> + src/freedreno/meson.build        | 5 ++++-
> + 5 files changed, 19 insertions(+), 2 deletions(-)
>   
> +diff --git a/meson.build b/meson.build
> +index 3bc837813f967..5c94e76649c63 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -76,6 +76,7 @@ if with_tools.contains('all')
> +     'imagination',
> +   ]
> + endif
> ++with_tools_for_development = get_option('tools-for-development')
> +
> + with_any_vulkan_layers = get_option('vulkan-layers').length() != 0
> + with_intel_tools = with_tools.contains('intel') or with_tools.contains('intel-ui')
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 753bebd961e3f..9bc308b512c13 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -537,6 +537,13 @@ option(
> +   description : 'List of tools to build. (Note: `intel-ui` selects `intel`)',
> + )
> +
> ++option(
> ++  'tools-for-development',
> ++  type : 'boolean',
> ++  value : false,
> ++  description : 'Support running tools from the build tree (for developers)',
> ++)
> ++
> + option(
> +   'power8',
> +   type : 'feature',
>   diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.build
> -index bb7cebf5a748..351cc31ef2de 100644
> +index bb7cebf5a748c..351cc31ef2dec 100644
>   --- a/src/freedreno/afuc/meson.build
>   +++ b/src/freedreno/afuc/meson.build
> -@@ -56,6 +56,7 @@ if with_tests
> +@@ -56,10 +56,12 @@ if with_tests
>      asm_fw = custom_target('afuc_test.fw',
>        output: 'afuc_test.fw',
> -     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
> +     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
> ++    env: {'RNN_PATH': rnn_src_path},
> +   )
> +   asm_fw_a7xx = custom_target('afuc_test_a7xx.fw',
> +     output: 'afuc_test_a7xx.fw',
> +     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@OUTPUT@'],
>   +    env: {'RNN_PATH': rnn_src_path},
>      )
>      test('afuc-asm',
>        diff,
> -@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
> +@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
>        disasm_fw = custom_target('afuc_test.asm',
>          output: 'afuc_test.asm',
> -       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw'), '-g', '630'],
> +       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw')],
> ++      env: {'RNN_PATH': rnn_src_path},
> +       capture: true
> +     )
> +     disasm_fw_a7xx = custom_target('afuc_test_a7xx.asm',
> +       output: 'afuc_test_a7xx.asm',
> +       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_a7xx.fw')],
>   +      env: {'RNN_PATH': rnn_src_path},
>          capture: true
>        )
>        test('afuc-disasm',
>   diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/meson.build
> -index 469eeb4eb597..dfa1c12d0d9f 100644
> +index 469eeb4eb5975..915ba11af3b33 100644
>   --- a/src/freedreno/decode/meson.build
>   +++ b/src/freedreno/decode/meson.build
>   @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
> @@ -61,18 +104,20 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
>    
>        test('crashdec-' + name,
>   diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
> -index 98e49b8fcf0e..145e72597eb9 100644
> +index 98e49b8fcf0e9..f8bdc5299841b 100644
>   --- a/src/freedreno/meson.build
>   +++ b/src/freedreno/meson.build
> -@@ -6,7 +6,7 @@ inc_freedreno_rnn = include_directories('rnn')
> +@@ -6,7 +6,10 @@ inc_freedreno_rnn = include_directories('rnn')
>    
>    rnn_src_path = dir_source_root + '/src/freedreno/registers'
>    rnn_install_path = get_option('datadir') + '/freedreno/registers'
>   -rnn_path = rnn_src_path + ':' + get_option('prefix') + '/' + rnn_install_path
>   +rnn_path = get_option('prefix') + '/' + rnn_install_path
> ++if with_tools_for_development
> ++  rnn_path = rnn_src_path + ':' + rnn_path
> ++endif
>    
>    dep_lua = dependency('lua54', 'lua53', 'lua52', 'lua', required: false,
>                         allow_fallback: true, version: '>=5.2')
>   --
> -2.39.2
> -
> +GitLab
> diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
> deleted file mode 100644
> index 036a0b4945..0000000000
> --- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Tue, 6 Feb 2024 09:47:10 +0100
> -Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
> -
> -Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
> -added an automatic zink fallback even when the zink gallium is not
> -enabled at build time.
> -
> -It leads to unexpected error log while loading drisw driver and
> -zink is not installed on the rootfs:
> -
> -  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
> -
> -Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/glx/glxext.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/glx/glxext.c b/src/glx/glxext.c
> -index 05c825a..7a06aa9 100644
> ---- a/src/glx/glxext.c
> -+++ b/src/glx/glxext.c
> -@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
> - #endif /* HAVE_DRI3 */
> -       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
> -          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
> -+#if defined(HAVE_ZINK)
> -       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
> -          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
> -                     !getenv("GALLIUM_DRIVER");
> -+#endif /* HAVE_ZINK */
> -    }
> - #endif /* GLX_USE_DRM */
> -    if (glx_direct)
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb b/meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 973b762135..499006655d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -16,14 +16,11 @@ PE = "2"
>   
>   SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>              file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> -           file://0001-drisw-fix-build-without-dri3.patch \
> -           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
> -           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
>              file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
>              file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
>   "
>   
> -SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
> +SRC_URI[sha256sum] = "7cf7c6f665263ad0122889c1d4b076654c1eedea7a2f38c69c8c51579937ade1"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>   
> @@ -107,10 +104,10 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
>   # Vulkan drivers need dri3 enabled
>   # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
>   VULKAN_DRIVERS = ""
> -VULKAN_DRIVERS:append:x86 = ",intel,amd"
> -VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
> +VULKAN_DRIVERS:append:x86 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},amd"
> +VULKAN_DRIVERS:append:x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},amd"
>   # i686 is a 32 bit override for mesa-native
> -VULKAN_DRIVERS:append:i686 = ",intel,amd"
> +VULKAN_DRIVERS:append:i686 = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',intel', '', d)},amd"
>   VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>   VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
>   VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
> @@ -144,9 +141,8 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
>   # "egl" requires "opengl"
>   PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>   
> -# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
> -OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
> -PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
> +# "opencl" requires libclc from meta-clang
> +PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
>   
>   PACKAGECONFIG[broadcom] = ""
>   PACKAGECONFIG[etnaviv] = ""
> @@ -159,10 +155,10 @@ PACKAGECONFIG[zink] = ""
>   GALLIUMDRIVERS = "swrast"
>   # gallium swrast was found to crash Xorg on startup in x32 qemu
>   GALLIUMDRIVERS:x86-x32 = ""
> -GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
> -GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:x86 = ",i915,crocus"
> +GALLIUMDRIVERS:append:x86-64 = ",i915,crocus"
>   # i686 is a 32 bit override for mesa-native
> -GALLIUMDRIVERS:append:i686 = ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:i686 = ",i915,crocus"
>   
>   GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
>   GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
> @@ -170,6 +166,7 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro',
>   GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
>   GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
>   GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
> +GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'opencl', ',iris', '', d)}"

I believe this should be still using x86, x86-64 and i686 overrides 
instead of making this generic. Indeed, I probably do not want to be 
forced to build the iris driver whenever I select opencl support?

FYI, I saw you did some RFC for rusticl, and Buildroot has also received 
patches for that, so maybe worth checking and take inspiration (or not): 
https://lore.kernel.org/buildroot/20240713093700.13981-1-antoine.coutant@smile.fr/

Cheers,
Quentin

