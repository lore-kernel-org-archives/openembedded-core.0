Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.57])
 by mx.groups.io with SMTP id smtpd.web10.1865.1617911275200607328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 12:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BLS+D/q2;
 spf=pass (domain: windriver.com, ip: 40.107.244.57, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7MMr3/l15/o/FKkUhb3K118K4wiy3j6LHieqpkbURLRHgPCVq4VmvIo7ycYoWBY6p0/qAuSXkC6OntEfuvD635kwJL4Choc7fEe7alVbmVGw3JyHTU8WjkeVRsPefjsIbYXZNMJr/uciuBtJw+Rypb3hG5q2iLmhDdDpoLRzAIJHx+UFKySOPDgw5YW4e64QYeUrtVzPtseJioNvlC1mMbugXxYV3l9+Uha0ub+d4V00IAAnFqN0bAVwX0Wy/mQhuW41wtJmWa2WYCnVnBkCi0K0/PXffLrPWqygawH7b50ObpKlOgAdYC13UUxPy05HcBCQPaXfos1VJyjI7m1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZBhsKcDPp2p6OD1q3DvzHZE7ewXSzNjwKLOFXWBPX4=;
 b=CvXiMJp4MWk0PU7xcwcEj7ZyPNwzPBvxDv/llqoH/jCi5iAe5/2v/4qE4ZXShizss+EqtkIoWgRCgEn8ZM6bZJ3e2hKgeOeYHtIu4NVS293VgWB7Ls5vJjhbwQW/gDkyR7qazOHYFIiRMxL2M4q0z/ujeHuCvZW0tdcKwDMQarK5jQMfavnyLfAlUY55JZeaQkCkb/h3vi5lzHNJQBgxuRxbvxlWL7z3Z4wq/9dOJnlfQ2OP80cFMtOyBRmqYfZ9EZzzwsOVzpv7iL7kvgwNBI+BxH7KuhFlRb9J645YHFmj8GDJnw1TrRObMFVmA2apFgzPYSTI1kM7UVLy9SeOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZBhsKcDPp2p6OD1q3DvzHZE7ewXSzNjwKLOFXWBPX4=;
 b=BLS+D/q2WWTqNkCpr6LBKAsJQUq6D7SZbYgzhLKmEQtMt737zsNEN7MS0Kgeev7He6M8nalPTNMG8vNVpyjajiCoJbg+SKH8MVqROeItfROMfY+Y2wKfdxQv7xetaRUu+Yum4kybxgolEFONlYzauP46exNZEZzntX/QIy8iAt0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3165.namprd11.prod.outlook.com (2603:10b6:805:c0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 19:47:53 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 19:47:53 +0000
Subject: Re: [oe-core][PATCH] Revert "glib-2.0: add workaround to fix codegen.py.test failing"
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <1673F62DB2057131.21724@lists.openembedded.org>
Message-ID: <a341c1dd-df77-881b-e01b-dae536b6df2d@windriver.com>
Date: Thu, 8 Apr 2021 15:47:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <1673F62DB2057131.21724@lists.openembedded.org>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by BYAPR02CA0004.namprd02.prod.outlook.com (2603:10b6:a02:ee::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 19:47:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d9a82c-8610-472a-15cd-08d8fac732aa
X-MS-TrafficTypeDiagnostic: SN6PR11MB3165:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3165BB0354CC6ED042B4405D80749@SN6PR11MB3165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0INN6Khn/RWMDqWII9kN/gTwSTAQIPGrJCxSrNYak9PzEC3jWADtqZm9ajyCgN/QSAznzeMLIQB9rvBcnnrsLQKlrHFZ7o4K3n9Qyjy12Yn4eHbZ5O3zbPygZKDBUIZfE55rQm4wjoIV79mSY3QC+X6bZERBXk6BlX26Sya3nKWPLs5jU71rqTPiTom402wg/usl/Ci0roGehjyI2/iwdGtTdePga0iwKK4WiYq2pZOjG5fP3a5DuwUsfnOD7VerTnybG7WTqsTesa1EYYDzcv1HyPliM7NCnZSMtRs6rllKwPmpqb0NfS3BUKhOzuFGMWAAkNHDsjOd5iF19orHRSEfwJF6Vv+2sx8jFWcTVsYxQSPdYxz1BSx17y4V2nFfqciqG+2MUBocm4PsDIO/vnXnwPellx0uKBifJvcSSqzLu5lGtPJijh9ylI56SZsjJG8PWp1QH2IIddb5oyf1l8zsT2wQrT5sUtXIL49R/R5ipsFcbj28u9H4BUKx4tN7sTontZUUR7Zzv2py1k4hgQpcgG4ySByJAXXvN/+6RQaw/E2R33SAyz1kOG/TGyGjoj5ZF1aM8RPgB+LE1k4jZmyzfRMYbLgorfbgv+3Vc63I62RNh+cXQAElGmqCthVVqH7jAF9nElgSE09ELRNpQeilKZUSZCaOpiYNN+5rke3Eo9C9l6G94MWud58DAPpPQ7dZ1/l0KFlS3QXwvXjw2MY6xx/EfH3ip6jrAWRR3TCzGAunHSd/pJ3bi0s/wsWh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(136003)(396003)(376002)(2616005)(8676002)(186003)(66946007)(66476007)(83380400001)(6666004)(4744005)(66556008)(86362001)(38350700001)(36756003)(31686004)(2906002)(38100700001)(52116002)(478600001)(6916009)(31696002)(26005)(6486002)(956004)(16526019)(16576012)(316002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?djdUbDNZNWJPMUJqVGE2eGVaQ0RLSXB2dTE0eDdWSHExR25xQ0RWTllndGVv?=
 =?utf-8?B?UDJpUXdxWFVwSGxIODMyUmg0RklPeUMxSnYwOFdKSmEzbGRPRlBWb2hXdVpt?=
 =?utf-8?B?ZlRHU3lJU1krdWIwdUtaWUhqcDdSVWx6WjRHWnRMVkhoNlhLN1FmbWlHcDRj?=
 =?utf-8?B?V3V6OWdzVXV6eUt5TzgzQVN0V0RQZXVMM0lLaEdvczVjbmcrdFd2bGUwL3Br?=
 =?utf-8?B?WEh6Q1ZoL2J2NmV3WGhjODFsUHhoTytGSjNpWm5OM0ZNL1Q1Y0xkWEV4VzAy?=
 =?utf-8?B?VElucnM3RWM2WXo1RXZEUytpcUNVSlo1Vy9taXpQSE1mVU1DTktncXBXVkZ5?=
 =?utf-8?B?bjhxZ294T0RVb2NmZzdVMG9MdkF6V2xBbTB4V01XcldEVzlxaVhqYUZGK0Zk?=
 =?utf-8?B?VElUK0Z4ZEgzSnFiWHJ0MUFkdWwyL3VDc1gzWXdVcWFVTDVpaEwvOEE2S29M?=
 =?utf-8?B?aHFLVWlxejB3NUpNUkZQSDFOWk0wZVYwdjJmdVlmcnI2UkluUFNHM1laU1dI?=
 =?utf-8?B?YjRySkNRdnhiUUJzS2EyNzMvWEt6aW5aa2w3RElzbGYxMHovMldIbkM1Q3Bp?=
 =?utf-8?B?a0NWcHJiVkVWejcwWDVWdFY2TnkrSVVSdGlheUFMa21vN081UHV6NU1kbkpx?=
 =?utf-8?B?aDBWTWlaZ0dnODI3ek12OTBxSzBtYk96ZlJrdEhsR2pNOUpBVTIvTjA3c3I1?=
 =?utf-8?B?V3pDU2x6TmxQQmU2VW5wSTQ3SHJXTU9yaXFQNXJQaGVIWGRvUUR4NUR3RGxp?=
 =?utf-8?B?MFl5eENvK0hDaXZwZWdRWEFrc0haRnVVaVB6WjhNT2V3c2F2WnlEekM3T0xl?=
 =?utf-8?B?bEcxV0x6MVNCV1Rra1I2UExjbDFzYk05M1Q4c2NyQ0Y4YlowNkd0clpVUmNW?=
 =?utf-8?B?dUhneWRzdHlSSUdCVXlGQVJ1cUFVMnlhVDJUU09vR1BoczRzUlFhSGYzZW0w?=
 =?utf-8?B?SUxaVTNxYlVCQ2tsRDBTK0tid1lXWG01aE5UcGQ0K2FxTkg2R0d4SFhqUFNT?=
 =?utf-8?B?S2xveG1ZSTA2UVJGc0taaExZS0t2OXlSTXJGa28xbEpFK010amNDOUNpczJ0?=
 =?utf-8?B?UjMzQ1FubU1xYW91S3UxTmtvbmFRMjViL1pqSTF2RkRnWVpnSmtScXFpTmor?=
 =?utf-8?B?R0JhamdHN0FIcW9Gb0ZvdXlOTVU3RFZZU00veSt4TUYvSGxtQXZjU0piWXJt?=
 =?utf-8?B?ZnMxYnhEdGF3YVVaZys1QjUvUW4rTVpFQWpjRkZ6WXVFZTRtdTNJNXRCckRO?=
 =?utf-8?B?aDhmK0NQRFpKNTdPQnNpbmM3U1g4bkxOQ2U3SmVWd05Dc0dzeEJySDUxV2RI?=
 =?utf-8?B?SVBnRVZVN1ZRM3ZTYUY5M1ViYi9zUm9PUExEanhTcXlqNlBFTmU5VVo2Mkpu?=
 =?utf-8?B?ekRYR2pCajZDUmI0d3pQZ0M5ejBOQ1RVb3ZlSmtWdWJQZUoyalcweUdCZ080?=
 =?utf-8?B?VVZOUVp0U1VsajZaVXVBa3VaRkJOazhTQXg1eTRMMHJ1NGJwVkNMTFNwL0lC?=
 =?utf-8?B?eVdrOXJrcFZMcDMwOG5jZXBkZ2ZtN21CWU51UzdJbnJXMTQxTXhqWUIyQUs3?=
 =?utf-8?B?aHlmWmtiQ01CVmlXd3NLNDJmWmN0WkFVdXRCZmhHcjZEWk92WHVuamxCUmxO?=
 =?utf-8?B?SDlEK0ttMkt6VGt3Uzh3NEhpVmNUYjl1ckliT0s0VkYrZll3WVFIQlJQdkdP?=
 =?utf-8?B?VnYzQXdvMjB5djFMVTFvRmRyMlpQSi9zL1l4Tk1PT0tQWmJ4ZkdtQ242ZERC?=
 =?utf-8?Q?F6vm9Rs4DFW8ePJtY0d6TuRFzLMqESAEgIPtiFX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d9a82c-8610-472a-15cd-08d8fac732aa
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 19:47:53.1982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9NUPPrAS6e/lrZ/XLaaxLiMuycl+1qqz8PgoEeRWrb5jZPVQ1+16FTCbHFA2DTMvSovgsEhYITIxEsNepw0yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3165
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

ptest result...
Although I found failures (maybe due to uprev?)

codegen is no longer failing.

```
SUMMARY: total=265; passed=261; skipped=1; failed=3; user=1450.8s; 
system=1407.4s; maxrss=8
FAIL: glib/1bit-mutex.test (Child process killed by signal 9)
FAIL: glib/gdbus-threading.test (Child process killed by signal 9)
FAIL: glib/mutex.test (Child process killed by signal 9)

ERROR: Exit status is 2
DURATION: 3538
END: /usr/lib/glib-2.0/ptest
2021-04-08T19:37
STOP: ptest-runner
```
