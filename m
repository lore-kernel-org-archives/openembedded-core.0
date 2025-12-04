Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDDAD1F9D2
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 12:15:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42217.1764850506454662298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 04:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EJ3LZ7XH;
 spf=pass (domain: cherry.de, ip: 52.101.84.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B55ys+9sHUbzMsjbx2O+tGI+Af/pEnRdO/jGEun1HaxR/bxo4QXJfDCypWOT7yNeQlinNmR9kNT3ybQoVO9dVCbny10dnUxCkxP4UvrxgPWW+hwUt3VH39ZrQUIxT9arj1b1AN3SGhIveppDx64e/wumNkvqi+3wW2A+U8/ETrcwtDPfRsABiq71gJdbc7aZ3hV0qxixy6GBp0m6sPjFvL6usuWBkeKZWGF5dbF4KLTo+ClVdduLPEej0E1gvkmPG44XzSk/arYcUV/rca/BHgAOZ31pHWcwXf7mF4oK7HSc7/JK8IEghu0ICkQ8cFnCOC6Bd98O7f74ZglEUWZtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLQjlAYF0tGoXmknAdj94OhtC4LJi5MiFqrTmee6UWQ=;
 b=dziFsnCIvND3021mbhia21jENLyirlU9+tglyxN+GEEgrVVYK6XCk05rQL+r7eEDdkq11Qm1J24e+idaeX04xVKX5kZaJdj2E+o9POn7ZJwZ70W0SwCRai7cn0bFj47hnwipRBRca4e/gOKyUcFKhea5POScnI+CvEqzzxOEcr/Qo0wBCMMFRgXDUC+IttluLkc23IBw9ta0ZrmmKkS3wkW575RALUzhbC0l+l/IdPMMHZenxk48vBXCX0UJECP1OgAdaCXNa6799g8mFoaB5lbRCOgSrQFdDHJxTUDahSnyAtw2a0RfElrF5ozMc3C7H3ImTeLSwtjGCw2Cl4NkTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLQjlAYF0tGoXmknAdj94OhtC4LJi5MiFqrTmee6UWQ=;
 b=EJ3LZ7XHMTAoKjErf1ukZ4LahALCVi+7YDNkfrFV1QnVwBRpPiGfPsEp35XaAL+XyT3p0T+SQsTKZvqByj7tputQFpeoWv1nIXncmiGr8CozuIonYg95mBSGxkomBIytYxWTVjqTDeVFzcLKXg9spTogGIVWp5edtEJJZ7c/e5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by FRWPR04MB11248.eurprd04.prod.outlook.com (2603:10a6:d10:172::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 12:14:56 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 12:14:55 +0000
Message-ID: <87049290-600b-48ba-9902-71fecc75c247@cherry.de>
Date: Thu, 4 Dec 2025 13:14:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: upgrade 25.2.5 -> 25.2.7
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251204104814.3255908-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251204104814.3255908-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|FRWPR04MB11248:EE_
X-MS-Office365-Filtering-Correlation-Id: df8e1ff3-a383-4167-bd3d-08de332ebc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ry9HMm5rM2tpVm5YVFJRdGNwak5rWUtCc0RTK1pWR2VZWmhuR3MrL3ZHVHhL?=
 =?utf-8?B?TXpuQU00UUJueXlVSHNIcjJKK2xVd3dheXdYbXhiNGVIbXp4d3dDQXduNFNq?=
 =?utf-8?B?UjBKSGJnRkoveEdLcGYyK294cGpIdTZhMGJ2UkJPK2ZubFVDNnNOVkVPTTV4?=
 =?utf-8?B?UHFNYkFmSlhwaXlOK3JuSjFEQnIwRjR6c3p1QTRsMndXMGMzMmNGSVB5TEhD?=
 =?utf-8?B?UlhLR1B4Mk81QlBlblFFa0wrZFNHbUVrRm1kaWJ5dUc5aDl2aC83NkZrd1dM?=
 =?utf-8?B?bXJvcjN3WXJUbHZrS29nbUdhTjdHVTVFbHNXVUl3TnV1N2ZFY3FyeFFxc0JC?=
 =?utf-8?B?TDkrZW5oSS9Ccjd1ZzgwTWJQUkZwd2pqWXFaNmpsREhlSk5xd2labEwvOE5T?=
 =?utf-8?B?TFFhL3VjWVlDNTBSN21ncGU2Mk9NZ1QvVUUydGpMZ3JxNGtpd3RUR0N2Z1p0?=
 =?utf-8?B?OWxmU3FCL2UvdFE5WnB1UDV1bDNNZTVILzI1U01ZMnIxWUdleGVia2tEeklC?=
 =?utf-8?B?L1NKb25hR3c1Z2VOT0hHenVvWTZ4T01uNkZSNjdyV2oyaWQ2TVVQeHZxTUNJ?=
 =?utf-8?B?bkgwdVBaRlhkRGRIUmVQUlc3YVRQM1FRMWFFbVd2UUhydHlmcWZQSFp4U0E0?=
 =?utf-8?B?OEJsT0o5N2VqODVNZDltZ1lOV0dxRU5CV29DdWVDRTlYbzFnVkwrL04xbS82?=
 =?utf-8?B?bm9ubUxPNENXcndIc3dqWVdwUU9WTDZlTDhMRUFPNHd3Y0NkeHBDMDZmaU1n?=
 =?utf-8?B?dEFZZ1JFR0tEenA0VnM1VTh3TXFaUFNDRG4rTlk5L1dnRk03ajE5aytMdjk4?=
 =?utf-8?B?YUswUGdGNDBrWEJ1Z1FKZXo0bXpaeUpubEppamhNS253MzdPT1N1ZnE1TjZn?=
 =?utf-8?B?ZWdsUjA4R1RvVTR4QklBWFFpVUdQcy92VktoTUEvT1JKTDI5NDdoclJsZEdF?=
 =?utf-8?B?dmxLa3EzVzVldUFvVURETDk1bndmbW9sb0Q4MGg2WXNmeXhkbXZvTE1HYWRC?=
 =?utf-8?B?WjZCajB4dVpHSVVyVnVsalVKNzRUMWoxNEMwdkpoUU9KR2p6MkpaTk5DMi9w?=
 =?utf-8?B?WnJibkQ5OHFVTDZSeHRDK3pNSG8vVTU5Wm5zOWlqTzJaSzNhclV0VnlDakx4?=
 =?utf-8?B?TDE2Tmp3Z1NVTERGZHZSZ0NLdTZ4aGs0OXJEcVhzb1dBb3RCOXRjZXU1Yjhn?=
 =?utf-8?B?RHV5cDVtaUp2cmw5WGhLVjV0bC9SdHozUzJ0S2tOS3NlbWRnNExPVUlhWUhX?=
 =?utf-8?B?QkhFbTZjTzBJNjVkN1dUSlhVQlVmRlZiNUxra0toSUpxVWhBcFZQTEJjNEtX?=
 =?utf-8?B?Q0toVUhRS1NjNWhGSmtnaWxqWUNWZmJGaS85QVlkaVI1RnFmNDJVQ1dyQlVr?=
 =?utf-8?B?a1FnYk1uVG9LZ2dJeFZBajltLzFxbTBMbVR3ZG15RTVGKzQrWGErazBHYUZl?=
 =?utf-8?B?ZE5jZVV0TkErOTg5ejBxWkFzMFk5WDhvT3hSWjhCckJRT2FtZVR0Ni8rZDJM?=
 =?utf-8?B?UzFmT2VyT3JnRlEyL2toeVdHM2U1aG4wTURtY05aM0tPT01Kb3EvVm80eTUz?=
 =?utf-8?B?QVNkT2szTHlxUFNocXBIdk9KNEF4V1h1NDkxcSticDI1UXlRdkhYeTVHbGNT?=
 =?utf-8?B?UGZBVFRuUmFVUnZ0WTRIanlIVUJCbklaczlNbkptcTNoOVhaYkpWcVZGaVZ4?=
 =?utf-8?B?TnhLdzRUdXNLYk10NGhxdE9RVXhaeThHd3VyMks0blV3TnVqeGd5M2lVenQ5?=
 =?utf-8?B?bnVzTmx5Rmo5Q3NNOUU4d3BMb3dubWJnN0UzVVVyMHYxMTI1ZjNCZlNMSGZL?=
 =?utf-8?B?N0tLbWhzSlB4RGg1RVJsNFFsWVdxWFZPNVgyQ1ZGWG9sMm8zcGhYQ1NZcS9v?=
 =?utf-8?B?YjhUOWpNWHRZdTh0QldmRHBNNUdxbG5NNk5xY1gwMkRpZ3N1ZTFIN2R4by9w?=
 =?utf-8?Q?uGOsk0mz4bqiCUF7XqNMYKsZJDZzHumB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WklmM2h2K09lZHJ1WGk4NXE2czFwYXBNRmhxS05nM3lLUUxjdm4yVnNyK0ZT?=
 =?utf-8?B?SzIyYncvTUlLb3I5ck10WHZKK0FaV0Mzc0srVkhXRlltQis3bUh0dHVTN0ti?=
 =?utf-8?B?dzZHclhUR0xITm0wNGtyd0oyZ05vWmNCcVRZRnF4TzZ1WVZhcmpCcnhPKzhk?=
 =?utf-8?B?RFZWampJeStlbk1pblFKNzFZeDdXNU50SkhsSXgrNjNBWm9qdnQrVjZxakxv?=
 =?utf-8?B?cmQrNnMzd2lnUEwwQjI3SVg1aStqclIrRDVUWCtQbmMyN1ZMVHIraGF4bmxs?=
 =?utf-8?B?MzhKWlBpbDVhTHlod1VSUXpRNTdmdjFBaG5VZWNOaWFKQWR4aEFTdjVFZXlX?=
 =?utf-8?B?RWV0UkV3azZtZUpTMkt4YkRvbXE0am5pd0xGWDhJcENyYS81REdqelllK2lR?=
 =?utf-8?B?T3l0Tmcrc3M1V1JudWZXMXl6Y2d3ek45RmNxL0tEaWw4WU42YVJSUk5YTi9F?=
 =?utf-8?B?Uk9PL200MGpSSDhUMjE5NG1iYThGdGc3TzZZQmdSVTlNZmltejk1WkN5d1NS?=
 =?utf-8?B?RW5TUzdxTSt6UXJhY1hZdlhGR2Fnd3FJMTFrYUh3ZFJOd0svYTFZRjJ2Wm93?=
 =?utf-8?B?T2FsLzlXZUYwbkhQWnZXZXJhMlFMdFArSThqVkk3UUNSaGJ0Y04wWnY0eElW?=
 =?utf-8?B?S2hzKzJMZVc2OEl2YTZTSGY4NDEwRGNSNkR5bk1mcDRzWllIR28wc3cxU2VR?=
 =?utf-8?B?VHZDZ2U4UzdrOXgyMXZ5S0pCT2MrVkY3S2NiUU1tc0FmMkg0bU9mWnNPT1Uv?=
 =?utf-8?B?UXV5Mks2SUVjVUlXUHB2YlA4K3lhWXB1MkNpaDdkYktkQjdDQ0xvTEEvSWlm?=
 =?utf-8?B?S21WNmFrQ2kyUG5LeXNUaHFWRFlCUVBkTFJIZmo3Y3NCQUJVb3NkTHRGNlM3?=
 =?utf-8?B?OGtZTms4WmFRQjYwc1lWdzF3TlBHSjl6UnkxL0VFMFR4Zjd1SzdndGpwVjVu?=
 =?utf-8?B?WlpZS3pOVE1VdVZIcS9ZUGVVNVFGSTZ0R3lqNXM3QnYya2FQQzlaQTEyb2NQ?=
 =?utf-8?B?eUxRaERFSllhTm5WemtNTitaNktRRUx0a1AyS3J1T2NmdTZvM0kvdHdGUG5n?=
 =?utf-8?B?ajMvc1BWWTg1L0JzZk1VVkVTNU12Nklic1pUWnRuTDJzVTJrOXdFUzE0QktE?=
 =?utf-8?B?TGU3TjBiaVJ2Y3I5dml4a3JlR1dwcnhRZXNBWUN1aTFqZTRzcVp4OC9Hbm15?=
 =?utf-8?B?TURKZEt6M2NZWmE3WW5XNkx3QWJ5NDBvZzVJSXphcE03MXZ4V3c5YnVydnND?=
 =?utf-8?B?Q21SWjRoSVpwaitUdnc4Uklma1F5dDdjUWpCeTNIK0ovMXhudWs3S1NPWURQ?=
 =?utf-8?B?M1pFRGxiUU9LYXhHbEFlWm9Td1g2SWJOMTJKNE85V25Wai9kTFVMVGdWYVZU?=
 =?utf-8?B?bTFTN1lwdGhjODIwTW1lRDZPNXlMNGxXYWxwWDQ2UGE0VmtSV3lhWXFlTjBE?=
 =?utf-8?B?S2xaN2ZGYVlLTThaR283WXhYWEl2dnNNMkE4YXVxTmJLUnFoRUZtd0Q5ZlI4?=
 =?utf-8?B?QkV6NnRxRVcvZUtXY1lONFgxUyt6RlBmOWFRdzhyTVQ0VzJUM0ZSTHlNbHlm?=
 =?utf-8?B?Y3VNQW1XSjZMOTFYL0VBS0lzM3drTGNOYUdQL2dOaXhZNTFETTFtZnpEc1Vj?=
 =?utf-8?B?Y0tTZGhhcTM5MCtVWGw2UG5jMzZOM2drQkdYUjVMOHh3SDdqTEh4a3ZRaU1m?=
 =?utf-8?B?dFVSK2hrbFZHUjB1aHg3RlJjZ29na2o2bWF1NjNVZWpBZGptZGp6SkJHemdZ?=
 =?utf-8?B?NStQUnRvY1crWXBUNVBKSEFkV0c0cWU4ZHJHd1h3Zy9tS09GSGFSNHY3Ukc3?=
 =?utf-8?B?eS9zaGdQeUFEQVU4NHF3UHlZUG5KUlNva3Y5cTRpbTY1ODRsUFBJRHdqRmxl?=
 =?utf-8?B?YTFJd1VXdGk0RHZyYXRRRVRNdS9YalQxaG5QV09TM2hsYTkxd0NxTmxjQUdi?=
 =?utf-8?B?eTBSSDExd2huOEU0cGd0RzhHSDdpdHNZQWJNL2xZUzc2ZTg3UWgxRWx1R1ZN?=
 =?utf-8?B?aG42OXFhOWE1VFY0Sk5uazQ1V0wwdjhQK0l6NHRPdmc2NWt6b2phRDE1MmR0?=
 =?utf-8?B?TUFLM1RCQjkrMVhSWGI5VG1TTjRYdE9oUzdORkF6dndPRVNTUmZzNTJ2YjFn?=
 =?utf-8?B?UXIrV3V1UjJuZEJLYmNiR1U5LzNpdVN2aU5pUEw3T08xeUxtN3NBNnhVbE54?=
 =?utf-8?Q?MIE3laEXOwCkbDKhqSmzspU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: df8e1ff3-a383-4167-bd3d-08de332ebc62
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 12:14:55.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92k5+PcPdRncD6YhDP9MzjCGA4Ikl6CHgmJRfu1ZwOIWKeO2PJk7xaE2oaHJcsTlgULZZiX11SGewHOXDckvqaNmkrWzMCqLd+s+4gw6O+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11248
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 12:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227287

Hi Dmitry,

On 12/4/25 11:48 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Pick up the release from 25.2 branch, fixing several issues with the
> drivers.
> 

The last release for 25.2 branch, 25.2.8, just got out, maybe we should 
update to that as well?

Went through the log, nothing should require changes aside from the PV 
and checksum like in this patch.

Cheers,
Quentin

