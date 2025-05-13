Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B05DC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 09:37:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.72515.1747129055007824663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 02:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=722888789e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D4RAHw007378
	for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 02:37:34 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46j6ajthgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 02:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oApOWov5inJ9zkUeKiXNzgLICXJlZChLXNXlNku9AGtGwXWrgoyC+EZ0QFljjMleq1v3SI6uKqcU343bJEtYQ/n3d0jCdDF5RMFzOHh9djnAP0d6UQEeXb52mND+bdmd+YMwAqSrJP44QqfeavnRpHoTVtfhGyO8/Hx9JYW4uQoyEuKu4jLULBCEyw3PvfzKLS8quEGtjPBYjSmor7IV/HuJHnIbWEw/e3CzlInSNMCtfYhYjylMmGDdFsttFQ+D8G201HgWZsy798OgjKzaPgn+4S7TZSSI9x2sTgW9j6zCHZNJPbkKULJHn4yDCd4tH2WA0XZeNiKCra2YP/9Deg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKeeRx1yvzsJybD2NeX5dJcnkbaUj68ASpZjtm9WMlQ=;
 b=RdSgASPm78MEoUm0lnzdEZyVwx2w9QDKKGBLf9i2N79KNL73JdDE60vA66n8aBsvunrNeh0YuWsmGmVggYWvRViMirDOhPeCAe2XnGuAOk5iStjcllVOdeOqr6AWbaW1Lo6tIs0PHWiWCTC/dflgjxj5UXvNEP+RpD86A4pob2sJcY0JcbAwbzRAD/4Hn8MEj/r4Qa8aRBazyf0+uUie4N2ofl0/BoWeT7xR7fjwoC2dMdBKVFCx5JXs7s/02iqBBz5XSgkyCkSMkOiOFR/QvC5JAkz0oZ/kbBEFLKGCkg2EXff0ai1BKiMQWv9zWKBZQOME5lbbO8UypP8NrZ5XXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) by
 CH3PR11MB8561.namprd11.prod.outlook.com (2603:10b6:610:1ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 09:37:30 +0000
Received: from DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7]) by DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 09:37:30 +0000
Message-ID: <cd85a9a1-4330-47c9-b6ef-beed7e793298@windriver.com>
Date: Tue, 13 May 2025 15:07:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: re-enable the unit tests that are previously
 ignored
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250513093208.2326563-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <20250513093208.2326563-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::27) To DM8PR11MB5637.namprd11.prod.outlook.com
 (2603:10b6:8:33::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5637:EE_|CH3PR11MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0c0c37-91b8-4c46-ed45-08dd9201c77a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZFFseTBGdTUrem9jZmhBN0NKVGF4OGxzY282MzFjWVRLVVVHRmVWcWVBK2U0?=
 =?utf-8?B?c1FQdEFsdjEza213SEpRRVNGTXpLT2k2YjNTZ09CMEtpUkhXMm44WC9GQUIw?=
 =?utf-8?B?cDBmOGRDRFBUTFlWMVFFazcvdm9UQlphd2tWNWl1aEduNUFWT3hIV0psaUFm?=
 =?utf-8?B?S2ZLMm1sS0puWVdVMDU2OVVWR0tGeTZpVmVXNU1FSmhrVWFZMGhOK2tuYXlH?=
 =?utf-8?B?cXAvYjNWRVE2anExZkJydFNxV2ZaL2UyWmRkSWpmbWJRMjA0UTZ1OGFjbGFO?=
 =?utf-8?B?ZGtQeUI2QVNmU0J1TmJ4YUxDb1pOcWlXMVFERVI1ODd6cVRrdng3QkpvYXZl?=
 =?utf-8?B?cG00d0Y4aDhOTlNVSkFhQ3g2WEt6T2dkL20vQjJ3SS84VW5yVExwd1Nlbkhk?=
 =?utf-8?B?Uk9ObzhYZmRUSldpcm55b0VBd2x4MitQVnQycEFqYk9XaVRMUG4vdTJ2Sjlt?=
 =?utf-8?B?UVhnMWowL2cxUzRFZDVCeHNERXVxcHFrL0tTbmNuMHNvOVZvZjdtVS9CdTB4?=
 =?utf-8?B?dm9ZcVZVdk5SVnB1eW1hV2g2SWM3QURnTDlycVBTY0NKdjJwT3NhT3JVZXBG?=
 =?utf-8?B?ZkFxcTJHcjZvbVFSbXJmaUtueEFIYWlVYkY0dGFkSTZYSU41Wk9qUlY0bnJj?=
 =?utf-8?B?VGF2YlV0WmRodkF6by8xbE9ZckFENlpGY2cydjdRbmx5WExrUnJBOVNUV2hZ?=
 =?utf-8?B?RTN0SFRVRVg1bW5MZytUSXFQZW5pQ1QzWVJBSldDUTdsZngvMk1EOVBLV0N4?=
 =?utf-8?B?UUhzVmNGR2Q1akp1TU9KRjk4Y2FvYWgxeVRFMldhaStDeExqeVpKbVBiL1lE?=
 =?utf-8?B?N0RRUVdVSkNoNFRhVEtiZXYrSnpsWjhCRDJ2U3NQV0RYYWxxcjRUTXdXZ29N?=
 =?utf-8?B?aCtVdHd0eFgxOVI3ZU5LbHYwYlJoVFlyNVY1aVNlTllWWS9vRm16ak5kQVVG?=
 =?utf-8?B?ZHNPZDAya3V4dnlldnA5MWN5Y29aWVBPSjBWeTlXbWkvSitKalJBejB4cFoy?=
 =?utf-8?B?Z094ZmlVT3J3bnhhN081ckdocjdyNmJQUkg1OGVxT0ozSTB0QjhEd25iR0pV?=
 =?utf-8?B?dUYyZGZGVkl3SEV4QWFueU1vM2lyNGpvbEsyUDYwcVVZL0VrTGdPeTdmOFBh?=
 =?utf-8?B?djZxb28rZXFMSXNDUTcrWFNGeG5ONi95Zkt6VTBCNElkdWN2YktzelNkUjhh?=
 =?utf-8?B?M3BKOTg2ME9WS2pkRUVMd25MR0ZwWVBHcnY0U1pnVDJEbC9KMzhjZVRhc0FG?=
 =?utf-8?B?Z2NwTzBzbXkrTVJveUFBeHV4a28zSjcvRkZZRWJXVkdrL21SZVh2dlJBcE5m?=
 =?utf-8?B?Q2xzNGJiVEl5cml1ckJhOExXZi90dG5uTy9BazZZazFyVmZtYVZBVWJ0enFj?=
 =?utf-8?B?dDBNcXBPTlhacldPZVlZYUFDZUsvcld1Nk5Tald3MVFVWVk4eWN5RzRkenhs?=
 =?utf-8?B?OS9qTHhaSGhYUm5YejJVeEZoTUhPaFErUkM3bVFVTGNFUHpnOWd4RHZJelA3?=
 =?utf-8?B?cFNVMStlTm5VRkpOeVppWS8ycDFwODQ0SU1SSDdIT3NlcWFla2lMRHFVellr?=
 =?utf-8?B?d1VaS0ZialkydWoyaHFHNE5YZHRWVVBtQWlySFdKWkdxMmd6RkhPY2VCUTZm?=
 =?utf-8?B?UDFsVzdxaWx5UE9RQm5TZEF1OWdMRWVYUEEvVlc5MmNGckFKeThERWVIVTk2?=
 =?utf-8?B?SktQMEI1dEh4V2JXVlBMV2F1eHNLRVFmQmxCcm5NckRXNVZCZXJjSkVXcXNY?=
 =?utf-8?B?Z0NuMERTYmFBMTNYRVBiUm16b3Yxc1ZhMmNuYVlOcWErZEhiK2pTM2pSbFFW?=
 =?utf-8?B?REl1YWwwaTZHQjE3cjVzZDJtRnhDWVpSSTZwcWhrdmgveTBjRmlraXRqLy9p?=
 =?utf-8?B?WkVWeHl2WFE5eUtWVmphZU1GWSs3ZW1oWm1KUkRyRFZBdnc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5637.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzZjM2JYTkREUW1RZU9Da2JtS1JIUUptVUFVMG5RSHoyaWRBZUdrU2JkT3JG?=
 =?utf-8?B?dHd2d0U2QWZyalFVNHJUUy92QmpEQ3ZxbWF6blpBb1QvSFhRSTB4QjJ3Q2k4?=
 =?utf-8?B?U3J1Y0gzWmRGT0MrWnd4TCtxUTFTWDN5b3QycGhXNmd1OG5hbXNqSi9iMWdV?=
 =?utf-8?B?QTNRVytEY0J4YXlFYlU0ejNQM2V6RTBVanlFczhmZHdkMXI2MkZXcDBmc0JS?=
 =?utf-8?B?UWRuU3FScjR6SUtvdFVUWFNZZmRTT0loSVdLSnk3QkNjdjFoekVHQ3J6dGo4?=
 =?utf-8?B?aWN0WDUvVHpCWVFvYTIzRStabldxcWcrMjdCOGJpbTVkYlJNQmgyc29taHU1?=
 =?utf-8?B?U0YrZ0ZCNFEzVHowYUtZQVFob0o0MHFTbGRUbnZlYkNBT20zSWo5Z0hJcUdC?=
 =?utf-8?B?Q1E2U0lRZnk2NjU3Mk43b2tFbkE3VVlFbDZ4OG13UWNjTERqaEo1UmhZNFBX?=
 =?utf-8?B?dFNnTjducnlNMjlUL0RZL1lRK3g3Ly9TRFlXenR6TG9yc0pNaUlnNExuSkMy?=
 =?utf-8?B?dW11cVJoaUxMR0xqQ3Y2c2JxTnhZdHVnby9YeWFpbjA1MmFPRFpkS2tBamVN?=
 =?utf-8?B?ZVErS0tXczZKaHM5c2xZL3M1ejdkOUlBUWtkRlZ1Vnozdlh2TkdWNjdBT1lp?=
 =?utf-8?B?V1RLZE95RmNROWhvZWhPYm5pRFZsVGlsLzJDTlNJb0tuZnhPbXpWbUNqSDlF?=
 =?utf-8?B?YUVzcExJT3JKVzJEVnUybDAreENNSGxPYTUzWVM1YUJnOTY4eTRZdUdZNjdL?=
 =?utf-8?B?bk5rNHA4V2ZrYkdNbVJ5YVlIZ240eUJGSVgwUGdodnNzeDlDdlNyWGZGR1ZH?=
 =?utf-8?B?Rm9YL2szNXNFNWxUUWRqK3JDQ1BKd3NFQ0ljdHRhL09wQUtraWpGc09Kc2Zt?=
 =?utf-8?B?OUI3UnJtMjd3L1UxdURVRUUrS0xwMndBeEw2cXF1Q3ZVclJXcVkzbjdjWklR?=
 =?utf-8?B?NGVEODZXWEprVVJUM2g4SnRxcEludGorTnlQSGpzN0NTUVBMSERxcVVBYWlm?=
 =?utf-8?B?bWRRakJSa09GMlZuYnNHT0lvNVVxVjgvVUJySGh0bGozdDdvQjBPZVphN3My?=
 =?utf-8?B?U3NWOEtadCsxUVk0Y1dLeXNpS25Nb3k2SFBjTG5FS1c1OXhTbHc1cHdtQkFS?=
 =?utf-8?B?VzJyR0FDUzNuazBiQUpnK04zdktkQTZUWlJQSHp2SmZ5dFlvdHg3QThQK1l4?=
 =?utf-8?B?WWtVNFNPWUN2OU50YWVscUd5U01JOWc4NTl4bG1TTDBLMm55bjcxR0pFdm83?=
 =?utf-8?B?c3pXc1ZSQnVpRVBMcU5CbENxdzBZNzBGZjY0NVpnQ3Z0YThtQlRGVjc2blVx?=
 =?utf-8?B?N3BlUEsvYUZlSnRveldYTVZVL2JDdW9jZGd4TXJYRFFNeWJuVHJTMlZGTmJs?=
 =?utf-8?B?UmpXYmtXUVdSN3JlOXRqZkltNjVXNXhiU29LN0pkNVNXaHRoMGFGckFpMzhZ?=
 =?utf-8?B?RU1sWmN0aG8wT1RXWGFnNWNYTFZjOWpDcW5SQ1p4YS9ZV0ZJYTRkRXZuZS9E?=
 =?utf-8?B?Z1BTc0hwQ0lIN3Q3T3FhKzJ2OVhkVS9sYzVLdVlHQnFzM2kza2t1ZWw3OTcy?=
 =?utf-8?B?S1V6NnIxMVJTWGdLQmZJQzk5UzNSY24vTkQ2MitJWFdVQjl3TU43enR3a3BI?=
 =?utf-8?B?eU15YkE0Ti9FMGtPZnlWNm52THhOcmE5RUhnZGdLTk1nWDVobWxuVlBYL3pT?=
 =?utf-8?B?d0dXbTJqcFZSTTN0c3FhV0t0c2E5U2NVM2ZGaWhHZUNsVisvVzQ3RndTcE16?=
 =?utf-8?B?cGpvOUJZU3dNMUs0MlJZcTlWMlpzQ2drbDY3MCtINkJ1LzFpTldvUVJlN2lV?=
 =?utf-8?B?bUdlOHNRUzBMZ0tSZzEwZDlQZXZTcXRmTWtnTkl6b3RYeDNaU21scmxYOGJM?=
 =?utf-8?B?M3ZJRW5oVGw0dnpBR2gyR0dtQ2I4UjRBYU5hRzBqQ09ibURZaXhNNTBuNThy?=
 =?utf-8?B?eEhrKzJIeFZ3VkpIWjYva2pZOElSQmN2WEYrbXlhcytUUjlDU050cjI5cUNT?=
 =?utf-8?B?d2d6Vlp2MlB2WnJvMTh2eHFTV1hZS0NIdjQwMU93VTRNdVBOYjRQM1FLNFlH?=
 =?utf-8?B?RTVJcU5yOS9ReFdxalg5WURrc3d6a2ZLdTVYbGEvYlBmNHVjVkQvYjNxajYr?=
 =?utf-8?B?T2lRMGxEcjZvTGZqbm5rTUJXMmNMRG9xVlVjODFzVktTWURtdTN1QlRGSjlC?=
 =?utf-8?Q?Kts6IWZ5NywUt7fn34bOaSk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0c0c37-91b8-4c46-ed45-08dd9201c77a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 09:37:30.1185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cwie6ZaspH7wN+UTeGydTOiDcDLLm6H6eZd5pD0P0/pPykpDfymh0DcPB+zQQRZR5Tu/rifSBVS5CXs4WnAKfa8floB4y/xIIPQ0tw6BH7331bLTInMhVgAqotnOTFP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8561
X-Proofpoint-ORIG-GUID: SNx7eBnUy5xdRvKcW-2L6pAN4ud0K0CL
X-Authority-Analysis: v=2.4 cv=c8irQQ9l c=1 sm=1 tr=0 ts=682312de cx=c_pps a=OxY2RB2sa7x8oI2LU21LDQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=t89akqHKnIEYaKz8j0wA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5MSBTYWx0ZWRfX+2fCW9H/hgEL Cy+rVxh6wj1eHNeW1OF1H+vMkQ/oYUDvCQIryrllYu6fmlM4kmsmCNOTlYXSNWJEeajzCE9t3Te x+6USAgaae+jepWy/EcGgxQ9oMw7WJ44Mntc92xQWPpFe9KdbOCvwO1F18lO5a46shzjb5FGOP5
 GBgpiH4egrRPxBHK8ajlaDnUqU8H7IXRzzuAhm5AObTsCVOBM3U1o4CGgqTYqPkvOJ6kkx1G8Xz CpgQTtpeOZNpr3AsedR4zwZunrgSRJxdpYREMADyblYFovAFyMWuAyqfd0e57bYghYq6IJZuVNb I2jJWYCe3Xt1y/dTCMO3+jxjVwwPl4NwXBhfBOG04yH/Znb7ArSvGstq8RsG1jjX9CRThYW6vm0
 QZRidjgWZvSi8qbl4TOV/oOvLLVCsuZ9RACz2LEvj2BXqDExT0pbGb+zzApMkX86ISUC7RPY
X-Proofpoint-GUID: SNx7eBnUy5xdRvKcW-2L6pAN4ud0K0CL
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 mlxlogscore=985 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505130091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 09:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216407

Hi All,

Rust oe-selftest ran with these unit tests were re-enabled and executed 
successfully on x86_64 , x86 , arm, arm64 and ppc architectures.

Regards,
Deepesh

On 13-05-2025 15:02, Deepesh.Varatharajan@windriver.com wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Some unit tests were previously marked as ignored due to failures in earlier
> versions of Rust. With the upgrade to Rust 1.85.1, these tests are now passing
> consistently. They've been re-enabled and verified to run successfully on the
> latest version.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>   .../rust/files/rust-oe-selftest.patch         | 44 -------------------
>   1 file changed, 44 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> index 909bc971db..048fc3f10b 100644
> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> @@ -103,50 +103,6 @@ index 1a9d3d3f12f..0a9cfc48806 100644
>    fn test_get_mut_poison() {
>        let mut m = new_poisoned_rwlock(NonCopy(10));
>   
> -diff --git a/library/std/src/thread/tests.rs b/library/std/src/thread/tests.rs
> -index 5d6b9e94ee9..a5aacb2eb87 100644
> ---- a/library/std/src/thread/tests.rs
> -+++ b/library/std/src/thread/tests.rs
> -@@ -116,6 +116,7 @@ fn test_is_finished() {
> - }
> -
> - #[test]
> -+#[ignore]
> - fn test_join_panic() {
> -     match thread::spawn(move || panic!()).join() {
> -         result::Result::Err(_) => (),
> -@@ -218,6 +219,7 @@ fn test_simple_newsched_spawn() {
> - }
> -
> - #[test]
> -+#[ignore]
> - fn test_try_panic_message_string_literal() {
> -     match thread::spawn(move || {
> -         panic!("static string");
> -@@ -234,6 +236,7 @@ fn test_try_panic_message_string_literal() {
> - }
> -
> - #[test]
> -+#[ignore]
> - fn test_try_panic_any_message_owned_str() {
> -     match thread::spawn(move || {
> -         panic_any("owned string".to_string());
> -@@ -250,6 +253,7 @@ fn test_try_panic_any_message_owned_str() {
> - }
> -
> - #[test]
> -+#[ignore]
> - fn test_try_panic_any_message_any() {
> -     match thread::spawn(move || {
> -         panic_any(Box::new(413u16) as Box<dyn Any + Send>);
> -@@ -268,6 +272,7 @@ fn test_try_panic_any_message_any() {
> - }
> -
> - #[test]
> -+#[ignore]
> - fn test_try_panic_any_message_unit_struct() {
> -     struct Juju;
> -
>   diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
>   --- a/library/test/src/tests.rs
>   +++ b/library/test/src/tests.rs

