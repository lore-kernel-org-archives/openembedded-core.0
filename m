Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D1BC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:13:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.57])
 by mx.groups.io with SMTP id smtpd.web10.89772.1749568389063365211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 08:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ndRZuYGp;
 spf=pass (domain: cherry.de, ip: 40.107.130.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWO73eN9puIxx6JHLrMc0RDOvGc5ECh3MmLzZ5eXpwxig1jBtwE84uuMyRqOPUskmZJ3aachMyyB6gdrwDbsVq28z1BLVQPkumbE6UcATwm223BzZ5tBbviO4FxQyYUIEpvr+pvRncPqHcE1T7NTY+2rdTMoUm4+45JNorqoozdVHdNEj+QFEehkH7vCyw6JMCv826rwp+NW8O5OyQQfFE87vivvhcZtg6V6YEiq2mkR/2QyG866AFrJ43LoZtHMVAVYLTnJYn8GSXEXUal0ckncnasG17hgFcCU/pOYlBorEI1GEQf+2gc7ruXmsGvUEmHqMwBDTFB1aBv437hf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yug+vSzFhZoU/T024bLajrXtmg7/FQhjar8x7UfmYB4=;
 b=RS8o7tTBWA5IRgybzzV/FzN71ijqv0oZbxCF8W8FFOLWKqpbxK4XFxa/NXHsH4wtyzs+9zY2yD1bAApRiWOo5VfXGDRb9/xNOXEJ0/kStPJuV4tR4h0ozPU/uOwEiOFFn2FiEnW10FomM7FY30jdJJWh/O6hH/rRrWmmk7oQCTbzhFm5Tr1rz2jrJLaxCJDkKxNv1J7XSBIQTmgraReuN400t064xM5XCS4snmlW1r7nZzuBzujhe588hOeblrAxkr6yhxPYVpMBtsoaT3HyIjxQb2Heymp1cXuJDUMH3s0cyL0dwP3hk7MOexP4ZZWAFaGnQ+Lw6XZsnjlcTYZHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yug+vSzFhZoU/T024bLajrXtmg7/FQhjar8x7UfmYB4=;
 b=ndRZuYGpdKpQb/PoUBtQJFIyu5dRG14EsqZbkseNqa+xwCGnj5h/xxk9io81Tmn4x8IId9QwPfP3PZ0UVTVdF6yCrhM1+W4vbP+o2W/EEl1oRPQD6PUalHO0bhJ7PbujJJuDtNOAHjzGgQ01xox4HeydxZUj12T04mqY0p6vewQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10744.eurprd04.prod.outlook.com (2603:10a6:10:590::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Tue, 10 Jun
 2025 15:13:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 15:13:04 +0000
Message-ID: <26b17dde-918b-4af7-ac6c-7dc80c5e9cbe@cherry.de>
Date: Tue, 10 Jun 2025 17:13:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] Yocto Project Status 10 June. 2025 (WW23)
To: yocto@lists.yoctoproject.org, mimoghosh9@gmail.com, skandigraun@gmail.com
Cc: sjolley.yp.pm@gmail.com, openembedded-core@lists.openembedded.org
References: <CAK5yBb-PRoA1biG6PA_hX_RndM9QqG7G_7ikYFUZE3goEaP-_Q@mail.gmail.com>
 <8ce48df3-b8a2-4b95-96df-bf0fc1ac1eaa@gmail.com>
 <CAOKCUoUsLb_u1KmP3sWOx5q_cOmj62W6sx+BJVp6TbGV4Mf1kA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAOKCUoUsLb_u1KmP3sWOx5q_cOmj62W6sx+BJVp6TbGV4Mf1kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP123CA0177.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:19b::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10744:EE_
X-MS-Office365-Filtering-Correlation-Id: a07d4144-47d0-42b2-2fc0-08dda8314c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|556444022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NmIvbHZDeitrYmZUU0pMdkV6RDErdUxacjBqdG80T0lDN0FDcllqbFV5NmZC?=
 =?utf-8?B?aEVRSW9sQXRod0JXdEpBMHFZWnlWZnJQcUY0eGxqeldBWVZNMmlYWkNRQU1W?=
 =?utf-8?B?MnBzelFTcVNkTk5hcWkrYUVxbk15alBKK1JBWGhnSTMxSnNVcG0xUDZMdXVn?=
 =?utf-8?B?UzVNYzZxeXJndGJnU1pGODgwRHFmSjVsVHIzVHlpdnNRdUpKYzhZbkp4MTZO?=
 =?utf-8?B?aE1zOHVCbmJ6a0M2dE9XUEk2Z1lQSkZ1WnNBaFZaTTB6eWZ5aUhlMDBCOWxp?=
 =?utf-8?B?dHd6MjJuVEZxMzdualV0Vi9zaU5DM2ZnQ0U5MzJjOFlwWUhaWkFOSFl3dTJn?=
 =?utf-8?B?ZGk0OHBPb2Fnbk5EbWhxRDNGSnZDbGVxRUZ0MmtXL0k2OGo0aVc5SVhGSnlr?=
 =?utf-8?B?b3Zub1NlTmFRaUpJcE1rRzR4bXl2VjU2bW02cHdueWx4dUlkcjlEbEM2am5S?=
 =?utf-8?B?akg2S0xaL2xoR1dXWGZIdTBGTEt5c08wSG5XbUV1OWtuUUx2Ymorb0svSzBR?=
 =?utf-8?B?OHl5L3JOSUZ6Ni9Kb1Mxekgzakp3ang2eHFsQ3dJNFhqZkJnNWptVUJ0eHhD?=
 =?utf-8?B?bnVJL3BkOGZoQmd6K20rbmZwN3RHc1ZRdWVDeVl2V2cyb3FTTW8razlsQmZT?=
 =?utf-8?B?WDg0Rm5yb1RGYkFVNGNiY2xFb0w0UXFrNyswalJnbVpINSsrRStiZi9HWHJs?=
 =?utf-8?B?YkwyMm5wYVZ0RnFWZ3JjRXlMZ0xXWUZIWnY5TTZQQTVuejNHUjRLVXRFU2Fv?=
 =?utf-8?B?R2NkOElIUTM0OFFRUHZEMjkrb05DZW9mb2Zja21tS2cyT0pLWHAwRy9oNGNV?=
 =?utf-8?B?VC9qZFF4d29oSXh6TmZiZDFReTBUektYQkVhdWZFSi9Vd0MrMVRIaElhcTFQ?=
 =?utf-8?B?WExDWE5hZk01WkNlYm9zR3dNSFBVejdCdlNkVmFjY1NGcnBpNEhpZGM2dllQ?=
 =?utf-8?B?RGRUcnl2Z0M5eU9UQlhzdytkdjJ3RXd0NnUvVjVTenQ0SFA0bC9mUm1sc1p6?=
 =?utf-8?B?QmRQTC9WK2xBVEdTakpvVzJiYTZ0amJWVTFpaHhjWjlRSWpydVpSYkJac1BF?=
 =?utf-8?B?M3l2ZUEzWlkxOGVoaXloeFpJTk5nclVoQldub0FRSVQ5bHYrSjlvWUhsc3dY?=
 =?utf-8?B?dWVJdU1qQklnMmhIdHE0NktBZjdjTFJGSFZUQTdWaDZBZ09LbG9LNmdTRjF2?=
 =?utf-8?B?M25oYk9RU0o1b3BPRFdGWWRLOE94cytITnJqWVQ2d2ozOHQ5ZlU4akFJNUF1?=
 =?utf-8?B?eGg2ZlBXb2xZRndOdTlnb2RTem5xUkFZTkV5MTFCSkdXNXBQZVVpYlNEczRv?=
 =?utf-8?B?dDVkbURVMEw4RjB0VzM5Z3BHWmtoRWhDWjBMcGM1ZUtZTzc3elBZYUw1K2tj?=
 =?utf-8?B?eXEyZGx0R2gzbUdHMjI0UVJBckVTYXEyYXpWRHV2ZGxwVVRHcFNFallWbkZT?=
 =?utf-8?B?T0RZUW52Rm1pZENpMUNhUHdXU0ZKK1NZN0ZxNEtpT1VFRDNaZXdFd3hpTzBE?=
 =?utf-8?B?SUZUWEplRE0raUJsZlJUeTBBMzZDTVhVV0FhaFRwVGZSNks3QXBCV3NaTWNM?=
 =?utf-8?B?K0Z3YTZGOWkwUkp1eE8xdzBkOUVzT3V3Nk1MOTh5Y1VyTXduWDhUVlpTWEla?=
 =?utf-8?B?by85SmQyNkt0MlFJQVlia3RxdzdKUm4zVGRNeU5JZGI4Y1FiamlvbEZSa1I1?=
 =?utf-8?B?SWt3YncvV2owcm9HeUY1VUplSmtreTQ5djUvWjY0b1R0QlMxeXBIaG44R3Uw?=
 =?utf-8?B?TEllZUtmcFdzaDAxTktpdjN2bkNQbE5TOWNKZVRnaGNlZkZUQnpsaE5KSGNx?=
 =?utf-8?B?R016bzVvQVdqMTVTdkFiZ09ka1NkdTVkT3dpT09EVTJDRE9lRHFucGx2U3cw?=
 =?utf-8?B?MTAwNFFNVmgydjZESWJhNG9tODNvVnlkVFU5K1NwY1h4RzhsNXJHUlB3d2p3?=
 =?utf-8?B?U3VqT2tXNGVJTEZ1eWI0Wnova3EvbFRIVzBwUFFYRWEwNGtPV0pucWNTbnlh?=
 =?utf-8?B?Z0FsWVlIdXZBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(556444022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEhWNE1KeFRPeUtvT3o4WUo2TzNrRkZDVmlDS0cxeDFCN0dkNkh0bmhmdW9a?=
 =?utf-8?B?eXg4ZTVtNGl1VWxud1hlS09oL0N4Uk50OHFtZHA2WXZLSTlpZ0VtVlV1ejR5?=
 =?utf-8?B?RjNvQ3ZhVjA1QlBpNmhDNDRPYTAweTd5K0wrQzZ6MWRVTWFZREc4NklFdGlZ?=
 =?utf-8?B?V21wVUdmZnNoNHRxcTRQZ0g4TG9tVDFmNm9nUHhWdk1lZDFseWpHdW0yZloy?=
 =?utf-8?B?MjBDUVBYeXBLei94ZFFCdWtmdkVjYkkzS2xEVmx6Q0JXdHVrMlRWRC9LRFdL?=
 =?utf-8?B?c255UkJPVVBvcGJNNHZzOThWL2FlbEZBWEFWZUVvaTJzLzBQU3FlcnI3RFpS?=
 =?utf-8?B?cHdvTWgvWTlxQkRJM1JWNkR1QWxQUU8zbVNNTXVBc01idEFORlI4NmxqV3pw?=
 =?utf-8?B?clA3WUhlM25tVUJTcEhxamhHU2RSYUdGWFhaM1NONlJtam1uNUZQaG1JWENl?=
 =?utf-8?B?Q2ZXNjJqdzlWdm1WaWh0ZDU2YlNEcXhpOElDTVRGbExOY1Zhd3NOY05KYURP?=
 =?utf-8?B?UVRDdC9jRHBQTUxSaGQvOEoxbCszeVZmSVd1N3ZUajM4RVNibU1Hay9Tdlc0?=
 =?utf-8?B?OEFyREZkeVRwanZYVWs2RDAxeGdZalZaaldOVjAyMTkvN1VrNW5EU2hCV1o3?=
 =?utf-8?B?Nm05RzZJaWtHVFNtUEFwdFZGLzd5OEVuZUE2Nm1GREpNejRMazE2TGFGUzE3?=
 =?utf-8?B?L3lZUExhdC9Zd29xTmZvbnJ4bnMvV2JmempYa2tkTmp4bFh6NE90TXFtUGVM?=
 =?utf-8?B?QXRvMXZieDE4S1Q4SjBYcThsdVJGVXJZeUhNM2ZibVV1bjNRVFVyTUsrUE12?=
 =?utf-8?B?dUVySEhHMGsyYVVhbEs1NEJqbVByNTJIZCtCM3ZJRFUycGRRNGFLenE2RU80?=
 =?utf-8?B?OEF0Ym13QmJocHBteVhPYzB6a3JqY0doS0N5aTF5ZVUyS2h1ZmRFdFdrYkx0?=
 =?utf-8?B?TjlHY3pCMFkraDYxODE2clE1N2MxY0hWYVVPbFcvVUJTd2duZk4rbHcyd1Nq?=
 =?utf-8?B?UlE4N3VkeWlCc1ppdGhtUWpvNkRJTjdXYWR0ekdjVjQrWnRoYm5mU0xRUk52?=
 =?utf-8?B?Z01IK1FYVTNkWFZxc3luUEpsRkFRSHhac2licHlHMnFCUGpoWUdIYjNZN1Vu?=
 =?utf-8?B?Ump1ZjMybGQwU1IyWVUwMS9qQTM1aTJlT1VWQVhPaU1rL1B4VHkyWU9rQ0Ry?=
 =?utf-8?B?WDUyWmpyL0hWaVN2cXBoQ0loUGxiRk9tZnpsNExrV2NsaVpXbmVOaXE3OUR4?=
 =?utf-8?B?VHRTZ1pLUzJVNERsNXJtWExaajE1SGE0TmlhWnBlOE5YSzV6Kzl6RUpUc012?=
 =?utf-8?B?aWFYM2p3NjROZ3hXL3ErNllqaWdBS2Nnbm5yeit6eE56Ymxaby9qVW9uaFNP?=
 =?utf-8?B?UkNGZWhySDh2cmFra3FaS2Z4TVlNWXIvYi9TcWM5clJlU2JybG9BdmFnSEpP?=
 =?utf-8?B?WHFmSHR6WExqejZCR3k1a2doclk3eDFycGFvbjdWb3ROM1RPNVhoT3Y2b3hB?=
 =?utf-8?B?UWFxUWN6UnRad2QzWllmWEw3V1AwYUJYcTdINFQyWVJFcW5VYjMwZkI5cnFT?=
 =?utf-8?B?MEovN3d1OUJTYjBxWjZpRlB6ZDVMYWYyaEJmd3QvUGZzbzkwV1lDTHpZTGJr?=
 =?utf-8?B?TFh0a2dlMDJvWkRtLzBSYzlIYWpPelVmaGxTVTRoQTN6QVhZc21CQWpkajdJ?=
 =?utf-8?B?cHpVblhVMzZlMllhR3VEY3dwZlVxY3lqQXZBaWgweTJWbVY4TzBGdVFDc0JB?=
 =?utf-8?B?VEpKdFJmK0FrbXhJTi8xVnJKNmZyNzJnOUxCSVpCaXRpeFJadHhWQ25uWnVX?=
 =?utf-8?B?MDZURlp3bE1KQ1prdWN0dkZnQmR4TTUva0ZpK3NMYmlja0ZWRWMzdk1scGNk?=
 =?utf-8?B?dGhxdzBxUEpJTmFvclZiL0J6RlZtNkdXemFUeXBLVkpoYWdUYVkxSkhvQ3NS?=
 =?utf-8?B?Vm1pU2NwRVN5Q05uV2hmN1YzSVI2Mk5oTGtEQ2gyUDAzY3FTNURwamJROHpK?=
 =?utf-8?B?Z2s2VWxiOWlVTmEwL0xkd2pCaFBWRzV5cmdhdDA1QWxoRnBvamw4SVdvL3FX?=
 =?utf-8?B?d2M1SjQ3NzJwK2s0RmR1ZElNKzkvT294alllK3FGK3hZWHdqSnRYemhCRVha?=
 =?utf-8?B?UTRLRk4xVU9NdGIvWGxBalZaVzJISHcyYVhkeE5JRHdmUUludXUwRkJhSFU1?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a07d4144-47d0-42b2-2fc0-08dda8314c4f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:13:04.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdEwvWf4u+LqWWD+rWXhKrjTMXB+F0U/WbBlVANYD+oi0psx8RdhHiqEbie23cpp1fG88GJrUwLkC5CTQumExinIVxZs5CP2AMvgdv8VAjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218359

Hi Mimo,

On 6/10/25 4:56 PM, Mimo Ghosh via lists.yoctoproject.org wrote:
> You don't often get email from mimoghosh9=gmail.com@lists.yoctoproject.org. Learn why this is important<https://aka.ms/LearnAboutSenderIdentification>
> Why am getting those mail not sure. Which is not related to my queries.
> Unexpectedly getting those. I was registered to get help. But it is diverting to another way... Fuck of those silly sitts thing..... looking for unsubscribe....
> 

You need to be subscribed to post but you can disable receiving any mail 
if you want via settings on lists.openembedded.org

Once logged in, go to the group you want to modify (Your Groups, top 
left) then you'll see a Subscription menu on the left navigation panel, 
click to expand, then Settings. In there you'll have an Email Delivery 
section, just select No Email for example.

Cheers,
Quentin

