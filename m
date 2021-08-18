Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.61520.1629325194521100698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 15:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MgfmyASj;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3864237ae6=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17IM0RpP004705
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 22:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=FCb7Na3fqjreVjkmdO8Q6JEKl2C05AuFJ5FIGy8GkCI=;
 b=MgfmyASj4XBVx58Dxa7vcwu6l9IxcBegayhuZ944vHblWYBFed4hEeerhqneqhNYCePR
 M11O84A2Wc7h3dxoSo+mF7pRTiOgh3pEyRlMcRvN7K7IUztZjhlQL8BlFcTmMIGcxfaS
 sOHav6d4PRSWkCOO8w0bv4LY+9h2cVhAFxm0YxBTpU34z21FfbeAIrRsZqX+N3aEbYpo
 KNvnomzAT9zBVxZT4/DKSvhGCjTkdlopLD7/EV4MjmNkVsB4CixvWYiE7JsYEoDDQyuR
 gv0fplvMFlu8o9DpBVqgio3wXNXIBmrT3Fq9IGGecu+TMkTs3J+Mo+Ye7QOMmK4VYcXk Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ahakcr0d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 22:19:53 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17IMHDNk006792
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 22:19:53 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ahakcr0d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Aug 2021 22:19:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TD/df7XXHSI1EFoT588DhWLFN4eYk5Mz2fcHIPY6PMaNNfCzUnI8G77Hr5bN0Wh0GKAzDm/d7FaA+8pAvOWwRLFyM1PQUoehEzs4+VnoePv6kUOke+J72JdfvJn4rjLF7Xq/Yxe1h5a9rKvp1wuE1BLCKcv7KaOLbcJ8K+2ZQH0HK1ewyq0nubyI1Lmpfx5eA2RWbvCdrLi+UqO1Z2Qt23i+muMEvFE1bHOg9WWh9mS1QGRdNDIWvMLa3/i8jNl3EJqAbKm8UyqOkGbOANA68USbo8TnHQq1JAkDBRe/qVASIY+uqmDqWtamSWpxomweT7Q+bOqCHXyKWbAA9IG1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCb7Na3fqjreVjkmdO8Q6JEKl2C05AuFJ5FIGy8GkCI=;
 b=FLn0BLm6VDveD+tpJ6BIAuKsBtZmwpCNeWfeL1Tk6PnPovIjXZjUBxX3qedmbIebJBPkWvWVE/15nZkSFoNPssDD/WfMY7FWe+QxNcTH9nnrEXkdPEdbrXqx8TSEkUTj4igMk/CvRoW8LRFdOioo1uyb2vy9oGYEEskCKWYXk2n3Y6S6XWOkzQRB0KZHoTkCIA0vgAGMnR09B7pCNuTz9TFqRoZFqH4ZUF/3Yr4rChmpLAEDgunevooYZeUsoEAlVuPWjMF9tfV3Oz7sPQt21INMWcEtLbwI6uUkLzo+r3AR0fIqDoFPuhXC2Q7xYlIqMWLtJLYRNw/J6BRoVGeZ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1484.namprd11.prod.outlook.com (2603:10b6:4:8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17; Wed, 18 Aug 2021 22:19:50 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 22:19:50 +0000
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: Khem Raj <raj.khem@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>,
        Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
 <CAMKF1sqy4JmetZ43q7Nq0EFN1ooRBdR8uutxZxzi2QvuvU1SpA@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <2ec0fd8d-a20f-c64c-b5c0-0c86b3a682a7@windriver.com>
Date: Wed, 18 Aug 2021 18:19:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAMKF1sqy4JmetZ43q7Nq0EFN1ooRBdR8uutxZxzi2QvuvU1SpA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by SJ0PR03CA0360.namprd03.prod.outlook.com (2603:10b6:a03:39c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 22:19:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f8bd6e1-d52d-4f4b-06a4-08d962964b4c
X-MS-TrafficTypeDiagnostic: DM5PR11MB1484:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1484E493149E9AEFD3323866F8FF9@DM5PR11MB1484.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YlFGK1FocFBmMGZVS1I2bEhkdE9QYUF0Qk5LazNLZTlkSk84ZTNwcWJmSGVS?=
 =?utf-8?B?K1hMdllvaW1kY1ZQelpqQXFNU21wMDBrRkJkNWU5UCtwVmMveGxiZW1GTWJM?=
 =?utf-8?B?cFN4M0JaZ2NMVzVrVDlQNWNwMHE5R3kwY2pqeEJiWUdCaTM2ZDk0dms1eDdx?=
 =?utf-8?B?S25NTWp2UnBFWEt6RGRKK3o1MHg3bEt4S3B0VCsrZXNJbXFsOHFPaE1IRjls?=
 =?utf-8?B?NHNuOWo5QUZzd2VRa3JFSnozY2pTNVdheWZYcy94M0pYak1FYm05Ty9NdFpl?=
 =?utf-8?B?M1ZWSFZmMEkxWStQMkRpTkFrOVlSRHZURktISkFQNVRmaDJOZVpQZ2tEZGFQ?=
 =?utf-8?B?aitNcmdSejduZVdocVJQZFVvb0ZoN3JlbDVnOEI3M3R5QnZ3QzUrWHZta3lB?=
 =?utf-8?B?SzJNYXl0UEdyRklTWHE5dktxdDVDY3FyMjEvVXdZZlFaakdpUEtDR2ZrTHFs?=
 =?utf-8?B?WWtZTXNrZ3hWOXVrd2RiREN4WHhRR0paNnZvSlV1RWJVUk1TRWV5MmZXZHJE?=
 =?utf-8?B?OHFFKyttUVlHaGMzTWdLOWlFd1QwWmJFMkluVCtnQ21QV2F2TnB6V0QrRCsx?=
 =?utf-8?B?NHpKeVBwWlR4QzZybjExa3J2c0UwZ2xnT0llRU9qL1BjaER3WVV6amtHRWFW?=
 =?utf-8?B?WUx6VldIZmJ0amNMYVBGdm9IVTlGZlpxb0NVVjhyeklaY0pyNUYxTU9NRS9I?=
 =?utf-8?B?ZTZ4NUNaeFQvMHVkOHJYdzV2a2xsakhUVE05T205NE8yY1hmb3BmMThubjlY?=
 =?utf-8?B?cXhqdEI2ZTVhaGswajBHTDYweXZjRER6b3RYY3Y1QVo5U3lnZ2Nyb2hyNzNE?=
 =?utf-8?B?K04rZE9HQmdsQnplVUdVaDBETVppTmYwU0g5UWQwbjk1RGlGSVFsTVlIZFNt?=
 =?utf-8?B?dDlhUTcwaThvUWE4QnZqYkE1bEY0ZGtJb3FBMitpNlk2emJEdFBXRksrWmxE?=
 =?utf-8?B?eWRPM2JCcDZlZWxKaTFJZVQrSGhSTnRxcDRVejNhRDdSQXZIU0R0ZjhjUXpI?=
 =?utf-8?B?WkJzZU5oZytwTC90VkJaTzRHanlONHZhcHo4QkNYSUd5QWtwdCs5a3BNdEtL?=
 =?utf-8?B?Rng5NVlFWnh4M283RmJka0dOckdIM0Y1V3VEa1I4N2JFS2dBd2NXcTJuS3pD?=
 =?utf-8?B?Wnc4b1Vndk85UXRGNU1TN0hIdGhkNDc2K2xZc3J4dS9RQTFCbktCb3B0KzZP?=
 =?utf-8?B?Y2VPcmdaTmVtTVprek5IeGFHT3F1RjNZRi9sbzV5VnRjT0VWN3BrdWt0OFcy?=
 =?utf-8?B?RlFLQnRQdFIxU0pzbnVxQVNaNnk1SGUyd1hJenRvT1dMY2JQZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(366004)(396003)(376002)(110136005)(66946007)(38350700002)(6486002)(956004)(36756003)(2616005)(16576012)(83380400001)(31686004)(4326008)(316002)(6666004)(38100700002)(478600001)(15188445003)(52116002)(186003)(8936002)(5660300002)(31696002)(86362001)(66476007)(66556008)(966005)(26005)(2906002)(8676002)(53546011)(32563001)(45980500001)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eC9yYklaa2hQRDZFbUJpUllMK01mL3I5dmxNZzJWYnIrempndFhzQW1hVExn?=
 =?utf-8?B?K2ZMRVpoZ1JoUXZ5M1hqQjJDQVcwL3hqOERQL05qN1VkcUVLR285ZzQzRlFM?=
 =?utf-8?B?eXhkU2dNWEhQMXNPbkN3S0p3UkhQOXFJc0FodFZ2NTkxdWRzdHJpSlk4QS9I?=
 =?utf-8?B?dDdPM1gzVWxXSmVlRnZjUStINWh5bHJsN3VhSVc3Q0VmNEoxQklNZXlTbS9Q?=
 =?utf-8?B?dUdPTk1paUs1VmlVZCtzbm1WN0JaZTRaNC96b3lZazI2NnBGWXIraGxUVnpP?=
 =?utf-8?B?bllpYWJQMkFjNkhxNEd3cHlLZ1dsLzRqdnY3bmo0MUwrTXQ1RENTSWRCNFE1?=
 =?utf-8?B?TWNVSnhZMFJzRmYxL1dFcWtzMyt5bWsrazYwTm51ZkNoSG1mS0htNjBZSmJk?=
 =?utf-8?B?UGZQSElJTjZaZXFETDZLWEUvSkE5WEJ4dE8wZ2JSY3VIRFJ5bUM0TXFJNVY5?=
 =?utf-8?B?T0FJY1RidlJCRUswOW5sYVU4UVFvV2M0anp4N0RKczViYS9jRXNScEIzOFFx?=
 =?utf-8?B?bDRmYUNadEIvRTZ0RGtmY2QvaDRVQ2U5bXFhNTJwNnIxaU9RUnlHam5FaG5C?=
 =?utf-8?B?WDdoNEF4VnZ1OGRLTGxib2FmRFYzUVlxRWJOZW1LQ3Myenl3ZmFDYWY0anJ0?=
 =?utf-8?B?N0wvdW9CZGxENlFKM2NsdEJDSGg1SWM3Q1Q3V1NhQ0wwN3JBMnJSbDVSMHo0?=
 =?utf-8?B?alExZSs5bDk4cjdLWTlNNm9BSVE2cWhuSmU3d2xUZDRLcDlydG9Vd0I3TnJX?=
 =?utf-8?B?Y1plSlk4SlZIOHZWQlFrL1kvWGZzWkNETTlRcENiazhBbU1jZjJtYVBuWVFt?=
 =?utf-8?B?bGRqS25USkU2MUNHajBRM3NwUThYaFFaNTlIQ21oTjV0Z1hUZElxYUNKa0lQ?=
 =?utf-8?B?M1FZVERTK1pGeU5RM2VLVmQ0YVlKVHpXOTliSmpySDIreFN5ZDIzRFlPWXlE?=
 =?utf-8?B?Nk82U21ES0dSYWRaME52WEhoK09pN1A4MjF0ZEZZZnFBeXpmL3lWak81UWZh?=
 =?utf-8?B?RS9NcXBRb0s0R0JnZmhrUTBJMTVNc0YzTGxRMFlEY2JqQ0o5bzU3M1F5c1hs?=
 =?utf-8?B?TzlqTDZxS09hRzB1QU82Tzk2Z3ZONU43alFlS01KUzAzRExXS09rTVNmUzV1?=
 =?utf-8?B?cHZTSE1GcFlnLzg0Z2IxRHhTRHVZWUMySkF0LzRLdXQ0REEzbFlYWUNxQVJZ?=
 =?utf-8?B?QmtpcGZpSU1xbkk5YkpWUjlQR3h2UWh5UkEreHZaMVpmdVMxWEYya2NCalJs?=
 =?utf-8?B?M0c2NDM3ZFZQb040ZUV3NVFkTmRSTnk1VzgvTHNDWFBubGs0Q2Zmdk1tMU5N?=
 =?utf-8?B?Ry9RVWRSQzYvUHFCYlN2bSsyNHJpb3o3VUVuMW9ocDNsZVFQYi90MFA0aGQ5?=
 =?utf-8?B?MVh4MU1iUS9QQmJINW5IbmVzMFVnVUZlVUFxMVZIL3NKWnpSaE9Qci9GTndl?=
 =?utf-8?B?eFdYdVNTQU5iUWlqWmlVVThwMWVvSWQ5U0VFQjBuaHh6a0xTR1BncGlZUWVH?=
 =?utf-8?B?Nmg4VjJvRi81MzNaOHY1aHpqRTd6RnhRbzYwUXRNSnF0QTg4OHM4YnpVKzQw?=
 =?utf-8?B?MFVwNnJsdEhEaDY1WTl6RmRGemhpUHFxYm1LSXcxbEttbUZtcHZHVTVQaUxK?=
 =?utf-8?B?YThBSTFhR0FJSWdPZEVEVmhOeUxlWHY5M0JEM1dENzdab3RmZC8rZUxrWHdq?=
 =?utf-8?B?ZGJPanNYdVRSczRmU0N6NGNBSlBOWmg0L3hqcGxPTFRXb1p4Z3c2bmJCSklh?=
 =?utf-8?Q?xdPUdprr6g36isBE++/mCCGBrI08qYBNHEaq7pb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8bd6e1-d52d-4f4b-06a4-08d962964b4c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 22:19:49.9294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9kfHwcYk8xIyOFQyMh7b6vGsTb1k7amsts7v5yJfG5ej2a3xTbHr5owi2zhVUQuVuZN57kjYsrmuIAascD9hyP0/aP9bEmPmJ3kwMSwcaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1484
X-Proofpoint-GUID: M2gEbmfgZJ7bwPVUIQP6zGES_zHfimpH
X-Proofpoint-ORIG-GUID: vUNRa9Ug2I9niCP3D9ZDde12ykB2MKR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-18_07,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180134
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-08-16 12:14 p.m., Khem Raj wrote:
> On Wed, Jul 14, 2021 at 6:42 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>>
>> Adds the command line compression tools which are needed by bitbake
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/conf/bitbake.conf | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index f451ba6a47..3801db7d42 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -484,12 +484,12 @@ HOSTTOOLS += " \
>>       [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
>>       cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
>>       fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
>> -    head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
>> +    head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
>>       mktemp mv nm objcopy objdump od patch perl pr printf pwd \
>> -    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>> +    python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>>       sha1sum sha224sum sha256sum sha384sum sha512sum \
>>       sleep sort split stat strings strip tail tar tee test touch tr true uname \
>> -    uniq wc wget which xargs \
>> +    uniq wc wget which xargs zstd \
>>   "
>>
> 
> on ubuntu 18.04 we will need
> 
> sudo apt install zstd liblz4-tool

Michael,

Can you update the docs for this change?

http://docs.yoctoproject.org/ref-manual/system-requirements.html?highlight=bzip2

I don't know what the package names are for non-debian distros.

This must have been done for the YP AB cluster but
maybe that's done manually?

../Randy

> 
>>   # Tools needed to run testimage runtime image testing
>> --
>> 2.32.0
>>
>>
>>
>>
>>
>>
>> 
>>


-- 
# Randy MacLeod
# Wind River Linux
