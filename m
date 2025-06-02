Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB7DC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 12:31:16 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.13])
 by mx.groups.io with SMTP id smtpd.web10.48472.1748867472660636178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 05:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lsF/28hI;
 spf=pass (domain: cherry.de, ip: 52.101.70.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzS6VprgjXAktcmH0/HBEHa4iH7aHSKVS88jlQgzcTSqqG84APSPCRHa3cXkXvMso7yfR6FYNM9OCxMM9qyO4A84/NiDGVAm/Djp3Gxn1eAk+EH3jVaoUgGC/mwKa0SUDxdx+UiOLgtvTbRZ8JonanZSzCKMHvxB/1X3ANop4Vm4uaEYmxPzro6oafcmqoAJkLFW1C7srd7a6DHyzGUJREfWzeiotg/YRqQY3N5Zgk07f/NVxkx5qi23NO+CObBh31XCsctyB5HUeChxpALTX0eOIyo5/Le8At0k7h57tpfotf/OlBzAXzBB9iDglRQ/v6e7nV8973+KgmdEqqcoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ePrxNS9dyCHpyijMb/n4LYlpQN6d/4XIgKPd2UyNO4=;
 b=m/1qQ9KVBwoYiyacSvzrw+0Ike0jDVLSwr3YN2vNfoMRgy5LaNAm7D5nmEBATs/DD6KBEPauehBOXx6DXwwWjYw3TRwbXPUe46xDaNrr2TbV/3AQHg6Ml7l/h043LUA8R4WU/BnV8djypnKwKpzfp9ZkwyGRtzdiDW0sLFM4QYaLNMAmEYLt+AptbpamdK6eZ+glqcxam8B4iAmtFEKuk5K1RseR3dHfof59HAEG9O0gST4Z5JxM9teZY9sE5lQb42gtTfcGmMu5PAMdDyMlwEk0b3VqtaG0TDEKgt5IjtngRDg9M98vDdUyfwwgN3W1sLY2fhMCPkz6P4QmitJcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ePrxNS9dyCHpyijMb/n4LYlpQN6d/4XIgKPd2UyNO4=;
 b=lsF/28hIO6c4SkyExU3xfu6WDXnD5nY34oFu3IbZMpI7p3nWWpwWErrbFr7/bQJJIAJTtiuFgJxJrj0zjl/5ofcfHAOpyqQ7XXO8EmabTOZdbjjawH2ihPZ+DAjYiEkVFor7MzZlVYLQMJ/ODm8h4e/ojs5VafbXWahB/j7gDyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 12:31:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 12:31:07 +0000
Message-ID: <81caff35-c17a-40df-a029-f56b2f1c6d4b@cherry.de>
Date: Mon, 2 Jun 2025 14:31:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] Rectified license file paths for final
 images
