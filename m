Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9691.1795071526736275057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 22:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Qwhg+783;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5783957acd=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v9gs2274493
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=KkvGuAm5Y
	sr50KQIssH8LXOywtukdjzC5Os2JEmra8E=; b=Qwhg+783K+yRVf02lamVGu3Z/
	mOgtW+mjIjMQy7G7XC1n4UoELgP+ZLMs6GbF6AkYKD1YNINCgquJcAT2BZUkP3QM
	8spQYyMzC8sEQtnNPl3dTYlTaO0lUMDu8pzu4Iy299TW0K0WghNcPRDDIzCtDYAa
	Q+CigfnUO27N72bsqNIUznS1XptmQ0dE0Gme9aid2iVy3spqcW9lp9OdVRxr3Qd7
	IUV2PjgkNuGdEx6e7taSyXRkIkrvYjqMY4XTSSvUYiEnOm+7W7MIvRHPEF9O+tep
	/ZVKFVLLLXqPxQ3XeALTU32IyqvxK0dsJA4BVfyKMbeziFPCMcifuvcJLp4Yw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020125.outbound.protection.outlook.com [40.93.198.125])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvh5k06-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:58:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QM7bB5vAFIXvx5oAnqZ9zlY775El4iMt0xPWgqosbaaiVY5cwqv+8scEcP+I3YyyHAEDhMD4wAqhe/iXlAq7+fuhqLDrCz+mA7ymgp0iJZzrY8k+m5jFPZ1yeJmuictZuosEEheHUGdAce8tAzCGPCRnPjysjrxhG490Np2aLcA9ycUUXqgSH6bTzkJIkBkLI70ZH8MWnVL0iXw0w8xdcMabj2b0INeRuGdT8AM8LWt8l+Qn7G1vqrUHcqo1qLaXEf3sVcg4kcmIDx5n5n7bpzce7RMCubXDNpl7zvoNH2gvQ0Pq70ueHnwqlqQV0AezA6plAjsBS9TwRLRlfmoW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkvGuAm5Ysr50KQIssH8LXOywtukdjzC5Os2JEmra8E=;
 b=cKqoz2EuEJPFxvTfQ05zzDulR6wiXtEnAVTSuliM6m87qXRhn4iJCh8bsfuVYvWpDyEF6qiEKi5hmcuwNHFYl+S2jO4lM8ENZ9IWDTQqtouh/arONSBQ9dW5XcTAu2IhLBfrB9ZTnu1a/NMl2wReWafp7b7TMbD6LgOKYx5hI47qMW39DL1hY7XniZWQH0rBLcaFABi/+BfhdaTx6MNmGfdKG+4GPpEeNq7ds3POAl1Qw0RbpSJN1VhzXrSW04L508Ll9vfkLFVBNTY+BSNe6A1YSOLED0eJEmPDA8PezW4UoDIyLuM8/gYYSZuPpBl01RlQUxVB1oiT3s2iV7Q6CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by CH3PR11MB683941.namprd11.prod.outlook.com
 (2603:10b6:610:360::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 06:58:41 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 06:58:40 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@Windriver.com
Subject: [blacksail][PATCH] gcc: Fix for CVE-2026-125709
Date: Wed, 18 Nov 2026 22:57:18 -0800
Message-ID: <20261119065723.3723895-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|CH3PR11MB683941:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a1716b-5d7c-4462-eb61-08df460a8b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|6133799003|261009223027099003|260925021311599003|18002099003|260925021911599003|260925022911599003|3023799007|261026121527099003|261021121427099003|261028144727099003|261022105027099003|261102123227099003|56012099006|261026140227099003|10067099003|5023799004|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info: TAg+bn+kzQlA2hpe5QFhYws6EH2Z8k5jy+RwYDoor5TgUt5bgcXUXJVXBcL1MyISUcxAZQD13WVEf98X8QQH49faNFWaAv5iOd0eT/pAbHPOo1IB2TLE/9c0H6SR6OHHVYHhWjGSPHwQpBVk/5dy2nA4357GrnNHDsFtrxqBqCDFgCbnWxHKGs6ljjGM78TiozrHuH7Ycn1Me4BZVP2c8B3sDGS9pXZ/ZKJiqLVZ3I2hiiQSh6jvlouCLLLp5eNWBAJPF9L35mX9j2sR1Xsmp8IIrr56s1YAvb76vjNgmdkA3PXF64CwCcW3Tr3KqBXpsQ15YDCxBh+CzxSFleJ7y5A9Jpn/ktUQXX2Itfg4FqQF0ltZeeapVUzk5yL8bTlFOqjIwm2MvjlvRyJtTTS7fzwNpbi0+z5uq/WIx8FsjVnEGa0YlEIFGSLdiMH/da8fkkzk0zdc7T6wVqeExSYC+bG3+aBRj++Wo5Bty/1g1is1ZuLVy6lU9NRGxKkS4Pgi9qIXylmRFP6XBBCYiP//hfqQ/fYd7I9iSIdmQk644u7PCpeqQYFWPFklDHWvBs2p5sQnKwmtObQ3anYPIs16JkLY8Eoc73r7jBPKyaEidzncVgGY4D3LpLP/tq5QW83ocKLwCIUa8cOE7rRkUEGEnv7QBzYZ2rEXfo5IMixYwtz4Tzas+naq2A/r/9OKOToXN2ZFv1MdnGifdC5i1HyzZu/goq10sKuYLyKQDx8uiFA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(6133799003)(261009223027099003)(260925021311599003)(18002099003)(260925021911599003)(260925022911599003)(3023799007)(261026121527099003)(261021121427099003)(261028144727099003)(261022105027099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003)(5023799004)(38350700014)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmFheUVRZ1QvSGRSQnByQ1JHc09xdU1tM1VKeHBkeVdSS3VTUEY0UTJsTVBB?=
 =?utf-8?B?dHIrZFJYU2hHUTN1ajl2WnJRcU0xelpNZFhDRU5ZaEFsRUN5WXJvcDA1SGhV?=
 =?utf-8?B?aHF6Ni9mUTY4ak42azZGTTZtcnUyU2dNbjZ2ZUZuT3ZPbXQxVVdJd01CVTB4?=
 =?utf-8?B?K0QvMDE3cFJOdXpLaitrSjVNTFArU3drcHJvSVhPOGhoZ043WXFHTGt4R2hC?=
 =?utf-8?B?Vyt6UUJ6UFZ0cnN5cEZNSWFQa3FqM0o2bC8xbXppTDMwR1ZkZzdVUWxJTU9w?=
 =?utf-8?B?RllCYmdCODFUUXJNNWpjUWUrdzFsR1lSVzdaNkZucEFmWm03Yk51N0ZrTW1r?=
 =?utf-8?B?N0t6Q0pFYldLa3MvWjJDRTYvb0dzTGd5dGhNRDFFNjZIa2tuQ0wwWlJDQlVy?=
 =?utf-8?B?SGd1cmdENDVqOHhncENRTitnUi9LYi9pbVdoZnY4ZlVVZVVsRHpMZGlubWow?=
 =?utf-8?B?SWdtcThJVFhzbC9DVnEwT3JGaFcrWW40THV4QmtpYWJpbWRLeWJqN0ZuYURE?=
 =?utf-8?B?ckVWZ2J1bDRhMk16T0dPeHFIWEkrZG1lcEZ5R05mZlppWkRZbXpVcnd6UTdS?=
 =?utf-8?B?OWxJd05UREVSY1d5aUpQQnhuVEtRblRJMVlBdXB6dzFRUk84V2tubGpNVHhz?=
 =?utf-8?B?ZStoQ1hPOU04bkZUOS9KeUxPSy8zdEd3SWZUVVBCcGdnNFBYVHRqalZPZGxI?=
 =?utf-8?B?Tzc5bkpFODR1LzFiTnhPN1dYVnBleCtGZlU2SkJvczM2YWd6OGFFbDdTR1Qx?=
 =?utf-8?B?N1l1SmdnL1NqWVc3dXhyMWhjSHZpblYyK3VmLzNhNFA0ZVlEMG5PU3l2Q2l4?=
 =?utf-8?B?dnJrSERKUE1FeW1GZURxQTkySDJ3WmpjMTI2cEdPV3NyNWVOakFHSnpkMDNh?=
 =?utf-8?B?T2FwWVFCOVVES2NFL1FKK1NSMXd2eCt0TzB1QlVkZ2NKL3NkbVNySlhjNG51?=
 =?utf-8?B?NDZoRldnZTE3bCs4M2ZjQ1FZMVdvN2lFOG1HaVlrSWhTR1NoZFZCUkdPaFR2?=
 =?utf-8?B?YjBwczc5QS95cklJY2hlYVZRKzgrNWk3dElmQkR6ZTFicmhUK1J6LzVOcGxz?=
 =?utf-8?B?K3F0NUM0dmdaU1N3SnlXdklSUWdoUHU3TzQ0QWdMcGxTdktNMmJ6bGxDVlJO?=
 =?utf-8?B?V2ZGWFFKT3FFeUpsUWVsWlhFOHNFZVpVVnB5eGJqd0dMaDJxWVFHbFIrUU9E?=
 =?utf-8?B?aU1pbVNMazhRVkNFOHZGQ3NCZ1BuN0t2ajhtSE1qd0g3anlZRU1rb2tZMDVy?=
 =?utf-8?B?ekJ3Q0V1L0RZNS9ndTE4a1BoR2ZKY3ZBbzdkV3JsWFZ4Q1Jwd0RUcU9KcHlG?=
 =?utf-8?B?Tm1GRjhJd0s2ZTRYYXl3K2ZwdWQyZjJwN0JQa0RIL09nRU1CRUtleUM3SFhR?=
 =?utf-8?B?cG5na3l1UGVrMjI5bWhheGFpK2ZLL1hxVTZkWnAyUnlIS0s0WFl3b0QwYWlX?=
 =?utf-8?B?WDdXWklEUUFRWHpPWGpZdHBnczNGb0hucmZmTzlraGJ5bjZGRTBYeDg1RktH?=
 =?utf-8?B?c1U3dGxPdkk2ODNnNkxmSHg4UU53aDdrK2FHS1dCRHZSNHBSOXZ4ZktsNW84?=
 =?utf-8?B?WnVVTjY0Q3l4UFAzQ3M4Y2tCMkx0ekRYZkNjeVR2YUttR2orM09WR1B5cDdR?=
 =?utf-8?B?SE02bW5HWWNWaVpjZzl6eG9MOHRMTXZmVkRqK05YbFE4Rms5Z1g3eVFmenhI?=
 =?utf-8?B?Z0htZTI3c0ltakhJbDYxVWkxRWNHeFU5ekxNaS8vbEZFMG1LY3ZzZXdIdU43?=
 =?utf-8?B?dHZqSk01UzhDRXAxV0ptL3RoS0Rsc2Zkb2k3aG9ITU5jWjJnT3ovZ3NCWjkz?=
 =?utf-8?B?NWhrZW5BRmVaT3JkK202K1k2UmhRRTFhOWo3NWw2K0lEcktVMkxWYXBhUFBV?=
 =?utf-8?B?VENpNkZnQ09VVzNNbmJZY3VGcTlHUEl2bmhSc0hiQml5Z3lqRlB0SXNURzkx?=
 =?utf-8?B?VkJxaUJkZC8wYitoN1B2ZG5vZVQ4c1hhRmxHVWQyL04vUnZYQlo3OXRmdzB1?=
 =?utf-8?B?N3ZFcDltd2tUQ0VRWWFIUk05TldSUlhvQkRiVlVDWWZHSXpPZjQ5NGNyWElC?=
 =?utf-8?B?dFc3RDd1UlhGeDB6ZFYrZ0FOUHVxOGNvTm9JR015ZlNBRVhKUHdjNk1sR2dB?=
 =?utf-8?B?UFdVWjV0WDdHRlo1RUVJODN1NGdOTUpxUkd3UGhhQ2ttT1pQbGlmcXRtZDU0?=
 =?utf-8?B?ZmNScDhoQzZpNlFyNnVLOCsrdEh0aWpUaUh4QXRxQzQwdFRqYWlxRW5teFQ3?=
 =?utf-8?B?aGhJZXo3K2lqZWhZTWhuSi9Fek1Wb0M1RVlsWFBSaWgvdW4xR2FCa1gxUnhm?=
 =?utf-8?B?S1FPQlIyM3JaU21UQllBZDFNWmRTQUpJZlVyR1dlT0F5cG1zTGRNMS9XMjk0?=
 =?utf-8?Q?1OHRw9XozAXxigtM=3D?=
X-Exchange-RoutingPolicyChecked: YpSCWrK5ynl8QgbIqRvj6K6mHIHMJh6PcHvFMEulnKvsRJCi8t2NXcZT8AF5OGdL/4Gq/1LXfyL0wdDCWmGQDd1mKhRdxLUTn0Pkc3jJZzGNyahRBGjIAtQjmF3Ut7I7W6yGmhtwhuzSXiSj082VY3r1NALWZ9mlILcNDkA9hPCq6J7HBBt7p6w7UafyGl4olP1nuKbQVCvsh3wB9JdyBmtmZrM4DFN4AM+n5XKQv34rUIJZvHDPB55kfceCDDQQYbqUNjvFogWTuYCPMCZCoOY8aL0yD4ZNzWR91GqKD6sfrxN9qJFzl5dvDPSaHOA615BawImMCxpRfiZeh98myg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a1716b-5d7c-4462-eb61-08df460a8b1b
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:58:40.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36WO1dPHwoAde1dWWDr8rta0FQqE0gq4+fty306nUwk3pivnOFcDLk2/VpsCYRBtYy7wAhnOM3bio6G5t+W29fuf8FSxV8Z0AJUPlA4NPy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB683941
X-Proofpoint-GUID: 7fdvKVb7BB75hzhehyaaBpj63rjyiyjo
X-Proofpoint-ORIG-GUID: 7fdvKVb7BB75hzhehyaaBpj63rjyiyjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyNyBTYWx0ZWRfX3BlgtIehCyka
 5ML2gZu85VG/MYy+uCVJAjShg1gssjxCgwdaN6rbYH1LSyxdpq0Gtm9rmsv2DKU7M7jHmGFJoTa
 2QaLK9DlrCMCuh5DCtCXv+Mj8iZm0mGdZslIsqmMfS/TimrjH8ScXV5qPlngTf3+T5Q9+QaBsEU
 xV7nd6FanW5UFc4eo1gIAI+RRxl+PYdubE6DrKV278ugkagOVJt3ESEqWGlBR4hIg0HwwF/eUoG
 vbWlZlRxbXt8JJ7mGeyOGBWtoh8AaUq+v6QCrBzEfn1qMofB8pUHCuLFjMvbwA5mah0o11ErOt/
 Z4sKjG47m8lEqO2UnPyCT3QFE9whRe6OWO2injd9v3qmQUaBh6vhHuUTeMIQBumTCu7DpVTG6Cp
 /HA29BN+32IEZ05UtLN5nZfDJagyY8IJMkmXw5h/H2Du2rx/5QCbVk8wWc2JAxHEhPLiufp9JVd
 SCJiWBOr/oJnsC6gd3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyNyBTYWx0ZWRfX46bsjYKGgjs/
 I4FLyUKkCmBq/zGEze+K1rqG54O5Cts/PCWPo8qqr3xRguiZQbzFpl9knrKlVItcx/4BD96w3fw
 6CIqyr+62zYifOF1ulogn/gek2CkoocxJZGAm9RJJ+3oIWb331UW
X-Authority-Analysis: v=2.4 cv=GNCdgeNK c=1 sm=1 tr=0 ts=6afe9e25 cx=c_pps
 a=CcK7mFmwlj75a9+OSlpwrw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8
 a=j5bqmL3JzUQx6YTb6fkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190027
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6AJ6v9gs2274493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250652

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR118099]

