Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48941D44C54
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 14:34:54 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37102.1768487689779351031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 06:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NL90TZ4r;
 spf=pass (domain: cherry.de, ip: 52.101.66.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5mzqCx+b+YFOyQ22ZM11X0dp+JK45+l/uTHi7pgWaDz8TjG9/gr/FcjLejwOM8t1nqTqhUmeVZxslBeYsrpD18BoCLBFipeseYZ7uUQgw4B44joxTUb1Gu332tmO1K83iAz9nglL1Q4GrsDim6DIGE2tkyrmLFwX+zvNCNxtJylbNMotfLDAdrbMM7CRLOjuEax10I6/jFwi/Zod4DFAfT5ZSqo2VPAruPEEMCt5XMgKeEWAkITUew7oNAMFl0ITLciHzkA8OXUdBZ0EzKEkYIAXaXDSKYhiWgvUHr9a+6F4AtoOY3Op7UcSxd081o4c0kQ/YMZaoIvFu6KTt99eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID9y58vTOgLTzU/mmfpu7pC+7H+mCV1JA+pY5pfeYtc=;
 b=IDx57WQVwESLzKRj+gStI3XwJgpexwNI8z8t7u0pD7qRRzaPgpkK+mydAKkVXyhfOL24F7rinKKiPC8iVFju5MaDvDtAyLsnGZe3mEU9iAMuoVtqcccBDtJjLzruxQxlSb9T15GV8TEjtw0PG2zVZ//QroH7vWGmqfnoAcMr9c+QmpSaibRPbj3JqVGZbYZixSWWfgNoTyOhQ7C1FeEDh4QMVAHH0BUHVdtTQU67qvqy1xWK6REwKdURbZqtJRG7rhDUOfGUumAHUSvioMpthLuZrRW4L/QuZKLVelEilq8jDtPc4f5o3X4P0Q6nX6qLHeJtO2nORPClJ7Qhvv5VAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID9y58vTOgLTzU/mmfpu7pC+7H+mCV1JA+pY5pfeYtc=;
 b=NL90TZ4rDfNRqIRZHUuQf3dhhIsBxB1N5jsMy9WFj2o/mGzfUAW9FiXCo8TRXfPixQZDtusbixY2d4kEKS5zuE8EphM6Kisux2xN1v3TiJ6VhROVT0U71fQ6f3OhKwvoK90UYMPfet0G6JF4+7qVAKISIDoAGFuROcuFrjrYjw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS5PR04MB9876.eurprd04.prod.outlook.com (2603:10a6:20b:678::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 14:34:46 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 14:34:46 +0000
Message-ID: <40be2172-261f-4a64-891a-e3cf0ae1f751@cherry.de>
Date: Thu, 15 Jan 2026 15:34:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] mesa: upgrade 25.3.1 -> 25.3.3
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20260115032458.2775110-1-dmitry.baryshkov@oss.qualcomm.com>
 <20260115032458.2775110-2-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260115032458.2775110-2-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0123.eurprd09.prod.outlook.com
 (2603:10a6:803:78::46) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS5PR04MB9876:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b46a541-8415-4d5a-6033-08de54433ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWlESnRIQlczdFJSdTQwc2g5MWhDdW5mTGcrVlYxYUJsS2pWQThtcWtlZ0ZR?=
 =?utf-8?B?eVNyWFpKSjhaNUdxdWpKSDI1ZzBRcCtPRnBvcWFyNlFIQUxFblB2eDU4cW1H?=
 =?utf-8?B?emdPMldTcWVaL3lDVVYxQzU5UTk2YkNHMDQ0STlEUFI4SzdHRnVUN0tEcGNo?=
 =?utf-8?B?U3RQUlc0cjJaQjJHSkJFSzVhZXdwWU02RXZwc0NaSVk5VzQ1RHRmOUJ0d05w?=
 =?utf-8?B?MEdBT0xCK3kxeWZEN1h5KzZNWTFqekhJZWM5dE91QXA1aWNOK1hKczNSaWxM?=
 =?utf-8?B?L2E1WHc5aG1uK2NxUUdTRHFqNkFvWEdHeWNWOFpUUkF1OUI5cFlvd3VtYURr?=
 =?utf-8?B?cGhDZXBXelZZMUNBMHlzY1pmLzhWWlRwMGlFL1FteFQ5QjNaODhVYTRub3Jr?=
 =?utf-8?B?WkwrN3o1QUlqTHhvRUZkMnNsVXlxSW9QaitMMEdrcTduRnNhNkJBYisyVTVR?=
 =?utf-8?B?bXNwT3NJdEJpU1E0MG1BWXRQbHpRSkdSNitCSUppWTYyRjMrV2lRRWdiY3p5?=
 =?utf-8?B?UFVtTGQvUnZjWnRNR05LbWw4UTZkcDdxWHFWSDZGYlNpTlFFRVdHc1Rmaytr?=
 =?utf-8?B?TE5acGJIMlpnSDdPVUV2cmV2T2NITzJRajM0WW5Dd3VNN094Q2dGMkZZTEtN?=
 =?utf-8?B?Vjlwb1pIR1FKblZiUldZNUIzbWd2THp0NEw0bDBWbTlaR1ZyWEVHWm00Kzhx?=
 =?utf-8?B?elF2d2x1Qy9NYUUvd012L1plYjlJRjlhSHV4UlltckhGYWdxL1NZY1hicTNn?=
 =?utf-8?B?UG8yTE83WnpYZ3RLUlEwUXBOdTRLemtOeTdxVGlTQ3hoUURyOWZWcTVzWFRN?=
 =?utf-8?B?RHREZVN1QnhtTjFkb0pWTnVlWkdZMjNEc3RhMGJHN0IvcW1GOEdIeGJxVTl0?=
 =?utf-8?B?RzFXWjU3R3JBcFdTQ2hBSkx6dE5scmVacnVSZ3l0M2VBM1dNV2c1QmFDRTdB?=
 =?utf-8?B?ek1jSjdFc0t0dWZVMVdSVERJbmM4NGlBVnZrZFBDQnJSQ25rSS9GRzczM01x?=
 =?utf-8?B?RGRXTmRXbXhUZlRjNzcrNTJnNUpnb2Y2ZTArOUtrZVorMDcyUzdJYUFsTzJK?=
 =?utf-8?B?aEZNckltSDFCR3FKeWlMamVRaEhhVVBpYzNBQitibWNLWlR4TTI4ODh6Z09V?=
 =?utf-8?B?RjhXVkFjdmN4MzdXdFZuL3F2YlMvTlNLUnl1dGNCMTY3YTZZNkp0RjJTeWdD?=
 =?utf-8?B?bFhONmZtVCtUWm5paVF2UTV1UVFGL2c4OTY1bEwyZDV1Y1VmTmtvb2E2U293?=
 =?utf-8?B?dFBySzZ6S0hiZmFpWU1rTGtkTDh0M0dqQ244YTZBcUlzOUlxdUIyVTBtT3p0?=
 =?utf-8?B?ZVpSNXlZMUpaTmEzT2Z6NHYwZG9XY01UdzFyUWhCSE9Gd25EWjJDTlVNcTRa?=
 =?utf-8?B?eGgwdk90d21sa1U5RWhTdzN2QVg4ZHY3T1piTjdYbVBBMUVIVlV3QkZETGZ2?=
 =?utf-8?B?eHF0bjVzaWlaallUc2tUT3YvdEZMeXY4QnE4Q3pvWWhTUGU2V3FmQzV4NEFE?=
 =?utf-8?B?S2lGSWxPc1FXWDNybDRoSkFrYmFNbGFPbjRobkZOY3lHajV5cnd5SlZMQi9p?=
 =?utf-8?B?N3p1cjc0Y2ZHMG13WUxnbW1OeFdteVJKWFdHOTl2NklkeER0L2pkdExLaTR0?=
 =?utf-8?B?ZHZxK1Q1MElJb1pwbW56Z0VhbFJvK1FtZC80UkhrRXFJTStsMjlQRWxwNmJP?=
 =?utf-8?B?cGNjUnhqVGZXT1NuK1o0SG1xVG9wdVowVmYyZlFtelJLVEdEcUtMT1pKY1NN?=
 =?utf-8?B?OG95ak1JQjBzemJQYTJ4SGV5Mjl6OGZFZnFMQmg1QmxkNFp2Mng5ZkpGenVJ?=
 =?utf-8?B?Kzh3ODM3KzlRRjlSbHlZbEFObm9vQ0RjL0taUlR6d2FHMTJLRUJ2bGtUZ25r?=
 =?utf-8?B?QVpVNjVIbHVLN2pTUEZWRFJLMVF3dGJpdEJGYVF6NEFXRXNSMVV1a2tka2hz?=
 =?utf-8?B?UG10Z00wTmlaeXdmQnowNWQ1TjVhRHQ4Z3NvbWhqajFoWHdqYnlob0FmbzBS?=
 =?utf-8?B?RFJYNzQzTXlpa1ZGclVDLzh0U0pvcUFDSnlnNkdDSUV5RHM0VEJyTGhkVnlP?=
 =?utf-8?B?ZHJYb1hRVXNzbzVoVWFSeTY2QVhNbnAxSkFzUXZmV2wwaEQzZFRlTEN0NXho?=
 =?utf-8?Q?PYqk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mkk4aS94bm9TZUxhdExQNlFxeTI5Smk0MkY1NHd5cSsvSmM3OWREc2ZSRG0y?=
 =?utf-8?B?SENpN2xNanNIK1BTWjdhQ0g3TGVaUFFVdFpMVnNCQmNQMXZKcURHUXdzYlg0?=
 =?utf-8?B?UjNzaC94WTh3L043YTNCSkJJZW1JeldOdm90cFdzbVNKcmlVT1BiV2VxejR6?=
 =?utf-8?B?K3Y0Y1FUNnVZY1lIRnZKTTdlN2ZSTjNsbmliQ05RU1huS1FPNXN3YWl0N2o1?=
 =?utf-8?B?di91VjFCVHBGekhkaUNhNEJBZjNHRi9seGRDSTdSUFVsYjhERE8rL0pFMGlH?=
 =?utf-8?B?VVE2czdUU2FVSkVoVVBSUEJMTi8rT2sxU1RnOSt0L2xSYTFJN1pndE9SYktW?=
 =?utf-8?B?NldkZVRCK250K0RVdDRDTUdJTW84Vk02WG1RSkRLcVZMdjhvMDdYdCtmZ1Fv?=
 =?utf-8?B?QXdGT2ovVW1BeHUrUWZYT1NmK1BReThlYWVmYWpXS0R2OS9UaXBGQjRyTkpk?=
 =?utf-8?B?QkxQSmpyUGpNcUFDK25zQ3lrTkpBOU5ZNmQ3VzJOeE1ta1VwQWpoZ3praTUy?=
 =?utf-8?B?cm1seFBYZkpvMFhjYnFnNllTMFZmVjFNRWhCMGVTaE5rVHdndHNNVHdkaE9M?=
 =?utf-8?B?VG8rcjNpeDlndUNaS2hIYWhWVHZMNFAxZVA5T0RjWHJiNDl5M1BTME1WQ054?=
 =?utf-8?B?UUNvd2lOTXBNL3kxZW45byt3alBaWXJHWVM3aXJmbDc2bktuL1RjSE05TXZa?=
 =?utf-8?B?MXl0VzF4TUR0UHRScTBKNHYrd1B1dktrUVZrbXhlLzdIMmNPTzRhaEtYNVFl?=
 =?utf-8?B?Wmg3NzNoUGEvRjJsS3VQSkdBS09ZSFVxVC9hTkxSdVdvb3FyaU9zZ01iS1V5?=
 =?utf-8?B?Q0Y0c0dZSHZ1WUdsRHQ0eTBuZ2lQSXdqbWJtZzYrRGZUSjFEL1hSMGYwNUx5?=
 =?utf-8?B?S2ZJZnpmRE9uL0NSaFdvdkNocStHU2ZRQ1NKVlVoSlFzS0VLZzF1R0NHTS9V?=
 =?utf-8?B?TERHMTRTTUlZTjRUY3VwMXp0dGpncFIzMXlVczBlc1g1cUU2MnlSVXVQVUFD?=
 =?utf-8?B?QjZEM1RWQ3lCWDhpNkpBZlpheFF3eXpBN3ZDSjlKa00rNmt4THc4MDdTNkJu?=
 =?utf-8?B?bVYvVFV4VnVpalA4UENVRnd6NDlGZC9mejJnTmI1K0hkMmZQMko4YjJzYjJW?=
 =?utf-8?B?cVZLR2VQWWRWRXZwTnBQUjhwWjl2TzJ2bHFXVlp5bEFFZzNBUHpiV3p2amxu?=
 =?utf-8?B?SytLVE5EZFV3UElCZGJpZzUvQ2FGamlGNnM4UHAzWWZmUVlsaC9EUjFjTDN6?=
 =?utf-8?B?Qm9ueFJTYlhjWXg5UlV5SmlhSGp3eDBaUEFrUUk2MHI0ejFlOUJKclNSVGxP?=
 =?utf-8?B?YVQxWEdJL3JTLzZkM3ZJQ1Q3MWdFK3RBY3owc2NPMGM0QUxoRjhaYmdaeExJ?=
 =?utf-8?B?bEY5ZitDSCt1c3NkV2JucFFQK1cra0VXM2VBVVhTY2djbGVWNzdKVFZrK0dQ?=
 =?utf-8?B?YUxSM1lBbjJueS9LRGxqRnpDRFpSczRkbDZUb1hFeDkrV2hjaWhUeFVZM1Ur?=
 =?utf-8?B?Q2RqWEp4VW1RbFhFZlEzWDJnSXBYTkcxcy9FelU0NGhGakNPUHU2NkxDVTRQ?=
 =?utf-8?B?a0NKeFNaSitBdTBuayt2NkxScm8xZEhnb0pBa1NLdmJpdmZucHFSSjFxYnV0?=
 =?utf-8?B?WU02T3VtcktoSnkvZ1lyOVNmL2xGSC84OG8vMEhFM2VWOWhwV1k5d2w0UEI2?=
 =?utf-8?B?T1pXU1lPYkF2eU9QaTZkL0VLTWpVak13YjBoaVZIVE1YY2xOR0xJWUp3MWl4?=
 =?utf-8?B?NlBIYnpSUGpQTDZnVlNpYi9DWVJJRE8wOEtkWlZud0s1OWNXNlp6ZURSOXhn?=
 =?utf-8?B?enQxckpmbG5GWWpOekdGeCsvZzE3VGdQRkdVaGJUdFF2MEtLcHJhUCtnZ3JU?=
 =?utf-8?B?K0RDWjdKa2hWdjJFL3ZJRUg4cFFGTEZJNVdZcXNYVUFxdDY0dU1sYjFpa2hT?=
 =?utf-8?B?aXd4aU82eWZPaWhNMjB3TXBpV0NVRENEcUpSMmNhRlhIUlo3NlFNMDVUV2Jy?=
 =?utf-8?B?WXpja1NJOVNpd012dy9ORkhDWUp3VGViamtrQ2hRakt4ekdpLy9jNmxqZkJ0?=
 =?utf-8?B?WUhPQ3BVb3pUdHRIUFJxTG9aQ1NTZEZSZlgxVGttT0VsL2h0c0lDSjVuaVRl?=
 =?utf-8?B?NmFMcUxEN1pJMThrUGRSbDhCOS9HVzRPTGFNVDNsMmZTcUEyNkpCM2UvbUdE?=
 =?utf-8?B?OTNVL1ZFbGtLS0tyUURDNFpBZ0hNNEt4SE9sR0s2cGg0ZW5HTTNLR3pCVFl0?=
 =?utf-8?B?bCtuSkVpY2FBakNFNklUaHZpemgveXZJVm5CdzRjTElVOHpQVmNoSFl2RUFx?=
 =?utf-8?B?akY5MmNpbG9CNmp2M1JHUWVtOGZWR0FuZWJ3RTZyaFFUMExmR3Z4dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b46a541-8415-4d5a-6033-08de54433ad3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:34:46.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQ2Q3d02tv7/MNIw7Labqbd43LxutjCAl7xHQEmVOFnB/Zh59JhOwoJlb22FlgW3oJqEQO+0ZwFhjGSDgx0bDSaku6IZZd5pSsMRWPcMp9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9876
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 14:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229415

Hi Dmitry,

On 1/15/26 4:24 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Upgrade Mesa to the latest stable release, picking up several fixes
> (mostly anv, radv and pan/panvk/panfrost drivers).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

