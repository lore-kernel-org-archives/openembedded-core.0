Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16272.1794302441071369225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 01:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=K2PLN6AQ;
 spf=pass (domain: est.tech, ip: 52.101.72.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYVBInAYv3Dr13hj2JU/6fLRLyNnuCsg6YbQJ5noxumMQMYL45T0tVhxj9THRHhnVge0DyTNzb0PZmzI4q5KZvSpFbTwNGChLYHCKk/g+lCvPRd/zzUTe4u1Qob+nIQweWbmaY3wKhpAod/pD6r2GQ8PQb2Jal9eWlaUXn7LVAGxCOhpIuuIysIeiMmLgOMI7Kc+M4WA42jef/AvjpVWoJct2bPkY/foQjsrDyBd8lEl1PXD34ptWG3CwFVwR1zOTPHqGVNcac0TXa2a4iHeh4eShRt3i4UyslMv6wlp8kqauaAZ8oosF+IC0KSdAo3ic5oukTyQ8ppM9G/ptegudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l66rft3B8RCtEcBRH+bt7dUHhStDsyKFg2ezNZpcWI8=;
 b=Z4y0lnonWuluL/EzTekVWfhnu2iutHLffhN6BIkspvQge2nGj//eRoKzjor29buqRyO9Xxsi7PDhkQjCQrmY7Gju5qsg2hoZFFkWAMWs5FGu5bOAeIIdpgAs9O7OHOI0v1e/Bx1Murb9wlUEMpzLFHLsD9pB+/Li88X+j6xq/WEtny7gFX32EO47OV5hn5aFoB9T26ild4nNcKUCqDCnSGyGWnFaJFTORDaOpXSv1rSorq+8xi6PoaSt56HQ6FvK4543yRfDlOdtmz/121Gad/L6Nvw0WM+v8voAaiEaTEbqP+tKIp7SUIL1nCr9EXPYjfGzhoAiqBxbDjvqYqgT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l66rft3B8RCtEcBRH+bt7dUHhStDsyKFg2ezNZpcWI8=;
 b=K2PLN6AQqnMtEYvxJY3/OKTJKDquS7QipdQpIo57VlQK92ovD2M340oq4/UmyufgejcBiigGq3nOpSECd1qSjEFjuxQ4iOvZjFskFqSS8GKhw/3gecVKnRjKvNbsIgSyV4/NIU3YSLjulHFzJnt0ksCiAomDSidXjIdBjNGLWD29cwZsArHtjABlGJEm4D/wr8c5vS7s5WfavUIR0PXPm2Kh/WTw42DDUvXnIRmF7z0jIaPClUNh+Bc6J//0+olS4CRFja9t88ELAbBVw7rEQjLoCEOmQ9q08zvunXUOepF4aNZu7MkXAjbhQXfrazLY/QUocRQY+8zHRMVxRJLHuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3459.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 09:20:36 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 09:20:35 +0000
Message-ID: <eef067dc-3c8e-4b0e-8ed9-b65278731def@est.tech>
Date: Tue, 10 Nov 2026 10:20:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 16/21] groff: Upgrade 1.24.2 -> 1.25.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
 <20261109134034.74458-17-jaipaul.cheernam@est.tech>
 <DMRCGZJ1946G.23GSWKZLKMZHI@bootlin.com>
 <DMREAY8WD74X.ZLMF3SYFLCH3@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DMREAY8WD74X.ZLMF3SYFLCH3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0018.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3459:EE_
