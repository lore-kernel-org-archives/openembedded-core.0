Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39169.1793180309663068483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 02:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Iqn+d+W2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47618183db=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8Ho8a932429
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=oChM1/bNxFEpRgVo9Zzz4B3ZZ9TbWvJN43Qi3OoosSE=; b=Iqn+d+W2Cgkw
	hMaCrGg8A+rBhwaklmnB29JW8lEKYmWuU7/N4dDhcb/RwK6LHaF9E23etVS6bv0G
	BK9Ga5Z41seYdKO643GoKEBi1Yz880CbYiWm400XS/MzudHh0GzmI0Pe2XTYiLy1
	59ek+CUzz5GbECRzLHr97OtqKdwvppkSV+Aa810dkh5Efor2OaqnrDoF9f2WDjA+
	FjdibonRm31xfWHQEpNT1Gg2Xs33zF20Ghqfw63sIXSdvt+TlCNKlle7i9rz0RCt
	VkBZPR13xOT00GX2NY3ECRfcA46i4xODc0N3t9rUKGirM2zfRDWvzXyqzRTuyiu0
	oCmK6Za59w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022081.outbound.protection.outlook.com [52.101.48.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hghvxe1sb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 09:38:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4zAkKwG+DTcRGwM54zd8bAPVAQ2c0ejv7dJwmJ+53I7paJ2axiOiCQd42DCNCF8NYRX5wRAEw/VMeo4gmlcImluDc8umgbt7scmIp0I2Nq1BWbVb+7M7iqViVvrFvaVleAR2SUIuGL9rpjSaPR5L6ytJPwa06f/D5++EUCbicZtN9JPy15Kpy7s9adz1TUJ4KPaoMDkkW1ko4pjviU3YmaULPbwy3gZ1sz+YVAe1ETSfqBmv/ttEtR6qQw2bF58q+3tVM8LLQwBtJHJfODd/NiR6l7cBgvDUkxM+x8cdHFG7pRIwkCcV4XN3JowO6gJ7rTSv06HH9udlxiW4si9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oChM1/bNxFEpRgVo9Zzz4B3ZZ9TbWvJN43Qi3OoosSE=;
 b=DOfusJtgT8IEOKaCtx5ws1BVwfD0t5/pxc4T8j+YXp8SBe4/KziRwy5DWHXQlSWvLvEI28l7CzD7IcxX5mwcmKGsnSQb+2dnXlHrHnlrA0rCHZ+lRlN/Dio6gLg5sB3bwTjIcG72zU/ivUSx94whhbevEY64rcgqHcMlS5frU8ltl+1xWd31VOUoeqZEq/b+VyjCrYh98MRP/KyNc69hMHBWHn85cyaSAj+lEtoScktILgtduIqNI46Lc1LS+Q2DPPHtRLcvc6WTdu3HVbv5f829DBvPI0qMtG6b3gmjQuIS6xCFslG3IeLx8Tn+qGwj75EV4t/czoN4Omt9EPun1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LY0PR11MB972267.namprd11.prod.outlook.com (2603:10b6:404:225::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:38:26 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:38:26 +0000
Message-ID: <e1516918-d31d-41ec-802e-dd326099fd7e@windriver.com>
Date: Wed, 28 Oct 2026 15:08:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH] gcc: Fix for CVE-2026-95619
To: openembedded-core@lists.openembedded.org
References: <18E25E6E82F7AE0F.3327485@lists.openembedded.org>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <18E25E6E82F7AE0F.3327485@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN2PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::18) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LY0PR11MB972267:EE_
X-MS-Office365-Filtering-Correlation-Id: 5226bd1e-430f-4eef-4afc-08df34d7374b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|23010399003|1800799024|366016|3023799007|6133799003|18002099003|22082099003|261026121527099003|56012099006|5023799004|11063799006|261009223027099003|261021121427099003|10067099003|261021123027099003|261022105027099003|261022075727099003|261026140227099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: jzLSTgwAdp/wtOQNTwv5umFHwryMSSxS5J7DN6IdK9eeu1hJ25E9aPYhIP5pCe84cfItx2VD6ATXo1dU714zZEMhhG1ZkyLgpnQNObrz3dtv3X3lDSMLIeXDf+00OF428UIjq+sp6d9gsGZhUkCSqVdrpurA+3PVhaD20fGB2NEdnNdETkxxvBDX0A/JI8ZSeNjTcj0ZeUO8ROnoOXYfcVleeNogyyU4/BUFcvb38MaR3e2nWM4iJZFJDIEHcv8hl9W/anhcsrDVtCVqCZMeKHwCltNfD8c3fkLruMpfWXVPGJKmDanOAUBPCNb2NnXT3qCbuqNMDj/+/JQNQueNZT8am+M9yvmFnksNpoB6IV3082S/aDsw16r3yM8eKiIdiXx8HGarxfEvvGYi2qlxKXtK51P+E5a45jTxtd0PnIXovqPImi3CT63gcE38CAYy4YfH+O4uXuVe8l1apvRU1Ic9jykMlBvpJcXP/Pitcu72pkpNJf6gdxfB4yn4LZDgtE7C0U7IGCpB2Ya9Xk1/rRwTArrPBqbLWoi+aMoA/QxnZwk8PguwcgkArpCDLeKsyTm/YPFwiHMVX64/BSwQR30QBk2IC1q7CoWM4lpzsWc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(23010399003)(1800799024)(366016)(3023799007)(6133799003)(18002099003)(22082099003)(261026121527099003)(56012099006)(5023799004)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026140227099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHNlTTVUemhTNGdVUWxlN1l3dHFtQXVQUVNKME12SVVVWUpoSk5rWG1mT1FT?=
 =?utf-8?B?S3h6alJoTWdwamF1UDlzQThWK3dJbEI0bjJkY0s3bTdic3B4QzhoTkoxTWg2?=
 =?utf-8?B?SjBleWVFR0x6MmprNzFGNnYramcvT1Y3OVVVSFg2eWRBbGNaSkhoWmZSQ2ti?=
 =?utf-8?B?YXArZ1FXc05CVGNmbGpBVXRneW5Tc2k3Y3plQ2FoUCthcGdzektLWjNUV2pE?=
 =?utf-8?B?SEZBWHFNM3hxZTg2YmdXanhNK2RjWk8yeGlKakRqZzdkK0I3Uzg5TlVoSStm?=
 =?utf-8?B?VEtTeTEwZ0tpZ3FHZ0NmUDFmUFNPSUZ4RnVFVTRwaE5ZbjJLTzAwaWtZNDVm?=
 =?utf-8?B?emhOZENBMXZzVThDcER0eE5rZEVzSW1PcEI1eVJGU0UzVGtnWHhxVFVISjBT?=
 =?utf-8?B?bC9qT0pHbS9JNjRwMUtNTTVlZXpvU3FHRVUzRE5WcEpZc1R2NnU1eXNLRVZz?=
 =?utf-8?B?R0dFNStHK1BnU1JjUnRpUmk0VndDNHpiYS93ejVXdFdPWEo0WS9wUWk0VGRH?=
 =?utf-8?B?NWNxRTJRYWpkcGJkaW1KdWVQOWxqU1JsUmhSSmRVVmoyaUFUZlZTd1hxYWM5?=
 =?utf-8?B?MTZaNHZnZUx1d0dHbWFHMkpPOUJPQjIrZDNxazJKOEw0OG1YYXRsY0dlTnpa?=
 =?utf-8?B?YlNXS2orZXhoU3RhamQzTDRYYVJ2WDFndGd6ZHUrNUxGWHk4OFB0TnhsOHV1?=
 =?utf-8?B?bytLMlp4V3RGeFM2T241elh2UGY5SUhvNWZUSXIrV2tFd2xXdUloV0t6T2l3?=
 =?utf-8?B?RUdIMkdnaG9RQ29zMWJoZ2YzWENrS1cxRXBVSDMyMWNaUDF0djM4Vlh2WEcw?=
 =?utf-8?B?N0VlVVNpbzVlZDV6QnBGR3hGNzJ5b3BJSFJIT0xmUlpaWG9IT1ovNjdka0xO?=
 =?utf-8?B?eVFjY25abUMzVmc0aDhKVDFEMjlHNkxEOFBmcWc1djNtUU8zQWMrdkFxenlD?=
 =?utf-8?B?djZJM0tQMmJPQTE1NVQ4cWxyVzh2QkNzTFhBZ2VKSURVTkY2TFRnN3BsQkRE?=
 =?utf-8?B?VFpkeHlvUWJUQ25CL3pNN0ZvV1ozK3I3M01UbWtuM1ljL1pjc1hxNnUyelZq?=
 =?utf-8?B?Y0p4S3I5cmhzbGVVOXFJOUxtYWdDSlgwb2ZNOW8xY09NbGZTZm5jdkkxSmNt?=
 =?utf-8?B?Nm0xYzFqMkxTNXFCUWtCNlF5eFRxNHZuWTJ0TWY5WlhFUlQxTE5xeURmOVB4?=
 =?utf-8?B?clRHOGl0RzU3ajlMdHNQN1hydkhDNjlYWTBRbUVDQmtJRDNVaUY1ZE5SNHpo?=
 =?utf-8?B?TXg4Yk1rV0lWZXNKSFUza3AzbFFacnQ2VCsyM1FROGlCOGdwalVFaUhXWFMr?=
 =?utf-8?B?TDJISG5adjd1OFVPa09PUnF1dW5YRTVwZndZSStOL3RGVG1MNXlPMlZOc0tS?=
 =?utf-8?B?OW0rZDkza3ZmcVVnR2trY2sxVml1c0h3M1c4aUh0NXhPRm9VMFJXTTFxUFZP?=
 =?utf-8?B?MlBBcXVKYnVSaldCbnR2S2FraFFSMUc1UVJwRzZ2NTE1YU9sMWpFMlFTRlpj?=
 =?utf-8?B?NlB0MWoramZiNTR2VjNnMUpPVXVaL1BkTEQzWmE2aVBaRHUyUUF4V3doc3lS?=
 =?utf-8?B?OE1yRFdqSlpQd0xjR0cwNnJPVFFJS1dEVWdzSmw5ZzRKdW0zMXdjdXVhdDYw?=
 =?utf-8?B?RjBsaVZDbFpZY1kvd0FnQVUwS2E0NkxTcGpQQ2taVHRoU0p6ZlBzaHA4N3Uv?=
 =?utf-8?B?ZHhDRFlKem1QZkdoU1FrZGZMYzhzUlQzb25MemtRcDFadEFKWGkxU0k0UWZF?=
 =?utf-8?B?anZiMmtnLzY1dlh2NlhqWTRpdmNKc3JTT1dYTEY5elJvcFQyOERZWVU5NlR0?=
 =?utf-8?B?enE1N1dIN04wZXRKWDhvSWJyanRZVUdGZWs2dGM5R1pvNGMwNVR4TUtvZVNR?=
 =?utf-8?B?emxFKzN0M0FMQ2lpYU9rcm5KSzU1V0dUQ1ljQ0xkUFJ0RmdvS21yM0FyOFdk?=
 =?utf-8?B?czByQzN6RzNhUlUxTXNxTzBCTVBJNlVCS0VKZ3MzeTc2TnBUREE0ZFllSUxP?=
 =?utf-8?B?cnhiSUh3eURYUnB2ZmgwYzBhS0xKQTdBaVQyYldWbG1PaVdRWkRVVnBBNWZF?=
 =?utf-8?B?SGwrM0paMjMxZ2dPRm1uTzJNdkxXUDc4V09JZmplTkE1bDdQVHZnNWtyL2ln?=
 =?utf-8?B?Y3FxbTNyalJEd285NnlpTVEybUEwK3ZzQkFieUEvbFVpN1ZlZ3Z4TzdwR2V1?=
 =?utf-8?B?cnpHVXRieTRjWXpBcXJ5bDc3NmtISGc5MXk2TEFCc3FMS01vYzdtNyt6WUpa?=
 =?utf-8?B?eGdTTGExRUZ2Y1gvVUpnSEtlTXcyY1lSN2xXRVBsZURTVmdQZWlDYmUxQ3Bm?=
 =?utf-8?B?c2tyVnJXaktKcWxQOGpydHZXdGpIcUZlWStJaEZHbGtwZGJSRlRjZjAwZTl0?=
 =?utf-8?Q?6PCeQao1PJ7bz2dE=3D?=
