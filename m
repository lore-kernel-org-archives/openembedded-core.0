Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773EBC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 19:07:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20945.1738177619161761283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 11:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4124fd2045=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50THpJre027009
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:06:58 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enykt0dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V54kvS4ia7cb2DluYKyX9DV3pBngSVM18Y+2EZJOsBG5hoNRrGA6m30uDBwDEsNWj+qpB22sLn0G72u5WjTiKhmK7q2iK0KAFKCU1w4niXHYsRkU+9G2G/93LmZL2OgdzHo0flFeJbO3bqk8Y4PktNef7keMnY2fVPzoNh7LG7V4Sa6k4gHTPBbeQd6bBMW2EPF3MxRlzqqXEV68G6+GewSLkXt6f1D3M+jtiD3dB35nPNpqlhmcImFOoR6WwziQAFXtD4q6VezBDi4GWOlEYHkOxrX8JcG4eqjYOwZh+G0dT5rgKsbaZdg4KawHW85Bkh1VPq1bmBrXHnGMSqvIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpM6Rhazo8RwR6mflMAhXcsQ9ZAi3yiqhSXeTye7UKk=;
 b=HDvj3Qf0YjEvgfoDM4ECNTIVjIFcV+hGMEmTf5rGF1GeJNxXCU+AqLv+PRzzjz01K6l4ypcfhSkjjXgiF8mM8FEGS/vprclB05woHu8ia6eg1HJChP4stFeuMJ7E9AsBVZhFNuoKqzYVxAaqVc0VaIPpYBSxM5fbIHzbc6pCl0H9fWd2JUKyH+YFLVidqr7H8cNMelQOlfvinOspK5gqzMIEzO9qZPuOFw8xsVbu9Lkqlr2GEooFqL+ub5jGBdBTnB2Ux42b926/EGSLmjXApoC7Mm2OV6MyQbhsbf2VkL3W5z5yvqsXj44yAYqxqSk2TMen+bj/6IczRbM+0deJ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ2PR11MB8586.namprd11.prod.outlook.com (2603:10b6:a03:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 19:06:55 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 19:06:55 +0000
Content-Type: multipart/alternative;
 boundary="------------H54D6DRIdAv0nZU0070zK9zu"
Message-ID: <81192744-16be-407a-9d4d-8cad44f31305@windriver.com>
Date: Wed, 29 Jan 2025 14:06:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] debugedit: fix build failure when enabling
 DEBUG_BUILD
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
References: <20250120073321.3859875-1-Qi.Chen@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250120073321.3859875-1-Qi.Chen@windriver.com>
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ2PR11MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b5b9dd-68fd-4178-f07f-08dd409818a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QlpVd2Q4WGRXMXVmOG1jbFVjdnIzRkVyeU9UOEVnWjJ6MlE3bGJRMlRXNTNa?=
 =?utf-8?B?QXNrOVFQdmpMMk1sK1FaRkE1QlhEVjUxeGg4VW8rNlk3a1hRU0Q2ckJhdGdU?=
 =?utf-8?B?N3pRdkhOV2dnUVphR3RvbW5jVzdKdERtcnFYdUpoUSt6L3Z6MXhxV01hVy9j?=
 =?utf-8?B?dTIyTXU3blVLZXhjSDJpbDZhVmMvSzlNbkphN2hYRzl2ZDZ0NlpCYXRGQnFT?=
 =?utf-8?B?L1NxQWE1STRWNzRwblBTdSszcVQrVyswSEd5TitVSGxnSGlybUx3VnFGeHZs?=
 =?utf-8?B?eWttbVk2UDc4elRMMUJ5YUhwcUYrMitQRE91aXhYSXYvS1N5bnpUZnJrU2Fi?=
 =?utf-8?B?RndUREFabm91YUNTUm9xcXpMdmx2UUphbmE3S0NSU1BnYmZlTjl3N2ZLTXFz?=
 =?utf-8?B?YmpkT2t4ZUprN2hiclZ3SkcwYzNFOGJNT2NQTUltRUVlT3A0R3FCdGx3S2xp?=
 =?utf-8?B?blNUdWRpbnA4U0UxdlY0YnN2VkJWSDRxdm1lWkpLM2xJa3VWYXI0bDlVRWRB?=
 =?utf-8?B?b0FiRWs2TUdhNkNpNlg5MjFVMXRiZlpRMlMrZDhod0xPeUpMak0zR3o0YlhM?=
 =?utf-8?B?amVLWTlDSldqR0lBbU1nVjBxYVBtU2lRSWlEQXFsTlMzSkpoS1p5aUQ5ME8z?=
 =?utf-8?B?TzdvRyswUVBzakFHS2JZVnZ2OHIwSldXVEdoWEVPQmJEL3JDOWYvamNvbVVw?=
 =?utf-8?B?Z0ZhbG9xeHA0Qm5XWDlsQS90UXAvN2JROWl3Y1ZWdkgrK0prcjR2WlUrRzU4?=
 =?utf-8?B?bzQwK1lSWW4vbm0xNjI0VzNDa0JEL2t6VGZlZXlJWnJBazBHdkozNkJwV1pr?=
 =?utf-8?B?OHNRaVcwalA4N3BhYkJtMXA4M25tbmpTTHdraGNELytKZWpya2RGNEtsYXND?=
 =?utf-8?B?UjJCTzNrRSt4RHV5a1AxQVVrWEVmK0VqVWYvUXZYU3d6aHcvUlBmL1Jabnd4?=
 =?utf-8?B?UkNOVGk5R0FrZ1NwQXA1NFRZL1ZwTmxBNXpGU3BhbWNnZEJMd1N0K09Qblkr?=
 =?utf-8?B?ckVtZjFHeGdzc1R6bVRxRkxwUkZtMGN0Y0FtZXY2NEwySzRGQzFPOXBtcmh1?=
 =?utf-8?B?QXo4T1owWFlsVDcrbHg0cytHb2ovQnBwakZTQjdzU2t6dWJNTE9tNTNTMStI?=
 =?utf-8?B?UzFOMmczNVAxSE1GTTdETU5lTUduRG5YbWxkWkU1Qk1qYVQzMXdKbjJBOWxx?=
 =?utf-8?B?a0F3V0RVYVFBcnJWeXRTekZzVGY0UFhXQldJTVd6a1N2Y1pTYkhJSjBLQzJJ?=
 =?utf-8?B?V0ExUCtiZjh0MkdxMEJ0THA3UWtCZTFSeWVrK21rbDJ5RXNKbFZrZXp0Um1j?=
 =?utf-8?B?YmtiUDBJRFVRTkdvN2p2NFd2eXk4RUtEd1IzRTEwY3ZnUUdLc1l5VzdqNlVa?=
 =?utf-8?B?bTJ1M0JuQkR0SVJZL203WmtVenhva2ZIMHV6T0JKLzBIdkVtQnJnbUJhNnAx?=
 =?utf-8?B?TFMvdVZBSVVCOVozNmZ0QVp5SGpFT051VHBuOXlBWlN1Zjc4MmpGZndQVXE4?=
 =?utf-8?B?QnEvNVFaZTRYTXY2MHUrT1BoeGZIWXJ5bVJMN3E1REUvcG5CV1RIc2xwZVpQ?=
 =?utf-8?B?UWc5MG9JNnV2aS9RS215WTd4VTFZUTJxUzJXUm55QmkwVUc2ZGdkZy91Zlpi?=
 =?utf-8?B?aVVZU0wxL09iUWd5dkQ4dDhBYWdrUkwvcFF4SHVkWEMzK0FBN2lQWEE3cG9t?=
 =?utf-8?B?U3pnN1AyTHorTDBMQ0Z1YXFsQ3VTVmFUUmRCcUp3dzhuRjIrclFPK0tqMmhi?=
 =?utf-8?B?SzBxQ2Eyb2c0aW8zQ3ZmTEkxL1lLbi90YU1VaUpkbmZQSSs5YzRuQm5Ecytw?=
 =?utf-8?B?c0FDL3AzM1BjeFdDT2kxZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFJ2N2EyVVZ5dFAwM2VTazFaQ09oOFJJaFIxSEhrdDh4dmVNQlpwdm1CSFAv?=
 =?utf-8?B?V0dndWVnUUpFcmlIbjg2bmtDYkdWeHRZNTRWd1doZnZXenhIdFVSUStNcFRl?=
 =?utf-8?B?bjB2YW5tWmlMb0Y1cW4wVUdYaDNnYjVvNXB5VUgvRGt6cTUzZEhvUFFNOGx5?=
 =?utf-8?B?NWVlMmJPeDBUZ2djNE1hUUFvbDZGV1A2d05nTmY0U3laUjU0N052ZENna1h4?=
 =?utf-8?B?OEg0aVk0WlFWMmpXVEhHeE8vNkt6TklQUlNZR09Scm5VNzJyR2EyaHpnd0R4?=
 =?utf-8?B?N1lqNHpTWG8xaGZkb1lsZjFLZ1d0YlNpSmhoaEw2MDRvVTBCdnIzRmhBSWVR?=
 =?utf-8?B?cGZNN2FzUnk0Q0F6TWVDWHRKM2NRd2RqczlQcjlld2RoOHhsWDFTM2t0bjl2?=
 =?utf-8?B?OFlBR3BveWg3UHFaMFN6dFc3d09aK1VCcUsyM2RJQUlhMnVaV0pEbzc5Yk9i?=
 =?utf-8?B?VFlFa0RGaStBbld3Zm5yaFMvbzlrYmdSZkZwV3ozS1RDRUlrRTBxNDZEM1JS?=
 =?utf-8?B?Tmgxb1Vzdmc3SFo3OUVzUnVQWXBLcEV5Njc1WWlwbmFVUWdzMUlxREdTTk50?=
 =?utf-8?B?My9vbGxKSHlBZ3Q4cWJtcno2cmJ3VzZNS0FhODJkNmNkVkl1cGNtMXFMbVVl?=
 =?utf-8?B?aGsxTVJXTnJlTmpBVmc3bWxwQ2srSDNIUm1nM3JwdVVFQUJnZGMwRVkwSlBy?=
 =?utf-8?B?Qy9TYVdhOENkU05Ld2xxSGV3cGY4dkhyOGZ2ZHpDcVdRQ1pBMFROVzFtQXJr?=
 =?utf-8?B?bDcySU1pT0JOaWxaOEJIZWd4RHA2K1BMRU9ET0lBTkhmWmhSTnVsNk1uWElZ?=
 =?utf-8?B?SWxVV0hWN2djR1FHeXp5eFZRQjc2bGMrcDBwT1Z6cDJEUUZXR09tZTRPTG1I?=
 =?utf-8?B?WjV4Y01HZml6S3Z4NnUwRGk0UGZHN2NXRGdoNEwvV0sxWWdrUVAxZ1JXdmdv?=
 =?utf-8?B?UHRsTVdQeWZXR2lvdVoxOU1CYWJ5bXVsNnYvR0NRZno4ZVFXL2k5RENJaHlq?=
 =?utf-8?B?UHpLMGdMSjh0MFREL01iYlhNRVlHS2xkZzJqUzV5U2U0Ui9HNzhqcDEyT3Ar?=
 =?utf-8?B?WXJ5WCtWT1IxN1QxaVl6ZzhWVkdzYm9YK3hnaEpuRDVNMVluazNKUmRBT3gz?=
 =?utf-8?B?TEVQdm5scG5qamdzWi9BQ2U0cVpiVkdXTU9WTHFFbmdpbzJJKzh3RzV2T0Fp?=
 =?utf-8?B?U2tBdUgzVStyUlBFUTZrRzhQZjZjNXJrUHJUVjBKeEpER056cnA1T0JDQVAx?=
 =?utf-8?B?RmlCdDZ4YWNHUHc2b1BnbmJvQUdzdXE5L2FtQUE4d3pFNFhZazB2Q0xtcDBj?=
 =?utf-8?B?Vnlvc2FFVmV0K1RMNDJNM0dDdDJFbVRPWVRIS1FONUdTUGNHVmd4UU1sWEpO?=
 =?utf-8?B?TXF5cFpwejdPazltekl0THdDLzNUR3VUdi9HVEtDdkVGT2h2OSs0MVlQdkdQ?=
 =?utf-8?B?MEhZeEo5Z1FwSSs4cEY3ZkhFY1lsZ3p5RS9uV25icGVKWm1pNm90Sk0vbWE3?=
 =?utf-8?B?QVg5bmk1VFNCYnlNSGlkZlFSRUJzWGlSZ1FxWFE5a3BnNVJjNi9vVmVqdnM5?=
 =?utf-8?B?TEVEc1ZXQkVCQzNaSFg0SS9FaUdOeldDZ0ZoaTJkTWg2NWhFV21XZU5ySnpS?=
 =?utf-8?B?ZjlSMThLVkRIM25sV0JtRXRvb0xlSWN4d01kUzNzL09iMlhnWVhCWFd1b1FW?=
 =?utf-8?B?MVNSZHRDN3hvaTZIZThjVVpmTThSaTd5OW9xLzBpT2Nsc0ZTTnJQVUNxbnJj?=
 =?utf-8?B?N1N6bGZZTkI4d3cxVmh0MitZd2MxUkFMOTFzTWhCRUlvaVNpNkdxTEpYS3dF?=
 =?utf-8?B?T1VXTjRsNlhlbDkwZDNIdFlDT0pvMmlOK2FobTVvWE5NdHdDV2pwaGU3bE9n?=
 =?utf-8?B?U0ZjSXkzbTlxYnRkalBBT3V3QTRFL2p1cEpHbXFrcE5uMWpQWHZ1dlU4OU82?=
 =?utf-8?B?SW0zazd3R09DV2o4VmNoRTVuL05SYlU4dzVhQ2JCZGhwR3lFU1c5R0VMTlZJ?=
 =?utf-8?B?MzVKeTZEU0FFR09OcThjd2sxemJuMkdBSnVVbzRiWHI2VXlLZ0Jxc2hZTkJM?=
 =?utf-8?B?UVlFU1JWRUp2TWdZdjNaVE82aVl5UEt3UkYrbFJnY1N5eS9vNWFMUHcrYXhM?=
 =?utf-8?B?WVRmRVU3a0ZVQkl6TktGYnhSTnZxN1NvU1RqbUU4N3A0c1ZEOWNybFp3aVFW?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b5b9dd-68fd-4178-f07f-08dd409818a8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 19:06:55.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Jx24c9iRy0Yzp5LKKxfIohTJuzeizMWhrVRNJTCgM6JG0257zSQ4QZI3mfI6Y3/6H+IZz8o7VTb2utfP8+F0GZydVm8Q4Fs8gGsMkmioE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8586
