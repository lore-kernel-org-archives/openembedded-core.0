Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1211.1630455743656827041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 17:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=I1PlczGM;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=487862893c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 181078dl030666
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Sep 2021 00:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ANzdcEw6UReUUBOHT0lRBSGLy0vV8jeSfd7D8hAOIog=;
 b=I1PlczGMAVk+htyWNsjNBZ74JD94TAZ+h8ybMJsTOajsoVETHQrdrn/6E94zi3eT+Btn
 SFIzOFRzUjORiI3ZiBheqW3MretA5lYsKzbKuZKlM7cxHqag6ZPGE4P/8qyeWkHt8Uvo
 83PC6+yCdIE23aGK1TxG3nORe0LGOn/U9e1KxywuZXCJZXu2IliRaETyN33YsxMX6tDP
 FoFCjI5byjcFJgkJg/+uxiR3guJ/AGHz3kDTdTFSpzXCMHEvHIw7b0eyNJsNeTJhxsmx
 wjUb2eEEowU2aSjd80NFcWfAg3qeDmSs+WKbJVQc/F1MCNF8TFKqzyMavBJQLC9rjrfV qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3asxe200h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 00:22:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1810MM1R026995
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Sep 2021 00:22:22 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3asxe200h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Sep 2021 00:22:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIG7O1SPK+n/EVxAzVDDTcvFYN3ICpE00whqm83Kf4WY88E94Iv27N/rYBFYCmgkKCYCEIu8nbHm58b2PygnQ21v8Uy3G0WSL1aSVLI6PJyeAlvwyLXqEkL3SF/DQd9fiWOQamYGbw5qDuaSsIN+tzQnt7XJHJQWXwaAVpaldEn40g416nCShuHfrMgniiQYuoYSbafZ5uI0YEMhO1UmaDXRMHMU+nov4oClzpSdkK22eHVYfXfX3AtuTkKaHO5JVzVjHHMwgfa6P1d9v86Rph14SOGsDMd+ej0eZJ6vzx7ovo6sPKU9AM6N2e0KjtySO/mCTTKoV4fOZYBZWjtu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ANzdcEw6UReUUBOHT0lRBSGLy0vV8jeSfd7D8hAOIog=;
 b=nLaIeBL7f59ZLcr5r5zkdeUl90O+t9YVOvjRaT7yEminU1v1c6QM9Ypy84DTKwUe1Sl2bUf2L5WK+3vPN9X8lhZu32bsZBo6ZKukbYi3Z3VEuvZD0+Oh4SygZAQ7jmCMecraFtLejs63+DDw+TfPJhcbsLiGTWRNhJM/3/i1u3UBk+MZL5Eyii0FvzKaYI0sA1lFAMBR6WtOKTco9gUNAXVp5IKUfhpI6oJI6+0FC+RMbGyyHegF5zj6KfMzm65Ce1ew0n8H0xtZ2IUAjPAItpFZqcJcxan+2GKuaauFWrfoWSr5IpslSggYL46rmrXILgHqPxe/tOUskaYd1wEgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 00:22:20 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d1c0:bab8:4a6a:edf8]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d1c0:bab8:4a6a:edf8%3]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 00:22:20 +0000
Subject: Re: [PATCH V3] glibc: fix create thread failed in old unprivileged docker
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, raj.khem@gmail.com
References: <169FF34664D4ACC1.22970@lists.openembedded.org>
 <20210830022054.70867-1-hongxu.jia@windriver.com>
 <95637a535b2c81de95c57e87de554386d265a066.camel@linuxfoundation.org>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <bf090252-53c5-be26-0aab-8d890d615809@windriver.com>
