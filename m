Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.67])
 by mx.groups.io with SMTP id smtpd.web08.13838.1616423415127053556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=p07BI1fR;
 spf=pass (domain: windriver.com, ip: 40.107.93.67, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvryLqjkq3YDPbUSZnwy4Fvez4BwjKwc6t0tp+g6lzHbKqG5oe1TMH9QPS7I89Z+VMNiXol/h/n5wZDWKm6li4+NM6afTh5YNOfTo67Y79P12235K7PJJ+gLmMwOExsmyOC23o/LUYL4aiJZ8b5HmiEvqkSCTI/3Er8L0aW8WDffMX0EGVeTZz7bIOjy0VOP9PyzQnTV6LjXhscjv5OGEa4dNwSme1C9opxyWg7Ise/3afctJfzsvtQYFH8EaGN9msdQ7+jwuorb4LlcbGPRumGge3bgzMM/jUQYGAi8msrwUB7LayKtSML1qqVzBhMzlBIQjqkcMmQsDirA0x8/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B521gzCkhaklBoghNRQHUkX/PNgl6fr4vwZYQL0+rd8=;
 b=KGgx76fsgxDgT/cPW6q6m5Uc1Y5/IvxCJHkqiIDM3jOnlidgK3cn5XYQEzZ45Hw8wwl+M8UYBLnLCXpMZbQ8BSKqZgOpwUJ9UaFj4u32GXYScW4Q+8hm6eZbnlj27HHP9jNQ6ak4bjPQLcYnpG2cp1LekfniRNdQNIxp00rnVX0YzqreOkIMsT2JQR4KSq7wEDHKkAJD6FheSN+1GIwmlyl/yoNMIgk+o1440KVZg7PE0Zy5Gi4r8dflGpAKIcKXfA++LDAKfV8opfDHyLQuku3A3EKUqegfG7kCWGXYYwMG34eYdqiKM2y3tkoFIKCIQ57mT4XATr6DQYbWTX5aIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B521gzCkhaklBoghNRQHUkX/PNgl6fr4vwZYQL0+rd8=;
 b=p07BI1fR9zsL4JLo3u/W7LdNxt65H3iE4arh4I7/6uvThIbQQFL0XG36o9sO4UeqmdPDGVqmi7HS+wl5r9NntfyIE+60TnnGTOau72j44CwRDwwlg6J9WLy249RrmdRFwrl3tgnKBdSoFrkw+vyz4LEGEFTZjANL/ukNeCW2Ptg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:30:13 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 14:30:13 +0000
Subject: Re: [oe-core][PATCH] [WIP] valgrind: update to 3.17.0.RC2
To: Yi Fan Yu <yifan.yu@windriver.com>,
 openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20210322020208.18814-1-yifan.yu@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <f1e8243c-4f58-f2e5-aa77-bc01ee4741f3@windriver.com>
Date: Mon, 22 Mar 2021 10:30:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210322020208.18814-1-yifan.yu@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0122.namprd03.prod.outlook.com (2603:10b6:a03:33c::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 14:30:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49f68fcb-1316-4f5c-3e80-08d8ed3f00fc
X-MS-TrafficTypeDiagnostic: DM6PR11MB4612:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4612F10C8CF0E436CE9662F9F8659@DM6PR11MB4612.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:170;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IuzoG0eghe4guMT1a8ANJF3IinNcMqgM+dpuQn9ORWkPC+nWY+HGShVNtgfgEcFsP7k7QsoV83Qm8iLVjviPhfKN3mUHy2G+YKUeXC4CiKGtd4CetPJIqUFBGe811RyaB//rUKaEwz8NakvE5XgBx5oiYBkxBz8d7X0kfDty/pY2N8KbyvUTffwK9JT6utbiSacL73TgFmUz9BeWTl445DudLc5q2ZcUZRtEN61lbBlY/Qoe8wxUAgYjgH34tnw0AGwLDpn/GSR4om2ful0EPLu9VnYKEI7IYOSYz711NvErcg9bRUNzjHgO26bZloXYCur1hvdAalAPMUM6kfYeUr7wVvCgUp72wwUgru8phjgh3Y9pwuKl6Z1btEBzksHYyiyNcGcVY2mtBVXT9HC24oNgHSCUy8WEOpvO/sYIhQZkNMYyh8LVjGokx40OGh8TDPc5oS2FVqx37GLYGwdt8F8LrNWpDeusjVgjCQTpJ9Wtr7wxgH9rzpYdrTQZBq+lRlcXORzaNzn9X9iCV7FIkO6qYL41TAKTu+4uENatYkcUgxDxrmRw7lQXZcQi/+28Eka+fRU3Dir1nImtKpCKaeZIgI/0SbA/lnXRbagyOQjfTNFl7vr3bffOZxaKqllMYrNNilp611GPyNGzuhgJPCaJfoWvDHkIiM4Q0e5pTP7wT2E6B5Lqcp3TJXnA0Pr2eO4z2CwaAH7VTQBFe1L7bb2OVt7miDPF2NZzemZy/9rH1RcahtmIEy4OC2b9wWIE3K2PKOC+t9EPRD1lVXCIzMvIMhPqZ35dUtgug8ymD8Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39850400004)(83380400001)(2906002)(6486002)(31696002)(15650500001)(53546011)(66476007)(478600001)(66556008)(2616005)(66946007)(16576012)(316002)(110136005)(86362001)(966005)(26005)(186003)(956004)(16526019)(8676002)(19627235002)(5660300002)(36756003)(8936002)(52116002)(30864003)(6666004)(31686004)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?T09QbnIxcGl4azhCTTFhZWtYR0hzMGNIU05xSmJybkk2RFdQNDZCaStoTVRh?=
 =?utf-8?B?T0paNGo5ZTBnWUI3QnlPWWU3OGVxWmg1OURKV2ZXQlVURDZQRUFDQkpBUGEz?=
 =?utf-8?B?SkRKZ0pRSFJCZmpKeGw4VkErejRndWRsTGxTY3daVnhwMFkzRmdSdUF5ZVFU?=
 =?utf-8?B?YjJLOXIyZHNFV2g2M1hGMVpMaXJLcjU3Y2hFSEg1VTdHc2xnRDRKeHZZQ29X?=
 =?utf-8?B?blhDY0FQWFJHNnhKb0tRQzM4NjR4cUptTFlEZzROZEd1ZUErQzNEdEo5VjVK?=
 =?utf-8?B?ZG1PcXV2cjVXMXNDdVlCeTlVMEVQeHpyY1diSXl0Z253VFA0T3RwU29TVXNr?=
 =?utf-8?B?MHlSVEcrb3RiL3FGSWkwUzVMMmpZYllKeUdaYWQwTC9UTlJVMWVBa0RZZzBr?=
 =?utf-8?B?K3ljSENvRW5JeTBEdFRneVVtbEJCa2loVkxrM0JFb1hZcVN6eUdDMWVmOGZM?=
 =?utf-8?B?L3h0QVY2SU4yQ2JSVFNRT1E3azZ2WFRISGdGNENROU9sVDBRQ29JQlJCYUxt?=
 =?utf-8?B?eUE2R3N0QVJpbUxydFVhT0pJMXBZWC9IaUN4eFk4ZFNtZ2F5TENGR29NcW5N?=
 =?utf-8?B?a3g5M05wNVZKb3ZwWmNNck1BT1RSUCtybDVRVFhJWmJRUFA2RW5WVXQ0SFV6?=
 =?utf-8?B?Q3VVZlV6ZHU5NmRRbS9YUEwwZWZjbkRBaGt6SHNHWjRLR05ZNmZNQml1elFK?=
 =?utf-8?B?S0Y2NmpFcSs5aVZIZXo0QlNqVUhzK3duVnZmalRIL2N4TTVTTTZVekpzM0Zw?=
 =?utf-8?B?eW9aSy9MU0duNzA1ZUxwVjMvdWQ1L3JOSTU3K3drRHJkTnRlZ05ISk9pV3Fw?=
 =?utf-8?B?c2sxRjQyb1dSTW1xNnJXZmlmTmcxdkhIdThmTTNFeTEweThQbFZjR2R2K205?=
 =?utf-8?B?TXNCODFVRmNHaTVUNjh4S0t0QnA2dHI3TW41djlwNCtpSUZQSTNDSGtUS3dy?=
 =?utf-8?B?WFhDNXM5dXJtRmRmOTMxUGloUFNFUXNoMTRaQjVVM29BWEkyMFZLZFBYclBR?=
 =?utf-8?B?WDlrUFJ5azE0eDBabE1UYThkRjl4d2hTM1NBSFdjMUZKK2RsUUo3NVdkS1Ni?=
 =?utf-8?B?VXViTm1HK2U3OW9US2ZMektGUVFib2UrMnQweGthcEVQaHN1dzJ5TUlxallJ?=
 =?utf-8?B?UlFMT2YranRieDdlbTg2Y0xBYldYMmJuVVI4NkNnMHRWRld0UXpPejY3WVF0?=
 =?utf-8?B?QzB2MVRBS1JEOGlDNDF4dWpzUm1qYXRmS2gyNVJYWk82bVgra1hkK0N2YVFK?=
 =?utf-8?B?Y3dwcU5LazFXNWRQcnkxeVo2TnZEWWlDdW9hQkNnMmc3K1JVU2NXQkVjRDJ3?=
 =?utf-8?B?c1RBM2Fkc0tyQ20vdHlOdGxZQTJzTXk0QmczSmpCUEFiRCtVcXo3OFo5emti?=
 =?utf-8?B?dzBCMkU1N1laNDRkNW01K0VoZXdkYU93Um9sSmJWNktjRXJYaUFVSTVEemF5?=
 =?utf-8?B?NDd6ZC9Fbzdwb1Q5bkZQNThYVUxINExzcm5zenU1UTd0YTIrY2ZQVm0zRklV?=
 =?utf-8?B?OXpYMVlNTmh1aGlad1ZPaEhPWDVzMmE4VzJPa0ZPSkVERDhKZkNIM3hCVkRW?=
 =?utf-8?B?SHNabjhPSzJ0eXp6VVBwTVZmaXdubjZKQ0I1TnkzTnhXb2N5dzkwbTdDU1l4?=
 =?utf-8?B?UnZBMTJRRXZHYlU0aWxiWDlkTE5GUjVwTzlSaEwxZ0VtZ3JIemcvYmR0WWJN?=
 =?utf-8?B?cm05SkhlNXRENHl4SmZLc0YycHEwZFBYV0hoRUR3UGVWa214QkdBUnUra3R0?=
 =?utf-8?Q?ddl/liKwvBCSUxnY9/mxhAnxIWdCc09YiTcvwHQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f68fcb-1316-4f5c-3e80-08d8ed3f00fc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:30:13.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkzYesCuajKqaBqb3LFif6f8eF1iE9PrbJeGGJO19axVNr+g9L2cJK+zYOV3Pw1IBgftWbPaIOMX87+PsxaT54VSX52I1A+YxYJ/QOalfPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-03-21 10:02 p.m., Yi Fan Yu wrote:
> 3.17.0.rc2 will be very close to the 3.17.0 release

It seems that 3.17 is out now:
    https://www.valgrind.org/downloads/current.html




> still need to refresh
> drd-musl-fix.patch

This post-release commit, that makes the Makefile.a aware of
the musl.supp suppression filter might help musl ptest resutls:

dde556d51 (HEAD -> master, origin/master, origin/HEAD) Add musl.supp to 
SUPP_FILES

and musl.supp is included in the valgring git repo and likely the
tarball so we can drop it from the recipe is the content is the same.

> 
> TESTING RESULTS:
> qemu x86-64:
> FAIL: drd/tests/swapcontext
> FAIL: gdbserver_tests/hgtls
> 
> === Test Summary ===
> TOTAL: 736
> PASSED: 693
> FAILED: 2
> SKIPPED: 41

Compared to:

=== Test Summary ===
TOTAL: 408
PASSED: 390
FAILED: 0
SKIPPED: 18
DURATION: 738

https://autobuilder.yocto.io/pub/non-release/20210321-1/testresults/qemuarm64-ptest/

> 
> swap-context.vgtest has been disabled
> a workaround for gdbserver_tests/hgtls has been implemented
> 
> +    install ${S}/none/tests/tls.c  ${D}${PTEST_PATH}/gdbserver_tests/tls.c
> 
> OTHER CHANGES:
> 
> libdir is now libexecdir
> 
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>   ...Disable-drd-tests-swapcontext.vgtest.patch |  49 +++++
>   ...gtest-hanging-on-newer-glibc-and-or-.patch | 200 ------------------
>   .../valgrind/0001-drd-Port-to-Fedora-33.patch |  48 -----
>   .../valgrind/valgrind/0001-drd-musl-fix.patch |  12 +-
>   ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch |   2 +-
>   ...ch-drd_pthread_intercepts.c-for-musl.patch |  39 ++++
>   .../valgrind/valgrind/fixed-perl-path.patch   |  20 +-
>   .../valgrind/valgrind/musl.supp               |  46 ++++
>   .../valgrind/valgrind/run-ptest               |   3 +-
>   .../valgrind/valgrind/s390x_vec_op_t.patch    |  24 ++-
>   ...{valgrind_3.16.1.bb => valgrind_3.17.0.bb} |  23 +-
>   11 files changed, 185 insertions(+), 281 deletions(-)
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Disable-drd-tests-swapcontext.vgtest.patch
>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-patch-drd_pthread_intercepts.c-for-musl.patch
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind/musl.supp
>   rename meta/recipes-devtools/valgrind/{valgrind_3.16.1.bb => valgrind_3.17.0.bb} (93%)
> 
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Disable-drd-tests-swapcontext.vgtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-drd-tests-swapcontext.vgtest.patch
> new file mode 100644
> index 0000000000..9e78a9cb61
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-drd-tests-swapcontext.vgtest.patch
> @@ -0,0 +1,49 @@
> +From e3b587b1cfa7dde1484c88b2af67c49a1c6166e1 Mon Sep 17 00:00:00 2001
> +From: Yi Fan Yu <yifan.yu@windriver.com>
> +Date: Fri, 19 Mar 2021 16:35:26 -0400
> +Subject: [PATCH] Disable drd/tests/swapcontext.vgtest
> +
> +Test fails on both x86-64 and arm64.
> +
> +Unbuidable on musl with switchcontext.

typo: Unbuildable


Are you going to work on this for a while or just report it upstream?
What happens if you run it?

> +
> +Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> +---
> + drd/tests/Makefile.am | 10 ----------
> + 1 file changed, 10 deletions(-)
> +
> +diff --git a/drd/tests/Makefile.am b/drd/tests/Makefile.am
> +index 79e076246..5df76150e 100644
> +--- a/drd/tests/Makefile.am
> ++++ b/drd/tests/Makefile.am
> +@@ -267,8 +267,6 @@ EXTRA_DIST =                                        \
> + 	sem_open_traced.vgtest                      \
> + 	sem_wait.stderr.exp                         \
> + 	sem_wait.vgtest                             \
> +-	swapcontext.stderr.exp                      \
> +-	swapcontext.vgtest                          \
> + 	sigalrm.stderr.exp                          \
> + 	sigalrm.vgtest                              \
> + 	sigaltstack.stderr.exp                      \
> +@@ -408,7 +406,6 @@ check_PROGRAMS =      \
> +   sem_as_mutex        \
> +   sem_open            \
> +   sigalrm             \
> +-  swapcontext         \

If swapcontext builds for all our targets/libc combos,
I prefer to build it, install it but then move it aside in the run-ptest
script so that there's less of a barrier for someone to try to fix it.

I guess the downside to that approach is that there's no patch for us
to notice so we should probably track it with a YP bug so do as you 
please I guess. :-)


> +   threaded-fork       \
> +   trylock             \
> +   unit_bitmap         \
> +@@ -588,10 +585,3 @@ std_thread2_LDFLAGS          = -Wl,--no-as-needed
> + endif
> +
> + sem_wait_SOURCES            = sem_wait.cpp
> +-
> +-swapcontext_SOURCES         = swapcontext.c
> +-swapcontext_CFLAGS          = $(AM_CFLAGS) -g
> +-if VGCONF_OS_IS_SOLARIS
> +-swapcontext_CFLAGS          += -D__EXTENSIONS__
> +-endif
> +-
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
> deleted file mode 100644
> index 98cbcd132c..0000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
> +++ /dev/null
> @@ -1,200 +0,0 @@
> -From 83c24e31df6932a6d4fced179050c6d8d8c6f3b5 Mon Sep 17 00:00:00 2001
> -From: Philippe Waroquiers <philippe.waroquiers@skynet.be>
> -Date: Sun, 7 Mar 2021 22:29:27 +0100
> -Subject: [PATCH] Fix nlcontrolc.vgtest hanging on newer glibc and/or arm64
> -
> -This test verifies that GDB can interrupt a process with all threads
> -blocked in a long select syscall.
> -The test used to terminate by having GDB modifying the select argument.
> -However, modifying the select argument works only for specific arch
> -and/or specific versions of glibc.
> -The test then blocks on other architectures/glibc versions.
> -
> -The previous version of the test was:
> -  * first launching sleepers so as to have all threads blocked in long select
> -  * interrupting these threads
> -  * changing the select time arg so that the threads burn cpu
> -  * and then change variables to have the program exit.
> -
> -The new version does:
> -  * first launches sleepers so that all threads are burning cpu.
> -  * interrupting these threads
> -  * change the local variables of sleepers so that the threads will
> -    block in a long select syscall
> -  * interrupt these threads
> -  * kill the program.
> -
> -With this new version, we still check the behaviour of gdb+vgdbserver
> -for both burning and sleep threads, but without having the termination
> -depending on modifying select syscall argument.
> -
> -Tested on debian amd64 and on ubuntu arm64 (to check the test does not hang
> -on an arm64 platform).
> -
> -Upstream-Status: Backport
> -
> -From commit on master:
> -c79180a3afcf65902e578646c3b716cc749db406
> -
> -Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ----
> - gdbserver_tests/nlcontrolc.stderr.exp  |  4 +-
> - gdbserver_tests/nlcontrolc.stdinB.gdb  | 57 +++++++++++++++-----------
> - gdbserver_tests/nlcontrolc.stdoutB.exp | 25 ++++++-----
> - gdbserver_tests/nlcontrolc.vgtest      | 12 +++---
> - 4 files changed, 56 insertions(+), 42 deletions(-)
> -
> -diff --git a/gdbserver_tests/nlcontrolc.stderr.exp b/gdbserver_tests/nlcontrolc.stderr.exp
> -index ac75bb3da..b63a9a988 100644
> ---- a/gdbserver_tests/nlcontrolc.stderr.exp
> -+++ b/gdbserver_tests/nlcontrolc.stderr.exp
> -@@ -3,9 +3,9 @@ Nulgrind, the minimal Valgrind tool
> - (action at startup) vgdb me ...
> -
> -
> --loops/sleep_ms/burn/threads_spec/affinity:  1000000000 1000000000 1000000000 BSBSBSBS 1
> -+loops/sleep_ms/burn/threads_spec/affinity:  1000000000 0 100000 BSBSBSBS 1
> - Brussels ready to sleep and/or burn
> - London ready to sleep and/or burn
> - Petaouchnok ready to sleep and/or burn
> - main ready to sleep and/or burn
> --
> -+Gdb request to kill this process
> -diff --git a/gdbserver_tests/nlcontrolc.stdinB.gdb b/gdbserver_tests/nlcontrolc.stdinB.gdb
> -index 667ece18d..ea4fcd530 100644
> ---- a/gdbserver_tests/nlcontrolc.stdinB.gdb
> -+++ b/gdbserver_tests/nlcontrolc.stdinB.gdb
> -@@ -9,32 +9,43 @@ shell ./simulate_control_c --vgdb-prefix=./vgdb-prefix-nlcontrolc 1 grep main nl
> - #
> - continue
> - #
> --# Here, all tasks should be blocked in a loooonnnng select, all in WaitSys
> --info threads
> --# We will unblock them by changing their timeout argument
> --# To avoid going into the frame where the timeval arg is,
> --# it has been defined as global variables, as the nr
> --# of calls on the stack differs between 32bits and 64bits,
> --# and/or between OS.
> --# ensure select finishes in a few milliseconds max:
> --p t[0].tv_sec = 0
> --p t[1].tv_sec = 0
> --p t[2].tv_sec = 0
> --p t[3].tv_sec = 0
> --#
> --# We will change the burning parameters in a few  seconds
> -+# Threads are burning cpu now
> -+# We would like to fully test info threads here, but which thread are Runnable
> -+# or Yielding is unpredictable. With a recent enough gdb, check the nr of
> -+# threads by state using pipe commands and grep/wc.
> -+init-if-undefined $_gdb_major = 0
> -+init-if-undefined $_gdb_minor = 0
> -+if $_gdb_major >= 9
> -+  | info threads | grep VgTs_Runnable | wc -l
> -+  | info threads | grep VgTs_Yielding | wc -l
> -+else
> -+  echo 1\n
> -+  echo 3\n
> -+end
> -+# We change the variables so that all the threads are blocked in a syscall
> -+p burn = 0
> -+p sleepms = 1000000
> -+#
> -+#
> - shell ./simulate_control_c --vgdb-prefix=./vgdb-prefix-nlcontrolc 1 grep changed nlcontrolc.stdoutB.out
> - #
> --echo changed burning parameters\n
> -+echo changed burning parameters to sleeping parameters\n
> - continue
> -+# Here, all tasks should be blocked in a loooonnnng select, all in WaitSys
> -+info threads
> -+# We reset the sleepms to 0. The threads should still be blocked in the syscall
> -+p sleepms = 0
> -+shell ./simulate_control_c --vgdb-prefix=./vgdb-prefix-nlcontrolc 1 grep reset nlcontrolc.stdoutB.out
> - #
> --# Threads are burning cpu now
> --# We would like to test info threads here, but which thread are Runnable or Yielding
> --# is unpredictable.
> --# info threads
> --p burn = 0
> --p loops = 0
> --p report_finished = 0
> -+echo reset to sleeping parameters\n
> - continue
> --# and the process should stop very quickly now
> -+# threads should still be blocked in a loooonnnng select, all in WaitSys
> -+info threads
> -+if $_gdb_major >= 9
> -+  | info threads | grep VgTs_WaitSys | wc -l
> -+else
> -+  echo 4\n
> -+end
> -+# Make the process die.
> -+kill
> - quit
> -diff --git a/gdbserver_tests/nlcontrolc.stdoutB.exp b/gdbserver_tests/nlcontrolc.stdoutB.exp
> -index e8a5ff8ba..2e8dc8498 100644
> ---- a/gdbserver_tests/nlcontrolc.stdoutB.exp
> -+++ b/gdbserver_tests/nlcontrolc.stdoutB.exp
> -@@ -1,18 +1,21 @@
> - Continuing.
> - Program received signal SIGTRAP, Trace/breakpoint trap.
> -+do_burn () at sleepers.c:41
> -+41	   for (i = 0; i < burn; i++) loopnr++;
> -+ > > > > > >1
> -+3
> -+$1 = 0
> -+$2 = 1000000
> -+changed burning parameters to sleeping parameters
> -+Continuing.
> -+Program received signal SIGTRAP, Trace/breakpoint trap.
> - 0x........ in syscall ...
> - * 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
> --$1 = 0
> --$2 = 0
> - $3 = 0
> --$4 = 0
> --changed burning parameters
> -+reset to sleeping parameters
> - Continuing.
> - Program received signal SIGTRAP, Trace/breakpoint trap.
> --do_burn () at sleepers.c:41
> --41	   for (i = 0; i < burn; i++) loopnr++;
> --$5 = 0
> --$6 = 0
> --$7 = 0
> --Continuing.
> --Program exited normally.
> -+0x........ in syscall ...
> -+* 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
> -+ > > > >4
> -+Kill the program being debugged? (y or n) [answered Y; input not from terminal]
> -diff --git a/gdbserver_tests/nlcontrolc.vgtest b/gdbserver_tests/nlcontrolc.vgtest
> -index bb5308403..09edfcaba 100644
> ---- a/gdbserver_tests/nlcontrolc.vgtest
> -+++ b/gdbserver_tests/nlcontrolc.vgtest
> -@@ -4,16 +4,16 @@
> - #          and modify some variables
> - #   the user can control-c an process with all threads in Running/Yielding
> - #          and modify some variables
> --# sleepers is started with argument so that it will compute during ages.
> --# The variable modifications means it will exit in a reasonable time.
> --# This test is disabled on Solaris because modifying select/poll/ppoll timeout
> --# has no effect if a thread is already blocked in that syscall.
> -+# sleepers is started so that it burns CPU.
> -+# We then interrupt the process.
> -+# We modify variables so that instead of burning cpu, sleepers blocks
> -+# all threads in a select syscall.
> - prog: sleepers
> --args: 1000000000 1000000000 1000000000 BSBSBSBS 1
> -+args: 1000000000 0 100000 BSBSBSBS 1
> - vgopts: --tool=none --vgdb=yes --vgdb-error=0 --vgdb-prefix=./vgdb-prefix-nlcontrolc
> - stderr_filter: filter_stderr
> - # Bug 338633 nlcontrol hangs on arm64 currently.
> --prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && ! ../tests/os_test solaris
> -+prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/os_test solaris
> - progB: gdb
> - argsB: --quiet -l 60 --nx ./sleepers
> - stdinB: nlcontrolc.stdinB.gdb
> ---
> -2.29.2
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> deleted file mode 100644
> index 37f6ea667d..0000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001
> -From: Bart Van Assche <bvanassche@acm.org>
> -Date: Sat, 19 Sep 2020 08:08:59 -0700
> -Subject: [PATCH] drd: Port to Fedora 33
> -
> -Apparently on Fedora 33 the POSIX thread functions exist in both libc and
> -libpthread. Hence this patch that intercepts the pthread functions in
> -libc. See also https://bugs.kde.org/show_bug.cgi?id=426144 .
> -
> -Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> -
> -This patch was imported from the valgrind sourceware server
> -(https://sourceware.org/git/?p=valgrind.git;a=commit;h=15330adf7c2471fbaa6a0818db07078d81dbff97)
> -It was modified to remove the changes to the valgrind NEWS file,
> -as these are difficult to maintain and don't impact the valgrind
> -code itself.
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
> ----
> - drd/drd_pthread_intercepts.c | 9 +++++++++
> - 1 file changed, 10 insertions(+)
> -
> -diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
> -index 58c45aaec..c2882e5ab 100644
> ---- a/drd/drd_pthread_intercepts.c
> -+++ b/drd/drd_pthread_intercepts.c
> -@@ -174,7 +174,16 @@ static int never_true;
> -    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
> -    { return implf argl; }
> - #else
> -+/*
> -+ * On Linux, intercept both the libc and the libpthread functions. At
> -+ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthread
> -+ * functions in both libc and libpthread. Older glibc versions only have an
> -+ * implementation of the pthread functions in libpthread.
> -+ */
> - #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
> -+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
> -+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
> -+   { return implf argl; }                                               \
> -    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
> -    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
> -    { return implf argl; }
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
> index e96bf3c611..a3268714b8 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
> @@ -1,13 +1,5 @@
> -The changes in 0001-drd-Port-to-Fedora-33.patch break builds on musl. These
> -need a __GLIBC__ guard to ensure musl builds continue to work.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -Index: valgrind-3.16.1/drd/drd_pthread_intercepts.c
> -===================================================================
> ---- valgrind-3.16.1.orig/drd/drd_pthread_intercepts.c
> -+++ valgrind-3.16.1/drd/drd_pthread_intercepts.c
> +--- a/drd/drd_pthread_intercepts.c
> ++++ b/drd/drd_pthread_intercepts.c
>   @@ -180,6 +180,7 @@ static int never_true;
>     * functions in both libc and libpthread. Older glibc versions only have an
>     * implementation of the pthread functions in libpthread.
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> index d641998d72..e421ac6c80 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> @@ -19,7 +19,7 @@ index 6e5a797b9..0ede1ab18 100644
>   @@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
>    
>    
> - FILE DESCRIPTORS: 6 open at exit.
> + FILE DESCRIPTORS: 6 open (3 std) at exit.
>   -Open file descriptor ...: /tmp/data2
>   +Open file descriptor ...: ...
>       ...
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-patch-drd_pthread_intercepts.c-for-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-patch-drd_pthread_intercepts.c-for-musl.patch
> new file mode 100644
> index 0000000000..8af1be8ead
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-patch-drd_pthread_intercepts.c-for-musl.patch
> @@ -0,0 +1,39 @@
> +From db26c19477894c9473959a2e292c77fd5b5edeb4 Mon Sep 17 00:00:00 2001
> +From: Yi Fan Yu <yifan.yu@windriver.com>
> +Date: Fri, 19 Mar 2021 14:11:02 -0700
> +Subject: [PATCH] patch drd_pthread_intercepts.c for musl
> +
> +Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> +---
> + drd/drd_pthread_intercepts.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
> +index 28c0de78b..82c612a7e 100644
> +--- a/drd/drd_pthread_intercepts.c
> ++++ b/drd/drd_pthread_intercepts.c
> +@@ -169,6 +169,7 @@ static int never_true;
> +       return pth_func_result;						\
> +    }
> + #elif defined(VG_WRAP_THREAD_FUNCTION_LIBC_ONLY)
> ++#ifdef __GLIBC__
> + #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
> +@@ -182,6 +183,13 @@ static int never_true;
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
> +    { return implf argl; }
> + #else
> ++#define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
> ++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
> ++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
> ++   { return implf argl; }
> ++#endif
> ++#define
Is this line needed?
> ++#else
> + #  error "Unknown platform/thread wrapping"
> + #endif
> +
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
> index b431d3356e..db6867f625 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
> +++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
> @@ -1,4 +1,4 @@
> -From 67e7a690107efb16d6d5aebfe420b64a552accdf Mon Sep 17 00:00:00 2001
> +From d85cc45e0ddeda68adf594dead715964cb32d0e7 Mon Sep 17 00:00:00 2001
>   From: Qing He <qing.he@intel.com>
>   Date: Tue, 31 Aug 2010 22:51:58 +0800
>   Subject: [PATCH] valgrind: fix perl scripts
> @@ -22,10 +22,11 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
>    cachegrind/cg_diff.in     | 2 +-
>    massif/ms_print.in        | 2 +-
>    perf/vg_perf.in           | 2 +-
> - 4 files changed, 4 insertions(+), 4 deletions(-)
> + tests/vg_regtest.in       | 2 +-
> + 5 files changed, 5 insertions(+), 5 deletions(-)
>   
>   diff --git a/cachegrind/cg_annotate.in b/cachegrind/cg_annotate.in
> -index 69365e8..978265d 100644
> +index fea114b..5e814fd 100644
>   --- a/cachegrind/cg_annotate.in
>   +++ b/cachegrind/cg_annotate.in
>   @@ -1,4 +1,4 @@
> @@ -35,7 +36,7 @@ index 69365e8..978265d 100644
>    ##--------------------------------------------------------------------##
>    ##--- Cachegrind's annotator.                       cg_annotate.in ---##
>   diff --git a/cachegrind/cg_diff.in b/cachegrind/cg_diff.in
> -index 395460b..05873cc 100755
> +index 9d9258e..d0f0ec7 100755
>   --- a/cachegrind/cg_diff.in
>   +++ b/cachegrind/cg_diff.in
>   @@ -1,4 +1,4 @@
> @@ -45,7 +46,7 @@ index 395460b..05873cc 100755
>    ##--------------------------------------------------------------------##
>    ##--- Cachegrind's differencer.                         cg_diff.in ---##
>   diff --git a/massif/ms_print.in b/massif/ms_print.in
> -index e6fae89..3b85b40 100755
> +index a206ce4..df1bc31 100755
>   --- a/massif/ms_print.in
>   +++ b/massif/ms_print.in
>   @@ -1,4 +1,4 @@
> @@ -55,7 +56,7 @@ index e6fae89..3b85b40 100755
>    ##--------------------------------------------------------------------##
>    ##--- Massif's results printer                         ms_print.in ---##
>   diff --git a/perf/vg_perf.in b/perf/vg_perf.in
> -index 7a80cb0..28f6156 100644
> +index 90ee1d2..c585096 100644
>   --- a/perf/vg_perf.in
>   +++ b/perf/vg_perf.in
>   @@ -1,4 +1,4 @@
> @@ -65,7 +66,7 @@ index 7a80cb0..28f6156 100644
>    ##--- Valgrind performance testing script                  vg_perf ---##
>    ##--------------------------------------------------------------------##
>   diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
> -index cb05b52..032e947 100755
> +index 0fe6341..1b45eb7 100755
>   --- a/tests/vg_regtest.in
>   +++ b/tests/vg_regtest.in
>   @@ -1,4 +1,4 @@
> @@ -74,5 +75,6 @@ index cb05b52..032e947 100755
>    ##--------------------------------------------------------------------##
>    ##--- Valgrind regression testing script                vg_regtest ---##
>    ##--------------------------------------------------------------------##
> ----
> -2.4.0
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind/musl.supp b/meta/recipes-devtools/valgrind/valgrind/musl.supp

Part of the git repo and likely the tarball as mentioned above.

> new file mode 100644
> index 0000000000..864172a242
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/musl.supp
> @@ -0,0 +1,46 @@
> +# Suppressions for musl libc
> +# See: https://www.openwall.com/lists/musl/2017/06/15/4
> +
> +{
> +   musl-dynlink-false-positive1
> +   Memcheck:Leak
> +   fun:calloc
> +   fun:load_direct_deps
> +   fun:load_deps
> +   fun:load_deps
> +   fun:__dls3
> +   fun:__dls2b
> +   fun:__dls2
> +}
> +
> +{
> +   musl-dynlink-false-positive2
> +   Memcheck:Leak
> +   fun:calloc
> +   fun:load_direct_deps
> +   fun:load_deps
> +   fun:load_deps
> +   fun:__dls3
> +   fun:__dls2
> +}
> +
> +{
> +   musl-dynlink-false-positive3
> +   Memcheck:Leak
> +   fun:calloc
> +   fun:load_library
> +   fun:load_preload
> +   fun:__dls3
> +   fun:__dls2b
> +   fun:__dls2
> +}
> +
> +{
> +   musl-dynlink-false-positive4
> +   Memcheck:Leak
> +   fun:calloc
> +   fun:load_library
> +   fun:load_preload
> +   fun:__dls3
> +   fun:__dls2
> +}
> diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
> index e8a1a668fc..3e0205fe6e 100755
> --- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
> +++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
> @@ -7,6 +7,7 @@
>   # Randy MacLeod <Randy.MacLeod@windriver.com>
>   ###############################################################
>   VALGRIND_LIB=@libdir@/valgrind
> +VALGRIND_LIBEXECDIR=@libexecdir@/valgrind
>   VALGRIND_BIN=@bindir@/valgrind
>   
>   LOG="${VALGRIND_LIB}/ptest/valgrind_ptest_$(date +%Y%m%d-%H%M%S).log"
> @@ -33,7 +34,7 @@ fi
>   
>   cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
>       --valgrind=${VALGRIND_BIN} \
> -    --valgrind-lib=${VALGRIND_LIB} \
> +    --valgrind-lib=${VALGRIND_LIBEXECDIR} \
>       --yocto-ptest \
>       gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
>       2>&1|tee ${LOG}
> diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
> index eea671da0a..bde1241dc7 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
> +++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
> @@ -1,3 +1,8 @@
> +From 8154d38bac5cdb3675cfdaf562ab9da01988b263 Mon Sep 17 00:00:00 2001
> +From: Yi Fan Yu <yifan.yu@windriver.com>
> +Date: Wed, 17 Mar 2021 12:16:31 -0400
> +Subject: [PATCH 19/20] remove s390x_vec_op_t
> +
>   s390x_vec_op_t is not needed anywhere, only elements of enum are accessed
>   removing it ensures that valgrind can be built with -fno-common option
>   
> @@ -6,14 +11,25 @@ ld: ../../VEX/libvex-amd64-linux.a(libvex_amd64_linux_a-guest_s390_helpers.o):/u
>   
>   Upstream-Status: Pending
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> +---
> + VEX/priv/guest_s390_defs.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
> +index 9054290..dab8002 100644
>   --- a/VEX/priv/guest_s390_defs.h
>   +++ b/VEX/priv/guest_s390_defs.h
> -@@ -286,7 +286,7 @@ enum {
> -    S390_VEC_OP_VFCHE = 18,
> -    S390_VEC_OP_VFTCI = 19,
> -    S390_VEC_OP_LAST = 20 // supposed to be the last element in enum
> +@@ -284,7 +284,7 @@ typedef enum {
> +    S390_VEC_OP_VBPERM,
> +    S390_VEC_OP_VMSL,
> +    S390_VEC_OP_LAST             // supposed to be the last element in enum
>   -} s390x_vec_op_t;
>   +};
>    
>    /* Arguments of s390x_dirtyhelper_vec_op(...) which are packed into one
>       ULong variable.
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> similarity index 93%
> rename from meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> rename to meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> index 9dbd9f74c4..1c1ca74262 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> @@ -12,7 +12,7 @@ DEPENDS = " \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
>           "
>   
> -SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
> +SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.RC2.tar.bz2 \
>              file://fixed-perl-path.patch \
>              file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
>              file://run-ptest \
> @@ -42,13 +42,15 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>              file://s390x_vec_op_t.patch \
>              file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
>              file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
> -           file://0001-drd-Port-to-Fedora-33.patch \
> -           file://0001-drd-musl-fix.patch \
> -           file://0001-helgrind-Intercept-libc-functions.patch \
> -           file://0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch \
> +           file://musl.supp;subdir=${S} \
> +           file://0001-Disable-drd-tests-swapcontext.vgtest.patch \
>              "
> -SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
> -SRC_URI[sha256sum] = "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
> +
> +S = "${WORKDIR}/valgrind-${PV}.RC2"
> +
> +SRC_URI[sha256sum] = "3f27d2176ef9f316bca2ef89abb7cf9da2d99c69bcc4cd0fc86b9debbf55ede5"
> +SRC_URI[md5] = "5dcf7c42635e19b074714c53f3a57580"
> +
>   UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
>   
>   COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
> @@ -100,6 +102,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
>   # to -O2 but uses -O0 for some specific test apps etc. Passing our own flags
>   # (via CFLAGS) means we interfere with that. Only pass DEBUG_FLAGS to it
>   # which fixes build path issue in DWARF.
> +# this might be key to our issue

Can you explain what  you mean by the comment above?

>   SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
>   
>   do_configure_prepend () {
> @@ -134,7 +137,7 @@ RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
>   
>   RDEPENDS_${PN}-ptest += " bash coreutils file \
>      gdb libgomp \
> -   perl \
> +   perl perl-modules \

We usually like to keep things as lean as we can even for ptests.
I believe that if you add perl-modules then you could drop the list on 
the next two lines but I don't think that's what we want for the recipe.
What's your plan, was that a quick hack to get this out and reviewed?

>      perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
>      perl-module-overloading \
>      procps sed ${PN}-dbg ${PN}-src"
> @@ -223,6 +226,7 @@ do_install_ptest() {
>   
>       # handle multilib
>       sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
> +    sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
>       sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
>   
>       # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
> @@ -233,6 +237,9 @@ do_install_ptest() {
>       # via dwarfsrcfiles either, so it needs to be installed manually.
>       mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
>       install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
> +
> +    # workaround to pass gdbserver_tests/hgtls (make gdb find tls.c)
> +    install ${S}/none/tests/tls.c  ${D}${PTEST_PATH}/gdbserver_tests/tls.c

If it's a work-around, should we open a bug to track the proper fix or
do you think this will suffice for the release?


Good work. Please reply in line where it makes sense
and then send a 3.17.0!

../Randy

>   }
>   
>   # avoid stripping some generated binaries otherwise some of the tests will fail
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
