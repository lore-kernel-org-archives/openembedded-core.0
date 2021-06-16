Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6474.1623845523825792244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 05:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UaYlofoB;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=18018a3c74=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15GC8JLR024424
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 05:12:03 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3972b30htm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 05:12:02 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15GCC2bA031956
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 05:12:02 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by mx0a-0064b401.pphosted.com with ESMTP id 3972b30htj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jun 2021 05:12:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlArwQccfuBFkkhGuh36At4XLMTWtkspiTeqf0hDWUBT4lZjGAZWxNXlYdLSQmcjbgbWajzJkjWogUJJ/Qx58bf0KhK3fmrUNazykgJh2IfZIlsx93nnkNh2NaJljjV9dzVWqNxipsCWqpyTyyCVBBJudsOM5aeCAJiWtEZLPrViBJbj9dfY9kEtTpJ22AGjA4o8JZBlHM4FZ2UQgFhMjt8l9OXfi932rsvj5CpyLQTGEIYK/HFkt27ftO78R8hnfn5cMmYNVZYERBRvwTSYy49oOB7KcSXaR3kfO635/gL7y9lu9Wg4Q9CK2Q3v4jjtdCxf97YegQIQXHKUvWJrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10XeXF9C/mBM/VHzVnVpvbFSWHzjWdMpLmkHthLRVWM=;
 b=boVXsI8Cl9WgQWiY5Gznr/EwBFPV+09VAvcoXsePaaOvO6XtVts/3dgT2cLGeXjK82JM61SdKa9PshXHvt6cwvyQHAwBxO1RAve0Vzxz5obk2zX/t8uTn/5ZOY1bKpmDzGkMy1RCdpYU1UdNF2i8gURhRRVyNOTQMwQVEu2ANJVqhSd+YTlR2ahDy19vE+s3hm4EUD42rJUF8RVsEebsi/3qU8y5RCB6wzvckJzSRQ9C8nWCFlKsZcRjJpe7iitTG1Y6QddlRFqCt2eJO8KJ1rCuVxm4UjDA3miwYhwMFKkmtn5Ifs1PU0ijj8mYVW9arJs1LATOBb0Kf4Znm/eoTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10XeXF9C/mBM/VHzVnVpvbFSWHzjWdMpLmkHthLRVWM=;
 b=UaYlofoBze+rkRlTDUJRk/TD9RcXI5c1NVtqviIBUUfcTc3o3BMwb6Nkc3RqLZx3uWnNWuMYmY/lfJ0ZLkZyOfKGkPOgfAW5tQwBRvRYeObhiTi1hriNODwLZqR1Vt4edVP+57khiLbrvbtqkqKvXhOiP8dEE6My/VFTekQTbTI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 16 Jun
 2021 12:11:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 12:11:59 +0000
Subject: Re: [OE-core][hardknott][PATCH 1/2] curl: fix CVE-2021-22890
To: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>,
        openembedded-core@lists.openembedded.org
References: <20210601150928.1851569-1-trevor.gamblin@windriver.com>
 <d6b36eef-37fb-9901-20ae-909c9a4475f5@linux.microsoft.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <51b5e4c5-5650-3bc6-3001-7ca93253c526@windriver.com>
Date: Wed, 16 Jun 2021 08:11:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d6b36eef-37fb-9901-20ae-909c9a4475f5@linux.microsoft.com>
X-Originating-IP: [2607:fea8:c29d:d7c0::6e79]
X-ClientProxiedBy: YT1PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::6e79] (2607:fea8:c29d:d7c0::6e79) by YT1PR01CA0116.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend Transport; Wed, 16 Jun 2021 12:11:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3f46f3d-0203-4f93-4782-08d930bff0e6
X-MS-TrafficTypeDiagnostic: BY5PR11MB4184:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4184B66F3BA3DA38AF79B29F9F0F9@BY5PR11MB4184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sPLtg1pRJZ3/hmDWtIk7trJ2wqZf8H8x7EzZ5yjnK5Yp5a+3dcxehe1J33jGfZuL9r/BgmhFouXl5V21ziKXZ4zNkJ7gqzn2AYURABz8lVLQ1HI+WG3Og0VU+2fzL4GBNMR++fXuO79ON4DS+SYomRj8lnOSg2NdWP1nr4DWb+Aptti5Rw/Fia+EcqHYhdiNUYITXYHKLGnJK0jWX1nzRYFvHHESC//X93FOSlnqEQ5i0lGaqLg0v6rpGEDjbFrDc3M5K3yu1pD0pXdAiJneSEEqCf5qaSSbH15s0fncWzJ3bhXbJpCr7TkO2qpydBOARw1aVF8ec2xxsGUzhVX8Dbp3OURHsnqaU/oVU8u0KN8LF/VAUOUWMoBycJXxQ1XKB1qVKEMVq0vgfalslCgkGicbyaBiiWfqJF8GhJLQ8AS8F1BsNyqvnVVex30gauEFsykKJVhiNJNHj6hRvalY4vhc0pGXlZUuuDtPuD4YtQmrU9NRHgEVsZDXmbhOIufVj2x7WMR3/rVGv//LupcPLGPaK+OpjLvHxyDp+viV8d9Q1xKQSzZiIA3PPWmr3uE9x7ZUk8p1AwvOLpkUnaEz476iwcZdjYTGC7M6YIF6QURro1agJllrdbb2pLY+cV5AjXobWyzBMg9eEZJ5/Y7WJHXqT5XZ7Xe6qluggWkeywmVr+ODHXsLhmxZq6M1ZsMQsXc+6ctyQmNWjzq/coAat6ndBmhOQ4TUkHldbAuGfm2OVwR2Dy/2eEsroHUtYV44vl8FDkFhSg1SZWY/CIQ2wYheGMU7iHVR+q79j+o40UCi9+RnAELJZbh3k4LjgesRTs08bMHKXXFORmeM+yyaxA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(39850400004)(376002)(53546011)(33964004)(86362001)(2906002)(966005)(30864003)(31686004)(478600001)(5660300002)(316002)(6486002)(36756003)(83380400001)(166002)(66476007)(31696002)(186003)(8936002)(16526019)(44832011)(66556008)(66946007)(38100700002)(8676002)(2616005)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Tkw5VkhCRzJ1VFI2SWJaZGNHM01GbWNsZW5DYUgxdzRFTnU5elV6UHRzQzJL?=
 =?utf-8?B?VnZGS3ZEMEdNbXJUTkVodXU3QndSV0FFajdlU28rYnJjc3ArdmFMNzBNVDZC?=
 =?utf-8?B?RGdObkl3SU5hdjIvUUtlRTR3eml4T0xLQUVuN2E0b0tQUGxDMWNOTGRXeVdG?=
 =?utf-8?B?c3RCYlVoN1BGQ3ZFNEhUZHNXc1QreXgrVUlKRlpOc3FXT2owT3RPc0xNVkxX?=
 =?utf-8?B?RWtZaXk5NkR6eDBzMGN6Mi9ia0V5cG1Tb1lQcExzL280RHFwdFB4UXd2Vnlv?=
 =?utf-8?B?ZXBSUGdaeDNmM3hRUUIrV0xmRWJKeDBuRGJZRmYwbi85b2lRZ3phYTJ3UGpp?=
 =?utf-8?B?YmxweGJrMGhaRG5jQmhUM0o5TlYzQmJybzA1dlZUQjUyUGZXRUdlMzAvSTQr?=
 =?utf-8?B?UFJHRE1QWlNNRW1xUmZna0p2V2F0YzJMWW5aQWJDbXZPd2VCVFFCRXhwa3dE?=
 =?utf-8?B?NWVvQjBKSlZzenlaVU5YRDNQYVZEdFN5YmFhSkIzVENLS29LOXlnVWlDc3Jq?=
 =?utf-8?B?RmFibk9zY01obkgxbVFMYWlRNjdqL0ovYmNzeEJnb05UVHkrbHBZRTd2THZ2?=
 =?utf-8?B?TEJKOTVGalFxd1VTaUpOdXJyTThydWo1SHhvVm9ldGpobGxTbVgzYlR4RDRV?=
 =?utf-8?B?YWxTV2puYWRGTTFMdzBnK1hMTDhsSDBDdDBwSVhneHoyeXNjakZ0Zml3U2Vw?=
 =?utf-8?B?WHlFS1VUa3NWVHFjUjNGTXp1UzZ0Ulg1cWRYbXhwVmR2OWxVS0VPdVJ0bjVt?=
 =?utf-8?B?Q21RUzdOMlduSmJwRG81U3Q0WjZxZWZtM1ZqaVVNQU41NFV0TC9NYlRqL0JH?=
 =?utf-8?B?YnRGQTI2cUN6WFEvZ2pEVGJQQjB0VXNwR2R5clRIWHEzcmtCdVU1eXRDQXFJ?=
 =?utf-8?B?SEFuWWtpL2hzK2t5R3Z3Y1VvcDhoNXVLUnVWbVlLOTJrSzBPMWF0cnJVSXI1?=
 =?utf-8?B?UlNVVnNSbnRvR1JuUU9MdllMdlhqUmtZeUlEbHRWVlErYkhEY1hMVVRuNk1Z?=
 =?utf-8?B?ejV3OFR0cThNWmZGTzBxL21RYk5PdGh6MzkzTWJLRG5PajlDV0FOQkh4M2o4?=
 =?utf-8?B?dTF3cmoxQ3FwNml1NlM5WVBxRmh1ZjQwUVNPM3kwUkRuZnkzMkYxWjh3bXR1?=
 =?utf-8?B?OUxhOUFOOHRTY0VvNXZDNWNsOVBOVitaWEZ6OXE0bEV0bHIrMkdCRXBuc1No?=
 =?utf-8?B?RXBuM3pmTWUzYTVNYUtLcGs2dFQyTEF2UFRIS0RiZFpyRWhjUnZPVU1JVGpN?=
 =?utf-8?B?L2J1TnA2bUdDUzROdm9hMWN1VDJ3bmtHbkFHQlYrclFQdDFDYlU2YlBDbVg1?=
 =?utf-8?B?Zmx3cXVqTGdCVE96Q256RkdZV0JIVFlzUXN0VVVYanpxSUdmVHI5NFJYdzI3?=
 =?utf-8?B?d0cremR1eVBEUFNFQlhYUGI3L3ZQRlhRRjhCQkxaYmpGL2s0MXVHK1NEYTFa?=
 =?utf-8?B?MVE3UUxPbFYwbC9vbU9wSWJRUmdkZWVLOUptNjJQOHZQb3FMUEcvKzhqSnVz?=
 =?utf-8?B?ZEpQVUE1YjEvaDB0eFVwQTljZmZ3SGVLQUJqZkpGbzVMRk5XWURNTDNIcU10?=
 =?utf-8?B?emRMcGxwT0ZOcTlaOHhkKzMzNE9UeGV2cVVzb3lFT3RkclZLZkU0VjZqWEIw?=
 =?utf-8?B?aDBwNW9SYnVQVnllNEpFQnNsUnFNWWtrQU1wa3ViNU10eGNydHB4NExFOUlX?=
 =?utf-8?B?S0dhcHhFQWVzS3Y0REw0VTBPaGFHemVPbEg4OXJyR1l5OWx3Sy9zVXhCVDVz?=
 =?utf-8?B?bkZrckZicCtXUDhvWTVXVU5VL28xMEtTQ2JPejVwak5nZ3VlZFRLY3JaTXY1?=
 =?utf-8?B?ZUJmNXNoVGFucFJYZzNSZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f46f3d-0203-4f93-4782-08d930bff0e6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 12:11:59.4212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ek5fweI9WwRt4hHQrp1JFsGOd2RhHjRuJ1Ho1dPBLCuW7P1I61hb1SZ5vXbnNxN7fzyH6rJ82/HalXNFTJ4pSEPP1uLLLXL3/jtcwfq6ens=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
