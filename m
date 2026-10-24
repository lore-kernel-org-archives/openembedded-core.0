Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1771.1792801352807253714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 17:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JN3ohnfi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4757d52eb5=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O0AlWS2787938
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 00:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=wbktBi2Sk
	YYDKnJgK3Vd8LP8rnETktEoNyMAXM39T5A=; b=JN3ohnfis1Gg4bMkDCJu2d9LR
	EMEvIi5+doOuXql2WZhBHmDESW0HIKEAxdsQ3nz66YaSfWABdSFIL7jK6iXupUPB
	mMp/nmmDEfZZNDYxk6EPVSMGDm9/KAjIBsclX74ZrdvX3KBS6jqvSIBdnoRAKOcr
	n9yPyE7dfNV61Ir5eHF/JdAlr/lt+sqHzonmQ9PkTZM1AOKVZRU3zygtPy0uJ9GG
	rgsV2EbMNLBZAQMk0rmIIm/LxHH275Rvnk0jqXYQMrlJo9nXX8vk2UfHXEf5i3Y3
	q2oOpDAy/9etOSFpttXj1i5AJR9rJJD6pGMgPv7RDzCN7mJWi8cpwBjXnD1ZQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023108.outbound.protection.outlook.com [40.93.201.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hghvx808e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 00:22:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qm7vwr+Mu5E1paO/FArKvIaGnZOQ5D1BbLrCkIpKgITLg8lU+9j4iStrNlwh1vpz4Sce391PDkOkXn1aZVkg/M1UVvrVk42AB7ZqPcocdCqMwPhUCIzP2i/AbkTnXK3M4W09eDUvoFf75kunPmDcp8XsWIOcu9iFtGjWTlzJpU7jL1FAKRK8kOy2iOs3x32dBRkMLxPPFRDJb5d690Rn+5ILTPIkdUmg0ZLCoOHjRF///e+Xh3Rn3RFDxHjyFrdl327Gh0cbqHUl+ReJrpyzJ0ty6A4kjFD6AAYj/yqSJmy2E26xf0Hivz+9ceXqTHcLVDPuTXAF/M51gN9xVrftdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbktBi2SkYYDKnJgK3Vd8LP8rnETktEoNyMAXM39T5A=;
 b=uVP4mQBQhT70P35KlupE2AK7J3SIyH9u6VOYmM0AKEAGLffWiPh39Ph6XSRWwmruQheknoF4PUPiUzR1H8FGalBy25Q4u6n4M5cinyNjcplMfoZf+w2cLXVGdsGWZ/LWVY/3KDpt32exZv2C+quLBHXUlPXjz3KWlNyZJXI9hrmv4Zk4pFdISuLr1jgVnLnbn3v0+SFsL6toiq/OfUDsFC/WHlZo8BoXVaAaDO5NiKi+KUZd9aJaBc+xLDGCIn/cuhkjf4mUCJvUB6wPTKleVWCQ29FZpo7XQyx+Vo8/zDU830fw9Dqk5MgTFFPivg1kGdJld1MwXCaY4/CyoGR+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB894536.namprd11.prod.outlook.com
 (2603:10b6:806:532::22) by LVWPR11MB9906.namprd11.prod.outlook.com
 (2603:10b6:408:3be::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Sat, 24 Oct
 2026 00:22:27 +0000
Received: from SA3PR11MB894536.namprd11.prod.outlook.com
 ([fe80::2af0:9d0a:b8a2:bcf1]) by SA3PR11MB894536.namprd11.prod.outlook.com
 ([fe80::2af0:9d0a:b8a2:bcf1%3]) with mapi id 15.21.0546.016; Sat, 24 Oct 2026
 00:22:27 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: sumanth.gavini@windriver.com, randy.macleod@windriver.com
Subject: [PATCH] ccache: upgrade 4.14.1 -> 4.14.2
Date: Fri, 23 Oct 2026 17:22:16 -0700
Message-ID: <20261024002216.655871-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To SA3PR11MB894536.namprd11.prod.outlook.com
 (2603:10b6:806:532::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB894536:EE_|LVWPR11MB9906:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8864ea-c33e-43ec-5562-08df3164e21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|261009223027099003|38350700014|260925021311599003|260925021911599003|260925022911599003|261022105027099003|56012099006|11063799006|261021123027099003|261021121427099003|261009220027099003|261009221727099003|261022075727099003|261009223327099003|261009221227099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 1zUYQGttN7nFv7iIi5aBiJx6nnGoBdlfIKWvwAs3gt9V+pXXmyNvlP9aphUA3X682hI89x7h2xh7Kf6N6IV37eJfj2V+Tm661FUyBk32eu/EYpFGu+nmrmoI/UEqe8tKk6zAqiD1pC+ifRprbwWQ0Y4VCWTeM12jBpkSnfJ3QhqW+cxo2UFfFjAEbNwBa/Rul+dDgR/UgroUi4XFoyaW3x0gYXf3ZLPvQPOYR/rtXAllpJvk7aMdGSU8e+c6OAa4FaAsKa6NMH9hYxME1bseUACkjDsvzza+C9v473goVnwpWJ0mS8o6dkR5Hjx0fe/eTNSkgLCacxYFjudQdbaU70TFyHydGP76ZElPkDbGTfscLTihwv71THNBJoKRgwastXeB71tbAru1X4SZBYSlXv3BF2HdsRNibW3Az1+S/3cZ0hG9ubHCmSxlttuQLZOtHbPD8aptBm6On5qhHScYS7fhsQRh4+2N0YIqVkyApGPcnAje7jETXLA0kgq4wdzoPwXZ6lCsEYCCn2UxKqPp7VK+kMSI831/ldp4XR4v4iwvYLgGXg9cshrD2P0k+YaisNGxBzwzfgHlYvSysClqbTBC6b4pmC60juHd+o1NuT0I9pYy6+OPJXIIWOBKyGiHYN7jHuQ+XbXbt6jyFxuq+VNhkStAAWF9t5xRlkKCf6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB894536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(261009223027099003)(38350700014)(260925021311599003)(260925021911599003)(260925022911599003)(261022105027099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261009220027099003)(261009221727099003)(261022075727099003)(261009223327099003)(261009221227099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlN3Ylg3eG5WbGQzaWw4V0hzRWdVTnBGaHVoRHpEUXdMbVlFS3hQc3ptSlUy?=
 =?utf-8?B?eFBxRTduMGdaL0xhdENVdytoZFdKSnMzaktuNzdVdVh1ZUE2ck5VT254NjJ4?=
 =?utf-8?B?ZDdwL05NRFp0akxDWUMrZ3NYV2x5aEtCbDhBZTN4UUpyY3NySkhDWEhZUDhH?=
 =?utf-8?B?TlBQWVZ3QVp4RmtYOHRvMmp6N1NnTHhSTXoxRnpMcldRZjErb2FBdFRFNlRN?=
 =?utf-8?B?TC93R1Y4azJ5WHdUaEl2L0pyQi81SFBnSnM4Z01ZS0pvU25rZnVHYWRQOUhs?=
 =?utf-8?B?YktZRVd1MmZITXdINTluajFuMFk0YllaODNYKzdPRWZCK3lUMzl0UHBiK1Fy?=
 =?utf-8?B?dnFQN3ZqS2tLclNHWERXRGM0ejJvR1oxNVZySmdmUGhpNng2RXBjRmRQMnBp?=
 =?utf-8?B?MWlaQ0NqQTdpWHJ0QmZKOHhXN1FJckgxV3RQRURvN2ZkQ3lqYnBpVTQ3M0VN?=
 =?utf-8?B?VzByZnZqdCtFOERpeU5LWXFMb2hWVy92TkZwRkFIMTlTU09TWnFzVmVsdTVI?=
 =?utf-8?B?QkJvSzFlTmRjc2lYS29tMXJiSCt5N1NvdGF1SGg1Rkc2ditXM09mOUNRNjBw?=
 =?utf-8?B?MUQxRnRmNjRiNzNFOWFoVzErQ01lUXRBcUxCK1hnZ2E1ZlJycUpnMTlOWFBz?=
 =?utf-8?B?TWU0dDlnekFzVzRYSXM1elo4T1ZHYVlzQUx1Ry9venBvVEw4ZmNGTWZBYWxy?=
 =?utf-8?B?Z2grQmQwejFRM0hjYXlpY1JZVHVZN1RjN0NhOGd0bXlqUUtPOGR2YVRlTGZ0?=
 =?utf-8?B?WWhxbk4wWGtvZG9EaktMNlk5a0F2RW1pZjBSTlhhTjgvTWIxeVhienhwdVFV?=
 =?utf-8?B?NUhoUHZDYnA2Rzl0L2RnMFI1Y0llRkNtZityZVVHczJNYzFkbWc0QTNZemsv?=
 =?utf-8?B?NkFQZ0dJYkJ5QSt3aGFRTGtKWVdlVzJTcVB1ZFRUM3RFMldlZE5udnRZcEJE?=
 =?utf-8?B?MUlmNkZoZGdSUWkrSHNVNUh1Kzl3OWF4Y0NkSk04Mms5MmF6ajJlR2lzVHcx?=
 =?utf-8?B?RHVpUUREdFZTOTZyK3NBTU0rY0JOQ0V5RENzenl1TktNbTRnMkFLVDlaRzdk?=
 =?utf-8?B?eE5oTkRkQlUwTS9wKzN0Mm9meUxqTDFQd0ZYazJiT2kvWkV5ZmJ3bXIrY0dp?=
 =?utf-8?B?ODloeXNyMElheHVUZ3lndERFQ1hVQXNYWEdNYWZxZUg0UElJejZibTlxaGl2?=
 =?utf-8?B?d2p1Zlpqa2dIeWdUVURFSm9tSlNZUjFKWDJLbExSbzkwZDgrcFEzZTNicHNQ?=
 =?utf-8?B?QW9qMTVKRk5kcVk2d1hRVDVUazBJU050NWF4MEVrK2xNTklNVGJqMzZGcE9m?=
 =?utf-8?B?Y2xIVExnRnN4SlM5b2pXc2V4emRLdnJRWXB2bUFOeDlkakVONTFqaDBreDMr?=
 =?utf-8?B?WElOZEFOODljYWR6NlZzaHZiS2NZbkhFbUQ3MVhrM0ppVjEyR1RKSlRZMnM2?=
 =?utf-8?B?ZVVJL0RPbEc5RHhzZWtvQklBQjBoZTU2QUgrVC9BeTFuU1M1dS82TWxyNGx4?=
 =?utf-8?B?Z0dCZWVhT1M2TmJUSEJUNzVOUFhVczl0VkpVKzFjTkhsREZYamR5VCszVmNM?=
 =?utf-8?B?dTNTMWpCT2ZHRzBpbG1RYVpGd3NUbGNQOTM5K1kxN2hhZXdsbkFIL0NOSGZO?=
 =?utf-8?B?cGExMkZUSHdOSGRkdVFoR0FLYkp0N3d0OWYvOWlTenYyNmpYbDB5aVB4WGpT?=
 =?utf-8?B?bDZUTHcvTWVlSVNDSTZNWEJXdmhHaEtYZ1JlV2tFTkZsL0crVW1OU1UwakIr?=
 =?utf-8?B?VjJmek0rVzhWVlhxcFVEUitjOVoyN3llVU92QTRkN2VYdXdDaTBXRnVkb0NG?=
 =?utf-8?B?YkNjaGRFTGV0OStTV1ZmOXlQZ0xWN3BWNlJqT1prdzlBdDQxcXhoWHg5Tmc4?=
 =?utf-8?B?L0NYbWxMYTkyRktjNHBiQk5WN3piRm1VYW94RldoWHV5dGZaTTVaTjYzNmJ2?=
 =?utf-8?B?UzVSbW5ra0hGeENDZ2tHblV1QnpKdHpLTlhmMGdIVDBGSlZ6Z2x4a1dnWlZo?=
 =?utf-8?B?OHg2TDFsOVdjSmZVQUFycTlYTjZSMVJldnNwRjZkUnRsVlhxdHVtRW5NUlY4?=
 =?utf-8?B?NEdlOHJTaWZBT1JreHRqV2NlNjlUSWNxVUpYOS9pdHVrY1l4WExad3Z3bDk1?=
 =?utf-8?B?UFZjS1gweE13VytuNFRxVmRjYnVBT2tjczdocmU4dWxISHlXYXdhcmVnU2NY?=
 =?utf-8?B?SnY3Z244WUh5OCtxRDZ5ZkNPL2RYVGRVOGR0S3lSaUtzYlpoL3RLM3lESXhP?=
 =?utf-8?B?RG41ellBaHBVTlNDZHpOeE8wWGRoYlRSeFJ5aWxYRGl5QXVtL0VXR25Fcjdx?=
 =?utf-8?B?MU52MzBqY2tQUWREa1VHS0gyRVBBMHJPcCtXUkdoOENaaWZST0ZWNlNmbi9W?=
 =?utf-8?Q?sLBSESjqBL21W5ss=3D?=
X-Exchange-RoutingPolicyChecked: FHLPOfo5XJ4dAidtPiZsKDvY2mPuMYf1C8qGcsadJk0lQSzQm1/co0maaru4DUmy5LO+bWfN7Bv5F02Q9f92Nmn0KkDJG8cfORUh0ta/C3EIQVYSPL/bpFiNS6JzAdZWIkvOyBeIZh3tmIh4L0+T4BqyPDL6KWoyJ4tLc05eT4hNWDoB9rNq0Agwja4KznboukB6DVUIEh4MXbE7tafGYkK3A1hzFufUz/XRAmum5z0NnHqivXwgnzBTuU9V4FU/sBCzipLUIIryU0pZunvZICC2gk6I6S/Fj9wyMMCVSXj6UPjhzWSxAFKHahZB7onhVGNgiyLxzEq4HtTf+avENg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8864ea-c33e-43ec-5562-08df3164e21e
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB894536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 00:22:27.0818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGJAvay0RXocJ8MR3+Wj1a/+40ZICtpyJhOM01VsKyF8g0RLGisK7jvJ+RnB+I6r23XL7IyBsVJkwbJgNT+c4tC8KwwYcU4a8Efgk7hS3pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR11MB9906
X-Authority-Analysis: v=2.4 cv=Q55HcI2a c=1 sm=1 tr=0 ts=6adbfa46 cx=c_pps
 a=zpEXwJxT+I6ikN8M3JpNfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=2fNrBjVF1cKshuxsRwMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX7gpWuTJviWqn
 roBWoNzZQ/GBttjXlcX24zEVBAGVq4dhJNCyYWIHACnOgPTx9V127heacVu9NwW6Rj2EWVUv8C1
 V2Icf4WCyunbyI2giaaBQezbka9xH8p0mqToBL5/1/ZR9FURM+Mq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX/8ArdZTgYIEt
 7s6OwD8YaUH9nRLrXIldBPrZUMP6tkcWWnFOVDZ0gRRC9oXFKrbDvmAkNNW2/dtQuRKxk70QF3W
 s9VUA+CJFg+125WmEKjBQr0CglqlIW/+d27LVS/oOXOGqtTz66JW5tZ3cBg8VhGr/zbGdAOG2Hv
 LtdgJNGLzEtmPFflXoD0ycFOlcDyrPmO10fg0FJlGc/zwZ2yRnVUolaodu4FUtXNmRdxeiL2vxG
 ICRh2fWIUo1tjl98EdQ4b2EFJX3flljhEBjNBTKz5KUEX6e0bPfF8ZN1kvpdD2C7wO9Tow3vmiu
 sq2njf2fJjzmYJKbUpbz7m86BDX6WlcQPWs0tHP6/ZK9eSGti4I56EaEQPzmhaoXlEkXBPPO4aU
 eoRbHFJwWGKaDzsOmSFbUv6rCgkbG8PYX6V0dFMdl4u84rk/rgzahugwux8sfQrBD/5xyY6hLkT
 PLLgVj8c5AXncnxS2mQ==
X-Proofpoint-GUID: lZMhWAXjzGcI5RrtL3mwSmm-NnyhXIT8
X-Proofpoint-ORIG-GUID: lZMhWAXjzGcI5RrtL3mwSmm-NnyhXIT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69O0AlWS2787938
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 00:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248571

=3D=3D Ccache 4.14.2
Release date: 2026-10-18
=3D=3D=3D Compatibility changes
On Windows, ccache now requires Windows 8 or later.
=3D=3D=3D Bug fixes

- Fixed false inode cache hits on Windows by using full 128-bit file IDs =
when
  available. +
  [small]#_[contributed by Thomas Ferrand]_#

- Fixed caching of precompiled headers with clang-cl, icx-cl and icx afte=
r MSVC
  updates by hashing the compiler's target triple. +
  [small]#_[contributed by Josef =C5=A0im=C3=A1nek]_#

- Fixed handling of nonexistent or non-directory `-fprebuilt-module-path`
  arguments on Windows with Visual Studio 2026. +
  [small]#_[contributed by Gregor Jasny]_#

- Fixed preservation of inherited signal handling, including `SIGPIPE`, i=
n
  compiler processes. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed a symlink race when creating the fallback storage helper IPC dire=
ctory
  in `/tmp`. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed logging of credentials when using `--stop-storage-helpers`. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed spurious errors when a storage helper closes its connection befor=
e
  responding to a stop request. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed undefined behavior when handling empty byte buffers. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed MSVC debug iterator assertions when handling empty byte buffers. =
+
  [small]#_[contributed by Thomas Ferrand]_#

=3D=3D=3D Build improvements

- Upgraded BLAKE3 to 1.8.7, fixing build problems on Cygwin. +
  [small]#_[contributed by Joel Rosdahl]_#

- Added a missing `unistd.h` include for `geteuid`. +
  [small]#_[contributed by Joel Rosdahl]_#

=3D=3D=3D Test improvements

- Made integration tests consistently use object file comparisons that ig=
nore
  irrelevant differences, requiring `eu-elfcmp` for all compilers on Linu=
x. +
  [small]#_[contributed by Gregor Jasny and Joel Rosdahl]_#

- Fixed creation of the input file for the `.incbin` assembler test. +
  [small]#_[contributed by Adrian Bunk]_#

- Fixed a temporary file leak when running unit tests under Wine. +
  [small]#_[contributed by Joel Rosdahl]_#

- Made integration tests fail if they emit unexpected output on standard
  error. +
  [small]#_[contributed by Joel Rosdahl]_#

License-Update: BLAKE3 version string in LICENSE.adoc updated from 1.8.2
to 1.8.7; license terms unchanged.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 .../ccache/{ccache_4.14.1.bb =3D> ccache_4.14.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.14.1.bb =3D> ccache_4.14.2=
.bb} (86%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.14.1.bb b/meta/recipes=
-devtools/ccache/ccache_4.14.2.bb
similarity index 86%
rename from meta/recipes-devtools/ccache/ccache_4.14.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.14.2.bb
index 4dd8da212c..eae9a33536 100644
--- a/meta/recipes-devtools/ccache/ccache_4.14.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.14.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE =3D "http://ccache.samba.org"
 SECTION =3D "devel"
=20
 LICENSE =3D "BSL-1.0 AND GPL-3.0-or-later AND ISC AND MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.adoc;md5=3De89f26e9f97d14068047871b=
db2b3118 \
+LIC_FILES_CHKSUM =3D "file://LICENSE.adoc;md5=3De4a0db390c3eeb742b398ac0=
10a70913 \
                     file://src/third_party/cpp-httplib/httplib.h;endline=
=3D6;md5=3D663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/win32-compat/win32/mktemp.c;e=
ndline=3D17;md5=3Dd287e9c1f1cd2bb2bd164490e1cf449a \
                     "
@@ -16,7 +16,7 @@ DEPENDS =3D "zstd fmt xxhash"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
=20
-SRC_URI[sha256sum] =3D "dfd2b9e446b2cf68e83e21b25317d8f868de6f1b246c7e99=
e04d07f4e1b0b97e"
+SRC_URI[sha256sum] =3D "35921f80a93d6453a874525f2e4bd97264c46ddc349d87aa=
cc1032cde4dd2924"
=20
 inherit cmake github-releases
=20
--=20
2.49.0

