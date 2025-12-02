Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C504CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 10:36:50 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4980.1764671806436781948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 02:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nyP45Fv1;
 spf=pass (domain: cherry.de, ip: 40.107.162.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDwvwn8PtDzwnFOFbfXTR3sVDWjmab5xzCe6NC++OTC1qHZuCUkCeEVDPEGF/yYIi0e99zc2DYs1SCEFOrWZYjOux1BJi4RN8vr88ufV1VXOHdy2JGFGttZ1gv4K/vwT7A2A1asOM6Y/PZAVn6XBdQWz9ZDeI0Q6tByMrg5yzj6FPTtJhjYV9i7hRtpHxFWfveemRbAF61Pmnw+JvlIHH909ErW/UAaN6P4S6Z5a1LXAY06WPVt6QN/SOZ6ItDNpU6lptY7QKs6+SAbWTkCQ5o5P8h5vgRI67LqKHtcp5H7U1Qyfa3wa8SuKBJCfhWZ5oa+zMojMjh2M6XHnw2F8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm2/3Vdhga8sA8p9ty+hvnyorhzOCMyIHxx3D2cU4Vo=;
 b=qUoDU09ZJXyLjg65OwT4vpcuFWSbYx3s+m7etEO9sUxPjGzteAXefRWhpu7m50QcNTxf0dgEGCd/ODrZ3O76dZYa3EHQazOvrTKD8CfzTwThS3o5SIyRvjX3/FX4ZQ4kvAJmvt6NWZc4QinW2cBlAdVawXo8R1zYsb3ydNF2W++NjFvVjfwWG6aTgAd7mMXw4BL1g9qxAL9j23vZI3eUk5T9uEFBbFwrLdDwtQlbPPSG3/wvgvobkKdMopPNJR6B8BW85//BrtY+uigL81ojaYY4NKL1SSScUn91Isa6D9+mpLgGaNALKbmaV5elpf7tjqs3RHymjoOVjfDSh8wxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm2/3Vdhga8sA8p9ty+hvnyorhzOCMyIHxx3D2cU4Vo=;
 b=nyP45Fv1YO64Hgzg7qT3UnJi3F+HuvhHMD2hEggJOZXZOKDo86ui8YznY0/uSeCRlJcbnqR3vkJx2qw3rwnsAbvhq109LxJSqL/7ETnUYgAPKaIeyoDntFW9hMvWmGzIXpu7D91vUfDk81G9ZL6Pt4GTi4X7nNuxZsjF7nM8gbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8079.eurprd04.prod.outlook.com (2603:10a6:102:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 10:36:42 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 10:36:42 +0000
Message-ID: <cdf76069-ffd1-4b7f-b164-0a8b4ab1f5f5@cherry.de>
Date: Tue, 2 Dec 2025 11:35:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] mesa: upgrade 25.2.5 -> 25.3.0
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251202004951.2358784-4-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251202004951.2358784-4-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cee4869-631b-426d-3c9a-08de318eaeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b1RIZC9FYXMyZmJaL0tUTmlkOFQ0aEdrUlNIWXRKcndoeFMrTy9vNWF3NmJU?=
 =?utf-8?B?MjZSaVgyQ2hwS1Y3UG5KZFBKa0NWejUxOVo5R3ZlUjI0R3ZPeERadHUxc2FJ?=
 =?utf-8?B?ZVpCelVGTmpta2VNVFNvNVJSQjd0WEFFck5VRWt0NnpkNWNWQ21xYXcwVnBv?=
 =?utf-8?B?bE5XbmdLMnZ5UHhOMmJKMkl0ZkdMVk9CTkV0bFQzbTg2ZDR1VGtYc0FVWUE5?=
 =?utf-8?B?aE81bXNha21DWW42U2Z2NEh1bXhjY1VPMEM5VlJCTGZwQ04rb3lZT2dsUDVT?=
 =?utf-8?B?ZUpBN2xUbXN4NnEyMW05TmJKSXRMdFJ0UkE1TWE0a0VXMzVSelkyb0JFVEFT?=
 =?utf-8?B?c2g1OEZJckRFK2ZhcXJ1SHZXWVI2WHoxc241cTEzUVQ3dHlpMU1sbzdmY2pZ?=
 =?utf-8?B?dU9QR3hKSGUraUVkZkw5YUEzRGtDalRqNGhBUXBzc01XZzQwaFhnK2tvQ05T?=
 =?utf-8?B?MXk0b3hLY0pJZERxcTRBWTZLRFNYUm5jTFl5ZlAzRnRIQVorbUtqeldYbmxo?=
 =?utf-8?B?WHpMVlo3SDNDRmNkOXlqM0M4c3g1Tis1bndPYXVMTE5YLzJ1V3V2ZnlXMlYv?=
 =?utf-8?B?MEg5QUhya0w4VnhyMTh2SzB5ZmQxZUlDRWlhRktnbGl4K3p6TithQkdKVnFM?=
 =?utf-8?B?VkVkMENIMlZpUURZQTZyQ1libm5RVE1tTkJwQWp1Wlpwak9UZExaS3EwdUJk?=
 =?utf-8?B?VzhnSy9WWnNyUEp5U3kwN2p5cHh4RXVBa3dQaldXM2U1U3dGRm4vR2d4cVIv?=
 =?utf-8?B?UXhZN3hRSWpDOE5mWGZGaDgxck1mZ3RjQkxOSFRmWWxna1NnMkg5WUhtNE5s?=
 =?utf-8?B?Q2wwaDlaSEN0bGV3UlIvbThRWGxuYzRZSEh4N0lnR29YZEdYQVhTbDFiUDBP?=
 =?utf-8?B?c1pDUk1tbUxjVkFqbS84M3VPQkNiRVR5Si9RZWIrOTQ1SklZNFkzdlIxZ0c5?=
 =?utf-8?B?eXMzL0toS0svdkt1cmp3REg3TGFkWS95SEptTXdoeUVKZnYxejhURW9CQndu?=
 =?utf-8?B?SlFDRzhJcWF6ODhxbE5ZQnljcHBlNTNFVklhTTUrdi9od2sydW9BcFB4VnIx?=
 =?utf-8?B?SnNrSVdtcnRYcTZ6TllwS2MvR3NMOHFkTGRYT09nVE5WcUpGWDIzZk8xWHAv?=
 =?utf-8?B?azZSTE5Pa2FyT2pLMzNkYnozRDhYQjNiZTI5bVBnVzlqNVJjSEEwNGt4UUV2?=
 =?utf-8?B?M3pEaEU1OExhM1lsOWtHUXpENVFYVjl4Mk1wTDN3a3VmR1ZlYlBPYUVGY2hL?=
 =?utf-8?B?QXRMSUIyMVJXRDcrQTdxM09hVHB4R2E1ZHJLMC8zdUVGV3FVVTVDVDZxbFpt?=
 =?utf-8?B?eklFN28yNG1zUUZDbFVuQllPcytwM2N0ZHJ5SGJRbnNQUVZFOG9HUW5URXRS?=
 =?utf-8?B?M3RPOUdjUDNrSFF5TWVWcWR5ZlRsSWZrYmVPV1ZjdUtUNHNmR3p6NjRhL2w2?=
 =?utf-8?B?WnBRSHE1SVBjRnNMeTFFV1RqT1hOS2dGeG1qRmRGNVA4QTNZZTdvUUNEV0Iz?=
 =?utf-8?B?Q3NlaHJMeFM2ZlJNV1F3amQ1blVMV3E1UEpBUExFUE5NKzFzSFYvUjc3cjgw?=
 =?utf-8?B?ZUdUYTh3eHlUaHJRNTFlZDVEU1VmMUovTmQ5aDhXcHhneUhRYTNQUll6OXQ3?=
 =?utf-8?B?ckxVSzhGWHl5bm9yTVdicXFaTENRL3hrQk9DcFlHTTlDWkhFRnRBekZWeXI2?=
 =?utf-8?B?QjcyYkhvSmJ0NGdGU2F6aXJsK3h1WCs5b3lrL2N3cEk0MWlqejVSZFhkNUhr?=
 =?utf-8?B?ZUdrTG93MUdrZ1pDRXI5OGJEMjgzL3VLVXdXVDZPLzE4bnNLV1h2NVBNS0Rw?=
 =?utf-8?B?YklpUEltZko5Q0d6d2ZoMEhJMXhlUDFSVVEvMUNDZ2l3eVBjYUVhalZ6Ny91?=
 =?utf-8?B?N1BIdmxzM2dVdWZDblNFSjVteUpSZG9KWXpLOVVGOFBwOVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGpmUnBEVHV3QXBxQkI5cGR6ZENTY2VCUit4WVliOTlwQTUwbGpMUzV3Z0Fj?=
 =?utf-8?B?cXN6VHh2ZHZMeURXQVBwY0hlazQ0MXFDYjdPbWNQUmU4WW96ZEhLU1ZFOG53?=
 =?utf-8?B?cWVFSDE0YndhNVEvd20wNThyVXpGUldGQUUxWFRxREM0UVdRbHRPVzRQem9l?=
 =?utf-8?B?VE12MTZnYmNxTW5adXVlYmR4RVdOczdkRkh2VWZRWnNWTlVnamVsODFnZ2Mv?=
 =?utf-8?B?V1NIdWM4amtOOEVqNVBzUDE4OVBKZCtUZ0pWaTJrcGs1MGZmU1dLM1NwYWk1?=
 =?utf-8?B?RFhhdFhCbWdhRVdwRHYyTTlYSVdLQ21jSitrd2lPWU4wV2NLVkdwcWIwak9D?=
 =?utf-8?B?RGR6Y0VXNi9tSGRVTHBPNnM2WEhvYm01Q2J6L3pRSGo5VCs1dndpZzkwNWha?=
 =?utf-8?B?MUlxenM3M21RQk9uUy9FWVJTblkwVU45U2ZZeW56YWQzbzEwUkFaQzRWL3RZ?=
 =?utf-8?B?cVplWmh1dFhHOGttam91R1lMWnpVRUJ5QUlDUjJzVHd5RHFaZWx3M2twb3Fw?=
 =?utf-8?B?VENtT3loTm9HYlcrUGxEQXFYTkJ1bjJ5T2RoSURyelMyeFlkbzFvQXYrU1Y4?=
 =?utf-8?B?akgwbWMzQTBhdVFzKzd5OHB5T1BvUHIyN2Vvb2lkUENMbGNlaFBKRjRsaWgw?=
 =?utf-8?B?MCtZOStNZk1OclJycjZIY3pmdk4rWXNFS2dISlVoZ2I2TlAxeWViMTZtNWh2?=
 =?utf-8?B?NUY2QUVPWkZFWjRjK0tieHpFL0pMUzBHeVpIZHd2dzVXUVBYdXVoVnBURUtF?=
 =?utf-8?B?OWJDV3pTUlEveW9xMi80SHphMUxUS2gvMnlkU1lYU3JmMWY0c1BiMXV5MU9w?=
 =?utf-8?B?UFhkRlVSdjhmNUJmQWlRQXh5VmJFZzBmUGJodVF0K3NQbGRucHNmOWxIb1A2?=
 =?utf-8?B?UWhMNkg1c1NOVjlka3pnT1ZURkpUeWU4NERFRzdFUDlGU0R4SCtXa2g0NG5y?=
 =?utf-8?B?SENpNW9qUkoxaG9YWTNEL1ljei96TFZYN1IyMG5FRHhjUlg0QnVuK01SWk5s?=
 =?utf-8?B?ek1jL2RnUUE4alJHWE5VOGNXTnlMUk40RDJSNGJYN3FQUHhUMUVZaGt0ZGZp?=
 =?utf-8?B?YUN5TGtOelV2dk84dE5ONExxN1krU0NsVjFkbDM2cm9WNEZIREE3NG4vODIw?=
 =?utf-8?B?WkJBWjFZSHQ0b2l6M1VnV2lKUUthdldna2lsMDR4S1ltWTlVYVI5WG1YaDhU?=
 =?utf-8?B?MDNMK0lVYU91eHB5cGRRNU1qS3NiM0dObnZUNTB0TlZCQ3dXODdCK2ZzZk45?=
 =?utf-8?B?LzExY3RtbUM1WHdQL3gxU3RIY3VkS1I4enpDeEw0VmZRNkoxY3MxcXNBS2ZV?=
 =?utf-8?B?Y1R5Z1JySjFkRkV5U2c0a1JsUUdvcm9HMGtlR0dTVGNWRWp1enV2c1JIZFJK?=
 =?utf-8?B?cVJ0M0xzbjh3M3ZPTzNoM08yU1JMcWR2ejJoSVFpZW5MSHQxeWU0Qzk5OVhv?=
 =?utf-8?B?RnlLUXErRGJPZHgxSjJUU281bFVJenJsL0ozYVRWVjBkOHlVMDBUM0wyeXpK?=
 =?utf-8?B?YnVHT2hSenBaT3hUUVFUNzUyU3h1YnRKcFlaV0cyMm0xWTIwb2JiNWQvRGQ2?=
 =?utf-8?B?cEpFMnV0WnJGQXNJTVNJZDZyeDkwQTllc3l4OUZTWmxNYi9lTzhhU2RoZkJ6?=
 =?utf-8?B?REhHRnRkVzVVZTlVaWlSaithKzV2ODZYTzZ4KzRIVFByRVQrd3hPQmY4RUdu?=
 =?utf-8?B?UEJERk1qWEh4alAyM05IZlI5Y2V0ZGdqWFowUmpNTW9Gb1JOSVQ5TVlJTEZn?=
 =?utf-8?B?V0xNODMrUE5mSDZvODZTZUUxSitaMCtOL0EwVGh5cFBHNXBZY3B6VWlRNWJH?=
 =?utf-8?B?QmkycWJGOThHQWt5Rm9sbE05b29uSWZ1UmVOL01XZ25SaU1GMTJ2MWdPSVEr?=
 =?utf-8?B?dTl3UnFVci83UFlYcjlHL2RPRXFCNm10ZXM3UFd0T01qOU5sYWtkQXN2SWdH?=
 =?utf-8?B?a2JiNlNybVpDeE9DcnBlc3BYUFFLWWhoWXdqa20xTDF5aExjelZheHJMT2cz?=
 =?utf-8?B?NDdMdmdRb3pyTzBaNzc2RitvNy9FU0pjeTNmVE1NMVB1c3B3b0pHWFVBZE9W?=
 =?utf-8?B?WjJ2U2loMGlzOW92d3FseVc2OTdtRHkwdzB4Z0hIeXZuY1UzM1dkbG1taXVp?=
 =?utf-8?B?RjkwcjZiOFFvei9SSXhMYVRHNkJLV0xnT092dzRuWUlJVEp0dUFnQ3ZKSXkz?=
 =?utf-8?Q?9EmdO+hUENlKWS5a/AbNPN0=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cee4869-631b-426d-3c9a-08de318eaeb9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:36:42.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qY5t9HwlabubKDodVXqVE05LSpt4+KWrrCoCtFWDEw5jfdwfkMLxxISyCJ3rx6f+J7zt3ok/N+I7i7FoZjFSsr0fWkRFwXGMLjGxAVUu6tI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 10:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227157

Hi Dmitry,

On 12/2/25 1:49 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Upgrade Mesa to the latest release. Drop VDPAU tracker (dropped
> upstream). Add support for ethosu and rocket Gallium drivers.
> 

Thanks for doing that!

https://docs.mesa3d.org/relnotes/25.3.0.html for the release notes and 
checksum.

I'm wondering if we shouldn't add the buildpath QA check to upstream 
mesa's CI so that we don't have to patch things up for every release?

[...]

> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 420ba2032b67..106767476ccc 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -18,10 +18,12 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
>              file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>              file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
>              file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch \
> +           file://0001-ethosu-drop-file-names-from-the-generated-file.patch \
> +           file://0002-rocket-drop-file-names-from-the-generated-file.patch \
>   "
>   
> -SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
> -PV = "25.2.5"
> +SRC_URI[sha256sum] = "0fd54fea7dbbddb154df05ac752b18621f26d97e27863db3be951417c6abe8ae"
> +PV = "25.3.0"
>   

Can we first bump to 25.2.7?

We won't update mesa in whinlatter to 25.3.x I assume, so it'd be easier 
if we had a commit we could backport for whinlatter right now before the 
release (or right after for the first dot release).

>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>   
> @@ -104,12 +106,14 @@ PACKAGECONFIG[amd] = ""
>   PACKAGECONFIG[asahi] = ""
>   PACKAGECONFIG[broadcom] = ""
>   PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
> +PACKAGECONFIG[ethosu] = ""
>   PACKAGECONFIG[freedreno] = ""
>   PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
>   PACKAGECONFIG[intel] = ""
>   PACKAGECONFIG[lima] = ""
>   PACKAGECONFIG[nouveau] = ""
>   PACKAGECONFIG[panfrost] = ""
> +PACKAGECONFIG[rockchip] = ""

I'm not sure about the naming here. Rockchip also has Lima-supported, 
Panfrost-supported, Panthor-supporter, Panvk-supported GPU in various 
SoCs. I would expect that when selecting rockchip it would enable 
support for "everything" one can find on SoCs from this vendor, which 
isn't necessarily a good thing (c.f. amd and intel bringing in too many 
drivers you may not be interested in).

I guess I would just name it rocket?

>   PACKAGECONFIG[svga] = ""
>   PACKAGECONFIG[tegra] = ""
>   PACKAGECONFIG[v3d] = ""
> @@ -129,7 +133,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
> -VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
> +VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
>   VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
> @@ -171,6 +175,7 @@ GALLIUMDRIVERS = ""
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
> +GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'ethosu', ',ethosu', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
> @@ -181,6 +186,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',pa
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
>   GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
> +GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'rockchip', ',rocket', '', d)}"

Only useful if you enable teflon support as well, so we need teflon in 
the PACKAGECONFIG check alongside rockchip (or rocket or whatever is the 
chosen name for this PACKAGECONFIG option).

Haven't had the time yet to dig into the diff between 25.2.7 and 25.3.0 
release, so I don't know if we've missed on something.

Cheers,
Quentin

