Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B99C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:36:45 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3591.1787931399112988045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 08:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lCN7st7L;
 spf=pass (domain: cherry.de, ip: 52.101.72.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzNFQwv2KQFz7B5+NcmOrqbFhVIkPxKbsvXYx43HNWo047z5YvAhj0iJu983Q2Vri+5bZXIBhe1Pl5sxpD1ddYmwY3EodCaMTGYRq9BZ6TVBhEOJanypEKONNRVxnkZBUAgD7D6NbaX2ZFkacKQonHFlvltoNztmF7IdUe1hZkn35cuNCVivnCD4s33hMT67QtRpLFuSejWdaKMtmCGZVKanDvywy5yHtNpP63GqV39iXzE+pcBXiv0AX2UtqiGTqgOWlCej06nv5rjYql7lGGgt7bvuOZ5a3N5hvRUeXEyM+U9BAaWJZz3BDniRgFW8ln6WFbaA+ptqrQXtQUY5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXvn66+20ZPrLuAiGId5dgcCT+SGTmbQ3TnlcXzxKQs=;
 b=HarRSHNYVGTx0kDHzrF9Oofv/h8neDL1Hk3ei5v+C2hWw1YKvUN1PHD3J4VpHLo4kxqBiXgw4kWncLpqcmBb3J1Ihve7Brsk9mBHuQDVNOsk041vOBjiIJV8AJrJt+qoFlcJHaDXOrTLKy7VC7oiWpPYfah3f7wKzwjWXkMtlEW2EScqpHJ1oZJ+m8OPZEDwR11xKDPEkCACSdRM3TJlZrf5x+ay+UN9gHwSRl/LgPlpRaN99PuUURRSmajfma+8MMAqmwythw0s1XDi1Ec57uQEDoRPHXlLZ0ZxY79SSnlwHB529ZYgf5UtJLxj/jxFbjXZNGMlLNFH4X8BhIewQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXvn66+20ZPrLuAiGId5dgcCT+SGTmbQ3TnlcXzxKQs=;
 b=lCN7st7LILYa9OLKdECKbJfodLYxQ/TPBwyzu38EazNxmgY4q45VENqL2Kpggv4ETS3bxAtyy+uZM7P1NvZ19WjBhWsybKlsCZxrYkCB+hFo2Q5T6VSlr8QzFjfw4VGbggOELOTJxbPzZcfs/F3Kit5Gu4ULpkc/i7CLe+icCIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DB8PR04MB7081.eurprd04.prod.outlook.com (2603:10a6:10:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 15:36:32 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:36:32 +0000
Message-ID: <442ffcd9-ac2b-4fd7-8768-58f60f7f37ff@cherry.de>
Date: Fri, 28 Aug 2026 17:36:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] u-boot: Update the HOMEPAGE entry
To: Fabio Estevam <festevam@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20260828153456.413321-1-festevam@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260828153456.413321-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::24) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DB8PR04MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: 6928412d-bba9-42d7-5805-08df051a22dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	mIANOmW8TRTwyaXZJWLNrkyhcd/AOKy//+NqhJ8jZbZW7cmQVOO/F+Ofq3rwHDhsWitJ6jyl9jHFWFDbx8S3P4ep9TQn46QYOqgyZNIQBqxfyxzPmDpV7OCTeQNzHnsXHPZmkGgQtqH9OjN/sOYNTlHHSy2ghDEnzHn87e1KdG5K8x5/ZyeokECy8HIHQbSH+kvrHvDRc6pVxVNbBtMhr70XB9Lr0xDRNv0Uhae+YpJFZzMSTRFiLjjezObTnoUt9vY9q4sjpKwMVbi0rrC7zPkgLobMPMzk1zO3lA5y4hPIWK2dUVqU7gYWLwly2XlMcpYzBruqaUvrWkIR1ZbjRSx/AX6L0POgUHZJUrFubjoG5evvSk/Y5bDVN6DeDyEzpWgAL17Z3v3t7/3vDHaT+oi7UsTuh5ukeCnr9nigbWjusx8b2Dirql2zh0r0TZ/NS8pIFbArjWuFGK9IbOLdjCl8lPS+9DGb/U4eqgJKXxvQ+4PziRpkyH94fwaP1lOU82cWFr1XL+XKAErYmC1M8P7BPbHURteEsG0UNdk3EeP2LpHHgEafUR71TaEtnajRFa6F+cGQnNL72h9WCu1ANNm763r+XnNWTa/8adeNlZ6s69Lrdit+XWQR/Pf1uTCyVH33UkcdqrXG+K6ZfAUPGyJlxxzseQfk86yHjMvPThk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGo2ODJvanorVEI0K1BUNHNRTHdRTmFRZ3V4aWRLTkQycUNBRmdZb25pTzkz?=
 =?utf-8?B?a2RiK0dKWjE1YnFEN1ZFQmFpUUt3cVQxQnRwQWNlTDBXVGp4U3FndVlXME42?=
 =?utf-8?B?Tml4TFpGTU13U2s3VUpTN21QRk1RWDBXVC9aS1F6aDVlck5tc3dQNkNhREdm?=
 =?utf-8?B?ZGdiRitQczZzL3NXU1JWaFI3TmhnTzhTSEJFWE9yeFhMeWxQNzlDMm12bHRz?=
 =?utf-8?B?bDlieG9GTUVnamdsZUpHWHNmM2lRblFnNzRVYVozRXhnUURpY21oeXNlb3Zw?=
 =?utf-8?B?ZUNDRG4wTWVVQ0hVYUpXNTNkM0xTV0hycXFJdCtickxLYXlVb0JDQ1UxM2Vw?=
 =?utf-8?B?RTVOUmFTWEN6RU5KN1gzeEpvRVJ2cGxxaTNpVGl1WFhoQ3l5emxzT1Z6VGY2?=
 =?utf-8?B?VG5JNXA5QzNrM0lxTWdEZjJ4NWNWb2hBcWtKYWFKWTdNNkIxeWZab1Z0Q3Z6?=
 =?utf-8?B?aDY0c1IzVEdXUm1DSU5XRzJUUHJ3Zzg4M2h2c0ZDUUduZ3NtaFVTZ0xiV0pX?=
 =?utf-8?B?Qm96RGE3ejFhbzluSUU5UUZOR2x2Y0FEYlhCRmNOTDJLRkJldXJzODBscVlw?=
 =?utf-8?B?TStraFNodWtWN1FvNFJieU1TTWFDSTlkTCtZbEtQNlBKaXVJdkNYUVovZ2VI?=
 =?utf-8?B?czZKSlBVRUJMbVVRckxJSFJwWjFGS2l6UWhNUmluWkN3a2RVTzVaR0ZOdjNO?=
 =?utf-8?B?dUptcDdUbE9LNG5rYmdIWldFS21md21TS3hUeW10N1oxZjFyQU01OTFtVkE4?=
 =?utf-8?B?MWd6YzQ2cGE0U1hPK1V3ZnpCNEllVVR5OXBJZXEwSUZ2QVI0NmR0dFZMbGpS?=
 =?utf-8?B?cmc4WlhGSlhXd0E5T2twQmhXSXROQnozejcyb3R2VGpDLzBud3VqS0xIRnVD?=
 =?utf-8?B?amRqU2tTVVdYNUNYaHR0NThxeG11Z1c2THU4S2VlWUg0WEYwSnZqYmJwa1Rw?=
 =?utf-8?B?UzZNR0U5bFFTaitLK2lIM2dZWCs0TS9KYjZXVzBrVUo4R3hrYzRZUTArM0hW?=
 =?utf-8?B?cDA0Uzl0OWZ6OEJCbzlibjBGVmJldURWNzM5cWtKTUt3Q1gxRGZsUjJVUzl6?=
 =?utf-8?B?YUxxUVcyeTJxL3hhQkR3WUtLd0kvTFZWb2VvY053T0MwczUrK2FPNGFtbjNR?=
 =?utf-8?B?Ui9memxPSmJSZ0tsOERnc2tvcU1RcUlWbUFZVy9lbkxRUEJrWGJ2aXJxTm91?=
 =?utf-8?B?N1d2VnJna0YvaW11WGd5QmxQKy81MWsrUTh0VDA3aGJyMW5KQjB1S2o4VGFK?=
 =?utf-8?B?OUhrMFZCUnBKdW9oL0N3c1NJajhzR0pYMWc1eSsxUGo3ZGxGODdFYjRQWmow?=
 =?utf-8?B?dC9sOXVza0NRZVdoM2dqdFlJU3FjZnlxUFlValpPUE1iR0xJOEp5Y1plNVI0?=
 =?utf-8?B?ZWExazhyMHBRV2ZCTGZhSUV0bFlaWUd2Q0JPYWlCRmlaSHBYTEtmZ3dXdzJi?=
 =?utf-8?B?OVNhZ2JHZDNLL05UUEQzMWhaWkFVd2lWOXlTazRUTFcvRUFRWVBMOXpIWFRt?=
 =?utf-8?B?T1d0bnFvdGVXR2p2YldtU2taVjBCK2FoOWZhWGw5RnFSTGV2QnBGUUVjbkVS?=
 =?utf-8?B?dGNldTRvUUNJYmVSRE9UZmJXN0FNZkg0aDNTZEduTkl0dTVZM25aZXNPdk55?=
 =?utf-8?B?UVlwM2NpQjdkOUFrYWVlVndaNjBIR3dIUjZjRitRNllyU2JtSExobjhVU2RD?=
 =?utf-8?B?NG0zM2hHdWtISXZPQzBXNlpQWXJjelBxQmEyRmUvZkx0NUU1UktQZnNpbU45?=
 =?utf-8?B?d0R2N21xWWFEUDhnRGdoM1J5YUV6OVExMFVMQ1dIL1NZSU12Qm1lN1RnL0dv?=
 =?utf-8?B?WHJIalRmY09SVDk4bE1UN0wvRmdsbk9Mc1RjWlFWK09wU1lxYlAxbWgwS3pN?=
 =?utf-8?B?cWRPZzdXbWZVeXlwb0phSEZIMGlpbmF2OHhJVkZvZjQyeUhkNE5GS0Q3NlRx?=
 =?utf-8?B?VWdZbDNYMnJhRVdMRDFDeEk5dVNER21ubDFFaDNNcnBaVi9ZOWQvVGdqOGJL?=
 =?utf-8?B?Sy95VjFnT1JOK2o1UHNUUGl3Y2NNZWJiQmM4a0hzdlNKM1h5d25KZjQrMFJ3?=
 =?utf-8?B?b1BtTm0wMWxneExxWklIVk1rSENTTElsRmE3cVMzV082d0xiT3RUNHI3K1JZ?=
 =?utf-8?B?a0NWQWVHSnVlamhkTlcvRWVITlFlUG9EMks1WXVCTDQ4UjR2TW5DVVYwVjNz?=
 =?utf-8?B?Z2hOTjdyYmRRcmpROXFrWUJtRjBtOGljcGhVMnJ0NzBjYlZhUExlbldySVU5?=
 =?utf-8?B?NnJZci9KMUlIT0pjTzJzTWI1Tm5YcEsvc3lzR3Z0clRHQ21XbHFDNEdiNFNH?=
 =?utf-8?B?Qy9TL1RZNThNOHJhVXlNeVlvYUg1ZGl3L0JYYTJnWThGaWNsTGI2bHlDdXFz?=
 =?utf-8?Q?lHysOVoobSwSEQNEy8+ENgY5+LvOAN1LYAgf6ojdTBnxo?=
X-MS-Exchange-AntiSpam-MessageData-1: Zc+jkGVr4NeKgaaTtxkr7SzsuKQtehAN0S8=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6928412d-bba9-42d7-5805-08df051a22dd
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:36:32.4090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C00X0P7wvRD/6fwqqhwDcEnkkumOFhb5120tWPLKbm9lNoYzTLHYm1Gcq4Gf0n+eNimTCCExV8yFWua60F4v7sYc7xpLbw8z3cpmjGH3dEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 15:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244554

Hi Fabio,

On 8/28/26 5:34 PM, Fabio Estevam wrote:
> The official U-Boot project URL has migrated to the
> u-boot-project.org domain.
> 
> Change the HOMEPAGE entry accordingly.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

