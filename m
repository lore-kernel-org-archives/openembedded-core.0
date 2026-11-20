Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3435.1795171272089211537
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=Qq9W8F0i;
 spf=pass (domain: est.tech, ip: 52.101.72.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tj27ELG9XQSREOCkpd9NexJ6PP9+GhM6Lox2+8t/rCO7v7287lT6iSDV4eo2VAj3yu3c4YG9/vyD2hjFQHlkUlwberqmoPnteqKfEKSgI8rZf6H6uWxHi99rsH/dA+bLJ991A9mU+oVe4/2ingnp8uKLwFynyPB6UefYbr7hR5iJkCjpcgCgLJNk2HNRZxk5newQ21xOsvPoD/r+oj/KRIR21kq6D34YlP9cihXC2aikn/kSjnosXWoTrSZmDy3J4jcu01FigzI/MZpn00weCXwxBWWkBU++ZjyR0uy6Pp0k8JfKNtMeI4R3D+VapeR5eS2EDpSHgnFYIciDi/WLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUwz6U7FrwCkqJR/wgfDGcKIg0P8n2Wrm5P0jSfveHg=;
 b=HelDykswq1iODeg2wNNywUG/59a1OJFtG5zseIxdCbQyuGCHoBP3ug4Uvp0u2l3m2cAK80o1VnpwW/XomvXpM77SBuiWZTFL9xg2lb3iskmc3ezc/WTHtZfH9Nq6KtcoCcOc2lUVu0iO5oCIIsQ1tSiwnQozBlobpMrVKxjZdlU9YYy2VRsR4FaDNaJ/rup8ch458B8RijqWdNlmLXJ2H23grO7OhcAVMs+tr2v1PjI1xq2ntNUS+1guVugkfiQEY9RwLmKzGyMdYk1YqaixQhqLbj6AjmXCJSLapVa0jyj2G5RAp34MDFLAM1nQXvMfBVBDh/xxCwjow91rztD2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUwz6U7FrwCkqJR/wgfDGcKIg0P8n2Wrm5P0jSfveHg=;
 b=Qq9W8F0ieoj+xoubCMuRTGEMxyZy1ZzojKzbeYrVJqqtEUuaB+FC6GneEPVUAo5vXX7dD2d3kDF4vNnkUOhy6UqVH9SR2xLRbweT44QXWIdlZoaIrUjNYMVlz1fO8ztlYQcIHovlCZyPd8c+Z50aFlGF0jt6CC4/F5w5rzCw5pCNwWPhu0cUO98xvyVGoRlBd9vprHWmuFAZLSWpN6FOzqtIyrZcnWnc2HozGbeMfV/3ab6WLjbcdL7SF5FGfchOkQoN8Z+zz/UcqHbRXt/f4dom3vRhAZxFLFC4u3uDhaC+JUpJG2DGpIPkUcMahqHmLsvSHyN+LB/ka91D4T3hEg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS1P189MB1814.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:48c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 10:41:08 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 10:41:07 +0000
Message-ID: <cf973a06-a224-4c21-89ae-4a35c0af9384@est.tech>
Date: Fri, 20 Nov 2026 11:41:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 7/7] dnf: Do not hardcode /etc bash completion
 directory
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
 <20261119141333.34492-8-jaipaul.cheernam@est.tech>
 <CANNYZj9dikE_THGNhhdMYKdJ9PJj4fPApc_mS1XgiJufwZFmQg@mail.gmail.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <CANNYZj9dikE_THGNhhdMYKdJ9PJj4fPApc_mS1XgiJufwZFmQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS1P189MB1814:EE_
