Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1349.1793743456502925818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 14:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F2y2zCuf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=576704952c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LMaU73891638
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Nov 2026 14:04:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=jmvUZFxCGXUcT7scm+hb6V
	hxLI5EBB0MHgzPPea1u58=; b=F2y2zCufjPw8ZZsd6csbON14NqONGEr/L/20v9
	2xQFx6+NppBv87BSQ/IOsSPVkvCH4ZkdCjK9hq9Kl/tpvMTMOOjJT5msjx5eMJ5C
	7jS0n1OJ9j+C5/SjLk7uyp0a9Pb9sbcPj52unAKTWBXdigGQJfJGwzX8cJEroYgN
	CdlDfOJIVNXPXB5dc9M64NZZ0/YgMSem27WEJM6+6cAat6QCK6cJ7O00Q3FfDgPE
	fiFrITtSKsG5O9GHbHHOdjMYrR677TZ6bcg9rErFot37dusmX0Z0eMk2RDi3qYWT
	PPKGuZ6GS1/hdStdL0bnCR1TXvMHn5UyNPPoP9oBENupcfbw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023131.outbound.protection.outlook.com [40.93.201.131])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hnbm1n2qq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 14:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/ca6VmG/jVPXvycuFS43LXrlWem3svcKs+3/1t0eaiaUgv7dC25ZSopaoytNlNq/zHokFQ8N7umJRgFgGFQGR1r4PKhdCXXh4pnRJyYZ8Mj/wQDsRmZfoFMd4hZNLDZawV7CxwJjdEusA6pw6495cu7DNNckdNo3O0arBPh3cspLCupXyMDByZxGwDjvhOZhxcHMX9+rbbcxbmPl0IrOWQ9Rc09FQ4CS3EZlERaJnzxV8PVQJlQuKE6jcssotE35cMe8myvKHhY9o5d4kNY3bLRD8BagxUzIfGXtIDjY3772mS5ggN/n5LrE6ymgwIdxcm2aiNi4NWMnTv4EZjkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmvUZFxCGXUcT7scm+hb6VhxLI5EBB0MHgzPPea1u58=;
 b=rMUevAn5BQns0MjITg2uVCKMSo8mi8NFDxeJmUv3TfoBw1S65oioTG0DCNcGSPPvUHqq4oJMomT7KwU7PasuBtZynVssQjmdG/kicGpmyPinKSwOYQNFKu2CLFQM9e/3gc+JoKiaPTRbyHNJ1lYH00zAFtPbmRQZxSfJSrpyNHcPRSvXagRcPOPZwxlEyoMVCtb3Q6LHR1zF/i4cbgIwJltv9EZMvgeR7FZQf3gFUtTtJga/6o7QZf3wTTO4X/2pljTVp1aoQI85UumoI/xdTwut0JsMNUfcXqOTqO1E0lct1ijp6Gk0bLj+I9dMAtykav/DmrMxDAp47L04i0AW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA3PR11MB9422.namprd11.prod.outlook.com (2603:10b6:208:57e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Tue, 3 Nov
 2026 22:04:10 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 22:04:10 +0000
Content-Type: multipart/alternative;
 boundary="------------2C1hxWZ4dUzrrOdDpVR29eqT"
Message-ID: <1905cd5a-760f-4f3e-99af-4aea68136154@windriver.com>
Date: Tue, 3 Nov 2026 17:04:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5] igt-gpu-tools: fix build on non-x86
 platforms