If we fail to write the content of the buffer after inserting the
overflow character into the end of it, then remove that overflow
character before propagating the error back to the caller. Without this,
the caller is left with pptr set past epptr, and successive calls to
overflow will write further past the end of the managed buffer with each
failure.

References:
https://nvd.nist.gov/vuln/detail/cve-2026-125709
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D118099
https://bugzilla.redhat.com/show_bug.cgi?id=3D2569390

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0027-CVE-2026-125907.patch        | 378 ++++++++++++++++++
 2 files changed, 379 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.pa=
tch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-16.2.inc
index 3497493619..84a6175abe 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -75,6 +75,7 @@ SRC_URI =3D "${BASEURI} \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.p=
atch \
 	   file://0026-CVE-2026-102010.patch \
+	   file://0027-CVE-2026-125907.patch \
 "
=20
 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patch b/m=
eta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patch
new file mode 100644
index 0000000000..cb3a437475
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125907.patch
@@ -0,0 +1,378 @@
+From 68b1b9056c70acb31f2964963b51c480ff820602 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Wed, 28 Oct 2026 10:34:17 +0000
+Subject: libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR1=
18099]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If we fail to write the content of the buffer after inserting the
+overflow character into the end of it, then remove that overflow
+character before propagating the error back to the caller. Without this,
+the caller is left with pptr set past epptr, and successive calls to
+overflow will write further past the end of the managed buffer with each
+failure.
+
+The new 118099-codecvt.cc tests were assisted by an LLM because I was
+too lazy to remember how to write codecvt facets.
+
+Assisted-by: LLM
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/118099
+	* include/bits/fstream.tcc (basic_filebuf::overflow): Rewind the
+	put position if outputting the put area fails.
+	* testsuite/27_io/basic_filebuf/overflow/char/118099-codecvt.cc:
+	New test.
+	* testsuite/27_io/basic_filebuf/overflow/char/118099.cc: New
+	test.
+	* testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-codecvt.cc:
+	New test.
+	* testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.cc:
+	New test.
+
+CVE: CVE-2026-125709
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3D68b=
1b9056c70acb31f2964963b51c480ff820602]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+
+Reviewed-by: Tomasz Kami=C5=84ski <tkaminsk@redhat.com>
+(cherry picked from commit 2d296e9f024edbb49cad1f3ebb5ae34c71ea5f7a)
+---
+ libstdc++-v3/include/bits/fstream.tcc              |  8 +++
+ .../basic_filebuf/overflow/char/118099-codecvt.cc  | 76 +++++++++++++++=
+++++++
+ .../27_io/basic_filebuf/overflow/char/118099.cc    | 57 +++++++++++++++=
+
+ .../overflow/wchar_t/118099-codecvt.cc             | 76 +++++++++++++++=
+++++++
+ .../27_io/basic_filebuf/overflow/wchar_t/118099.cc | 57 +++++++++++++++=
+
+ 5 files changed, 274 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
char/118099-codecvt.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
char/118099.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
wchar_t/118099-codecvt.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
wchar_t/118099.cc
+
+diff --git a/libstdc++-v3/include/bits/fstream.tcc b/libstdc++-v3/includ=
e/bits/fstream.tcc
+index 99aa296b83c4..0d1d9491cb6a 100644
+--- a/libstdc++-v3/include/bits/fstream.tcc
++++ b/libstdc++-v3/include/bits/fstream.tcc
+@@ -561,11 +561,18 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+             }
+ 	  if (this->pbase() < this->pptr())
+ 	    {
++	      struct _Guard {
++		~_Guard() { if (_M_p) _M_p->pbump(-1); }
++		basic_filebuf* _M_p;
++	      };
++	      _Guard __g =3D { };
++
+ 	      // If appropriate, append the overflow char.
+ 	      if (!__testeof)
+ 		{
+ 		  *this->pptr() =3D traits_type::to_char_type(__c);
+ 		  this->pbump(1);
++		  __g._M_p =3D this;
+ 		}
+=20
+ 	      // Convert pending sequence to external representation,
+@@ -573,6 +580,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+ 	      if (_M_convert_to_external(this->pbase(),
+ 					 this->pptr() - this->pbase()))
+ 		{
++		  __g._M_p =3D 0;
+ 		  _M_set_buffer(0);
+ 		  __ret =3D traits_type::not_eof(__c);
+ 		}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/11=
8099-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/cha=
r/118099-codecvt.cc
+new file mode 100644
+index 000000000000..e4b1106b9b8d
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099-co=
decvt.cc
+@@ -0,0 +1,76 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/=
O error
++//
++// Companion test of 118099.cc testing the throwing failure path in ove=
rflow:
++// a codecvt whose do_out always returns error makes _M_convert_to_exte=
rnal
++// throw after the overflow character has been written to the end of pu=
t area.
++// If the put pointer is advanced before the throw (and only rewound on=
 the
++// non-throwing error path), a caller that catches the exception and ke=
eps
++// writing will cause overflow(c) to write past the end of the managed =
buffer,
++// just like the original PR libstdc++/118099 testcase.
++
++#include <fstream>
++#include <locale>
++#include <testsuite_hooks.h>
++
++typedef char C;
++
++struct failing_codecvt : std::codecvt<C, char, std::mbstate_t>
++{
++protected:
++  result
++  do_out(state_type&, const intern_type* from, const intern_type*,
++	 const intern_type*& from_next,
++	 extern_type* to, extern_type*, extern_type*& to_next) const
++  {
++    from_next =3D from;
++    to_next =3D to;
++    return error;
++  }
++
++  bool do_always_noconv() const throw() { return false; }
++};
++
++static void
++test_pr118099_codecvt()
++{
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2];
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubimbue(std::locale(std::locale::classic(), new failing_codecvt))=
;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("tmp_118099_codecvt", std::ios_base::out | std::ios_base::tru=
nc);
++  VERIFY( fb.is_open() );
++
++  // Libstdc++ filebuf throws ios::failure for the codecvt error,
++  // but the standard allows overflow to return eof instead.
++  // To make this test portable, we check for either kind of error.
++  bool got_error =3D false;
++  for (int i =3D 0; i < N * 2; ++i)
++    try {
++      std::char_traits<C>::int_type r =3D fb.sputc(val);
++      if (std::char_traits<C>::eq_int_type(r, std::char_traits<C>::eof(=
)))
++	got_error =3D true;
++    } catch (const std::exception&) {
++      got_error =3D true;
++    }
++  VERIFY( got_error ); // a codecvt error actually happened
++
++  for (int i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (int i =3D N; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary ); // nothing was written past buf[0..=
N]
++}
++
++int main()
++{
++  test_pr118099_codecvt();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/11=
8099.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099=
.cc
+new file mode 100644
+index 000000000000..2407119dcb1b
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc
+@@ -0,0 +1,57 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/=
O error
++
++#include <fstream>
++#include <testsuite_hooks.h>
++
++static void
++test_pr118099()
++{
++  typedef char C;
++
++  // Only run if /dev/full already exists as a device: probe it with a
++  // read-only open first, so we never accidentally create a regular fi=
le
++  // named /dev/full on a hypothetical system with a writable /dev.
++  {
++    std::filebuf probe;
++    if (!probe.open("/dev/full", std::ios_base::in))
++      return; // no /dev/full here: nothing to test.
++  }
++
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2] =3D { };
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("/dev/full", std::ios_base::out);
++  VERIFY( fb.is_open() );
++
++  int i =3D 0;
++  // Keep writing until overflow happens (and fails):
++  while (fb.sputc(val) !=3D std::char_traits<C>::eof())
++    ++i;
++  // There should have been N-1 successful calls before overflow failed=
:
++  VERIFY( i =3D=3D (N - 1) );
++  // Overflow some more:
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++
++  // Verify that only the first N positions in the buffer were changed:
++  for (i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary );
++}
++
++int main()
++{
++  test_pr118099();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t=
/118099-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
wchar_t/118099-codecvt.cc
+new file mode 100644
+index 000000000000..add23cc99500
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099=
-codecvt.cc
+@@ -0,0 +1,76 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/=
O error
++//
++// Companion test of 118099.cc testing the throwing failure path in ove=
rflow:
++// a codecvt whose do_out always returns error makes _M_convert_to_exte=
rnal
++// throw after the overflow character has been written to the end of pu=
t area.
++// If the put pointer is advanced before the throw (and only rewound on=
 the
++// non-throwing error path), a caller that catches the exception and ke=
eps
++// writing will cause overflow(c) to write past the end of the managed =
buffer,
++// just like the original PR libstdc++/118099 testcase.
++
++#include <fstream>
++#include <locale>
++#include <testsuite_hooks.h>
++
++typedef wchar_t C;
++
++struct failing_codecvt : std::codecvt<C, char, std::mbstate_t>
++{
++protected:
++  result
++  do_out(state_type&, const intern_type* from, const intern_type*,
++	 const intern_type*& from_next,
++	 extern_type* to, extern_type*, extern_type*& to_next) const
++  {
++    from_next =3D from;
++    to_next =3D to;
++    return error;
++  }
++
++  bool do_always_noconv() const throw() { return false; }
++};
++
++static void
++test_pr118099_codecvt()
++{
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2];
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubimbue(std::locale(std::locale::classic(), new failing_codecvt))=
;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("tmp_118099_codecvt", std::ios_base::out | std::ios_base::tru=
nc);
++  VERIFY( fb.is_open() );
++
++  // Libstdc++ filebuf throws ios::failure for the codecvt error,
++  // but the standard allows overflow to return eof instead.
++  // To make this test portable, we check for either kind of error.
++  bool got_error =3D false;
++  for (int i =3D 0; i < N * 2; ++i)
++    try {
++      std::char_traits<C>::int_type r =3D fb.sputc(val);
++      if (std::char_traits<C>::eq_int_type(r, std::char_traits<C>::eof(=
)))
++	got_error =3D true;
++    } catch (const std::exception&) {
++      got_error =3D true;
++    }
++  VERIFY( got_error ); // a codecvt error actually happened
++
++  for (int i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (int i =3D N; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary ); // nothing was written past buf[0..=
N]
++}
++
++int main()
++{
++  test_pr118099_codecvt();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t=
/118099.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/=
118099.cc
+new file mode 100644
+index 000000000000..bcbbd58ee9c1
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099=
.cc
+@@ -0,0 +1,57 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/=
O error
++
++#include <fstream>
++#include <testsuite_hooks.h>
++
++static void
++test_pr118099()
++{
++  typedef wchar_t C;
++
++  // Only run if /dev/full already exists as a device: probe it with a
++  // read-only open first, so we never accidentally create a regular fi=
le
++  // named /dev/full on a hypothetical system with a writable /dev.
++  {
++    std::filebuf probe;
++    if (!probe.open("/dev/full", std::ios_base::in))
++      return; // no /dev/full here: nothing to test.
++  }
++
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2] =3D { };
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("/dev/full", std::ios_base::out);
++  VERIFY( fb.is_open() );
++
++  int i =3D 0;
++  // Keep writing until overflow happens (and fails):
++  while (fb.sputc(val) !=3D std::char_traits<C>::eof())
++    ++i;
++  // There should have been N-1 successful calls before overflow failed=
:
++  VERIFY( i =3D=3D (N - 1) );
++  // Cause some more calls to overflow, which should also fail:
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++
++  // Verify that only the first N positions in the buffer were changed:
++  for (i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary );
++}
++
++int main()
++{
++  test_pr118099();
++}
+--=20
+cgit=20
+
--=20
2.49.0

