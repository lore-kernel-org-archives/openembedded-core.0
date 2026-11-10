Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14441.1794291392709628708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 22:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZzEP9Pci;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5774fcad27=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4BtB03614707
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=cTL95WPnC
	SXstihVWSCuG81jt/SzOSFyTKgt2jr7rfA=; b=ZzEP9Pcip4fBZbbmmMxNqwPnh
	6vikEZyK15fwE95AWeCk3HsgDHvZlJMmYj/Zr/PsW/RSHOGR5Rh37Ot5ohtNocrU
	yQI26KzOMjjU2JGMBIRZsqQsui2OjN2Kt59Wb+Gx79BgXJgRh2K9jnsRwsohkcQ4
	CKI8OPxiLES+33fGDi+G1rhKvexmOyyvz6+KnA1GkWWPZqu3A59ZRlJIheXKsr4F
	Z27Egf1A89TOcFgVCWy+DV5PxFsCKpATEfWoZ8qqDynxBITCPu45Kl3dcq2ilZQ4
	dppVOvTRllLGseQAwu4LATPfgiv/6ZH90IJWQEBYADRjTBWY+x8e6tQnPvC1A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020087.outbound.protection.outlook.com [52.101.85.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hss70nnnt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 06:16:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1A0fJ2wNZJF9d+5Kz4t0JV/UkCli0sodgrSGEESdY2p1ialkxbKKN1jnD1vsBaXiaF7nPez8KQrCx9/JoStr1Luk3X9r9ZLTiYNHirWgGdVrhFbW8LSy0h9jKbcw5+wewppNdBXqvXbih9xjNg0YmnrfUjxSjDUkxDVuZHP5Q1ncl8huA455Bipuod1fDE989UOHnvWAyI1MZwHo5KLJbCTrNp79nFo494DIHiiZUJ6QcvcHDLVJM6OyTyfZoPwbaN+rI1bfk6zfzsVP+VdImA9y9d0qc+bgRjVJNQbOkdwJ/0BiL7arEjFnR/jsHTaUws9Sfe5Z8ALqpz52IqEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTL95WPnCSXstihVWSCuG81jt/SzOSFyTKgt2jr7rfA=;
 b=I2Sy6jRhtevnJaKyBlUxh9pIwuspCLmgObsxzmPLvZZhJC5/MgMVWZ+aqZVKa5YMYIWr39j1b+zTWZahVpfB5L7IqvinQQkz3fnjk94K02n4xAFyrdXhDV8gDQxjmAViJ1G//yYdU6KMcEvu2X7PYbIxOW2A4sj+BMiILrRSH5hQm/0HzJIZENGy2lDiNSxGbZnP66LWud38g/J+Ev7h5N2/LbYaDhvTPZ4axcPRluaLp+oh5/9N2HFdYgdzJkCm3FpYti/wcKyZwyzr/URkKrB6XlJpOEFxR6GtrWTSFZ9Jha1LW0B6XV/zmYUchrz4MXUbcDJvtSBptonTXRFaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA4PR11MB9060.namprd11.prod.outlook.com (2603:10b6:208:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 06:16:27 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0592.007; Tue, 10 Nov 2026
 06:16:27 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, sunilkumar.dora@windriver.com,
        raj.khem@gmail.com
Subject: [PATCH 0/3] clang/llvm: Upgrade to 23.1.5
Date: Mon,  9 Nov 2026 22:16:05 -0800
Message-ID: <20261110061608.4043909-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA4PR11MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ff64ef-9fa5-49ba-dffc-08df3ef2273a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|261009223027099003|10067099003|261028144727099003|261022105027099003|261102123227099003|261026121527099003|261026140227099003|261022115727099003|261021123027099003|261021121427099003|261022075727099003|38350700014|56012099006|5023799004|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: Wn5br1az45CejKXh90nSC6laz/dkXIP8jEBx5to6H5At48erWYfTZ1/Mvnw+5bhWT50gN+MAI5tMVxnxaEbDWHt9SwFzuVhC2w4d+UCmYck8NQeavnwEI539I9+iMaxwdxm8Xtyq8ucAPVz+vsafeZFNxS5ys96JS2mD6Nq1xiZJpeXL+cNkMWpFGP/f3/6jHHie2zLV+YvyP+PkrCO/In2yGoAvi56yd/8xmSRGj7vqnPtlK6+esen1KNl1AR/ok3bZZ/UX9ryA2hYuNZdz2+7/hfqQkh6gFOVsfkKDo5Cj4Qj/WUM8gcLQbkfUGtTGhTpV7VkIC+3VsI94FP2r3FZROQ6Z6DNKr0/MDPCfSVZag0uk66BmJtl/CnN42PfG/ROdleiY5KoLny7g5onUn3ttlTJZsG/jnZkHjkXkkBNXA+xlzsJYa/AadOvrzLu5cDrL9mpaTfwNIe8veeIuWtBgCxu+E0rJMZ1Ov4bddxEK/jAgCX1Wg8atqBEN552BGmRADCUxO6lWeXhkB8S63d/lId6qrNKgR5oBw3ecGj5nemeJBByc2ZU0BjRa8l966AGREM7YYcL8QPoJT9FUmyficEfz9VTygTe9aGjyqGj9pQzkHw4j8vkie59pjwIRM8rwKFkR5yhLJjQajVfkK7gA8YEbJk4q2KnHnvi0jjM4dX9TR3WNzu6QH/IzmJ3owqTtlwbIW1TRvaZq3L8yTsKVuko/hOfjYTYwPSrV8iM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(261009223027099003)(10067099003)(261028144727099003)(261022105027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022115727099003)(261021123027099003)(261021121427099003)(261022075727099003)(38350700014)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VSs4NWlKTDIxRnN3bkhMbHpqaXF0SnQ3cWFUdS93VUZzd3BRUmxmUlZYUW9N?=
 =?utf-8?B?UEZIbE8zNDVjWktWeW1rTittdy9VTjEzVFM4TEE1RUZKbStXZVlXSnYrV205?=
 =?utf-8?B?OS8vMHBtZEZ6VThWWVJjdnpyakovSnYydUEyMmZrS2JjM2JBSWtSbGlBNU42?=
 =?utf-8?B?bFNjMC9pcjEyWHlkQk1OS0NRUEVMV0FDMTlCT1YyUHBpUVdJZGNQeTNCRGFO?=
 =?utf-8?B?VmxTejUydzdBL2xQeFQwWWU0OGR4OC81Y1ZUVm44aGNCKzZTYlVGWHFZU0pq?=
 =?utf-8?B?STBUc0VYQ042OXk4UU5JK1RyMHlBaCtYYUU2NXY5QTNQa09ybnB4cDN4MENP?=
 =?utf-8?B?bmhpTXpsSzRxTkpXVTZBK2g2VVd2M3dXSGxydVNVL3NSTzlld2V2T0xYZWRG?=
 =?utf-8?B?aFRxcVVtajVZTmQwUkppanhaelY0bXY1WDAwWEJieFovVWh1MWVkWVU1WHlt?=
 =?utf-8?B?UjFscHY5SUplQ2FMREJ0cUlvT0M2clZucEQ2Zktubkl3NEhvWE4xdS9JTWVy?=
 =?utf-8?B?UGtyaTV3S09EYlFJampwZTJuVlFhYytWUnFEZmVMbXF3OWIrUG02M3FWM0ZE?=
 =?utf-8?B?VS9mTUlnbUlSanlOUHJwa1lFbysySGs1SVV4ZUUyQXl1ZnBrUFMyclVVcFpB?=
 =?utf-8?B?aG9Ca2dFVG5XRi8vKzFDRGVPb2dueEMxY3dnRlV0K1dJYVVXM3l2UGFQNlNx?=
 =?utf-8?B?SloxenBXWE51M3BpUENkaWVHczNuSktxM29xclZUUnErRUordFV2aTJxZ2xj?=
 =?utf-8?B?aVRDUm5zLzRaeEhDQ2N4dzluMzc3NmdIZ01Nd0RQY2QyVi9RMDA1U0NOeGNW?=
 =?utf-8?B?S2thNlNtS3h1WmRxWnJKeFNkeDc4Rkk1RlM5RHVIRXFvaXJHYS9EUGtvTWox?=
 =?utf-8?B?aUp4U0pYVjdONGxYR2pIN2pEM05OK05saVd2TlZVZlJUK045T1E2anNESmw5?=
 =?utf-8?B?bHAwdThmK0E3RHBlVTFuRkxnZmVrQlpObzF6WE1rSXZWLzZYcnluQUpMNUtB?=
 =?utf-8?B?L0xnZ054MjVCK1U0R3VGWDZGOEp5bUJ4RUZZMUNuV3c5NHlaU1dmK1JlQVZy?=
 =?utf-8?B?THlNVkxwenU4TmdwT2x3SEI4c1RzNy9CT2NhWkdna3ZaTXRzOHhXRldlM0Uv?=
 =?utf-8?B?dTQ5dU9mM0ZLaVB2anRhcFoxb2pDZGpNQW5XRzhoM0hKNmdYUlVia0xMOG1P?=
 =?utf-8?B?ZGJCeldBWnNVUzZoS0VzcEIzYkR2QmZIVTJrdzk0dStVK3pBNEhKMWMwdm1U?=
 =?utf-8?B?MjY5a21OSldITjg3MHZ4UStmditPRW1TU0tSa1V4NmRxWXNQcXloTjY1cytk?=
 =?utf-8?B?REYyRnYxL0NDdlp4dkRtaUZaUkRmcS9TMk1IN1pYUndHY29MdFBZYWdMVmJZ?=
 =?utf-8?B?VmdWM1RKWGpkMUk2bHZsc2JJZmdVS3VHZ3ZQWmdDc2FXamRlb29hb2JoOW9T?=
 =?utf-8?B?M3RwU1BTZE1QMEZFMWZtU0hIMVZuV3JLSUNEWjBhenNJbkFzb2pSRVFVR2pE?=
 =?utf-8?B?YVlXUDVKSk9VUzlvUlhxc0dMUjlweit6eE9BZ1ZtTm02eDFVYld1SzAxcGY1?=
 =?utf-8?B?MTBsYkNCb1piQm1HSFVSeGVpVXlWK2hmU1M2Ni8vdFZJRDJ3OU5MTVBEdCs0?=
 =?utf-8?B?WlpZMVJDS3hnUjhjVWE2S1RHdE5ZUHF1Z3ZqMEZsNjgyNDBLSzhWbGt4a0hp?=
 =?utf-8?B?c2ZaM2xCME5XMWxiTzRQL2JWNTNCUGVRMUlUMkt2MndGRlNtRWlJN0F3aVBW?=
 =?utf-8?B?UU51RDMxZk12aXFFSFJpTS8zQWZKMkdWSUxQckRJRVhDWDFqUmMzZnc2UzJD?=
 =?utf-8?B?d2tCdUJ2QlhUTzROTHdIZzNZNHRUM1NDcUYweEx2OFVSMEdpMjBrZ3dHb3ds?=
 =?utf-8?B?dzRQamo4VWUwSzJnVnZpMS90L3RST0tVYUJ3d1cxQTNmbUx2Mm9jNXFYd3FI?=
 =?utf-8?B?dndMSlpTUHBLazJPejRSdXlYV2lLS0tqZjNET3dTNXNIaFkrZ1cza0dsY0t3?=
 =?utf-8?B?cDJ6aEtiMEtsb0h6OUxnN1p3Ymg0Y2tPVE5DQ2EwbHE2WVJFMnJuN1Z4UHNh?=
 =?utf-8?B?UVVRRk9zVkw5ZGxuaUI4d2ZhWHpIQjJRa21yZHBVYWVIRWw2VlhvMXBuazNr?=
 =?utf-8?B?Mmw4cWQyaHI2UWR5d1ZLL3RvR2RTUmM1azFETm8wODgvMlpJZVI4QnJwVTRX?=
 =?utf-8?B?WU9xeFJlVklpYld5MlJYc0dMaUhVSURwdmtJRU9ZcFdwK0ExMjIvYnBya2tn?=
 =?utf-8?B?R2NCY1UwR1NEZGU5Qis2eGZpQ3NVNGVUVnJHbmRBNDAyVVF2SmN6V0NobTN4?=
 =?utf-8?B?VzRzb1QzQUdyQkFET1VvK094YzQveGkxMTNKa1htTFJhOEtVL25PTzdjZ2xM?=
 =?utf-8?Q?u9hwibMi4n6poiRs=3D?=
X-Exchange-RoutingPolicyChecked: hzGjPLyjsZC+otapSk2wz+mXZBGFYYN4+CARWA132yXhlnnL22vjVKfeuME6s9UyygLnB2DUpXWTMbd+KcPoc7s0g3cPpeH6ela6pE9ivQ/eT8n3PbHBeURzY4Bl3Ap5sypfbSeU7pYmUWbni4viaeWSbVJAuJKLfn0A9HBREsib0HY6ErAvyf/ltTmRAoV5UcO/tiqCEOFSVy1GyctbdIg3T51RKI8ci4OlxmpmLDqwEK9vdVcgEJrskhlsfhi50H6du4DUUHPBOQbJE3d1LnXjZYsjxrBken211R4PwsQo6TSoEP5rb73sbgX2AyFz4nKY4Xo44chjeepYUWIXWw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ff64ef-9fa5-49ba-dffc-08df3ef2273a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:16:27.3013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wnnJqb9h0FPT1hWwb8ajq/JjVuGU+IP2gqle2S74y8BuvKaIQsZ7NjVg5ZLYkrlsqTNf/+M3m3GMYUz8dw/xBIwmlxwcEgzHek+AUIVypo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9060
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=fvlJ914f c=1 sm=1 tr=0 ts=6af2b6be cx=c_pps
 a=R61xy7Sxgg6fOHg0EL+J9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=66LWGOb4b14h_PeiPG4A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfX2cVfnrE3fnV1
 qvhRzOcqQNjVyOyM9r5DoQQqtdqAN1M7HBHSlmWvBeOj0x1KNk8giv/+q+3Mca0NNSO7271tsr6
 3sb/V2QxMq5iXQVwHkKcZIkH4w1h/trIRE2lPyP6TKDi7oVd32dHMzMhx8pM98AexLauEj7cFtF
 E/VtKxgeyqGkn0OiTYCAgZ3oS2WzjhcZO4MEDlHxAboC2GJ0uCNFQzEVwmr7oLvgWS5y7eXADoR
 RrsLd1SrIcAEODAClfVIYDkfFOMTqckZkizdvAsO7tSEeBoCDpmcVFUAH25mOzDHWVU4efnm5+x
 xABithRBj/DzCuw2a61w7ISRgFamq+XrohxDRawO1iVxeqv1UwbN1Mgl9kN6rKqe7Zqzzg9aKT9
 Jp/wfU19iOzyHllFx+9z5IAUoLecWR2YJt9sq/sO64Mc1QwIJFbkhv9D7SEUc6ZRwuW5BUrahfT
 4eKRxvNBDleCZgAHfJA==
X-Proofpoint-ORIG-GUID: 9CFWSG7orCJfsqCY4HyTW3bxhK5mabgo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfXxGiwyoj1iLQx
 K+2CXOXcdvPeOasarCFulcHwVJuSdtFzMo5zWCPYnUDhKojv6TM8H5XOsECBqsItBMtW3gK8Jdh
 1aX9dW9hMlK++HWtHt58Cr2fy6RA8KVEXLfp2cHvgkYMucO2kn9M
X-Proofpoint-GUID: pYjuHknG_JyfBp_ncGzIZuHs6vHWgD9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249900

From: Sunil Dora <sunilkumar.dora@windriver.com>

This moves clang/llvm from 23.1.3 to 23.1.5. All 35 carried patches
apply as is, nothing they touch changed between the two tags.

23.1.4 failed the toolchain selftest on all five -tc builders in the two
new tools/extract_symbols/registry-* tests. Their lit config runs the
python cmake found at configure time, the build host python, which is
not there on the target. Other python based tests go through lit's
%python, the python running lit, so this never showed up before. Clang
has the same problem in its own substitutions.

Patch 2 rewrites the recorded python path to the target one in both
recipes when CLANG_ENABLE_TESTSUITE is set. Patch 3 brings back the
tests excluded only for this reason: 99 pass in clang and 67 in llvm on
target, the other 9 are UpdateTestChecks tests unsupported in this build.

The extract_symbols config is being fixed upstream in
https://github.com/llvm/llvm-project/pull/240530, but that covers just
those two tests. Clang and the other llvm substitutions still use the
configured python, so the recipe fix covers all of them at once and
leaves nothing to rebase on the next bump.

Tested locally: clang family, core-image-minimal, spirv-llvm-translator,
rust and mesa for qemux86-64 glibc; musl family and image; lib32-llvm and
openmp with multilib; clang and compiler-rt for qemux86, qemuarm and
qemuarm64. oe-selftest llvm, clang and lld pass on qemux86-64, llvm on
qemux86. On the autobuilder all five -tc builders (qemux86-64, qemux86,
qemuarm, qemuarm64, qemuriscv64) pass the llvm, clang and lld selftests
with the re-enabled tests; multilib, musl-qemuarm64, musl-qemux86 and
musl-qemux86-64 pass as well.

Sunil Dora (3):
  clang/llvm: Upgrade from 23.1.3 to 23.1.5 release
  clang/llvm: Point lit at the target python for the test suite
  oeqa/selftest/clang: Re-enable tests that only needed the target
    python

 meta/conf/distro/include/maintainers.inc     |  2 +-
 meta/lib/oeqa/selftest/cases/clang.py        | 25 --------------------
 meta/recipes-devtools/clang/clang_git.bb     | 12 ++++++++++
 meta/recipes-devtools/clang/common-clang.inc |  2 +-
 meta/recipes-devtools/clang/common.inc       |  2 +-
 meta/recipes-devtools/clang/llvm_git.bb      |  9 +++++++
 6 files changed, 24 insertions(+), 28 deletions(-)

-- 
2.49.0