To: jose.quaresma@oss.qualcomm.com, openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261029093738.1507-2-jose.quaresma@oss.qualcomm.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20261029093738.1507-2-jose.quaresma@oss.qualcomm.com>
X-ClientProxiedBy: YT4PR01CA0362.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::17) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA3PR11MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: ad92ebb7-f9d7-4768-5537-08df39f66372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4022899009|261022105027099003|261102123227099003|260925021911599003|260925021311599003|260925022911599003|261021121427099003|11063799006|261026140227099003|56012099006|261009223027099003|261026121527099003|10067099003|261021135927099003|261028144727099003|18002099003|22082099003|3023799007|6133799003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: Asp6/wZW43E74q6tvnvAO7ZaDjogq++vOUAHxzS0q8ZK2PaQuOJTIpncD4YCoUVcHYV0dkVBk8C9O/Wo2J2Rp035O9ipKm79UVbYzvomjyGUtnmqroT8nUp1YrJOiEzkfWT9weTynHhy8ZDZEga1+E7EuqyLNDoHDcxP09p/WgiCofGSATqnUZfwvCBccODSgmQ953H5LwXJjJXbgUmKWBkLn+r+F79LDIaf4Rr6bGf+qdNfpTDWfp9bFudbVtvIu8nareATwoWwt5Y3WEL70sqX85MUjTj9kGtVkW8fg9KjddemdodoXJpAcVRCQa6/ltu6dQJ/sXeDReALKKj1+pi+qRP/UNiAo/AP7/MaoAZpW6+7Uwo0sCA2lhot502Dw24A93WLAB3Rg4GKCsB2S9wMJ04PusIAQCfFEXiJuWvUpOOBn28+bgno0p2lO4O4+IciBi92GBRwCrjhepVgtffSf9HIj4XIr84nfbT2wiDpFnqyUIlosLk7N1+Y2FjEDmUENs8c6DN25f7cHZu0FpvD+vA7JU09SokixZK1IXy090L5+giMK+KJ0jtE/an7wL/FaE2wZIQ7DhIqBXYxK9EJKdDKuI3tXtWc8CMMh6HujQRkJ2QK/F87E9+2D4F7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4022899009)(261022105027099003)(261102123227099003)(260925021911599003)(260925021311599003)(260925022911599003)(261021121427099003)(11063799006)(261026140227099003)(56012099006)(261009223027099003)(261026121527099003)(10067099003)(261021135927099003)(261028144727099003)(18002099003)(22082099003)(3023799007)(6133799003)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFBpbWZuVEJIUCs2Y20rYXNvMVl5dVplRHZlbmJiTzErcC9MSjZ5aTlWUHU0?=
 =?utf-8?B?WW1YYjRCU3lBSmdISkYyZExJSjEvMk1mdnZ6V0xyZjk4ZHlGMDFsWEYwQUNw?=
 =?utf-8?B?WnowR3BaMkZ3ZWN0ZUkvYXh6L0RaOXViQWU2dk9Hcnh1RytvQjFlc0RCNXhY?=
 =?utf-8?B?NVF1bExWZC9GSGFwTERacldaRXEvejJBY3NRWXhaSmhmVG1BcjgveG5zYitH?=
 =?utf-8?B?N3NXSklkby9UYnhqaHlmUkROc0ozbjlYS1c3Ym1oUU9iNnc0dzdZYkRTTjVy?=
 =?utf-8?B?QjRXdmxMdUpPMmtUWllWeExYOUR6V2hDMlEyUXRKY0NCQlZPTFBMQ0tJTjdT?=
 =?utf-8?B?Y2RndEVuNnNWM2R4T3d3SDlnOWdhZmtLVC9uU0tMRG8wVGxVa1ZKenNmRjVl?=
 =?utf-8?B?Rm9xQmRZUWdKdmwvV3RSZnFaY0tETytlUjBXN015bTZPWDdDQzY0Z3dHVUpW?=
 =?utf-8?B?Njl0eXpTeDF0VlZGdjhJK3hSQ2NGUjI4UTZueFo4NG5EK3RRNi9SY1doelB0?=
 =?utf-8?B?cGdpaWxlMTRpZ0Jzd3JXQVVkbnJNL0VNUGNHY2ExZU5JZWFKZ3lmTEtGK2Za?=
 =?utf-8?B?ejJOZU9Zdy9RNmVxeVRRMjFOSnp6TTVYemx2U0VlZVJLTlJlSlprMGg0ZVc2?=
 =?utf-8?B?aUhibDhWU1lRSVZ4R0FzMzhIQm9MZmRUYjY2UVd6ckFXRFN5c3dGRGtFc1B5?=
 =?utf-8?B?YUxsZDJMZFgwUGdUN0N0MTdQUllhYXByYzdqK25FWXVMaVlJcytnOEo5cHM2?=
 =?utf-8?B?MkFNRGFDQzU1bXErVlZ1T1c1YjJNQXhHbGpVNEtPZXhZa1E5UWkxNFNCRGEr?=
 =?utf-8?B?aExLTnVFZHNjbkYwY0orVXVrSDNkakRleGNWOWljOVdSN3FqVU1DTVk3S1VI?=
 =?utf-8?B?REZycFpJVHZiSkxFbkttYkMzOEhnUUxacXVNTmxHVXUycWxLWDVOT0dEdk5l?=
 =?utf-8?B?ejh2WUlydk1wY0pTVnpJczVqdTJRYlNHZWJVVnQ3OWxQTk9oeGJ0NlZVeUxl?=
 =?utf-8?B?QTN5WlFMWkNaWUowWFNBNDRaQVlPSnpMNVpiRjRTVWpnZ1dqM3hHbk02Q0kx?=
 =?utf-8?B?NkVnS292SmRrMWdzcmpqZVpSUFJXTGk2WTNwQkRHNk9QRkp4RkxUZERsYW5O?=
 =?utf-8?B?SndPbkxWTGNlZWZrdkJ1bVJaWVIxYjM0ZU5KS3M1T2lpNkUvV2tXdkN0R0x1?=
 =?utf-8?B?SjdxRlQ3bk56TmJNSUxGdVJ6QlpucFJYcFFhYnlPVjJQUFpKSERHQ3dEV3Nq?=
 =?utf-8?B?amdzRHRTWU5mVGo2OGQ2d0FHK2FLTForajZJNjhDakdKQ2pOVFhlTExVczJp?=
 =?utf-8?B?NmlwM0FPUUFjWllVbEpPTi9vckNFdU9YcmpiZmduSm1abDBEMmhMalVLay9m?=
 =?utf-8?B?QU5GVk5MaFFUSHRZTXd5WVRoVmQycXluTTJjQkdDRzRlalNqdHkrMUdESTVK?=
 =?utf-8?B?emNVVEVJUnBYMDgvZ2t6SnFVQW5tbzJEb1psUzR6cGRmSVF3UTN3VnFIVVBy?=
 =?utf-8?B?YnRzUFVFUXBHZjVoM1p5OXpKeGFMVkkwN2YyQTRORVdnSGRnQTdaaEwyQ0lI?=
 =?utf-8?B?Vkx2U1lCZUpzOWkvTkQyamV3UmtSeDNZN3UwZU1WMXJQak8xSXlIZFNKMGZ4?=
 =?utf-8?B?T3lPTXJaSEUrN3VVbFBlT0ZFSmxtZmZSakQxR1lhTW1tY0lmbFhaUTNJUEpK?=
 =?utf-8?B?djJTY2NYOVQ5RHFFazVzU2t3dFBaZncwenBmVTE0NmpvMGtNQWl2YXk2UURT?=
 =?utf-8?B?STZvS2tuOEwwUGdFZGprS0orY1JRUWpZRWMzS0ZObnp4RGt5ZktnVk1veFcr?=
 =?utf-8?B?SGY2T0tncXdrR2Y3WWRFZlRhWFZJVEg0YkV5cmEraC9aZUxpTDRwTzBsdEJp?=
 =?utf-8?B?UVlxY2VVb1FCVDB0d2hSVFdRTWFKUWpPd0NDR1NZdjhtbkp4a3NERGUzWG41?=
 =?utf-8?B?eW1RQlpvVHNaVzVPR25KbGw2c2cyQzNNTndPOE9hTUJFd0hGV0d4bS8zMVVU?=
 =?utf-8?B?WCtkWCtxT1pWM01vamJTai9uVHdkSDVNMHdXaUgyS041MEVtUWtEZGRJZk5J?=
 =?utf-8?B?TU5XVkUvbXpHakhSTWJUOE1iZXJVblhZMTFJMkNmTWFKYlZnbGczZjU1YmI1?=
 =?utf-8?B?SU9QRFVoSFlpYmp4a3FFTGNPL3UvaENXVTZBdm5YdjE1eDZzeDFYTDNoUWVU?=
 =?utf-8?B?QUh3V3RHWXZwVFNpZnh5OXZtKzU2Yk1qNGVrSHltMmlwMzNCbFppL3JBY2dj?=
 =?utf-8?B?RXVvbGJqOHc4VzZWT3p0NHJDR25sT0xVY1pET2JlS0pqaVFvMnRsOEVMOVpy?=
 =?utf-8?B?UXZxUGNFcS9WYnFoWDF0TjNoVzdHYlE2bHBySXNqdDBsOC9VZlV1WnpwZVpm?=
 =?utf-8?Q?rI3rxKJgsbN6tPyA=3D?=
