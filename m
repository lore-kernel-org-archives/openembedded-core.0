Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.905.1794339542562764910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 11:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GsPSP1IG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5774d2e964=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIpmJl1085695
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 11:39:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=A19v4YPfd9HWcN8EpqHZCG
	6L8tKiQVyBEbzeLYnCon0=; b=GsPSP1IG/+scXQlbPd+JDqNckZ4ruhfWEO3UdJ
	VKZpv6KW0gyOijcglpOxzeDZMUhaEJu7H1bZQ5pN3RmQPBHkEVZklgCZgTeGU1h0
	+BFVC2XO0sGdpqLFpUYSsr0xpo+uUw6RMNVHAUZ0qb1m6ycbelMyc5ktzjZBL2Cb
	EZuAP5OTC4LtYsp0njv+iGzpsKXq1QU2/Rr2yxcyZbvD038ri/GYHV5CLVQ40GG/
	XPVha4dvuQy8ZyfDAwa6tDONLq2SeE3ZnMgSrBYurl2ZgdyCIjYR3pdig9alvspi
	eBBDxo8HH08cxpIN7jmSawF7r0AskLbkoaVlLsr6cTdjqw2Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022120.outbound.protection.outlook.com [52.101.48.120])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ht4cje0am-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 11:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCxGxvWDjw7VuugoOkR5LlTFn8q4egGltkW6u+Hguuima1ntMPuELMMScmjWs5hAOppAHwkEw9/xhRtqM1J5Qo0JHWAApMRbOHa5RtL0aa1FkGabA/nZzQrJvj3pJAZoSY1CfqctNyZkch+aFoq9ZWmR0k2UK3WODJPeeM8ZihIFKCNvJxayuZBIzfIdceoAIH8424eX8oevyeMc20rvv3rg8ej+wkjTlCgjTlq450OQJXZcsPPnyrq/MMSm9iZ8wo6LJraHrkaNfruFk9oLFVQ1v7Asgx1rO6wv4XNKTIkGWB1XQicrUZ4olsx4dhKCdXgsoghjzGDOwt2Mj7/khQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A19v4YPfd9HWcN8EpqHZCG6L8tKiQVyBEbzeLYnCon0=;
 b=mLzj0cXkqOSrA7qRlgT4U6N11Xig7cUq+oxeGQh1po1RImmGnh1gUHDNsh/V+wUM3X1fL36wGDUrFzCCwsg8bEVsP6dmHqB97B+89iJdWwcFYwkNUNkYuoLO5t+T3vVxDbhhYZVJHt73wDO000WmVQJ8IRV8sRXDonhG1JO8qe/q6igZWKMJBbrmGrMJ4Xud2BnRvklqow+hVHvhfYi0btndYZtfCTPNiTJkJVuaI58I/xdtA707UGILcOIaOkuPFK0Tz7oEEnMt0IZh7elJJr3Cv+EYomxZad/6409vGZFYXSFf+30ltR4+u27sztS3gCENU0TVFLOihFZ1qWbLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB9635.namprd11.prod.outlook.com (2603:10b6:806:4dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 19:38:58 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 19:38:58 +0000
Content-Type: multipart/alternative;
 boundary="------------D92uTKPv4mG0o9H00bVx6X9L"
Message-ID: <98abc2dc-5119-4dcf-a120-9d3eca47a8ab@windriver.com>
Date: Tue, 10 Nov 2026 14:38:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4] tiff: add ptest support
To: "HimaniRamesh.Barde@windriver.com" <HimaniRamesh.Barde@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Shiva Komati <Shiva.Komati@windriver.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Ross Burton <Ross.Burton@arm.com>
References: <20260925080552.4144665-1-HimaniRamesh.Barde@windriver.com>
 <20260930073432.3027882-1-HimaniRamesh.Barde@windriver.com>
 <7EB8E0D5-83B6-4567-9FE7-A9CBB8940435@arm.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <7EB8E0D5-83B6-4567-9FE7-A9CBB8940435@arm.com>
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fcf824d-e16b-47ce-b2ba-08df3f624397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|11063799006|56012099006|261022105027099003|10067099003|261026121527099003|261028144727099003|261009223027099003|261026140227099003|18002099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: LByB48oECtjI/dnUop80gNe3KjSxq41zJT9r6bolL5mFgtCI6zO5ePztUpg4ZjMseU6/VLE8qNpD5PYqz0O2ue6ET2m9fUlLIE5eHT5mfFXN478O8hHjZKk/S4v/95j1eCHyWkloEzUX6EAxLjdRSrtqMiSaht+NitXA5Qa1DV9GudmGLb9Uy+uQ/5P5F/pZVgS/bJgX21nF8vyDi8UumBwZOhtrTQAEIcBXJTz+aJnmalFTrfHyQPUcIo+0Wt2fITGXZPc+OUMNb9iCJ/YDcR+YF4ba2DasNmmzFeoOLaxeooJu93RY3BAgFLh5kNyerToSNl3aIbNEMfoJmkDTPch5J1qjkriqm9ZWz5QVDH02ZaEYu/UY/HOJQATzo/KCmRKB6cLShAT9xYoIm43CjrOBepxlCSMly5dC/TmR+2SMw8Fik7L6lsOA2at9KH6oC59RdCu1M4eAJG2Fl28R8UrIlPs6G5kzyqdorJALN0CqHC+/e0WzwZNPM0LwGW8vmV5PI4JtLMrKtq1anlT0UBM+2rOTJNtyneH46EISo4qZ3JjY4/vAsa9Yk3N/0QKKB3RhSu0pciqwtFM5EVxFQ9L9J20gwDsHwjOaeFshy57v9UHekmQXx2crP+OSzty15Te+89Mj+//pIexQrPOhTcPs5/xNGxM6UnR8etA0Wfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(11063799006)(56012099006)(261022105027099003)(10067099003)(261026121527099003)(261028144727099003)(261009223027099003)(261026140227099003)(18002099003)(22082099003)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N21uMVpIUG1Jc25pcE9Yblc3ek9SUGJmVTZNWjNjVXhvaGZMditBV0dUOTBu?=
 =?utf-8?B?U05NNDNOMU9JUnZzWnRLZ1FYbyt0UVF5dXQ3WGdhTCtaSThVNEYzdiswSU95?=
 =?utf-8?B?UTQxODIxSDc5UlZTc0VCRWRLVWpDQ1J3dnVPSWdpUk10aHpIbXNicmpLTjE4?=
 =?utf-8?B?dFVqZklWU3dUSmFCYk8rU2hkQTFoOFhNRmFrdFJxM3ZhM3Q3OE1nT1V3ci9q?=
 =?utf-8?B?N2Qwc0Rsc2JLUGNvREJORFdMMm53d0VHL0R4TlFERU9aSEJYWW92NFBhdlM0?=
 =?utf-8?B?bTd3clpjaTREa0RLTFZKSktuMktGRE9pbVZFREtSRVVDQStDcGVHM3h4Y2NH?=
 =?utf-8?B?UlRtYjJYd2FMRzJoUTJIaXk4Wmg4bHY0Zm1GTWdFclVYbUNJcU5TUStNdjVz?=
 =?utf-8?B?dmZBeEhIWUNrcXBPTjU2Q3JhME1tRGh2czUxa2NoaVQ1Yk4xUDRuSS9SdXRm?=
 =?utf-8?B?ajMxQWIzOGYyZ3o1djZLaWlTb0hQVHFQdmpZbzdBdWJGS3hmQllyQzJ0OGVj?=
 =?utf-8?B?cml0dTBWNThCQW14M2hBNVdoeHNBS2ZJQ0YvZ2llR3VTME1NVG5OUGtQbmxZ?=
 =?utf-8?B?MFhRU3BqOXQwMjdnOFV4enU0U2ZsZElTWERFUVRhUXhBU21ESXRYekVWeXUv?=
 =?utf-8?B?YTFqT05oVGg3MDZzSk1JaGlCSU5mUElzQXE5NUJjUUhSdHA3Ty84TlFVc0Jp?=
 =?utf-8?B?cUpXeWRtdjd1MitFYjBNRlplajU5ZzhlaGI5UUVGRjVRQ2xrbVdXVVVnd09B?=
 =?utf-8?B?dGpKZTRBZVlxeVdEaWtKZDZGWk1uWnZxVDVxNHFsRlRnb3VKZFFYUzVrRytB?=
 =?utf-8?B?UWNFTU90YXNxdnVUR2s0eU93Wnk1cGhLbEF0QzhZejNYM2RLTlkya3hWSDBs?=
 =?utf-8?B?dnY0a1R2TlUrclFLUG44bjlLSVRTS0tjZ2YyS0ZlcXgvRWkzUmpoTGk0ZTll?=
 =?utf-8?B?R000WHUzNUd0N0lFR3BZdlpMNXVheG1mQWhicVFtOUJCd1JmWDFkN21LN20v?=
 =?utf-8?B?TDhHVE53dSt6VzUySkNYMW90bkQ4MXZIaWMwWDJtQUdoUEZIU3RyYVo0RVg0?=
 =?utf-8?B?MEQzUXV1K1JpY0hlZ3gweHl5VVlVaUpkbDVaT2VyWG80QnNzVDQrSXB1YXdY?=
 =?utf-8?B?UmxoV29PekVwdFcxNlhiaWhGcVNOVW5RSVpTN1NWTE1LdGxodnJzS2JHVHY3?=
 =?utf-8?B?eHg0QlpYZlpjaHZNSC9hUm1jWHlzdC93cDJFaHBKVm44NFVuZndWM0o0Wm4r?=
 =?utf-8?B?TGNRZzFzZ1JNYktmK2FNcEZwaEtSRlN3UlU2ZGVIMjRiL09YaTRNL3NadnpU?=
 =?utf-8?B?Mk1uelRMYUM5cCtqWkZEVjkzYUx6MTJSenpYZTRvK0JZNHNtc09RdjNlUi9Q?=
 =?utf-8?B?N1pvb2hJbW5GYnFlbzVPeFEwOHFHYXlrQ2E2eENXcmFTOHprTDhVUG9HUjV4?=
 =?utf-8?B?emQrNlZxSEFvc3hzU3A4eGdaUzN1cG0xWjBzbCtBOUtnNkFIaWxqaE1IY2tU?=
 =?utf-8?B?VFA0NEk3TVFYbElyTWtQRHVFcmI1dU1PSW1zSms0VkxTVUtHaENabHZ4Zm0v?=
 =?utf-8?B?WmcxN1kxN1Z4aUYzQlhoZDNxV0VtZjY1YXpBWDUrV1F4YUNJMWFCQkVicXBC?=
 =?utf-8?B?eVF4TDdQZllMVXpxL2ZHaVZLQWVXTFE1OUg3OUZnaGYraWllOXBYajlZVVkz?=
 =?utf-8?B?T1BWMlVVMjVMQUFFaGdTYjZrZWdVV3dpa0JvOWN6dFNnZWtiVDhOSlhVM21L?=
 =?utf-8?B?d0lwc1RkQ3NHTFlYYkNTSU1jMC9zV1BmSzNMWEdlOFZ4UjNHWEtHam9iNEh4?=
 =?utf-8?B?TEJ0cUplVkVkZ0ZSbVArVWMvcDhhSVpTMW1BZ1lBN0hhMkJMSXduUzVTUXFD?=
 =?utf-8?B?LzlKSmhvOE9tMWJnOC9oQjN4QVFVeHVuZC9Idkw1alF0dW5RUThEOGxoaGY2?=
 =?utf-8?B?TXdiNlZXQXMwM0xhaWIyOUc4UktKNUNHOGVlT1ZubzlySW1MdlhIRlZMVDdm?=
 =?utf-8?B?bXB1YkVQNHdSWVMvWFg1cVJ3YUJreGJuSjRUVzN3Y2RjeXpNVjVleTJJUEJI?=
 =?utf-8?B?dG9nWEdKOVFpSzQ3Nis5MmI4ckVvQTVBZ0EwRTgwazFiWjlIV0hEaEFJdlJv?=
 =?utf-8?B?Rkh2clNBNjkzSCtuMndnMzB2MHkwbjYyTUVkbmFDQUEyczVrck1aVTFXZUs0?=
 =?utf-8?B?UkNzME5ocjZOQWgzbWR0dlE4SU1OZFI0WXhYOGViWG41dkJuS0pEOWkveWNC?=
 =?utf-8?B?dFU1S3ZJanBKNk9KWnhRU0FWaTg5N3lPTlVma2UwSGRJbjdSUStEQW02YTJh?=
 =?utf-8?B?NFdzdWM5WHRma09XYk1yd2N5dDVlZGJyMlNPMmg0OXYzdi9jSG80bDltWmds?=
 =?utf-8?Q?ZECfyhR3/EnCEkFg=3D?=
