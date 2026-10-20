Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10523.1792510399560628347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=V3nYikra;
 spf=pass (domain: est.tech, ip: 52.101.84.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ss2fsnsqn0PF1YjTJCauEatzDZALsI+mF+h6zuQZlamUKyyySTq65Hi2ZR9RpYfpWtomJOImJYS5jLxvllL50QYdbPP89zCSJeKTVwr8MrDf8HyOzZxbH4F4N1/z1vcMYPh71r49DksB4DJ0prMddG0iwq+zipdO0gf+wmITi/qOo5bBPft27YssqeAo5YdIsP1FJgETadnri5V6qW9BrO/70+kiaP8Q8NV7kQoX5Ybe8+iX8GXKB/dRE6afE5dNCEEqEcLTyF8OqNm7NpaCKZsF2B9uCe6oHyA2i6AVVk7lRhl7BolL+/DQLd2DrPNyeUu/4L4EgwdxDiQ2VKpX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz8dI0woA0AmBE7A3nO1XVt6yLHSihLrml6ZTxBnq8E=;
 b=VTfmYWNxp65sqUNRf3YnTnD8r+Y8LG8DJILArL5EV73i81EHOcft4/p/cpmELrbWt3v9WVHJ70ywjV4coo5zlXiw8KXDESwl6CGKiBDK4N6omMwME4ZP83/k48Zil2VzoOHbxxcIol/Vas1EV4HFSlIGRRBYumEu/3Zhcv/pKhzrOWzcL61vs76MLb7pK6+JMvYeYQxsOtAQW7x3dUDYYwEE7BDuAk25cjq5vEyMddrk7PIYGUdsMlZwfUIGyhLv/aVMJbwJS9Q63kNWy6yVCgW18+fCg2rJEqCV8Ex5C53jvcFuF6ORqAKuXxQkK1S71hngh/HcgswVVDFIvxvXdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz8dI0woA0AmBE7A3nO1XVt6yLHSihLrml6ZTxBnq8E=;
 b=V3nYikraWdL7DvnpQLOlz+sNBUVKkccTFz2K156eHx6/aKLCioRj1Ul25xH6j8SCWZIj3+1zlke+Ru161qphDCjWHSQ7HfJBtAHBelx0xGtizWD6jfbsiZ2/+BuJuZBdWXPIVRqPq5Wtz2TH6nsvhxESOVPeVL3I/vmzo78jyiB/tfSUsS7jz0alnysWe7HRge42OvXl4zTnzIeex0XRTOf2vuygZYh5nJFPNRxLzOS51/iXtSG5Ptlh+d7hIs5LxaQMhZ9dXeoHzIDzjhd32MCP4jIKTQ9jsXJV6Hgn/96Jbk7qPOm4l3EFWeMuJ1KwI2nuozBJ070v0TVzfPqMfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3650.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:502::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 15:33:15 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 15:33:15 +0000
Message-ID: <5d063647-f13a-48cc-afff-a2ef9688e281@est.tech>
Date: Tue, 20 Oct 2026 17:33:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/7] elfutils: upgrade 0.196 -> 0.197
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
 <20261020092931.4330-2-jaipaul.cheernam@est.tech>
 <DM9Q75SEZA82.3LDAH4WKTQUCF@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DM9Q75SEZA82.3LDAH4WKTQUCF@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3650:EE_
