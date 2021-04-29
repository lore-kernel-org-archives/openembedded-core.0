Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.65])
 by mx.groups.io with SMTP id smtpd.web10.9083.1619711679733701308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 08:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LVj4LeW8;
 spf=pass (domain: windriver.com, ip: 40.107.94.65, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1JyMWfYZSEf9KqgTOrLa5rH6acCS9xo1NE5FJd5M06i11R0+FcdOdCnEe7nA7lC1mkULVdtbKjJtzZIekKdataldOrOthce8JgYZft8ETGU4XzRut8r3jqUmTbRCIU98+g5k3QGrAjbgcJsDlfBOEhtFdOFBYCY1wsPjRDtEzsPL/FAECM2gYmHuP2KYWd33zKsP0mGYmDMI3y3dW8gbgMN3Ec0ZfrGcZ7NElKBwdoyd4VKtoH95tUzuBSceCg9S3Qmfm/dGgT7j728PckhnWYmJo4FO2y1+RcPNLird7nSRUl8kNTAAQDACSMDAybV70eR/uXe1QCOefTRh5c9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq/rmTB6UP2PnX/NUM26f7627wUTC9tjDChbgmzMJwI=;
 b=HNxhmYO0F7eF64lt1+OMlm0PJFBoSBjjLS0cD+UX+k9/wVyq+6mnqnjhqrudxWfpd4ZNPm+dWjuzCLn/u4G9/781K6QAbUM7BHEb5Zh56afSYnKTNNSCrEJs+sHhDytUlAKFzr37Qq5nxQSiTrqwbEx864g8kBa9WfZzANrfCdR5KBxA7ug08gBloKeHRyHV+5QmSHrPQxocOvAJTiWI9LxllnXcXnQo+gqnRniT7NC1yXL7bJNfe2LrXMFCZ5YnTRf4KPLxebO8dHebDa+eCA2wbv56nGkgYj7DbemSrOWegxpRwcLOt5WSvLUovcqwT2DygrHe5tjJAZo8SbwEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq/rmTB6UP2PnX/NUM26f7627wUTC9tjDChbgmzMJwI=;
 b=LVj4LeW8GQdKVNaDY4ZT5cPwF2ua8UwMLydHD374ozTjAEMocECnhL5Pp6+++ICmzdTTEwGH2rXNwXA5liiKH4cAygGWDwnzXDd4xsqrxR8YkVEXZ8ahy8Z8iQhixJdbtInL6PHw2dDEGV6yDG/AeG8T4RpRIsHW6l69hCrG7Mw=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1679.namprd11.prod.outlook.com (2603:10b6:301:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Thu, 29 Apr
 2021 15:54:37 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 15:54:37 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
Subject: TBB: qemuppc build failure with lastest 2021.3
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>,
 timothy.t.orling@linux.intel.com
Cc: raj.khem@gmail.com, akuster808@gmail.com,
 "MacLeod, Randy" <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <d63907d1-d22c-394c-182f-ab30de47b229@windriver.com>
Date: Thu, 29 Apr 2021 08:54:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR01CA0029.prod.exchangelabs.com (2603:10b6:300:101::15)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by MWHPR01CA0029.prod.exchangelabs.com (2603:10b6:300:101::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 15:54:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8cb994d-3b0c-431c-2f98-08d90b271784
X-MS-TrafficTypeDiagnostic: MWHPR11MB1679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1679EEBA0222C195514F341DEE5F9@MWHPR11MB1679.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JLQ4Yf/+JwTMyD/4Ex8WvNyiY50wufOjwSJI5VLCRhdJyxPEzQBb/G/TcToaqIwKkkN+ghX9PSlFzkpfm918pwjAFbsPFnxG4RBMI+NMO4eQVOEHkxoLRU6Zu4+HumrJfdWivGkaghDRpTRl7z2jQA607k38V1XkYYwqGcFXIz9kSWozm3iATfTBUjC6DBw09afRLPjWKebnd1YB3KhQUI7XSrLEP6HPJA63UgkF8qzAnLnUJXvI6LULc6ym6g1xo7wcKK6+nlCTvzUQPxETjufCqxgdbNX3Qb3PhWGmnQ6VPmlZTgtCd3RzPV9hDZcyo8Z6d2VKs4RtFuP6k+ke9YU1UlKzznmgXr1VyTz5J+TzmRn00EZ39YV/40rCP6snhUU1bsU0wB1I1vA82h+mJK8DEl3DMUCnGK0pfqrsnZXxLKte0L2Bp7JCTCFetc6PpVSb2YmQeWG/LRWu3Ir1x9izwOT5QPOK//91jwvJWsjjVeu47wUu7SIhuKmOZ0iGfifN4necgiBM6YakYuWIRn42FNTmNqWccGQ6ewBxbug5A6XiMgsL1M4fLNzzm5t5RrPMfR6Nf1pllkdPDJZf+YCFbr2iKjLR+qrl1fhz9oWp+NZj7zXpsmeiF/0M9kZ4VV0/1SDTxTMmKMFcVWlPySlpMeX4MMAuq8ixEUy1JQJJnH16sCo+FpHtvB0cV3yh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(366004)(376002)(346002)(396003)(136003)(5660300002)(478600001)(8676002)(316002)(16576012)(83380400001)(36756003)(31686004)(6486002)(31696002)(2616005)(956004)(86362001)(38350700002)(38100700002)(26005)(8936002)(52116002)(66476007)(66556008)(66946007)(2906002)(186003)(16526019)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dHpJZS9GbUJCRWNoaU9mTUJidFhMT0RQVUttb2xWSUlSeTRrYUZnb3lEUG9D?=
 =?utf-8?B?aHQ2aEZvVUQ2bWxINEVFbDJLOVIwWGJFdHRUbVZ1YWJ6TXJnYlN2N2Z5bjNF?=
 =?utf-8?B?ZU5UMjdJczROTjhsYWJrd1FOUUxDcWxKeHFxYkV2YWY2SVY0WTF4TTBTVzNL?=
 =?utf-8?B?VmViWnUwQ2doaHh1OUpmWllBMVFONkhQMzVBaWIraHpxR0pJbjRCSllDenVY?=
 =?utf-8?B?Q041SytsZ2w4WWFGaC9xMGtFOURjTG1FSVQrd2h2Nkh5bmRZQlkrNTB3NFkr?=
 =?utf-8?B?cWRXbU9ra09mUWoyeUpuTkVibW5xMnR6WEFHV2o4aWhZak1GeXAzeXVLTXFZ?=
 =?utf-8?B?ck5NSzJYT3ZHVXlPTVJjWndubUNHaFVFQWt1ZVVHZjY0MjNoVnVTS2VyL0N2?=
 =?utf-8?B?OGlRZjY0clhWWTFnL1lNRnVrS2xjeDhkb3QxZDFRRDdOS3ozR052cjVieGky?=
 =?utf-8?B?RS9uQlNQT09UUTVoZWxBMnpHM2V2K05mK0k3T2h2d1JncDFDanE1ODVvT0FL?=
 =?utf-8?B?Ni9TTFJhVWlaRExKSjhHRUsvcGdodExDTTllQWxNa1UralFtZ0FyNk1Fc01p?=
 =?utf-8?B?MHFpVmJmYXhnN0xsWGtIcUZScFRVeEpTV2pQbklUS0FJTjBCMlZGRDFYZ3V4?=
 =?utf-8?B?SGoybE9lZUI3MHBuOVJDcjZWK2Zsb09zejNML1NTQnNFcHhwNUFnTjUvMklH?=
 =?utf-8?B?eTFJUTk3M1R6aWxBL3NUR1lvQmJ3TWZVS2NEUWdsajhsNGhHVzBIQzhzRWk3?=
 =?utf-8?B?TW14Tm5BRUN1bEZXMnIrdTN2WmJySzdTcmdzbnpHeEQ1MGpEODh4aVo2Qm9o?=
 =?utf-8?B?QW03dHUrYldXWHV6Nk1KSGt0ZUdPRnhRTnVvWmx2U0UxbDNnbzl5c2lxVFpU?=
 =?utf-8?B?OU1tM0tuUXRKM3lJUHZhNS9jdnhSN3FaTHpoTTlqK2daRmovelJ0MFdGK3ZS?=
 =?utf-8?B?V0tjdkt3WFFGZGkvWkVLV0p4anBBeW03TmkrMDhZbmEwSVd3eWJxZTVZNHF1?=
 =?utf-8?B?NTg4cFp6aTNybzNPZWxJMEZTZ3cyQUpTMDMxSWh3ZXRTR0o5aWsrWFIyV1JN?=
 =?utf-8?B?VzRFWG1ETDM1VCtoOG00QWg4VU9QT3l6a1QyNHR6TlVNYmR0WWJJYkRRVnNS?=
 =?utf-8?B?TDVjOWQ1WERhenppVjhwN3JtbHNjZE53MHBIMk8vM1ExUVV3ZVNDdFlkL2hv?=
 =?utf-8?B?eVZpbjNNeFpSRWMvVk03Z2grQlBDYWJwYnR2R29MWFNScGdPZ3FuNUhtWFov?=
 =?utf-8?B?MGJuY1cxbmR4WG5xUXVIVUxUcjlyRXU5MG1mazhOd3JWK0FENlhwVnBoSzRF?=
 =?utf-8?B?cGF2cHZ6ZVlEdUkyOWp0STVXaVp3L2xZVUlCNWl1ZGw4emZyU2k3bVNEeFhr?=
 =?utf-8?B?dHN4clJPRW13MWRteUszU05NdFRiR0tqOEZDVlRvQWVrbkk1TFBuQUtSQlBo?=
 =?utf-8?B?OEZFNDFxNjY5aC95TmQ5eFVqL1MyZEwyUGJDdEJVSFkxUmxEaDZNYVE4RHlV?=
 =?utf-8?B?M2RGdHFpdWl2ZS9kSE5SWnY3MmFaNER2UUwrSUFRanlmZERHNkk0RGRjdkZW?=
 =?utf-8?B?enY5ZDhIb2JkY1lHT2FJZHMyS2tJdDJ1OCtXYklEdXBoNFgyQm5kOFVQaDg0?=
 =?utf-8?B?dzFOZVpYc3JGN25NNnhIaTdYOWpHYmliUFhtbURiNUJFczdvbm5nTERVN3pk?=
 =?utf-8?B?VFVxak9yREV1S3piTXVBWTVVdUEzK1RpS255Q3ZmWFo4dHN0VVk3cTI3aHdo?=
 =?utf-8?Q?Uz1ClggttZ+m/tqe9mVzw8HTwKL57XcdjnKijta?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cb994d-3b0c-431c-2f98-08d90b271784
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 15:54:37.6959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyY1v0YDICi8RumX4WRYSJTR3zGPu8k+OCjVOOe9J/zhtJ5CnZjbsBuVntPFXh25MJn04n4ieqePdzJ3F9MayA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1679
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Fixed oe-core ml


Naveen:

Looks like the latest version of TBB does not build correctly for PPC 
machine targets (qemuppc for sure), it builds for qemuppc64

The failure seems to be the handling of __TBB_machine_fetch4() 
definition below, particularly the ITT_ARCH check for PPC64 but not PPC.

/srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/2021.2.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12: 
error: '__TBB_machine_fetchadd4' was not declared in this scope
   338 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
       |            ^~~~~~~~~~~~~~~~~~~~~~~


Is TBB supported for PPC?

Thanks
   Sau!


#if ITT_ARCH==ITT_ARCH_IA64
#ifdef __INTEL_COMPILER
#define __TBB_machine_fetchadd4(addr, val) __fetchadd4_acq((void *)addr, 
val)
#else  /* __INTEL_COMPILER */
/* TODO: Add Support for not Intel compilers for IA-64 architecture */
#endif /* __INTEL_COMPILER */
#elif ITT_ARCH==ITT_ARCH_IA32 || ITT_ARCH==ITT_ARCH_IA32E /* 
ITT_ARCH!=ITT_ARCH_IA64 */
ITT_INLINE long
__TBB_machine_fetchadd4(volatile void* ptr, long addend) 
ITT_INLINE_ATTRIBUTE;
ITT_INLINE long __TBB_machine_fetchadd4(volatile void* ptr, long addend)
{
     long result;
     __asm__ __volatile__("lock\nxadd %0,%1"
                           : "=r"(result),"=m"(*(int*)ptr)
                           : "0"(addend), "m"(*(int*)ptr)
                           : "memory");
     return result;
}
#elif ITT_ARCH==ITT_ARCH_ARM || ITT_ARCH==ITT_ARCH_PPC64
#define __TBB_machine_fetchadd4(addr, val) __sync_fetch_and_add(addr, val)
#endif /* ITT_ARCH==ITT_ARCH_IA64 */
#ifndef ITT_SIMPLE_INIT
ITT_INLINE long
__itt_interlocked_increment(volatile long* ptr) ITT_INLINE_ATTRIBUTE;
ITT_INLINE long __itt_interlocked_increment(volatile long* ptr)
{
     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
}
#endif /* ITT_SIMPLE_INIT */

-- 
Sau!