X-Exchange-RoutingPolicyChecked: qjzLMYKd84hFA+5GvZLCssmR9bcEn3ES1ejMoTsZgyQlQttWLIOl7u4Zj7PhJ3NspfG9mtU1odVZJf/PNTkh5B1hmbgFQYidizYCbDtT9R/Ukb79SFQ7z0rfvNYFub7QHFWJUsMdHEmhk56ztQ6k1KgYOOpdQjYuq7wHFxpNA4JbICwazKRAKliRRK4cfmY2z3JYppkGGaJAxnUFBYMFb7PTkhzV3Kxyp1a8+eowre1q0pE4TOdKucOYxyp0RsqqctufOcyavHjnE1Vvo4rzSUfvyDh92K5H6RIZby8Knc8KkmyO/RYCG5I/E0uZ74eEEfty+J2PmCOatDWkw9RmoQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcf824d-e16b-47ce-b2ba-08df3f624397
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 19:38:58.4613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V53MfNWK0GAz1SSwHMX3NOTOehAkxZVKcCw7Xw3RGVGeTiXr846f0Nu2JBAjKmPxNBfpu0tkO1tUsr7ovTpK4WzPtnbpb5qGtvVG7gO5Yus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9635
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: NFro4OL-RwUdPUDYUxTl3jSe5nf23yBR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NyBTYWx0ZWRfXwVDSu5Mqx7VN
 aObcjsfjlBk8u9sSDMyPrKfsOMn0r0eR2XpZK494JIGSor8AJ6nvCYCiKUj2WgpAW5QGFKY7a0a
 VrIrhmYXR6RrQc0J1kiuzVwQsS0n0/rBgVpi4Mt0RxsnRd4ZQHGx
