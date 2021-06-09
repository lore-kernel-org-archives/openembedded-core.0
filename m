Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.2973.1623207690020516754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 20:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SDZ9uogv;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1794eb9106=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1592SMMs029927
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jun 2021 03:01:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3929drgkec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 03:01:29 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15931S0t003631
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jun 2021 03:01:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3929drgkea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jun 2021 03:01:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/oK61/d+QIkA7dB75U3rR2zxt0HV28zNpMFVX/wx5IfEhzdKHPTRbhUkZRNEiQpKP2H5NDvN/yMXCv/aoW2fRFFdMr/y+PzKEjv0DlK3aUzLOPPnHktYiLPxNiuWd+nQxEFX3aIcSl86Wdp5IrB14l3MsaSwGNfP/GbU2923CjtUw7vX1PAL3EKv/SfWXkT0Da7O31V1i6x7lgFmvjCg3zsJ6+GRB0oWlokd6v2tlNfBoTD0OdNafsoRslO+PPwIs7Zn8HBpTZFXBprnv1sKTMZaIXMXnAK6sjuzN+QKMKORPn6YvmdKyLFYkp7EII+7XzbggxZo4CEFHFRskLdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdefrKQA3rFHeaQsSfg4EQv2lNfGz7gPpkV/UtwoN94=;
 b=TP2tJtT0pwcEVJS4GkLW7umd9rPkW71TpG2uzzIyjIjxqY8Egm8Uuq6SV2SlDujFVBLfrQ3EUFJPxHFVMhtNFa8/mfppZcwPbybnWJN+TM0A6vytpd5L+4LcjXrpQb9NwfyiYBNGfc/je1ywnj2Q9055IODTRodM2dt0M8Td2bPTH2MXBVhgHukTNDI7BwDL79fxy4eC5+lOKdRkvceq4lC5vZRcZYqYmPJBUHMEGN58EvCuXuJLZD5kG1Ozx2l9NUJXuclTP6QLednRqRZ3wgoi60T/IuF0lysNSeM6aGXc/1rv1OaBHaBA1wRpSUWu+Mw9YW6ol8GnGrugmT9BSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdefrKQA3rFHeaQsSfg4EQv2lNfGz7gPpkV/UtwoN94=;
 b=SDZ9uogvlk8CyDZYTXapY4fKRg4AymtkT7hC5ud7MxmCHSohWuLFtcrbq9u/n0PWV74HmoplGMqpO2QXCYbXhClTPPF7qkZCnuqMQFOTxgOiEald7Gt6yLzWTq7pjYGtm83+ilxEHu7V+YVEh/MI8QmIiTjWNBMKsc3hu2gwf2k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 9 Jun
 2021 03:01:26 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::9d9a:d36a:4f67:486b]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::9d9a:d36a:4f67:486b%3]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 03:01:26 +0000
Subject: Re: [OE-core] [PATCH] libjpeg-turbo: fix do_compile error on armv5
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210609023506.8344-1-changqing.li@windriver.com>
 <CAMKF1sqNZpRLGsR3g7GWTVyfsLKQ+mm2RSda9ukq_GJ_xoTkZQ@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <72499747-5947-543e-a1b0-8fddf1bf0607@windriver.com>
