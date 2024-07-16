Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701B6C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 10:00:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7342.1721124014778827466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 03:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79271bf3b2=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G4wirh015674
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 03:00:14 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40bmv0appn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 03:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2jhK2dtVjLZk3Uty/KNP9XpU27QQDKv/qOhreW/UpBeVZCKuPDQbo/acDf8CkSDn1Vzg7/LdmJR7C2rDHgmzgHt+Q2v2aqQRSxsc+5o66ia7LT5XkGZHmc9axXFrIuoODoG5SqMtb+IcHcMP9BRSI+tKLnVCI0mxcRN3KuDA8NivoVqMuFYeLTW8oqhHjQhZRGKCzWOEjMk4U4tmsqQWtQLoAho35My4W1npeUuZzBRGIihGD4NcdtdyKNWMZqKbbcdjrcR82P5izD8JQ5vyWdZeRVRV2DiPaT/2VE54/TkJovV1OIrj3AK6w9ZJP9HuDJChZ2KpLXZeDQXG0hFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zwWPpMOKU6DEz8/tEAxld0n3lpBMYTMLqcuFeZTDA0=;
 b=qZ8vc2xl/lUY5m6eKztcudjxNSDcEtsZ+YUpBsgngeafDhxJJMBOQKPFNPoOlK5AzpZyrBDHvyb0PQpLl00DkuqUFyBgMdH2YTjENE15rpv0Ll/YjdqpZRfmjzfssx9CR9KH3ib1JbOz/hbZHPSrAyotwWAsHoY4AfXPAjxB42/klLkH6l0otk72Wsqi31HS0lhXHw81rKiWiAlD77NgWh1Gy+oDsw0NFNGgDK5Rm8RuirN8fUrg1Jkp8xxyVNOHFhIdleARedChW2J5BFl+pLYLYiaEktKdRKL04r3LPucx9d/2NLAYT4GEUioOor7n45WRj7sYWKP2qUQK0kCscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB6289.namprd11.prod.outlook.com (2603:10b6:208:3e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 10:00:10 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 10:00:10 +0000
Content-Type: multipart/alternative;
 boundary="------------2STpHZ4oSl9Sw4Fa40hEXmFs"
Message-ID: <4cad678f-e3ef-4cbd-ba3e-bc13dd66dea5@windriver.com>
Date: Tue, 16 Jul 2024 18:00:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH] pixman: update patch for
 fixing inline failure with -Og
