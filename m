Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744C8C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:42:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.40])
 by mx.groups.io with SMTP id smtpd.web11.11450.1741862526037701771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 03:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AicvU+q5;
 spf=pass (domain: cherry.de, ip: 52.101.67.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyeJ9+57KqJijE+23tt4dZaxJbv21Z6KrmAPXRXPqr+IXsyW7BPMsL1eBLcTBd7t5qJNMwBo9Li7ZbRufPp8lRozjXFACN03mavKBPg0IoZLhSXpfm2Pvq3tuPXR0BKce2/cf2yhLfCvlrRlNImW7myo7yXoIQaCsV01uhgkI4ITZNs/iNnyg1aKIb43p8Up1XTXbrgZA2h4DtirnA95MysmWXdCuz6jSe+i/dlUXXeZICaPLbv+kW3Gouzn5zHUaVsp3AyVdf2NNZDjPKFE1G8NB9vr5Dib8D+MG43vGzpdO62WZEtyWc4VdoErdCiZZoxnIb9m66EBbHbDIEUy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0x7PElnWACVFwCwNFHU+ttUURHCbtuk6+a2QyyAStE0=;
 b=FiIgtZbk/9cuJjAqT2rhvXJGMUFs7wA1go2Htt7PS/lUtSkCgbEinYseydXTbd5Q9hTh8hli1nLoWTLdkArrIBEsctWKvGzTTLbrJTf6FuEQZdPEg2kY1/AYsL4WYBOwPDHW/vc5nCmFEnsT9MCq63wreTD9mGhj9E0htPvOMNaduIukScm4tio2mLwZP59vfGKEfLqbTqKJ4zij8Ix1d2GOySBB22yiXANpNsNeCSZZN3RKP409r8m6PLXQz2MAzEwPoJOKaKGKfqMaGzi2xcWxOO8fSxonbhWO0vgpWG7lxK1iA92nGGeO4FJ1MRcUFs+zaO9XXU/AedtO+dbtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0x7PElnWACVFwCwNFHU+ttUURHCbtuk6+a2QyyAStE0=;
 b=AicvU+q5IwBTDLiHyKDZKrbgjEqiYhi4ESFAVHI2k/fjYaxGRyB0LTODs9uiKIfGjp1AmRRYWKI423PlyercB81H+bjVRf6jO9tnSsDHpu4THnO9dZX02eAsGsMen4jFmjPbpYiXwR9wUSCwLzDXd/+AcDWKpUPUF3iOpBWSyC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DB9PR04MB8430.eurprd04.prod.outlook.com (2603:10a6:10:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 10:42:01 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 10:42:01 +0000
Message-ID: <08f82749-0290-44bf-be8b-ffe998f62283@cherry.de>
Date: Thu, 13 Mar 2025 11:42:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: Fix packaging of some
 subpackages
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
References: <20250312125554.365599-1-zboszor@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250312125554.365599-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DB9PR04MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2146b7-d88d-48fa-c5a4-08dd621bb00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SkZKcnBRV0pHY3NFbEViOEdSdHp1R2wxSlVSVVA3S3JLdHpZUWxFdkhVR3Jw?=
 =?utf-8?B?NGIwTk80NVRrNGk5ZVI0V2lJemZiS1dCVnRsRDlpN294V0U2Q0xCS0lCaCt5?=
 =?utf-8?B?eWhLWThESWFFeXJyelRtL0NrelNRd3F6MHd0endMMjAyeGhUMXMxeDZaSzhy?=
 =?utf-8?B?cW1wbHpVc1dBeTc3R0dwVjlGdVRkcEVLdWE0U1dmaXE2VGkxYXMzenEvVWd0?=
 =?utf-8?B?bG1IK3FzWUFRWmlZY1Jmd2pmc1U4ajl2a2Y0RncvcEFKeXhpL0Nwc3pMWXBy?=
 =?utf-8?B?VlVUOUVncE1ENW9xcWRrOUlJZnNsbGJFb0dkTFpTek1sdlBYcHFRM0lnN3RS?=
 =?utf-8?B?TFFrR1k1R05ETjE4UFVJc2YyVk1SZXB2NzVVTloyZzBjK012c3Fxamd4RnhE?=
 =?utf-8?B?RlNoWHJBZDdnbmxCaE5uRnhmYk56eXgrYzhlKzk2UFlwdkJTN21MK1RXRjcz?=
 =?utf-8?B?M2Iwc2RuMjhKY0NyZUxTbGRoQ1Z0QzA1cXdVSkJHTzU1NkxtMW5QMnVnMjJT?=
 =?utf-8?B?dk9NUHlQbHpjcU91RWhmQUlmdXpmT1BweElVQmVnUkY5L2hEcm51emoyNGNy?=
 =?utf-8?B?Vml1K3cxanlUTmtuN2ZTSGFZSkYwc2g0R3YyY0VVeFFHSHMwd2ZQNG80Zjh2?=
 =?utf-8?B?UzJ4MVllazNtWjZ0bUNSY01jZFdVaVRINEpQaHFWbFc4L1J0SW1uT3o3MllC?=
 =?utf-8?B?U2NCb21aT3NIZExEL0xVUi9taUs0dzZROUhpc1FIak5tN3Z2cDBKbklGaHVE?=
 =?utf-8?B?NHlTZkYvTVRHVWZJREdVOVJiMjVzbWVsZGVPSXFnTGJsVEZhbCtQN2l6aEZU?=
 =?utf-8?B?TDZ1WjlSSHlWcG9TbzBSRmZsTTYwRGlBUTZQVTRKTS9zMFB6V2s4L2NmNnVa?=
 =?utf-8?B?KzhkaXo3aktLRk5GMk5sSnRrc3FJa0NIVGlqOVJsOGs4RTFEN0tzbk1CcDJK?=
 =?utf-8?B?V0FTbXByb1dGOEpmTkFYMlFEL1grQzN6V25QcnRKa0NCdWxOdjg2S1VTdzAw?=
 =?utf-8?B?c1pIYlU1Rlg1WHI5NEd0ZmJYd2wxcWZJMFYwYjJieDRSY0huRkV1T09aNjhN?=
 =?utf-8?B?cnBKWElUb3ZaeXArTHk4V2ZZMnhiMTg2Nlp5SXZrK0p4RXowaTFhVkJqYmNN?=
 =?utf-8?B?T3JOdm1vWUlOd1NmRWZKeFFZMVdCZnVSWUdKdDRBZVhDMVBnUGxTdGRQWHha?=
 =?utf-8?B?VlhtOXVzNFl6U3BqaGtxaXhwOEhmTjhiN2p4TjRTSWVIRFVaNzZpalQ5d0Mr?=
 =?utf-8?B?Mk9BN1B6dkJiZlVpR216c2YxTFdGY2RramREVmRhZFpNTURxdUs1ZDN6dERt?=
 =?utf-8?B?UTdsQzFZSnF6ek0vV2JDVDhuWnQ1Q0RNbXRQYndYeStMVmxNNWEreUkxbnZQ?=
 =?utf-8?B?MWI1eS9YVmEwdTdRMGJDKzBxK3ZpYy85SkNVbVBGL0FCQzVhV2s5M1ZFZmhZ?=
 =?utf-8?B?M2l1ZEloZjJJcHNNaU1PMTIvR1NCUHVHYU9xbHVaanJka2RmWFdBdHFueW1T?=
 =?utf-8?B?QUYyRHNCdXRGbGZpWmgzYnZ1eWxiN1ZHUXNRbWszTWVnMzZwY0hGWWp3bnZT?=
 =?utf-8?B?bnd6UjI2RmxreWI5ZElBbkZjN09MZVdVRFRveDQyN1pVVjN0UW1PQm52dlVH?=
 =?utf-8?B?RldqdFZ5Q01qNkd1eHQxckljREVaMXFVVUh5OXNkdW04M3ZQVnFqWmlTQlZP?=
 =?utf-8?B?c3EzYkhhcDhxLy9ueXUzQTFaOFlBRFA3d2Jwelk0dHRRZ0Y1T1FPQU15Tmo1?=
 =?utf-8?B?RXQ2QllnTTZ4YUFySXdFSmhuRGZKdlZoUDltdWtsNmMzNFVHdnhyZzVYT3oz?=
 =?utf-8?B?QmhJTE9hZ21VNkFvdFdEVVBTNENMZlErYko2blJ4M2ZVenZtR3VXMjVtRGVj?=
 =?utf-8?Q?FGD7TuUIStHxm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHZNT2FDZ2I0em5CTU50R0ludS9MaGszeVZBbXlxaTZqQUxucFkvZGZwc0J2?=
 =?utf-8?B?aDZsUG16MmwvVXRlbm5vdG84bC8yTWxmeC9pUWlpZytGb1FkempFRGtGUUtm?=
 =?utf-8?B?OGxvUGVXM2RlN2s0dzczcVAxa2VYdUF2cHFWVGZoUDRxRHc5T3IvVjNPdkhu?=
 =?utf-8?B?YWZ2Rkl1UHdtVmVQVUtHdXR4ZmRjUzlBaGY1c2Y1MVRwdng1RHdQM3ZpSGh3?=
 =?utf-8?B?ZkhCdEtuU0pHcGlwbDdXSCszMHRoc2NwYWk3eWVCN1VmNUhlSG44OFZpL21Y?=
 =?utf-8?B?MHVoSElqOXl5RU9uWjJxQ1lKbTNKNkpLOVFma0dTVC96N1MrWE83U2o0NWov?=
 =?utf-8?B?RmNTcU1FYkhydWVaQVN6OS9QY1Fianc3VFlROVViZTMxbG53TWovT1UzZEJW?=
 =?utf-8?B?MmQ3V0lzZ0dONVFYa0VRVlhzUVpnOS8xbnJvZktqRTZQdXFQWUNpVTEwRktu?=
 =?utf-8?B?WHhaVXRaK2Y5Q0c0cEdpZVBsK2xpdDJWMVpJM2dRRU42RkRrNmxwRmRCWkpi?=
 =?utf-8?B?VVRSZUxHQ1huTFlrNVRUclA1T2ZGRi9hUGFRajdmaU1pWlg5clp1UGZtTE1v?=
 =?utf-8?B?WURiUzd2MzBSMFJaY1pQeDFpSGo3TUoyZ0pJY05IMW5iYmdJS0xRU3BybmRt?=
 =?utf-8?B?d2xBVDhZVmlzMFFHNmo4K3lKOExKdmp6T2FzYVVaWm52MFV6UTcyN0tiSjZG?=
 =?utf-8?B?UndweWRiTzI0U1BuWE5reWNvNjg3K0g5U2sxSXo3VUxYRTBkL25qc0F5dkh0?=
 =?utf-8?B?TGcxMis4dmN6RnBCb1FSMjlQcW9uN2JnNVJKV0xLM2U0SHhWeFJ4bG9SeG1K?=
 =?utf-8?B?REZQdkVldWI5RXgvZGQ2ajVGSzBGMzl4Z2xyYXJoWkVYUEg3WU1BRkJrVjMx?=
 =?utf-8?B?MFpCa01TMU5NdWtXK0kyUXFNT0NqeldDSjd4M2dwZ1Y4NFN4alFUU05veVZI?=
 =?utf-8?B?d2d1eldSQ25wamlkeTA4L0RmbkJ5RGxkMmJlaWdGYVVvdTRnMUh5TTZSTzcy?=
 =?utf-8?B?NVNnRzMzRjIremJEOUgxalljdkJiUzBNaGxwVXhUd29HYmZ6QXQ1WGU4UVo5?=
 =?utf-8?B?RWZLdThUbzVHcS9SZ3NxaVBwOEhyRERqekwzY2pQWlpsUlprSmpqaXErTTVG?=
 =?utf-8?B?RlRIbUFkYytyVEE1cUZzaktNM2YrQ0NWYndxU2d2YW84cm9OanBoM00vQ1Bk?=
 =?utf-8?B?ejB2dk5VQ3htY09JOWR1UVNBZUZGekR4MWRFUFI1K2Q5eFhxRXJrdnNvdWtD?=
 =?utf-8?B?U2tucVBLdG9vRy9TWFBpUDdQVXREOXcybkdUMllLWjgrSlhYSVF3V1R4SFdH?=
 =?utf-8?B?VWd5UHo4WHg4eVlxaDlTOGdqNkhrOFIwa2FoQVE0K05IRE4ySHZnemkwcm1T?=
 =?utf-8?B?T1BCSS8veWVOK2dzeGt6WVRTb1RGUUMzUUZlOU9oTGRCRVh2dFFudUJlcjhv?=
 =?utf-8?B?Rmp4U1dBWFRwdUpzV2tKUzkxK09KV0pLbXpzTFNzVlhrWFJrVGZzaEdsaDFO?=
 =?utf-8?B?VUt4a2R2WE5UeVgzRWVHRFBoT3kxaFFLZEJZMHVuaXoyTC9wUlFMTjc1WXlw?=
 =?utf-8?B?VEF6NVFoTVliaGVIdFFHSGNIaHprRkloMGZBMkV6QTJHK0JqcGR0dXZTamtj?=
 =?utf-8?B?eTdLQ0RCeTdBUVY2L3dsczhGb3dRSUdwcG5mREQwZVdMbzgwQXR1eGZnMllq?=
 =?utf-8?B?MVF0TWVoN0YxSGhGbkhBQlhnM2lEbGpTMXpNNUVsUGZVQmJDWVVwbFE4bGtO?=
 =?utf-8?B?dEQ4a3JFSlVnd2ZNejFoL2NoZldyYTV6MWtFUEJISUNYMWw0MklwNUlSaXBV?=
 =?utf-8?B?TEFXSG5wSzJkWC9GRUZDUWtmc3RqN0ttNDM2VUlud1E3SFdKbFFGQkkvQ1Bh?=
 =?utf-8?B?TjBxcmN6UHozNTZUOWJQeDB3WUhJM1VUak9XbWdiSjNxb3BjVGJqOTMwc3JE?=
 =?utf-8?B?dXlTbXB3dDNsMzNGbVlkeXIxVnpONXNZNkp1V2lxS3A5RVh5Y1paWEJXYjlH?=
 =?utf-8?B?S2xXeC9Uc0hKOW1mSjlCbTNuc016K3I0aFBGcFJMNFhEU0I3TXg0dmY5YkVZ?=
 =?utf-8?B?TGt6TmhtdmVEaTkxV3habzV4N25OMmNYZHQwMVdaaUlTZHNHY05KRS84blNO?=
 =?utf-8?B?QnZxcktmK044eFBnZ3lzVjNHK0dwWXRGc3FvTUFRbXhzb1kySjJITGtXenJt?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2146b7-d88d-48fa-c5a4-08dd621bb00f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 10:42:01.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rK19GpKXow4OKGxogDX4oQ102Au/9aetnEGz/DCZfxlpldTCl+6c/p4+btpxKDeUIIeyk/fsLNB4dc8Ihe/5KoR0Zv4cdagsL/ogrW8L66o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 10:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212758

Hi Zoltan,

On 3/12/25 1:55 PM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> Since commit c0fedbc7 ("linux-firmware: Upgrade to 20241017 and
> allow compressing firmware") more firmware files were added and
> some subpackages have been split further.
> 
> Some of these new subpackages do not use the correct globbing so
> when FIRMWARE_COMPRESSION is set, the firmware files end up in
> a different subpackage than they were intended.
> 
> For example, linux-firmware-amdgpu-aldebaran and others are empty
> and everything ends up in linux-firmware-amdgpu-misc.
> 

Should we start thinking about adding some magic there?

E.g. have some anonymous python reading all FILES:<> and add a * at the 
end of each path?

You can see there's a patch from yesterday that also forgot this 
trailing * (and to be fair, I would also forget it).

I'm wondering if we couldn't reuse $(FIRMWARE_COMPRESSION) instead of * 
as well? Or whatever should be the expected file extension if 
compressed. * always made me uncomfortable as it may somehow match files 
we would want in other packages?

What do you think?

Cheers,
Quentin