X-Exchange-RoutingPolicyChecked: Dv37wooUGPudEGzAdklivZCX0Z4DZ1KgcwGqNxZ7M/lr+btnIDJnkrcRbDoG2TxzDi/dg9CeSZKU6+l20NSzi5rGqdcIRWqLEqoEbvffLFaDkuI3IRWcPBB0iB7VilwavA1Dew5tIhNdfXtT8w0zyeHLzfudE37JHS6iPsFoY5BzYElN3CQWZKHxJypwr1rLD+l+9yWRA7kQGoSRIxtoZG3TGotcBg3zMAkLm5lpt72fdqN/RfEbFwyevYoKMyilHWubIiV+mDlf6L5ZY97EjMdK3E1bC4l8qn36O8Y5RRRCXQj3BSjnXG944lMfxluX7QvLORM78xpsfBN/o9Q9MA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad92ebb7-f9d7-4768-5537-08df39f66372
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 22:04:10.4076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y81JToasxr5oxgxrJF3Lo0r0rQYZ3JDJz8aeQ+qgeir6hJ5eAI7ncJDGVBU5ocmVluzYdNWqaCv88Md4j5bBXgqWE+AeISyMtTnZxztuNGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9422
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NyBTYWx0ZWRfX48JYIZzPOUTv
 cBdCobM2uNVeq19pCreWnzlC8u5Phl8bsgTcbm5MNfbCommMPiggkCvxeJPd05FZhQfDAzwOcTz
 4Fhx6S7MZlITllD/rTCNukwnUAcTkGRePw1rW+RzniTapAdrOJTrgxJMM5gYy/L0R7ZquZv0R/L
 1h1mJ4y1Ruama1JeUPBTNLXGDYR8CFNIANU6bvgusf1XvJo4vi5pHwhmIzjwgJL0u7re3g+DTzq
 QExMMdFcBqDgBq55C+Uh1UwCLoJDHEwd8Lxz430aGh0z01deEXgZwAKXbZDY2wMGY2/aRWWIzTn
 yCYFFeC4eBYx+YGaKPf6/bcxE93nOsdxAOxstCdH+Dhau2Drpym6NHmNZ7GkO8j29vyD36LIj8W
 md2hbLK+BjnDAthCWL9bU/flRr1mSjLzq3YBhp9nyCB8gTVRZ3hAJ2zNIeJBXVmFZkJfUu5hQlE
 pd2ph8znhsDgBdok5Ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NyBTYWx0ZWRfX1tczDimf3WTk
 fY3jVGFwJf0QL5sGftuYvZ2EU+UrSjTvo63uSjRaKQQcV63sMeHjl4dZaIpVEnq79Va0GkQo3gB
 QQW22GFl75cMoEuNGy1ePLH4/lrne4RIKe2z6YCj/Px7iy13ICuV