To: openembedded-core@lists.openembedded.org
References: <17E2A86D7AF261DF.18588@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17E2A86D7AF261DF.18588@lists.openembedded.org>
X-ClientProxiedBy: TYCPR01CA0162.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: f97f05a9-4411-4775-ce5d-08dca57e1429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cUEzS1RMcEQxeHU0SlNiYkxNbVk1M2MxS3gzWCt0RnV6cXVlNUlhdERuenBw?=
 =?utf-8?B?UkVkWENGK2VHNWRNUVJJcVlVejM1R2I2ZjJyTndOYzQrdDNpTzVrSFF3ZVhr?=
 =?utf-8?B?WWJnTXVLTlpwUTFORE9qNFBlTXhjaUozTHJJbnJWTTlKVXhmMUFHNnNQS2dL?=
 =?utf-8?B?cENadEw2d2FKRHVtUGJhZ2xBL3lPdzBlM1ZuOFdwbWtQZFZXbHlvUjNRcWtB?=
 =?utf-8?B?Rno1U3RtQ3NTeHhQMkRCbjM1MDJVOHFDWmU4K3cyaGhXcWswVXNWanpxTGps?=
 =?utf-8?B?cnoxNktIZ3Z1dzJ4L1Z3Ui92WDh4RWFiZGkwUFc0aHYyNjc2UWtyQmJZSVd4?=
 =?utf-8?B?WjNubmI1ZnRtV0owemxnSGtvcStrZU5MMGRZUEhlL2Z4T1JPaXdTQ253M0FN?=
 =?utf-8?B?QjJaMFAzOGlhNThxYnhLTldRc3NNUW81NndIZnVUNktZUGlTVUdCdmRGblNo?=
 =?utf-8?B?NVFydlhGZGx0ZS9PNVZsc0dVSm85bm9DY0V3MCtQUDBXa2o1L3dZY2k4S0JF?=
 =?utf-8?B?VUJzdGlUVEp6RldVWDlzZFpUMDU0dkRob0NVQUovL3JicE92ZGJROWdZSGov?=
 =?utf-8?B?cTJPSEV6VE5QQ1pDN3NUZFU4NkY5N05MVGl4d1NUcFhPTVJZaUZ1cGN5VGZr?=
 =?utf-8?B?UWdNRk1NQUtPazF0SnNjNlJWZWJvMjRNLzdxa2xNaHh4NTFMVVlHcEdXSkV0?=
 =?utf-8?B?RXA4UGVpWUppbG5EcStQS3FDZmkzWm42UlJtOWEyS0tSd0hjT1hFWjYxUk0x?=
 =?utf-8?B?dmg1djFYQy9PZlo5QUM2SXdSRVlUenZBODZyUHU0dVg0Zkc3S0xTYU9Gb2tX?=
 =?utf-8?B?Smw5VFFTN3BjbGYwRU1YMjgxN2ZNOXBZSDhqTkFITjFuYkd2V2J1WG9ZL1A4?=
 =?utf-8?B?cVlkSmFrK2VTZkVPcE9hL3ZEcVNCd2dRay9oZktySDhVaExlR1JqdG81Wldz?=
 =?utf-8?B?REtBd2hISUYxeE1wSDZaQmZjeVVKMEwyV0NocDdlQjBLdUFuZUxuTGVaS2ZZ?=
 =?utf-8?B?dEtwdG84TGFBd2FpY1dCM1FqcWd6MVVpTGhXYkVFdzB2YXBzUGVka0hIbTJw?=
 =?utf-8?B?OFBKWjIrOGlEaGhHY1NOTUpldHcwNy9oSThLR01nNW5aTEtaY2I2QWErbUo5?=
 =?utf-8?B?NU5JaVdlazZkd010amNtSHJVWHdNRnkvVW5jZGk5UW9pdUVwa1o5UEtIUFlP?=
 =?utf-8?B?VUdPQi9ub3k0cjdUMEcrV3htREYwbHNKMWxsV003OXNaTVUwclBxQjhFdGll?=
 =?utf-8?B?MHJvNG9jMHc0ZDJpZTkzWm5xQjVVK09TTkVybzBUSW9hYnRKMUdmY1VXUUR4?=
 =?utf-8?B?YmJwdnFJcFNFbGdsOVJyMUx2TlhwUmxQVXF4bWp5UmdwTlk1T2ljcnJySUtn?=
 =?utf-8?B?UTFOeHI5M0FoQmlZRzdnSjJpajNhU0xFM2oyWkNZTVhHbElsYmROSnJhbDVI?=
 =?utf-8?B?djJsRS9IY2dXZkNIUTZzb3YrTHBDM1RQdkZnZ1Y4Q0Jzcm9GK3BjZmFkQTgz?=
 =?utf-8?B?bE5uQlVTMGtRUHJISVdLSXRIZ3A3bDhiMUtHRzFkWUdPeWhOdHRpcjdNSTlm?=
 =?utf-8?B?OXZkQ0ZXck96VlNtVnVYMDdQeGYrRjMwb0o2YTlNa0NtbVd1VUU1K0MzMnhw?=
 =?utf-8?B?S3Q5cm4vc1ZkN1NwRm40bDJjcVdJTFYvZG1qclVhTHpKYVNmWGZGRkp3YlNC?=
 =?utf-8?B?VHB2WDhHNUlxWW90TXR3M2wxWGxkUXN0QjZuMDVHUFNYS0tkNGd5TWVFYUJY?=
 =?utf-8?Q?iHis28YZujHCwmbPeA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHQxRk02cERIZ0EyaGhOYjgwOWxwV3krNnE3bGlSQm9qUmMzdGxXckgralVJ?=
 =?utf-8?B?azlOTFRFR3VueTJFZUhFemJib1F5Z3I0S1RRN29RRmV3Z3NtN1JrSlVIZ0pR?=
 =?utf-8?B?VnJZZmhuNHdIRHJyQmFZeGtaTWdFelp0cGptSStKbkJtTmFvS0ZyOUkzOThQ?=
 =?utf-8?B?K2NpTEFzK3Y1ZFo4R0lQbGh1bnkvYlVReEQxQzNrS3A1YzlwLzJKRkxBRnNt?=
 =?utf-8?B?UytFNnZ6MlRoKzlmU3NPUnkrcy9TcDJqeUV6NGZjUGRReWlaaWJhREhXWUg2?=
 =?utf-8?B?SDdJMGdYSDNSVTJ4QXNBY0hkSUlJQTNwL2JvcHBsbTFia1dKVy9pTWlhRVNo?=
 =?utf-8?B?ZzRmcWFJN3hlSWVaSWJlb05Nb29TTTdMdTVOT1VOYlZwRGxEOHIrTllUS0ZM?=
 =?utf-8?B?Y0U0aUl4aU1pYms2d0NaZDVad1JsK3c5SU84Yzg1dFpxK1lHRTkxalQzSXFM?=
 =?utf-8?B?ZE0vZ1FpUWxwaVlrenRXeHgxcjFwQ3llenY1ZzJJZmIwTGwrTVRpbVVrTXU2?=
 =?utf-8?B?bFFYMFJQZlpxVUZjZm5yZzduV0YrNkErSGgvM0F4N1BQQXhMVTAvWDlxVTZh?=
 =?utf-8?B?WEV0QVV2b3hFM29LbityQ1VhTDBHNjVWeDJBaGdOcTZ4NHlyWnNETnIwM3A1?=
 =?utf-8?B?K3duRS9wdjFnQjJRTHVBWXp5WHJ6Z0JqdUZCaUIvenpxWWNNYVlEUEhnMy9o?=
 =?utf-8?B?T0Q3cnZWUm42WEVaZDM2NXpJQ2RWNXVHcW1zaHZkMFlIRURlMkJjWUQyenRU?=
 =?utf-8?B?ZVJHdVREUVpmTUwvV2R2MEI0TzJqT2NZL0Z0eXpTSEdPdUZTN2VCRm9sekdK?=
 =?utf-8?B?cmlJV1RSZmpzYXdVeWhkWHA4Q2NSNFVzNVRKWnl5dnNsWDdLVmRUSC81Sjlw?=
 =?utf-8?B?WnF2V0doMVBIKzRQZzIvZk1RUnlTb05YTEVPdHphZ2ZQSDNvUklJemc4Y2I0?=
 =?utf-8?B?RUszazNvbTVLOEQxc2lVNTFaRjhsMmlqc2loQU9rekVTa2hKNEovMEF4TjRn?=
 =?utf-8?B?emN0QjZCUW5CeDVsVHloeUJIbHlyTWFSNE1xUENMN2IrY2NyRm1Ba000V2tW?=
 =?utf-8?B?YldETE95ZTcwYU1NS0grT1RDR2tXRkF5NE9ndURscGUyM3g0ZEg0K1NTazBx?=
 =?utf-8?B?NFpHZDVUYjBrU3o5bkMyTHYvQ0JLSnhBVmg3aUcyUVgyL3BySExRcVFsbWNw?=
 =?utf-8?B?VkxnWmtGOWJpN0xYUmZVR3R2ZTdsbGlnaDJYODM1alV2L3p4eVpoRkFQejdx?=
 =?utf-8?B?OFhnK0ZrZUZBLy9YckUrN2VsV3dnWXdCbFE2OVZEaWh5cTRMb3VnSThOVXls?=
 =?utf-8?B?aDlSQVc2ODJCcHJXeC9tUWd6a2Z1SDBPano5RjkxbDl3VXdOV0psQUlhVjdJ?=
 =?utf-8?B?SE1oYWI1SzdHNTN6dkpsaExIUjRWS1dZejZ1RDBqOUYvNGZNYmg3ZmVYeHF1?=
 =?utf-8?B?ekZoYmlzd0x3NWxOdVZlOFhNTEpST1F5VWdHY3lJOEZHVEowcHJiN0lvamo4?=
 =?utf-8?B?RE1Wc3o3RFVPamVNM2ZiZXRQUnhua1hXMzkzTUVWMHVyODVKWFFqT1ZqWkpU?=
 =?utf-8?B?MUd4NG9veHllamVvblNJOTZoVi94TFNuODVBMXJhYnRLdnVhZXhVQTJxVisv?=
 =?utf-8?B?eTVsZFErUzFvS05Rbmc5Tk9tSGQ5SmkrOGFjQzZnNWdMRkFENEpNMkltVEpV?=
 =?utf-8?B?T00xVzRYTC9IdVNYL3B4VTJjVllCTU15ZEJqVkRLd0pBNGFuSUVUQ0VWRC9I?=
 =?utf-8?B?S1doMzM4Wll6SHkwcHlLQzk1Z3BPMzlXb3libU8wMnVJR2hXTGRQVUZTbDVq?=
 =?utf-8?B?eWJSSlZzK2FpdEhpbFNVMFR1OFMrQUFqcTkrSmN6Q3VPS2R2WSsrMnNjY3VS?=
 =?utf-8?B?dmh6dXM1QURYMXVaaVlPNURPZlA5UnFWNDhjU2JCZWRIaStQc1NKcHNLK2E1?=
 =?utf-8?B?Ukpub1ZEYmI2dFozcStrdk40eFJLaC9nbGZudXpzd3IxQzRNbktZUlBkSWtV?=
 =?utf-8?B?UkJ6ZllpM3RuQ2dxQ29QY0VXUXp5VGU4Y3V1TGJXL1p4ODRHSmw3RG8xbjNO?=
 =?utf-8?B?MXdNbk9xd3pwTkQ2aE5Lc09nR05aN3BNM2NiWFBheHRxa3UxUDRCVmplWDVB?=
 =?utf-8?B?OUZEOW5oaHJ3Q2dQdm85a2dWcFAxV3VjWWNwZzRvbUFDaW5FTWhzc2NsaHZ2?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97f05a9-4411-4775-ce5d-08dca57e1429
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 10:00:10.3885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ll4d3kahAEPWSYMA4G4w64Wmm1iwppszZ1Z+HFVOlMQTuIvmijpBGVxzpP9lcFgbB4AdGFQWKjfxLOPPzx/x/LK5sRMsQ5RnSIy23mNvZiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6289
X-Proofpoint-ORIG-GUID: oQGA7qlC0owGjH7_J_d5WmlJGqfzZjLN
X-Proofpoint-GUID: oQGA7qlC0owGjH7_J_d5WmlJGqfzZjLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407160072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 10:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202100

