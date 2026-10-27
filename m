Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16564.1793099430097741234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=PKNFIo+w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=476085ac17=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5biQb2419416
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:10:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=gd/Vx2FBB
	uu9xSXaEw55hc8jmTSU5p47FSaZInJ8Lg0=; b=PKNFIo+wmpq4R3Ukrn6o35b3p
	l7LhkiUk/zomvHwzm/ivCmUzmz493zLpFifDrBMXPW6rpCImUi+A8OQFcBmA5ZNp
	u+lU5ztwn6gXl+ucGbNevBlsRSIpb+8Gt2UrMIkgKJFZxAKuSn4eZN70AkI4+gxZ
	uH2BtUL6VuJNBM9p2dBLOjCCAiKJt5N48KlzSneO/F289T/xt/NPw8fXsJY6LseO
	fcS+gCQWMR1Avj9HM61sXXXr15AOzqK82HJzumiviNl5edl4hWaZGsb5yVYtzd0+
	3tkVhpaYtsbAru20jtPaKkLaAgYpMkrXoEvaSzl35sqshytKIPas57T4HQumA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020098.outbound.protection.outlook.com [52.101.201.98])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hgv6h3qhw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuTcnTBbz6L3FG0v4eDyuOtIDHoqVz3RF+95JjuanqkoccpAQubzG0PPeze9LnoG66/QxKjRrYOTlfzKmG2x1yshHMqPmxQ6LW6NnvEpEbqbnliDuVhQqCsLKcyPacnEz4FhWfvlT3kFURNTHZ0YyQNtQ9P2aomUa2lbt6IE8cGmCHcGCkr3GcEvy6hXx46mNmxLz9c19PH/5/Z2uNUIaVnRqhJJlfWWBp1X+wIa4PaBXLw1ek+HC8z0gTg5VXELbVDEQN7PhBk6FXtyW5JEXUpHRDOEk93/4l4E9YFgMhpeAs1gA2Rs5v0EwOdNz2QOirD+cHwBeZJ2e4958Z7kUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gd/Vx2FBBuu9xSXaEw55hc8jmTSU5p47FSaZInJ8Lg0=;
 b=Z+ul0vBUWO8WdyAt1+rzgYXajOMloH7nVJzIyu/2s2pHF9GDEUzRauXxbOfGEWw5yM1arvgg8DgQsIzhf67E2BVXNbH2MqK5BWLk/3//OIVnbmNgkP2lcxhI+AR8Nnz6tmBXMheIGtywG1uNl3tADb9H4sKIPC8B07Xzc/Neyyk7JzFlHDySUV6IpjkYmbT0Z1O3yTNbfkdWh6C+SZHYUfS68lcLGG1nLbKr94yvQ8/NXW2aLLzRbUc9hkauEbm5I0ifgFcgdsCvh9d06GDQoimzXFCKtQVY7qJXmogdCZdcl6eAkQ0ftOzVZLZbMJoWbJxqwTtPm6NmX9H78O48LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Tue, 27 Oct 2026 11:10:26 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 11:10:26 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@Windriver.com
