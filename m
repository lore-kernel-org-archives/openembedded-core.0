Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFFFC83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 06:01:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14522.1752818492462871731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 23:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9294f15c75=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56I5hDN32504837
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 23:01:31 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ybu3r75k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 23:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Plq1mCp44GEKvcTkfaCGqE68P0A2iWmGLHxebxkv7cYz1i5pY7UE0nHQ4LU6lS+Q9kAU5DgUksXFSbXpIpI/jHQHvnANu4VTrbyuQU+pJOs14rTfM2QuANqXv7SvkT/6FeoNVHYzbNkHol5aoxCTi+gONUn5InnJBJyPvRmkpf6oA+ocFotgEDGd0yiTX8PABxxHFHex/zzBI0m2IVZAtju+rN6UdRa0mOuXTinlWQ2qFhmU3aM+mpot09QS2FSPhodapn0LgOXpOxK89ihwNF6Pnga4m3IWWxlchtk5QJy1DvQfYab9B1EIW19EHX9E/B6T9t8uxkqMGSXo5/7+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKxLyyNz6U4K/kPmRulSR/ST0Ea6c3ESrwucg/qYKpw=;
 b=lGCh62yu3LhfeRk7N4sTayytQz63rfuciZyirkJpgcBTnmMLwZgdGVKZGwZipDAwydPJVR9VOS9oFRoc2i5YQ2qtwOmKWtVfoBhUEgu3ZDUFEBQHVaR4bKANTW+drnP4U2H7YgULFiyNLou71wOj0c5S0sz5FP5I1ElVONWQGUylH0neqiSzyuYWy0hj8l78hmU4si/8/vkqv0d0mMxxif2XOkmG+To8jdgp46G2TNHlwJm+F2kmGdSuFbDYZtGW+1E/wVWROjiPN3hRxufT2W31w86RNmLVVA52bqGui/00T/iF6I+Se4LFCIoLrA3hveiw0bXK1jY4+XLurerAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 06:01:27 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 06:01:27 +0000