--------------2STpHZ4oSl9Sw4Fa40hEXmFs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46G4wirh015674

Please ignore this mail,=C2=A0 the patch will send out for scarthgap and=20
master separately.

On 7/16/24 17:46, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Previous patch works on fedora40 with gcc-14, but not works
> on ubuntu2004 with gcc-9. Update the patch to fix the do_compile
> failure:
>      In function =E2=80=98combine_inner=E2=80=99,
>          inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at =
../pixman-0.42.2/pixman/pixman-combine-float.c:655:1:
>      ../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlin=
ing failed in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_so=
ft_light_c=E2=80=99: function not
> considered for inlining
>        370 |     combine_ ## name ## _c (float sa, float s, float da, f=
loat d)
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   ...loat.c-fix-inlining-failed-in-call-t.patch | 56 ++++++++++++++++++=
+
>   ...float.c-replace-force_inline-with-__.patch | 36 ------------
>   .../xorg-lib/pixman_0.42.2.bb                 |  2 +-
>   3 files changed, 57 insertions(+), 37 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-=
combine-float.c-fix-inlining-failed-in-call-t.patch
>   delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-=
combine-float.c-replace-force_inline-with-__.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-=
float.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg-=
lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patc=
h
> new file mode 100644
> index 0000000000..5c79754e50
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c=
-fix-inlining-failed-in-call-t.patch
> @@ -0,0 +1,56 @@
> +From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 2001
> +From: Changqing Li<changqing.li@windriver.com>
> +Date: Tue, 16 Jul 2024 15:31:16 +0800
> +Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call t=
o
> + always_inline
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Refer [1], always-inline is not suggested to be used if you have indir=
ect
> +calls. so replace force_inline with inline to fix error:
> +In function =E2=80=98combine_inner=E2=80=99,
> +    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../p=
ixman/pixman-combine-float.c:655:511:
> +../pixman/pixman-combine-float.c:655:211: error: inlining failed in ca=
ll to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=
=99: function not considered for inlining
> +
> +[1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115679
> +
> +Upstream-Status: Submitted [https://www.mail-archive.com/pixman@lists.=
freedesktop.org/msg04812.html]
> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + pixman/pixman-combine-float.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-flo=
at.c
> +index f5145bc..f65eb5f 100644
> +--- a/pixman/pixman-combine-float.c
> ++++ b/pixman/pixman-combine-float.c
> +@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, flo=
at da)
> + }
> +
> + #define MAKE_PD_COMBINERS(name, a, b)					\
> +-    static float force_inline						\
> ++    static float inline						\
> +     pd_combine_ ## name (float sa, float s, float da, float d)		\
> +     {									\
> + 	const float fa =3D get_factor (a, sa, da);			\
> +@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor,		ONE_MINUS_DA_O=
VER_SA,		ONE_MINUS_SA_OVER_DA)
> +  */
> +
> + #define MAKE_SEPARABLE_PDF_COMBINERS(name)				\
> +-    static force_inline float						\
> ++    static inline float						\
> +     combine_ ## name ## _a (float sa, float s, float da, float d)	\
> +     {									\
> + 	return da + sa - da * sa;					\
> +     }									\
> +     									\
> +-    static force_inline float						\
> ++    static inline float						\
> +     combine_ ## name ## _c (float sa, float s, float da, float d)	\
> +     {									\
> + 	float f =3D (1 - sa) * d + (1 - da) * s;				\
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-=
float.c-replace-force_inline-with-__.patch b/meta/recipes-graphics/xorg-l=
ib/pixman/0001-pixman-combine-float.c-replace-force_inline-with-__.patch
> deleted file mode 100644
> index cae201629f..0000000000
> --- a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c=
-replace-force_inline-with-__.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 49a1644015d073829c17dcd977aab6fdda1ebdee Mon Sep 17 00:00:00 2001
> -From: Changqing Li<changqing.li@windriver.com>
> -Date: Fri, 5 Jul 2024 07:33:44 +0000
> -Subject: [PATCH] pixman-combine-float.c: replace force_inline with __i=
nline__
> -
> -Refer [1], always-inline is not suggested to be used if you have indir=
ect
> -calls. so replace force_inline with __inline__ to fix error:
> -In function =E2=80=98combine_inner=E2=80=99,
> -    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../p=
ixman/pixman-combine-float.c:655:511:
> -../pixman/pixman-combine-float.c:655:211: error: inlining failed in ca=
ll to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=
=99: function not considered for inlining
> -
> -[1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115679
> -
> -Upstream-Status: Submitted [https://www.mail-archive.com/pixman@lists.=
freedesktop.org/msg04812.html]
> -
> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ----
> - pixman/pixman-combine-float.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-flo=
at.c
> -index f5145bc..52400f4 100644
> ---- a/pixman/pixman-combine-float.c
> -+++ b/pixman/pixman-combine-float.c
> -@@ -44,7 +44,7 @@
> -
> - typedef float (* combine_channel_t) (float sa, float s, float da, flo=
at d);
> -
> --static force_inline void
> -+static __inline__ void
> - combine_inner (pixman_bool_t component,
> - 	       float *dest, const float *src, const float *mask, int n_pixel=
s,
> - 	       combine_channel_t combine_a, combine_channel_t combine_c)
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/rec=
ipes-graphics/xorg-lib/pixman_0.42.2.bb
> index 88eef50f7b..3c55c1705a 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
> @@ -9,7 +9,7 @@ DEPENDS =3D "zlib"
>  =20
>   SRC_URI =3D"https://www.cairographics.org/releases/${BP}.tar.gz \=20
> file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch=20
> \ -=20
> file://0001-pixman-combine-float.c-replace-force_inline-with-__.patch=20
> \ +=20
> file://0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch =
\ "
>   SRC_URI[sha256sum] =3D "ea1480efada2fd948bc75366f7c349e1c96d3297d09a3=
fe62626e38e234a625e"
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202095):https://lists.openembedded.org/g/openembedd=
ed-core/message/202095
> Mute This Topic:https://lists.openembedded.org/mt/107249094/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------2STpHZ4oSl9Sw4Fa40hEXmFs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46G4wirh015674

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p>Please ignore this mail,&nbsp; the patch will send out for scarthg=
ap
      and master <span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz C=
hMk0b"><span class=3D"ryNqvb">separately.</span></span></span></p>
    <div class=3D"moz-cite-prefix">On 7/16/24 17:46, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:17E2A86D7AF261DF.18588@lists.op=
enembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Changqing Li <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@windriver.com">&lt;ch=
angqing.li@windriver.com&gt;</a>

Previous patch works on fedora40 with gcc-14, but not works
on ubuntu2004 with gcc-9. Update the patch to fix the do_compile
failure:
    In function =E2=80=98combine_inner=E2=80=99,
        inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../=
pixman-0.42.2/pixman/pixman-combine-float.c:655:1:
    ../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlining=
 failed in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_=
light_c=E2=80=99: function not
considered for inlining
      370 |     combine_ ## name ## _c (float sa, float s, float da, floa=
t d)

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...loat.c-fix-inlining-failed-in-call-t.patch | 56 +++++++++++++++++++
 ...float.c-replace-force_inline-with-__.patch | 36 ------------
 .../xorg-lib/pixman_0.42.2.bb                 |  2 +-
 3 files changed, 57 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-com=
