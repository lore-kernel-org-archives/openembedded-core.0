Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13537.1795698994702843800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=k9Y3qoO+;
 spf=pass (domain: est.tech, ip: 52.101.84.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+qk3onkPh+LqcPzNcJpwkpc7nOqPIfv3d4daEoPkvDzETvz8oNKHycY9yys4lHo41a87ZuWI8iBdT3v+JBzi9sgAsjrpdHt+jRLZxz/0cpQxR61uXyIwKqJipw6ZmE9aZ3fu7qDnSTyll7zLF46jegjAy7d4mwQSg7Xk3mhnS0jHGNwqBBq9uKzPIXy/MyV48n2FJvdjhYIwUygBhjg+VPjnX5lSFLcpJQfsMr2n3s2RCjggYHT8bCsBMM6+bL/NI4JvlbfV0eH+xqom+ZttHEBB16knbkjO0Jnyemlqw4J5GtcBtUQkV9tEwiLRzmFHj5VtTrJlSHnaX7GmG/o0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aMLK1B73IcEmPJTqZxpKJqLXqg5nMIM+wNojiy7qsg=;
 b=Iv3UbFb6W6KEGO5haDk+fKcxlFf9IjrR6gu35anZIo9vX3+d22FrRLD4MPIcG8VNrQgAWYooP/SW5IFkKCqFqr9Z4rDDA0u9flYur+iB1TvqtyHRjFLC+nDHHHhd7f8UGP34ea11dHNh6ciiiAZE2FZLdQHkymy0DeHUbBRcPO/HZit9MUf9H2xd3lfzbf3OfGmwHR1BR1zSVOuwhRgCJ/ip6WhuKiXonO+tD8sxQeOR16VMwLaaTrEFhrtqDQ752DdHJG+adcjyEnldcRHKqWfkjoSHvYblFIpTPmSl7tE0lqarJn4gYDslPn9lFIfKZuFnVbfiKF2S8DQD4cpFhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aMLK1B73IcEmPJTqZxpKJqLXqg5nMIM+wNojiy7qsg=;
 b=k9Y3qoO+3rzt5wM0ydly4oDzMZB9DBuP8OFixGlTrA+dHtJKBRVDYL+mVdgip2OsKn+8XKA06ED9XcWU6SCNB4x+17qdkyMzWG9V02k8xiAUvqB45hh+o3LLahtvZog9hvL5c59jjuxNPA5dkVe4SYFXPITgh4lQuQLkBYBEDkKR/dCsLolwwWTaSaRGjZUdgn+hY7zUtsSKYUV24ZevA2BVZEwmeAWPHBGP6Tp0hMEtdr71KgNrNt0Nw4dtu80cVyRrDE4QGJ5pTR28u88OgFotte2w6toXuc42agcRNSHMm1OG/E0IPWVUFzuhTJIyoOMCuqkO9ptxPR2iJvnfcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:16:30 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:16:30 +0000
Message-ID: <b4d3394f-09a3-45cf-8d2c-dbf3629dcaca@est.tech>
Date: Thu, 26 Nov 2026 14:16:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 06/11] ovmf: upgrade edk2-stable202605 ->
 edk2-stable202611
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
 <20261124171807.74394-7-jaipaul.cheernam@est.tech>
 <1281564.1795692854389261236@lists.openembedded.org>
 <DN55C99MPJSJ.3T2UJVJK58BA8@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DN55C99MPJSJ.3T2UJVJK58BA8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0334.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: a84b7f1c-7858-43da-0055-08df4bbf7c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|4143699003|261009223027099003|18002099003|22082099003|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: xDNoQnQE6d2UwYTORrlx6dyJNrp6/d4kIQJZd5nULf2+s0wf8DCVoOrD8OFAOa0vJVTxUmuPEG/RSTF5I6ifWppRp5aN10oT02CSibxvV4T50ymnt3bXkbkODf4UJoVZd3GnNIc3/zrUkdefgSWxH20b2InWnTePzadJTy/sSGCc50+l+b+9iwwO5PiZkLIM/E6O7mNWgFra4XEbiwGoncFEWHHFZV0ZXSNzzuIpnYzw/iwB1UJ8UsQIJMulSAqgG8FNiOVgofQHywMPoqBPsB/e9mxg3oKZjTYm0kAJTgKEvGl4lzTJP/ZpPJixU0X0F+P5fwYE/7gIZMHIdPzV8jDBObbkAzzzds2PSfEQiu8PIcD5U9TZEQiIvD1NZlO2zOmG+SMs9b7DvA4LG402wZc2vQpYfmEVQ1eIhpb1Bx4E7AzrHr2GrR8OxrIWrByZkTqEBedTjUSUwrVRdMH1m3VZW3AkkJDxfNeH5a0l6fTI4S6el+ZYGhckkDOtfud21Fy0oQvlfAwDffjfBsGPqGIBkIPMrWjPDTnySQbEeQTL4ZWzKQjjN+qHe4I+ak8wUnWsmEZCI0gc6KirnB3fXNyZagBBV2cxMEmqPw1OtFZ2ECfXafqkNUU44lk+HbcXGEFX4AMputbCUihXuMfLdNpwwsAG9cRwDSe/9Lltt4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEkweXVidDM0VXhUTzBsZHJXdm9qTDFkbFE3azF4RCtZLzB0b05pNExRam15?=
 =?utf-8?B?WDZCc3M3SXdqQ0I5WDVPRVJmdWZxNUNqaDlkb2tOUHN3ZUorcXFHcFExRFdn?=
 =?utf-8?B?d2lTTHExVlhiNG1LUlhjMG1CZkIwdTBjeUJYRm9XT0ljcTd3UnRDZ3FGYnNo?=
 =?utf-8?B?bVpXckptbHV5VEVZdzNONmRyVG1mZk1ZRUZsTllTaXY5YjBQdGlwL3VoV0E1?=
 =?utf-8?B?dzljNXcwQUcyRFpVVnczTTFTaVNHS1NsWUNab0k3Y0JzK1ZueEhQbWhQc2dM?=
 =?utf-8?B?WGpJQlJkS0tGT0duREJRYkxaeE5FS0FmTjd6RFVlb25NSlNaL0xuOGN2YXQw?=
 =?utf-8?B?OVhES3A1Q3ExRWRFM2dPZ1RxdTg1TWh5WWdYbnRlenE4c3BHQlM5aG1SbzZF?=
 =?utf-8?B?REhIaEZyeDh4M0loNjkvQ3ROTnBmYnZESDRzc1ZDTHI2K0dmMHd3TWNNc1Vk?=
 =?utf-8?B?QkJ5dWl3S3phMW1GNitiUFRQQmYrWGhtZXJQcXdlcEFDMFlnNmhTaWZYWVJC?=
 =?utf-8?B?ZG9ReTF5SjRTSkl2OEV0RzE0cTdmZGxBbUg2enI3TmVxVEJXbGJxZi9UNXdW?=
 =?utf-8?B?ci8wY2Jyd3BNa3AwcjYyQXFmd1lCbEJFRTN1cksxSWNRd2VabGQ3eHByelBC?=
 =?utf-8?B?aXpHVTdKWFhvVzJYRTVubVcyblRpaVRLQ3lLZm1VWHJ2SlplTFpKYkd2aS9o?=
 =?utf-8?B?Vm9sMXNLeHVUSTdYS1FULzJOVUFDOUJIbTBlZmorR0dpQVgvaEpFbkNMM3Q4?=
 =?utf-8?B?Q0ZlOWt6YmFwTUNCTlR3Tld4eG5rbHFXOWl5QjhweVdLOWFhWlZxVzVFd3lL?=
 =?utf-8?B?ek8yREIwSXd0U0ZJZTYrMDVxNm9GZU4zTFA4QWo0L3BpVUtzZjlqcklzRUhp?=
 =?utf-8?B?Z0ZxbjJmSzVaUXlhTlpKK3hZZUJDVlNhSXJJa1d1UlVXdCs1NEgxVG5wVHJV?=
 =?utf-8?B?WEZxK0FmQ3ArWmJRREdtMTN2NVRSb2xCRmgwM2d3dVc3dnRIMFlRRWZEeWNt?=
 =?utf-8?B?K3NjQnFLVklrdzI4U05vNU9aOSs4NnUzRU9YODJZd1Y0UGhkc2dGUjNQdmo0?=
 =?utf-8?B?NFR2K0VtTEgrZHRzUHZUQ2V2M2l2a00vNzZtRUMzK1JMUGxqNk1SaUExVlZW?=
 =?utf-8?B?dFlySFk0d1N1QmlKb2VDdmNGS0FHOFl5d3c0S1VNK05TdDdRTEpFc2QrMHFr?=
 =?utf-8?B?S1JZMU8rQ09vWmFXL2tqMWhpd2drWHNSUVIyblJ2NTVKeEhDT2R0RUwyRVp6?=
 =?utf-8?B?RkNLc095VERTYjlnQ0FUNnlHVXo0MzdHVklnNW1QOHRCOTBvRlRycDdiZW9X?=
 =?utf-8?B?RFpLRlRwVFdmMW5WWFZ3YUd4NDVmNzEzaklYc2xsaHlQYlhFWGR3Y2Q3SEJL?=
 =?utf-8?B?S0JDTTlJQzhLeHluNFRnNXAxZSs0ejd2L0s5MHRGd05vYjYyVE5aN3FKdG5O?=
 =?utf-8?B?enRyTG1jbzhQeTBiUnlHVktGN3NHQzBXVzdKVEs5QzU3MnhaN3BOUUU4blB3?=
 =?utf-8?B?NTVGdWJ2NXU4V2djeEcrTDNFMkVDSEc1Zno1NzROaU93TTlTa1dQdzNkdDNW?=
 =?utf-8?B?WDArOThhTUZERC9MNXNlQUl1TkdsVFJpZzRvVGxCamZnTk93T1c3Q3daNmZn?=
 =?utf-8?B?OTNRQUsrVlBUM1N3UWdLQWd4RFdSSTFQK3Uwd3NGOFo1a0VrOFV2UkdPOE5q?=
 =?utf-8?B?TTY2RzRKSGptdm5mejIvWllQSnpTYkRUUlBCOXBOZFJacjlydXpPSGQ3L05n?=
 =?utf-8?B?Qmg3dHRRUDREaXFrREdYMk55Tm1Oa1NEY0JMa0YzM004NCtlL3krOHY2RStx?=
 =?utf-8?B?c1lUbHdoNWRzTEF4bmJLcUoyUUowVUlIZHVvVkZDd2wvbUxhNVZLaDNMcko4?=
 =?utf-8?B?U3BMQ1VDQnFybEZVUmhBUWRkZGd0K1FXZ0pQcG1IL0dmSmRVVk5CZ3loaW13?=
 =?utf-8?B?M3RsSWdnUnpCZi9kUGU1Q0drVDZLZmhCUzJRdHZ0U3lKQUZjc29YS0FLQ2F5?=
 =?utf-8?B?cm03K3hsaEpYQmNOT1ZGOFNpWWdPQ2hEQUVjaFpZMDBtenE4T3NoUjJqajgr?=
 =?utf-8?B?TE9yakxqQ1NJNVJjMEhTc2JrV1JQZWRjN2FVZFFmOC85SlVTeERJWUs5cVp5?=
 =?utf-8?B?Zm9Sb0s0dUxRZTNsSGJaQ0Y2UVd1dVdaOEJ4YTBBWHVVZDF5akNZY1cvZ21t?=
 =?utf-8?B?NmJ3c3E4akhyMmI1UmVOdDYvQjdwejNHdHArcy9hOWZ1N01kcXE4OCtnUXJq?=
 =?utf-8?B?UUNSVzJlT2Zta0FuL2Q2a2pIV05FblZKMTQrQUxvMlMycnpQNFRTRHY4ZlZ4?=
 =?utf-8?B?WENnQ3dYU2QwSGhPdUxqbHdUTUVNYzM1V2FoVFh4aU1PYXo3M2hUdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a84b7f1c-7858-43da-0055-08df4bbf7c0f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:16:30.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aw7WYRmEPZZoh2my2uT+zMzhBBpyQqD0YUCXYHmaOUWhQXe6qou3pIN+GTrYwq3wbxpDvqL/gTI1N7Kct/gdEhavxbqv/hGGntgFAqwbKrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251298


On 2026-11-26 13:37, Mathieu Dubois-Briand wrote:
> Is there a public git where you can push this patch? It will be easier
> for us.

Hi Mathieu,

I don't have push access to oe-core-contrib, so I pushed it to github 
instead, with the CRLF line endings intact:

https://github.com/jaipaulcheernam/openembedded-core/commits/jaipaul/ovmf-edk2-stable202611

Regards,

Jaipaul