Date: Wed, 1 Sep 2021 08:22:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <95637a535b2c81de95c57e87de554386d265a066.camel@linuxfoundation.org>
X-ClientProxiedBy: HKAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:203:d0::17) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
Received: from [128.224.162.148] (60.247.85.82) by HKAPR04CA0007.apcprd04.prod.outlook.com (2603:1096:203:d0::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 00:22:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 543722e9-f343-47da-fea8-08d96cde8f7c
X-MS-TrafficTypeDiagnostic: CO1PR11MB4882:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4882B9F712B52CBA5DAC190794CD9@CO1PR11MB4882.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kM/iRAqNcuCHamW+er9BFOtycqCEvHJ8LeVcLOT/pGA0I6leq1vBxi2vhWYxGGo7S6ScgcdLJh5KdJzYlkgNV+Dw02RA27IiUN+E5hMOK2JXP7tpOcohLd1qKyIEIgKkqzm3XUJ55h9aYWlKMOQy8QIptcJWaaX4gcil1wabdTfb+ysIEqtDrK8U8zvZIYUDtNgAuwcAK39SVBf7+qcpPVHV8Idoa7R7ASRSDGbtq6ZPdU8VX60ZzUDKUoylpH4+UBB1mNooagA9CAoy6R3Dx08a+J/Hg2CFhBEYSKwgi5e6yOA1YwIvmIdNHxfC91qY26HHLbhxcE44wrTCBos1N7xrRwiV9btcatn78b+s37u1ZfBpXecMOcMFi2vKOLEiZ2RS0vheGs15/rmBTdQZMsQq6KaAlPzDf/VaYBT0c1mOO4bE5enYAAaoLGaK6sZMNBQDTCeEaICboDqXG+lHuwcwio1FnhX+ilKvBMMV/CLEY9YAQdmiLJ+Q6Pl0fAIvSZ2cM7L+BQfqhltuTkWDJ8KX7YAjNr7JlvBVjgzLlNuraMq0btoeCGxKj/HijtP0HO8RORyjMQUF7023gT4p+NTI8HQ2rwq+QlmJxAlYO9mjXcmFk19pbC87SivOKb6EXhQNHryOhd6nfkY4Zz3bpxAYqFoyxOpvK2LivvhXyRUgeeMf10vOU9NtvIiRWqYF79tYr4yDpC7An700iojuVJVov556ZKkYnZqdsh6Hw2AGYdwqWJmttUDxszVMKnlolZx2LydJMfVnsmsIucTOHmBMzM9vwoYrgTnrolXdyp98d0nxQX7hCLM7vCQPd1wh6zcw1TGSuR7AqUCB3bQTSEwKaNtz+QsGMOxlPwiL1aSPNwezPRSq2U1CflUf+rfEIRAeUJuwmW1HWisfj22DSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39850400004)(346002)(136003)(86362001)(31696002)(83380400001)(5660300002)(966005)(44832011)(6486002)(16576012)(8936002)(36756003)(2906002)(6666004)(52116002)(8676002)(38100700002)(38350700002)(31686004)(53546011)(66556008)(316002)(66476007)(66946007)(956004)(2616005)(6706004)(186003)(478600001)(26005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHF4eTJWNzY0WUZFVEdPKzFRcWdpMllVWVNhQ3VHck9MQURFZjhSZlNEMS9B?=
 =?utf-8?B?QnRqVWJPekh6OVl0T1FzN1M4QmJmSjhhQWJDOE5PdytlOG5uZ0p1OXE2a2ZZ?=
 =?utf-8?B?WDUyQ25pSzhkYlg4QjZlQTIwUjI0MUJHdlhGU3VlOGxSaTJzMVJIVkhmb1Jr?=
 =?utf-8?B?L1lEY0pyVVprbmJZMlZUaUYxL1JNeFlsNlgzMkJtMWF3WjdBUjVoVkJ4Z2VZ?=
 =?utf-8?B?K3B6dVpUbmhtTHhRRDJnTmxXczdrdHBkOUlOQ0p5UUZoRzQvaHdWZkI4K1lG?=
 =?utf-8?B?NU4xZ0tkc2x1dUlyN1FzL2RmMTB5a0lDOXQ0N2k1NVV4dWZESC9tUUNQY0xV?=
 =?utf-8?B?OFdHMXJ6Z3lzVGNzdWF1OVVHdDI0aFg0T05ScWs4WHJYK2phQmhSQ2pwNVRY?=
 =?utf-8?B?d2V4MERndHJockUxc1ZQR0FtbVZMNkJpcUxGcHRaTnoyYmEzYkM0cFhKemhy?=
 =?utf-8?B?MkJidThienJnZUErdlQ5VnNkVWdSYnlYWXYwQXNiL3BpVEFRaXNHMngzTWlP?=
 =?utf-8?B?ZWZtd3dxUWE5MXlKYTRBR3c5ZnByalpSYXdsQUkvRWlPWEVuc25MN0s0UWZn?=
 =?utf-8?B?YTcyWVMwMUk5eWs0aG5oWUE5ODI3QTNmRDM3TzI5amE4VUJKMDd3cnZ6eUt5?=
 =?utf-8?B?UHpvUlp5NlFpSm03SHBNcWxwdkw2TVdraTd4NGhZREZJcFVDb29rTFAxSXE5?=
 =?utf-8?B?elB6MXNBU3ZNcElxUkM4a3EweG5vbTdvSXp6MFNQVXA4dUxCanMveElCdG9Y?=
 =?utf-8?B?YlpzMTRpa1M4dDZadWlpUzJ3eU04Skl5M2VTZit6UkJ0dmZ1bkFHNElvTTJP?=
 =?utf-8?B?VWdoTUwyRER5NUFMRlNXTzBmbFBtajVERm5oNjA2MS9EUVhlK24vZEZOTmhL?=
 =?utf-8?B?bU1FQ3IwZDdqdGI2YnhMWnd6eG9SQzUzU1ZmUlA3UDNwZFY3Ynk5RjNVeC82?=
 =?utf-8?B?TXk3b0Z0d2lpRkhjZytWNzBoK3VLZjZTMVRnVkhTSUNIUWhsY05yM1A0a2NC?=
 =?utf-8?B?Y0w3Y3NpWVZrZVNoQnozRUlBSlE1clJZd0l0NjlEV0VzSCtBOXFXQWh2RWM5?=
 =?utf-8?B?ZWdaZ2o0NUJpYnlpME1MeXZsVExPcThqa2t6V2dCZEVrTVNjQUUxL3NjV1Fv?=
 =?utf-8?B?YkdXU3JKcmNLZjEyYnNYUExqaE11d0lsejhKaUhKcExEU1ZnWng2cndkWS9T?=
 =?utf-8?B?aU42ZllUV0hGcHA4YmMzQzEyWGlRUldUN2x0bXV0dFlqVDhnQk5MSWpkT0Y1?=
 =?utf-8?B?WU9LemFnQzVsMW5SSXRiU3RoYUVjRm8wc3N2c0RjSFZ3aHl4UXdDdFFzbmtS?=
 =?utf-8?B?YmJnY1JpQXE5VDdFN2VNSGY5Z0FwdFozck9ybjJhMmFJWGVJcmZrajhvWWgw?=
 =?utf-8?B?andLOXk2Y29ZYkV2QVg1by9aWFVwS3BCbU1LTHlOUERHYzRCcGV0Ympkd250?=
 =?utf-8?B?bzM4WlFoV0VWaGxWQ2hMQWhBNVNHMWt3VjRsSXVEUThDeEVOa1BwbTg3NHIx?=
 =?utf-8?B?R0Uva1d1UkpuQXJ5Mkk1bHVyWjB3ZmZIVnczQ0YxRThuNlMvcklPOEhDU3Mz?=
 =?utf-8?B?VnRneHBZOG5uK29Cd0Q1WnhvcWlYbUYyY1o3YlBuR3dDTW52UXcvbkd3a2ZC?=
 =?utf-8?B?VzNjRTlibDRpNDY0QlY5ZzYvaWNmVUhFeEZyN2Z6K1U0RlJ6WjdUUU41UU0x?=
 =?utf-8?B?b3Y1NGNJVUJpNXJsaFYrVWtYMmQwa2ZUVVZUbm9IM2RhZ1B0bWJWcnRGUno1?=
 =?utf-8?Q?32qB31rR2now3NCEm9BlyZ8aldr4uKFojEkFiaS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543722e9-f343-47da-fea8-08d96cde8f7c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 00:22:19.8196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwdsk9d/5jrebkwNsjxjVek/QOkN3fBe0ndhPT88AKG6muU89GxYgiGMy3y+XzJyYj3qBv86mHEfjrqAQWfPtt7pEBeSpPk5h1x9Fonpe5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
X-Proofpoint-ORIG-GUID: aa0r7p56PIhbtUlFlSqC_y93JjkBtwND
X-Proofpoint-GUID: 99yxapMpXIKiDNUOMNggLgRfSQ-oV3i4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_10,2021-08-31_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/1/21 4:11 AM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Sun, 2021-08-29 at 19:20 -0700, Hongxu Jia wrote:
>> # Changed in V3: add missing Upstream-Status tag
>>
>> Since upstream commit [d8ea0d0168 Add an internal wrapper for clone, clone2
>> and clone3] applied, start a unprivileged container (docker run without
>> --privileged), it creates a thread failed in container.
>>
>> In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
>> __clone3 returns -1 with ENOSYS, fall back to clone or clone2.
>>
>> The newest docker has fixed the issue in commit [1], but it was applied
>> only on master, to backward compatibility with old docker, discussed
>> with glibc maintainer [2], explicitly disable clone3 wrapper work by removing
>> macro definition of HAVE_CLONE3_WRAPPER
>>
>> [1] https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594
>> [2] https://sourceware.org/pipermail/libc-alpha/2021-August/130591.html
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Just for reference, I'm going with v1 of this fix.
>
> The reason is that I do want clone3 to work on target and I do want the wrapper
> to be available. Falling back in the EPERM case is therefore easiest.
>
> I did wonder about making the fix nativesdk specific however I decided that was
> going to complicate upgrades and so on a bit too much. The v1 fix is simple
> enough it can be used everywhere without too many side effects.

Absolutely agree

//Hongxu

> Cheers,
>
> Richard
>