X-Exchange-RoutingPolicyChecked: sDIRgdE+AND808jP64nQl0wpZVUF1JzafK7XPogfaeT4udg3f7gIP7BofMg7m9QGV0dWVD9qy0lVC2ssukKOz/DfJQIRtgc659L2lz2VM/kb6QDtUBGNwDA3IEXKU0/54RV+e+F24LUW4LrVN2DXoJf9FW+IkajWtM+qCOYEtrCRAo7nT5dSk0oOnZQp9Uw8iW3WPhFoj+bFxLMDHTaGpn9aWhT/VUqShM3jOqn028LhEbMBIB4oVZ6rZvyyUUjnM+d3sfubqx8XQBW/EIUHoRTWP+ITJUOfhVpdpbOC9PgAzvwm6B1Y1pgPhKq0/0816WNP1Fpy5R2jywR9Q5RuQw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5226bd1e-430f-4eef-4afc-08df34d7374b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:38:26.3323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJfT3TVCLEJTSxaGJG2mogwGFnx7SuTd9E+Oy+kZh2C2WUyuEdYcse2FxCD23XKZOsjNI+w2RU13Xi4vAN4kUynHLHdBTO+SZulZv76D/F4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB972267
X-Authority-Analysis: v=2.4 cv=Q55HcI2a c=1 sm=1 tr=0 ts=6ae1c294 cx=c_pps
 a=OvjpmfG2phmKxcO1Hl3QmQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=jOZjig5FM_lz8G3PujQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfXyISaEeR6D+NO
 qE7VnUKSaFI/Tu5AqceaRIi0mPXt5XjwvgUGByNJlVate2S83XSm/zl74tU8nqZWRN55I/KoVAs
 HUORYAa6pLtL+Ik0F0rx5mqqMgmk1jkWckS04NNqE0pSikrpy+ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX7/zxAbs5NiNN
 Shv027s8oHhx/4060QXddffa4gNZAR1vNTUNFR0WdFXOnxQ19He6aChas3ROvIjYaS3SU54J/rj
 vUahSdWXS0i+bjeCA7KtO1DmJPcNpG12PACUY9A7IWeMhWvDKD0HFt6LNBIn07kznFFhUp92Ey2
 J89WEwl9G1HaaDNraSVqdUX3oy90x5Me5NdJsUDp88hrlzttfinxfzse6JuqPV/zIP+VSSs50iW
 8ELlAguVAIVJ+IuPbhXF/MYAO/vgELthyh3sXeZB3X4y+I66zUlrIVDGkPebvY7zqJyN8fnI6Fd
 Rai0YbzUAEPMiXS87+kLPg7ibKmd7lS0B5qzbtS/QOrzKsr+oBw2bJ+jNStYMrqL8frcBOxQyDh
 JJexZH+RnwZqdkf8mIinYHSSvyGEbMsxdkl1X0RnAO0Rzp5OKhrvYxYuzmNZHLH3uBFfiz79igk
 kCeO9Myz0Rli3+XcCuw==