X-Proofpoint-ORIG-GUID: CoKNGEQ-oUQZlDWWM_yG8uQ7x3cV_oa5
X-Authority-Analysis: v=2.4 cv=RZsFmFtv c=1 sm=1 tr=0 ts=6aea5a5f cx=c_pps
 a=toaxmG8YyEc+6C1DZWrQ+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=e5mUnYsNAAAA:8
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=67i78bWrlm566LU-p-gA:9
 a=QEXdDO2ut3YA:10 a=tt0lkP_pJGzVDPY59VwA:9 a=K6P4jNpjGy2tLxdD:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5wa64sWGlOemlqAzYwMMMKJ7sKfkevaR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 22:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249300

--------------2C1hxWZ4dUzrrOdDpVR29eqT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Jose,

Thanks for the fix. When people were discussing it on the YP patch 
review call today,
the question arose: Why didn't the YP autobuilder catch this error and 
are there more
inline assembly issues that we are not testing and catching at build time ?

Can you look into that or explain why it's not worth doing so?

Thanks,
../Randy


On 2026-10-29 05:37, Jose Quaresma via lists.openembedded.org wrote:
> From: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
>
> The "pause" assembly mnemonic is only available on IA-32 platforms,
> breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
> assembly with the preprocessor checks, making sure that other platforms
> don't see the invalid assembly.
>
> FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> Assembler messages:
> {standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jose Quaresma<jose.quaresma@oss.qualcomm.com>
> ---
>
> v5: Move Upstream-Status to the carried patch
>
>   ...t-pause-mnemonic-only-on-x86-x86_64-.patch | 37 +++++++++++++++++++
>   .../igt-gpu-tools/igt-gpu-tools_2.6.bb        |  1 +
>   2 files changed, 38 insertions(+)
>   create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
>
> diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
> new file mode 100644
> index 0000000000..38582bf1d4
> --- /dev/null
> +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
> @@ -0,0 +1,37 @@
> +From dc072dc0fc680a055d0cdf5adfdccbab6d0566d6 Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> +Date: Fri, 26 Jun 2026 22:34:06 +0300
> +Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
> + platforms
> +
> +The "pause" assembly mnemonic is only available on IA-32 platforms,
> +breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
> +assembly with the preprocessor checks, making sure that other platforms
> +don't see the invalid assembly.
> +
> +FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> +Assembler messages:
> +{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc]
> +
> +Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> +---
> + tests/amdgpu/amd_basic.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> +index 3ad023472136..e5475f337549 100644
> +--- a/tests/amdgpu/amd_basic.c
> ++++ b/tests/amdgpu/amd_basic.c
> +@@ -703,8 +703,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
> + 		/* Sleep if interval specified, otherwise tight loop */
> + 		if (check_interval_ns > 0)
> + 			nanosleep(&sleep_time, NULL);
> ++#if defined(x86_64) || defined(i386)
> + 		else
> + 			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
> ++#endif
> + 	}
> + }
> +
> diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
> index d76c2355a1..a46b002b83 100644
> --- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
> +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
> @@ -12,6 +12,7 @@ inherit meson pkgconfig
>   SRCREV = "916c79cfb7675ca01607dcd821f8c49d4f633a6f"
>   
>   SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
> +file://0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch \
>              "
>   
>   DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248920):https://lists.openembedded.org/g/openembedded-core/message/248920
> Mute This Topic:https://lists.openembedded.org/mt/121991366/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------2C1hxWZ4dUzrrOdDpVR29eqT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">Jose,<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Thanks for the fix. When people were
      discussing it on the YP patch review call today,&nbsp;</div>
    <div class="moz-cite-prefix">the question arose: Why didn't the YP
      autobuilder catch this error and are there more<br>
      inline assembly issues that we are not testing and catching at
      build time ?<br>
      <br>
      Can you look into that or explain why it's not worth doing so?<br>
      <br>
      Thanks,</div>
    <div class="moz-cite-prefix">../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2026-10-29 05:37, Jose Quaresma via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261029093738.1507-2-jose.quaresma@oss.qualcomm.com">
      <pre wrap="" class="moz-quote-pre">From: Dmitry Baryshkov <a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>