X-Authority-Analysis: v=2.4 cv=Wv/RMcfv c=1 sm=1 tr=0 ts=679a7c52 cx=c_pps a=r1LLKbupV3Dgd2n8fS09vg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=CCpqsmhAAAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=4FIimmqFppapI4qdxh8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=jQjflG0nazAA:10 a=LpIZj0bRcBLxui6EL3EA:9 a=K0KDW2YJQxvbxzIY:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10
 a=ImwWUX5h3JJ3gRE9moBe:22 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: v3_FESMG0LQZs0DSsdLk8G2_rSXB37VQ
X-Proofpoint-ORIG-GUID: v3_FESMG0LQZs0DSsdLk8G2_rSXB37VQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501290148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 19:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210410

--------------H54D6DRIdAv0nZU0070zK9zu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50THpJre027009

On 2025-01-20 2:33 a.m., Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi<Qi.Chen@windriver.com>
>
> When DEBUG_BUILD is enabled, we use "-Og -g" gcc options. In such
> case, the xxhash functions are considered not inline, yet debugedit.c
> defined XXH_INLINE_ALL to force inline, thus causing build failure.

I asked people about this PR on IRC yesterday and they said they wanted=20
to hear what
upstream had to say. So far there is no reply to your email. Maybe=20
create a defect in:

https://sourceware.org/bugzilla/buglist.cgi?quicksearch=3Ddebugedit
to get the upstream devs attention?

This inlining gcc-14 compile error has been discussed in the context of=20
xxhash.

In the Binary Size control section of the README.md for:
https://github.com/Cyan4973/xxHash

we have:

|XXH_NO_INLINE_HINTS|:
By default, xxHash uses |__attribute__((always_inline))| and=20
|__forceinline| to improve performance at the cost of code size.
Defining this macro to 1 will mark all internal functions as |static|,=20
allowing the compiler to decide whether to
inline a function or not. This is very useful when optimizing for=20
smallest binary size, and is automatically defined
when compiling with |-O0|, |-Os|, |-Oz|, or |-fno-inline| on GCC and Clan=
g.
*It may also be required to successfully compile=C2=A0 using |-Og|, depen=
ding=20
on compiler version.*


This was updated in:
https://github.com/Cyan4973/xxHash/commit/574aabad87b2ab9440403e92e1075ef=
48554eb87

and mentioned in:
https://github.com/Cyan4973/xxHash/issues/943#issuecomment-2563205130


Hope that helps push things along when you're back from holiday and
have time to work on this Qi.


../Randy


>
> This patch fixes this issue by not assuming those are always inline and
> instead link the xxhash library.
>
> The 0003-Makefile.am-do-not-update-manual.patch is moved from musl
> specific patch to SRC_URI, because we now have a patch to modify debuge=
dit.c
> and this will cause manual to be generated again. This is unnecessary a=
nd
> will report help2man missing.
>
> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
> ---
>   .../debugedit/debugedit_5.1.bb                |  4 +-
>   ...-not-assume-xxhash-can-always-inline.patch | 48 ++++++++++++++++++=
+
>   2 files changed, 49 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-devtools/debugedit/files/0001-Do-not-=
assume-xxhash-can-always-inline.patch
>
> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.1.bb b/meta/re=
cipes-devtools/debugedit/debugedit_5.1.bb
> index 00c40473c4..02429afcda 100644
> --- a/meta/recipes-devtools/debugedit/debugedit_5.1.bb
> +++ b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
> @@ -10,9 +10,7 @@ LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D59530bdf336=
59b29e73d4adb9f9f6552 \=20
> file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504"
>  =20
>   SRC_URI =3D"https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV=
}.tar.xz \ - "
> -
> -SRC_URI:append:libc-musl =3D "\
> +file://0001-Do-not-assume-xxhash-can-always-inline.patch \
>              file://0003-Makefile.am-do-not-update-manual.patch \
>              "
>  =20
> diff --git a/meta/recipes-devtools/debugedit/files/0001-Do-not-assume-x=
xhash-can-always-inline.patch b/meta/recipes-devtools/debugedit/files/000=
1-Do-not-assume-xxhash-can-always-inline.patch
> new file mode 100644
> index 0000000000..8e9256ec01
> --- /dev/null
> +++ b/meta/recipes-devtools/debugedit/files/0001-Do-not-assume-xxhash-c=
an-always-inline.patch
> @@ -0,0 +1,48 @@
> +From 76eb6ce69349a05d0ff069062182550ebd88f146 Mon Sep 17 00:00:00 2001
> +From: Chen Qi<Qi.Chen@windriver.com>
> +Date: Sun, 19 Jan 2025 22:56:36 -0800
> +Subject: [PATCH] Do not assume xxhash can always inline
> +
> +When building with "-Og -g", we'll get errors like below:
> +
> +  include/xxhash.h:5210:1: error: inlining failed in call to
> +  'always_inline' 'XXH3_scrambleAcc_sse2': function not considered for=
 inlining
