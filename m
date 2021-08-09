Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.17199.1628472339923919407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 18:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YanxqTQa;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3855be95b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1791JsBe013730
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Aug 2021 18:25:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=13cQMBd+ZQwrUOKaXJkynX+2Oh6I6sRXUSMzbQGgS+8=;
 b=YanxqTQak3HY6/6Pe+MwXG5i5KnaPLby3jJQ8ZmVU4g8EH98XIOSc1RqUYYqYM2gnZ5b
 /Vt5sqEfJY8CLJU50lWfkgYRiGSM61esbiWdoGqgeVnJOqxNS5ppWhj6q34+PFyyvmvr
 emzs6eHqSo1NulX/KkwCv9J33zrnJxy0ipjV7qhPo2NxVMcuanAtTi+9tHQTlzkPLM//
 PXx5aYti5AJQEfCw2VNSvTML+liAB43COGc7duEc1dkBdfHpTwlvE0SzNrUhzTlRqiay
 9bk0eTaX9HOFx9G37WzfB4xCbK6TWJfx1jp+ARxh/gd0eG8/fsb2QHdhBS16TeNOvwge Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aaj0j86kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Aug 2021 18:25:38 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1791PbLt024701
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Aug 2021 18:25:38 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aaj0j86kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Aug 2021 18:25:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DayuoW227w5lR9I6hpRjElv2AWwDjula+j/KLMglwUbuTO/stdJnTswh5/BHAdS5JL/5QkIJzheTT9KU6dBEfOFUZWDILseLRt5GpCwcJJF75P9+DBIE6LB4JsaIUfYMU5QF5ceYSbj4HQBYIhWcTv2LFYR6lAKO+tObdc/6r9Ut17gv3fOXYQYpFk/XtJgVToDQmgV1O0s2n+Tg+CHU6CwxdWB3S5gU6mBpSX2bzqav3V3HEHCPZaFtn2RkhAkGJsaUARzekD4Krm1uKcDxprCmkpqZ7Wqo6h9fWahMkJkwpJbeD1RZjpZ6VAQMct4zHvGrkmMQaRqWF03mGHGXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13cQMBd+ZQwrUOKaXJkynX+2Oh6I6sRXUSMzbQGgS+8=;
 b=ghVVIdtAnpUuEa45kfa5duI6fl8Ta/4iOLDAp5mx9gpdG3mrmHBLpq42Yc7YJXzgVOEqxgSWql8O7Q/zFxWiA1XqDECwYHJJgOMhKoP+2LlEzAAcNfDObvHgEhsd/EeeGzY77CUVDONl7h4+ucxF4PsPSa38gqsTjbHHgDbxMcgR1C3Od8B9HfP6fQizihHpD3U97kwcDY/4u2KuZeySaoTnZ5ceNTdu1EKSaOH87lcIn4/feMlk7hUd6lR3/6CnHU08wQIHHci2pRp+Z56s27hf31U7C+EM4vQ2LIJyHo4lVBAhivCxA1JnFugh8dW1HKS2BirVbnkP2gvGwYLDQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5617.namprd11.prod.outlook.com (2603:10b6:5:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Mon, 9 Aug
 2021 01:25:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a074:6be8:3148:f63b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a074:6be8:3148:f63b%3]) with mapi id 15.20.4394.022; Mon, 9 Aug 2021
 01:25:35 +0000
Subject: Re: [OE-core][PATCH 2/2] convert-overrides.py: skip patches
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20210806090332.14065-1-Qi.Chen@windriver.com>
 <20210806090332.14065-2-Qi.Chen@windriver.com>
 <f4d786556497e05c18b6fc147c3a63f2d40f2197.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <f1359751-a0b0-e9cc-3176-f0ace3fbae78@windriver.com>