Subject: [wrynose][PATCH] gcc: Fix for CVE-2026-95619
Date: Tue, 27 Oct 2026 04:09:54 -0700
Message-ID: <20261027111000.1520466-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: ed53a06b-cc15-4959-e775-08df341ae76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|261026140227099003|5023799004|11063799006|56012099006|261026121527099003|261021121427099003|261022105027099003|261009223027099003|261022075727099003|261021123027099003|3023799007|260925021311599003|10067099003|260925022911599003|260925021911599003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: F7CQn1lfOQHQ+NELZgoTaa/vZj0/pdsRmrKr4rTOJHkETcPEqmsSES2KX3MlDB7MiHMxN2fuyHYpuisE4Al745dgBY7UeriTsOjCbQoTRZFVenOyUNprRwjcnJkoEn9I30fMJPRUK4I7qj1f0bgwTrcbV4yFHLKRlyKDu5a+3XnEdLQN0mkMPhxwLPCwyG8LYB2WaZVKDhnNgByRb8ezdP/FXm3hAYreL4JeLIEHGSYE8caKtHJayEHY6/sn6oZEmGQAApzzanR99kWHOi0lGd5g7k9y8E7w6elTTpaOMgXwHPAgjeBef5VVXciBuhaL+IaODhwQYzDWHca+6+WUWf52OegwTnt/6COhLJQFCMzyzGvzi83WqSRElVhgm9fV6J7SIMgutdNTo7ugsPwKvAwirJo2ItY/hDEARiB6M+IUZEELGXAVmPhFU6cZ2yi305UnIrEa53cR/luTNw2bLZlvaRdjSVsixp4N85J5Yz7GNl4lyYywyLqZ+c42qFWaYAi9+Us9YiAaGQB9co+hsk7ZVnti/eN7pXIJKn5i2iU8+MjPSVi3vvQXsuOi/PbB7VPhGrSLSnXyZGIkrju3tMYhtXvOUNFYsSkhkM/JmxIa2J070tf2/EeCaJc792C7Bi/Sxy/I47N2BgYI0NGRhVVM1DKa+s4Km/Vg9M8cnEYHV1mbZcj4+k8GVWCkv0231nH+H7CPz1cychNhHDuZ5a78X56Be+R+hAcFdf4YkQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(261026140227099003)(5023799004)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022105027099003)(261009223027099003)(261022075727099003)(261021123027099003)(3023799007)(260925021311599003)(10067099003)(260925022911599003)(260925021911599003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRLRnVOY2VwTkxMQ1luRVJjK0oxbk1VNVhqUko3c1FKem5FdGlMODZTRFBn?=
 =?utf-8?B?dkdRYXg0c2RiK1dIQUhxcnRYdjBOSVJ1K1IxT0FlZlhYUDczZXdvZWNvSW1Y?=
 =?utf-8?B?blV6TW5OdVZEbi9EcEtpQ1dBdHBFMHhsNHMvS200OGh6SFIxb0lCQmxZK0Fo?=
 =?utf-8?B?N1c0QVhkSFUxSzRacGlLdmlRdS9yVklLeFlVYWxCOUdNR05OVit3alNKQjUz?=
 =?utf-8?B?b3V3aTAyT0MreklPY2xmZEl0VjU5YzhDRTExdzZNQXI3Vm1ZVlVORGJEQ0Iv?=
 =?utf-8?B?T01KR3NpcGtZTm1iUEJ0TG9lWDc0Z2pSTCtzbWxRc2tXVzd6cnhtSSsza1VC?=
 =?utf-8?B?RmdSbVNkZTM5R3JTanp5OWh6S1I4M210dXVSbnFKWmQ1Qjg2bVErclpqUit0?=
 =?utf-8?B?Um1EV3MyTnE4QW83WXBOT2wzWkdXV1lSWm1LcDlOZ0hDVVJaVjJSbW85SWVK?=
 =?utf-8?B?bE16RWFJTWZocmhxUmlkNFRSVzBYUit1bDN5d0Frcy9QVjJ4aWFuNXZHeTZ1?=
 =?utf-8?B?Q3FpZG1ienRrbGNldjl4V0NKSkphOGt2bXJEcWNVVEJlcHVXRTBVT1ZzeHRM?=
 =?utf-8?B?aS9wL1FpS2pmbFpCTHVYYTVXUEVZcnIyS2ZSL0xkRnhTdzZvT3hzUWxadXVK?=
 =?utf-8?B?V010bTdYVG85NzZybWRONW1iSnQ0YXpValRobE0vcENORkF6TGtlVzBxT2hT?=
 =?utf-8?B?ZURlWExJTHNLQ3d6V2YzbGpWY1pYUHlyMnVzWEhoQUpKSkxWenVUa2V0REl3?=
 =?utf-8?B?UDgyc3NySWZkSEtFT3BvQjRGS1daWUJGUENqc3FnSzg3OFV0ZFJWbHdrUFZS?=
 =?utf-8?B?M3hRNXFVckxlbUVURkc4VWdvK3g1MTNtdkdsejYyWnh3K0ZpTFdMUDM3d3hG?=
 =?utf-8?B?aDEzRlJud21SdENldDlYMzlSakpUTldFS0lsMStwMTh0WFhROUV6Ynp3ODBp?=
 =?utf-8?B?SlpMTlJKZjdBbnh0M1J5ay9tb0VkQk9oYTNBRVdRNGJBNENnQ2wrUGZ1dWt2?=
 =?utf-8?B?S3VnUzdHTGhQUXl6T0pDTktFQ3JCVGxweSt3aHljSzIwT1dzdldJY0JGdVhY?=
 =?utf-8?B?T1VJTVVrSkxseVRYQlJkWDRRYmpYQzBWc1JvNHVoaVpVNWlVdGNUK1pyNGNN?=
 =?utf-8?B?NGxlMmtBREs5NkhUNW9DUi9FQzVkSzlXcUdneWtIYVJkMTBCcjk5R2ZxN2pw?=
 =?utf-8?B?Qk1pNXRmS1dsK3FnRjlzaXo5eitXUitBb2hSZ0ZaVTRTSTBQMHBjZEpLZnRn?=
 =?utf-8?B?SWpJZzdyNEhUQjYvNVdtV2VXczFzNTNmOWp4Q2dRQVdtaTVaNlJVb3RacHpH?=
 =?utf-8?B?UnErSWkvZEtjT2JlcjZUTi9yOHBYT2RrcUl0M1RoR1ErbExlN1NlNm15NFVE?=
 =?utf-8?B?ekRxMWdaTHZsSTY1VVVoL3hLT0puYkdLNlJRT1N4UVZ4QWFLUGxybzkwWVFz?=
 =?utf-8?B?MWEySm1ybkJ0R1NUSFZpSG1FeGF1cFpRcXlFRXhQY2c0SXZIQlFoNHFkNVB2?=
 =?utf-8?B?clVvZ2lhd0g4ZXlpTm1YVnpBMVlTN2N1bEl2UTVmd0JNV1NnT1FFNFdrT0gr?=
 =?utf-8?B?UXhkZ0RoRWluRWJkdDdRUFZhdXZVSHJVOXVhMWxxczVLdzBVSmZTeHdNYjNt?=
 =?utf-8?B?MVNhbVNKVlQvS2VvMnBEYUJyb0VDMG1UWk9KZXpvSW1UTjJkcUxRN0tvV0dM?=
 =?utf-8?B?QXhSaFRwdExiNEZLcmZ1c2xiT2ptb2xPNVZJaXpxQnNONUhqUjJxYzRveHdJ?=
 =?utf-8?B?Nmh2VnViRExtU2tDWUxsdXlWeGh2S21hQlpPdm5OZ2J6UU15UWxJc1hwVkJx?=
 =?utf-8?B?dU05R1JNd0FUbkJmOU5aU05VRHI2dnIwbTZSZ3QwMTNiSCs3U3dsOTlYUlN4?=
 =?utf-8?B?V3d6cmwxNForaWZxMHVpdURqMXUrOGgxQUJvb29qa1k3b3pOcmkwU29Mckd5?=
 =?utf-8?B?a0lXTXdqdlFFUGpMT0JVYnhNZlRPSDVZMFBVR0UyaDg5VTc3dVJGWnVEeVlE?=
 =?utf-8?B?M1dsZndGWUJVVVcvR2hIL1ZzSjdMVDZlS3pRczVRTFhqM1dwRXQ5U2wydlF1?=
 =?utf-8?B?Y1VYajVTcnlIRVg1cnEvUDhKdkxHa2Y4OWw2T1J2RGxzbkFhTnJwM1BjRDI0?=
 =?utf-8?B?OHhNN2RKeHFrSmx3VTBnUDU2WnRpQ2hybnpkT3FkQjVhMU5nbWgrb1BNM3Fy?=
 =?utf-8?B?RzI0ZGtPSmNyS0d0YVl4dnFiZ0NPcXB5dU0zbWlreVoxTGIxbjhOUUVaY050?=
 =?utf-8?B?c2N2a0pla2FhRUg0Q3hoUjlTTnZxN3g3S3hua1dLWGtybWpFNFp3VVhGbWxi?=
 =?utf-8?B?NnR6ZXRGRjN6T3lmR0krWjlKZlM2bzdENG42T1BkSlZ2dTRObUU5UnBTeUdn?=
 =?utf-8?Q?AytR83xNg9MNoEEA=3D?=
X-Exchange-RoutingPolicyChecked: wq1cBNsuAo8yTCb4Olh4e1CW4/JuHbA0Tqbwd+cIimYllhqePa1BrAntB7EeHT0FpTX/GwDY1l70tRT/CI5mPQOyf6JOPwe2zLNPeBCd7i7KzNJHgEJ2zLP5RvSZY4Hpf+/5QjWhV/E3iuQ0TDVYLe/fR+eAIBcyH/e5NFDgaeDnMMK+DfKd6YPHwcGa5JnRaTXJU9R90hsDhsp1YZjGnczxxJEdmtCno8A55jTv5fCG8IMgIPFXndtgFbusqCAphvcBp6R6BqwjWiDyovg/zaug0S9xFyg6rdXzeofKHb0gQ8QCzxWpIc2iH06ZvHRP8RRoBmscj3CD/6H+OV4Cdg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed53a06b-cc15-4959-e775-08df341ae76d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 11:10:26.7321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbZHpS36RAbiRkybPplmIAMVbtY6vyBNneiB/H9cOvFnQszyZ8NmyVfaEaY0RYff4j4bfxgEfb/xeoGfr7diEMiHaD2qQQXWUzxH8MsmpyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX1Ujtehb7yIgB
 unEyaqdrZfbYA73Wb13KP45f9O0hBlg1x9gomJUwHjpNpBEL2CpU6TXRPv+nmyCllVZyUc0QIgR
 Apv2VYUkO4JoGw14wZavKXRqpKT/VRqA26m5m363BycWK/T9d1F2
X-Authority-Analysis: v=2.4 cv=B8csQ+tM c=1 sm=1 tr=0 ts=6ae086a5 cx=c_pps
 a=VmHzJY20YZOiQKV2ZK05+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=pUjUj6oU-fdMQ6dj_Z4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RT9SfyPMRSlhs6crJc57JpVLxkxM1s75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX4jvvyrKOgDvk
 vQyIR0dfIYuaedxopMSVUgdnQXZ5n0NVhejlku4IMqBBIcM8kz0gL4QH6XMyy8wOVgX+Si8JatN
 IxC6ESTmhGs47gYwh4A+V399lCxRHzTkoAhWn4r6Fx5YZ6P7LK7lGKZ/aOz1Q1mnZsB96FjLj3H
 2/WdpA5kkXnIyF3dkWgkphOSHhS893TH22LGh2YReK8m0mWw+2Bt5xMYMqUH30pQ31Dq19+thUR
 Yhqv1Hlgcc4kQw16wymVn5eltJa/QWSyFrWIda8SfgS0NXAoVSSFbmgOkYUKt4fYpTOFw625Eod
 JWhjfztdak/CsWv3T8OLtvw2U0AnxWqLjlbOuVne8Wfvi7y49xLs72Jm946mRh7IXfU0958L++G
 jJt7TNz4bmd9mUG+rT8ZRoZZbhxLIzpyV8QCDmOaaRC1N7Fl9VLvvAWbCn+p9qKsVcwAiZO9mUE
 i7a7YyxkfR7So/T3JHA==
X-Proofpoint-ORIG-GUID: RT9SfyPMRSlhs6crJc57JpVLxkxM1s75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69R5biQb2419416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248727

From: Sowmya Sathram <sowmyasathram12@gmail.com>

libstdc++: Ensure that aligned new detects size_t overflow

Depending on the implementation used for aligned new, the size argument
may be rounded up to a multiple of the alignment. If the size or
alignment is a huge value the rounded result could wraparound to a small
value and be successfully allocated, returning a non-null pointer that is
smaller than requested. Add size_t overflow checks so std::bad_alloc is
thrown instead. The using-directive for ::aligned_alloc is replaced with
a new __gnu_cxx::aligned_alloc function and the parameter adjustments are
moved from operator new into it, with the added overflow checks for the
aligned_alloc, _aligned_malloc (Wine) and malloc fallback paths.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-95619
https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D59d235ffa5a69231eb42e=
5290d52dc8c90d28b7a

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-15.3.inc        |   1 +
 .../gcc/gcc/0029-CVE-2026-95619.patch         | 187 ++++++++++++++++++
 2 files changed, 188 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0029-CVE-2026-95619.pat=
ch

diff --git a/meta/recipes-devtools/gcc/gcc-15.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-15.3.inc
index 2f74351085..7e0f4c89de 100644
--- a/meta/recipes-devtools/gcc/gcc-15.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.3.inc
@@ -75,6 +75,7 @@ SRC_URI =3D "${BASEURI} \
            file://0028-fix-gcc-libitm-false-postives-02.patch \
 	    file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
+	   file://0029-CVE-2026-95619.patch \
 "
=20
 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-95619.patch b/me=
ta/recipes-devtools/gcc/gcc/0029-CVE-2026-95619.patch
new file mode 100644
index 0000000000..50d35a1fd6
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-95619.patch
@@ -0,0 +1,187 @@
+From 59d235ffa5a69231eb42e5290d52dc8c90d28b7a Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Wed, 23 Sep 2026 13:15:18 +0100
+Subject: libstdc++: Ensure that aligned new detects size_t overflow
+ (CVE-2026-95619)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Depending on the implementation used for aligned new, we might need to
+round the size argument up to a multiple of the alignment. If either the
+size or the alignment is a huge value then the rounded result could
+wraparound to a small value which would then be successfully allocated
+by the underlying libc allocation function. This means that we return a
+non-null pointer but not of the requested size. Instead we should throw
+std::bad_alloc because the allocation cannot succeed.
+
+This doesn't affect most modern targets because they use the
+posix_memalign implementation, which doesn't do that rounding.
+
+On targets without posix_memalign we use C11 aligned_alloc and round
+before calling it. That rounding needs to be checked for overflow. The
+using-directive for ::aligned_alloc is replaced with a new
+__gnu_cxx::aligned_alloc function and the existing fix-ups for that path
+are moved from operator new into the new function, with added check for
+the overflow we need to fix.
+
+On *-*-mingw* we use the Windows _aligned_malloc function which
+correctly checks for overflow on Windows. But the Wine version of that
+function does not and has the same overflow problem so we need to do our
+own checks before calling it. We include a conservative 2*sizeof(void*)
+adjustment in our own overflow check.
+
+On targets without any aligned allocation function we provide our own
+__gnu_cxx::aligned_alloc in terms of malloc. This also needs an overflow
+check.
+
+libstdc++-v3/ChangeLog:
+
+        * libsupc++/new_opa.cc
+        [_GLIBCXX_HAVE_ALIGNED_ALLOC] (__gnu_cxx::aligned_alloc):
+        Replace using-directive with new function. Check for size_t
+        overflow.
+        [_GLIBCXX_HAVE__ALIGNED_MALLOC] (__gnu_cxx::aligned_alloc):
+        Check for size_t overflow.
+        (__gnu_cxx::aligned_alloc): Likewise in fallback definition.
+        (operator new) [_GLIBCXX_HAVE_ALIGNED_ALLOC]: Move parameter
+        adjustments to new __gnu_cxx::aligned_alloc function.
+        * testsuite/18_support/new_aligned_wrap.cc: New test.
+
+CVE: CVE-2026-95619
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=3D59d2=
35ffa5a69231eb42e5290d52dc8c90d28b7a]
+
+Reviewed-by: Tomasz Kami=C5=84ski <tkaminsk@redhat.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ libstdc++-v3/libsupc++/new_opa.cc                  | 49 ++++++++++++++-=
-------
+ .../testsuite/18_support/new_aligned_wrap.cc       | 39 +++++++++++++++=
++
+ 2 files changed, 71 insertions(+), 17 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/18_support/new_aligned_wrap.c=
c
+
+diff --git a/libstdc++-v3/libsupc++/new_opa.cc b/libstdc++-v3/libsupc++/=
new_opa.cc
+index 7bda847a9257..bd0098ac09e4 100644
+--- a/libstdc++-v3/libsupc++/new_opa.cc
++++ b/libstdc++-v3/libsupc++/new_opa.cc
+@@ -81,12 +81,38 @@ aligned_alloc (std::size_t al, std::size_t sz)
+   return nullptr;
+ }
+ #elif _GLIBCXX_HAVE_ALIGNED_ALLOC
+-using ::aligned_alloc;
++// We have C11 aligned_alloc but we need to satisfy its preconditions.
++static inline void*
++aligned_alloc (std::size_t al, std::size_t sz)
++{
++# if defined _AIX || defined __APPLE__
++  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's require=
ment
++   * that alignment is a multiple of sizeof(void*).
++   * OS X 10.15 has the same requirement.  */
++  if (al < sizeof(void*))
++    al =3D sizeof(void*);
++# endif
++  /* C11: the value of size shall be an integral multiple of alignment.=
  */
++  if (__builtin_add_overflow(sz, al - 1, &sz)) [[unlikely]]
++    return nullptr;
++  sz &=3D ~(al - 1);
++  return ::aligned_alloc(al, sz);
++}
+ #elif _GLIBCXX_HAVE__ALIGNED_MALLOC
++// Use Windows _aligned_malloc
+ static inline void*
+ aligned_alloc (std::size_t al, std::size_t sz)
+-{ return _aligned_malloc(sz, al); }
++{
++  // The Wine msvcrt.dll version of _aligned_malloc doesn't detect over=
flow
++  // so do it ourselves. We know al + 2 * sizeof(void*) won't overflow =
because
++  // has_single_bit(al) was already checked by the caller.
++  std::size_t check;
++  if (__builtin_add_overflow(sz, al + 2 * sizeof(void*), &check)) [[unl=
ikely]]
++    return nullptr;
++  return _aligned_malloc(sz, al);
++}
+ #elif _GLIBCXX_HAVE_MEMALIGN
++// Use memalign (and assume that what it returns can be passed to free).
+ static inline void*
+ aligned_alloc (std::size_t al, std::size_t sz)
+ {
+@@ -103,8 +129,10 @@ aligned_alloc (std::size_t al, std::size_t sz)
+   // We need extra bytes to store the original value returned by malloc.
+   if (al < sizeof(void*))
+     al =3D sizeof(void*);
+-  void* const malloc_ptr =3D malloc(sz + al);
+-  if (!malloc_ptr)
++  if (__builtin_add_overflow(sz, al, &sz)) [[unlikely]]
++    return nullptr;
++  void* const malloc_ptr =3D malloc(sz);
++  if (!malloc_ptr) [[unlikely]]
+     return nullptr;
+   // Align to the requested value, leaving room for the original malloc=
 value.
+   void* const aligned_ptr =3D (void *) (((uintptr_t) malloc_ptr + al) &=
 -al);
+@@ -131,19 +159,6 @@ operator new (std::size_t sz, std::align_val_t al)
+   if (__builtin_expect (sz =3D=3D 0, false))
+     sz =3D 1;
+=20
+-#if _GLIBCXX_HAVE_POSIX_MEMALIGN
+-#elif _GLIBCXX_HAVE_ALIGNED_ALLOC
+-# if defined _AIX || defined __APPLE__
+-  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's require=
ment
+-   * that alignment is a multiple of sizeof(void*).
+-   * OS X 10.15 has the same requirement.  */
+-  if (align < sizeof(void*))
+-    align =3D sizeof(void*);
+-# endif
+-  /* C11: the value of size shall be an integral multiple of alignment.=
  */
+-  sz =3D (sz + align - 1) & ~(align - 1);
+-#endif
+-
+   void *p;
+=20
+   while ((p =3D __gnu_cxx::aligned_alloc (align, sz)) =3D=3D nullptr)
+diff --git a/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc b/lib=
stdc++-v3/testsuite/18_support/new_aligned_wrap.cc
+new file mode 100644
+index 000000000000..dbd642d6ba58
+--- /dev/null
++++ b/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
+@@ -0,0 +1,39 @@
++// { dg-do run }
++
++#include <new>
++#include <stdint.h>
++#include <testsuite_hooks.h>
++
++#pragma GCC diagnostic ignored "-Walloc-size-larger-than=3D"
++
++void
++check_aligned_new_overflow(std::size_t size, std::size_t align)
++{
++#if __cpp_aligned_new
++  std::align_val_t alignv =3D (std::align_val_t)align;
++  try
++    {
++      (void) ::operator new(size, alignv);
++      VERIFY(false);
++    }
++  catch (const std::bad_alloc&)
++    {
++    }
++
++  void* p =3D ::operator new(size, alignv, std::nothrow);
++  VERIFY(p =3D=3D 0);
++#endif
++}
++
++int main()
++{
++  check_aligned_new_overflow(-9, 32);
++  check_aligned_new_overflow(SIZE_MAX, 8);
++  check_aligned_new_overflow(SIZE_MAX, 32);
++  check_aligned_new_overflow(SIZE_MAX, 1024);
++  check_aligned_new_overflow(SIZE_MAX, 65536);
++  check_aligned_new_overflow(SIZE_MAX -     1,    16);
++  check_aligned_new_overflow(SIZE_MAX -  1025,  1024);
++  check_aligned_new_overflow(SIZE_MAX -  1024,  1024);
++  check_aligned_new_overflow(SIZE_MAX - 65536, 65536);
++}
+--=20
+cgit=20
--=20
2.49.0

