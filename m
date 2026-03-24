Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37804E9A762
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 11:13:36 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17427.1774350805556101810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 04:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PrSmEnBJ;
 spf=pass (domain: cherry.de, ip: 52.101.72.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0ECkU+a8qD5c6AnYtAmG1U61+zWqQkNxygYJx4DBdNXjbfuiu6yyasf9PBXpMftTwxdmbqxuGw/X6Zl/h/rekfslEOCXrFtJ5b9D3cE9xRqIzIWQ3a5ai6kcAT40HhxgpAaznSSdY75b61kAk4qTSxQkupAUzSzqWGq6jZC6IUCNyG7O50p41K2AGLPccq/dYlUDVEubNfpgNnWccJRO5aCVHBB3ueYV82blY0VzWjA96qem2UTKjXzESXhJM4HkIqRcldmjj7aTjcbNutjtgijqC4iSXzD9GKslA/3wS1joQeUicvzemJx2ZrGMnq7tIT5LlJiUg8DcCID+4UDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJmpds6vxsjxPNNaGLZG358nSDGPCsh1qOL+PApxjMw=;
 b=A1R+FRjh8P2rL2Q0xnPNQZZ7KhhFL1lcMgGsfnT4NExPm/Hk1vY2/mw2clr3JR1Glfg9GUWVTZZdMlMn5wlvBc5ui2q4A5UHquUAFAJYFuBf5kAgSzIzZIDIE6yFyEQ/hM5q/vEXu+nmU4rvk96N7LNxQK+bu9rU4JeLJvrDeGeI+49un3f/RSeAzMNq6Ew+mSlRm3jtxPm5tTA28j3TcwK4ZQVAl5gAaqEZUucvL+rXwuNKz8HkDmxrA6JG50m1JwH/V+Ryvtimp+TdA4keSFW003nmNvyFsvjPaQagND2+/JcRePKwvP+AeKhLBaDIiZZcaRM+nBuUd8G4c+F+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJmpds6vxsjxPNNaGLZG358nSDGPCsh1qOL+PApxjMw=;
 b=PrSmEnBJoCHweEOXGSCiTUG+Zv3sd/X9lsxmc2vdTkRTYI4g3DmFuRwZ2D+L2fAkrcdqKUTzpt2S+mC1ycgTC59hYwWv/eIRcpr7g4onK6XPM1iU6KZF6pyRutVYi1KrHSaRZeZR8vpMmGc1Y56Mo+A5T+pLqANhZPfpw4EY2XE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10168.eurprd04.prod.outlook.com (2603:10a6:800:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 11:12:55 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 11:13:07 +0000
Message-ID: <297bacc5-8e9b-4b35-87d0-8fc505c5af38@cherry.de>
Date: Tue, 24 Mar 2026 12:13:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: Upgrade to 26.0.3
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
References: <20260324105510.2896915-1-zboszor@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260324105510.2896915-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0245.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10168:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb229a5-f40a-4b34-86cf-08de899653c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	zsUI9H+y4Q0yFtvJXHYqJ7XiP69gBW3mE9QGL9IfKT1jTpWXRAsE8auqO4/SdIv5Alb2FKyUFbmuy/dLL3VIRkBMvaRQJo4kphvkIYhcV4buiw4XkSCOT9YhqmgPzByhmvJDtLpNEJYFhYNe4ZZmuOkCn/vhU1LCIgh6xHoAQb6elWEUMZI0n4BqzLGfQOqESaMhcyblgiy3BHpQfbV5+gxNb9yqS3DqjiHqc2WVgb9rrMuna0oRHRA5MI2oOyPi2QPzc2iuxQqm0PdGQiieSQVp7NzecCgtKpllKNI9O6SAQneDBuIPWcQXlq6c1wCRsRCcWvKYdASywgpI6EwUHU8VNSl4Rol1vUFCGotyrmZIhVsAMPhNNsW1ScvmvhNIu5Vej0VPqbwZRehvjmLMAQoEUTh4fcp52b6/HGeC8mgMXOH2Pk9AX31WT9T47qAgCDjEGGSjOXuMdUZ9y9Y5fTngQB3uKwScTg5nUnOfcR9Z40l7E0q2Tprhg63VZZzb1U1Yo1sRn6NrrW/H3ldGbTOg4JhZxxTTxGumySDQQ+m4nQ6OMPGwkM/bObidQov0uZmIKz9ot6xt0yl87XDSoj+wEALvOZzaxihpG/oIQ91XZ2zMtHyaC+dhdSfUJajcLQyc1Sg25NuQP73fMV0fp4KVy/x0Rs3h67o1kdYhpYb+RJIWL2vUNyf14pR8JiC3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1RyUFBaeGV3QTVWYUorWXZsRlBlWmJmcUVkdi85S2o1emhsNlVVVkNWTWhw?=
 =?utf-8?B?VXFnNXpPbExkYWNIelFvNW91Uks4bEVJNEhDdWRGdnhUcGxXS0V5NVpESzlh?=
 =?utf-8?B?YjZXZmowL2dVRHZoeklMaFlCSGtERmVDcDA1dFJ1RkJKaG1RSDVncVFpUmZt?=
 =?utf-8?B?M0o4bXhBL0hVU0MvMXpTV0k1WUxwc1BacHNWMng0cWZUZEhiRUdjalVKcGl3?=
 =?utf-8?B?WlliV09DMVkwdENDeDRGUzhoY2k2djdNUGRudVl4OUMzWFI4WEUwYkhTZy8x?=
 =?utf-8?B?K1pCb0g5Q2c0cDZ3Q04wZVBjWHY1Q0tNTTVSYW1PUGh6dW5iYVlWM0hLV2hB?=
 =?utf-8?B?bUQyeTk3OU9obDg3VGdYSjA2REFkQnJRK0lJblZzOTF1dkZOclVpa2tMcjQ1?=
 =?utf-8?B?RVErU1ZQMlBpcFBqWkNqVXJzZmZRckRpd29qanJOeU5jc204aDdRWFN2dko3?=
 =?utf-8?B?MVg5cDZhTjAydlZkUThpME9USnZuQ1BjU1Z1YlpJRWlXRE9GK3JvU0J6bVZF?=
 =?utf-8?B?UVRRSXBzS3BwMjlud1hIUlZySWoyMlV0TS9idnN6ZGR3QVp1eWFEdkZkdlU5?=
 =?utf-8?B?TEp5ZitzUjVzVVFYOEpqSlo1ZVBXVC9jZzI5QXEyZWo4bXdsalZqUFhnbWJW?=
 =?utf-8?B?QUx4a2E5dnV3VnBVdkNXaGgxLzdBNzZuVHNOaHJVc0Vld2VCNG9aeHVKN1FG?=
 =?utf-8?B?YVJ5UzR2cUJ5TEw0dVo1bEl1ZVZ1NEtnUWsxV2RzczFoWEhDZUJXY3UxK3hP?=
 =?utf-8?B?Vll3NkhQUkpjQmlHSFAvY3BUMWN6L0RRMUJVWDd1cDV1ZjFUOXhhL1ZpMTNh?=
 =?utf-8?B?b0M4QTlHNjF2QVMyMlFXZWt2aHJ6bHg4MUp2S3BFNzh6SWRkVEZPNzFzYUNL?=
 =?utf-8?B?S1crNGV4NW5IQnpGYzZVUE9OYUNESGhsc05DT0VTWForaU5DS2gwU2J1RlQx?=
 =?utf-8?B?YkNhRU1kdHpmMkE1RHVSU095VHA1ZVBaVkhEWVN4TXJFeEVla1BqdyttVUN0?=
 =?utf-8?B?OWRibWlsUEdLZnZTUFkrV0VWYkhjd1ZvUm5rTW1xUi82RDNHclQ4UEhhT3Bx?=
 =?utf-8?B?SEwrQzVHc2dVampIcVR4aEVidjQwaG9xVmk0VEdGWll3S2dsamJOZ0dWMVp1?=
 =?utf-8?B?dE96UDc0QmZUL2I4dmNidlh2WjBoRTBSejBQQWR5RGtCN3JKOXg0alpRVXRI?=
 =?utf-8?B?Y3J0MTlRTlVlcHI5bElNN0NCQWZBVWN3SXBPT2h5UE1DTDRESnE0ZFRrOTRL?=
 =?utf-8?B?c3h6cWdDeEVwTXBHb211MW91b0FKS1NaU2N5eVNXRTk0NDdTMWU0TXBlMXM5?=
 =?utf-8?B?NnZQUGJhbWs3cE5NL1lzbUtPUHlDNVJBUnRvak9NeUp5QWRvMVFwVHYxOEti?=
 =?utf-8?B?bnhZQVRINzJRbjhOK0ZFUWlzN3lPSWg5dzFZMmZMUHI0V1hMTzhlWjRZL1Fi?=
 =?utf-8?B?cFBvSzBqY0lKam5DdzA1eEtuOHBRb3BCcjVOZG5LUjJDREd6TzYzbWJEQXAx?=
 =?utf-8?B?NXMyVjZ2WjZ0Mkgyc2htUjNyc0Z3ckhIMjVFM3RkNjdJUy9QQmdlcU1wY0xY?=
 =?utf-8?B?VUtKcTdKZDdTOHhydDh3NW5aNGxaalRkU1Y1Q0MzYzhpV0lYeTZBRnF5L2Zq?=
 =?utf-8?B?QWVqaWlkd2lKQXJLVXQxamVZYzJiNWtOakhmbFBOSWx6OWhtU3VHZGVWTzEv?=
 =?utf-8?B?QlJ1akhwbEZNYjNoMHc2K3BON2FEVFlWVEtLeFg2TVpPSDc2RDVQcXZkMWFE?=
 =?utf-8?B?ZkpoNytBUjgzSkZhN1I0ZkFzejZkejNlQURyWWJySEwvSHZnbHNVcEcyNGRh?=
 =?utf-8?B?aVdDRUJzbEpOenhlTHRoRnBjSW5FTjRzNmJpTThLS3RDcWRFWVRxR2dPSnhu?=
 =?utf-8?B?cCtNdFZBTmJaUEJkNjhZOEpRQ0IvN0VlKzQxa3RuYnVKTWJuTmRETUpCczZl?=
 =?utf-8?B?NzNJb3J4Wnp3UjluQlRxdWJQV3RIUmJSaTQ5cDZDSGFZSkxrdGpSRnB5eHVk?=
 =?utf-8?B?dlNiOWdaRW0vNnV0VVFQSmJlanh5VmYzUlE5UE04S0xEZUwrWlF2RG1aYmJm?=
 =?utf-8?B?L1F5V2xuZ0pmTXA0cXdQZCsrOE0yb1ZRMlZrM2tpMFUzMFVMU0lPVmdtVWp1?=
 =?utf-8?B?azRiWG9ZNGJma2JhMHhPYjBJejZmSUVsUzdEUUJ6OGFhRmFMTHUzYzg1dTJW?=
 =?utf-8?B?NzdUeml1TVNsdWRma1p6d3N5MHBFNUE2cy82Zi9QdEw4NEZQc25sdDJvRWRK?=
 =?utf-8?B?dEdaWHZYTFA1MHd0ZzVPTWh4WmFvb0xGWHVpckxaN1hqdm4ycEVNdjdIVEJ2?=
 =?utf-8?B?Z25IWTl1UjA5emljMmNldzM2c2o2NWJKNjhXdXpMM2ZFQi9kbnRaQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb229a5-f40a-4b34-86cf-08de899653c4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:13:07.7563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Senh0LM1dk3T/8SzfKzFkISjN6CMTZhNN9tEvUJlA4skwZi1h2keObE9NO7orEB/0zpm6qb9dzoQ/XizJMB6bxB4Pnk/I5sKDswuTcbG7us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 11:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233791

Hi Zoltan,

On 3/24/26 11:55 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:

Please include a commit log to avoid tripping patchtest.

For example:

"""
See https://docs.mesa3d.org/relnotes/26.0.3.html for the changelog and
sha256sum.
"""

I don't think you need to send a v2 just for that, but it's best 
practice for your next contribution.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