Date: Wed, 9 Jun 2021 11:01:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1sqNZpRLGsR3g7GWTVyfsLKQ+mm2RSda9ukq_GJ_xoTkZQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by SJ0PR13CA0064.namprd13.prod.outlook.com (2603:10b6:a03:2c4::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.12 via Frontend Transport; Wed, 9 Jun 2021 03:01:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b47cf84e-23bb-4ec9-d503-08d92af2def5
X-MS-TrafficTypeDiagnostic: SA2PR11MB4970:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB4970FDB2CB0AA2C0EC33438B82369@SA2PR11MB4970.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yc/Grsq533r6A06NVTzb0aC1C4Whm2Gt25FP8hSTc3qXc/GZZYZuEQDQt2xLAC29inZQlY24Gn5dXiHvSJPGHT+kITLHV+DhG6zJm1PkfAF/zVFRIUZtyYTIPaw+CQxn6u+mIOoKmDDq/CIl/+3yKwKRzRs+S64nEt1bmBFx+o3Oc4rCI8ntBOfiffWxWbn3qNMvQPBkEEvp+o41O6gxMwqgnJzeNMzchQgMr4z7GlnCf5DeH5GOvwr2IMZ+YuPV//63+fHecv/z+8cjRjCQZMrbp+q+ogZJ/IK/za4jHCFEapMUBasw6F9aQQU1hn7guqpti2KDCTq7G67zwW5GITCfuUQQ9GflgPtw5PHXqFb66yHTNHxAAE4ldJvLmdCb7pfkOzA5uJh4pK6A8NLI6LGQWnlxigxnlKX10S/DxB4EC8HTQm0M9hJAmHkBc/5MgQprMfIODUF7d99paf4RSdwYEkFG89MnuGQIPKiWAaAFKii2YYpaJWZT6OymfrG4THB647oJPOeku8vtwDUiQ8rEuMMaXWudV+CLr3T/kl5lOJzzTbK3mjmZm25SAgwGFwMVdSbodFXOYg+6lgIOM7MawBK2YM1FwsEMBiNvnkFfcRzds33yh8dE1xP9Egzd8RKQQy892KDZrsUFxCa27U2C2dcXkOBMlq3gUu2rbipFyles+Ts9Nd7iUmgHwnQBv/k9lWqf84WcoZEM3mr8RE8mBgP/+rtL2A9X7CeHzfawpSjl/SDBTq7MmO6xTPg5N73hOuLutmSHhXFeAQ5ReRMzsToCv9nXjg9unlXAOG3FjwQIkcoFz5shf1R3Ganli034pKtwhWJbsdNp/vulrJdDcNrokINR3HBeaZEKe/spyUrymtm6PzaQlp/SjcyBiY1FGDdejgh294h3GVJHNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(366004)(376002)(136003)(8936002)(8676002)(66476007)(52116002)(5660300002)(31686004)(16576012)(478600001)(66946007)(2906002)(53546011)(6666004)(86362001)(6916009)(31696002)(83380400001)(6706004)(6486002)(38350700002)(36756003)(956004)(44832011)(966005)(26005)(2616005)(4326008)(16526019)(38100700002)(66556008)(316002)(186003)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVVJS0NjSk5LSEorSGtOWDQxdGY5dllHeTRzWUNqQW9QVnNLaWNBNTlLaHM1?=
 =?utf-8?B?azY3WURxbDM4UmF5YnRJaFBVaVZoL3NOWlJwY2drUG5MR01Yb25Tb2VCTkFt?=
 =?utf-8?B?MGJ1VWYrL2I2clVFRU1EUXVkWmRFVHlPS3dHa2VrTzBlNlZnbWZUTDgyRlpV?=
 =?utf-8?B?OXpobXFBN3NxVXBOUzJhMWRia01NWkRpbDR6bUdTVWhKMGp0blhtM3NrcHlF?=
 =?utf-8?B?L0JYcUZqMk5HVWZqTUtzNWo5ZHdQdWpZMnBWRzdVWnBYcUJDem9sejdqblN3?=
 =?utf-8?B?emRNem5VZys3djZlU0JaSEdxVmRRYU5ZbjA0c2pZakhTeE9DZ0dhdVNzRW9I?=
 =?utf-8?B?VjQ3ZEtXUW9qNXNGdnVGVHdpTVU3bXUvUzZHd2IraTZONTYwM1plbTVraDRn?=
 =?utf-8?B?V01saEZUMnhWdmM2MUtmUUVtNFE4UmhUa1V0Lys5QllpQTJEcEtWY0l1MEFN?=
 =?utf-8?B?QnhjUlZXUGpYZTBOY1RwNjBEZ0VvM3ZXS0VkQXZ4WmtrVkI0RjV2RU8xbkhp?=
 =?utf-8?B?Y1oxVlJMVGZWdzdLeUdNYStTRXFxM2xqbTQzVThHSTNhVDJGd0pLbExFbHBG?=
 =?utf-8?B?cnY0eEdTZ2prd0MrcTVpZjJoYnF6NnNnell4RFNkbEdRNWtmWjhvMHU0ajRX?=
 =?utf-8?B?a3IwL1ZsZE1ZcWNseWFMM1p5Y1NEQS90QXkxZXZiNFkvK1ZTQ2ppbitiKzRP?=
 =?utf-8?B?UWxkTms2NVZMZ2NQZ3ZxNzE2ZjdmNyt0MEtEZWVqMmlHdld5aTQyczBsaTZF?=
 =?utf-8?B?a2U1KzVrSjZZREsyM0N3Zmt1cmM0QTF2bWQzdVRGNzBaMks0c0VZMzlPZmVT?=
 =?utf-8?B?UGJJeERVdGI0MlZNUUVvRXZqZElyMWwwM1QzVlQrazJCcExjMWpOcHNNNlFC?=
 =?utf-8?B?bjUvdE0zdVZ5VklTRzlYZGliMU5rY3pFbWllZGcyT3JLMmJvbndHNlFETEtR?=
 =?utf-8?B?dmJ6aE0vVlNWVXNrV1BpV2VOL0Z4NGRTRXBzSmZTbHVjZzhwZTk0Q2R5ck82?=
 =?utf-8?B?MG12RzBybVlRS3RESkxwN3ZpTnVQelpiSk8wN0MwcXo4VGtJWUUrbjhUeFBa?=
 =?utf-8?B?UEdGRk1zbEdWYUo3SnNGbTFKa0FicGF0cHl3REc3QkM0VHloVnEyRjdZQXhR?=
 =?utf-8?B?SDBGMExhV2VaeGVyZW1GejczcHF2RFNjYzRLMFBVTVRXZU5MUmdZOFpZeWdq?=
 =?utf-8?B?bGpnVC9QRU5yNVpnWnAycjZWNDRYQnJIMGwxdGNEVVBxUmQ3TnJtdmlyVUZY?=
 =?utf-8?B?ajJrTWdDK3phY01DMUNmbFNxb20zZ0F0QklMMStETjd6Z0NUTFpwYzl3MDZj?=
 =?utf-8?B?a3VoSHhXcHhMOFlORng4c0o0Vk85UGNKaGswWHM5bkpVTVVibEoyZGZUNk9q?=
 =?utf-8?B?bDBzSitoU3o4RnhLUTI0RElXRDNWLzgvbkxmRE8vYlk1RlBKQ3dOM0dlZ0JF?=
 =?utf-8?B?eGtIKzVQOUtZSDFjTTZidnNidHFBbTR2aitIWG1ubXFPVkRiYjl4MDB5NDhl?=
 =?utf-8?B?NDJ1VlBkWnQ1QXB4ajE3aysrcGtZMFcyUitwanZ0WXg3N2JJSm0zTTM4ZU5Y?=
 =?utf-8?B?bTI1dEkvM3U2a1VoYWVQMWw1SzdvbWhjSGMwMXRMTUFYck5MZEZGTHZGNTds?=
 =?utf-8?B?TWV3NUQwcVlQY3c1TjJPVTNBaDVwbEhtQk8xM2Q1cUNZY3dMOE9JQ1UrOUhW?=
 =?utf-8?B?SnV6c3J2VDQxdG1nQTNCZWdSYllEbmxac3ZNK0JxalpGN1ZOSXhUZU96NHk2?=
 =?utf-8?Q?c1mmYLPpYFU801w3xqy2T9K0r/7bznmH3RLDFSp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47cf84e-23bb-4ec9-d503-08d92af2def5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 03:01:26.2409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9j9Xt8A468yGQjNW6rqtQ9ROrvUwvGH37OLVo5e2vgwZ1FqZ5vOh9/aFxMuknh+iYmudLwMnniz9ymqRbNFMqzso9N5nNsJcShcCv32dSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
X-Proofpoint-ORIG-GUID: MvsC_pHg45noI2niLG3cJxJhWK2vm8P7
X-Proofpoint-GUID: T3Lwk-ZOoTjgyjjEhe7EdBfpc6EBFzNn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-09_01:2021-06-04,2021-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106090001
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/9/21 10:49 AM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Tue, Jun 8, 2021 at 7:37 PM Changqing Li <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix below error:
>> /include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>> 31 | #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>>
>> Neon is not supported by armv5, disable the simd extension build.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
>> index 7f91cc02ac..9b1798b232 100644
>> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
>> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
>> @@ -40,6 +40,8 @@ EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx3
>>   # Work around missing non-floating point ABI support in MIPS
>>   EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "-DWITH_SIMD=False", "", d)}"
>>
>> +EXTRA_OECMAKE_append_class-target_armv5 = " -DWITH_SIMD=False"
> I think it should check for neon in machine features if its not
> available then disable it on arm.
Thanks. I will send a V2.
>
>> +
>>   # Provide a workaround if Altivec unit is not present in PPC
>>   EXTRA_OECMAKE_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
>>   EXTRA_OECMAKE_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
>> --
>> 2.17.1
>>
>>
>> 
>>