X-MS-Office365-Filtering-Correlation-Id: 191fed65-7de6-4653-6271-08df46f2c8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003|261028144727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: dliz3Z6r2SEDyaXALRTXdR0XSEbfdqdLutHWlIFmckdJSKfTTFUyGRij3UxwPFOhP6ecUHUI/PC6bN4QKZQ7KOGEMPGsYBQpt3J1ZhWQq4zypvsdkL12vI1HRGwnPqvNw7scTtYcupoZ3JWvzN55JkG9AwOWT5jtcdcnM2vVicbVhDHCPOZOkfYAohuHLWvSAl90EIQQlCnVxrQ2/IG3w1umZr2vZvLxcUXPGs5XNkUf8Htt96I05Qa2H6oFtqumSHjgVy2Kdl5JGIMAdNVK74unlUYnIXf9QZwvSgj+eDaEfnEHfhvhGPCBpkRMSqasT6WVxAo2dGKRx2P3zV1Vx7MYFa60y1Dl7Eld8akrr5byzYRbGTvlQQNUWFR4YGQcdBdwZIE2ZuBkZ8H90AzrbV2T85hr7PszzB0g2ll004Bs4/auGEpZc9lTwshEbDJGV5/iZlzTLgFQBDtPqvsjMxVDGy0B7l5PIJ++0tn574HykIXd5HVf6jZfBtNmkYhwYjv3tIWi3TFc4I8xpTZTXgsTMg5MpA64S/UU0/rOIhkDkeRdOuodHWe1B2GqgMD7CAlbO68upOoUnSNmzLF+VX2J21awPoppQg1raU6EMiCdEDr50W/fA+CXQjDCqj6pCq1VvrltwPbB1WpF73lcXraqxBM6yY65rcoevhrHnk8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003)(261028144727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3FBRTFGSGFXcFpjeFFoN0I4c2JWQlAxbGVqNUNRaGtCU2hFVWcxYkt6Y25B?=
 =?utf-8?B?aUxWZnlVKzlJMDdML3hrelFMRjZQb1pVb090UEVudXdHcXFxT2ZPZURzbXpO?=
 =?utf-8?B?czJlMVpPRUhycG1Tc3lHMnBENGM0dFlEYXVOR1g1amtUREx1d25QelFvdTgx?=
 =?utf-8?B?Y3ZKQm9adStPd2c2RHVEMVNDUUV6c0ttc0YyYnJNU1pDZHJ1Ynhmb3RrUlBk?=
 =?utf-8?B?cnJaR3hVNUg1NHNCSGZSWkp4bVpaSlNmS3prY0lQUkhtbG1rV0g4eURoV3Bw?=
 =?utf-8?B?Z1Nxa2swNE9hOHBZNnZzTm9aZDlOSG9Ea3FqWis3SlF5endGNVhCZ3ZLK3pZ?=
 =?utf-8?B?QW9Gc0VoZEJWczh3bUtoNnd6ZzRXdVRKYXdjSmdzRGFCVkxSS0VNNDFJeTdN?=
 =?utf-8?B?K280RVZ2Tldpb05nU29UbGJmc1dGdnFuUmkxSFdYN0s2VTZRa2lOeGVBdUVM?=
 =?utf-8?B?bm1UdnRlbTFtWktWdXJieE5RWXluVEhjM2RqMmlvRzRrTjRMQ21YeS8wVUFB?=
 =?utf-8?B?OFo5QXpPRFpiZHBKNVJRSkRTam9kd3R5aDRYdXVWKzlXeEtpWlQ3YlZYUzdi?=
 =?utf-8?B?WENsaTR5czl4blByZWxhVDdtSC9xblltNmkwUnBvMXR4SGZYNVlWK3V2ZGVK?=
 =?utf-8?B?eXJTL2ZiS1U0NmMxcUpMTGF6azdqL05QeTN3blUxcGtwY0c2MEhMQk01UDl6?=
 =?utf-8?B?Nm04SFZHTFRCbGtDSkh5UEhJUE5jcEg0amtTMlc2SmhFM2lmY0tFWWF3c2ts?=
 =?utf-8?B?ck53L2JSdDh0S29GdnlvaWR2d2dQWmdWUUJNbElYTW45UkwxZFVMdUJIVGt0?=
 =?utf-8?B?NjliQnVHN1RZL0locXZtK1FaTXUzWVVQeEpXN2lNWnd1aEhIRmpWTUoxYUN6?=
 =?utf-8?B?SUdRcGZ0Sm1HeWJjWld6S2ZsUUV5b0RSOGNYMEhqQkhSNVlxY2gyYkZ2cTZS?=
 =?utf-8?B?VjM3SXJQMUk0Q2kvUjRtVktNbUJwWFErVnhPcGtaQXdwNVM5MUhrRE45U05Q?=
 =?utf-8?B?cEN5bEdIU0I4bXpCU3VDdjhadHNJMEhqT3NzNTFFV3czbTIzSmtvNERDTHJx?=
 =?utf-8?B?SXhzRzVFellid0o3cWxWV3pneEtGenFGNkpjOVlxdkZ1ODR4d2tUSS9zY2tu?=
 =?utf-8?B?VCs0VmNvYm5sMVVUM1Z4ZXBFem9lQnJWbCs2TTdHeW1CTlhnOGljS2htcjBZ?=
 =?utf-8?B?L2xiRHZxeFZ5d1FXNDVTTHgrTnJ0VVlRT25JV1g3Rm5tME5NTWdXMWtpc1dQ?=
 =?utf-8?B?MDVZNFYzeS9ybHFreHRzb1UwSkRKNHY3TUtZZ3dxZHY1c0tZOTduVmlEWlBn?=
 =?utf-8?B?eVpIa0dxS01ta2cwTGJ5Z0dXem9peEk5QmpBUHVxaGE3bHVEbjJ1ekxxc0gy?=
 =?utf-8?B?RFZESHV4VlFzV3BtQ1VGbVFZRU1oMHlyTHQ5RmJXSFB1a0l6UEl6UlpBQUYx?=
 =?utf-8?B?L3BycWo1c1NyblZJRjlsRW4wdVRxQjNyTnhkc09uUnBuQXM2N3dIYWhjc3Bv?=
 =?utf-8?B?M2ovZDZRVkxadTl4ZGZOZDNEaFhmSmM1T2JhYW1wZGlXR1lRK1pSaXhXUWNl?=
 =?utf-8?B?d2orOGNQUi91am40V2crQTV3bGhNZ1hGUk5xckRjcWNUMDlzNGd4eHZSamVE?=
 =?utf-8?B?clBvMXpuZ0l3OXFuT29rMUJqdW1LWHNhVXJ2aUhFSnpLczFCc1ZZQ0JLc3JK?=
 =?utf-8?B?V3JFZnZ3Sks4eGVJYmx4NlJsazJXQkVwaE1VZm1CWGNLWEpWU0VUbExlcG9B?=
 =?utf-8?B?TFB3dktUZm1Bd0wvT1VKejFyaDcvdnkvbGF4M0k1Q0gzRFVQend2S0UzOWl4?=
 =?utf-8?B?M0k0OWk0OTFkVW5QMlJKenBmdm9wYVpCVVplMnFNYVYwZENXbFZVb0I0TTZK?=
 =?utf-8?B?STRpKzRMcEVaNFFUNThxL1F3bzRpMWgvdHFWQ1FPN1NFaU9KTU5ud25pVVIy?=
 =?utf-8?B?ZG5wZDhzWHpFRkdSZXRUcGE4bTRON05HTlFFenFENnlhSlV5eWdhbCtLVHlD?=
 =?utf-8?B?cDRZejg3VGtVbnZ4UkNodDc0cktmUVUvd0t6d0RDUURUV1NSL3ZWdDExWHE3?=
 =?utf-8?B?N29Xd3QxdTRseUMvQnhiSkwvKy9udDVBK3l0QXpId1R5ZmNqVktQUHdvYkxn?=
 =?utf-8?B?V2k4RDlNWjd1aDlKUnp0VTkxTXIvd3VCMlZCMW9TekhPelRXTVZxNWVnZmpD?=
 =?utf-8?B?TEdHMk8xOTl3QmZ6bDBWbGdWakZQZFpISkZUWkhOMCtwSVdHMTF0dUM3RGdj?=
 =?utf-8?B?bU9Rc1RvTmRtOHlQTUZkdStsakRRZVZEcjk3REhqNkw3ME9NVnFmeUk5clB0?=
 =?utf-8?B?ODBic2pIWXZDWkhsT3c4TGp1WHBGc2xKRjVtYURsTXl4c2Z3dE5PZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 191fed65-7de6-4653-6271-08df46f2c8db
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:41:07.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MID+8kxhoTZD0VYPFCdqj7EAQp4kkOxEv6xFEAFMpDDvRzNlHMWZ7TneU/mxHMS1FiBogQasunx/OTwtrtkaYx99m4lmfDQfNAOQQn1bjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250760


On 2026-11-20 11:36, Alexander Kanavin wrote:
> This seems like it could be offered upstream?
>
> Alex

Hi Alex,

I can try for both bash and systemd patches. But as its failing now 
meanwhile can we take the patch into oe-core?

Regards,

Jaipaul

