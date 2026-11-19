Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15042.1795096473560130477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 05:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=Z7a46YXt;
 spf=pass (domain: est.tech, ip: 52.101.72.64, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyCXW9DxraxrzYrRYnIIdhKuExRZ+XD67rPSVc303MVCwSp5ijkNciHsG0Pn+mVQ2fua71K/vjKtqmqdvVy/d9XpM6p0L7+9KXthZxoBMhdyc/C2ZCoYAjjxBc1gTq6RibaasW7GgJbENXdD1wSDmN28QwH874tgrXGHiLaFeLWA3hFb4HtKm3NpoRvWsgFIbyg2ulfZJSc6hnDMqzLsPib4bVxnMgTQU+H7pVN2e5Hgw8RSstn1+e6FLnD0CPK9AssXEdLHV/ygSqRn/Q/cHyNiX1qjJ8bjxAxVZRc6ddB76tCWv/ZudwY3/FQzFgKyBNLrFcklcOfujH1MYBB3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N45DGwX5N1g69hIztmF4V7VvZN0TYuWG66okbwhb0g=;
 b=KUiF9OPtmWnhLWultF/KDbW1ZdFaL014onsZYJkWEbGgXufP0QmC+Vy/RgJAONETnBj3AEszwAL4a4tBgysVsCbjre4WC8Ic6eOs9JQd5V87FAapI3gYTMaIX3UrsPaY2XE8ZpnnkJeyrunyBdn8BynEv4aGWm69BAFvMJUPruQlm+6lXMFoAxvO3Y3Tae4jOss8gPo03NDkmQspvPKvTLrmo+8GAXfjZhewjwvujTQPJWviclAv91eZRSb2nRvY59c5mbB9w58AOnMGK+tbddZyfHEkRFYJM2zbCeycWrq0LU3bAKi+hpDa8geQKHaQENaIyyb1eu5Ky1d0qZ19Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N45DGwX5N1g69hIztmF4V7VvZN0TYuWG66okbwhb0g=;
 b=Z7a46YXteohH0AWGMkWd5fYVRhl6Jn8D/OXOrhcYbQAAYCE8rBNSKIz9RTq9P0s7N/4qX8pWOiaDwYcs2FEAm4z5Jhc4rhv6cUrtzYPlVZGSruvnOL8G8fXz6z5AVWXXP7hQxYad4tVZdJqItjx/eCvkeqCd9G4gqlhDaj/cuKd9jDhzzwyfMkhTEV7yxehbbsMoSSiT2ar6FBftcWA2L+NvblrcmxlVDYweicws9wLFADIVosLgDY9sYCpPdDVS4qedKvRY9huX5t9v2zFyAogWu4fzMH++pWu+IKbZ3dzyKolAhhxEOb3NdrIW7AndAi/PMSeAch3T0+PFDfzNwQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7PPF4745BC5FB.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::690) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 13:54:29 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 13:54:28 +0000
