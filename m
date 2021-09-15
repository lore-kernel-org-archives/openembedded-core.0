Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4793.1631695377151875673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 01:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IVKotvFY;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=489277713f=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F7oCGS017552
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 01:42:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : cc : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=NCYivQROnP8OfFzFFP4ZA/JC/dExci2FKMy1/aUnIbE=;
 b=IVKotvFYT45ghBS1MiPn6hQ9cHXfXrI+/K5zfa4RrljzeszC7Eij4f3GtZxe2cES2Tc9
 mXlZ/4Zpx1VtJzxjnO+ZWJKHmMjB7PlBV98Rm0QNwtCYsGYzpmzRskCAS7j48feLoqRi
 Y07RnURzjMF2w8ScoAAESKwlEWY4rORT2Fw/YPyS8dKxLWjVt3V+O1ZhO/1obzsovPYO
 dNYTXnT2zczchsE6SK46kuDjUWFNAtDxAG2jkrrhkID5uq8OizLkPbBldAXachuBAv3Q
 LNS8k4p3hUkjwBnU/suFAnu4kiujV9Tgvr+VYpvC0vm7QcxzzRi5lUV7UHDi+VgfRmJg Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b3amyr3pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 01:42:56 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18F8gutM017545
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 01:42:56 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b3amyr3pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Sep 2021 01:42:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCM7XZpkDRIm1vO5G5ge1oHq/05sr1wWBURf7e2RhhLslimwYV+Ho6izuH5knUzhMm6d5i/zAdZLY52NirP7/ARPGbaVAcVMUSzzdSBPrJJq6IrcIHbtm0v4x4kyGPscby/IiVGqjYhlOxt3vSHA9xEq6UBZjSpu0juOCWsbDeogb3ilzDzMzwRS6Y+mlQnU8WHs4HLJtX5k4RrmDz1y1Hwbh63wxuBcvnsCMK6hwfpbbuw2pk0BW8QmYdOCbBoSAGlOjhOMZQ9W+yBh9fw/OZEnzwAZxm6ktpeV7pC+MbJ4iimkcNXajtDceVPH1puZiemdgt6MZ2bRCM9hsQWO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NCYivQROnP8OfFzFFP4ZA/JC/dExci2FKMy1/aUnIbE=;
 b=jLM30+Pe7ojTO3Gyk9Ni/XDHQoSDQZroagcqF5rSsEUJmUydCVu+8ugKel0izeLwYOowDXVvMFHWe8jBDtsqnWPOi3PnVbPfAZl1M3PvjDPCJ+Qo+Gnx2TFc6aTqSSZO8w+8KjTtKDK1H7OXazwQB0UvE7XVciCTzECV/ex4RTWOgQAvCNQyb2f74tfXHT6LF164q2g36ucHLDCvnXBg6hj0mjb9+5YOY7yP8AXkGk1Hp1JC697Eq4TX98m4zFrAjzpD/GW2aC7/FdHBJyr5TWWtxmV3fvhfDqis8LkYWLV7jJiAvLrUDJnf7us/8eHxJsXSZ6wFRedxiUCgsYpODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 08:42:53 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9d20:68ca:19c3:803f]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9d20:68ca:19c3:803f%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:42:53 +0000
Subject: Re: [OE-core] OE systemd RemainAfterExit does not work
To: Jupiter <jupiter.hce@gmail.com>
References: <CAA=hcWSnctuvZNc=vcAn7-u6W3DHRiLLk2chhgNSyr4s=zNuqw@mail.gmail.com>
 <d7158686-8c8f-e7e0-70c7-db2d433a1c6a@windriver.com>
 <CAA=hcWRdHaeu0ACq5hSLcy6+KxvAxqrcuTzwSR814kEabKk7nQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <de5c2b1a-e94a-815b-20f6-0adbbe80925b@windriver.com>
