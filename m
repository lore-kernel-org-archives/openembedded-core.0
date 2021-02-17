Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.53])
 by mx.groups.io with SMTP id smtpd.web08.2523.1613529620429225740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 18:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ieFQaQwG;
 spf=pass (domain: windriver.com, ip: 40.107.94.53, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOxBWAGsXZUYl6CjYtI3utDS2/zjfMcnDdqp/3BUJAQtVc/sdqroFjgEySCHZ/XLJipNX/jPCSBVYYxWcAuQU5PNvLgIZZhbm8vO7/jxZLPhcX8zepYn7WSvrtufe/ilZ6KYm9dcCCqOJVf0s86H3Dk8gI980R3y1ygVg3KI/RDgXU7AiMSaVauC4p+C+j74Bw09bwaWUFA5cYEeCOlKrSwpjlz1kQy3cjqLQzSIjLG66zreJ0TTdSDEvSgK7DNqM+guW3hkMDNhXA6diPNX19J8tYJ8Zb7VhxxY50cSCqv5YsM8dlFsiQI/8e3Rz7Tb5XQnM71RDZbBeAZLl4PMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pgc8ZG8UBnFkD9LJNY6O3dOlrP50RKQZScYwrodijOs=;
 b=GLye+vRHuNRIxAdO2A+vu42uBXJ2S2s/PQbdGbY3csf/2tixf1WdnUdX+clvc/JA3ZKPXs7MxIFl+929IBz6BBa/xzvqkCsajtSc6CNFu+qMLzabJ4CMZmOSUYQF1Xe2xJanUjs/k7hDS07Ntt/P6DPgCo0NZlAK5bigzUkzuuGzCxHFJ6VV4rpQkrLFfDCcAnxR4eOXd59AXO+mHinLuaE12HvcARYIu7ZXdYKTgjJPVrlO31jrYbherQyGUbbmLyYiw72IDRBGO56De6iyUIB1AwUQ1o2zssNpPq9zbuI/T54l0QkIZbtfFsUzDi6fb8G0tzSZ3+y71rdhaOj8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pgc8ZG8UBnFkD9LJNY6O3dOlrP50RKQZScYwrodijOs=;
 b=ieFQaQwGJIrzkDEqIN4Oj+wHAEiCb9kHpKSI8OVomEBBQcztR4rHBTZTQKAPChQk65HqKTPpUPDSU0t7l4noks2eyvDgcobc17PQn6xumXCA9/HVpvRwJ87ldyEkRjdrAzWtCiAfhUhp76mHYLeahO/78c+hkFfpBHkmNwNe9Ik=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4073.namprd11.prod.outlook.com (2603:10b6:5:19f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 17 Feb
 2021 02:40:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3846.042; Wed, 17 Feb 2021
 02:40:18 +0000
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
 <schnitzeltony@gmail.com>, Vinay Kumar <vinay.kumar@blackfigtech.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Subject: meta-rust -> oe-core
Message-ID: <e9e8693d-2e4c-40be-55ac-37ae001ec7b5@windriver.com>
Date: Tue, 16 Feb 2021 21:40:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR05CA0069.namprd05.prod.outlook.com (2603:10b6:a03:332::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.14 via Frontend Transport; Wed, 17 Feb 2021 02:40:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4050262c-0c81-4d2e-5055-08d8d2ed5cd5
X-MS-TrafficTypeDiagnostic: DM6PR11MB4073:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB407310F99DAD2E73DC5797DCF8869@DM6PR11MB4073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UvtgwXZ3XU7B284TV/Fw4513bDYT+MsP/WbUL1hE8W7jou1mj+fzSGpmQipucuqoG9JamupHNp33H/sjwcputhhNe8ULljS+xA7OsHOmqZL1SCaHUQWF7Dhp6M1zI2QaGu59nWoA5n52sSvbJTShybFuMnqGJAZ4+vp5vxY0ej0P162/tHtdJaOQK4Eg/PsGo3Q26YwisKfQ571jtbpoZ5H38sQT1rGYJSetMxEjQF++k17wicg+1rsVMxNUjMpEMNflttx1Xsx23LSYRROug2OLveS4QzFYZGeWlcGDIIcQVFcpzh8Sv0LGqilnA2Mk9jRauqCxk8mvcPNh5wBXbPfGDiB4fy4juQQmqVy1N2W/JDutLR1cF8aA501JpwZehOOCApsLRa1FnbNdVkF1IHAxzB7S1ezjUKhrBFcF+NE+9PSqB74LUiiY5UUYnpt1m2n3sgI6kY42kIidN61y8T7IB78g25cM99pzX8fSvgAkTTxm2NXfI9wAN5/dZhdkDQuXMQ4Uy9xVEAx7TRmFNzqFQUujO8jpukxHdquFqF8EF++9cHWEo21lxq1Xgrago/sUs+TTTqr/gcdcJY0N6rwq4lItw0niOXoifPZ1YfEfLrcGA3csCu47RaqkbuP5TygaY1c5U5Ax9xKrjUsZZYkb9vGYNCrsoJ3EWS3CazH89NUvq2CTWQVcZqk3cFqT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(36756003)(956004)(2906002)(6666004)(6486002)(31686004)(16526019)(31696002)(83380400001)(26005)(2616005)(16576012)(5660300002)(66476007)(86362001)(186003)(4326008)(66556008)(8936002)(66946007)(8676002)(478600001)(966005)(54906003)(316002)(6916009)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?M1VQdkl3MTZSLzRJeTFyU3c3bnZqVjVYeWhQWkJwUUhSNTJNekNYZllYV1U1?=
 =?utf-8?B?M2ZHbDBCL1NpWHZsODA4SXljNDBUNTB5c0xjL2cyTlZJdW8zOXRNNFBpK3RS?=
 =?utf-8?B?cDVFbUF1MU5sdHVhT3huaDJOeU9XdDBBa002dzdRTzAvN2RZSlMxbGlzbkpY?=
 =?utf-8?B?dXRDU3Rsb3V4dzV0N1ZOS0x4d1VPR05LU3BjQTlWVlFZQzU0NHpFZjJITVEz?=
 =?utf-8?B?RmJabXZHS1NpeG5KalBkZG82SmkxSDU5YmZESFVIaXpQK3poQjJOUGdrdmIz?=
 =?utf-8?B?a1ZqV1l3Yk52cFBvTFF1NWJMdHQvNWJtNVZoaVB5dkpuRlh5Z3RZNkNBU3p3?=
 =?utf-8?B?anIyUzNrWVdHTnJHY05SS1BsUXRjekw0dmUrbUtRaFRzbVFKOGFQYVNRL0NI?=
 =?utf-8?B?RytNNXRtd1BveHpEbW5YTHdCeUp6QnZRZWtPbElvYTlyS2lhMzJ2RUhLMXcv?=
 =?utf-8?B?V0ZCTUtMMStLVnNiV0FYZVRFcjJZNVFoSGs5MGhHMS9iWFdaNjFmeDhqOHlS?=
 =?utf-8?B?QUkvYkFldnhzWU5nS1kwTVBNQ0tvM04rZEY2VkszTjVqTGpIZ2psRG9oYmZi?=
 =?utf-8?B?R25EdWd2UnJlVXNFRFhhUXVLOGJZc0MvQTEzRGtoclgwblFwRWlqTGZuaVYw?=
 =?utf-8?B?MkZjMTNGdmhwdXJCQjdZMzFwOWFSZStEcjhzSGtxVWtORkFCVlFMd1Fva1hq?=
 =?utf-8?B?dStEQWhyMGVmSGozN3R4ajhCaXo1dHI1VktkTU5JWGNDT21HMzRnTmpld1dO?=
 =?utf-8?B?MzlRL01ISFRrdTNSRzZzMGNLdnpmSjVLcnQrbndRV0paL0ZIQS9wY2g0cGJl?=
 =?utf-8?B?eFBBc1FiNTR5QUlEV1Fmbkl5aEYzNmlHYlNoUWZZeTVVU2VCSmxXdDkyMlY0?=
 =?utf-8?B?T1lFUmZYSEdaa1JuMVc2bFBKYzloRm9ZZWFxNEo0UHcrbVhnbFkrenh6cit2?=
 =?utf-8?B?bUZsY01GUGJLNkVOUENYUldWTzYvTldGbXpxYXZaTlpDcnpLT0dycDV3Y2Rs?=
 =?utf-8?B?emJQRW1PYkpRSVd1K2c0WGd3cExLS2JqYXJXdWpmQTZQQVNZVGhXWEF4VDBw?=
 =?utf-8?B?VG1oYVFMNmxQaU9CbmdmR3JlWGcvRDRsektjcVA2T28vSkltT2YrT0RKVVpE?=
 =?utf-8?B?QXNqSkltNzZTWnFzNmhlVFpDM2FSdklBVCt2UTBSbWlxMHFpT2pNVTZpd3FB?=
 =?utf-8?B?TFpNTE9mTVJXU0pzWlRpemNzd1JGNWQrS3dpRktNRlltcUFIR29vYzd4dHRU?=
 =?utf-8?B?ZTRXUlpRalVuSXpMMi9DUExEMXYxK0xoamlUVjdLckpVV3QwRTJKVWZLMGNP?=
 =?utf-8?B?NVB6Y1NTQWhOQTJ3RXlsb1ovQ0tsS2hoeko3WFMyT2lkK1RUMFNEZzJNUzB1?=
 =?utf-8?B?NitUNHh4N25yWlJvcnlKT09IQ3JhaUtKNEN5Szk5NjZqdUw2ZGRwdTNhbGtr?=
 =?utf-8?B?R1g1TzZjVlRlSEwvSVQweWZIY1Q0MER1VjZpZkM1Zm4wd0M1NUpOTkZDVVht?=
 =?utf-8?B?TFNyT3lRb1JRbjR1MjF4RFBEbWUySUJMTGJ0ZGd6MEo1ZGZPNnRKQ0RHZUZp?=
 =?utf-8?B?QjlSYTUzVjBrRXdCMEt0UDQwdDlqejZsakNFTkYrVU9TNE9pUDhsdnVRSWxX?=
 =?utf-8?B?MS9qK245cTZjOCtYalNjcjhZdDltbW5HOUpCbGxqYlBJckkwV2NHWGR2VUIw?=
 =?utf-8?B?TStJVVUybGEzY0k1LzcyUnpLQkhwSzdzdVc1TUZvSkJvbFgrc0tTNVJiT2pF?=
 =?utf-8?Q?/vpZC3MMcOdP/NP0Xq08fLneABLzLYBfUuM6yz8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4050262c-0c81-4d2e-5055-08d8d2ed5cd5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 02:40:18.0670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3snAUaLfwS6zJRFYY+Vg5OuTF0V/BuX0ZHRj4Ljd97DkFBAY1X4idTmGxqtmS4zUi1b5njZhRQx0DAaz+eS++bDjrDlQkeDSaAfp7uU9U6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4073
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

I've updated poky-contrib with my merge of meta-rust to oe-core:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-wip-2021-02-16

The build status is fine (shown below) aside from qemuriscv64/musl
and qemuppc/musl.

Khem is working on the qemuriscv64/musl problem with upstream rust devs.
qemuppc/musl fails due to:
    libunwind.cpp:66:3: error: #error Architecture not supported

Known issues if someone is interested:

1. I have an updated librsvg that isn't building using autotools
    It does build with cargo but I doubt that will produce a library
    that is usable. See https://github.com/meta-rust/meta-rust/issues/264

 
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/librsvg-broken-wip-2021-02-16

2. native-sdk support is broken:
     https://github.com/meta-rust/meta-rust/issues/236
    As shown in my OE talk last year, you can do rust application
    development and testing without this but it would be best to
    fix this bug and have rust behave like other YP toolchains.

3. There's an cargo-fetcher proposal sent to the bitbake
    list from Andreas but I don't see a patch to meta-rust to
    make the two patchsets work together. Andreas, is that something
    that you can do, even if it's just a quick change to get started?

4. We're (Vinay via WR) working on a way to use the rustc test suite.
    More to come on that later this week.

Sorry that this has dragged on for so long.
Any help would be appreciated.


-- 
# Randy MacLeod
# Wind River Linux


BUILDALL-QEMU LOG FOR rust-hello-world
START TIME: 2021-02-16_07:19:24
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-62-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86
[musl]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
FAIL: qemuppc
FAIL: qemuriscv64
PASS: qemux86
===============
PASSED: 16
FAILED: 2