> +
> +Upstream-Status: Submitted [https://sourceware.org/pipermail/debugedit=
/2025-January/000359.html]
> +
> +Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
> +---
> + Makefile.am       | 4 ++--
> + tools/debugedit.c | 1 -
> + 2 files changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index c590edf..35fd947 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -42,8 +42,8 @@ find-debuginfo: $(top_srcdir)/scripts/find-debuginfo=
.in Makefile
> +
> + debugedit_SOURCES =3D tools/debugedit.c \
> + 		    tools/hashtab.c
> +-debugedit_CFLAGS =3D @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ $(AM_CFLAGS)
> +-debugedit_LDADD =3D @LIBELF_LIBS@ @LIBDW_LIBS@
> ++debugedit_CFLAGS =3D @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ @XXHASH_CFLAGS@ $=
(AM_CFLAGS)
> ++debugedit_LDADD =3D @LIBELF_LIBS@ @LIBDW_LIBS@ @XXHASH_LIBS@
> +
> + sepdebugcrcfix_SOURCES =3D tools/sepdebugcrcfix.c
> + sepdebugcrcfix_CFLAGS =3D @LIBELF_CFLAGS@ $(AM_CFLAGS)
> +diff --git a/tools/debugedit.c b/tools/debugedit.c
> +index beefd65..43f9cee 100644
> +--- a/tools/debugedit.c
> ++++ b/tools/debugedit.c
> +@@ -82,7 +82,6 @@ typedef struct Ebl_Strtab	Strtab;
> +
> + #include "tools/hashtab.h"
> +
> +-#define XXH_INLINE_ALL
> + #include "xxhash.h"
> +
> + #define DW_TAG_partial_unit 0x3c
> +--
> +2.25.1
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210023):https://lists.openembedded.org/g/openembedd=
ed-core/message/210023
> Mute This Topic:https://lists.openembedded.org/mt/110711482/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------H54D6DRIdAv0nZU0070zK9zu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-01-20 2:33 a.m., Chen Qi via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250120073321.3859875-1-Qi.Chen@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>

