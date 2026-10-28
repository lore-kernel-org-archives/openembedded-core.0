Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39087.1793179976975640566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 02:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bISFg1k6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47618183db=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8Gu7N187821
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 02:32:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wIjpJL1oD6TSmcr7U+RSp70+Tk+5NLkjyw6P6xHqM9A=; b=bISFg1k6kNs/
	Ur9X5WuvT1WgUKXzQVsUIaVPkA7xuyWRg+TzbURFCyiEtR+5EDZxFO9n+ojUXT+M
	33gr8ODdwKlnDEC6C56rfpnlPQPn9AjDfLYXltp4wfuKkNwbcx67Pvr69D9EkynA
	djJgEp/foQ390rBXAFtDoE07Bnp1qbDzBP5W4o4LYr+ix6q0yhXP1Uanm44SHnRt
	kBzNa28KeL7CKUittkB6Cwrbe45XGhqg1/1lHPB13/Rz356FxIzgWtKuArhoCYwd
	1y1jhTqZDMeLl5bi364DOIt7cowHmSoyU8f7YaKvVjqJRfly46ELsMiHoobpLtah
	z2BJhst8PQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022105.outbound.protection.outlook.com [52.101.48.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hgqy1nscq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 02:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxGxnkTJSi6Yo1M4jGDUBYVceeJ7jhDG1NkzVfb8sXV7l41NSXvMvRttyQaRvshoE0hna09ap2KESx/imvIf2dghu76tmUik6PDMhtkaLmsUwYDDmZwuFovK2v/rbiNdf+TukLpOfVJ4dvyzxMc0cM0adqh7+0ziTsNjonXcMThkfSTPpOytEzA1cU8oJIPxJ3kOvEmVzXI9PyGQjXM+6LjfkTtubmYT2r3A4vKgY752+Jb/n+QDjrMXDZjPhNQ7BRic/ptOxEWVmoDBxPD79yw+us1zlQGZtnxO0+fAY7gqDY6RtyOcXgPm/2dhSwBuxP2nk/RaksUok+Ok8xRiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIjpJL1oD6TSmcr7U+RSp70+Tk+5NLkjyw6P6xHqM9A=;
 b=y5lLq5ZTXNy/m+Qt3qLN2KICr/6kjjarIy+1iRqT83SAVhJcalBpmR4REhagp4UVtNqJ64jiaajWX0EGdC+Nn4sB8cKzAkJ0DFfAISH9f3/ZKaj5Jxj4XdKSkGbp5RebDmPePuzdyy1bJL+JEfMn82LtzQz78tPPs8578+QbPSE7tZwULpr/5pjpwLB0spFQAz49CMs5AxBm65B5iu7klaLHY77ZNrTzkCPBNrYH6zOVK3firdzChKXI2eA8XZauXA4B454LxXes8MlwY3FwO+c0yBs048FZX92ob9zB1SDm6BiuH5KniE2OqUuYyITlXrrseXbYsQn9ev/+KsfBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LY0PR11MB972267.namprd11.prod.outlook.com (2603:10b6:404:225::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:32:53 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:32:53 +0000
Message-ID: <0b0b24f5-5965-4936-8908-c2f955a2ee7e@windriver.com>
Date: Wed, 28 Oct 2026 15:02:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gcc: Fix for CVE-2026-95619
To: openembedded-core@lists.openembedded.org
References: <18E25832548E5FD4.3327485@lists.openembedded.org>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <18E25832548E5FD4.3327485@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN4P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b1::10) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LY0PR11MB972267:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2e2b57-1fb9-46e6-d449-08df34d670dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|23010399003|1800799024|366016|3023799007|6133799003|18002099003|22082099003|261026121527099003|56012099006|5023799004|11063799006|261009223027099003|261021121427099003|10067099003|261021123027099003|261022105027099003|261022075727099003|261026140227099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: 9VB79MO2X9O5i8wwLBjE5LOPPbl3KsSgdu9IeugA47Msf8VP4EaHq50x55RaNBmoJFI/ZMQpXwtVe0xwTpLKhza/mBYyD8yd2taPogJ3/Ldb6EkfAvqHYC5jCt0AeVc39uF96eee675VJL+1ZuP9dFh+tSKDaS/jX//SYXhdgi7DIr8+qvUdYzPx5S1+liQkzQBs/gHJ/oEKjpEb0jd//P1o41AvhsyVCcljJZqfOuLNv7L0dfNrMl0+V0EUWnEM9bJedvI3v6QHFysJxnsEvGdx8EY7ECzetPJIfCdl+J1wSyx7v4XqIyTnFLSobFYsgqUPNGj4bN4sRmr5FdafQBR4Mh2v45NDnwE2ZX9OMZM0NUNyRc1WtlsdN1Z3PXKcbyhxS1smv4HnwEE56r0zfUOHnkVcrX8sLf58rQ0cZ0Z0l+eCMahQ5eX2uxCvFuekN3Xyg4/31wZ575CoPedB6UwUnX89VfbkI0ZpCfy3iB+08WVpOBIctE4vSfhidf+oNHIISfyagNevsADxSWcOqPmKubc+vwq5/KuhjGB80rk9gbKLY+fa3HTnCBMfjm+xL/42P8h5i3E0AED2rbRGVq0SNGyDmW2MYPBUWSS0rLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(23010399003)(1800799024)(366016)(3023799007)(6133799003)(18002099003)(22082099003)(261026121527099003)(56012099006)(5023799004)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026140227099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1hWbkV0U0pSUUdSNk15WFJtVVdYL3J0TFZXQnEyeWhJcVlMNXVoMDEwT1B2?=
 =?utf-8?B?ZVhOL3BjSVRHaGo4OHlkVzRQdnAxbVF5TTM2MGlQZzlFYU9qZnFpQWIrMWRQ?=
 =?utf-8?B?cjRJdXlpeW9MZ0N5aTQ5MnlRSDRqdWU3V2tXMSsrRDBpbGwrTTRKK2YvMW41?=
 =?utf-8?B?VzFDUWx0ZU82S2ZRZWlLRVNWSWRLbzJnRUJOOFlNT1V1eFFWbFN0U1lVOHBi?=
 =?utf-8?B?MWRjNE5pSnFYTkM0dnd6TXpjMmM1cDNEeTNvNWt4WmdSVW9xc013TEhiVGk0?=
 =?utf-8?B?U3lIY2tId2o2SDgweGJGTE5CZmI1WStsb2tCQ0IzKzVYUUlTUDhrR1M4am5y?=
 =?utf-8?B?R05QUzk1dHo5b3RqaUpJK0JtZTNER2trRHc3bzJtNDVIam1yWm9YRjU1bXYr?=
 =?utf-8?B?WGxuVUNVd0FZaFJLWHBVWXdBMU9yTmpnWi9lVkVCcm9OUFljTlArbkIzWFhu?=
 =?utf-8?B?dkpYQlUzckNVNzBaTkxEbC92aCthQ1BjUzVJWDJSMEY1Mjg5Z01ZRGx4dFJx?=
 =?utf-8?B?STVhNUU4NFdkQmVINmJ5OE41V3A1dExuMk1FWklTak4zMnUrK3U4TWZRcGJN?=
 =?utf-8?B?ZDNDcnBkL2xjdlcvQXhkYWFPSlNnUzNUZVVsRGV5clB0UXRUOEltTVZ5MG95?=
 =?utf-8?B?RmFzRXdGV1pCM3hpelRiaWJPSzNnUlNjM1VkQ0crcU9POE41TFRUV0h5VE9F?=
 =?utf-8?B?QjRmRExJSlAzRWhMdGd0eFZJNTVHV2NicjExT1hxK2ZkZHQ3ZGkvOExvS3Z3?=
 =?utf-8?B?Ujh1VE9xRkJLb050YlRsUlhZaHZ4RDR2TmVsbFd0UlgvbmpadlRHa2FvQ0t6?=
 =?utf-8?B?SUorQWxVMHNxZ0piMDRlQnA4VG9VWktaMUcwM014cW5uaFd3ZDl0YWVVNVV4?=
 =?utf-8?B?WUE1WkQvS3dQclVWNkZNNVgvaHFKTlR4NHpRQUJPTXNvYyt6U29jZWdwWWVV?=
 =?utf-8?B?OTVodWIxVE5JaGZ3ZzBlSXhKcHBTYWJlL2pZOTdOeGpWYU8wVkxMQnE0eTNw?=
 =?utf-8?B?OEJ2UkErVkljWERMOEhWbHFYOUlRSnExaEJ6U2d6V08xZEovUndDQXFGWmF2?=
 =?utf-8?B?MUZVM2Yxc3B1K1VQSndSVm80VjU5MVorU3ZqQndTTEFHb2E0TUlldjVteXg2?=
 =?utf-8?B?dDBkbS9oMlhtSk5MN21QVkVKRTlSTjBPck9wcE5LWU9BOEZXUDhHQ29DYVVR?=
 =?utf-8?B?aEZ5OEdRb3hqRGtRRDN5WnhiVXNTQlJHU01Hb0JuS3RhZEFXV0ZMb2p5SWQ2?=
 =?utf-8?B?cUI2ZjVBT0h2bit3Z3RYbW1ockluYnVNQStjdDc4K2pOQTU5aC95U2hOeTFJ?=
 =?utf-8?B?cmdueFkrT0ozYTd5R2tvSGs4SitseUFuVm9MTlc3QkQwbVVTa1NzUU9wVjgz?=
 =?utf-8?B?Q1JwckFSMXh0eWVacFhiUGlUNUxhYnN5ZmJCQ1lUQ2VRQjNCNmJWakZEM1lN?=
 =?utf-8?B?V1V6S1pTNFhEcWhKaWNRVDVQZzRQWWF6TnBGU3RxMzFSMnVtbjhobUZGUldw?=
 =?utf-8?B?YkhPWTZOTmtsYk5SaklqR0xNcmZpQlkzVnVjdnFNaDVJY1pSU2h3djF1ZXFw?=
 =?utf-8?B?bDUyUUNUdnk2djVYK1lUZG1SMExBWnF5VzN0c3ZhdVJhWTJFUERGYWR1U0Zm?=
 =?utf-8?B?WjNuUmZjTXdYanYydDhVYmY2RVV1My9veUk5RnIrUC9nK0RIeTlTdnJVUzFY?=
 =?utf-8?B?VFJyQ1RZRDhkZ1hPbjhqVUdCbnlpRmJGS0hheXNORTduZlA2eDJieEd3K2Ix?=
 =?utf-8?B?b2JVNHo4QnR2d1N1WXlUN1RuMVl1VDhQdDd1eWV4KzhqQ0VDMEVhRC9sREtj?=
 =?utf-8?B?aGM1S1dqeHhUSjdJU1QzSDdLbHhpU2xacVF1NmE3R2hOd2o2NTk1Slltc2V6?=
 =?utf-8?B?ZVJsc2c3NzFqT0JPcDdrU3ZobGNsckVIc1FXL2tGYUl1dXYwQ01KRlFoWUNH?=
 =?utf-8?B?a3EwTmVzZkRaT0doWFdqNTJ6bC9LeUZ2bnlXczdRQlg4ZllQZjRaU0FmZTlx?=
 =?utf-8?B?RGozdUN4WVlDekxRSmxJT1V0eU8vTmxyT1dNeG8wWTlxeTZVQ2YvazZiNG5y?=
 =?utf-8?B?MGxHNDN2T3BUSjZiK0o4UTRHdllJUG9ST1JyR0RwV0E5TXFlMjN1MXV5MWx4?=
 =?utf-8?B?b2UvcW5GWmNtNDdSZVZsbXJSZDdCRHVmK09NWGZqYW82WTR6RlB3OVdtcENO?=
 =?utf-8?B?OC9nSmVTazE3WFVXY3pIS3A4K2VNNE1lcVFlcnB2enJ6SkpaQytWR3cxbUF6?=
 =?utf-8?B?cElGMGl5eGxVQ1YyZk9SZDMwNStIRHFGMGlBZERKWTVTYkE4S2ZnRmFhTDFl?=
 =?utf-8?B?ekVsM2wreno2emVOaDZXcG9qYmN4Y1VRaTYxTmV6VUE4S0JEMXozVi9kNUcv?=
 =?utf-8?Q?N9ZbelS67bcpeL1w=3D?=
X-Exchange-RoutingPolicyChecked: xjGhkM8PtxUnnW7CYVabETB1IDJ9crFYkFmU1EsR2/NbRRZ8QSM1Ztslu4tDAoBLWha2J1J6DUesJnky/ffKopO8RsR6XQwF5dxZhiJz48u9mVKWd9Zn/wNNH+3OyD9V6E2OiXM94/nrjnvvfbQ8x6jJILDQbv1oFreGtM6Zv+J9UNAsTUCPrpu1/t12tsCGn58b57EirNMVSh6o4JJOSH+uQ4Oa2ADEgF3RSKYMILf1z8JZodjc4PGH0fRq9txsOLuH6BfVrUZahirtDM0yQN+ec9r7pnxt7qKMJlj4ol8endXyCWrNnv3KCrmU36bB/5mLV6puOpziY5DPOlsPvg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2e2b57-1fb9-46e6-d449-08df34d670dd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:32:53.2487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FapP05HPaWi1TnMfAR/g1wSpbKeGitqgrGRxEvmCIHfotqEWXD/Uej3cP7MQBQcKLC+EblWhJjpxiQ+rm0bklGbVEyECg/YGbgZby98fRh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB972267
X-Proofpoint-ORIG-GUID: Ba8elXULwT9Y1jJ-AQWbmP014YSmsbuP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX/dRPPe4elV9y
 R76nl10YcCNSl7TmBYll9FTSdlLgYfMvX3iJpd5gl31l/Jb2N4XtaCpsLfDfZ4xB3cR1Myql39c
 7Nj4j9T+1bnZE/9wLPSP26bOC+2UwEulr4/dqJTM2HPNzT2i8bn9dCnkVqWnoUMxAL6YdaQSyhi
 WWYjhTUhm8YrwgD3Ep/4PPmnZTONaMQvJYOLeLU6UcwNexppCznK14k8yNb9wbnuLoaR7jPLy8J
 46ttfzfsvV6uSrGBF9Vo4BxQ7d5vWI7IHpJxoqyKOYZukHeCZgIZATP+IeLUbEOvDw5YkPCznCo
 Ve+kZXwzyB5QkIt4rF03CrDNn+H5TuQflW7e9bJW2pBL0237B4jFKx3+QLNuSMbBWO5BCeTuS7q
 0mvJ0hOQ+PaULGe973IoEm+K3HF0DpfWgcLLx6voHH5dvmkDymY3BLWH67MCHwpRa4f+0hY6sim
 I7g1COvAtA1qIdbmBVQ==
X-Authority-Analysis: v=2.4 cv=dr1OmFg4 c=1 sm=1 tr=0 ts=6ae1c148 cx=c_pps
 a=mtSqpVOEitwwaRRTiGNoZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=PfnOd_Vne-10dN2E4cAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX07V6d1zVpG+f
 wftEZ+GhtsrVyyeYdTaXxT2/R3tl0i7JV+UooxDRrdaNC4D6y+504gZ5avdonjYNlDzdQI3dNwN
 lxQQShr1887cUrFIoJzrmdWXJ5nDga9H9nBFbHiyG5PUlWsP8Hua
X-Proofpoint-GUID: Ba8elXULwT9Y1jJ-AQWbmP014YSmsbuP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280037
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69S8Gu7N187821
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 09:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248800

Hi ,

Please ignore this CVE thread for now. We're checking applicability with=20
upstream, and based on their direction we'll send a v2 if needed.

On 27-10-2026 02:44 pm, Hemanth Kumar M D via lists.openembedded.org wrot=
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
>   meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
>   .../gcc/gcc/0027-CVE-2026-95619.patch         | 188 +++++++++++++++++=
+
>   2 files changed, 189 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.=
patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devt=
ools/gcc/gcc-16.2.inc
> index 3497493619..31a630ce8a 100644
> --- a/meta/recipes-devtools/gcc/gcc-16.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
> @@ -75,6 +75,7 @@ SRC_URI =3D "${BASEURI} \
>              file://0001-mapper-localhost-might-not-be-known.patch \
>              file://0001-Fix-check-for-working-assembler-gdwarf-4-optio=
n.patch \
>   	   file://0026-CVE-2026-102010.patch \
> +	   file://0027-CVE-2026-95619.patch \
>   "
>  =20
>   UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
> diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch b/=
meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch
> new file mode 100644
> index 0000000000..e984344eac
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch
> @@ -0,0 +1,188 @@
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
> +	* libsupc++/new_opa.cc
> +	[_GLIBCXX_HAVE_ALIGNED_ALLOC] (__gnu_cxx::aligned_alloc):
> +	Replace using-directive with new function. Check for size_t
> +	overflow.
> +	[_GLIBCXX_HAVE__ALIGNED_MALLOC] (__gnu_cxx::aligned_alloc):
> +	Check for size_t overflow.
> +	(__gnu_cxx::aligned_alloc): Likewise in fallback definition.
> +	(operator new) [_GLIBCXX_HAVE_ALIGNED_ALLOC]: Move parameter
> +	adjustments to new __gnu_cxx::aligned_alloc function.
> +	* testsuite/18_support/new_aligned_wrap.cc: New test.
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
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248722): https://lists.openembedded.org/g/openembed=
ded-core/message/248722
> Mute This Topic: https://lists.openembedded.org/mt/121956715/10244482
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Hemanth.KumarMD@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Regards,
Hemanth Kumar M D

