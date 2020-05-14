Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.46])
 by mx.groups.io with SMTP id smtpd.web11.7961.1589443158641690191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 00:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bfQR5d/h;
 spf=pass (domain: windriver.com, ip: 40.107.94.46, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDw8M85wohzP2fxOaGjP7T63LgtuINHOOFZLJFmHB+sHSzjCOoX8qW/1VYwDNvAW3se3u8IC9bM/WaYt6wovXVgCXe923jiR/WvWup9tG/FKTHxwQ8EQ3R99NMLhqPnbFrKyWxYFpdgK1FUbk8JJ//ECsWuRkE3wZv/Egzgt3zxi64MHRRa4XZsP/nIKTqRIoD9Ul2WRkEd+Nu8DpKZaQphZJcBrtIXasO5hs2bzwect7suXRHDi67SuPhMrl4KO+Z4mVeDLY0aNyOgVvqUGtafL48qn/uPcDyNjiL6QcZlrw+22YdTdhNAokemvuroP0PJtITI0cPizworsITLnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pmwPB5bLRQPSrlqJ/OiD85sO1byF9rXUEi6iNef5cg=;
 b=i7uZJtGMgMiUVK1G8Px2QAYmQSoD3OIXSoWVs/glfkUqZe6bngd3S9SAgR1GuBmzoU1lJXH5rMGtWTiwh51Tn66rG08wkOGK2Tgk7WAUgLXXAEYt79uYS24hnpD4j+BIlf5IKhE/589F+bK8Rn7GueX6K0KZ3jXOeQhRMP+AIKJjJsU4FhYVtqpB6MvXYv9Y1mtbTGbSyRjLATiLs10norygZ12QxgUAd53+oSyur/mcQsB3dU9D32MNaWXvO0dtQVrS/62pl53AFwaWzH+QUtASt/dy7qNKkiQ7mpPB9ynVztI+PHfQ7evUyz5XamubAft/SRWb0inY1YMYLldLag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pmwPB5bLRQPSrlqJ/OiD85sO1byF9rXUEi6iNef5cg=;
 b=bfQR5d/hIQFWderYW1qBDOFm/1KbphBDKlsjwZSbMhRDwOvHDTVfwKbgQkH91QJxq/LqM75wT4p5udiYCrQMm9ubgR6Ot+8t36ywsiwAnY1ze8jkjgQhQSioWUEgcFh3peSOmgFBGI6GYxg1anHwRBj4GMv8AbLjAsblfDJRGaQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3222.namprd11.prod.outlook.com (2603:10b6:a03:79::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Thu, 14 May
 2020 07:59:16 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 07:59:16 +0000
Subject: Re: [OE-core] [PATCH] bison: fix the parallel build
To: Jacob Kroon <jacob.kroon@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20200514073936.40572-1-mingli.yu@windriver.com>
 <17e2ea0e-6588-355a-9f5a-b570a0e4cf87@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5EBCFA66.5010902@windriver.com>
Date: Thu, 14 May 2020 15:59:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
In-Reply-To: <17e2ea0e-6588-355a-9f5a-b570a0e4cf87@gmail.com>
X-ClientProxiedBy: SL2PR04CA0024.apcprd04.prod.outlook.com
 (2603:1096:100:2d::36) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by SL2PR04CA0024.apcprd04.prod.outlook.com (2603:1096:100:2d::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3000.25 via Frontend Transport; Thu, 14 May 2020 07:59:15 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e7c7a20-ccbb-416e-b6e1-08d7f7dcb2c8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3222:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB322299270F3D27766DC99320F1BC0@BYAPR11MB3222.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GK/FQ2H6NZ3DSvJhgJwNJPh1t1TTc3muhbsvO70uGGPWhLcrYUXyKBxwUHrnZ68hioqNLgX08YYPKygs/rD8ZC+/DKLomf+3Q0guDKiZnxXkMBw7EZCDMQjgAjn2Y6GGqNawfowNaI0xYlUKhSKX35W42Hz7T+Ty2eqNcf5sZOcJmygM34Zq5j5HhVLEnMlZd7ZITd6Vai+TBU5Wlujp67NHVGYkz1xG+pVdXQMsfGVLDnsrHRos24EM9Go3m4fsgk7x6iPUUuR38yPiIaF+Hbjv0dOPy77KDWb40F/11p6qNlXpTuhxkrTOL9Gl9RL290FRUIOIWzmBpVIbxhi5beh0XCyHXYet0QRFLXdt2ulD0sBcAmKcILiaQEHfu6OLinD1DZQ5zBslIFwK+40FGLZ4AKEo7hMRKF7T3GOcrgKDhCeKCZYIvBspDeVABfMMHa8rtC+cfdmOPRerIZ0T3XU3NtSSbDVaLHcnzxK+CUsmniawLQpVzwBEqufr/dgyAW3LJysc7j59UctDuABxeXoJHsBK5aBua5TnGdxcMuNgWzT+0pxfcLVfzxO7ihAunAtjtw83lNijzn4ecAlhacQOvqsBkeqnMXRr3aq9ENLTHykRS1ZBvU0UiB3cgs7g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(136003)(346002)(39850400004)(366004)(2906002)(5660300002)(316002)(36756003)(8676002)(66556008)(186003)(66476007)(26005)(6666004)(16576012)(6706004)(33656002)(16526019)(8936002)(66946007)(6486002)(966005)(86362001)(53546011)(87266011)(52116002)(956004)(478600001)(2616005)(78286006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kTHVRKDILnj1NOnSiazQir8l6noxyrUhOlMEB9Q6729eiMTr+pYn5j8rhj9biZa8dPrzWFG9IQLmP8RSNuxdAC+M35IPhlbHGl9IOi/Cj6DfcbdHvgShbA6redi/hRxKF8hryEUJqq4vQrnRaVr7iVqsbZDKb21aCT9KoIwAXj2lwKyBF1pWzXBzrhv6gHhxu+zVg2O3QL1tLnjrEXOXXgh0cm+PbXH3W2BMbW0a/J2+q8sXl8+KBZWuE/zpSPbNtIr41708RsCEWcuNDiMHfC3qCVCUVgaYbsXeaG4IsF/DS0oQTEhRQuOuPYbPDywhNGN850lfKCObbS/qIFyGTDgkZ2W6oqhYmhoasi7FVqcE5hZCq8vNyY7AklBhTqKXMh2hF7fzlyUQoCctrzcT6cDasQW+CAV1F2mQUXWUKMwmUA2zPQgLU+q9BDqlM0bG0QycjXBxse221gcQPeLe4k9wIZeonNcU3XE1hrbGT20=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7c7a20-ccbb-416e-b6e1-08d7f7dcb2c8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 07:59:16.4116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3gob+qBAFMJ75VHjn9r7ri2cEVkUqu2rzzAXbY5VlJvWYJscOdq100Vfr5nrokhju1UKv5NLAh3TFQibouLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3222
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacob,

On 05/14/20 15:55, Jacob Kroon wrote:
> Hi Mingli,
>
> On 5/14/20 9:39 AM, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Explicitly make the BUILT_SOURCES which
>> are the generated headers such as stdio.h,
>> fcntl.h and etc to be the dependencies of
>> the gl_LIBOBJS such as libbison_a-sprintf.o,
>> libbison_a-printf.o and etc to guarantee the
>> BUILT_SOURCES is generated before begin to
>> compile EXTRA_lib_libbison_a_SOURCES such as
>> fprintf.c in parallel builid, otherwise there
>> may come below error:
>>   | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
>>
>> It does the same for src_bison_OBJECTS and
>> lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
>> generated before begin to compile src_bison_SOURCES
>> which contains AnnotationList.c and etc.
>>
>> BTW, the MOSTLYCLEANFILES also contains the
>> generated header needs to be created early
>> in the build process, so add it also in to
>> avoid below error:
>>   | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such
>> file or directory
>>
>> [YOCTO #13825]
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../0001-bison-fix-the-parallel-build.patch   | 63 +++++++++++++++++++
>>   meta/recipes-devtools/bison/bison_3.5.4.bb    |  1 +
>>   2 files changed, 64 insertions(+)
>>   create mode 100644
>> meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
>>
>> diff --git
>> a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
>> b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
>>
>> new file mode 100644
>> index 0000000000..c3be91a109
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
>>
>> @@ -0,0 +1,63 @@
>> +From e0dbcee6e25b3c0cb11a627bbfe3af45ef67ec30 Mon Sep 17 00:00:00 2001
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Thu, 14 May 2020 15:23:16 +0800
>> +Subject: [PATCH] bison: fix the parallel build
>> +
>> +Explicitly make the BUILT_SOURCES which
>> +are the generated headers such as stdio.h,
>> +fcntl.h and etc to be the dependencies of
>> +the gl_LIBOBJS such as libbison_a-sprintf.o,
>> +libbison_a-printf.o and etc to guarantee the
>> +BUILT_SOURCES is generated before begin to
>> +compile EXTRA_lib_libbison_a_SOURCES such as
>> +fprintf.c in parallel builid, otherwise there
>> +may come below error:
>> + | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
>> +
>> +It does the same for src_bison_OBJECTS and
>> +lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
>> +generated before begin to compile src_bison_SOURCES
>> +which contains AnnotationList.c and etc.
>> +
>> +BTW, the MOSTLYCLEANFILES also contains the
>> +generated header needs to be created early
>> +in the build process, so add it also in to
>> +avoid below error:
>> + | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such
>> file or directory
>> +
>> +Upstream-Status: Submitted [bison-patches@gnu.org maillist]
>> +
>
> I can't find the patch email in the bison-patches mailing list archive,
> do you have a link url ?

Good catch, that's why I didn't paste the link in the Submitted part.

BTW, I also cannot find at
https://lists.gnu.org/archive/html/bison-patches/2020-05/threads.html 
though I indeed sent to bison-patches@gnu.org.

Thanks,
Mingli

>
> /Jacob
>