The &quot;pause&quot; assembly mnemonic is only available on IA-32 platforms,
breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
assembly with the preprocessor checks, making sure that other platforms
don't see the invalid assembly.

FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
Assembler messages:
{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'

Signed-off-by: Dmitry Baryshkov <a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>
Signed-off-by: Jose Quaresma <a class="moz-txt-link-rfc2396E" href="mailto:jose.quaresma@oss.qualcomm.com">&lt;jose.quaresma@oss.qualcomm.com&gt;</a>
---

v5: Move Upstream-Status to the carried patch

 ...t-pause-mnemonic-only-on-x86-x86_64-.patch | 37 +++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_2.6.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
new file mode 100644
index 0000000000..38582bf1d4
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
@@ -0,0 +1,37 @@
+From dc072dc0fc680a055d0cdf5adfdccbab6d0566d6 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>
+Date: Fri, 26 Jun 2026 22:34:06 +0300
+Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
+ platforms
+
+The &quot;pause&quot; assembly mnemonic is only available on IA-32 platforms,
+breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
+assembly with the preprocessor checks, making sure that other platforms
+don't see the invalid assembly.
+
+FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
+Assembler messages:
+{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc">https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc</a>]
+
+Signed-off-by: Dmitry Baryshkov <a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>
+---
+ tests/amdgpu/amd_basic.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
+index 3ad023472136..e5475f337549 100644
+--- a/tests/amdgpu/amd_basic.c
++++ b/tests/amdgpu/amd_basic.c
+@@ -703,8 +703,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
+ 		/* Sleep if interval specified, otherwise tight loop */
+ 		if (check_interval_ns &gt; 0)
+ 			nanosleep(&amp;sleep_time, NULL);
++#if defined(x86_64) || defined(i386)
+ 		else
+ 			__asm__ __volatile__(&quot;pause&quot; ::: &quot;memory&quot;); /* CPU hint for spin-wait */
++#endif
+ 	}
+ }
+ 
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
index d76c2355a1..a46b002b83 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
@@ -12,6 +12,7 @@ inherit meson pkgconfig
 SRCREV = &quot;916c79cfb7675ca01607dcd821f8c49d4f633a6f&quot;
 
 SRC_URI = &quot;git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
+           <a class="moz-txt-link-freetext" href="file://0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch">file://0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch</a> \
            &quot;
 
 DEPENDS += &quot;libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#248920): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/248920">https://lists.openembedded.org/g/openembedded-core/message/248920</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/121991366/3616765">https://lists.openembedded.org/mt/121991366/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------2C1hxWZ4dUzrrOdDpVR29eqT--
