Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800EFD5CCB3
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 14:25:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16117.1730298306462434177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1033a82d09=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U69S3Y032358
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 07:25:06 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42guq3vvcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 07:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xr7h39i0PJ59Y1ecFOF1IDrDr4pOZz9NAqBDQgfAy9lX9nim6AR8knLQBmhb1wxA1E3YMnxmt2XFkkReoNSdCIrsjMMWN7czDz0ESzaHn9edN+oY8IrhalEw7MTgG7qWWkniFC9+2jJhodCBQ0Z2Od3cBJXZS2GT01U/T/9PRBXjZ83ankOM60IH1SdchvvpcqKA2tf56IKO0kXy/FxepIvXHPML1fXswZZocTXGIj+T7p+OTetW5rawxe8lqdG/m4ArQZVkbSLnadog2jqRbhfaAin/rQ0+tdHLBn/A98OKQ8565AbAUHoqCeb+ppWGxeJLMRa4KXxrV1Od9uYPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIji0gXEIjEfY20TE15ucUCsG6zBoE61Tb/f72LB8uI=;
 b=Wd1CUcSe6ihKq4E0jahAnybgl4uWjOiokAMO1WRlBnm4jTs5mMXBgI2xgXc9AvEJnu5uJmpyuGsykTD6oEoR3Ws2/tmxD9hjI/tvASRi6N5K0/1pVzSTFKeRsJHRSGxNHGpRG92MGOAGPZ1voQAHfktyMc6KcCSaC+tQkvhcr0+kPJ3db8wW1tbKMT303L9BWbbStIQVbZoeQ2WDPqSaR+Ak8fFJydA+Eo/UVAmjN2d9hhXwGDXt9lVhwKJbAARPX74c7pIkTk99CX8ADzd7hsUE1wmMr83pfBDFbA/DnxKoxmvMWjibpx8kskKfFBkDg/ZTaNTlUAQwQAor2LO7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB4920.namprd11.prod.outlook.com (2603:10b6:510:41::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 14:24:57 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 14:24:56 +0000
Content-Type: multipart/alternative;
 boundary="------------CuHxcuzbLLGb00JLBJSD7h7G"
Message-ID: <90fa600f-7b0a-4dc6-a58a-90997995ce86@windriver.com>
Date: Wed, 30 Oct 2024 10:24:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cargo: Increase RUST_MIN_STACK size to avoid SIGSEGV in
 DEBUG builds only.
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241030111601.284064-1-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20241030111601.284064-1-Yash.Shinde@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f88639-3d45-415c-cda2-08dcf8eea105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZFIyc2lKWFFJRE5uSUc4eTV4MzFoUUFWRWZTd25yS1FFWXF2YnVrdGtDa2xk?=
 =?utf-8?B?UkZuanJSTjl2M0M3SjFsUWdYelFhMUZ1R24rSDRTV0dDbm5MZGpra1JkNS9P?=
 =?utf-8?B?RUo1Z3crbDBjWDZpZmREWTRyWWdUUlJ2ektJTDRNVXJlMVAxM1pQdVBZaSt2?=
 =?utf-8?B?TndHQXFqVGcvcjNpV3pGNXZiQ3crWWpyL2o3ejl0V2pGRVBHcm14eVY3c0N0?=
 =?utf-8?B?NFNBV2YwSGx4NDJ3anRHRkM0UVFudjREcndrVUNmcmZvaXF3cWlFd3RVUjNN?=
 =?utf-8?B?aEI1aTYxcDFDOS9VeFk5dTA0L1JFSVhyaEFIRndxQXN1SngzM0V2c2pOYVpF?=
 =?utf-8?B?VGdUTG00ZXhnMXVjcnZJMjB3OW1Sc0F4M3p5SUxaTWZPaGhZN3VmM1hRVnhM?=
 =?utf-8?B?dHp3RDJDUm0wQlhmVk5UU2Qxc21MTUFWMHlYeUg5ME5DMVU0c1V4V0h3MDF4?=
 =?utf-8?B?M2g2Vnd0SVJ1Z2pUNFU4Qm1WUVhicElaanYvakQ4ajNJbHQ4cW1yMnRVRm1Y?=
 =?utf-8?B?Mm4wOVVTWnoyL2dxUFlBWWxUM1BWSkJFVXI4MzUyaVRGeWU3SkN1aEQyYm9D?=
 =?utf-8?B?bTAzbTFjemxuVW9aVkJ2RmhRYXdDeGc5K1I4UURiRFhyUXk4WU9ZSERXWWVD?=
 =?utf-8?B?bUpOUzUxMVVEVVhsYUlZd0ZYcjVMYmRkWHAzUzdGZmZzU0duMUl0bTdHR3d0?=
 =?utf-8?B?bUNJSCtiZHdYS0svNkpKMURPVXp4T0RpU2ViVmRodzBrRGxCUEhkNkRSbFV3?=
 =?utf-8?B?Y3dyV2lKODdvQlVmYmkyUCtPN29ab2RuQ0JMUFNYREdWUS82TE9NbnhSZHZp?=
 =?utf-8?B?NWdIMGN2Z2pHNDhFa1dycHc5S2YvSEhhbDhBTDdIYnJGaVVhelRsQ1U2alVk?=
 =?utf-8?B?VlBvSWEzQ0xsR2dydGJCSVQ1UEh4MGdtOXRWOTJMU1hOdlhUOTdiSU11N3gw?=
 =?utf-8?B?STRwMTY3NmRZYnJ2YXhZcGhYUGx1YmlsZjl4RFVRRmdWbkNiZ25SQTBuaUpY?=
 =?utf-8?B?K3pIdmU0QWd1RU9uUHdFV2VreTQxc1JDYTRyNlFMZ0tDSDAvWnMvQkQrUWRC?=
 =?utf-8?B?L3NkVndoRzZvOUEycDl0ZUxLQ3R3Q3NVTUVHNTIyOGxEUkcrbXhlWU9WQ3pO?=
 =?utf-8?B?NFlGbkswS2lqM3NuQmFDcUl1M1JPUHM0YzFOdStjZTZXdTF5NURpWU5SckZj?=
 =?utf-8?B?V08vWWE2dmNxYTV3NloyMm9wN3FaSWhiS2VYenM3b05MVmtNVENPSUtZN2Ew?=
 =?utf-8?B?bDRja0ZLc2cyS3J5amowQm1DblN3eEt5TmhJSjhHWE95NmpYOVQybWRKeVN0?=
 =?utf-8?B?enNjS3hwTkdZalBFNHFmVktnZ1ZFQWZoUmo3YjZOVGk0b25QYjZBNmNuUkpU?=
 =?utf-8?B?TjVNVnp0aktaekFZL1kzcnNWNTJRNXRYc28xM1psUE9QZE9Xd2VLYlcydUlD?=
 =?utf-8?B?aFhWWUQwU1NFeWpFWlVpQlhTUEt0MEIweFdnQ0YrMWpYRDZ0Mi9uWmxwRUdk?=
 =?utf-8?B?WXZDWm1vd3FxRHpGalFaeHNvenc4NXl6T2thYkhpTDJiNFFCMFhPSDVmRnlz?=
 =?utf-8?B?MmJnaUNlczR6L3lkYmhBdm1VQ2NncGlLVFQ0cUNESWxLZnZVbjN4VUo4NU1R?=
 =?utf-8?B?RXdNTTdrZlEzajBTMFlMcU55R1h0aU5obzRSM3ZDb0gvQ1JCbm9lU3ZFdmIx?=
 =?utf-8?B?VStWbENFRkpCK0pZeEgrUkFNSnRCTHdjVUR1bjBGUG5KbEtGVTdvMk5RPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1VFUGg3QVhPQSt0T2xEdWk2SUxHMlN4cWhHSXU5TTV5RTFaSzZkLzZXbkR5?=
 =?utf-8?B?M1QvcVIvZ0JPMk84VTIxUzZhdGI2OEthNFplekN3UXo3Tk5jY0xGcUFteGlG?=
 =?utf-8?B?ekZzMll2WG1mWENYaDJFNkJZRndmV1ZybFZtbGJYVEQ3UE81Z1VTcUVaUjBV?=
 =?utf-8?B?WUorUGxNelZlejlZaENoR3NqdEVjczhkNHFZOFQvN280dk80N3dVRjNrUW5R?=
 =?utf-8?B?eVZQM2U4ZUJTLzFYWnV2ZncrbXlPNlJwck9aT2xQZFByTEt2b2RsOFFuSGg5?=
 =?utf-8?B?aGY2YVEveTIxQTNaVmJidGNwcXZhd1p0WHNDbC9uMDhwbWJVS2ZRQWxSdFVq?=
 =?utf-8?B?NUlGTU83Zm81K2wxNHlMNkNUM1ZSdWYwTmFjb0RDZHB2YndIM3FqSWdibG1U?=
 =?utf-8?B?Y2ZmQ25ELzI0eE5nRWxibmg5Z3ZlYUMwWTFuaTV2a0pkYXBqQ2VYQlN5Um1U?=
 =?utf-8?B?VGRuZzdRRlZ6UkEwWDJKbC9tNG1GM0U0Y0QvNWZab0pRaXJzb1ExN0k1c3F5?=
 =?utf-8?B?SmRvaXh4L1hTMVpCVE5RYS9hbDdDVC9NNDhuL2dFY2IvU3F4RkhkQWJZRUE4?=
 =?utf-8?B?MWJSRHlJYmxUVGNWbWwzQ3Qzc3RvZ0RQWEs1RXlOK004MlZtWVNWZFRKazNT?=
 =?utf-8?B?cnVHVWs4TlF3N2FhZE9mT0RnZkRCc0JINCtTQ1lBcVg1a1RnNWwzSFdhU2pl?=
 =?utf-8?B?dlNINGhzVHdMOHF6aVBGUnZCTFN5K09pZVR2bEYrMnVrMnVNQVZHUEd1S2Iz?=
 =?utf-8?B?dC9xbzVRM0lBSmFSWWZONHVMRTMwOHlsL2xsVXl3MXp6bEZMT3NoUkE1MXpx?=
 =?utf-8?B?Ujg2VEc1VklPY242RGl1em9ZdVk5Tnp0MzQyd0RRNjZlSy9jOWNsYVh2OGl6?=
 =?utf-8?B?NnJoSjNjak5rOXZkWXlrNVdDbXh6SnZaSXh4dUFmV0d6UzBzdEZQZWovbDRC?=
 =?utf-8?B?N2czbHpiZEV1cElwMGRsU2w4QjM0Nzk3aDF0aDk1R2pueHFiZDhPOEZkTzFW?=
 =?utf-8?B?Q3dRZEkycldzbUhKS1kyakw2S0dFZXRtK04zQm5oejJCUUVIRTdUMEJZbjQ4?=
 =?utf-8?B?cnB1T1VYZ1pTZ1dqc0pjNmpuOGFHSEJNMkRkWFFnbEg1ZW1WajJ1a1o0bFhB?=
 =?utf-8?B?cFNWdHcxaWlPUythSS9RcHhyMUpJaEpoREFhZVZwRDl4ejA5MnJLWVNuYkVF?=
 =?utf-8?B?RHNmR3dBdVNzT1A4R1FNbGw3UlIrOWw0T2lvU1Z3TUhmYlc1cjFzQm5EMmtx?=
 =?utf-8?B?dkVwRTFwZ21GTWlHSEIrazA4TGJMTWJWZytqc2xVeTFjQm1DdDZqVzZsNTVq?=
 =?utf-8?B?TjNOSlZRc2Iwc0E4aFhLNFRBeEtOVXU1NUNwK2l6MTVwdjlMS09TK214bEhK?=
 =?utf-8?B?d1R2RmpkTUh6S0J0YkdlM045c3pvL3FUc2g4am5SR0JtUW1rWTdRaDdsMktT?=
 =?utf-8?B?YzBxK2U1cVdSRjNrNW1Cai9SRndNZkZ6cXBJVmxDVG5xckF5YWpGdlNMT0s5?=
 =?utf-8?B?bWdGNTV3VWk3SStDYzVKNTUzSm1sVS9LMitIMTBEWVZ4bG5JTlQwUkhIdHdh?=
 =?utf-8?B?cUxIclY2M3BFbEQ5WG9aSzBURCttaG1PRHMvTGNvZTNnenh6bjRpUVlsWmtx?=
 =?utf-8?B?R2dub0M1Y1hkQTdYczAvUEtRQWdJQTNJSEx5VTVUdXFrd0hzcG1RSXFqcm0y?=
 =?utf-8?B?ZU84b0ZDeVBtVUM1dVREa1JaZGV6UTlyMUxvTnlrTmZJK21OOGFPRXdQSWF3?=
 =?utf-8?B?bi9IVGtvVnFVQXV6amdGQTZXdU5hZDdNbW1DYzNiN21rL0dwZnFZZFF5WXBR?=
 =?utf-8?B?Z3VZaWp6dzgxVTBSVVY5bmNLdTVsYmRmQjNOV1B6NVlWZHRlaEpza09xVjRE?=
 =?utf-8?B?U25McWJuS0pCV0pRTEtyc01oMFljd3pmelNacUwrWmxXWHRnOFFtQ3dScjUy?=
 =?utf-8?B?amR1cmIxeUgxaUE5ZUxEMUtHa0F3NVQ4QmRFNkk5aFU4NVE2QURha3RHMFFl?=
 =?utf-8?B?OHFhazY2aVJtc0dudzE5eE9Ga1BaZ2lNaEJ1ODN3bkJQTXFad2lvK2dzL0FT?=
 =?utf-8?B?VzBFdUhMQ0xsbE12MzU2V2gzZDFYeGNuM29obGxhZHU2ZXJScDhZRk83SlM3?=
 =?utf-8?B?NU5FNm9SSjlOdzkwRkhZaGlHR1BsV243c0xOM0hhc0NtUzFDMG9Nb3YyK25v?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f88639-3d45-415c-cda2-08dcf8eea105
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 14:24:56.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIcBU6xb7NKGCwGfF5LIYWYrPqPMfdF0UO6aXfEsZXdfF3IRdetQ1wD35ZP5BXSGY/5KEMRdb8yTwOxdpHhc6PN0jyKuvBQl2vKPeE873N4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4920
X-Proofpoint-ORIG-GUID: fZa1WT-l19HMXYlDkQ06GmjT0PQu_oP4
X-Proofpoint-GUID: fZa1WT-l19HMXYlDkQ06GmjT0PQu_oP4
X-Authority-Analysis: v=2.4 cv=T9jeTOKQ c=1 sm=1 tr=0 ts=672241c1 cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=sjgjoimaXzqqSt9gyWcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=w_u_dj44J6_wFsd_YukA:9 a=Ixcx9z203bRGsHP-:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_12,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410300113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 14:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206551

--------------CuHxcuzbLLGb00JLBJSD7h7G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49U69S3Y032358

On 2024-10-30 7:16 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> For some Rust crates, like building p384 in DEBUG mode, a SIGSEGV
> is encountered as follows:
>
>       note: rustc unexpectedly overflowed its stack! this is a bug
>       note: maximum backtrace depth reached, frames may have been lost
>       note: we would appreciate a report athttps://github.com/rust-lang=
/rust
>       note: backtrace dumped due to SIGSEGV! resuming signal
>       error: could not compile `p384` (lib)
>
> WARNING: Backtrace (BB generated script):
>          #1: oe_cargo_build, /home/poky/build/tmp/work/core2-32-wrs-lin=
ux/cargo/1.79.0/temp/run.do_compile.3262358, line 193
>          #2: cargo_do_compile, /home/poky/build/tmp/work/core2-32-wrs-l=
inux/cargo/1.79.0/temp/run.do_compile.3262358, line 165
>          #3: do_compile, /home/poky/build/tmp/work/core2-32-wrs-linux/c=
argo/1.79.0/temp/run.do_compile.3262358, line 160
>          #4: main, /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1=
.79.0/temp/run.do_compile.3262358, line 206
>
> Setting RUST_MIN_STACK to 8MB conditionally for DEBUG builds only handl=
es
> the stack overflow and SIGSEGV.

s/to 8MB/from 2MB to 8MB/

Best to explain what the current default value in your commit log in=20
case the rust devs increase the limit some day.

From:
rust.git on=C2=A0 =F0=9F=A6=80 v1.80.0
=E2=9D=AF grep -C 1 DEFAULT_MIN_ST library/std/src/sys/pal/unix/thread.rs
#[cfg(not(any(target_os =3D "l4re", target_os =3D "vxworks", target_os =3D=
=20
"espidf")))]
pub const DEFAULT_MIN_STACK_SIZE: usize =3D 2 * 1024 * 1024;
#[cfg(target_os =3D "l4re")]
pub const DEFAULT_MIN_STACK_SIZE: usize =3D 1024 * 1024;
#[cfg(target_os =3D "vxworks")]
pub const DEFAULT_MIN_STACK_SIZE: usize =3D 256 * 1024;
#[cfg(target_os =3D "espidf")]
pub const DEFAULT_MIN_STACK_SIZE: usize =3D 0; // 0 indicates that the=20
stack size configured in the ESP-IDF menuconfig system should be used

