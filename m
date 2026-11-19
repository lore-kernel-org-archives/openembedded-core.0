Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10550.1795076728527119291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 00:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RuPgAs7X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5783957acd=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6w3CW2275732
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CVR0IQfHP
	p4vkycR6dc6NW1LeujZSO4sCPzBVWajP5w=; b=RuPgAs7XDzO0wwLQ/bgiWbX70
	ZUg57oUcLv8hGzktBj/msvi99jdV6b6eOijxPuYqM2K7ARi0LzInqy7WXawZ2YTz
	tb6hGd3YFanM5ysm35nJZSyXqs7kCVQilKZ7rAcmAFem7YrybqSvtwRX3F3yILCa
	QpnnCR5Qbe68I0wDs3Mld9ZdyEMQhekV3ph7dFeAeA/xHrYTn7CsNTjWuasgTe4d
	vDKtFOqVz48ABbyACQJnSPJVFiKSRrONU4JFoKxm+2zXyVxfaZRJblnHITx/5ufw
	+IXGTYWkn7rekxyBFwgjqZ/VrNpvYrcfBZIaEz0yKhG2LJc87J5LtOQOSRROw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023093.outbound.protection.outlook.com [40.107.201.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvh5pts-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:25:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5rVrzNYmW2Dr+1XW5jLO15doOMDIGRH/oGulw66h/4qglzhqj8GeOWnEgnAnMGADgmVCpNRAN0CTXCDB+RnUZCTVRIm8bKFRQdWQoN761TPcCK0xQF6vyNMPtSTCnJDVkeEDAgJGjSsqHeoQqxFvX0BDd7kgmyK9hUbk6Ja65Q8G/Qdz+cL6trroiClyGunO3lbpj6SoIs+hB2U1822gJwK0IoIivOt9VPrdR9cewJ52Uds5VeWtprHDfZM88lmmweAsNfVnQOWOoo70XUBBxez15Jh4xCwxKeSyMPNiPW7h09S02Q+lo5YDCXG5sWk56OPgo7ebawivunfQbKYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVR0IQfHPp4vkycR6dc6NW1LeujZSO4sCPzBVWajP5w=;
 b=qoF5sC1uTPdAGLDpoDU9nRYVE6h6BGhQW8kiY5dRJgEDdmP6G8TCdLC27ZUbT8irv4hLImoh61p0NIWPJYtYN8K1QVhcrcpHjX+1Pz03fRDGoJ4hEKVPsQNImaHvfguXjUowzimnj1Y7kMAN40/mH+H0fhiHckcJG0s50BIxUlJkbXunfhfiMCdLth4IUb+kBqto1C0+OK4rqfirssPYbr1xPHT9093o4Zt6mip9I9i67QRvlJxC/HDJltBzjiZMefcEyrokhMEC49C5xdVMhwBm0w7DiPLEY1XKmRuklfYPbl+ROHfWJaj9i93PXKhkn/nCYL/wvSmXKxNHScJW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by MW4PR11MB5775.namprd11.prod.outlook.com
 (2603:10b6:303:181::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 08:25:23 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 08:25:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@Windriver.com
Subject: [blacksail][PATCH v2] gcc: Fix for CVE-2026-125709
Date: Thu, 19 Nov 2026 00:25:01 -0800
Message-ID: <20261119082505.2117537-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|MW4PR11MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 3602bf12-77fa-408a-740e-08df4616a7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|18002099003|6133799003|261009223027099003|3023799007|5023799004|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|261102123227099003|10067099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|38350700014;
X-Microsoft-Antispam-Message-Info: mHGlpEsKWRCPt6svO+A+D7L0Ue718QBIgeV5AfeofWhzIRkXwDBBrZN2xqDtPHKvWR3aK6cTfHh6eH9gx9mRWkjsjm1AvQ9osqJBS8rPJ532vOdxfB5Ylgei04+wB0AoBkFJMBaL88cvS1VZXQ+O/4CL0dJ4xq8I930VJ14efNBiNGNPeEWYH8K8nSEReCenu8h8Lauy2j13k2Duqqll9IaZ73KSTvuq1u1mDZHFTMERthe+GjSjng+gaSyMzvirEXl8lf2Gci0oL+yX2JNpxkR8PyD4PYGyMdjxbzIc7iapcujpKfvc/Luhp1DhraqoL8QP+ts72bIJ6BJ2BthCkwZW8k16fusqTfkkm9jm3XZnBrbob00274g5dJlJTzFh66Xa6L5iwj3RSE36e9vlwhfH6AoehCwEUWgayZY7cZ71FtLtvB1VtRCLcnry3n4xxLpZVY3TjZ7fkdlOSMM2+6TSJzvzLseE+IxrtJmzydYgBsPMa7BrtY4+oAQB1gxxaOE0v+NXBoE2qilFyutzPob+GZsticlz7aDHEmbcfHE8d2oO2CVSeHJWmppNV7mLoLQcNxZqdIaVQzLvBnig3TE0diyy4tl3IbNz39AnWtk2EDuWgFhxVKjyZtNhmZ2fmfry9/p3ijIiRiXsCASChDHNIw1N6l0elN3VpN3Z2KCorZBnUWtmqD6fanQjfMMN2wwbftQXM7X7NZsF3BaoXK5RkJAvpcr64hFkc0UmYXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(18002099003)(6133799003)(261009223027099003)(3023799007)(5023799004)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(261102123227099003)(10067099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blROb1dCZ1VLT3RQOWQ2czYvUjVQNk1hclA0bEtrNVpVcDR3K2hoTG5MUGVr?=
 =?utf-8?B?RVhIYW4xbGtFam1UUkVialRGS3cvbGpML0ZIaUhRYUhoWlpiTVNFLzkva2VN?=
 =?utf-8?B?VFlCTnhWUy9qVk51azArWEtBeDE5b0I4a1VSeExyMUZ3b0Z2Y2UyK3NtY1Ro?=
 =?utf-8?B?NDkwNlZ2UlBxQVVmNWxMcnpVdVJGOThWTFVDQXYxMzJxalFsZ2N2TEhhb20r?=
 =?utf-8?B?QXdWYUJzNGNiVm5GNGk3VXlQS2hOWXRFUkowcG42VURaVHBZRVQyWHlMTWll?=
 =?utf-8?B?b1pFRVZsVXMwNk8vL1dBU0ZaZ0N0MGREL3RiZW1KNXZ1V3pUZ3l1QmZkVkRO?=
 =?utf-8?B?aytpazlDWFBWSkxRaXp3M2F2a05vUWdiUlRNR1NQMFp3aTN3Y212Z081UHhI?=
 =?utf-8?B?cmU3VkFXVG03Yk14eFlDQVVZZ2Z5bE5YM0hiaW9NcjE3ZnkrYTV0QS9TZ1ll?=
 =?utf-8?B?aUVGR0dzSEN4QXVraW9nV2dmVmc0MEMvelFyLzV3RWRndlJIb0lsdU9YZGpw?=
 =?utf-8?B?WkZOanJwUjdPNUdKN1o3cG5Pc3dPZXo4WGxWYkFYNFZjWFpZVG9HTDlQcDdM?=
 =?utf-8?B?U1AvZGsrYUtKSHZFSkFJSHBFcmxnNU9OWFRBSnR6THEyL1ZKY2gwVzJjTDZt?=
 =?utf-8?B?VkRHSmtUQURkd0doVFIwMUZmSExuZFNKZkQ3U1J3MXZTY1NQejUrUjBJTzFy?=
 =?utf-8?B?MU16YUh0Rk03Y2FscEp3TU9MSDd4b3d1TlpDOGFCR2hUcUlLaG4vNVh5Y1Zw?=
 =?utf-8?B?UjBsSkY5Q1lRQzdlVTZ3WGtwdVBsbDdjdjc0d1J6a3U2T0xZL1dhcU9SeWZq?=
 =?utf-8?B?MDh3aUlKZnk0Ni81LzFycDZXaGt5cmwwYmhOcnpydE9lYy9ReUQ1WHpSQVZi?=
 =?utf-8?B?L1A0ZlJQVmc3Q2dTWGQxc0pMb3VaekZseEthN1l6SzlTREMzbHFKZUh1OGZ6?=
 =?utf-8?B?ZDA3cnFTbnFQTXR0ZG5JK01vQ0Y3UXBIRlFMcVlEeGp5S2Y1OThwU1dVQ29G?=
 =?utf-8?B?dlozdmNYQkY0K0ZhL2Ftb3AyN3VMbTAwa3NiNHBQd0s2cURmRzF6emhCaUxG?=
 =?utf-8?B?RFNiNkE4MDZSdFM1cjhyQXBiUTA3RGhsV3VJMHpzT0ZEUjU5ZEFneTBjeGFx?=
 =?utf-8?B?ejR3ZndpdmlCdkVIQXpmNUNqZjhCOWluRm1GYUJwUUxxeEV4SVlQUHhobFdt?=
 =?utf-8?B?NDhHeTZnd0VWSFArVldrYzcxekdONzd3STBja1g5NGUvMXdMZ2syZ0p2R0lI?=
 =?utf-8?B?aGt1YXc1SFBBb2JyYWJzc3VsUXE2M0M0bVZjQjFXYnk3QlBhV1pXdDR1UktF?=
 =?utf-8?B?VzN6RmhUbmF3UmEzbGRieHQ0MnVBald2Q1RFU3pzQ0ZBaFI4M040a3lSb3hJ?=
 =?utf-8?B?R2RtYzdqc2lhVE5MQlZuZ1RrRm9JRU9oNTd3NHV6ZmxDUm56NEdRVTc5anps?=
 =?utf-8?B?OEE2Q2gwY0gvZC9rdUtiNFhXVzhnRytZWjhoRDV6Nk5SckZ3d1N2MStUNW1B?=
 =?utf-8?B?eVBMWEo5TDhpdFhNUTVQVlZ6RURYbUlBazNWamxZUHRGblg4ZjNQbi8vYmJo?=
 =?utf-8?B?emY5ZERmdEhHN3NZTmxtYTlOYWd5a280L2lQbnJ1WUlkQklJdEVWNkRPOG9H?=
 =?utf-8?B?MnRkQ0xhTTgvQ3J6V2JoNHVjcm52K013UUJ6dHZCOHUzNSttRUVsV2pkT2Nt?=
 =?utf-8?B?dEs0eFNYRS9WdUhDY3N5a29OZmtKVElkSXlaUlYybUhHMXVGZktTWDRGbmc2?=
 =?utf-8?B?Z0ZWZnU1NTEwT0QwOVBrSEhrRm9JRUxRVE9TK0cyVDFrcjM1RjJhRkJZNi9M?=
 =?utf-8?B?cVgycytZS1lHUE9BOFFYNno4NFRZUUp0SVV6Q1FqK2hRZ1VUTUtCZTJuSkY4?=
 =?utf-8?B?TVRuSFZiMTkzTUR2WXhiSHRVN3hVYUNsTkpIT3VYMW0xbitqcXFQbjdkWTM3?=
 =?utf-8?B?aFBQV3U2b2d0T3NLUmRWNWZ0bTdWRnBpcFJzVU1jUzM3ckQ3WVk0M1F6R1Y1?=
 =?utf-8?B?MjY3dXpYNi9sUW1kTVBEL1IyUlNudnlLUnNtbHZ2eERxQ3BuUlVBcmluOTQx?=
 =?utf-8?B?Q3hQZDJ0OXAzMlN0NW84RzhhK1FMMzFlbUkxdHZUK2hVN2dkNSswU3M1WUls?=
 =?utf-8?B?d3FrT0RiYlMrQzBGSlpvMGRScDhGdlp1eG1uMElsejJKNXllbDdjSUhwUldw?=
 =?utf-8?B?cWpIdGU1K3ZqVWxEYVNXSzN3SHMvSFluQW82TDVwbmVYV2wxbVRTYk1WcWx4?=
 =?utf-8?B?WUh1M2c2a21zS0VFdUlhbGtmbVpYbnNOclVPaDJCRUZ4N0oyQ1JZdzBaNGxT?=
 =?utf-8?B?TC83TUNWY1JrMVFoYms3VFpjc2RKeHhzM3MzLzNpVXc4dzRBTzYrM3pjTG5w?=
 =?utf-8?Q?71tUfAyVkzkU+GAQ=3D?=
X-Exchange-RoutingPolicyChecked: DI/zOs7UcTM30SCpzimRp7peF50KaVic6J7wF9pSgulofLwkihhawzyumcuAOxtjQGO1/3UMFwKkrRXU8MIS/eOoKzLm9XuJjhsGpE6i03BdGNGHJ7wNkDkhfuOYejw68b4oAuZ3ur2GUGmQzMXxGn84KWCzYzErkHESNouBDKIQhBy9/pCB97fv4SZ1QR3WfHxP9AxMIl6zPZSN9RzPZD95XqekMivFHNxfRNfZ8Fti9242AxnzcAN+RUuwSHnZqg6M2mOQJ4zUZjvZk6rASyYbHkQXZpMEK+dpUizc33PIBHztkuRzo8J481st9YMAxaIZApE5jpxFtNDKzLie3w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3602bf12-77fa-408a-740e-08df4616a7fd
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:25:23.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqQDN7kbV67WQGOViLp7HP3YFahEiMyWcmpomXVl2EUmGpLs4xh7MXTPCBnI+YVxQ0zEe6HHHn6TL28cAtF0gwaCRgjd1kOYrRI852Si97w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
X-Proofpoint-GUID: 469KZuXsLlUaXI_NcJEVO1VNY4FiQql7
X-Proofpoint-ORIG-GUID: 469KZuXsLlUaXI_NcJEVO1VNY4FiQql7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX9aMtSHu2alrF
 e+jdT7hGLMBkRE45l7rVAKs4dI9FFOnzlKFxvbpCKgvq2fComNzhxetqcqBkcXg/MR3dfvimWhw
 ypJcQ9R8IZUsk4UrUpJWVmM/LTFMrQVxhTa62OQWj+kZFgKiPVEiN13GRvUz5vm7opsryxTM8ck
 c7ojMrKQGCQH04gHC+YFAKQmMxaDgoqUistzF/ZmS8tUuYR5tjc3HwP/XPrKlJvw3ztFTfqg8Oj
 36ouDTpYlywxEx9IOSEGItFn/iGAnLIC1SHuJbgpHPFCh3vd+umIhma7ajOwiDHOlRC2gwxCBgq
 xGfP4Usg0d+PjBvIieQUHuWudtrwXVo2NQ/VzgpmPzHzoeC9sdefVKuGjr/C3dqSxzwGLRKlx99
 jlSfnkqTeXDGrxRo6MK+nauvZLjJJMZqGjV92HihColieX8jIh3yQ6kBy001BL1I0oO1g+TECtr
 MINzN4iSwxlY9/7KM1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX9Brf4HoG2wal
 eJRdl8khOg+k8eRETDLjnZUR8WCRzP7dLytEZgnrd2hPmbUewmFkI0WV8U3UeDASumx9kx9K9+X
 HWxRGc2z7lbB/XyxRceG8jQ9JIAjDHucrub2hlzOeUuLutriFqKa
X-Authority-Analysis: v=2.4 cv=GNCdgeNK c=1 sm=1 tr=0 ts=6afeb277 cx=c_pps
 a=oX9DDLBFzmmLrgrYpmrGcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
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
 definitions=main-2611190033
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6AJ6w3CW2275732
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250654

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
 .../gcc/gcc/0027-CVE-2026-125709.patch        | 378 ++++++++++++++++++
 2 files changed, 379 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125709.pa=
tch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-16.2.inc
index 3497493619..a629b48d95 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -75,6 +75,7 @@ SRC_URI =3D "${BASEURI} \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.p=
atch \
 	   file://0026-CVE-2026-102010.patch \
+	   file://0027-CVE-2026-125709.patch \
 "
=20
 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125709.patch b/m=
eta/recipes-devtools/gcc/gcc/0027-CVE-2026-125709.patch
new file mode 100644
index 0000000000..cb3a437475
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125709.patch
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