To: samanfatimarehman@gmail.com, openembedded-core@lists.openembedded.org
References: <20250602102917.2424749-1-samanfatimarehman@gmail.com>
 <20250602102917.2424749-2-samanfatimarehman@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250602102917.2424749-2-samanfatimarehman@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0060.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::37) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a445ec3-b5b5-4625-d84e-08dda1d15906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R1FMQ3VaV0xFd3BpT2hVbHVoNHJFRXdDTjhoc1FEVkU5RmVxbVM3akFWTWRt?=
 =?utf-8?B?aWJXUVBucXB1WHVWclF0MzRMR25IN080Tk9wUVZtOE9wL0tHV1UxWDhUN0k5?=
 =?utf-8?B?d0FmNkxhSEZmNlg3RW9hYlM5WjZVWWFVZXA3NUpyMFFZK0JwTk9oRFFlamxL?=
 =?utf-8?B?M3JyK0FvSTEwdkJEVFNPS1Y1Uk9HV2NWWm5pK1BvR1JlN1pVeEt2NUlpbXhn?=
 =?utf-8?B?eEFrb0ZZWVV2N2grOWQ4V3BONEF5MWdKME1zSnBPNmxiejlOTkFDbXFwbGRS?=
 =?utf-8?B?RlRZUk1vVWZNdnhpM1R4MlhJemNlSi8xaXpmSkw3WVhPZ0Y3SW45YnNiQzhy?=
 =?utf-8?B?dGVNbmNEYkt0cmRPSGNCcEFOc1NULzY1Qys1OFZOV25pRFYvREsxUkVEODRB?=
 =?utf-8?B?YmpJQmtTRUhNSlFJZWdpSVVOQTAwa1ZZMUdSdXR6dWlqQ1Q0V0l2b2ZkTGx6?=
 =?utf-8?B?WGozUWZVSTVqWGtXUElUdkFOVW9oaXlic2QrUExzVXFtdzFkUCtac2MyZjNp?=
 =?utf-8?B?ckoyN3ovREg3Y3NqajBGT1hnVllxNXhOUmNBcVFTNlFyL0pKWllETHBHdmt2?=
 =?utf-8?B?Y2JkVDR0TkhSVkhYWVN1alNWYUZuMGtZTHdWL2x0UW1uRjVWQTl3MDJFT095?=
 =?utf-8?B?V0ljSldMMTRtK0x0WUEwNDBFc1dSMDhTa3h1bTFsTGxCN3F3Tmd2VGtvYW5L?=
 =?utf-8?B?eEYvditmOU1SaXJ1ZTcvMXJ0RmhWalB6VUlwaDNsUHJJT05ZSEM1TFMvZjAv?=
 =?utf-8?B?V2xLVkd5cENBRXRSbzZCMjg3WEtMamU4cEV6ZHMzdWNOY2VLbGZqRW5kMzBm?=
 =?utf-8?B?NGY5dTFPRWZ0SzRUcWJ6V3VMNEVGSDh3aUdETkFOQXdZT2oxc2hpempyUDB5?=
 =?utf-8?B?T01wSVkwVmQvQWFtM2dQU1ZWM3BzKytjYWk4VVN6UjY5Nm5KcVlsdy82SzBL?=
 =?utf-8?B?ZTBDZTRIU0hXbjVlaW5wdE9yMWV2RXRKbUJUTXNuYnVuQnl5ZmdVR3paWWwx?=
 =?utf-8?B?L3BxM0FjUTRIazdVZXBkV1NhY3VtR3VjN0lUZXNpMGN2M0ZOV0lXRG9mbUVN?=
 =?utf-8?B?dWxSS1NzRHRkbmFOWk5BSHFRa0MxWG5FbHFQMExYMmQ5VkNJQ3ZTeUVBNWxJ?=
 =?utf-8?B?MGMxenl5UE91MldaaG9oS1FpWVRWLytncjE3dGJKRUJJUjVjMEhwM0lSbnJt?=
 =?utf-8?B?d2RMeUFYYmN6MUhHZWJVU2QwbkdJU2w1YzRQL0FUWFNNWHZBVjM0UHdEcm1q?=
 =?utf-8?B?Yytpc1Jxa2lTTWFWN0JpZFNBR3pwSWJqSm1QWllEQnNjYXc4TDZMa212Qytq?=
 =?utf-8?B?QUNuejkwREVoUnZ6MzNUVlpqMkY3LzBhTTVaZ3V5ZU05Uzk5aDNvVGZweWdH?=
 =?utf-8?B?YTlRSWJ0MkNoS3FEMEJRK3RHMnJKbkpHeHByS1JTMTZzeTY4TUNrS1pHUjNL?=
 =?utf-8?B?SEQxb3BtOGptd3RtTDBQSkQ3eXlsRTl5T1laVE9Ia0NLMnpsMFVrYWRPTlpH?=
 =?utf-8?B?RVpHU2dwN3I3S2gxUEJIak94OVpQWHg4NHAyMWUvMVMvK1NMYmFVVmlqMEpz?=
 =?utf-8?B?ajhGUFV3eGhmbkNJbndHRGpVZkhmRUtab2dlUEI4NmZ0dFk3dlZOK3dZV2c5?=
 =?utf-8?B?SUwxWUhwWHNZY3NyNWhUclpuRkZ5QzVxMlExVGJwaCtmOXhWczBRWFl6dnVo?=
 =?utf-8?B?a3BTZlhtbHVIejBPdmJPbHVDZEhFRU9Rd2VxVHBsSm9kWGVtZzJQa2FoK2Uz?=
 =?utf-8?B?a1ROYUtuSDZTRjlMMFJDdkQyYiszMlBBZlFJOU1LZktEL3BpNnZZcFcrM0Vi?=
 =?utf-8?B?NmRkcEcxZnY2NEpNRWs0aitka200MExRTW8yUGp5bGlPV0JPS252QTltTzVX?=
 =?utf-8?B?Vlp5TXZXS1d5ZDdSd1NOdnpoSU9zckdtaXFRK0s4T3dEQWdDcWZPcHExZ0dP?=
 =?utf-8?Q?GfRFAMYgCLw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wk54dG5TaVIvdGJvNitaMUhIeHQ1bTJVU21PZFl3a3hETC9qaUlDb040RXpS?=
 =?utf-8?B?Nk81aHNhV0RLZjFwZkd0Z3FXWmdTUXkvTTBlTk9yWElhQmUvMCtjV1BDamd5?=
 =?utf-8?B?ZldwdUo1MHdUSkp0WUhlazE1MTNBdVBmQ3Q0R3hIazVjRWF4YTRBTGZRVkc1?=
 =?utf-8?B?QWY4a2Z5c3JDSmpyTktlck56d3lwdkt0SUhOOWh6ZHBxeit4bU5JOER2YjhK?=
 =?utf-8?B?ZUw4aXdmcUJUL3hLQ1VxM21lSlZRRVc2T2Nhek9hYXppZVhUY1BJbkpuOTV6?=
 =?utf-8?B?VlM5NExBNFdwcnVOUzdUd2szcEdQK2tXVVpTU1VuVld6Z2Z2ZzBEY241R244?=
 =?utf-8?B?NWhyTVFFTDN0OXpBOEFSWkVnOStFc0lOUHAzVm96aVBxSXpUd1NPYkY4Y2Ur?=
 =?utf-8?B?cDMrMDJjK1NIVFFOUnVmemxrclhJbXZTZ3gvSmg4SHFaWW1PU0JaQlIxK3VE?=
 =?utf-8?B?TnJPNjBaaUJwZEEyTDA4RmZFVTVtZ3dnYjJiamYxV1kwUmk3VzFCUFZqY0xw?=
 =?utf-8?B?bmVyeFRyMkdYRVpaSmI1aW9sU2xtNm9rZW1OQUxDZVhzaEJUeW45bEpYZHpy?=
 =?utf-8?B?OWpIakhoenFvQWNPZW1MMGZxOW9OQ2pOZlBubXJtZVc5Wm9kNncyWm5VeDhn?=
 =?utf-8?B?QnBHOFJMYWlKTzRlbURGVTdoTGRYN1VqUFVGSDBmYzFjdXBzdEF3Tm1DU0Mx?=
 =?utf-8?B?ZUEvUHNwcVVDaG5iQS96U05UYnhZcFhrMXllOU5lRmZGSVg1T3c1Z1B1aUFp?=
 =?utf-8?B?Y3NycCtwQkRFb2hDVDZROWd0WW1mS2tTMTUwakFrM09VcFhrYVlMZElwaURD?=
 =?utf-8?B?bGdSc3diczBuaHpMZVRRTzdKZkd5K3BvK0pWVDlvbzBGOWpWUHFPclI2REM5?=
 =?utf-8?B?TkpoangvRzBublVmUkhkMGIwbU1GUWUxSW9naUZNY2NYbUJ1VE53ZkZZcmw4?=
 =?utf-8?B?NVJRWUZxWGx3ZzNZdzdyWDlCdzd4WFFPaEQvK3Q0WTVmZGRYMkpScld5bkVI?=
 =?utf-8?B?RmtFWTlNbWNvR3ZGRzllNFhzS2diTW1uOEtMNWFoaUU1OUZETktzVDhBSHZt?=
 =?utf-8?B?aHRjb0FpS1ZqTjNqOHIwTHpWQTJ3TWtwY05mTlpTTVFHTENScS96SkZpTEMr?=
 =?utf-8?B?Ujhqc3JWSnI5RFBqY2pMQnZNdmFNa3lJTHJKdGlYTHk2ME5RWGZhaGdFZW9R?=
 =?utf-8?B?SSsrdnhOdEVWdGx3OWFUTEExZWVrMXdWZjg3Y01vTGhNL0srT1pVWlBldVJY?=
 =?utf-8?B?MllLOE0xRlJ4ZzgzTGZRaTVxOUNRNGtkYUY1TlgveTVGN1NtTC9mNDN1MC96?=
 =?utf-8?B?bmlOQ1BRZTVjVDh5bXRNalUwYldvclFNTUdyejY1TFlqbnBiazZjeXlrUFB2?=
 =?utf-8?B?eU1ScUJUTU5JMWhiSlF4anA0Smh0aFpTM2MxVXFESzZ1V2M5UUN2alRtdVA3?=
 =?utf-8?B?UmVnTlNjampYNjlTUGVOM3Voa2RSNjUvRFFzUHdHSUQxOHdnczhPYzV3cllp?=
 =?utf-8?B?QU5IZWpaT0E1WUF6c3RVM2dPdDU3TDR3a2kvbG1Nd2dsZGJ0SFQ4U2kwMnFZ?=
 =?utf-8?B?WG1SY0Ezdkp0WWxQM1dONnpKc00zMy9HZGt1TWxHNDFFcnVnOVgrMngzWTRr?=
 =?utf-8?B?UlpXZUNPN2dwNVZQSmVhcEY1WGJTVUc2Qit0T3BVV1FBT21UWjBRWkhsOXVD?=
 =?utf-8?B?c2I2MmhFNUFQbVpxLzNzYm1wV2tSTk5xbUlER1lBS3E5SWhRaXR1NW9GSVB2?=
 =?utf-8?B?Y2pUZ2hFZXB0NGNjZmRTeXJLNVVMY01zTGdqbkpjMnNXUEVlWDVRK3NpcVRx?=
 =?utf-8?B?bmdIRHRyQlBhc1ZhMVpPK2QxdHVkUTdESnc0TkdxdXJ0cXI3bklFQ0cxQkln?=
 =?utf-8?B?QTlWWVF2S0NHQitkQ2Z3WGE5eWc4ZFBDd1IvUGZGYkxHS3JSRVVVckVNRWRt?=
 =?utf-8?B?bVNsbE5mVEZQWHZQV3JaMVM0QU9BdGNmRlRTeUE1bGNvZFQwaDJiRU5DVnBJ?=
 =?utf-8?B?Vk1lNXpTZlN3Z01EVmZwNkFnMjJNQTA4Zi9MR2tCNytOdG0xanVHWmExcXhV?=
 =?utf-8?B?WFBBYXZDd3VrVDlheVMxYlhwRWcxVm1Ecm5CNU0vbnRRdkl4TXZkdjBBZGRL?=
 =?utf-8?B?S3ZZRlpTSERUSGhtYVlRL1B6SlJ3N1k2NjlZeTRFNTdDYlJwT2Y3WkRnNURK?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a445ec3-b5b5-4625-d84e-08dda1d15906
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 12:31:07.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VV9/Q28i6V/0tzxxSxdHY78YcSvYip1Uf1wmJg9+pjhmPo8c3eE9TnYA05OvqZkKEtNqBM4TGM9sXTn4rb7mYtbs7lZIncFJ6Vacw+r/fgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 12:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217716

Hi Khalil,

On 6/2/25 12:29 PM, Khalil via lists.openembedded.org wrote:
> [You don't often get email from samanfatimarehman=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 

Please provide some context here in the commit log. What are you fixing? 
How can one reproduce the bug themselves? etc...

Also, we probably need some oe-selftest to make sure this bug doesn't 
appear again?

Cheers,
Quentin