>
> References:https://github.com/esp-rs/rust/issues/214
>              https://github.com/rust-lang/rust/issues/122357
>              https://github.com/rust-lang/rust/pull/122847#issue-220125=
4359
>              https://github.com/rust-lang/rust/pull/122847/commits
Is there an issue open for the p384 crate to reconsider their stack abuse=
?

If so, please include that link. If not, create one and link that.


Thanks Yashe,

../Randy


>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/recipes-devtools/rust/cargo_1.79.0.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/cargo_1.79.0.bb b/meta/recipes-=
devtools/rust/cargo_1.79.0.bb
> index 123032cdf7..4917b25c0c 100644
> --- a/meta/recipes-devtools/rust/cargo_1.79.0.bb
> +++ b/meta/recipes-devtools/rust/cargo_1.79.0.bb
> @@ -37,6 +37,9 @@ do_cargo_setup_snapshot[vardepsexclude] +=3D "UNINATI=
VE_LOADER"
>  =20
>   do_compile:prepend () {
>   	export RUSTC_BOOTSTRAP=3D"1"
> +	if [ "${DEBUG_BUILD}" =3D "1" ]; then
> +		export RUST_MIN_STACK=3D8388608
> +	fi
>   }
>  =20
>   do_install () {


--=20
# Randy MacLeod
# Wind River Linux

--------------CuHxcuzbLLGb00JLBJSD7h7G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49U69S3Y032358

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-10-30 7:16 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Yash.Shinde@wi=
ndriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20241030111601.284064-1-Yash.Sh=
inde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Yash Shinde <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yas=
h.Shinde@windriver.com&gt;</a>

For some Rust crates, like building p384 in DEBUG mode, a SIGSEGV
is encountered as follows:

     note: rustc unexpectedly overflowed its stack! this is a bug
     note: maximum backtrace depth reached, frames may have been lost
     note: we would appreciate a report at <a class=3D"moz-txt-link-freet=
ext" href=3D"https://github.com/rust-lang/rust">https://github.com/rust-l=
ang/rust</a>
     note: backtrace dumped due to SIGSEGV! resuming signal
     error: could not compile `p384` (lib)

WARNING: Backtrace (BB generated script):
        #1: oe_cargo_build, /home/poky/build/tmp/work/core2-32-wrs-linux/=
cargo/1.79.0/temp/run.do_compile.3262358, line 193
        #2: cargo_do_compile, /home/poky/build/tmp/work/core2-32-wrs-linu=
x/cargo/1.79.0/temp/run.do_compile.3262358, line 165
        #3: do_compile, /home/poky/build/tmp/work/core2-32-wrs-linux/carg=
o/1.79.0/temp/run.do_compile.3262358, line 160
        #4: main, /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79=
.0/temp/run.do_compile.3262358, line 206

Setting RUST_MIN_STACK to 8MB conditionally for DEBUG builds only handles
the stack overflow and SIGSEGV.</pre>
    </blockquote>
    <p>s/to 8MB/from 2MB to 8MB/</p>
    <p>Best to explain what the current default value in your commit log
      in case the rust devs increase the limit some day.<br>
    </p>
    <p>From:<br>
      rust.git on&nbsp; =F0=9F=A6=80 v1.80.0 <br>
      =E2=9D=AF grep -C 1 DEFAULT_MIN_ST library/std/src/sys/pal/unix/thr=
ead.rs<br>
      #[cfg(not(any(target_os =3D &quot;l4re&quot;, target_os =3D &quot;v=
xworks&quot;, target_os
      =3D &quot;espidf&quot;)))]<br>
      pub const DEFAULT_MIN_STACK_SIZE: usize =3D 2 * 1024 * 1024;<br>
      #[cfg(target_os =3D &quot;l4re&quot;)]<br>
      pub const DEFAULT_MIN_STACK_SIZE: usize =3D 1024 * 1024;<br>
      #[cfg(target_os =3D &quot;vxworks&quot;)]<br>
      pub const DEFAULT_MIN_STACK_SIZE: usize =3D 256 * 1024;<br>
      #[cfg(target_os =3D &quot;espidf&quot;)]<br>
      pub const DEFAULT_MIN_STACK_SIZE: usize =3D 0; // 0 indicates that
      the stack size configured in the ESP-IDF menuconfig system should
      be used<br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20241030111601.284064-1-Yash.Sh=
