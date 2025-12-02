Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B38DD1171E
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 17:22:31 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1416.1764696146505098327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 09:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YHL8wisI;
 spf=pass (domain: cherry.de, ip: 52.101.70.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GF65SJp3Tz7SA/hkz4YHZtXuhjiBfVyudJoH4j7atXPDm73Ywl41PwBnrqzuldXouHuiNd+SdvulcUFL3p7uy19bP/szgbznkKqghJbrqYeXrG4NhUQjrYkuD9PWMRLR9JbLDAROM1lUkGG2DULqSuHN0e3uzh4K8Q67/5/ffKO0UQdwV2z/D71y3CGxz13TtCy9sfXcCliNkoLHjQXTe8v6yu9XRj9PofdOqeWUntnjy3pQ0j25JVIYfZcX4ZmJ3SOVFF3dM65DgOL790JDhGfR3+d165BF/aIE6KGoBVh5+aCD/YefgR3hIKOi92ep0iNzzYv60anlmbQziszXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe0s5nSPMgmStuUXkUoxOaaZm+Za1tjkXmXplgoFMuA=;
 b=UEfhrtw/guSGfDqOuQsj23fdEuHKjkDMJb/nzIrvFFJCtREXLTujaUlnJ1ELG81JBONsCHjke2b8L9sLxEZ86tVllg99bFRS3blbXsfNnJSf+JdbU/YmSXlgrtBcRNc770K3eTt6oeGv3LrpnhlI8jyMDzvIHreLM46yGpzl3GtZqXDxtEZu5cPwfvEery08ryqArqxlP25powrH2z7Cg7QIVDbgEViJSvuiJE9R+W6yaUVbe3XX0cftAyRbEv0TEXiXVN3k8ikoB28wwuEVANB/evk9brqOh/KkNpylH+EF1v4M+uEzyYzC6oj5et2Em42xWVloMotWSgvojKI9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe0s5nSPMgmStuUXkUoxOaaZm+Za1tjkXmXplgoFMuA=;
 b=YHL8wisITOerE6P6LLC+jRJmT+Fa2t3isfgyewUOHNug3DWJQtUAokDzSWxPxgg+dgWF1oHtrn47q9UVMWVn8L189Fr38GsUl2gW2msdyva4DMjzyvvJdYJAOJkagg9jLzKuMHAmh869Uz/rnhtZM+IxZmRJhkfx2exyeus51hE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8802.eurprd04.prod.outlook.com (2603:10a6:20b:42d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 17:22:22 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 17:22:22 +0000
Message-ID: <afb4fac6-204a-4a73-83d3-9a2477f9dacb@cherry.de>
Date: Tue, 2 Dec 2025 18:22:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] python3-sphinxcontrib-svg2pdfconverter: add new
 recipe
To: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
References: <20251202-svg2pdf-v1-0-bf4bd322e528@cherry.de>
 <20251202-svg2pdf-v1-1-bf4bd322e528@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251202-svg2pdf-v1-1-bf4bd322e528@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd59808-152a-4da7-2faa-08de31c75a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHdsbTlEWXpMdWZab2J3NkxOa2lab2lHQnVtSG40eTRGdjR2Wllxc1VYQ0c4?=
 =?utf-8?B?SGw5MmFVK0hPUkZ6UTV3c0tXb0ZxYUt4bUdnRmg1bmlhNktQd3JBazlKaVAx?=
 =?utf-8?B?TWJpVmo0Uit0dnBPRVA0U0d5cklTTFF2UjRQcWhGU2IveFdJZFN4dlRBZDEv?=
 =?utf-8?B?YUptTjFxbkZMV212eG93a0lpN2htbUtlWjk1WXNIUTVGSHdGQ3pKOEQ2T0xM?=
 =?utf-8?B?VWJ4M3h0Ri9oNTlBOVoxS2YvcExYVkRMTDRmSGlmWnh2azFNWXNFT1F6VTFo?=
 =?utf-8?B?dWhQa2lOL2Z3ZGt4c2ZEMjBoMTltODlucFYxcFVLQ3I2Q3Ayajd2S2lPK05z?=
 =?utf-8?B?ZWJFNDAxNlBhemhHWXlJaEYwakUvajR3c2tzcDJLUnVDTi8wK01tYlJ3NWRo?=
 =?utf-8?B?SkR0K1QxcXA3TnZRakJXT093V3k5N1N6TEhGQmUzb05jbzFZbWs1SFJRTW81?=
 =?utf-8?B?Q3ZKUEhrc0drdDcvYzRTZ2hGY3ZJVTUwdmJLY1dNdjRQR0NoWjE4Ri9VVm9H?=
 =?utf-8?B?MlVNUlVrbW9vU2VURlZiazAzdUxNb1M1bE5WdVFZQUJqSS9Kcy9FRU5CNm8y?=
 =?utf-8?B?S0NYKzJoc3ZxeTlpLzM1c2poRE51dXcyYm0vK2k1Z01keXJ5ZURCWmFHWWNz?=
 =?utf-8?B?Uk1BRzdWdjRKUmxmdlcwa1EyZkw1cjdDdExxMDlscUlEbUZZWjVkd1Q2Skx6?=
 =?utf-8?B?Z0tOc2R1bGpRZWo5UTJRZWk2bFNzNzFNVXdITFROckFXR2EzY2FhY2h0R2Fr?=
 =?utf-8?B?TnNJUHlOcUZ0OHZqNmZCOE1JVCtwaFhHalpkc2lzMW5TdzdvWjlFRjQ3QzQr?=
 =?utf-8?B?eHkzQW5UMkVacHVLb1F2bWFiVWs5MFBRNWVlQUhxQjdUem4yVVNHTmN4K0lE?=
 =?utf-8?B?SDgzMmtzdEVLVTUxamVZNVp5Q0lOU250K2FRelZXcVZNeTM5Unc3RWprRWJP?=
 =?utf-8?B?S1lOYVcrNUNOMnlZL2Jrb1MzS0pQdk5JZVpsZWw0NHRCWXZTVTBHOGVNSXhi?=
 =?utf-8?B?SnJHcGZLYmIweWtrU1JxV1JqRXcyUUVhV0ZMdFJhREdWYkc3REVoWHZSendp?=
 =?utf-8?B?Z3BLd0xVTHJTbm00SmoySnVCemFGN3B4VHd1OWlMYVFBZGR2eTg2bEpuNzA5?=
 =?utf-8?B?eW4yaTc4UngrNW5EYnlITkhsZXBrZk94TER4WXY5RzcwcC94NVZ5a3pxeDd0?=
 =?utf-8?B?ZnM4ZWxPdTVjYU9OM2k2c2dvdXZMczVzR2N6Q2VISUpmSFZoa2NhUDZaUjZ5?=
 =?utf-8?B?Y3AyblljWldicy94QW9DakVBbG1tZEZLQnVBQi8vcE52TFVMektsL0xoUmxO?=
 =?utf-8?B?VW1rOFh2YVBTcjFGYXVBazFRL1huZ2pVQ0Q2U3E3SlE3cXNmaU9nOWdzY1Bj?=
 =?utf-8?B?eEQveTRqdG5KMzBGdjdqdnd0b3RlZE04VzQ5dDBTMWhYOXRmQ1c3Wks3NHlP?=
 =?utf-8?B?ZExJRC83eTh3VVlFb0kxNlk1T3B3b1hJcTVvQkxiaUJCU1BlTll0MTBKRHRY?=
 =?utf-8?B?b09YZTYwNzg2ZURHRGZ4cmhaUlVuY1hnMGdqSDF6OEJGTm5jUmxUbTdka3pX?=
 =?utf-8?B?dVQ3TVdRcTBoUENjandVL0FBRjRaTU1BaEU3cWNQcS95ZmZYd2xPbUxrL1A0?=
 =?utf-8?B?TU5DZUpMWDVsRkVJRzkxR3g1YUkvcEVsbGl5SGJzVW4xU0NTTmtQTGxxVGxj?=
 =?utf-8?B?UlArZVVpRXVlTVZXVGt4T09MNUw3UElnazJ4VzNhSHllZjNzQnRwWDlIQi9G?=
 =?utf-8?B?NjdMaEhQNFFPbCt2UTBPV01QbU9YYWJMMXpBcktaWWhOamExc0QvcEkvT1gy?=
 =?utf-8?B?Nnp5TG1KTEk3Y0QyQzhyKzhoejZ5S3RvaDI4Rnl2cDRCUVE3YTZDdHdsRHUx?=
 =?utf-8?B?YlY1a2YyaWoyS3FNcFk0ZHB3Y1hXL1RsVld4MmY5T0trbVptMmMwS295My90?=
 =?utf-8?Q?XLxtPWBzDMyX2BhSjBWqNgwbJry/juIs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UWczSmpGT2o0MGlNMk9SalA4YURZN3JYeXc3TDExMVM2d0V5TFhkQ1JleEdz?=
 =?utf-8?B?SHdsbEx2ZXlCSXgxQ2J1N3AzM05ndHQxdXpDa0JiQ2JXVisvWnZRd2tRSEli?=
 =?utf-8?B?MjJIVnJjWHc5Wm1MbU43dkVnTnhncWx5L0VmbnFYRXNIQWZTWUMwb0dVTlI4?=
 =?utf-8?B?K2hOaFMralNZdTVJdnRPYmxoMmkwQlRkV2ptanRHZjNzTUlxaTBqV0FIMXI4?=
 =?utf-8?B?VTVFSUl3MzFyNHg2YklMQkM3c2s1cVN0OC8wZW15d2M1YnN5cW5URDlxYk5z?=
 =?utf-8?B?V0txL2RaRk9SdGE0SFBCdnREVm0yeTZwTVVHRlpCYk9iSHhMWGQ5NEdHQWJ0?=
 =?utf-8?B?dHlDdml1TnBEVkNqZ20xaHRsTm9Gc3pnOVhUQ2pYSGVTcUFQNmd0NnhvVUtm?=
 =?utf-8?B?MFRJMDRqZTc5dDNscnQ3bW9UVkJQOGt5RnlERkJiOUJia0lWMStZNjZPcGRo?=
 =?utf-8?B?cU54YTdheHJHL3JvZW1FWk1ENUs4SHRtNFF4NEN4cGJsTUVXMFJMZHVoWWJO?=
 =?utf-8?B?OUFtcExIUmovV0MrZHVYa2YwSElqZXpUbkZHdStqUjhYMlhySUFQM2JEbCtq?=
 =?utf-8?B?eEladVovK2ZVNUVoUm5KQ25Dbm9ydERhdlFKaEFrZThBaXZtTFlmTFlFUkk5?=
 =?utf-8?B?Qm8vbTBVNE1ENC9YUXozVWwvOGpTdGRRUEttOTBLcnd1RlVuSlNDZnd2eFlh?=
 =?utf-8?B?T0JFZ3kxaEM2NERyTzlFellDQW4vODZTY2xvMnZ1V0Frc1Zrc202V0h3eWJo?=
 =?utf-8?B?TktudlplemJBQldtaDVzSWhZaU84LytjZk93dWdLM3pBb3dzREJpYmxCbjNl?=
 =?utf-8?B?NkRqTVBGQnRhTk0wQnZrNjhOZ2NEaEhnKzcvZW16eno5amMyY0J0LzF0LzBw?=
 =?utf-8?B?cWg4Z0pweG1EdmNkZnBlWW1IM0xtVERoZGZzTnlSV0ZKbEhLZDV5QjVna1Br?=
 =?utf-8?B?emE4MVFDSHA5Yjh1YmpKRzNhU3laRDkyMTZWRFNwOTcwVXNlMFVBNVJicnh5?=
 =?utf-8?B?dGIvblVOc3k1eU54bjVHUDZtaDJxRlRMUnNaU3c4SFcvTDN1dWdBWGEva0tV?=
 =?utf-8?B?WFVYbjBabVQzUjkxallaS3dXUzBSQnBRWTZMaTJwTkFpRVg1eGhNNW5Gak51?=
 =?utf-8?B?bm1jdUlaNW9aU3lkY2V0L0c4RlRNcW5acHlFbGY1RCtYSXlDKzRmbGJoeUJL?=
 =?utf-8?B?R1ExYkVvbDRVVEcvWjg3Q3FvTXptc0xOM2lKVXJ5cGJHc3lwNDhNR0ZtYjNm?=
 =?utf-8?B?S1FQYlltb1ZNZ3dGcWdwSVNteGtjYzlzbitYYmpCd2Zyc3U2TkxnRFFzaEJ1?=
 =?utf-8?B?UWl1Zmx0bjZqZysrVktHZHpUQmdvSGtFR3lpR2FHTXlJU0JFUjIzTWRIM29l?=
 =?utf-8?B?ZUFYRDMybzZvTGM2bGc5bi8zRmIxbmJaTWFqTkwweDg3Z2tWWWxDb0JSUHFq?=
 =?utf-8?B?QmxTdms5ZDU1eXY3RHFKQkpyZ1k1QUIwdUREUWd0cnRRWXBZa3lQTmlMdEtm?=
 =?utf-8?B?L1Q3cUR4MmRkSk0ySWI4Qm9TVG8wZDdia0R6RWpIeHF0R21iMFFjL28vM1kz?=
 =?utf-8?B?bDVhdGZnV0RubWM1dWcvem56TVREbVhueC9ubTlicEVnTThHUStYK2kwSm9Z?=
 =?utf-8?B?YVd1L0lxY0wwelpReWpBelJzOTdxN0pvencrZjVMc3JvUWpMdkwvWWdVWEt4?=
 =?utf-8?B?TmJsSzFHdlgwQnJVTHVKWXpKYXhGam1IUzRLOURNRFdOUHREZ2ZmV3VpZTF4?=
 =?utf-8?B?WWwzWEJDV09BWEtxYnJQUGpEYUwxZmdxUk9LSWVJbnBEWjlMaWxKeGtwTlBu?=
 =?utf-8?B?TklhTlpBQTdTUXJiTThGL3E2N3JYMkFvVzhFa3lkUlYyb2lCb2x2eUZHYm52?=
 =?utf-8?B?N3dpZE5tT0hLdjR5aDFiSUIwdG1aYy9YcHZzNGVrV1hVQXNXenByMUtHWGV4?=
 =?utf-8?B?eHJLbHp2WTZHVktIQkd1bzMwV2g1VnM3T1lEdy9pOExCY1RFRG1UUXJIYmls?=
 =?utf-8?B?Z1cwYlJJQnFJRTJHam5nWWY1bjZBeTJNb2tyMXZ3WEJsMXdMb3YwTU05N2dl?=
 =?utf-8?B?aG0vbTI1aDlxVmNmV0RvWFY1YVVWckZheXpmeCszNkRZdXBvdTNVVXlqQVV4?=
 =?utf-8?B?NUc3WTJacHdtYzY3TDJvd1pwNUp3VmZOL3Z1M05ydHpCRk42RmFYUlZtMlpj?=
 =?utf-8?Q?sKxShtfiH6x+UfUcdWWkOrI=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd59808-152a-4da7-2faa-08de31c75a89
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 17:22:22.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qe0WEAEzDTbzw4UFhX91jIRELIV90TBNAOoPbTeyVZYSeqXQLdb7E6ClW6EdueZSq4PxFcmlgzEZNny5gM9ZGgIJESYCsGbq+AjQGszcgKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8802
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 17:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227179

Hi all,

On 12/2/25 5:52 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> This will be a dependency for building the Yocto docs soon, so let's add
> a recipe for it.
> 
> This does SVG to PDF (or PNG) conversion for images used in Sphinx
> projects.
> 
> It exposes three different Sphinx extensions, each using a different
> tool for the conversion:
> - cairosvg, a Python module with no available recipe,
> - inkscape, only available in seemingly unmaintained 3rd party layer,
> - rsvg-convert,
> 
> So we'll only support the last extension for now.
> 

Don't bother running this through the autobuilder, this recipe was 
generated by "devtool add" and it's garbage. Will fix and send a v2.

Sorry for the noise.

Quentin