X-MS-Office365-Filtering-Correlation-Id: 7675b0c5-bfff-44a4-8940-08df3f0be039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003|261028144727099003|261026140227099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: Bef+wRZmXS85j2DEwH+n3qRdG3TYAPctMJCFSGJHERiFIbX351zuPZuBb3gQXhu4RgO79nZM+SM0w+xvmvAerSuhj6y8aZOREnRnk9Upi+rBdWadFToSluMDgdFOSgHADHhNZqxx6wNU2xVxyXCCmI12SwARvPG2xJZ1hHusRME6RLk0av3xpi2tCfR0AgAypwNsH1RbXcFIZXXiFG1wnkGVr2MKMS8BSAjul8HjkVtlHJnmnwi6SpreiBufP34UMgxlamROexwoQueSbTS+JIWfUY3pKYUpB4FplhGGxGngAAqkUnrA8wqLJjSN2xJHE2sJHYP/XHBzGCL8Qu9Pt/Ytf3GvaeHjQQukejv0m77hcs3YC62A3MVIknAxU/3ka+CH9g5R6m9Gqt8P2XVGqRGuqTtrUydWwAZXvovcXFpNpFBi3VMP/zZN/pIah4wj00y2cMkxZX88hR3WtxsmUBxZKyrNxfFNCyXkmQRboz4kfWwF0oEm79y2oMTxLoMUlLWUIBZOjW3+Tfeg9+NjMMSzrD+4aY8qN9VvZPustiXxJb2VHY//ZkdNzyD33mXn9m6CUDexfvWc7X7RWZzfuZ6aQdnzD5KPsZszUySSJrlHnXOPEhaqIrTA6XhLcwFd5S70LQRK/NWsP07gXgQNGzREDt8Q9HM6JTrbQLmESPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXJtblpBV0E3SXhDaFBYMzYrSjdzRWJ2NFhTMlJoSkdHSkxtWmZMY3ExMlpR?=
 =?utf-8?B?VUhQajNZbUxMdnNncDBTM0xhZ1phQTk4dm5xSkkvUkhrc3JsaFpyYThWcDBh?=
 =?utf-8?B?cnUvREF2OUxTTWNwUE15T2djSW5tOTQ3Mlc4SlFOaU1VL2JqczN3ZUF4T2R4?=
 =?utf-8?B?bmZZU1YvMUpYWW9Bd1luVUZyRGFIYzkxKzZoUFJvaFpOc2NCTFFQSUF4anc4?=
 =?utf-8?B?MERtRlRNaGNLQVJkMSt5M0NBZ0ovUENXWnFCSlUxbzVGUmtpSXRjYTNMdmtS?=
 =?utf-8?B?VHQ4SmkzQXdqdDNGU1BmU2RxVm93RjVzY2RyM2J3Z2tsRlZIbHNidEJ2SHJW?=
 =?utf-8?B?TzdXb012Mm85RE9meHRTQ1RiNVY0eDNBdzQ0OWhqZ3hXS2lYTVpvREEwUVJF?=
 =?utf-8?B?QkpwVG9zUzFwOWNYb0ZjeVNKTkxUWVNZakhuQnRzSzF0VlY1UEs2ZkdZTDBV?=
 =?utf-8?B?TVpIWW0wcW9OSE9CS3FYQzhoN0tCVGNiTWhaU1NnYVFTUWVrK212TkhTQlBu?=
 =?utf-8?B?UWszbms4aFNURFhGYW5aQXIwbzhaWjNWVFhVU1B0dFNERWs2aW9VdEExaXAr?=
 =?utf-8?B?TUJOakc0bXBNVm1sVXZuaGZMdVdySDYwalQvWW9XbUNqUmlRZTFDNDdkdW4x?=
 =?utf-8?B?UXdOUUg0MitZZkY0Mkw1MlhvMG8xRG9xZXJ3T3RBWUFMNXMyZGNFZzUvU2R1?=
 =?utf-8?B?R3k2bVJlbkNlUkVXa0s1ZXFGOGZUSXEyVWMwSTNsSmlmSmxoeWM3enJTNEQx?=
 =?utf-8?B?bkhxNm5yWUw0MGFiNnV2QXVybTlVTmFYZERsRXg5aVcxUGkwRFVRcUdYa01s?=
 =?utf-8?B?YlNScmM3dkJVaEEvMWZQSEdjaEVnYUNXa3VMMnFkaFR2akpKSjdIZE9YRHhD?=
 =?utf-8?B?SVZ4L3V1Rkw1MjNjTWR5c0V2WDAreXpKL0s2aHlGVTlWa1pQVWJWYlpXOURR?=
 =?utf-8?B?ZEwyWEE2dUdaeGtUTW05OVNFT3FHcFA2WjBOMHlKZjJmdkdiQjZxNHpoVE80?=
 =?utf-8?B?L2NGcVNGaGpMT00xbkltM0prelhmOTRIZzhzTzY4SjM2b3I2cEVBWTFseVBY?=
 =?utf-8?B?SzVGdnJmYld6d0FCSHg0TGxJYUNpa0RPczc3cVlqYTIrcEdNM3lvVWprVEtK?=
 =?utf-8?B?NFdrSktJYVVaZXBJcHJXc2c4UHJVcGNNZHVoTG1rbkFwdndISGJPdFRWd24v?=
 =?utf-8?B?R3MyaFRrSVFUVGE2cXNRYWxHNE1IUUZVZGliTlM2R3A0cVZpUUZlYzNUaXFh?=
 =?utf-8?B?WHZsQnhHVUdaNnM2TDBHcGNQbzlRNWIwSHg2NVhVVHN0Q3kvVlBYalA4T3Rk?=
 =?utf-8?B?WjZXL3lmbEVGeHJFL3pkSDNjNGI0bkRIZ011KzF2aUdCV3VXVE9WR29SNEZu?=
 =?utf-8?B?dTZXRTJRMGRZRDNaQlFpMDNHWG9UOVZWc2lraS9XSy9RVkF6OVVmRS9PSlVC?=
 =?utf-8?B?b3dBYzFvdDY0aTlkQkd2MGJqeXVWQnJpNTAvYjh6QmdjRVEraVBxVVlzY3M1?=
 =?utf-8?B?aTVUd0NxZjBpQTFYQzVValNaT1lLR09VUHpVL0Nob010eVRralRqaCtVSmtV?=
 =?utf-8?B?R0kzNm9XOS9OekhpcTJYK2pZMC8zaWxHSW5uRjk0YnJ4cVYxSzV2M1MzTG5s?=
 =?utf-8?B?M1k2ZFJ2eWdlcHRsMEQ2cXMxVEQ0OEJGdmRndkRDRFhJRzIrU3c0b0FndFY0?=
 =?utf-8?B?NmZUN0kweHVqdXVrNXhoY2ppeHo0cmhyeFVVbGhUMndJNldPc2xrYS91Uzda?=
 =?utf-8?B?bTREOEtUS0RvaE0rTWlWVmtTMEExanMxeWJoZUNGaGZMZlZFM2xXZEQ3S2hh?=
 =?utf-8?B?bWFpVzJsK08xanhSOXdOY0ZjRVZLYS9ZMkpmcnd3TW9QUkRrU3RIMUlyUnJC?=
 =?utf-8?B?RnVLUWo0eFlUMzJhMkFTdXZPbUh6QmxCVlB1anYwUlRxb2M5cWR6TThrdWdz?=
 =?utf-8?B?TU5EZ3pUV21lazF2OFUxVzRJMHY3WmtMdzlRTHg3SGJkVjREUjh6cVZudXFV?=
 =?utf-8?B?KytQZUdjQm4rZzNod0pKc1NhRStBd0ppU0M4K055TkxYRFZYRWx4WjhJdVNC?=
 =?utf-8?B?cjg4cERDK2l1QzN0ZGhEZVV1a0JaczVzR3BURFZJaTBMeVVNY2QzK2JraVpn?=
 =?utf-8?B?VkVKcVNDV0owKzNDWXdndm5vdldicWVjd2FyOEJyZHVIMVlJRkR4RmlZUXV6?=
 =?utf-8?B?c0IyRGREY3pKK0dDTC84QWdpQWY1V2tjK2h4bkFra2hzaTlmQWwreVlaTlV3?=
 =?utf-8?B?TGIzalNnNGU1azJhV3gvSUMyeG5GZkRnOXdMUEtndjkzUi96WmVoYUlPN3gx?=
 =?utf-8?B?M1pJNEFrU09iV1ZRdFZDRlpNQVdldWRoZFBhNi90YStjK0k5d0FEMzZ4Z0Zs?=
 =?utf-8?Q?pp7/YpPVgaqFYK18=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7675b0c5-bfff-44a4-8940-08df3f0be039
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 09:20:35.0743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdGh02AjLv/RoatTSAxRvFL48gKnCeXPCfYOyizKo/iLSs8wEW5chCojtBB0gAQ0WWHQ1bnHUQpjuYBNRLuMOQBDiRSd1Y5929kzhVjYXpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3459
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 09:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249914


On 2026-11-10 09:41, Mathieu Dubois-Briand wrote:
> No, it's not this patch but something else. I will pick this one back a
> bit later.

Hi Mathieu,

This upgrade is failing on latest master + only groff upgrade. (verified 
locally)

I will investigate and send v2.


Regards,

Jaipaul