Message-ID: <1725ebba-6579-44f1-b9ae-13ed414b5151@est.tech>
Date: Thu, 19 Nov 2026 14:54:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/2] grub: update upstream-check
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
References: <20261117213048.842034-1-peter.marko@siemens.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <20261117213048.842034-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7PPF4745BC5FB:EE_
X-MS-Office365-Filtering-Correlation-Id: 1319eb2a-2827-4815-c71d-08df4644a139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|261009223027099003|11063799006|56012099006|261026140227099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: D315qGn4WO5Q/OOIcDvHCKNjXt5pfEpiJ9bXbjCKQ5lx2MsiN9d9Cbo2OB9zE+6TTHRdZsgO62eWvZFkdk3p105gz1CGF9BSftOQqs71m5Q5zU1WHhEEVwyVaWFTm/O7UG/Iv9nLR8UFpHGAR99W3MpH1O9Bmzy9vB2sHILxf/6S+IDembS7U6IB5sBTlt188QpSCZ3dMY4sSh+uKi9HQNNpYdwk7T6cLYxHhYjj9XzhMupMhPqS8rTAn01c9DYyMJmcVKtPLc7BzFnU1T8cwE3X0FWo9MTjQB6zE0Qvn0RHEBiPXl5vkoygiyJhgdvp8D+QO0eH76anMpqduEh3/XTvO6mtVAKYSXXjdT93WzeW2jj7tHbRMX9vdRvoDghlFrJM8uOQx7b6SAVdMbOGiWvXSYBDRkNeValp7nFqVxvCdCZYF/hyn1/r9dHy88Q0J1F/f35fOEexW7q73GTqHNk66i2PTz9vi4qfq/YCc5hi1SAwplPqh2JC6FokOjX6UwmuTU7sG6gtRMq2dZfMX0HaOSmNLo79sv6nVFDllGTDlI61EUDXiaIAhTf59vsczvHtTrOMngQbu51F9EGCdt5LU2B73msdXaLMcXXv7jQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1B1MUVXUnhzNUNOdGJxTDVQQ0g4czkySkhsWUZ4eUNXOWNoSHJuSGlFREZT?=
 =?utf-8?B?NVhKNDllbU8wWk1DUFQzc05jaE1VSlkvSCtDRTJJd1Faem15c043UUt2dzJM?=
 =?utf-8?B?b290aFB3VU5ocktqQmQrMEs0bjhGUHRuMzJGQXRtejIvK29FTExwZ3RXZ053?=
 =?utf-8?B?a0pPclBzQkJmTmlHYXdUakkvNzFJc2tnWG9lb0hPcitZUHdmZ0o1MDFzN0E3?=
 =?utf-8?B?N200ekRmWFpjT2tUMGlOQVhEMlYwQTk2MW9vYWh1UzBRbU13VEpxVG0zb2c0?=
 =?utf-8?B?bUNsRjV6aE1CSDd1SmdzVHVqNVZnN1NVSUZuL2tBZVphckJ6VCtBTnVrRkZY?=
 =?utf-8?B?Y3pDa2thWDdwOHQzb1lxYkgwUzMyZFdJYjJ0S1MwN1NCZGdYbHgyZ1ZhNkdw?=
 =?utf-8?B?ZGlSV1crTHBlaW4ycWUwdnE0MWpneUMrbkhucjJ4Y0FRNm8xUmpBTXBTc0Nm?=
 =?utf-8?B?MkEwOGZyS0VrSkJmZ3pQblg2QURzc2J4T2lsMU02cUtWaHVsVGdGcHBBN2VQ?=
 =?utf-8?B?Zk85VWdKcnUvbVZZN3Y4NmV5TlBWM2xsNG4zTFgyMW1TY3JhTlZZMTZVUG5a?=
 =?utf-8?B?ZlhhNFl2ZnN6M2pVdGlpUUV3ZlVWN1haSFVyK3pvYUI1QlZGZkZlOC9wV1Y3?=
 =?utf-8?B?UlFsVVgrd2pOS2VtWWZMNkk3Mi93dTR4NDJaRmdRMDRJaTFwdnJWbFRLWkhI?=
 =?utf-8?B?ZUZEZmRXRkNiaFBCZXU0SGYvWHBPNkpSN0c1Y2FKUDlwdzV3a3lsbHpEVjlq?=
 =?utf-8?B?OS9nK1RBajVGVWFwbGlkTUk4ZFdpQ3AvSW9VaStFdnMyNnlkYWI5bTAvY3Js?=
 =?utf-8?B?YVlEdjkvdm4rZm84NlhuWS8yTllsNDVQVXlzblFJdDV5eDZqSVFkZWo3MDM3?=
 =?utf-8?B?cy9XeGdobmZNd3h1MTFrTVdKMGVSMjJ0clFoRjNVNDlBRHFBTnVSUUoxQ1Bo?=
 =?utf-8?B?WnZFZnZMODhJaHVBVzdac0EyUXBwS0xHeTRYSVpRS2lxNi9sR3g5TFlXVnJu?=
 =?utf-8?B?c0xWU25ENTM1MzN1dFdUWklNQis5WkhmeE5LZE1CbFVONHBwK1VlRWU3Q2ht?=
 =?utf-8?B?WFZuOWVrbTlIVmRSV2FBaW9ZTU4rYjhoTWJ5dUszYmhSS1RWWTRYVjJHSExm?=
 =?utf-8?B?Z1lhZGxRWktleUxUMmtSWHIvRGF0U1owcm1JbGNMY2xiRXpUZVJiKytsbmRM?=
 =?utf-8?B?d2Nnam9sUE5LU1pvLzQ3ODBMN1hrWXlMREcycFhmOUdkWllhbE5keXpoSzhJ?=
 =?utf-8?B?RlNZcm5tVW03ejB4dkRDZHJ3aHFuUTJmZWFGQ2ovN2JzbHhFOFhJdTdjNEVI?=
 =?utf-8?B?U3c3cEJJLzlyaS9udGdPazlyUy9kUmM4K1RGSkUvY0l5WjNiN3dDYlFOQjR4?=
 =?utf-8?B?QUhLeHUyZVJSSEFTMlVqUk5maFY5YkNXa0VGczg2L0t5c1B1dlBZR1RxZG1O?=
 =?utf-8?B?TlZ6TC9vZ0hlQnBYdmZuOFhmTHFYVVlhYWF6ZFRFTXIvWTYrODJieVRXK3lN?=
 =?utf-8?B?aHd0emxjZTNJR3l0SEpWQ3dCSWgySTlIZ3NsRzh2TVFQR3dTV3VGK2l6aDB4?=
 =?utf-8?B?WGZRaWgwZ2pyVThGbCs5Vlh0TzZDVFN2VnNXajlDSzFGZEV6VWNFNUxjTTFv?=
 =?utf-8?B?OVhCM2RVZEZ2b1lsV2g0d2ZWMm1DeC9vZWFGV1RyR3U4U1hCU0gyTFFLS3h5?=
 =?utf-8?B?M29VY0tTZC96RUhLNGcrNDkwTFJkNEIwSzk5a25NY0hsN3JWdDJ6U1JMWUR1?=
 =?utf-8?B?dnI0bEtDM0tUNEtmMVJhQmVvTU91Sk02SUZPTXQ2UERiL05NeVFMRTlxU29W?=
 =?utf-8?B?VjIyMDY0a0E4c3dkekd0Qm5SUTdROTlMRkVMeUQxRC9oQ1VvaXEvTFRTQktN?=
 =?utf-8?B?YksvRHlNWDJrNGlBNzNGd0FvVEtQSXo0WDZoQjJBRHRNcHlDQWdrOUxXMXJF?=
 =?utf-8?B?bGVLVzVuRUlxb1RodFROenJxRUtZaW9GL0N3bEltWS9NbVFLaHBSc1A2QzBQ?=
 =?utf-8?B?UWpmQjBxaDduTFlHOWpudmxyWEIzQXFKMzRkemxobHU3RllEZ2RxaHlGeGNl?=
 =?utf-8?B?ZVdGR0ZXR2dXS0ZzczBFdGhpbmp1UENCeHR2ZmVBOGtzWkhERERhalhEcGFk?=
 =?utf-8?B?QzVXMUU0Y1RlczUzamc3aG1xZ3JkcFQzTEM2dGtXSFNSdGh0RG5IR2pLY3dL?=
 =?utf-8?B?c1FKNFJycTJQaWovZDZxeUQ3Rlo2QTY2c1JmNG0xeFA1enJBZFF0dnVPeVJ0?=
 =?utf-8?B?S2ZQaExOOVM3ZVd1QmxIamVmRkFyblZOWnAzVDA2VDkwUXNyVTlPV05KQ3F2?=
 =?utf-8?B?Uyt1Sk9sUTdOczRpVHFXUExQWHI5cGUzMGo5cWJOZVVSaEFoMXhUZ3dpWEo1?=
 =?utf-8?Q?bY7BBcV2zEcFZGog=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1319eb2a-2827-4815-c71d-08df4644a139
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:54:28.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhgH/8Va/t17W24yogcTMIUNBoLN6YyeE4TKEB8fMMffcHTLzT6xsoBerKwvxxW9sXy4bWcIm8zLiRDDE0kCgYpyBzT0PMUblzKSl6MIX64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF4745BC5FB
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 13:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250670


On 2026-11-17 22:30, Peter Marko via openembedded-core wrote:
>   SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
>   
> +UPSTREAM_CHECK_URI ="https://gitlab.freedesktop.org/gnu-grub/grub/-/tags"
> +UPSTREAM_CHECK_REGEX = "grub-(?P<pver>\d+(\.\d+)+)"

Hi Peter,

Upstream tags include an 'rc' prefix, which might cause AUH to pick up 
release candidates.

Better to add '$' as an anchor.

We've seen similar issues recently for other recipes upgrade.


Regards,

Jaipaul