X-Proofpoint-GUID: GqR4VFaWdk45YSs2ka4ojD8En2il1rF_
X-Proofpoint-ORIG-GUID: 1Ra5SiZEbeT8yRQOt2dCH6bR2cTsMJQF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-16_07:2021-06-15,2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160070
Content-Type: multipart/alternative;
 boundary="------------6315045D7DAAE1B667980B46"
Content-Language: en-US

--------------6315045D7DAAE1B667980B46
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-06-15 6:12 p.m., Alejandro Enedino Hernandez Samaniego wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
> On 6/1/21 9:09 AM, Trevor Gamblin wrote:
>> Backport and modify the patch for CVE-2021-22890 from curl 7.76 to make
>> it apply cleanly on 7.75.
>>
>> CVE: CVE-2021-22890
>>
>> Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
>> ---
>>   ...-argument-to-Curl_ssl_get-addsession.patch | 517 ++++++++++++++++++
>>   meta/recipes-support/curl/curl_7.75.0.bb  <https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$>       |   1 +
>>   2 files changed, 518 insertions(+)
>>   create mode 100644 meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
>>
>> diff --git a/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
>> new file mode 100644
>> index 0000000000..a0c7d68f33
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
>> @@ -0,0 +1,517 @@
>> +From a2d3885223db9616283bfe33435fbe9b3140eac7 Mon Sep 17 00:00:00 2001
>> +From: Trevor Gamblin<trevor.gamblin@windriver.com>
>> +Date: Tue, 1 Jun 2021 09:50:20 -0400
>> +Subject: [PATCH 1/2] vtls: add 'isproxy' argument to
>> + Curl_ssl_get/addsessionid()
>> +
>> +To make sure we set and extract the correct session.
>> +
>> +Reported-by: Mingtao Yang
>> +Bug:https://curl.se/docs/CVE-2021-22890.html
>> +
>> +CVE-2021-22890
>> +
>> +Upstream-Status: Backport
>> +(https://github.com/curl/curl/commit/b09c8ee15771c614c4bf3ddac893cdb12187c844)
>> +
>> +Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
>> +---
>> + lib/vtls/bearssl.c   |  8 +++++--
>> + lib/vtls/gtls.c      | 12 ++++++----
>> + lib/vtls/mbedtls.c   | 12 ++++++----
>> + lib/vtls/mesalink.c  | 14 ++++++++----
>> + lib/vtls/openssl.c   | 54 +++++++++++++++++++++++++++++++++-----------
>> + lib/vtls/schannel.c  | 10 ++++----
>> + lib/vtls/sectransp.c | 10 ++++----
>> + lib/vtls/vtls.c      | 12 +++++++---
>> + lib/vtls/vtls.h      |  2 ++
>> + lib/vtls/wolfssl.c   | 28 +++++++++++++----------
>> + 10 files changed, 111 insertions(+), 51 deletions(-)
>> +
>> +diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
>> +index 29b08c0e6..0432dfadc 100644
>> +--- a/lib/vtls/bearssl.c
>> ++++ b/lib/vtls/bearssl.c
>> +@@ -375,7 +375,8 @@ static CURLcode bearssl_connect_step1(struct Curl_easy *data,
>> +     void *session;
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +-    if(!Curl_ssl_getsessionid(data, conn, &session, NULL, sockindex)) {
>> ++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
>> ++                              &session, NULL, sockindex)) {
>> +       br_ssl_engine_set_session_parameters(&backend->ctx.eng, session);
>> +       infof(data, "BearSSL: re-using session ID\n");
>> +     }
>> +@@ -571,10 +572,13 @@ static CURLcode bearssl_connect_step3(struct Curl_easy *data,
>> +     br_ssl_engine_get_session_parameters(&backend->ctx.eng, session);
>> +     Curl_ssl_sessionid_lock(data);
>> +     incache = !(Curl_ssl_getsessionid(data, conn,
>> ++                                      SSL_IS_PROXY() ? TRUE : FALSE,
>> +                                       &oldsession, NULL, sockindex));
>> +     if(incache)
>> +       Curl_ssl_delsessionid(data, oldsession);
>> +-    ret = Curl_ssl_addsessionid(data, conn, session, 0, sockindex);
>> ++    ret = Curl_ssl_addsessionid(data, conn,
>> ++                                SSL_IS_PROXY() ? TRUE : FALSE,
>> ++                                session, 0, sockindex);
>> +     Curl_ssl_sessionid_unlock(data);
>> +     if(ret) {
>> +       free(session);
>> +diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
>> +index 3ddee1974..28ca528a6 100644
>> +--- a/lib/vtls/gtls.c
>> ++++ b/lib/vtls/gtls.c
>> +@@ -733,6 +733,7 @@ gtls_connect_step1(struct Curl_easy *data,
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +     if(!Curl_ssl_getsessionid(data, conn,
>> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
>> +                               &ssl_sessionid, &ssl_idsize, sockindex)) {
>> +       /* we got a session id, use it! */
>> +       gnutls_session_set_data(session, ssl_sessionid, ssl_idsize);
>> +@@ -1292,8 +1293,9 @@ gtls_connect_step3(struct Curl_easy *data,
>> +       gnutls_session_get_data(session, connect_sessionid, &connect_idsize);
>> +
>> +       Curl_ssl_sessionid_lock(data);
>> +-      incache = !(Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL,
>> +-                                        sockindex));
>> ++      incache = !(Curl_ssl_getsessionid(data, conn,
>> ++                                        SSL_IS_PROXY() ? TRUE : FALSE,
>> ++                                        &ssl_sessionid, NULL, sockindex));
>> +       if(incache) {
>> +         /* there was one before in the cache, so instead of risking that the
>> +            previous one was rejected, we just kill that and store the new */
>> +@@ -1301,8 +1303,10 @@ gtls_connect_step3(struct Curl_easy *data,
>> +       }
>> +
>> +       /* store this session id */
>> +-      result = Curl_ssl_addsessionid(data, conn, connect_sessionid,
>> +-                                     connect_idsize, sockindex);
>> ++      result = Curl_ssl_addsessionid(data, conn,
>> ++                                     SSL_IS_PROXY() ? TRUE : FALSE,
>> ++                                     connect_sessionid, connect_idsize,
>> ++                                     sockindex);
>> +       Curl_ssl_sessionid_unlock(data);
>> +       if(result) {
>> +         free(connect_sessionid);
>> +diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
>> +index fc3a948d1..bd0e0802e 100644
>> +--- a/lib/vtls/mbedtls.c
>> ++++ b/lib/vtls/mbedtls.c
>> +@@ -463,7 +463,9 @@ mbed_connect_step1(struct Curl_easy *data, struct connectdata *conn,
>> +     void *old_session = NULL;
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +-    if(!Curl_ssl_getsessionid(data, conn, &old_session, NULL, sockindex)) {
>> ++    if(!Curl_ssl_getsessionid(data, conn,
>> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
>> ++                              &old_session, NULL, sockindex)) {
>> +       ret = mbedtls_ssl_set_session(&backend->ssl, old_session);
>> +       if(ret) {
>> +         Curl_ssl_sessionid_unlock(data);
>> +@@ -724,6 +726,7 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
>> +     int ret;
>> +     mbedtls_ssl_session *our_ssl_sessionid;
>> +     void *old_ssl_sessionid = NULL;
>> ++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
>> +
>> +     our_ssl_sessionid = malloc(sizeof(mbedtls_ssl_session));
>> +     if(!our_ssl_sessionid)
>> +@@ -742,11 +745,12 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
>> +
>> +     /* If there's already a matching session in the cache, delete it */
>> +     Curl_ssl_sessionid_lock(data);
>> +-    if(!Curl_ssl_getsessionid(data, conn, &old_ssl_sessionid, NULL, sockindex))
>> ++    if(!Curl_ssl_getsessionid(data, conn, isproxy, &old_ssl_sessionid, NULL,
>> ++                              sockindex))
>> +       Curl_ssl_delsessionid(data, old_ssl_sessionid);
>> +
>> +-    retcode = Curl_ssl_addsessionid(data, conn,
>> +-                                    our_ssl_sessionid, 0, sockindex);
>> ++    retcode = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
>> ++                                    0, sockindex);
>> +     Curl_ssl_sessionid_unlock(data);
>> +     if(retcode) {
>> +       mbedtls_ssl_session_free(our_ssl_sessionid);
>> +diff --git a/lib/vtls/mesalink.c b/lib/vtls/mesalink.c
>> +index b6d1005ec..ad807d3ba 100644
>> +--- a/lib/vtls/mesalink.c
>> ++++ b/lib/vtls/mesalink.c
>> +@@ -261,7 +261,9 @@ mesalink_connect_step1(struct Curl_easy *data,
>> +     void *ssl_sessionid = NULL;
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +-    if(!Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL, sockindex)) {
>> ++    if(!Curl_ssl_getsessionid(data, conn,
>> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
>> ++                              &ssl_sessionid, NULL, sockindex)) {
>> +       /* we got a session id, use it! */
>> +       if(!SSL_set_session(BACKEND->handle, ssl_sessionid)) {
>> +         Curl_ssl_sessionid_unlock(data);
>> +@@ -345,13 +347,14 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
>> +     bool incache;
>> +     SSL_SESSION *our_ssl_sessionid;
>> +     void *old_ssl_sessionid = NULL;
>> ++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
>> +
>> +     our_ssl_sessionid = SSL_get_session(BACKEND->handle);
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +     incache =
>> +-      !(Curl_ssl_getsessionid(data, conn,
>> +-                              &old_ssl_sessionid, NULL, sockindex));
>> ++      !(Curl_ssl_getsessionid(data, conn, isproxy, &old_ssl_sessionid, NULL,
>> ++                              sockindex));
>> +     if(incache) {
>> +       if(old_ssl_sessionid != our_ssl_sessionid) {
>> +         infof(data, "old SSL session ID is stale, removing\n");
>> +@@ -361,8 +364,9 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
>> +     }
>> +
>> +     if(!incache) {
>> +-      result = Curl_ssl_addsessionid(
>> +-        data, conn, our_ssl_sessionid, 0 /* unknown size */, sockindex);
>> ++      result =
>> ++        Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid, 0,
>> ++                              sockindex);
>> +       if(result) {
>> +         Curl_ssl_sessionid_unlock(data);
>> +         failf(data, "failed to store ssl session");
>> +diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
>> +index 784d9f70e..8304264d3 100644
>> +--- a/lib/vtls/openssl.c
>> ++++ b/lib/vtls/openssl.c
>> +@@ -391,12 +391,23 @@ static int ossl_get_ssl_conn_index(void)
>> +  */
>> + static int ossl_get_ssl_sockindex_index(void)
>> + {
>> +-  static int ssl_ex_data_sockindex_index = -1;
>> +-  if(ssl_ex_data_sockindex_index < 0) {
>> +-    ssl_ex_data_sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL,
>> +-        NULL);
>> ++  static int sockindex_index = -1;
>> ++  if(sockindex_index < 0) {
>> ++    sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
>> +   }
>> +-  return ssl_ex_data_sockindex_index;
>> ++  return sockindex_index;
>> ++}
>> ++
>> ++/* Return an extra data index for proxy boolean.
>> ++ * This index can be used with SSL_get_ex_data() and SSL_set_ex_data().
>> ++ */
>> ++static int ossl_get_proxy_index(void)
>> ++{
>> ++  static int proxy_index = -1;
>> ++  if(proxy_index < 0) {
>> ++    proxy_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
>> ++  }
>> ++  return proxy_index;
>> + }
>> +
>> + static int passwd_callback(char *buf, int num, int encrypting,
>> +@@ -1172,7 +1183,7 @@ static int ossl_init(void)
>> +
>> +   /* Initialize the extra data indexes */
>> +   if(ossl_get_ssl_data_index() < 0 || ossl_get_ssl_conn_index() < 0 ||
>> +-     ossl_get_ssl_sockindex_index() < 0)
>> ++     ossl_get_ssl_sockindex_index() < 0 || ossl_get_proxy_index() < 0)
>> +     return 0;
>> +
>> +   return 1;
>> +@@ -2455,8 +2466,10 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
>> +   int data_idx = ossl_get_ssl_data_index();
>> +   int connectdata_idx = ossl_get_ssl_conn_index();
>> +   int sockindex_idx = ossl_get_ssl_sockindex_index();
>> ++  int proxy_idx = ossl_get_proxy_index();
>> ++  bool isproxy;
>> +
>> +-  if(data_idx < 0 || connectdata_idx < 0 || sockindex_idx < 0)
>> ++  if(data_idx < 0 || connectdata_idx < 0 || sockindex_idx < 0 || proxy_idx < 0)
>> +     return 0;
>> +
>> +   conn = (struct connectdata*) SSL_get_ex_data(ssl, connectdata_idx);
>> +@@ -2469,13 +2482,18 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
>> +   sockindex_ptr = (curl_socket_t*) SSL_get_ex_data(ssl, sockindex_idx);
>> +   sockindex = (int)(sockindex_ptr - conn->sock);
>> +
>> ++  isproxy = SSL_get_ex_data(ssl, proxy_idx) ? TRUE : FALSE;
>> ++
>> +   if(SSL_SET_OPTION(primary.sessionid)) {
>> +     bool incache;
>> +     void *old_ssl_sessionid = NULL;
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +-    incache = !(Curl_ssl_getsessionid(data, conn, &old_ssl_sessionid, NULL,
>> +-                                      sockindex));
>> ++    if(isproxy)
>> ++      incache = FALSE;
>> ++    else
>> ++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
>> ++                                        &old_ssl_sessionid, NULL, sockindex));
>> +     if(incache) {
>> +       if(old_ssl_sessionid != ssl_sessionid) {
>> +         infof(data, "old SSL session ID is stale, removing\n");
>> +@@ -2485,8 +2503,8 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
>> +     }
>> +
>> +     if(!incache) {
>> +-      if(!Curl_ssl_addsessionid(data, conn, ssl_sessionid,
>> +-                                      0 /* unknown size */, sockindex)) {
>> ++      if(!Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
>> ++                                0 /* unknown size */, sockindex)) {
>> +         /* the session has been put into the session cache */
>> +         res = 1;
>> +       }
>> +@@ -3212,17 +3230,27 @@ static CURLcode ossl_connect_step1(struct Curl_easy *data,
>> +     int data_idx = ossl_get_ssl_data_index();
>> +     int connectdata_idx = ossl_get_ssl_conn_index();
>> +     int sockindex_idx = ossl_get_ssl_sockindex_index();
>> ++    int proxy_idx = ossl_get_proxy_index();
>> +
>> +-    if(data_idx >= 0 && connectdata_idx >= 0 && sockindex_idx >= 0) {
>> ++    if(data_idx >= 0 && connectdata_idx >= 0 && sockindex_idx >= 0 &&
>> ++       proxy_idx >= 0) {
>> +       /* Store the data needed for the "new session" callback.
>> +        * The sockindex is stored as a pointer to an array element. */
>> +       SSL_set_ex_data(backend->handle, data_idx, data);
>> +       SSL_set_ex_data(backend->handle, connectdata_idx, conn);
>> +       SSL_set_ex_data(backend->handle, sockindex_idx, conn->sock + sockindex);
>> ++#ifndef CURL_DISABLE_PROXY
>> ++      SSL_set_ex_data(backend->handle, proxy_idx, SSL_IS_PROXY() ? (void *) 1:
>> ++                      NULL);
>> ++#else
>> ++      SSL_set_ex_data(backend->handle, proxy_idx, NULL);
>> ++#endif
>> ++
>> +     }
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +-    if(!Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL, sockindex)) {
>> ++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
>> ++                              &ssl_sessionid, NULL, sockindex)) {
>> +       /* we got a session id, use it! */
>> +       if(!SSL_set_session(backend->handle, ssl_sessionid)) {
>> +         Curl_ssl_sessionid_unlock(data);
>> +diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
>> +index 0668f98f2..bd27ba0bf 100644
>> +--- a/lib/vtls/schannel.c
>> ++++ b/lib/vtls/schannel.c
>> +@@ -496,6 +496,7 @@ schannel_connect_step1(struct Curl_easy *data, struct connectdata *conn,
>> +   if(SSL_SET_OPTION(primary.sessionid)) {
>> +     Curl_ssl_sessionid_lock(data);
>> +     if(!Curl_ssl_getsessionid(data, conn,
>> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
>> +                               (void **)&old_cred, NULL, sockindex)) {
>> +       BACKEND->cred = old_cred;
>> +       DEBUGF(infof(data, "schannel: re-using existing credential handle\n"));
>> +@@ -1337,8 +1338,9 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
>> +   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
>> +   SECURITY_STATUS sspi_status = SEC_E_OK;
>> +   CERT_CONTEXT *ccert_context = NULL;
>> ++  bool isproxy = SSL_IS_PROXY();
>> + #ifdef DEBUGBUILD
>> +-  const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name  <https://urldefense.com/v3/__http://http_proxy.host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88nopWktg$>  :
>> ++  const char * const hostname = isproxy ? conn->http_proxy.host.name  <https://urldefense.com/v3/__http://http_proxy.host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88nopWktg$>  :
>> +     conn->host.name  <https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$>;
>> + #endif
>> + #ifdef HAS_ALPN
>> +@@ -1414,8 +1416,8 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
>> +     struct Curl_schannel_cred *old_cred = NULL;
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +-    incache = !(Curl_ssl_getsessionid(data, conn, (void **)&old_cred, NULL,
>> +-                                      sockindex));
>> ++    incache = !(Curl_ssl_getsessionid(data, conn, isproxy, (void **)&old_cred,
>> ++                                      NULL, sockindex));
>> +     if(incache) {
>> +       if(old_cred != BACKEND->cred) {
>> +         DEBUGF(infof(data,
>> +@@ -1426,7 +1428,7 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
>> +       }
>> +     }
>> +     if(!incache) {
>> +-      result = Curl_ssl_addsessionid(data, conn, (void *)BACKEND->cred,
>> ++      result = Curl_ssl_addsessionid(data, conn, isproxy, BACKEND->cred,
>> +                                      sizeof(struct Curl_schannel_cred),
>> +                                      sockindex);
>> +       if(result) {
>> +diff --git a/lib/vtls/sectransp.c b/lib/vtls/sectransp.c
>> +index 9a8f7de8d..6d1ea7e7b 100644
>> +--- a/lib/vtls/sectransp.c
>> ++++ b/lib/vtls/sectransp.c
>> +@@ -1400,10 +1400,12 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
>> +   char * const ssl_cert = SSL_SET_OPTION(primary.clientcert);
>> +   const struct curl_blob *ssl_cert_blob = SSL_SET_OPTION(primary.cert_blob);
>> + #ifndef CURL_DISABLE_PROXY
>> +-  const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name  <https://urldefense.com/v3/__http://http_proxy.host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88nopWktg$>  :
>> ++  bool isproxy = SSL_IS_PROXY();
>> ++  const char * const hostname = isproxy ? conn->http_proxy.host.name  <https://urldefense.com/v3/__http://http_proxy.host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88nopWktg$>  :
>> +     conn->host.name  <https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$>;
>> +   const long int port = SSL_IS_PROXY() ? conn->port : conn->remote_port;
>> + #else
>> ++  const isproxy = FALSE;
>> +   const char * const hostname = conn->host.name  <https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$>;
>> +   const long int port = conn->remote_port;
>> + #endif
>> +@@ -1613,7 +1615,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
>> + #ifdef USE_NGHTTP2
>> +       if(data->set.httpversion >= CURL_HTTP_VERSION_2
>> + #ifndef CURL_DISABLE_PROXY
>> +-         && (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)
>> ++         && (!isproxy || !conn->bits.tunnel_proxy)
>> + #endif
>> +         ) {
>> +         CFArrayAppendValue(alpnArr, CFSTR(NGHTTP2_PROTO_VERSION_ID));
>> +@@ -1953,7 +1955,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
>> +     size_t ssl_sessionid_len;
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +-    if(!Curl_ssl_getsessionid(data, conn, (void **)&ssl_sessionid,
>> ++    if(!Curl_ssl_getsessionid(data, conn, isproxy, (void **)&ssl_sessionid,
>> +                               &ssl_sessionid_len, sockindex)) {
>> +       /* we got a session id, use it! */
>> +       err = SSLSetPeerID(backend->ssl_ctx, ssl_sessionid, ssl_sessionid_len);
>> +@@ -1981,7 +1983,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
>> +         return CURLE_SSL_CONNECT_ERROR;
>> +       }
>> +
>> +-      result = Curl_ssl_addsessionid(data, conn, ssl_sessionid,
>> ++      result = Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
>> +                                      ssl_sessionid_len, sockindex);
>> +       Curl_ssl_sessionid_unlock(data);
>> +       if(result) {
>> +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
>> +index b8ab7494f..8ccc1f2e4 100644
>> +--- a/lib/vtls/vtls.c
>> ++++ b/lib/vtls/vtls.c
>> +@@ -367,6 +367,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data)
>> +  */
>> + bool Curl_ssl_getsessionid(struct Curl_easy *data,
>> +                            struct connectdata *conn,
>> ++                           const bool isProxy,
>> +                            void **ssl_sessionid,
>> +                            size_t *idsize, /* set 0 if unknown */
>> +                            int sockindex)
>> +@@ -377,7 +378,6 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
>> +   bool no_match = TRUE;
>> +
>> + #ifndef CURL_DISABLE_PROXY
>> +-  const bool isProxy = CONNECT_PROXY_SSL();
>> +   struct ssl_primary_config * const ssl_config = isProxy ?
>> +     &conn->proxy_ssl_config :
>> +     &conn->ssl_config;
>> +@@ -389,10 +389,15 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
>> +   struct ssl_primary_config * const ssl_config = &conn->ssl_config;
>> +   const char * const name = conn->host.name  <https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$>;
>> +   int port = conn->remote_port;
>> +-  (void)sockindex;
>> + #endif
>> ++  (void)sockindex;
>> +   *ssl_sessionid = NULL;
>> +
>> ++#ifdef CURL_DISABLE_PROXY
>> ++  if(isProxy)
>> ++    return TRUE;
>> ++#endif
>> ++
>> +   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
>> +
>> +   if(!SSL_SET_OPTION(primary.sessionid))
>> +@@ -480,6 +485,7 @@ void Curl_ssl_delsessionid(struct Curl_easy *data, void *ssl_sessionid)
>> +  */
>> + CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
>> +                                struct connectdata *conn,
>> ++                               bool isProxy,
>> +                                void *ssl_sessionid,
>> +                                size_t idsize,
>> +                                int sockindex)
>> +@@ -492,7 +498,6 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
>> +   int conn_to_port;
>> +   long *general_age;
>> + #ifndef CURL_DISABLE_PROXY
>> +-  const bool isProxy = CONNECT_PROXY_SSL();
>> +   struct ssl_primary_config * const ssl_config = isProxy ?
>> +     &conn->proxy_ssl_config :
>> +     &conn->ssl_config;
>> +@@ -505,6 +510,7 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
>> +   const char *hostname = conn->host.name  <https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$>;
>> +   (void)sockindex;
>> + #endif
>> ++  (void)sockindex;
>> +   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
>> +
>> +   clone_host = strdup(hostname);
>> +diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
>> +index 9666682ec..4dc29794c 100644
>> +--- a/lib/vtls/vtls.h
>> ++++ b/lib/vtls/vtls.h
>> +@@ -222,6 +222,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data);
>> +  */
>> + bool Curl_ssl_getsessionid(struct Curl_easy *data,
>> +                            struct connectdata *conn,
>> ++                           const bool isproxy,
>> +                            void **ssl_sessionid,
>> +                            size_t *idsize, /* set 0 if unknown */
>> +                            int sockindex);
>> +@@ -232,6 +233,7 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
>> +  */
>> + CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
>> +                                struct connectdata *conn,
>> ++                               const bool isProxy,
>> +                                void *ssl_sessionid,
>> +                                size_t idsize,
>> +                                int sockindex);
>> +diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
>> +index e1fa45926..e4c70877f 100644
>> +--- a/lib/vtls/wolfssl.c
>> ++++ b/lib/vtls/wolfssl.c
>> +@@ -516,7 +516,9 @@ wolfssl_connect_step1(struct Curl_easy *data, struct connectdata *conn,
>> +     void *ssl_sessionid = NULL;
>> +
>> +     Curl_ssl_sessionid_lock(data);
>> +-    if(!Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL, sockindex)) {
>> ++    if(!Curl_ssl_getsessionid(data, conn,
>> ++                              SSL_IS_PROXY() ? TRUE : FALSE,
>> ++                              &ssl_sessionid, NULL, sockindex)) {
>> +       /* we got a session id, use it! */
>> +       if(!SSL_set_session(backend->handle, ssl_sessionid)) {
>> +         char error_buffer[WOLFSSL_MAX_ERROR_SZ];
>> +@@ -774,21 +776,23 @@ wolfssl_connect_step3(struct Curl_easy *data, struct connectdata *conn,
>> +     void *old_ssl_sessionid = NULL;
>> +
>> +     our_ssl_sessionid = SSL_get_session(backend->handle);
>> +-
>> +-    Curl_ssl_sessionid_lock(data);
>> +-    incache = !(Curl_ssl_getsessionid(data, conn, &old_ssl_sessionid, NULL,
>> +-                                      sockindex));
>
> Hey Trevor,
>
>
> If my eyes aren't deceiving me, I believe you took out two curly braces:
>
> here:
>
>> +-    if(incache) {
> and here:
>> +-      if(old_ssl_sessionid != our_ssl_sessionid) {
>> +-        infof(data, "old SSL session ID is stale, removing\n");
>> +-        Curl_ssl_delsessionid(data, old_ssl_sessionid);
>> +-        incache = FALSE;
>> ++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
>> ++
>
> Yet you added three,
>
> here:
>
>> ++    if(our_ssl_sessionid) {
>> ++      Curl_ssl_sessionid_lock(data);
>> ++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
>> ++                                        &old_ssl_sessionid, NULL, sockindex));
> here
>> ++      if(incache) {
> and here
>> ++        if(old_ssl_sessionid != our_ssl_sessionid) {
>> ++            infof(data, "old SSL session ID is stale, removing\n");
>> ++            Curl_ssl_delsessionid(data, old_ssl_sessionid);
>> ++            incache = FALSE;
>
> That's one extra curly brace for these two closing ones.
>
>
> This has already been merged (and backported) can you check that?
>
You're right, I lost a bracket while sorting out the patch delta. Thanks 
for catching this. Patch coming shortly.

- Trevor

> Cheers,
>
> Alejandro
>
>> +       }
>> +     }
>> +
>> +     if(!incache) {
>> +-      result = Curl_ssl_addsessionid(data, conn, our_ssl_sessionid,
>> +-                                     0 /* unknown size */, sockindex);
>> ++      result = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
>> ++                                     0, sockindex);
>> +       if(result) {
>> +         Curl_ssl_sessionid_unlock(data);
>> +         failf(data, "failed to store ssl session");
>> +--
>> +2.31.1
>> +
>> diff --git a/meta/recipes-support/curl/curl_7.75.0.bb  <https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$>  b/meta/recipes-support/curl/curl_7.75.0.bb  <https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$>
>> index 7666c7b608..428b8cd9e3 100644
>> --- a/meta/recipes-support/curl/curl_7.75.0.bb  <https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$>
>> +++ b/meta/recipes-support/curl/curl_7.75.0.bb  <https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$>
>> @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM ="file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
>>   
>>   SRC_URI ="https://curl.haxx.se/download/curl-${PV}.tar.bz2 \ 
>> file://0001-replace-krb5-config-with-pkg-config.patch \ + 
>> file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch 
>> \ "
>>   
>>   SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
>>
>> 
>>

--------------6315045D7DAAE1B667980B46
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-06-15 6:12 p.m., Alejandro
      Enedino Hernandez Samaniego wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d6b36eef-37fb-9901-20ae-909c9a4475f5@linux.microsoft.com">
      
      <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 6/1/21 9:09 AM, Trevor Gamblin
          wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
          <pre class="moz-quote-pre" wrap="">Backport and modify the patch for CVE-2021-22890 from curl 7.76 to make
it apply cleanly on 7.75.

CVE: CVE-2021-22890

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com" moz-do-not-send="true">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 ...-argument-to-Curl_ssl_get-addsession.patch | 517 ++++++++++++++++++
 meta/recipes-support/curl/<a href="https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$" moz-do-not-send="true">curl_7.75.0.bb</a>      |   1 +
 2 files changed, 518 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch

diff --git a/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
new file mode 100644
index 0000000000..a0c7d68f33
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
@@ -0,0 +1,517 @@
+From a2d3885223db9616283bfe33435fbe9b3140eac7 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com" moz-do-not-send="true">&lt;trevor.gamblin@windriver.com&gt;</a>
+Date: Tue, 1 Jun 2021 09:50:20 -0400
+Subject: [PATCH 1/2] vtls: add 'isproxy' argument to
+ Curl_ssl_get/addsessionid()
+
+To make sure we set and extract the correct session.
+
+Reported-by: Mingtao Yang
+Bug: <a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://curl.se/docs/CVE-2021-22890.html__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_w8IpkXw$" moz-do-not-send="true">https://curl.se/docs/CVE-2021-22890.html</a>
+
+CVE-2021-22890
+
+Upstream-Status: Backport
+(<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://github.com/curl/curl/commit/b09c8ee15771c614c4bf3ddac893cdb12187c844__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8-kWHpuPg$" moz-do-not-send="true">https://github.com/curl/curl/commit/b09c8ee15771c614c4bf3ddac893cdb12187c844</a>)
+
+Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com" moz-do-not-send="true">&lt;trevor.gamblin@windriver.com&gt;</a>
+---
+ lib/vtls/bearssl.c   |  8 +++++--
+ lib/vtls/gtls.c      | 12 ++++++----
+ lib/vtls/mbedtls.c   | 12 ++++++----
+ lib/vtls/mesalink.c  | 14 ++++++++----
+ lib/vtls/openssl.c   | 54 +++++++++++++++++++++++++++++++++-----------
+ lib/vtls/schannel.c  | 10 ++++----
+ lib/vtls/sectransp.c | 10 ++++----
+ lib/vtls/vtls.c      | 12 +++++++---
+ lib/vtls/vtls.h      |  2 ++
+ lib/vtls/wolfssl.c   | 28 +++++++++++++----------
+ 10 files changed, 111 insertions(+), 51 deletions(-)
+
+diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
+index 29b08c0e6..0432dfadc 100644
+--- a/lib/vtls/bearssl.c
++++ b/lib/vtls/bearssl.c
+@@ -375,7 +375,8 @@ static CURLcode bearssl_connect_step1(struct Curl_easy *data,
+     void *session;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;session, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;session, NULL, sockindex)) {
+       br_ssl_engine_set_session_parameters(&amp;backend-&gt;ctx.eng, session);
+       infof(data, &quot;BearSSL: re-using session ID\n&quot;);
+     }
+@@ -571,10 +572,13 @@ static CURLcode bearssl_connect_step3(struct Curl_easy *data,
+     br_ssl_engine_get_session_parameters(&amp;backend-&gt;ctx.eng, session);
+     Curl_ssl_sessionid_lock(data);
+     incache = !(Curl_ssl_getsessionid(data, conn,
++                                      SSL_IS_PROXY() ? TRUE : FALSE,
+                                       &amp;oldsession, NULL, sockindex));
+     if(incache)
+       Curl_ssl_delsessionid(data, oldsession);
+-    ret = Curl_ssl_addsessionid(data, conn, session, 0, sockindex);
++    ret = Curl_ssl_addsessionid(data, conn,
++                                SSL_IS_PROXY() ? TRUE : FALSE,
++                                session, 0, sockindex);
+     Curl_ssl_sessionid_unlock(data);
+     if(ret) {
+       free(session);
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 3ddee1974..28ca528a6 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -733,6 +733,7 @@ gtls_connect_step1(struct Curl_easy *data,
+ 
+     Curl_ssl_sessionid_lock(data);
+     if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
+                               &amp;ssl_sessionid, &amp;ssl_idsize, sockindex)) {
+       /* we got a session id, use it! */
+       gnutls_session_set_data(session, ssl_sessionid, ssl_idsize);
+@@ -1292,8 +1293,9 @@ gtls_connect_step3(struct Curl_easy *data,
+       gnutls_session_get_data(session, connect_sessionid, &amp;connect_idsize);
+ 
+       Curl_ssl_sessionid_lock(data);
+-      incache = !(Curl_ssl_getsessionid(data, conn, &amp;ssl_sessionid, NULL,
+-                                        sockindex));
++      incache = !(Curl_ssl_getsessionid(data, conn,
++                                        SSL_IS_PROXY() ? TRUE : FALSE,
++                                        &amp;ssl_sessionid, NULL, sockindex));
+       if(incache) {
+         /* there was one before in the cache, so instead of risking that the
+            previous one was rejected, we just kill that and store the new */
+@@ -1301,8 +1303,10 @@ gtls_connect_step3(struct Curl_easy *data,
+       }
+ 
+       /* store this session id */
+-      result = Curl_ssl_addsessionid(data, conn, connect_sessionid,
+-                                     connect_idsize, sockindex);
++      result = Curl_ssl_addsessionid(data, conn,
++                                     SSL_IS_PROXY() ? TRUE : FALSE,
++                                     connect_sessionid, connect_idsize,
++                                     sockindex);
+       Curl_ssl_sessionid_unlock(data);
+       if(result) {
+         free(connect_sessionid);
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index fc3a948d1..bd0e0802e 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -463,7 +463,9 @@ mbed_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+     void *old_session = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;old_session, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;old_session, NULL, sockindex)) {
+       ret = mbedtls_ssl_set_session(&amp;backend-&gt;ssl, old_session);
+       if(ret) {
+         Curl_ssl_sessionid_unlock(data);
+@@ -724,6 +726,7 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+     int ret;
+     mbedtls_ssl_session *our_ssl_sessionid;
+     void *old_ssl_sessionid = NULL;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
+ 
+     our_ssl_sessionid = malloc(sizeof(mbedtls_ssl_session));
+     if(!our_ssl_sessionid)
+@@ -742,11 +745,12 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+ 
+     /* If there's already a matching session in the cache, delete it */
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;old_ssl_sessionid, NULL, sockindex))
++    if(!Curl_ssl_getsessionid(data, conn, isproxy, &amp;old_ssl_sessionid, NULL,
++                              sockindex))
+       Curl_ssl_delsessionid(data, old_ssl_sessionid);
+ 
+-    retcode = Curl_ssl_addsessionid(data, conn,
+-                                    our_ssl_sessionid, 0, sockindex);
++    retcode = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
++                                    0, sockindex);
+     Curl_ssl_sessionid_unlock(data);
+     if(retcode) {
+       mbedtls_ssl_session_free(our_ssl_sessionid);
+diff --git a/lib/vtls/mesalink.c b/lib/vtls/mesalink.c
+index b6d1005ec..ad807d3ba 100644
+--- a/lib/vtls/mesalink.c
++++ b/lib/vtls/mesalink.c
+@@ -261,7 +261,9 @@ mesalink_connect_step1(struct Curl_easy *data,
+     void *ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(BACKEND-&gt;handle, ssl_sessionid)) {
+         Curl_ssl_sessionid_unlock(data);
+@@ -345,13 +347,14 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
+     bool incache;
+     SSL_SESSION *our_ssl_sessionid;
+     void *old_ssl_sessionid = NULL;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
+ 
+     our_ssl_sessionid = SSL_get_session(BACKEND-&gt;handle);
+ 
+     Curl_ssl_sessionid_lock(data);
+     incache =
+-      !(Curl_ssl_getsessionid(data, conn,
+-                              &amp;old_ssl_sessionid, NULL, sockindex));
++      !(Curl_ssl_getsessionid(data, conn, isproxy, &amp;old_ssl_sessionid, NULL,
++                              sockindex));
+     if(incache) {
+       if(old_ssl_sessionid != our_ssl_sessionid) {
+         infof(data, &quot;old SSL session ID is stale, removing\n&quot;);
+@@ -361,8 +364,9 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
+     }
+ 
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(
+-        data, conn, our_ssl_sessionid, 0 /* unknown size */, sockindex);
++      result =
++        Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid, 0,
++                              sockindex);
+       if(result) {
+         Curl_ssl_sessionid_unlock(data);
+         failf(data, &quot;failed to store ssl session&quot;);
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 784d9f70e..8304264d3 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -391,12 +391,23 @@ static int ossl_get_ssl_conn_index(void)
+  */
+ static int ossl_get_ssl_sockindex_index(void)
+ {
+-  static int ssl_ex_data_sockindex_index = -1;
+-  if(ssl_ex_data_sockindex_index &lt; 0) {
+-    ssl_ex_data_sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL,
+-        NULL);
++  static int sockindex_index = -1;
++  if(sockindex_index &lt; 0) {
++    sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
+   }
+-  return ssl_ex_data_sockindex_index;
++  return sockindex_index;
++}
++
++/* Return an extra data index for proxy boolean.
++ * This index can be used with SSL_get_ex_data() and SSL_set_ex_data().
++ */
++static int ossl_get_proxy_index(void)
++{
++  static int proxy_index = -1;
++  if(proxy_index &lt; 0) {
++    proxy_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
++  }
++  return proxy_index;
+ }
+ 
+ static int passwd_callback(char *buf, int num, int encrypting,
+@@ -1172,7 +1183,7 @@ static int ossl_init(void)
+ 
+   /* Initialize the extra data indexes */
+   if(ossl_get_ssl_data_index() &lt; 0 || ossl_get_ssl_conn_index() &lt; 0 ||
+-     ossl_get_ssl_sockindex_index() &lt; 0)
++     ossl_get_ssl_sockindex_index() &lt; 0 || ossl_get_proxy_index() &lt; 0)
+     return 0;
+ 
+   return 1;
+@@ -2455,8 +2466,10 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+   int data_idx = ossl_get_ssl_data_index();
+   int connectdata_idx = ossl_get_ssl_conn_index();
+   int sockindex_idx = ossl_get_ssl_sockindex_index();
++  int proxy_idx = ossl_get_proxy_index();
++  bool isproxy;
+ 
+-  if(data_idx &lt; 0 || connectdata_idx &lt; 0 || sockindex_idx &lt; 0)
++  if(data_idx &lt; 0 || connectdata_idx &lt; 0 || sockindex_idx &lt; 0 || proxy_idx &lt; 0)
+     return 0;
+ 
+   conn = (struct connectdata*) SSL_get_ex_data(ssl, connectdata_idx);
+@@ -2469,13 +2482,18 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+   sockindex_ptr = (curl_socket_t*) SSL_get_ex_data(ssl, sockindex_idx);
+   sockindex = (int)(sockindex_ptr - conn-&gt;sock);
+ 
++  isproxy = SSL_get_ex_data(ssl, proxy_idx) ? TRUE : FALSE;
++
+   if(SSL_SET_OPTION(primary.sessionid)) {
+     bool incache;
+     void *old_ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    incache = !(Curl_ssl_getsessionid(data, conn, &amp;old_ssl_sessionid, NULL,
+-                                      sockindex));
++    if(isproxy)
++      incache = FALSE;
++    else
++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
++                                        &amp;old_ssl_sessionid, NULL, sockindex));
+     if(incache) {
+       if(old_ssl_sessionid != ssl_sessionid) {
+         infof(data, &quot;old SSL session ID is stale, removing\n&quot;);
+@@ -2485,8 +2503,8 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+     }
+ 
+     if(!incache) {
+-      if(!Curl_ssl_addsessionid(data, conn, ssl_sessionid,
+-                                      0 /* unknown size */, sockindex)) {
++      if(!Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
++                                0 /* unknown size */, sockindex)) {
+         /* the session has been put into the session cache */
+         res = 1;
+       }
+@@ -3212,17 +3230,27 @@ static CURLcode ossl_connect_step1(struct Curl_easy *data,
+     int data_idx = ossl_get_ssl_data_index();
+     int connectdata_idx = ossl_get_ssl_conn_index();
+     int sockindex_idx = ossl_get_ssl_sockindex_index();
++    int proxy_idx = ossl_get_proxy_index();
+ 
+-    if(data_idx &gt;= 0 &amp;&amp; connectdata_idx &gt;= 0 &amp;&amp; sockindex_idx &gt;= 0) {
++    if(data_idx &gt;= 0 &amp;&amp; connectdata_idx &gt;= 0 &amp;&amp; sockindex_idx &gt;= 0 &amp;&amp;
++       proxy_idx &gt;= 0) {
+       /* Store the data needed for the &quot;new session&quot; callback.
+        * The sockindex is stored as a pointer to an array element. */
+       SSL_set_ex_data(backend-&gt;handle, data_idx, data);
+       SSL_set_ex_data(backend-&gt;handle, connectdata_idx, conn);
+       SSL_set_ex_data(backend-&gt;handle, sockindex_idx, conn-&gt;sock + sockindex);
++#ifndef CURL_DISABLE_PROXY
++      SSL_set_ex_data(backend-&gt;handle, proxy_idx, SSL_IS_PROXY() ? (void *) 1:
++                      NULL);
++#else
++      SSL_set_ex_data(backend-&gt;handle, proxy_idx, NULL);
++#endif
++
+     }
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(backend-&gt;handle, ssl_sessionid)) {
+         Curl_ssl_sessionid_unlock(data);
+diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
+index 0668f98f2..bd27ba0bf 100644
+--- a/lib/vtls/schannel.c
++++ b/lib/vtls/schannel.c
+@@ -496,6 +496,7 @@ schannel_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+   if(SSL_SET_OPTION(primary.sessionid)) {
+     Curl_ssl_sessionid_lock(data);
+     if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
+                               (void **)&amp;old_cred, NULL, sockindex)) {
+       BACKEND-&gt;cred = old_cred;
+       DEBUGF(infof(data, &quot;schannel: re-using existing credential handle\n&quot;));
+@@ -1337,8 +1338,9 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+   struct ssl_connect_data *connssl = &amp;conn-&gt;ssl[sockindex];
+   SECURITY_STATUS sspi_status = SEC_E_OK;
+   CERT_CONTEXT *ccert_context = NULL;
++  bool isproxy = SSL_IS_PROXY();
+ #ifdef DEBUGBUILD
+-  const char * const hostname = SSL_IS_PROXY() ? conn-&gt;<a href="https://urldefense.com/v3/__http://http_proxy.host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88nopWktg$" moz-do-not-send="true">http_proxy.host.name</a> :
++  const char * const hostname = isproxy ? conn-&gt;<a href="https://urldefense.com/v3/__http://http_proxy.host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88nopWktg$" moz-do-not-send="true">http_proxy.host.name</a> :
+     conn-&gt;<a href="https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$" moz-do-not-send="true">host.name</a>;
+ #endif
+ #ifdef HAS_ALPN
+@@ -1414,8 +1416,8 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+     struct Curl_schannel_cred *old_cred = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    incache = !(Curl_ssl_getsessionid(data, conn, (void **)&amp;old_cred, NULL,
+-                                      sockindex));
++    incache = !(Curl_ssl_getsessionid(data, conn, isproxy, (void **)&amp;old_cred,
++                                      NULL, sockindex));
+     if(incache) {
+       if(old_cred != BACKEND-&gt;cred) {
+         DEBUGF(infof(data,
+@@ -1426,7 +1428,7 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+       }
+     }
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(data, conn, (void *)BACKEND-&gt;cred,
++      result = Curl_ssl_addsessionid(data, conn, isproxy, BACKEND-&gt;cred,
+                                      sizeof(struct Curl_schannel_cred),
+                                      sockindex);
+       if(result) {
+diff --git a/lib/vtls/sectransp.c b/lib/vtls/sectransp.c
+index 9a8f7de8d..6d1ea7e7b 100644
+--- a/lib/vtls/sectransp.c
++++ b/lib/vtls/sectransp.c
+@@ -1400,10 +1400,12 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+   char * const ssl_cert = SSL_SET_OPTION(primary.clientcert);
+   const struct curl_blob *ssl_cert_blob = SSL_SET_OPTION(primary.cert_blob);
+ #ifndef CURL_DISABLE_PROXY
+-  const char * const hostname = SSL_IS_PROXY() ? conn-&gt;<a href="https://urldefense.com/v3/__http://http_proxy.host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88nopWktg$" moz-do-not-send="true">http_proxy.host.name</a> :
++  bool isproxy = SSL_IS_PROXY();
++  const char * const hostname = isproxy ? conn-&gt;<a href="https://urldefense.com/v3/__http://http_proxy.host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88nopWktg$" moz-do-not-send="true">http_proxy.host.name</a> :
+     conn-&gt;<a href="https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$" moz-do-not-send="true">host.name</a>;
+   const long int port = SSL_IS_PROXY() ? conn-&gt;port : conn-&gt;remote_port;
+ #else
++  const isproxy = FALSE;
+   const char * const hostname = conn-&gt;<a href="https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$" moz-do-not-send="true">host.name</a>;
+   const long int port = conn-&gt;remote_port;
+ #endif
+@@ -1613,7 +1615,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+ #ifdef USE_NGHTTP2
+       if(data-&gt;set.httpversion &gt;= CURL_HTTP_VERSION_2
+ #ifndef CURL_DISABLE_PROXY
+-         &amp;&amp; (!SSL_IS_PROXY() || !conn-&gt;bits.tunnel_proxy)
++         &amp;&amp; (!isproxy || !conn-&gt;bits.tunnel_proxy)
+ #endif
+         ) {
+         CFArrayAppendValue(alpnArr, CFSTR(NGHTTP2_PROTO_VERSION_ID));
+@@ -1953,7 +1955,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+     size_t ssl_sessionid_len;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, (void **)&amp;ssl_sessionid,
++    if(!Curl_ssl_getsessionid(data, conn, isproxy, (void **)&amp;ssl_sessionid,
+                               &amp;ssl_sessionid_len, sockindex)) {
+       /* we got a session id, use it! */
+       err = SSLSetPeerID(backend-&gt;ssl_ctx, ssl_sessionid, ssl_sessionid_len);
+@@ -1981,7 +1983,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+         return CURLE_SSL_CONNECT_ERROR;
+       }
+ 
+-      result = Curl_ssl_addsessionid(data, conn, ssl_sessionid,
++      result = Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
+                                      ssl_sessionid_len, sockindex);
+       Curl_ssl_sessionid_unlock(data);
+       if(result) {
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index b8ab7494f..8ccc1f2e4 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -367,6 +367,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data)
+  */
+ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+                            struct connectdata *conn,
++                           const bool isProxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex)
+@@ -377,7 +378,6 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+   bool no_match = TRUE;
+ 
+ #ifndef CURL_DISABLE_PROXY
+-  const bool isProxy = CONNECT_PROXY_SSL();
+   struct ssl_primary_config * const ssl_config = isProxy ?
+     &amp;conn-&gt;proxy_ssl_config :
+     &amp;conn-&gt;ssl_config;
+@@ -389,10 +389,15 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+   struct ssl_primary_config * const ssl_config = &amp;conn-&gt;ssl_config;
+   const char * const name = conn-&gt;<a href="https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$" moz-do-not-send="true">host.name</a>;
+   int port = conn-&gt;remote_port;
+-  (void)sockindex;
+ #endif
++  (void)sockindex;
+   *ssl_sessionid = NULL;
+ 
++#ifdef CURL_DISABLE_PROXY
++  if(isProxy)
++    return TRUE;
++#endif
++
+   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
+ 
+   if(!SSL_SET_OPTION(primary.sessionid))
+@@ -480,6 +485,7 @@ void Curl_ssl_delsessionid(struct Curl_easy *data, void *ssl_sessionid)
+  */
+ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+                                struct connectdata *conn,
++                               bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex)
+@@ -492,7 +498,6 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+   int conn_to_port;
+   long *general_age;
+ #ifndef CURL_DISABLE_PROXY
+-  const bool isProxy = CONNECT_PROXY_SSL();
+   struct ssl_primary_config * const ssl_config = isProxy ?
+     &amp;conn-&gt;proxy_ssl_config :
+     &amp;conn-&gt;ssl_config;
+@@ -505,6 +510,7 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+   const char *hostname = conn-&gt;<a href="https://urldefense.com/v3/__http://host.name__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8_pHpLLHg$" moz-do-not-send="true">host.name</a>;
+   (void)sockindex;
+ #endif
++  (void)sockindex;
+   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
+ 
+   clone_host = strdup(hostname);
+diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
+index 9666682ec..4dc29794c 100644
+--- a/lib/vtls/vtls.h
++++ b/lib/vtls/vtls.h
+@@ -222,6 +222,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data);
+  */
+ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+                            struct connectdata *conn,
++                           const bool isproxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex);
+@@ -232,6 +233,7 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+  */
+ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+                                struct connectdata *conn,
++                               const bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex);
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index e1fa45926..e4c70877f 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -516,7 +516,9 @@ wolfssl_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+     void *ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &amp;ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
++                              &amp;ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(backend-&gt;handle, ssl_sessionid)) {
+         char error_buffer[WOLFSSL_MAX_ERROR_SZ];
+@@ -774,21 +776,23 @@ wolfssl_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+     void *old_ssl_sessionid = NULL;
+ 
+     our_ssl_sessionid = SSL_get_session(backend-&gt;handle);
+-
+-    Curl_ssl_sessionid_lock(data);
+-    incache = !(Curl_ssl_getsessionid(data, conn, &amp;old_ssl_sessionid, NULL,
+-                                      sockindex));</pre>
        </blockquote>
        <p>Hey Trevor,</p>
        <p><br>
        </p>
        <p>If my eyes aren't deceiving me, I believe you took out two
          curly braces:<br>
        </p>
        <p>here:<br>
        </p>
        <blockquote type="cite" cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
          <pre class="moz-quote-pre" wrap="">+-    if(incache) {</pre>
        </blockquote>
        and here:<br>
        <blockquote type="cite" cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
          <pre class="moz-quote-pre" wrap="">+-      if(old_ssl_sessionid != our_ssl_sessionid) {
+-        infof(data, &quot;old SSL session ID is stale, removing\n&quot;);
+-        Curl_ssl_delsessionid(data, old_ssl_sessionid);
+-        incache = FALSE;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
++</pre>
        </blockquote>
        <p>Yet you added three,</p>
        <p>here:<br>
        </p>
        <blockquote type="cite" cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
          <pre class="moz-quote-pre" wrap="">++    if(our_ssl_sessionid) {
++      Curl_ssl_sessionid_lock(data);
++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
++                                        &amp;old_ssl_sessionid, NULL, sockindex));</pre>
        </blockquote>
        here<br>
        <blockquote type="cite" cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
          <pre class="moz-quote-pre" wrap="">++      if(incache) {</pre>
        </blockquote>
        and here<br>
        <blockquote type="cite" cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
          <pre class="moz-quote-pre" wrap="">++        if(old_ssl_sessionid != our_ssl_sessionid) {
++            infof(data, &quot;old SSL session ID is stale, removing\n&quot;);
++            Curl_ssl_delsessionid(data, old_ssl_sessionid);
++            incache = FALSE;</pre>
        </blockquote>
        <p>That's one extra curly brace for these two closing ones.</p>
        <p><br>
        </p>
        <p>This has already been merged (and backported) can you check
          that?</p>
      </div>
    </blockquote>
    <p>You're right, I lost a bracket while sorting out the patch delta.
      Thanks for catching this. Patch coming shortly.</p>
    <p>- Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:d6b36eef-37fb-9901-20ae-909c9a4475f5@linux.microsoft.com">
      <div>
        <p>Cheers,<br>
        </p>
        <p>Alejandro<br>
        </p>
        <blockquote type="cite" cite="mid:20210601150928.1851569-1-trevor.gamblin@windriver.com">
          <pre class="moz-quote-pre" wrap="">+       }
+     }
+ 
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(data, conn, our_ssl_sessionid,
+-                                     0 /* unknown size */, sockindex);
++      result = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
++                                     0, sockindex);
+       if(result) {
+         Curl_ssl_sessionid_unlock(data);
+         failf(data, &quot;failed to store ssl session&quot;);
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/curl/<a href="https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$" moz-do-not-send="true">curl_7.75.0.bb</a> b/meta/recipes-support/curl/<a href="https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$" moz-do-not-send="true">curl_7.75.0.bb</a>
index 7666c7b608..428b8cd9e3 100644
--- a/meta/recipes-support/curl/<a href="https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$" moz-do-not-send="true">curl_7.75.0.bb</a>
+++ b/meta/recipes-support/curl/<a href="https://urldefense.com/v3/__http://curl_7.75.0.bb__;!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC88Uov7Q9A$" moz-do-not-send="true">curl_7.75.0.bb</a>
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b" moz-do-not-send="true">&quot;file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b&quot;</a>
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://urldefense.com/v3/__https://curl.haxx.se/download/curl-$*7BPV*7D.tar.bz2*5Cfile:/*0001-replace-krb5-config-with-pkg-config.patch*5C*file:/*0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch*5C__;JSUlLyUrLyU!!AjveYdw8EvQ!Kth8YheDEnSG4Aa5fzE6_1Y2Ai_p0hp7OoDwxk4dxsLG88c1JzIpGjSWEgaUC8-j0C9AUw$" moz-do-not-send="true">&quot;https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch \
 &quot;</a>
 
 SRC_URI[sha256sum] = &quot;50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026&quot;
</pre>
          <br>
          <fieldset class="mimeAttachmentHeader"></fieldset>
          <pre class="moz-quote-pre" wrap="">

</pre>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------6315045D7DAAE1B667980B46--
