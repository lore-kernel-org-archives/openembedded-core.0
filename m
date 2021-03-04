Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.85])
 by mx.groups.io with SMTP id smtpd.web10.1303.1614824730540381659
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 18:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K7b3Uirw;
 spf=pass (domain: windriver.com, ip: 40.107.220.85, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1jVG1CIQbAhCh4egAUF5dFwhv+Ty6fbcSeSy5ENbpovx0XCKvx9WBDQkkX+imO9AfCUegmcZHO26uiOf16p/3s8BPwvJi6WfuBha4/+c5TNRDwkC7nu6VL8+oXpaENP+0mqd+JHHS6p/vvS+fBYRRIi9ygVer+tnXJGzEHg6Etmy5JeeJLsUEUmShlY4deqgIyGvKpZQWqIJS711175iAnIA822UO7/8Xx0hQkvX55og0nM5olCxl3POQxTkrDfSoZAr1OI+xtG52YCCxccbfb5OlaLKzH5sjjTrqPi+QFj35kUFwFlWQpVYnjKIX+QAATnPjDu2yBS2YFvxm6n2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pctRg9bHng4wY98uHkuuEPEaNJFKF70lzXjZnv7e/Gg=;
 b=Qdu3XtoGLWSaVKFuEEk8us83ET2mzGJudLptiTwHHoNWC7A0igekaHEhIORnGxjxmwWvUCv5QGP+e8ktl27uJjzWpl877NMISNXP+dKmJc3345kWyunkk/vy27XHZb1k9vxnhWB0DxfEBzyGDhtiXfLKnfOVtVAlw9GPVKM3dW7JtijdjReLTkO2aSCAroM5aheqXgZo4jCxgEwBoDmr8UtP/BNJsXwelgjoxbTj7xBTdcW76wyoqehmY2SYJW9XGssY7UoZ+H7X/mz52FU5jjrd9F7vkJikr/X1UmX35avZ3J5QblEOKGb4rF/yT4H03XXlPIALHoNkaJq7BGcdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pctRg9bHng4wY98uHkuuEPEaNJFKF70lzXjZnv7e/Gg=;
 b=K7b3Uirw3qmk3m4ZQit4NJtCEAfAB26h+CFcxwgeqxtZjI2EkEHrInoUzh/9oJeA2i5jfURTZukddB5aI2hZQQjY21zNqMvRKI/VK7bMFVLP5V+jMFTBe/RLkYlJJAvRhVo/HpDp+q51GsN60uqHBqyOoqnmMRxNcwhBZ5y8WHk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB2919.namprd11.prod.outlook.com (2603:10b6:a03:8d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 02:25:27 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 02:25:27 +0000
Subject: Re: [OE-core][PATCH] lttng-tools: upgrade 2.12.2->2.12.3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210303061555.40835-1-yanfei.xu@windriver.com>
 <CADkTA4OmhPPijicVGb7Vm6WB6GKxtAfEPOsUo9MsVcOANnZLFw@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <6ea3213f-19ef-e56e-fca4-6f806dd194de@windriver.com>
Date: Thu, 4 Mar 2021 10:25:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4OmhPPijicVGb7Vm6WB6GKxtAfEPOsUo9MsVcOANnZLFw@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0159.apcprd02.prod.outlook.com
 (2603:1096:201:1f::19) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR02CA0159.apcprd02.prod.outlook.com (2603:1096:201:1f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 02:25:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2cb2787-2fdc-4825-118b-08d8deb4c5ac
X-MS-TrafficTypeDiagnostic: BYAPR11MB2919:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2919C6254B5847D4223065D4E4979@BYAPR11MB2919.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3eXz6qRFNubC4LBavLhLbNb0bTyZnVsOocX5NkLCzsOehuVkGaxx39i1d5QJnTRwnlmK5/3vuYqSnyhiQjzYeYUeoli9I4q2RQc3AwbfW7oD46PaygeYfWcrVr2SENUYwuYtYiFSlYsb1v5i/BoQpN3yX+mW2VUtMjwfZ5rwwlOi5dGHOXysBmRwI9cu5iN0OVABApO2+oIJ4TpbWJFC7BUMfDDwhwWmOY4jWMm+etqXN+Wl6MQMgNnEWD4m5QIx9wr1Jx1vvWXobNuoOZt9xCbT7Gn9QZZU7ArsUQUPYorntHd8GB83Hbqprmg/pN0ydv/onuTO72Z4Nh/dsQZnFT2AcoEQFaJnzKKQpxjO4ZiXE0bSExiYEGz3jXbvpX0K8r5aVQEpn3cQ+A0k9o7iHQJFNrvugyix28ibk8PgwGkYdBpgw2GnAc+Yo5FYxf9DGMerzUU7OwnhMP90ZAGpJEU+03aopXYzmo6w5nrvrCnTcNKI9ZMTs9PVyn7AyskUrwQpR7EtxTOgx1wevQKIJ/WKDuuQEMSz8/LQhzmN9LZ4dOuxkXETD3kygvQyg0gIUy1h4CZ2pOzZpkj33Ao54qJat9zjn/xgp+paiLNNLaIp3BhUyUKpWPkIaqwX3ZBvWy1Xn63JCra1/VqlL3B/asOZYwxxz+JOI0Mb4DJCQvj9nTAC7dm92RbCjLQR77cFkk/72Re15axlTdLyxRnN+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(6706004)(66556008)(6916009)(66946007)(4326008)(16576012)(8936002)(478600001)(6486002)(8676002)(66476007)(316002)(966005)(5660300002)(26005)(186003)(16526019)(956004)(2616005)(31696002)(86362001)(36756003)(31686004)(6666004)(2906002)(83380400001)(52116002)(53546011)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZkFseXh0dGJubm1OTFZBUCtDT2orN2cvZmQrRTFYVWpDVTJoVGI3OVk4S0Jk?=
 =?utf-8?B?SjJqeWpJaFM4ZSsrRnZmWGkxT24waXQ1aUsyS1hxbHI4aEp2ekQ1bHArY3h4?=
 =?utf-8?B?WmxMdUxYekcxRUxNNkNZWXVQV1ZXUENRY2I0V1hJbzhlQm9IUERrK3E2Nkpw?=
 =?utf-8?B?Y1FHbEFBYzQxbTVsS0pTaERNZDNFMTRyeWh6ZWgwdERxL0tsdEkwQWxKR1Va?=
 =?utf-8?B?R1ZPTlhNd3Q5clltWXhWZEExUHFNV05veEpvMFVleVAycHBxN1RnNnk2dnNl?=
 =?utf-8?B?dDMxdmY2dU96OXlPck96bnR2ZmljMCs0NGlQNjd1dEVpRmpiNS9BZmNZK0RV?=
 =?utf-8?B?RDVMamxuZjJDUHR1WEVIRUxYOXdjRktqa0lEVzc4SXdaMFc1SDBZRGpMS1p5?=
 =?utf-8?B?dHVpbFNlTUhuWkkyQ2szOEEwRkZIa2VvM00rMjJMZHR5VjB1MVRoZlp1YjA1?=
 =?utf-8?B?Zis4T21XNDRrd0JKbkhBU3NNbmV6WnZqTURKYy8yRVBrMlJjcnd6SFAxMHdQ?=
 =?utf-8?B?eXlCaVA1VzlOMEphNTBpakFoYk9POURRYXJzTHZrdXhSaTJSelltSkJsd0gr?=
 =?utf-8?B?Z2lBalY0ZkNQbmFTcFZRYmJocXBhejIvV1hkVVVReWdaRm1PL2g2MEo0Z0Ro?=
 =?utf-8?B?MTFTM29paVFEbnEvUWplOWZjcGsyeHJ3N0FCOXhhTDcwSmZLSzVieFZsV3Fj?=
 =?utf-8?B?amhVUG9BdktXenZMZFQ0c1pRZFpKc2lBejA0K1gvK2ZKRFhvSlg5QXIycTFh?=
 =?utf-8?B?RU04TDkrVkZla2lkd1RkL2pFR01LTlFSc0U0UGFKQ3Y5dVQrREVDUUIwOHhu?=
 =?utf-8?B?WnhPc1ZjVHZ2TFhTZG12ZGpwT1hSYVNJZDZjZWx3eVJLcW0rbTB5QUJ2bG9H?=
 =?utf-8?B?VlNvbkFPTXcrTVVPS0NRSTVDbWlrT0hrRGJNZzVQU2srUDdmVnM2Y2J2dzZt?=
 =?utf-8?B?d01mU0tsR2hmMnFkWkVvU1NoeUpPV3VpVzlpVFdOM1Rhbk9JdzNFZVlDT2U5?=
 =?utf-8?B?Y2UvZ3VDZTFSYkRha3F4NnV4dTNpQW9XQkVBS1AzbFcyY0NNK00yeVJ6cENR?=
 =?utf-8?B?bXdnT0pXSmZ5MEpLVzFQdGpNSVVxOTZGYmlnWVZpQVlXMmlFYVh6Rms3Qk9W?=
 =?utf-8?B?Qy9WR1BheHdQZC9aRklzRWswS0ZZaENDbStVa0VndlpyTjdSbGxDbGJXNXkv?=
 =?utf-8?B?aS95TEQ5VTE1dHh6dkVKbWNmYmdMVEVWMjAyUWcvVTJyZFFqaDJ3OGVYVVVV?=
 =?utf-8?B?NEtSWTVYT0FsNmtQanc3Wjc3TG9QcFVPWjltOHV4eVZpR2JSOGFGM2pWeGVG?=
 =?utf-8?B?Qzd0bTN0Q0NtcFdqTC9DQ3I0bXB0NWRZeVJoMkw1WTNST0lnY0t1aWtxYWhI?=
 =?utf-8?B?MDdQNm5zQzFNTEJIY3dDYkdldjlENG5wNzVLa21aNnFSOG9iRHBWb3BKdmpD?=
 =?utf-8?B?WGsxRVdJSmlJcGZ0M3FyQ1Fjb1JTT1NGWlhoamsxSUdKQ00wYTFhRE5VRzd6?=
 =?utf-8?B?K2ozbldodlMwTlkra0ZEUSs1K3Y3djU1N2lhYms4bTU0N1pGcjVxNStrT0pp?=
 =?utf-8?B?T2EyMHZjNGt4M3V0WVppYnBxRTh3ZGhKTjgzQlN3aHZsazdrRU00c2l1Ym8v?=
 =?utf-8?B?K1lyOGJ5QUt2cTVMVHlKeVY3M1RNenFMTlpYRFJVY053UHNmRkRRN1c3eWlZ?=
 =?utf-8?B?OXYwbFZsM3hNemZZMkxoc2ZPa2lDOWhWRXZkMGx0ZnhRZnBaSEQ1b0VUVEVY?=
 =?utf-8?Q?Q2Up7RES9XSB17mA/dJY2UFoHsMXdephsJk7Xp1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cb2787-2fdc-4825-118b-08d8deb4c5ac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 02:25:27.2318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFgRXchXh6nxuq1dcv2aeWezGSeEvp2dp2vtFsLeaEltzKLccgXcd10CbtetY1CzO67HqtXZVpBUPwdQ3HmXvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2919
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/3/21 9:10 PM, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Wed, Mar 3, 2021 at 1:16 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>>
>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>
> 
> We should get into the habit of summarizing the changes in version
> bump commits, along with a comment explaining if it is a bug fix
> release, features, etc.
> 
Thanks, will do it in v2.

Yanfei

> Bruce
> 
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>>   .../lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb}      | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta/recipes-kernel/lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb} (98%)
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
>> similarity index 98%
>> rename from meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
>> rename to meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
>> index 0787e04d19..eae95da2ed 100644
>> --- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
>> @@ -37,7 +37,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>>              file://0001-tests-regression-disable-the-tools-live-tests.patch \
>>              "
>>
>> -SRC_URI[sha256sum] = "9ed9161795ff023b076f9f95afaa4f1f822ec42495c0fa04c586ab8fa74e84f1"
>> +SRC_URI[sha256sum] = "2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153"
>>
>>   inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>>
>> --
>> 2.27.0
>>
>>
>> 
>>
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