Message-ID: <be0682b0-03ee-4815-a784-3d7452ecf346@windriver.com>
Date: Fri, 18 Jul 2025 11:31:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] glibc: stable 2.41 branch updates
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250717094145.2061968-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <20250717094145.2061968-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0069.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::15) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|BL1PR11MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f3d28c-c451-46f9-9636-08ddc5c08892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WU1NMU9YeW1rUFIzaWloOW5FbnM0bGlZeGFXQU02NFZXcHJpM0JycFdESlRH?=
 =?utf-8?B?NHRZY1BFZzJERWNzL1RCY2hrdXhzWWh1SlBCd0dRRmZIT1pwV0tranFSazhl?=
 =?utf-8?B?ZUhjdlJHOWNUeS9aRThsREczN3BUQ01WVEhmK1F0VkhobXhieENEVlpPZE9P?=
 =?utf-8?B?bllsSFFNMlo0UGljWTVNaFN0bWRLM1dKS29jRzhBUFROSHp1UVR1SkswQWV3?=
 =?utf-8?B?ZitlQW5iQlRUVkdySkdKK3FPYVRvV2g0YjhaQ2xyd3djc1l1OHVIdmNkeE90?=
 =?utf-8?B?dHd2RFZKcGZBYTBYazJOZVphdEMxVmJWRENNMS9uRktVRS9WTnByNDcza0Jt?=
 =?utf-8?B?N2JLcU1tZGpneFpzUEtyU2U5Z0lBbUhGWXRrZXN3ZVhhNVNoMjFZTGl5Z2R5?=
 =?utf-8?B?bnlldmNjY0M2UHVlMC9vWjM5VFJYaDMzZ3Q3aTQwK1dOQkdaL0IrNHhtSWFH?=
 =?utf-8?B?bDFXQlRWK3YwdndPZ0tyUTNsVG80aUFvZUpydWdENTlsNzdPc2Y4Y2VkU0N6?=
 =?utf-8?B?MXVSdUdodjU4RHhVQlFwdHo3bVpJaVpwb2ZoaHhJa1ZhUWxvdFNaWFFHMEdF?=
 =?utf-8?B?N0VBVm1iNjZDQWs3YWJMTFIwaFZnb0lRc01rNU9QWkJnMm52aEhjTExsYm9T?=
 =?utf-8?B?MmxPbVlxSW5JdVoySmFNT1BYOEsraFlrQnA2NjZqQlgzVXljR3VHbGc2K3ZS?=
 =?utf-8?B?cTBHWHlYRHRTVnEyTWJ4MlEyQjVzMW1wU3hlYlp2YjVtVXdicjBlSkg2bmpD?=
 =?utf-8?B?OG5oTnJUNm9VclRJR3VQSHlpQmdBNW1uaFRkQlpMYlF4QXlNU3RFM2VCQ29V?=
 =?utf-8?B?ZUpLR0wzSWJtMy9OQ3J3cnM0VzFDd3l4aUxINGZwTkl0bG9sSFJZY3BMTDRF?=
 =?utf-8?B?VUhEeEhmd241ZGp4NVoycVVxK1R4aDc0d3Fxdmh1TWF1b2V5ditSVWVveEVa?=
 =?utf-8?B?cUJUbytIdEVKYnR3bTdZUFQxUmF2Nk1kUVJrM3VGS0tSZDg5SHBHZFYzZjNM?=
 =?utf-8?B?T2FLOFRiQysyVkxUSDU4Q2UrbXJjTjJRMGlHSmw1RU5HMWZvYUhsc1hPd2s3?=
 =?utf-8?B?WkU3eSs5N0p3Y0J3a0VXYzFHNWZ4WmxkQUZINTZyZUVJK0l2TDdXREJNRnlx?=
 =?utf-8?B?U1g3ZlZlaWllcFdlcE0yOG4rNzVLU3pWbDZPM05UVkt2cW1RTGcxNWltRjNr?=
 =?utf-8?B?ZVh4ZXhHTlpSek16aUNFajBlWTV6MnFzM0JQOHFoRHhBTnRma3Y2cXliTGdo?=
 =?utf-8?B?QnlKRU8wWDh4bUYrY2JqR0hOcmhKNVp0enVZa29oQy93RkhQREFodFRlbW54?=
 =?utf-8?B?UWk1WlduNHJoTzZaZWNNTjlzbG9NYWhuVnlaZjdYVU1zakgxYWdjRHhINFFz?=
 =?utf-8?B?dkYydzBvamxXbDU2TFh3ZzJxeWduVEFyZktnTGJGWE9ZU0hyVlJOQlRkbkho?=
 =?utf-8?B?Q2VvZ2krZFFRR0xiVlAyKzdMZUZzZWMxSjdWOGRlQTB4NzF5R1dVSXhacWI0?=
 =?utf-8?B?b2VRT2NqcWRDN09VVGhqQ0ZDc2s1UXZnSTR5NUt3Z1hpRDFnOFc4QTJ0d1o0?=
 =?utf-8?B?VWZpTllyZWlJYVAyRDZWL2xkWlJJa3N0QmlJM2N3UDAzZ0IvVHhBci84RnZu?=
 =?utf-8?B?NHZtR1pWSVFDcUNFZHpUYXZQMVljN3VkR2ZuQStoVWhiazNNNXZlWEhvbEhm?=
 =?utf-8?B?ZmhDdU9QalJrWlN0K083V0FSYit3RnkyYi9XQndXZHc0Wnczd1JqaVlrUlN0?=
 =?utf-8?B?OStWUXVEaHRRQ0s0SmEzdWFUZFBUa2ZjS3pGRXR4Z2NEMGlrWWhOTU9reWtm?=
 =?utf-8?B?MlR3OFpRYW9IZm5qZ2hxNTd6NUZmYzZOZ1VwN2ZPUHlub0VjbnBJR1E0TGZr?=
 =?utf-8?B?Q3hOL1NsN3ZRQSsrVy8rZk01dnRWekVwUktSV2Znb3M1Q1FxeVNUbWczL2JS?=
 =?utf-8?Q?xFsyuY+UTMI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Tk5MWllEMFM4a3VoRGhjZWY4TGxvSnp3VzZPZ0g2V3dKTGYrTUJ5RFVhNlU4?=
 =?utf-8?B?Znp6MzdaY2VQMXNyYzFFQXpKMUNhc1lscTVYKzdQeE5LYlV4OFNzYlVYYjI5?=
 =?utf-8?B?dXVQc01aNXB2YWpGWVZhMkRUSnRYWHlqK2JXR2xLeFpTZ2huN0xzdVkwaHpJ?=
 =?utf-8?B?M2RSMEkxaFErMUJHZmM0RzZwb2x0dVljUmZnUUdDWXJ2bGwwYVlXNTVBZHB5?=
 =?utf-8?B?Vm9kM3l6K3Y2YyttQjQzSkN6emhzTzdSRThQNmFFMzNEdmd3TW9QNEtUTkZn?=
 =?utf-8?B?NGlzVHBQS3lGa3ZmM1NzRmtieG5tL2Z3dFNFSGwzME5mdzNXbXY0UCtERmNV?=
 =?utf-8?B?S0lDQ295VWs3QkNSdk1hTzg3L1pzRVBkYlVrN25NeG1sejA2a2MwVkx3bC95?=
 =?utf-8?B?ZmQvRmJndUdwa0tBL2xsMlZzQjZSWHdGZHljUHNZakQzc3pPVDZySkhSMm5E?=
 =?utf-8?B?WGdxM1pncWNOWTI3TVN3bTlWZXdjcDAzZldHYmpOaDhud0ZXbWd1QUt2KzhL?=
 =?utf-8?B?ZUNabFlBMVpSbVBXclo2RFZjQmN0OUE2YzNMVUVGMEVPOElMaWVna1M3RzJn?=
 =?utf-8?B?S2lZK2IvYUZoS0pxU2ZQTHVlczFxZHpjdXdjY0UxZVFaUWNud1QvemlWMHR0?=
 =?utf-8?B?TENwejlpVjNqaWdJTEcyKytYVXUxTEplcVIvYUtPQTM3dnhUR2lKdjZYUlhI?=
 =?utf-8?B?ckNubmtlTFRIRjVJYzZPb0xyc2Nmb2UwbFBxRmZyaSs5TnNHN1l2ZkVTYWo5?=
 =?utf-8?B?TXFMMVdYT2gyUWhLaUliNnphTkFqMmdVZnBHaUllWC91Wk1lTk9XMW9laG93?=
 =?utf-8?B?VmNkSiswYWRUd0UxdUYwTDVrR3BLNmQ0SzRZNVRlWE8yckFrUGIxUitRNEJu?=
 =?utf-8?B?Z1dpckZ5Y2tKNnVUQkNnWlgzcVhzNzU1ODNXdjZTSkQ2Z2FsOXlDT2RsVUVv?=
 =?utf-8?B?WXgvMDM3ckNBVWtDVkxrTWtRdVFPc1doTWVuQkN3eWFDSndTdENNeXJoTGQ2?=
 =?utf-8?B?Q040eS9TVDNTYXJjek9IWkpCTGFWalRhb1pwbjJCUi94RzJZelVPV3diWkw1?=
 =?utf-8?B?b283dHNXYzI4aTlYdlR4SFVuU0xja2tMbk9FVlhtU3I5K0dINFFpdzJxWHBy?=
 =?utf-8?B?cTBpM0pDSEx2TzlUdVFVT2k5cVBaam51UHh5cnBveUdmbTNlNGxROTRLcjU1?=
 =?utf-8?B?cUZvQ3ZWcFc5elJLUk1BK1NZVk1DWnJlai90QWFkTXRXenJjNFVhWXdKVGEx?=
 =?utf-8?B?OGdDMWJmT0pRMzRSQzhnQ0F4ckx2M3pqVVZHSjJEMXpxcW1rSVl0bWQ4cklh?=
 =?utf-8?B?TXc1cUdlcUtOekxIV3loWFZ0RDhNM2FHZ2JRK2lUdzI2RERkcXBOZmFFd3lp?=
 =?utf-8?B?cjYwTVB0Mm04NWwvOGdGZXViaG5oSEFzK3hFdTRMUnVqN2VaV2tiSHdFTXMz?=
 =?utf-8?B?ZTU4RW1TUGgwcjNyTFJKNGJKa1dkYjBKUktBcmFzQklOdXlqcFhLQ0ZsM3Br?=
 =?utf-8?B?WkdPdEZoSDVxUVBuWDNUbFkzWndyc2pJZDBJekV3bURvQk5lcVVDL0VNOW5x?=
 =?utf-8?B?VDEwQjVpVm8reG9sazU4a09kY3Y4VUFkZXh1WHRxZUVyR0hiNVNCRWxSMG9O?=
 =?utf-8?B?K1N3bU1MLzArblU2blo3WS9DUmprNW03dnZTL2xKV0ozdkxRUnJ5cHhMUHNz?=
 =?utf-8?B?cTBvSklmNytFTFEwZkhJY2plMWI5cXlJUkJNejEzNFk5NEFxMDYxRE5Eb0M3?=
 =?utf-8?B?c21EeXR4NFZlQ3BtTHpzOWI1RHk4alZSWVpHOC9YNmFvWmk3Wkd0UkpsTEc4?=
 =?utf-8?B?R2JrcUVlcjBGTVFTL0FiZDdUbis4Rk1oQzAzMmVQMlNWM04wWGhQRzhhYXNV?=
 =?utf-8?B?RUNoMUVMNHhoVDdzTHZpc1JsSTJnVXdCc0ZHNFNqa2hkc2wxNFVEM2k4RnlN?=
 =?utf-8?B?TGFpS1Vic2pVMm9HbWw1NGFTWGo4MXN2ZkcyUGtydHdJT2c1V2U2K2hMcnY0?=
 =?utf-8?B?bCtBK0NvMWt3QzROc0xKWmtjUGNjNFVRK0t3aDRnWVhnaUlPK2lTNlZQdEdU?=
 =?utf-8?B?UUxMYTdubUduTFpRUE1QbHEzYXNrL3NyU1FVVDdsQzVuQmxPdVk4b0pWbmdO?=
 =?utf-8?B?TEp3VFVpM29zQ1M3TmdwTjdDaGxwQVZMdHJEaE5LZWZUa080c1pHd0Qvc2dK?=
 =?utf-8?B?eWE4MzVQK0crdEZzQUdTK0F5MWVZb2NMTGdhdXNHbUV4L1VMRG5iWmR4TGVP?=
 =?utf-8?Q?ij7wxvCYJzWnIIvSHD+Cj929QumrVyqdkp9S3Jce/Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f3d28c-c451-46f9-9636-08ddc5c08892
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 06:01:27.4217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbWa2lQFpHdZfsA7wJ+FgeRz2zYi/r/6uYC1gzXriW12vXo4f2AHhzVjhR4Ga3TEh2iSB0fYhWtdnqzuHvsUcLSQxNMErMc0TRGweUDtK2Oj/Bx8sSb4oCqWMjgwHqGT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5978
X-Proofpoint-GUID: nlRXeVUQ2dquJFJOne3vvHK6WuEgVue0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAwMiBTYWx0ZWRfX/ypJknrjA9wF
 B6h8c6Azp2y6xkBCpUSPfKTU3q14/+fECBpTWgd/finL/Sl9kh0afyYiiqn/z1bhl3MNetyFlLv
 B4d+R/qtdrWOj9F7m2Flur6a+MrXAmbU325rHK5LWDIVy4TpSHZS2PbKhshCbA45VBlDJFaXV7J
 RO6218puiDecmxUbqVjzH8aACGVUm7EHxDwtyC0B3yElns1pvbJJ5Fk3JSF6FyGXVXVozT1OsCq
 l/s8H34cmYQaNeKrx3nNKMwz/iNmNgDxqHAoPk1BbyQjr3EZHke/3PR8yBNQmkvsbPPK4FxHxSl
 M26l9p5OzJnkG7VocrEakyNWQtLDfQvShC6IAfCm+03K9ijxfwrxUIAzlDTse2AccLYOVmE9Tt0
 LaLZWSVx
X-Authority-Analysis: v=2.4 cv=MYVsu4/f c=1 sm=1 tr=0 ts=6879e33b cx=c_pps
 a=nbHxHWYZ5biEzOhcRz1Xag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=imG6kCGSrWMMMSDdI-QA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: nlRXeVUQ2dquJFJOne3vvHK6WuEgVue0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507180002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 06:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220576

Hi All,

Please don't take this patch. I will send a v2 with a new commit message 
that includes additional details about the test result deviation.

Regards,
Deepesh

On 17-07-2025 15:11, Deepesh.Varatharajan@windriver.com wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> $ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c17f827317bcf8544efefa65f13b5a079dc
> 6e489c17f8 Fix error reporting (false negatives) in SGID tests
> 11e634ccf3 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
> 61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_main (BZ 32981)
>
> Testing Results:
>             Before     After   Diff
> pass         5805      5809     +4
> xpass        4         4         0
> UNSUPPORTED  164       161      -3
> FAIL         282       261     -21
> XFAIL        16        16        0
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 2d31131e03..a2cfd0f308 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?= "release/2.41/master"
>   PV = "2.41+git"
> -SRCREV_glibc ?= "0c76c951620f9e12df2a89b2c684878b55bb6795"
> +SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
>   SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"