bine-float.c-fix-inlining-failed-in-call-t.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-com=
bine-float.c-replace-force_inline-with-__.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-fl=
oat.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg-li=
b/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
new file mode 100644
index 0000000000..5c79754e50
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-f=
ix-inlining-failed-in-call-t.patch
@@ -0,0 +1,56 @@
+From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Tue, 16 Jul 2024 15:31:16 +0800
+Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call to
+ always_inline
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Refer [1], always-inline is not suggested to be used if you have indirec=
t
+calls. so replace force_inline with inline to fix error:
+In function =E2=80=98combine_inner=E2=80=99,
+    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pix=
man/pixman-combine-float.c:655:511:
+../pixman/pixman-combine-float.c:655:211: error: inlining failed in call=
 to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=99=
: function not considered for inlining
+
+[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzi=
lla/show_bug.cgi?id=3D115679">https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D115679</a>
+
+Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html">h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html</a=
>]
+
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ pixman/pixman-combine-float.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float=
.c
+index f5145bc..f65eb5f 100644
+--- a/pixman/pixman-combine-float.c
++++ b/pixman/pixman-combine-float.c
+@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, float=
 da)
+ }
+=20
+ #define MAKE_PD_COMBINERS(name, a, b)					\
+-    static float force_inline						\
++    static float inline						\
+     pd_combine_ ## name (float sa, float s, float da, float d)		\
+     {									\
+ 	const float fa =3D get_factor (a, sa, da);			\
+@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor,		ONE_MINUS_DA_OVE=
R_SA,		ONE_MINUS_SA_OVER_DA)
+  */
+=20
+ #define MAKE_SEPARABLE_PDF_COMBINERS(name)				\
+-    static force_inline float						\
++    static inline float						\
+     combine_ ## name ## _a (float sa, float s, float da, float d)	\
+     {									\
+ 	return da + sa - da * sa;					\
+     }									\
+     									\
+-    static force_inline float						\
++    static inline float						\
+     combine_ ## name ## _c (float sa, float s, float da, float d)	\
+     {									\
+ 	float f =3D (1 - sa) * d + (1 - da) * s;				\
+--=20
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-fl=
oat.c-replace-force_inline-with-__.patch b/meta/recipes-graphics/xorg-lib=
/pixman/0001-pixman-combine-float.c-replace-force_inline-with-__.patch
deleted file mode 100644
index cae201629f..0000000000
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-r=
eplace-force_inline-with-__.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 49a1644015d073829c17dcd977aab6fdda1ebdee Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Fri, 5 Jul 2024 07:33:44 +0000
-Subject: [PATCH] pixman-combine-float.c: replace force_inline with __inl=
ine__
-   =20
-Refer [1], always-inline is not suggested to be used if you have indirec=
t
-calls. so replace force_inline with __inline__ to fix error:
-In function =E2=80=98combine_inner=E2=80=99,
-    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pix=
man/pixman-combine-float.c:655:511:
-../pixman/pixman-combine-float.c:655:211: error: inlining failed in call=
 to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=99=
: function not considered for inlining
-
-[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzi=
lla/show_bug.cgi?id=3D115679">https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D115679</a>
-
-Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html">h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html</a=
>]
-
-Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- pixman/pixman-combine-float.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float=
.c
-index f5145bc..52400f4 100644
---- a/pixman/pixman-combine-float.c
-+++ b/pixman/pixman-combine-float.c
-@@ -44,7 +44,7 @@
-=20
- typedef float (* combine_channel_t) (float sa, float s, float da, float=
 d);
-=20
--static force_inline void
-+static __inline__ void
- combine_inner (pixman_bool_t component,
- 	       float *dest, const float *src, const float *mask, int n_pixels,
- 	       combine_channel_t combine_a, combine_channel_t combine_c)
---=20
-2.44.0
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.42.2.bb
index 88eef50f7b..3c55c1705a 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -9,7 +9,7 @@ DEPENDS =3D &quot;zlib&quot;
=20
 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://www.cairo=
graphics.org/releases/${BP}.tar.gz\file://0001-ARM-qemu-related-workaroun=
ds-in-cpu-features-detecti.patch\-file://0001-pixman-combine-float.c-repl=
ace-force_inline-with-__.patch\+file://0001-pixman-combine-float.c-fix-in=
lining-failed-in-call-t.patch\">&quot;https://www.cairographics.org/relea=
ses/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-dete=
cti.patch \
-           file://0001-pixman-combine-float.c-replace-force_inline-with-=
__.patch \
+           file://0001-pixman-combine-float.c-fix-inlining-failed-in-cal=
l-t.patch \
            &quot;</a>
 SRC_URI[sha256sum] =3D &quot;ea1480efada2fd948bc75366f7c349e1c96d3297d09=
a3fe62626e38e234a625e&quot;
=20
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#202095): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/202095">https:/=
/lists.openembedded.org/g/openembedded-core/message/202095</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107249094/3616873">https://lists.openembedded.org/mt=
/107249094/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------2STpHZ4oSl9Sw4Fa40hEXmFs--