X-Proofpoint-GUID: szckN0hmilPVFr1i1GTnBOvBzR0KBdVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NyBTYWx0ZWRfX7ePBhTpKgr2Y
 pFAgZnCnuQVqNLwVI7MIaPFwxngpRWVEfMn3zmLFSuWdGIvyE9DwhOOzLdUzEbGfWBcd9I2xerF
 7W7Lvs4RLcOk6PZjhQqDA991b4ZOqCP2Y43MyYo4YL717DrdNZakms5f/Ce6upKUKauqwltHU3P
 W8lD/WllvgZ+XnS+FUVahEO8mGxLEL44ZVqoSqJmU+l2J3vfbu/b0calqEm+4GdqZHZV+FM3JdK
 t2G9uy7HaeynK3GVvCDh+tSDcCjV1KxNF/VIucdhCe6RyV1h838UbhYjnu/9m5tl0fxnKERz/8+
 OPQ/Y4+BaVUX0ijekA8JGPB/OxJXMqMpNM1V/RJntd+s5k8dPNds4QVQ7zeOaX0jLVVh5QMr0DS
 yjbkQ4RaIFu3V6F1dw1RX8p1CgFgq7xDqjdF8/OlZb/uH4tKWeemJSP1ZX1aC2Cjg13b1+0/HUv
 3niNo7OtGeNCPGtgaag==