When DEBUG_BUILD is enabled, we use &quot;-Og -g&quot; gcc options. In such
case, the xxhash functions are considered not inline, yet debugedit.c
defined XXH_INLINE_ALL to force inline, thus causing build failure.</pre>
    </blockquote>
    <p>I asked people about this PR on IRC yesterday and they said they
      wanted to hear what<br>
      upstream had to say. So far there is no reply to your email. Maybe
      create a defect in:</p>
    <p>&nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://sourceware.org/bugzilla/buglist.cgi?quicksearch=debugedit">https://sourceware.org/bugzilla/buglist.cgi?quicksearch=debugedit</a><br>
      to get the upstream devs attention?<br>
      <br>
      This inlining gcc-14 compile error has been discussed in the
      context of xxhash.<br>
    </p>
    <p>In the Binary Size control section of the README.md for:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://github.com/Cyan4973/xxHash">https://github.com/Cyan4973/xxHash</a><br>
    </p>
    <p>we have:<br>
      <br>
      <code>XXH_NO_INLINE_HINTS</code>: <br>
      By default, xxHash uses <code>__attribute__((always_inline))</code>
      and <code>__forceinline</code> to improve performance at the cost
      of code size.
      <br>
      Defining this macro to 1 will mark all internal functions as <code>static</code>,
      allowing the compiler to decide whether to <br>
      inline a function or not.
      This is very useful when optimizing for smallest binary size,
      and is automatically defined <br>
      when compiling with <code>-O0</code>, <code>-Os</code>, <code>-Oz</code>,
      or <code>-fno-inline</code> on GCC and Clang.
      <br>
      <b>It may also be required to successfully compile&nbsp; using <code>-Og</code>,
        depending on compiler version.</b></p>
    <p><br>
    </p>
    <p>This was updated in:<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://github.com/Cyan4973/xxHash/commit/574aabad87b2ab9440403e92e1075ef48554eb87">https://github.com/Cyan4973/xxHash/commit/574aabad87b2ab9440403e92e1075ef48554eb87</a><br>
    </p>
    <p>and mentioned in:<br>
      &nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://github.com/Cyan4973/xxHash/issues/943#issuecomment-2563205130">https://github.com/Cyan4973/xxHash/issues/943#issuecomment-2563205130</a><br>
    </p>
    <p><br>
    </p>
    <p>Hope that helps push things along when you're back from holiday
      and<br>
      have time to work on this Qi.</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250120073321.3859875-1-Qi.Chen@windriver.com">
      <pre wrap="" class="moz-quote-pre">

