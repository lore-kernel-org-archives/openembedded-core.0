Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.70])
 by mx.groups.io with SMTP id smtpd.web09.7845.1615737341251955407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 08:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HXBX6BgQ;
 spf=pass (domain: windriver.com, ip: 40.107.70.70, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1iumcpF+bt9CbcH7oLQSQZsv3hUTGSC840xkqfuRxS06x6M7W4GLX3mSTRyGc06E2zuQZL3AYEwJdUv2SZQlIPu2UA3QVX8z9Ox8Q5/eb9AmfTVZZKwyzgSFVMLCDdDj6W3j2mxiHM+gf9nQfISB9dn+ESGgyJcVflJ+bjiU/NDNu7K28sUE6QzYdt7cN4exJOU4IMWUKsWfxrnBMaV8kCf8/vARfpfFSG9+juGGHhLzZtVKKxV53hz38tJX3Vbl+BpayaqXR5aebE0DIOxLAoVnlmLvFE84SX91dPXz9ecj0fKVE5fbZ+LUTwFOwkxiHQpGaQ5gZCexQUUDlwSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8kH//+4VNWczSqqhgfkoo7vR62+tHk+EYe2vb3T6g8=;
 b=ebrqIEa/3L1VEcHzok0kV68YWxEzFT5EHXCRbwto+lhl9U0/M2FjUjpBNV2lQ8eL64j9MTLBzJ3COxVMH0If109WwNiizpXubic/G2o4k81+/yedBEb9hO92xwCU70++rzyepxrgShUOBXtJu288YTMhBBiY2/wCMykYp45BH8ReeMxquINzsZmaG6qeNPA+vXfaUk4nvmv7uuLuTWtTVd0Ag4G/QuDXcqd6QNrGnU0XdG/gs+PD7EwH/pTm+3S1vFyrVEaOE4AAX3RTDJQsws4HxKP5rbEfFJJeMJVIqVv0so5EVc/cULpJ5VBHXlyGgRiVS/Dbs78GLXNVCB49Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8kH//+4VNWczSqqhgfkoo7vR62+tHk+EYe2vb3T6g8=;
 b=HXBX6BgQbBEZV/HmC6dRcoYSN3RlThLX49y1mV2iGv6HIwOfFuTPZQDi2F5t0baS4+yUEOIpSb5kv+RZhBdu3YllBqrGsmZXq/R/C6hkrhH6VbcovAj5sW+jgcMhmxc9WK30CBqI/vpjWeC+nz80qA+FIsIatQIE3FR8Z+7mSxk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3196.namprd11.prod.outlook.com (2603:10b6:5:5b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 15:55:39 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 15:55:39 +0000
Subject: Re: [OE-core] [PATCH] zstd: upgrade 1.4.8 -> 1.4.9
To: openembedded-core@lists.openembedded.org
References: <166C4048879419FC.15707@lists.openembedded.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <a366dcf8-14dc-68c2-b56c-a6a661f73d47@windriver.com>
Date: Sun, 14 Mar 2021 11:55:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <166C4048879419FC.15707@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:a03:33a::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sun, 14 Mar 2021 15:55:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbeff790-d030-4bc6-534a-08d8e7019d42
X-MS-TrafficTypeDiagnostic: DM6PR11MB3196:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB31969B15E5A62732225C9F6BF86D9@DM6PR11MB3196.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	orpU/UtZuS7YfP2aNuVeDgXP1YwPqsmBH8EzrwBXudFCzfVN4Atx3jqW2qcRD9bTWEPNuKDPVNNhejIud6JeR4f4sGJoGd1kBo/f3CHuZwAQ3FBEc1hCTGwrUCYnzpcCl2oqJXkwLkhnhhdBpl6CfBZFDVaJA5WM3+jKar4L4mNmFAqxzxsAUoaGJII2jQunW8bx8Jt4epIMdkPzqEnzytnEyDLkKbZq2BT6BB3h+suT5a04XZVpPIJcAuwNp1WWIwlbIu/V4C/avA3XT/JoyTHzqx9fhUJKkm3doTjkOBXpj7GdY4TYF1YIzRWZngmqdKeYBdicCCB2d+kKol+N2aJNxKZ7O/qj7wZ6qsnfCpHOtAqWdPKVEmNVatYnI+a6cqlDtVvjG9sese1g7/fmBoKTW8wea7xJWUc+hD563e/XHj+3yhCsZEQHSi3X8Bjy1y4i7fPmZSxq07HXB8OmO4SGgbpEO7ITHCPkH4D4D0WEmY949QV9D6lXv+C4NAltHa//0SnRxtnn+Fh7R321SPioZUm61RlypAw0jJHm8QpK7UxG3IlM/tuaQrA+iGXe2NGVRTFU/8UmfeEflG2MEA4yqUFDQERTvOgzZNZoKXXNvl2tB9hiNK4q35GhaurJ/AUBYVXLujrW3BTt0dt9Ng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(346002)(136003)(376002)(396003)(366004)(52116002)(5660300002)(86362001)(186003)(16526019)(66556008)(2616005)(31696002)(956004)(31686004)(2906002)(6916009)(8676002)(36756003)(4744005)(478600001)(16576012)(8936002)(6486002)(316002)(66946007)(26005)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UWtWN2dyODY5VThhRmZsT05UOUlabmhTaGxKaEFGZ3ZQZ2pNRzV4SlBFeHNL?=
 =?utf-8?B?ejE4ZlhweWxoRFFrY0d5aThubElGaHpKSVFVcHpIaVlhdGpzL3pubkxxUlcx?=
 =?utf-8?B?MC9WekhoRmsyRGNzODhRNlBoaEJqQllUQTVTS0VhMzVaenlEWkxoSEF6cEZB?=
 =?utf-8?B?MmYxYmZSRjNFUFE5UkZwclVFUFROSldES1dyQW4rczRIZWlHeGNaREx4Tk1Y?=
 =?utf-8?B?M0RCTFEraDFmQzljcysxdUNqWlN4OHRrNVlvZExCOW43bGxEdUdJT3NGUVVk?=
 =?utf-8?B?Q0t1MlY0RTBkZng4ZmhrVWNIcks4WmRiWVVOQUExSkZWSVhoZkNnUlU2b1c2?=
 =?utf-8?B?ZXROSE9uTVdTRlhibEZxd3dzZDhsTXdTdWxKS2pkK0lOcjBLZjdzYnMzbTlJ?=
 =?utf-8?B?cEQrZHhzN2xJMlZURjdOWnpCTm1FaWFjeGNSN1VHOUxBN1ZQeE4xeWdTTmU4?=
 =?utf-8?B?NUFyd3NOK0lMMythREFRTVUyTUdIZ2RrTFJUVmE1RTVyNjVnVWdzYXdTNkVQ?=
 =?utf-8?B?TDVrZWxLOXFmU3ZMS1JtaC9SRjBjNVZEUm50SjFqc2tNeHVVVzNBSjlRbXF4?=
 =?utf-8?B?d28xR2tVbDYyU2htaytWK05Qdk51T1l1b0JnaFJsaE1FZXRrdjFSWTZ6OG9I?=
 =?utf-8?B?eWlPTU8vOTR5dnYwYjhDcDVGUDA3bGFDWXdmK2dwbzc4Y3lBTytqUFppZzVT?=
 =?utf-8?B?N0NBQWM4YWhZaEdLSy9ac1hkajZYdWZKTUlDMmdoOXZudzdxZ0RoVDE3Ymx0?=
 =?utf-8?B?Tm9HelV3RTVDZnQ5cC9LR2xZMXRHK2gvaW9TZ1BVb0hhVHk5VnJFbC9VL0I1?=
 =?utf-8?B?Qi9IbitJbUtHc0l2MEZyMTBqN1p6dlR4VXNuVEQ2NCt0aGtRVnYxcWdzWXdO?=
 =?utf-8?B?ckh1RlM5NWJyYlhrMXExcjRuZ1ZGbGxpVkVhNG8yWkgzWTlkNURMMkRPcTgw?=
 =?utf-8?B?eW52SVVHdlFWMDB5OHVhTzVCQ0FkelN1ZGdiZ3hhL29oNkRXaUVYZWhMa1FJ?=
 =?utf-8?B?elZPbFBIL2ZsRStRNDB2TnpWdFc5NzlXMU1iNXltblNNOWlBTGNDN1lVSlZm?=
 =?utf-8?B?dG4yamM5ZHdwUVNHMXcrOUdoUHpYY1h6NWVzVnZoaUdaMnBVQmYyektwWG1P?=
 =?utf-8?B?UUt0dk1VbkpoekE4OG9aMWl3Rmsxc1NCb3JhK1JiSkVLQUxjTnA0L1NJaE1S?=
 =?utf-8?B?OE1oM0orQmx5V1RzSUUwSnJxZjRRUFF4ZjdEUS95TDN6YjZpdTJRNk9WZkkr?=
 =?utf-8?B?c3h4cWk4VzVvbllieU5tUE1rWUVIckVoWVpna1BZVTh4SkNxcVdFMGtIL0Zq?=
 =?utf-8?B?dWJ1UmR2bU5JZWszL1IxYUc4VFVUU2pFZlpFTXlKUlJCQTZqcDVxMGVRc1Bz?=
 =?utf-8?B?SThLRHFLWEMvR3lUR0VsdTR5cUlsYkZlODAyQ21ZS1FId0VuQWhleks5ZVd0?=
 =?utf-8?B?d3BXckpxMFNWZHBkWUFXejZ2VC9PL2tub2N6OSt2MDFuTkg2Lzlxb3VXVXZM?=
 =?utf-8?B?eGZzVkx0TEQ4cG5rVWRXTno2OTcrd3lISzFoNmkzSmV1L01rNFg4OXhIWnVR?=
 =?utf-8?B?TVJDNWpRNVp1ak1UTjFQa0hnRXF3WnRlN2thYVMxZnBhSm1ZSDdzL05rSjlF?=
 =?utf-8?B?ZW5FaExPeklsZkJkUjcwZURiUSsveG91RVB5MzJyNUdnK25DbGJ6K3FhaUt0?=
 =?utf-8?B?a2ZwOFYrVTRHUnZnTFV0S21wSk5LUXlobGNFcXB5VUwyVExCSGZoN01XZklK?=
 =?utf-8?Q?7I2SQ/JYkYYBGL57Szsu7cBs4kY5CJv6DBVesiA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbeff790-d030-4bc6-534a-08d8e7019d42
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 15:55:39.3567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwSEYC/l4KhTQ/cW8VaLz/ALPxD7/3pwahLMMY4xWUmnT0Td1fR5JGIigNLHJfGEYG7B/QALm6rgYOyqSuO+j6ATiXDDPGrhhNsusAlS9z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3196
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Same build problems with musl for qemuriscv32 and qemuppc64
we had for 1.4.8:


BUILDALL-QEMU LOG FOR zstd
START TIME: 2021-03-14_07:52:52
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-62-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemuppc64
PASS: qemux86
[musl]
FAIL: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
FAIL: qemuppc64
PASS: qemux86
===============
PASSED: 20
FAILED: 2

-- 
# Randy MacLeod
# Wind River Linux