Date: Mon, 9 Aug 2021 09:36:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <f4d786556497e05c18b6fc147c3a63f2d40f2197.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR0401CA0024.apcprd04.prod.outlook.com
 (2603:1096:202:2::34) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR0401CA0024.apcprd04.prod.outlook.com (2603:1096:202:2::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 01:25:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ad53a75-4f31-4f69-f030-08d95ad4968a
X-MS-TrafficTypeDiagnostic: CO6PR11MB5617:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56179ED8242C47E9E6F7D6EBEDF69@CO6PR11MB5617.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	csvTKs/tKtgg2eCTsN2RrJ6aJKoYm/P9KWRJAeDp/aJ5pzT2TococSwiwu3Dz5zDfu5xkpQeQTssDkH7ZRXVOsXc4kTTyldAPXyQ+QWEpJeChT89NG4MZq1224lc/m3hnrDeMw4k6QH35hynxbd2iT2xPPb3IWab13/x7gpNXtF95B+56I9/Blv0qP54pSmMxxpdnred+jx/Kp04+dpLbu7zoPw4UuoVMr4cWKBZYQjPSa0pBs2PWapi53oGXYFklGlcSxRHhW6/eYTbRvIH1sswCRpIYdA+AIfbCVXjVkegpVG9yDNQNr/y3Ao2njLdI76LxzYJfmpjnQZxHF/72Xrspdmk0lUrqjK1s42QBMvvbrZgDUqeTKymaRbgnxXNVC9LvCAHjIf0IUQVCK0Dwb1YMRwnTEWCJDdmcaVq5xFv/MFfL0xoU9a5H6KwMMZ5zGFMu5NLmnmLlQzMx+BzKBGAdWaSRHPriGdlazLAb5jFuisbxTiF1kdb4NIRZb7fgmEnodWrfH6jt4AxKTUZU9Q4ZH9syC97VCZv04147zHghZt6pzMSf4v8o/r1u0jPPJJ9fTA9WtzMbi6+qnbFSLNVd0Gs9S/f+Jf8RdEG8TFVxcFe2dvp8IvAOzq4xzvmtLu3Qs+LOl24ogmy4JK34r5sG7a/KNAXng5yzY0Vi0oZ6caJ1AfoOIalNHmmU8PZbgnuq2RAkpAKf81OV6u4uOSbkR9ZUzBT8gOEV1GwJnO7/XTbYORnwjTTiG2SXMd5tqR2iV08jhmuuis4yulVQ7d3JGa251Mw4JiLDNxIIFc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(376002)(396003)(346002)(366004)(136003)(16576012)(2906002)(316002)(36756003)(6666004)(66946007)(478600001)(66556008)(6706004)(6486002)(66476007)(31686004)(8936002)(956004)(8676002)(26005)(38350700002)(52116002)(38100700002)(186003)(2616005)(86362001)(5660300002)(31696002)(53546011)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjN6cU1IZ3ZSd2ZUOEdvS05XZlZZbldYVVBwMi9BRUJkaHA4a2t0Y2hPT3Rx?=
 =?utf-8?B?K3BCNFNGWk9QOC9RMGFHd0pYaEN6aTdQNzVhS29BamgzR2k1bSs3RjFhN256?=
 =?utf-8?B?YUJRdUlJV1Z6SDhHK0FVSThQSnVNdktGS1BaZ1NZdXZGQ2pGN1lJdDZXcEQ3?=
 =?utf-8?B?a0EvdXlMSU94ZkdYbXJNWiszdC9mbVBnZHBmUEJFeVc2NnBkVWlCUXJzQ3hU?=
 =?utf-8?B?VytFdGVaTExrckJGaEIxOTNZQ1Ayb2xkUUtVMnJ6eGNxellmV0UrWkF5MTZK?=
 =?utf-8?B?c2s2a3hHU28yWmNGYi94dzBZQmJjYU5XelRONzVxMnRJd1FBUXNITVRtSTlv?=
 =?utf-8?B?ZEZWajdNb25TeUtUM0dPdEQveFFlSlRJTk5xZjZ5djBRT2pRc0oyYzJIZmRJ?=
 =?utf-8?B?VzcxU3BIL2JJUkVsVEVNN0NRTjVYRUw4V1UyemVMWC9ESEt1OWYxSWlmZ3lT?=
 =?utf-8?B?dTFRVWxXbXZsY3lraFRHRTJpalo2UnEyTk5mUENPemdKZTZKamNQbi8rR3kv?=
 =?utf-8?B?Q293WkVycUgwZklISGVUajRqTlorQUlNSERxQ1pBZ05yRWZKcDZwWUd4eExF?=
 =?utf-8?B?YTJyemkxZ0JMdlc5TzZFWFNoYklPanhqUXdCbjFuT2dtMlVVaHNTbGJhVjkv?=
 =?utf-8?B?ek82T3ZpWFU4dmhzanRTR2d3ZHhHOHVKOC93MXRBOFRLRGF2Q09PZVJ5Z29Y?=
 =?utf-8?B?NlBoY0RKMmdyVStieXVUbSs2ZEFDSGppMjVhZ0I1emZHUW1GelRhcnFyNnlT?=
 =?utf-8?B?bUFLSmNWbHFQeVVONTBVeTJQUzVvU3JOaWtiTXFWdDJHWHZtYU1GcTdja3Zx?=
 =?utf-8?B?S0JiK3lJRG9OaUZ6VXgrK1VGUEIwRFFBejduc2szd21XRDZFQ3NMY2NZN0JQ?=
 =?utf-8?B?Q1BFa2FmYndHOHVBdnNFM0tzZ3pZRVpTbmZndWdJN21TNG9MaVcyNFFqTWE1?=
 =?utf-8?B?MDZWcEdmVU9ZZkRzWnk0aFVRVlZJMWFYWEdrbnRxK2xVY01jbzFQb2RmNlBY?=
 =?utf-8?B?OXVMK3gxZytCL01nVitMMkZEdzErSndSa0VQSEN5TFVTTWZXRHR3Q2tPV3My?=
 =?utf-8?B?SG43MXpxTTFwY2JLYmxQYmpYQ09uRUpyT2I2cXFGZnlDL2RNL1hrbEljRzZx?=
 =?utf-8?B?cjJnNHpKSm9FWDVnelVqajNQbzVNODcvVmZ0WHp5aE9GelZkSW9UT3lnWllp?=
 =?utf-8?B?SHlhV2Zlb3VvSXROcUhMNCsxRk0zNVBTRHBYWlRMNUdaZVFrbHEzeW5FSGFO?=
 =?utf-8?B?STFFbkEyQm1PeFVFTFlYR0gwZ3VIOXRZQnBNWjFFZXhJMWZwaUlweHB3SGFa?=
 =?utf-8?B?dlJPTTRYcEdpMGp1QTBiMml0ZHM3cmJtb2xSRis5RXVHNE5ibWozNEJKUUNX?=
 =?utf-8?B?ZU11TXI1RDMzS1VRUTh2L0R0Q1F6ekpPc2ZoejR0b0wwVGhuY1VFNWxSaHd6?=
 =?utf-8?B?dEVlVkQvblJETlVuMGs5Rm1vMGZKeEJ6K3Vwb1ZmcFFPSVV4YlkzV3o1R0l5?=
 =?utf-8?B?K0l3MXVkVXZ2bVdvRGVkUUt0SVd6QzlOTHBGcXcrVm5iUVA4Uk5wb2VKcjZq?=
 =?utf-8?B?K1dVN2hKQnUvU21XTVhXK284YjRCRGlhZWNMT1RKUEhDdTh4SzNYcTM4TVFV?=
 =?utf-8?B?Y2JZeFBiNVNzNjB1T1BBdkVrL0Q0Z0VudWJub3NZMTVqcXIvOHVJTjl3ZVNN?=
 =?utf-8?B?cCtJTjFaZWxtSWZ3WVluQ3pFL0pRclJjQlZtTm1OaXlyOTN4SS8zaDhCL3po?=
 =?utf-8?Q?Uqy1k7BLWtidWZoy5/qilTBW53HwWiq7oXV1kGy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad53a75-4f31-4f69-f030-08d95ad4968a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 01:25:35.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxtGIiEupcmLCk47aJJVF4v/t48TkIA3W5LTEKinH8UWQyQoBOfhWCg4wVbclO3MqKBmweKFod2sRND6I1W+rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5617
X-Proofpoint-GUID: 3LqS1LQ8IYdsgLrgtzO96PLvYpgVnjVv
X-Proofpoint-ORIG-GUID: 5OQ9dY2rJjNM5SsmuLeoYhFnIbM0NfFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-08_08,2021-08-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 mlxlogscore=877 impostorscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090010
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2021 06:58 PM, Richard Purdie wrote:
> On Fri, 2021-08-06 at 02:03 -0700, Chen Qi wrote:
>> If a line specifies a patch, skip it.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   scripts/contrib/convert-overrides.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
>> index 4d41a4c475..387e29d66d 100755
>> --- a/scripts/contrib/convert-overrides.py
>> +++ b/scripts/contrib/convert-overrides.py
>> @@ -63,6 +63,7 @@ skips = skips + ["run_loaddata_poky", "determine_if_poky_env", "do_populate_poky
>>   skips = skips + ["get_appends_for_files", "test_doubleref_remove", "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove", "revmap_remove"]
>>   skips = skips + ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
>>   skips = skips + ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
>> +skips = skips + ["file://"]
> This is never simple since this would now skip:
>
> SRC_URI_append = " file://xxxx"

I didn't realize such case. Thanks for pointing it out.

Regards,
Qi

>
> I'm not sure which issue is better/worse...
>
> Cheers,
>
> Richard
>
>
>