X-Proofpoint-GUID: 7tHuEwpQKEjOxFZNDQjQwXnT02_TMEjh
X-Proofpoint-ORIG-GUID: 7tHuEwpQKEjOxFZNDQjQwXnT02_TMEjh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69S8Ho8a932429
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 09:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248802

Hi ,

Please ignore this CVE thread for now. We're checking applicability with=20
upstream, and based on their direction we'll send a v2 if needed.

On 27-10-2026 04:39 pm, Hemanth Kumar M D via lists.openembedded.org wrot=
e:
> From: Sowmya Sathram <sowmyasathram12@gmail.com>
>
> libstdc++: Ensure that aligned new detects size_t overflow
>
> Depending on the implementation used for aligned new, the size argument
> may be rounded up to a multiple of the alignment. If the size or
> alignment is a huge value the rounded result could wraparound to a smal=
l
> value and be successfully allocated, returning a non-null pointer that =
is
> smaller than requested. Add size_t overflow checks so std::bad_alloc is
> thrown instead. The using-directive for ::aligned_alloc is replaced wit=
h
> a new __gnu_cxx::aligned_alloc function and the parameter adjustments a=
re
> moved from operator new into it, with the added overflow checks for the
> aligned_alloc, _aligned_malloc (Wine) and malloc fallback paths.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-95619
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D59d235ffa5a69231eb4=
2e5290d52dc8c90d28b7a
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-15.3.inc        |   1 +
>   .../gcc/gcc/0029-CVE-2026-95619.patch         | 187 +++++++++++++++++=
+
>   2 files changed, 188 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0029-CVE-2026-95619.=
patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-15.3.inc b/meta/recipes-devt=
ools/gcc/gcc-15.3.inc
> index 2f74351085..7e0f4c89de 100644
> --- a/meta/recipes-devtools/gcc/gcc-15.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-15.3.inc
> @@ -75,6 +75,7 @@ SRC_URI =3D "${BASEURI} \
>              file://0028-fix-gcc-libitm-false-postives-02.patch \
>   	    file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
>              file://0001-mapper-localhost-might-not-be-known.patch \
> +	   file://0029-CVE-2026-95619.patch \
>   "
>  =20
>   UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
> diff --git a/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-95619.patch b/=
meta/recipes-devtools/gcc/gcc/0029-CVE-2026-95619.patch
> new file mode 100644
> index 0000000000..50d35a1fd6
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-95619.patch
> @@ -0,0 +1,187 @@
> +From 59d235ffa5a69231eb42e5290d52dc8c90d28b7a Mon Sep 17 00:00:00 2001
> +From: Jonathan Wakely <jwakely@redhat.com>
> +Date: Wed, 23 Sep 2026 13:15:18 +0100
> +Subject: libstdc++: Ensure that aligned new detects size_t overflow
> + (CVE-2026-95619)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Depending on the implementation used for aligned new, we might need to
> +round the size argument up to a multiple of the alignment. If either t=
he
> +size or the alignment is a huge value then the rounded result could
> +wraparound to a small value which would then be successfully allocated
> +by the underlying libc allocation function. This means that we return =
a
> +non-null pointer but not of the requested size. Instead we should thro=
w
> +std::bad_alloc because the allocation cannot succeed.
> +
> +This doesn't affect most modern targets because they use the
> +posix_memalign implementation, which doesn't do that rounding.
> +
> +On targets without posix_memalign we use C11 aligned_alloc and round
> +before calling it. That rounding needs to be checked for overflow. The
> +using-directive for ::aligned_alloc is replaced with a new
> +__gnu_cxx::aligned_alloc function and the existing fix-ups for that pa=
th
> +are moved from operator new into the new function, with added check fo=
r
> +the overflow we need to fix.
> +
> +On *-*-mingw* we use the Windows _aligned_malloc function which
> +correctly checks for overflow on Windows. But the Wine version of that
> +function does not and has the same overflow problem so we need to do o=
ur
> +own checks before calling it. We include a conservative 2*sizeof(void*=
)
> +adjustment in our own overflow check.
> +
> +On targets without any aligned allocation function we provide our own
> +__gnu_cxx::aligned_alloc in terms of malloc. This also needs an overfl=
ow
> +check.
> +
> +libstdc++-v3/ChangeLog:
> +
> +        * libsupc++/new_opa.cc
> +        [_GLIBCXX_HAVE_ALIGNED_ALLOC] (__gnu_cxx::aligned_alloc):
> +        Replace using-directive with new function. Check for size_t
> +        overflow.
> +        [_GLIBCXX_HAVE__ALIGNED_MALLOC] (__gnu_cxx::aligned_alloc):
> +        Check for size_t overflow.
> +        (__gnu_cxx::aligned_alloc): Likewise in fallback definition.
> +        (operator new) [_GLIBCXX_HAVE_ALIGNED_ALLOC]: Move parameter
> +        adjustments to new __gnu_cxx::aligned_alloc function.
> +        * testsuite/18_support/new_aligned_wrap.cc: New test.
> +
> +CVE: CVE-2026-95619
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=3D59=
d235ffa5a69231eb42e5290d52dc8c90d28b7a]
> +
> +Reviewed-by: Tomasz Kami=C5=84ski <tkaminsk@redhat.com>
> +Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> +---
> + libstdc++-v3/libsupc++/new_opa.cc                  | 49 +++++++++++++=
+--------
> + .../testsuite/18_support/new_aligned_wrap.cc       | 39 +++++++++++++=
++++
> + 2 files changed, 71 insertions(+), 17 deletions(-)
> + create mode 100644 libstdc++-v3/testsuite/18_support/new_aligned_wrap=
.cc
> +
> +diff --git a/libstdc++-v3/libsupc++/new_opa.cc b/libstdc++-v3/libsupc+=
+/new_opa.cc
> +index 7bda847a9257..bd0098ac09e4 100644
> +--- a/libstdc++-v3/libsupc++/new_opa.cc
> ++++ b/libstdc++-v3/libsupc++/new_opa.cc
> +@@ -81,12 +81,38 @@ aligned_alloc (std::size_t al, std::size_t sz)
> +   return nullptr;
> + }
> + #elif _GLIBCXX_HAVE_ALIGNED_ALLOC
> +-using ::aligned_alloc;
> ++// We have C11 aligned_alloc but we need to satisfy its preconditions.
> ++static inline void*
> ++aligned_alloc (std::size_t al, std::size_t sz)
> ++{
> ++# if defined _AIX || defined __APPLE__
> ++  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's requi=
rement
> ++   * that alignment is a multiple of sizeof(void*).
> ++   * OS X 10.15 has the same requirement.  */
> ++  if (al < sizeof(void*))
> ++    al =3D sizeof(void*);
> ++# endif
> ++  /* C11: the value of size shall be an integral multiple of alignmen=
t.  */
> ++  if (__builtin_add_overflow(sz, al - 1, &sz)) [[unlikely]]
> ++    return nullptr;
> ++  sz &=3D ~(al - 1);
> ++  return ::aligned_alloc(al, sz);
> ++}
> + #elif _GLIBCXX_HAVE__ALIGNED_MALLOC
> ++// Use Windows _aligned_malloc
> + static inline void*
> + aligned_alloc (std::size_t al, std::size_t sz)
> +-{ return _aligned_malloc(sz, al); }
> ++{
> ++  // The Wine msvcrt.dll version of _aligned_malloc doesn't detect ov=
erflow
> ++  // so do it ourselves. We know al + 2 * sizeof(void*) won't overflo=
w because
> ++  // has_single_bit(al) was already checked by the caller.
> ++  std::size_t check;
> ++  if (__builtin_add_overflow(sz, al + 2 * sizeof(void*), &check)) [[u=
nlikely]]
> ++    return nullptr;
> ++  return _aligned_malloc(sz, al);
> ++}
> + #elif _GLIBCXX_HAVE_MEMALIGN
> ++// Use memalign (and assume that what it returns can be passed to fre=
e).
> + static inline void*
> + aligned_alloc (std::size_t al, std::size_t sz)
> + {
> +@@ -103,8 +129,10 @@ aligned_alloc (std::size_t al, std::size_t sz)
> +   // We need extra bytes to store the original value returned by mall=
oc.
> +   if (al < sizeof(void*))
> +     al =3D sizeof(void*);
> +-  void* const malloc_ptr =3D malloc(sz + al);
> +-  if (!malloc_ptr)
> ++  if (__builtin_add_overflow(sz, al, &sz)) [[unlikely]]
> ++    return nullptr;
> ++  void* const malloc_ptr =3D malloc(sz);
> ++  if (!malloc_ptr) [[unlikely]]
> +     return nullptr;
> +   // Align to the requested value, leaving room for the original mall=
oc value.
> +   void* const aligned_ptr =3D (void *) (((uintptr_t) malloc_ptr + al)=
 & -al);
> +@@ -131,19 +159,6 @@ operator new (std::size_t sz, std::align_val_t al=
)
> +   if (__builtin_expect (sz =3D=3D 0, false))
> +     sz =3D 1;
> +
> +-#if _GLIBCXX_HAVE_POSIX_MEMALIGN
> +-#elif _GLIBCXX_HAVE_ALIGNED_ALLOC
> +-# if defined _AIX || defined __APPLE__
> +-  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's requi=
rement
> +-   * that alignment is a multiple of sizeof(void*).
> +-   * OS X 10.15 has the same requirement.  */
> +-  if (align < sizeof(void*))
> +-    align =3D sizeof(void*);
> +-# endif
> +-  /* C11: the value of size shall be an integral multiple of alignmen=
t.  */
> +-  sz =3D (sz + align - 1) & ~(align - 1);
> +-#endif
> +-
> +   void *p;
> +
> +   while ((p =3D __gnu_cxx::aligned_alloc (align, sz)) =3D=3D nullptr)
> +diff --git a/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc b/l=
ibstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
> +new file mode 100644
> +index 000000000000..dbd642d6ba58
> +--- /dev/null
> ++++ b/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
> +@@ -0,0 +1,39 @@
> ++// { dg-do run }
> ++
> ++#include <new>
> ++#include <stdint.h>
> ++#include <testsuite_hooks.h>
> ++
> ++#pragma GCC diagnostic ignored "-Walloc-size-larger-than=3D"
> ++
> ++void
> ++check_aligned_new_overflow(std::size_t size, std::size_t align)
> ++{
> ++#if __cpp_aligned_new
> ++  std::align_val_t alignv =3D (std::align_val_t)align;
> ++  try
> ++    {
> ++      (void) ::operator new(size, alignv);
> ++      VERIFY(false);
> ++    }
> ++  catch (const std::bad_alloc&)
> ++    {
> ++    }
> ++
> ++  void* p =3D ::operator new(size, alignv, std::nothrow);
> ++  VERIFY(p =3D=3D 0);
> ++#endif
> ++}
> ++
> ++int main()
> ++{
> ++  check_aligned_new_overflow(-9, 32);
> ++  check_aligned_new_overflow(SIZE_MAX, 8);
> ++  check_aligned_new_overflow(SIZE_MAX, 32);
> ++  check_aligned_new_overflow(SIZE_MAX, 1024);
> ++  check_aligned_new_overflow(SIZE_MAX, 65536);
> ++  check_aligned_new_overflow(SIZE_MAX -     1,    16);
> ++  check_aligned_new_overflow(SIZE_MAX -  1025,  1024);
> ++  check_aligned_new_overflow(SIZE_MAX -  1024,  1024);
> ++  check_aligned_new_overflow(SIZE_MAX - 65536, 65536);
> ++}
> +--
> +cgit
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248727): https://lists.openembedded.org/g/openembed=
ded-core/message/248727
> Mute This Topic: https://lists.openembedded.org/mt/121957654/10244482
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Hemanth.KumarMD@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Regards,
Hemanth Kumar M D