X-MS-Office365-Filtering-Correlation-Id: ec874e49-bccb-4826-d9a3-08df2ebf756a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pGJOBocAuUxEMyI/OM3oibwPo35cc5327yXDgaMqK9awBlP7s8lZvMmJmLUFc9mOrIweJ802ii+gquzqt1R9V8FrzM1irWUW5GI6l3XkfoFweJLYXMt+pzF1860Ui159frnc0pidK6gAf2OYmlmAL84LhPTRb8Gdws3Z1BTHK0mIpCzGgSr2NOgAdTx1W0jDjib6SRVbnLK3hKCdWPLfE+t0UjKaq5lAs0QTchOzhBqR5SvzHbbHkGs/GPtf16sdfsv+5UAteoVn90CvGhbukKRi5zplWtE/UiSlq473OV1GkOq7hoEgi+ycjc0Mm8B5XJG8C5SCbKdFdVlYHeJENu9R8txhN7gAoOv0P8iiHLcfnLiIkwn2+iWQUmJtnFtWFw70lK9eQ5d6f4Pqm07c4WMwCOMKTGYcoGLr+FAej0VQxMnbIlJK1QHwmtEQxWSdKVQlf/SnxJAS0J2nqs159asy3nuSia1WlLAcMgSg1mPNyamHsFOtjm24GuLrPCwfqPTtkdTMNUTb4t1ve/JjUcpIMoT1hZBpZCI1TGSLJZTyYjY+H/bbU5dvWrXPeNt343fXbkMEBG9uBE3ky3DfPbOpEBQrGfmwWhraFOFm6Wk2JFpbSB2NZZIt+Z377XGttodt3X7xX0X2vZxoV76eKCC9JxxIVa18hNAGC83Q2Fw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nmc4YzJFTGtSUnUrKzd5eFQ0OTYwSkNjVEtoUnpMMTRiL0tyTW8wM0pHNlJ2?=
 =?utf-8?B?MXZ4ZUx3NGRIbUpNbDNvOStCUUZwcDlxL0ZBL2p3eXZoTkRWZzdTY0l4K2Vx?=
 =?utf-8?B?WUNrc2ErditheWVMcGMyVmxGaWJiakd1cHQ4U0VGdGJZKy9SYUZRWFJzblRx?=
 =?utf-8?B?am5rT2hhRG9DVktaZDVUcms3T3hPMC9CRW9XUUFOV1lrK1VPbDFscklVNnRk?=
 =?utf-8?B?enh3eno4aW5JeU9sLzI3SUhsREt2elJMQnI1b1lqRFpxc3NQdkRiSldZd210?=
 =?utf-8?B?UVVXQXA1Vk1td2hTMG42dGR4UmNGTGphV055NnVFaEF0dFlIaDRLTDJXczRD?=
 =?utf-8?B?b05IYWMyVDd3cXVnelFUN0RmYjZPOUdDbGNlUU1ITTM2d1Vvd0IrQ1NRWmh5?=
 =?utf-8?B?Z1BEVW9KcWgxVFFmYlpiRXdvS3Zldkw3UmxSUTNPM2h1SjRNU00xL2NaenpM?=
 =?utf-8?B?dWM5RGhFRHgxOVJSb1FWM2hGUnN6cUFaSkNqTHZrSTNKTURVZEE1bVZIN25u?=
 =?utf-8?B?WjIxd2xwaXdWTklWNzRrNEM1S0NTUGcvWlluM0dqN0tuZXc4QjBqOWl1bURk?=
 =?utf-8?B?UlEyeFN6cjJ0K2RTVGdqWkljeC9LaDFqMVZCQUN4aHpCdlVKcUU4cm9Eb3dC?=
 =?utf-8?B?RS9FNDN1WVMyei9keDBQaGNQS29RUEFhd1ZTOThROXl6blZ4K2FVRFlLNTN2?=
 =?utf-8?B?MnZ0QmFqaUxUN2hZTWlPRmRVYnhmdlJoVjY5YTlCVmxIYnFqaTBoL0ttS29W?=
 =?utf-8?B?V2gzcEp4L3BSb0xWcGIwbzJJUlVjWEdmNUtMS1BNSzBjSVNoMnlCRytTOUl4?=
 =?utf-8?B?MnpoL3cvT3ZGbG5USTVHK2x2K3g3K0tjWWc1TVlzOHl0eFVaZlVVRFlIQS83?=
 =?utf-8?B?VERBaFRkeGtSeHdhR2dQZDJLODJmNk55WjF6M0xpYWFBdEg5emFOZ0w2aUxD?=
 =?utf-8?B?WkRlWnkxY0lNTWlDaCtsYVc1SEs4cXNwaGhzbjZWZTB0QkpqamYxdmxnZXZP?=
 =?utf-8?B?eG9nMXVOdFJzU1BjOE9MR09ORkovc1NJR0s2T2piWkNqZDlKNUM4M3psdWU3?=
 =?utf-8?B?UEtGVzZnZVNyRU5TSCtlVmVsQXhIdUIwSittYzdXUk9RKzNURGRVWnNXQ05C?=
 =?utf-8?B?QnV1ZVBGSklmL1BVYVl4NC96WmJwMEhSZWhPU3h4Rm5QUTh4SXdValYwdW9I?=
 =?utf-8?B?UE15aDlTTGNKS1FMaUV3eDZydVo3RUlhWjBmaWN3b05VY1RrOGo4eVlYOVdS?=
 =?utf-8?B?RVA1MHliNkJaTkEyTE5hNlJocS96aE1nVFNqNUEzN0FhaHl2RllxMTE5emFh?=
 =?utf-8?B?VVdDaGZWVVZOMW43WVBhZEczQVovVnIyRU5IK3JQRS9jRFVFZ2l2eC9OcFF6?=
 =?utf-8?B?Y3NkL09PUnBvcVZWMUNTU3lFb05idU1ucVFmOHR3RXl4ZFVOd1Z5YlVWYkxx?=
 =?utf-8?B?aC8wakUvbEtWWmJDdnNYTXZTbUdUb1doVktJTTBBNTVYZzR4QzdnVXJGQ09x?=
 =?utf-8?B?MXlpeUpMbGRXNXgzKzdWQ0FPSzg5UUlvYlNjRW5MUEF2QmtvUmNlR1N5eEdp?=
 =?utf-8?B?VVh1YWk5R09OR3hzakdvdW1xNUZ6K09ONy9CbXRtWWJGVG0xdTFGSFJmUGdi?=
 =?utf-8?B?QzU0WWsyTXFodUhWcGV0THFIQldEQ09JOS9hZ2ZMbmVBVFQ4S1JUR0o4REpt?=
 =?utf-8?B?SVpGcXlzTUNFYmVYNm9wQ1VMNkdwK3JhNk5IdFFyLzVjZ0lzbkNNR0VRRyth?=
 =?utf-8?B?TUN2NDhuUWJ2WXdOcUhJNVhsRm95a2dRc0xDWlRxZU4vTW9uSktOUk5QV2hB?=
 =?utf-8?B?OWJ5N3Bsblk3SXE0SzdCS0IyOHMzR0hYUVVMV0NOdnRyVnFJNm5hcmpWckJn?=
 =?utf-8?B?RlVXUXFyVUo5Y2Z2eGlYbVVMY253Rlg2blB1bmw4eHd0dDlGS3hnVFdPaDJY?=
 =?utf-8?B?M0IxQXg1dU1kaEdqL29aRU5keHdKaWxoSFIxZ2EzYzVDWWxwR0RCT25zQjJ4?=
 =?utf-8?B?Z0VhQmo5UmVUQnkyTzNCNTA3Z2lSdDFPSzloRmRKK0tJdmRhNzNoU3pJRWR1?=
 =?utf-8?B?cWcvRjJ5VGFraEpRbDFRMjVLdmw0cHp0RmZmeDMza0VyYUg5dVNCVWpSd0Nn?=
 =?utf-8?B?cWlnMjkvRzB2RUxKYlFkVUlhQWxlZ3l5dkJPeUwrWHhnSjB3Vkora3lkc1Na?=
 =?utf-8?B?VFVRV0NEUkwveE5OeDhWakhKQmcvVlVZckJIMjI0NGY2dFVIYjhXZ3piTk11?=
 =?utf-8?B?d0xib2Rlcmpxc29WcmFEUFFGaE8wL1VFTVlvc2xaL0syN01VdW56bXRsckYy?=
 =?utf-8?B?MmxQSk81L05oMXljMW9SbEF0OHFmK2VBR250OTFjazNpSHlYUGRRUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ec874e49-bccb-4826-d9a3-08df2ebf756a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 15:33:15.4502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xqe0ANxTd7UCeJmsJgX4pUS0aEu/jkC3crOV3jybiy9hGqMijBm+RSqx/j7ZGPLZkDbLbENy6zXuH5/KuzRdq/7NQ/ErJ00p2SGQma0x8/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248303


On 2026-10-20 16:13, Mathieu Dubois-Briand wrote:
> The log in there is really verbose. I hope you can extract some useful
> data from these few thousand lines of ptest log.

Hi Mathieu,

Able to identify the problem and verified locally and sent v2.

Actually recipe is expecting two test cases to fail but those are 
passing now after upgrade and dropped that change.


Regards,

Jaipaul