Date: Wed, 15 Sep 2021 16:55:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CAA=hcWRdHaeu0ACq5hSLcy6+KxvAxqrcuTzwSR814kEabKk7nQ@mail.gmail.com>
X-ClientProxiedBy: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
Received: from [128.224.162.141] (60.247.85.82) by HK0PR03CA0105.apcprd03.prod.outlook.com (2603:1096:203:b0::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 08:42:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bae851cf-4833-4771-5494-08d97824ced0
X-MS-TrafficTypeDiagnostic: PH0PR11MB5593:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB55934DA0D4C4D55E90E3869DEDDB9@PH0PR11MB5593.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4pc8x6XcPjHkC/w703jcJI2ZT0C6HxL1O2YVlkITwLW/Iy/Resl7xXVIEVE3K8C0tVbxNSr4Z7sKgmyQgk94EqQZ4B4/IlH2nImvp5yP1gTqNINu+Pwbqmp3AcxrQkSxHQAirfp8tQaEHpFJ00H7sYqh8KVQxenagHt99w72t9RK4O24MTM4pyd6lnLcT/SdReXyEPgiImOk6e+r3sOzzYiHj4fNvKLwe1UO0WDmOB6oXuecauYlbYQTKr+E2Oc9mOO16vkleV14RZaG50KvkZI2wCvsgMAxSKp7dweFNIDKDRQEa62sip3lqPJcZs57jLSldhUJ1kLIXXLolRg3EfA6ZIboHWTDw5524ThwR8JztudjlrPY1gfAHuFFFEDYghNT6KuXCWfisxyiLc6JxbRVTSMLnCg0xvNGyCh+p66N/6V/fFjSp/Nao7gLD1e5/RSrEqog2CjsrDB2b3/wxwAE3WL0Y3dzaBF+GLx4KoZzaN+JaXm/GeBByYbnO6bFf76yQdPKcP/2hSPiYj5sM1NcaxJ+clOQrzz37Znzg6t6/qbWeNFYGyIZpylYUJu52frbVucEAhZmw9ickIItlUQKQ5vJkgU3DdfKXCcSGcD61SN8C6YgdgXQ+bhG1ziOeM99IEh8uZSMeQcbu/dOUGIKFuW2tEuQ8wTefzjRElBqsqUUYYJhfnHDaajKTZxVbcWIcjLUyIsH36Jt8g7dsQQ/i1+ejFQ4J2JkVq0fcCp+QsVhGebT3C6RiSxGxL0v/Eop2C1rtT5Nluv29lO+UDaF8dfZF3LknZgFXiSwiMk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39850400004)(136003)(376002)(2906002)(36756003)(66946007)(66476007)(66556008)(8676002)(5660300002)(31686004)(38100700002)(53546011)(26005)(6706004)(478600001)(38350700002)(2616005)(558084003)(6916009)(4326008)(956004)(86362001)(52116002)(6486002)(186003)(6666004)(8936002)(31696002)(316002)(16576012)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qk12RTczZEFZaXltdVdadytFOWhvaXhHdUZlaGszcjBTSVlyYXg3NFJJVGZZ?=
 =?utf-8?B?L29zeDRNODczNjI2OURCTmZLZFBRcG5jT0VWUEtvcEs4Rk9VR29tMEZWZk9y?=
 =?utf-8?B?UHFxOEtKTW1LLy9TNkpwTFdQa1FtUlFvVjVHamRZUHpQVGduSUh2TVZJNmha?=
 =?utf-8?B?ZjBGblpWeEVncmQ4aWM5THdKdnBMY2hkQ0ptaDlWckVkUENOaUNGZVh1eHBX?=
 =?utf-8?B?TDl6dmoweGxvclhHOCs2NzZoLy9SSHR0dHR3RlV0QUZqVzdPL2tNTy9LdjNX?=
 =?utf-8?B?VjNXS2JKVjRiYWlqQTRBUWJJUzgxVnhmbkw2OGMxaDE3L2t1L2dWQnY4cWky?=
 =?utf-8?B?MXduTUpHQnhaYnRJa2dkY3lMVU1xbG1GYng4ckV6NGFEMlc4UWRoZmYwdE5Y?=
 =?utf-8?B?TVhuTWJKWXJmMUdlRG1lT2FCM3ErSEZZRmFOT1g2bEpyLytlckpGRDZFdlpt?=
 =?utf-8?B?N0txdlBMTnZYeEJqdjE1TXBvQWQveUdxWk1xdEZNcGlIRVppVUloR1M0SFN6?=
 =?utf-8?B?b1pxbjQ5MElqT2JKZ3cxdzAvNGJwWE9Cck9IWW5uQVNQMkpYYUV6S053RGdE?=
 =?utf-8?B?YW0rS2RtczRkKzF6QnNXYjQ3a1Bja0VkVVZZdkkvOUtYbCtCck1vV2RHRFRh?=
 =?utf-8?B?UzYrZWRXeGdwL29ZUVhsM3JqRzExK3JiNHJLY0tKRkh0ZlJyWFpQOVpFc1hh?=
 =?utf-8?B?TzNVUjN5dmFnL0s0MzZHQzBMVDh1bjZxQWVhNDlMUVNmckZqeEY4L1FIRC9C?=
 =?utf-8?B?eXFTdmtkTHNUL0hsQ3ZPV1FFenExRWJjZVI3RDkweDBHSEZ4djJ2UXJRYUU3?=
 =?utf-8?B?SGVsTmo2ZlZkSmJqUkF1Q0lscURnL1c0TEFPNDNJT1A3TzBmUHdyYWdSbklN?=
 =?utf-8?B?Y0hSVE43MlB2OURjd28wTDFNVGV6eEpjZTlrcGZEL1pGaUQwYnlqQytwcGJY?=
 =?utf-8?B?TERXOHZ3Rnd1c3NOQ2pjVGFxYllHNE02QnlTOEpJSXlub24yVFZPVm5CamFU?=
 =?utf-8?B?TGZwZ3hMVUN1YTI0MkV5NG55L05mV1IxNFJ1MXV4NlFxVEp0ejkyZHZZYXlC?=
 =?utf-8?B?aU1KempVbU4xaVFjNnNOREhJZ3psOVdWQWtjVCtVMVIzUEVjMm1SOURERk55?=
 =?utf-8?B?aWtVdWRTOFREMnM4TWZ5dzBVYmRHNFJPTDl4dUQzTll4cU1KZWpSQ2ptN0lo?=
 =?utf-8?B?VWUrZS9jR1NzdG4wam03Y2k1L0dUK3pWOEFWYVJNZG5HWVZLRWFUOSs0eEpD?=
 =?utf-8?B?ZHlRMzg1VlZXV3ZySzZEemhScy94cStpNUQ4QTRsU1ZxcWFHL0Npa3h6UHEr?=
 =?utf-8?B?YmlaeEtub3QvcThwMWovOVNBeDNEblM4VE8wL3VhcmpCY0hCSW5NWFRxbWNH?=
 =?utf-8?B?N1kxUUUwOEM2REZhblh2aVcyeEU3bkdFTHdQWjMvdCs5OTA1cmtvbnZaSjAw?=
 =?utf-8?B?b0tJL1MwVE51U1VLWjFBdFMxeEp5OER6Q1NVRU1HMzB1TGNmT2pLdTF5dWFO?=
 =?utf-8?B?dVJ0c1JVUWZMVUk1M09Xb012RytKVURqaHZKMzBoelR3d1FuamhMSlpVNThh?=
 =?utf-8?B?ZGtvREhLVEZjMElBdCs4T0dpT2haQ2s1RGR2MlFVNGJ6ZzJrbUdZRVlQVFBP?=
 =?utf-8?B?RWNLS0tPbDFBK2hhWXNRdnhMQkF1R2FlVWFSajF0ZzgvOGtzSS9vV2w2d1Np?=
 =?utf-8?B?WG9OQ293dEQveDAyOEN5SnV2U1JvSEhyUTBmbXFjUXA1OTB2Wk9pL2p1cnla?=
 =?utf-8?Q?YfsDwSME+H9uus90ltDojj43j2/zXyww7IK0tHv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae851cf-4833-4771-5494-08d97824ced0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:42:53.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5XTzTVN06EYkOe6fkPtYyNrQV4IwN1b+dW1vdktr7I7oWMGjDtLrpHkMgwDHDGtK3ZR3BHKbtbgMnVjiKw2IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5593
X-Proofpoint-ORIG-GUID: n_kqqPyOKe7YP2zl2IJFb-5f5VT2_FIZ
X-Proofpoint-GUID: XnDLWz-hCHl78QaoTu5AwXvLlustvFdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_01,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=874 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150055
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/15/2021 04:32 PM, Jupiter wrote:
>> How about adding 'ExecStart=/bin/true' here?
> It was my first try, but it did not work so I removed it.
>
> Thank you Qi.
>
> Kind regards,
>
> - jupiter
>
Adding 'Conflicts=shutdown.target' seems to work. I just did a quick test.

Regards,

Qi