This patch fixes this issue by not assuming those are always inline and
instead link the xxhash library.

The 0003-Makefile.am-do-not-update-manual.patch is moved from musl
specific patch to SRC_URI, because we now have a patch to modify debugedit.c
and this will cause manual to be generated again. This is unnecessary and
will report help2man missing.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 .../debugedit/debugedit_5.1.bb                |  4 +-
 ...-not-assume-xxhash-can-always-inline.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/debugedit/files/0001-Do-not-assume-xxhash-can-always-inline.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.1.bb b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
index 00c40473c4..02429afcda 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.1.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
@@ -10,9 +10,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552\file://COPYING3;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz\-">&quot;https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
-           &quot;</a>
-
-SRC_URI:append:libc-musl = &quot;\
+           <a class="moz-txt-link-freetext" href="file://0001-Do-not-assume-xxhash-can-always-inline.patch">file://0001-Do-not-assume-xxhash-can-always-inline.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0003-Makefile.am-do-not-update-manual.patch">file://0003-Makefile.am-do-not-update-manual.patch</a> \
            &quot;
 
diff --git a/meta/recipes-devtools/debugedit/files/0001-Do-not-assume-xxhash-can-always-inline.patch b/meta/recipes-devtools/debugedit/files/0001-Do-not-assume-xxhash-can-always-inline.patch
new file mode 100644
index 0000000000..8e9256ec01
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/files/0001-Do-not-assume-xxhash-can-always-inline.patch
@@ -0,0 +1,48 @@
+From 76eb6ce69349a05d0ff069062182550ebd88f146 Mon Sep 17 00:00:00 2001
+From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+Date: Sun, 19 Jan 2025 22:56:36 -0800
+Subject: [PATCH] Do not assume xxhash can always inline
+
+When building with &quot;-Og -g&quot;, we'll get errors like below:
+
+  include/xxhash.h:5210:1: error: inlining failed in call to
+  'always_inline' 'XXH3_scrambleAcc_sse2': function not considered for inlining
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://sourceware.org/pipermail/debugedit/2025-January/000359.html">https://sourceware.org/pipermail/debugedit/2025-January/000359.html</a>]
+
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ Makefile.am       | 4 ++--
+ tools/debugedit.c | 1 -
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c590edf..35fd947 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -42,8 +42,8 @@ find-debuginfo: $(top_srcdir)/scripts/find-debuginfo.in Makefile
+ 
+ debugedit_SOURCES = tools/debugedit.c \
+ 		    tools/hashtab.c 
+-debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ $(AM_CFLAGS)
+-debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@
++debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ @XXHASH_CFLAGS@ $(AM_CFLAGS)
++debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@ @XXHASH_LIBS@
+ 
+ sepdebugcrcfix_SOURCES = tools/sepdebugcrcfix.c
+ sepdebugcrcfix_CFLAGS = @LIBELF_CFLAGS@ $(AM_CFLAGS)
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+index beefd65..43f9cee 100644
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
+@@ -82,7 +82,6 @@ typedef struct Ebl_Strtab	Strtab;
+ 
+ #include &quot;tools/hashtab.h&quot;
+ 
+-#define XXH_INLINE_ALL
+ #include &quot;xxhash.h&quot;
+ 
+ #define DW_TAG_partial_unit 0x3c
+-- 
+2.25.1
+
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#210023): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/210023">https://lists.openembedded.org/g/openembedded-core/message/210023</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/110711482/3616765">https://lists.openembedded.org/mt/110711482/3616765</a>
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

--------------H54D6DRIdAv0nZU0070zK9zu--