X-Authority-Analysis: v=2.4 cv=X9bHu2Te c=1 sm=1 tr=0 ts=6af372d5 cx=c_pps
 a=MceEdFpa07MrPAxPau0EtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=zyeXhFTpkExpCtfxIQIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8
 a=ymD9p91CZmGwUDRHDGEA:9 a=dPPXh5-fJ2FvkPsJ:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 19:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249930

--------------D92uTKPv4mG0o9H00bVx6X9L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6AAIpmJl1085695

On 2026-10-26 10:36, Ross Burton wrote:
> On 30 Sep 2026, at 08:34, Himani Ramesh Barde via lists.openembedded.or=
g<HimaniRamesh.Barde=3Dwindriver.com@lists.openembedded.org> wrote:
>> +    for prog in ${TIFF_PTEST_PROGS}; do
>> +        if [ -e ${B}/test/.libs/$prog ]; then
>> +            install -m 0755 ${B}/test/.libs/$prog ${D}${PTEST_PATH}/t=
est/
>> +        else
>> +            install -m 0755 ${B}/test/$prog ${D}${PTEST_PATH}/test/
>> +        fi
>> +    done
> Use =E2=80=98${LIBTOOL} =E2=80=94mode=3Dinstall =E2=80=A6=E2=80=99 here=
, lots of examples in other ptest-using recipes.
>
> Ross

Any progress Himani?
Any questions ?

v5=C2=A0 soon?

--=20
# Randy MacLeod
# Wind River Linux

--------------D92uTKPv4mG0o9H00bVx6X9L
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6AAIpmJl1085695

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <head>

   =20
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-10-26 10:36, Ross Burton wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:7EB8E0D5-83B6-4567-9FE7-A9CBB89=
40435@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On 30 Sep 2026, at 08:34, Hi=
mani Ramesh Barde via lists.openembedded.org <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:HimaniRamesh.Barde=3Dwindriver.com@lists.openembedd=
ed.org">&lt;HimaniRamesh.Barde=3Dwindriver.com@lists.openembedded.org&gt;=
</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">+    for prog in ${TIFF_PT=
EST_PROGS}; do
+        if [ -e ${B}/test/.libs/$prog ]; then
+            install -m 0755 ${B}/test/.libs/$prog ${D}${PTEST_PATH}/test=
/
+        else
+            install -m 0755 ${B}/test/$prog ${D}${PTEST_PATH}/test/
+        fi
+    done
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">Use =E2=80=98${LIBTOOL} =E2=80=
=94mode=3Dinstall =E2=80=A6=E2=80=99 here, lots of examples in other ptes=
t-using recipes.

Ross</pre>
    </blockquote>
    <p>Any progress Himani?<br>
      Any questions ?<br>
      <br>
      v5&nbsp; soon?</p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------D92uTKPv4mG0o9H00bVx6X9L--