inde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

References: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com=
/esp-rs/rust/issues/214">https://github.com/esp-rs/rust/issues/214</a>
            <a class=3D"moz-txt-link-freetext" href=3D"https://github.com=
/rust-lang/rust/issues/122357">https://github.com/rust-lang/rust/issues/1=
22357</a>
            <a class=3D"moz-txt-link-freetext" href=3D"https://github.com=
/rust-lang/rust/pull/122847#issue-2201254359">https://github.com/rust-lan=
g/rust/pull/122847#issue-2201254359</a>
            <a class=3D"moz-txt-link-freetext" href=3D"https://github.com=
/rust-lang/rust/pull/122847/commits">https://github.com/rust-lang/rust/pu=
ll/122847/commits</a></pre>
    </blockquote>
    Is there an issue open for the p384 crate to reconsider their stack
    abuse?<br>
    <p>If so, please include that link. If not, create one and link
      that.</p>
    <p><br>
    </p>
    <p>Thanks Yashe,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20241030111601.284064-1-Yash.Sh=
inde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/recipes-devtools/rust/cargo_1.79.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.79.0.bb b/meta/recipes-de=
vtools/rust/cargo_1.79.0.bb
index 123032cdf7..4917b25c0c 100644
--- a/meta/recipes-devtools/rust/cargo_1.79.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.79.0.bb
@@ -37,6 +37,9 @@ do_cargo_setup_snapshot[vardepsexclude] +=3D &quot;UNIN=
ATIVE_LOADER&quot;
=20
 do_compile:prepend () {
 	export RUSTC_BOOTSTRAP=3D&quot;1&quot;
+	if [ &quot;${DEBUG_BUILD}&quot; =3D &quot;1&quot; ]; then
+		export RUST_MIN_STACK=3D8388608
+	fi
 }
=20
 do_install () {
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------CuHxcuzbLLGb00JLBJSD7h7G--

