Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.52])
 by mx.groups.io with SMTP id smtpd.web11.13603.1616769454615247969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 07:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cHDwxSUH;
 spf=pass (domain: windriver.com, ip: 40.107.68.52, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDUxFA7C5BTdBepIfwS4CduZAQwuZQz0hrhVc5cav/mKQLIbnjvgGBp7Sih0KIh7Cs92yxZxZ1qGK8q2f3YsCxbEdia4tvYITYOiMmru8e5dag2IA4r3738vzIuqlIE9sCk+JDfoou4Sm6tczZ9uDBseprznamwmSqmMUhuDTWtL4t5ZZ0bMo1phc1wvg1Mt1gVYk9NRDVbWgRtIgDHYLyoPPYJguXK70IcUd6yCYaFxfr7r3Go1N8l/Hy7+E5EZtGTggFwudiLhrBCJPpneN+nhXtK08+aYJZmLxX81AoN2QrbVJQ7/ppSS4hwfftLcEYfwDwenAPCIbI+vU3RfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WmYT7ryHKk13vOnYHZqonOM26inPnsINADXVaBYG3E=;
 b=FwaLDDPZuPbF+feC5/n039HQCiNBCT2N7fxwUvI75XQH8PCGrIpB9WTw7PkdQQ4UDwgSFnVBfgz4mKlCdpagTXJDoxtscGkpyGJBGPJqoj/gWQZoqzLDc6FUZWfVYtI+DOOjHDTN2z3le0EhvCiPfgXJjZrgjCg8TBk47PvUfnvL6GWGe1fctgvEEWSRcdCiFG8Ngg5hvEEHpEYfXE2FHnih6mn3vNye+oQ3fc6hjt9jMfAsDNicIoLV6CM4JOkxyAKG4bm7SZHoavflKG/68ZZAgpOlPEyae4A9bYuYTtQWnt7hRwQ2IjsG3qW9xBbXzwNdB++K/yV2YEkrISNY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WmYT7ryHKk13vOnYHZqonOM26inPnsINADXVaBYG3E=;
 b=cHDwxSUHQsbCD3OKsVmkSntYs/8f5tPtLccD/AE6mb4reWTPMUICBZAKLnH2wb9ZlUw04fHqbr/TBPWMRJ4hLJDcpPn2ofyEGxQzq+j+ijOY14mgffoqVguAKLKyDRiRy+uQTyQWgNF2B3CqRuN8OknNYEPADMUBjLzOVcJmprg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3038.namprd11.prod.outlook.com (2603:10b6:805:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 26 Mar
 2021 14:37:31 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 14:37:31 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH v3 1/2] valgrind: update 3.16.1 -> 3.17.0
Date: Fri, 26 Mar 2021 07:37:09 -0700
Message-Id: <20210326143710.168053-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <166FB59AC0FDC39E.19792@lists.openembedded.org>
References: <166FB59AC0FDC39E.19792@lists.openembedded.org>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY3PR04CA0011.namprd04.prod.outlook.com (2603:10b6:a03:217::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 14:37:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a7b3e89-325a-4118-635c-08d8f064afef
X-MS-TrafficTypeDiagnostic: SN6PR11MB3038:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3038A6A57DED4BCD93C6914280619@SN6PR11MB3038.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pYGH/Y9o6QBC7qQmedMk296epy790ixHDnFxiCVbiTCOfO8h1EBguCTMroxhQtqv9PF4Q+QEQO+O5fFkfTZPTODq2RtcTRNAhZkvQpHkB5VFbzNgSXUA2GuPCZb0FIxrpTaAXtCXH3JK6iNthYJqPKzHQtQuV7srShSHl/D8ajOjYuwvN2T6nK77S8XCEHyiCt7ZxBFuGluZoqg0VXTMNC+WcA294+QJYfrRAd0fQMkDNlBfFaAEk9YAXfjm0pi+dEfPgBJWhCQyIvimvKr7AVSLfqAhivvwmkbQbis89sk77kST1SlFYnQxt25SFOZWqrU47aCGKK4Uqgn4McZ1OaAkSfzeUGus2HCGjfQVJPCNDRZp7F5gmS0JOr3lNmlouysO8LWDBiE1v5tWEcNih3ruAi+S/sjci9DexFtlQTP+UGA5EpKuwWKIDimbeuhSWeagk9rRzL7IL96RwpOWgCoLeFxyWt+j8DZ+78B6nNPD3uNhyRbvcR96Nufrmwcy1dDS6Yfsdc6oTp/pTJRupJwzKvcX2MJMN0mkYZOIfyfqeynf3UBX30AMVvE48I5FpN5SrpFHcyiKHYbM2g6d31lzFil2BoQC3cBFIPvV7xr6LT4WhzQv6JvA4ofyTWJzeiweBnc7Vn4X++y9o+WgkfBJf0uzP91GzLOzCv6+64sMGIU6UYNKh8QyiF5/54wf6dGsKurLjL3jIOU4z2zbgTjj/6MLzSzGuQsDU3r0XNLM1i5Fo1abQL2KMNcsSRAJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(8936002)(83380400001)(6916009)(5660300002)(30864003)(316002)(8676002)(36756003)(15650500001)(66556008)(19627235002)(6506007)(66476007)(86362001)(16526019)(6512007)(52116002)(66946007)(53546011)(6666004)(26005)(2616005)(1076003)(956004)(186003)(478600001)(966005)(38100700001)(2906002)(6486002)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DkyMHzzG92BT1BZBwIT4BTMwx4WZIJp7dwwOkTIJR1sCy37fxXmP4rJjXBVy?=
 =?us-ascii?Q?I67hRAQPiZqMzbWljPbDtPXYQWV+QTYYdJs6yk7oofQa2sdYizQb7MgEx1zD?=
 =?us-ascii?Q?QLyDy8Dc2gYVNN/XEDzUFA7QLSXU5Vs5psebfIPWbn4CFpaMqBvU8cC9UMER?=
 =?us-ascii?Q?RvBeQEpxnJOQjpwIiizmbcV07ni7EOUlzR6apv7ma8wkanHbCp1pInO3aROs?=
 =?us-ascii?Q?0paH2vDhHeWqr2KDcvitNf34RgyvfQhRSCwV7lYcp7wpiPrrVMUXZtkHtKZ5?=
 =?us-ascii?Q?RsjYO6eXjQB6qwUTVcT+ZX5yoIab1c5bBlOecXhQ718O/aSIBg+p4Z9A1dM7?=
 =?us-ascii?Q?2Vsz68xOhUcJrH0PSzP7iLNhqyiQPnO6Aj0IUMcx7o28gWbFYJS/zf2qVMoD?=
 =?us-ascii?Q?670sjzFn+VE1abSpRW852XyChzbyZ0phpl+xkNRJInuQVSB9K88mE2UfC1nu?=
 =?us-ascii?Q?TMuqabGJPtlXBJ4/TB0sN8k6CK6EGo4EkHyBKlICTcuD3TK7jfkzBjB6rVfc?=
 =?us-ascii?Q?ILAJGZI/3No5CRNYD6UHjeocIsXWs9SsVtp8H7BR8X//RFoBvzQejakdaYKZ?=
 =?us-ascii?Q?55KVsJhlkiW/IsKif+ptEFgJ17CQNaEfGbsm/+Epg3r1F95sku4BrAlKhRGG?=
 =?us-ascii?Q?9iHRWDDpG1aPO5o9VseViOyK706/l7Tj4Ft0+JRCUeVMRqaG1NyU791hlz7Y?=
 =?us-ascii?Q?hpY3Ly+/JXqzsxYdk9j44tq8XUzneeUHTu++7Mw7viHzHdXKEOXNDnWZaIDE?=
 =?us-ascii?Q?rabIRoxe61DAyff979aFoDrR4f6asAK7ROGwKILXAqHaGTFgXZDdw+6MDT8j?=
 =?us-ascii?Q?H+PmEgwiEF6NCpbGu2ROtHQ5yyWQF/RwW9v9v86sfmqMQUKOYD4JxFWcYFn6?=
 =?us-ascii?Q?dcMQ5QDG+EsH0D18MGZ3v+YAd3oWjwiQnlm6ViOsmv63Yp9td4TcjLAq/LhP?=
 =?us-ascii?Q?sHU5QDklKDxBZ4nQkRtA/R23guC+XquJFacTNYy/FWhPNkdZMzjobM5n5WLr?=
 =?us-ascii?Q?x9vK5e9MoFIu2bamiWcmXUgCMTIhMMHhDSgbYnf7w5F1qA1OsAA9fwHPsvKS?=
 =?us-ascii?Q?pLn4dtse7+5SiaCILjSz3PMc5sCvkt5AqQTVLvgLpi/YGMjIo2g491JaUkS9?=
 =?us-ascii?Q?fIb/yn3WqPszDTe3yxwUf7GO5Y0Feg0E+V6wMmKISWg56psZDLugl62y/Yls?=
 =?us-ascii?Q?lQNnG/e7TuUTEeddsmKEGiNt4ofljPlZ/nlW9TL4C99vOX2LXxvd2SbRISq8?=
 =?us-ascii?Q?VtqhnnlfH9fih/gy2my20hwzGvgDIRBXUsZ13hy5iGx9JgO00B+SwZ7wI+ZJ?=
 =?us-ascii?Q?oC89AXSz1JRkB9yx9GaH6YhR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7b3e89-325a-4118-635c-08d8f064afef
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 14:37:31.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXLtz/dLLi+Kmdp2Z5E7PK7JgF/vT+uqlIdvEGoLrY6qzZkFNY9IAw/vJqXY4uha9rJ9JMdMkmjBTE8s2duWMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3038
Content-Type: text/plain

Notable changes:
* library is now in libexecdir instead of libdir

Added patches:
* Add musl.supp: missing musl.supp in 3.17.0

Dropped backport patches:
* nlcontrolc: found in c79180a3afcf65902e578646c3b716cc749db406
* drd Fedora33: found in 15330adf7c2471fbaa6a0818db07078d81dbff97
* lmw lswi ppc64le: found in 74b74174d572fee4015b8f4e326db3cd949bcdc3

Other dropped patches
* helgrind intercept: found in d2d54dbcc74244adfc0c80b40862edf2b82f53b9
* drd musl fix: found in d2d54dbcc74244adfc0c80b40862edf2b82f53b9

TESTING RESULTS:
qemux86-64:
FAIL: drd/tests/swapcontext

      3.17.0  3.16.1
===================
TOTAL:  736    726
PASSED: 694    688
FAILED:   1      0
SKIPPED: 41     38

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
Changes for V2:

minor edit to commit msg

fix reproducibility

+    # point the expanded @abs_top_builddir@ of the host to PTEST_PATH
+    sed -i s:${S}:${PTEST_PATH}:g \
+        ${D}${PTEST_PATH}/memcheck/tests/linux/debuginfod-check.vgtest

 .../valgrind/0001-Add-missing-musl.supp.patch |  72 +++++++
 ...gtest-hanging-on-newer-glibc-and-or-.patch | 200 ------------------
 .../valgrind/0001-drd-Port-to-Fedora-33.patch |  48 -----
 .../valgrind/valgrind/0001-drd-musl-fix.patch |  31 ---
 ...01-helgrind-Intercept-libc-functions.patch |  54 -----
 ...ated-PowerPC-insns-aren-t-allowed-on.patch |  62 ------
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch |   2 +-
 ...ntext-APIs-are-not-available-on-musl.patch |  50 ++++-
 .../valgrind/valgrind/fixed-perl-path.patch   |  20 +-
 .../valgrind/valgrind/run-ptest               |   3 +-
 .../valgrind/valgrind/s390x_vec_op_t.patch    |  24 ++-
 ...{valgrind_3.16.1.bb => valgrind_3.17.0.bb} |  25 ++-
 12 files changed, 165 insertions(+), 426 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Add-missing-musl.supp.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.16.1.bb => valgrind_3.17.0.bb} (92%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Add-missing-musl.supp.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Add-missing-musl.supp.patch
new file mode 100644
index 0000000000..2a73f7e81f
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Add-missing-musl.supp.patch
@@ -0,0 +1,72 @@
+From 61bc8664f93cd980831c9da4a3e8a385b089a0ab Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Tue, 23 Mar 2021 09:32:22 -0700
+Subject: [PATCH] Add missing musl.supp
+
+3.17 did not ship musl.supp in the tarball.
+
+This is a workaround until next release.
+
+Upstream-Status: Backport [dde556d51f8226a6de564a00bf82536bb7042c54]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ musl.supp | 46 ++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 46 insertions(+)
+ create mode 100644 musl.supp
+
+diff --git a/musl.supp b/musl.supp
+new file mode 100644
+index 000000000..864172a24
+--- /dev/null
++++ b/musl.supp
+@@ -0,0 +1,46 @@
++# Suppressions for musl libc
++# See: https://www.openwall.com/lists/musl/2017/06/15/4
++
++{
++   musl-dynlink-false-positive1
++   Memcheck:Leak
++   fun:calloc
++   fun:load_direct_deps
++   fun:load_deps
++   fun:load_deps
++   fun:__dls3
++   fun:__dls2b
++   fun:__dls2
++}
++
++{
++   musl-dynlink-false-positive2
++   Memcheck:Leak
++   fun:calloc
++   fun:load_direct_deps
++   fun:load_deps
++   fun:load_deps
++   fun:__dls3
++   fun:__dls2
++}
++
++{
++   musl-dynlink-false-positive3
++   Memcheck:Leak
++   fun:calloc
++   fun:load_library
++   fun:load_preload
++   fun:__dls3
++   fun:__dls2b
++   fun:__dls2
++}
++
++{
++   musl-dynlink-false-positive4
++   Memcheck:Leak
++   fun:calloc
++   fun:load_library
++   fun:load_preload
++   fun:__dls3
++   fun:__dls2
++}
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
deleted file mode 100644
index 98cbcd132c..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From 83c24e31df6932a6d4fced179050c6d8d8c6f3b5 Mon Sep 17 00:00:00 2001
-From: Philippe Waroquiers <philippe.waroquiers@skynet.be>
-Date: Sun, 7 Mar 2021 22:29:27 +0100
-Subject: [PATCH] Fix nlcontrolc.vgtest hanging on newer glibc and/or arm64
-
-This test verifies that GDB can interrupt a process with all threads
-blocked in a long select syscall.
-The test used to terminate by having GDB modifying the select argument.
-However, modifying the select argument works only for specific arch
-and/or specific versions of glibc.
-The test then blocks on other architectures/glibc versions.
-
-The previous version of the test was:
-  * first launching sleepers so as to have all threads blocked in long select
-  * interrupting these threads
-  * changing the select time arg so that the threads burn cpu
-  * and then change variables to have the program exit.
-
-The new version does:
-  * first launches sleepers so that all threads are burning cpu.
-  * interrupting these threads
-  * change the local variables of sleepers so that the threads will
-    block in a long select syscall
-  * interrupt these threads
-  * kill the program.
-
-With this new version, we still check the behaviour of gdb+vgdbserver
-for both burning and sleep threads, but without having the termination
-depending on modifying select syscall argument.
-
-Tested on debian amd64 and on ubuntu arm64 (to check the test does not hang
-on an arm64 platform).
-
-Upstream-Status: Backport
-
-From commit on master:
-c79180a3afcf65902e578646c3b716cc749db406
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- gdbserver_tests/nlcontrolc.stderr.exp  |  4 +-
- gdbserver_tests/nlcontrolc.stdinB.gdb  | 57 +++++++++++++++-----------
- gdbserver_tests/nlcontrolc.stdoutB.exp | 25 ++++++-----
- gdbserver_tests/nlcontrolc.vgtest      | 12 +++---
- 4 files changed, 56 insertions(+), 42 deletions(-)
-
-diff --git a/gdbserver_tests/nlcontrolc.stderr.exp b/gdbserver_tests/nlcontrolc.stderr.exp
-index ac75bb3da..b63a9a988 100644
---- a/gdbserver_tests/nlcontrolc.stderr.exp
-+++ b/gdbserver_tests/nlcontrolc.stderr.exp
-@@ -3,9 +3,9 @@ Nulgrind, the minimal Valgrind tool
- (action at startup) vgdb me ... 
- 
- 
--loops/sleep_ms/burn/threads_spec/affinity:  1000000000 1000000000 1000000000 BSBSBSBS 1
-+loops/sleep_ms/burn/threads_spec/affinity:  1000000000 0 100000 BSBSBSBS 1
- Brussels ready to sleep and/or burn
- London ready to sleep and/or burn
- Petaouchnok ready to sleep and/or burn
- main ready to sleep and/or burn
--
-+Gdb request to kill this process
-diff --git a/gdbserver_tests/nlcontrolc.stdinB.gdb b/gdbserver_tests/nlcontrolc.stdinB.gdb
-index 667ece18d..ea4fcd530 100644
---- a/gdbserver_tests/nlcontrolc.stdinB.gdb
-+++ b/gdbserver_tests/nlcontrolc.stdinB.gdb
-@@ -9,32 +9,43 @@ shell ./simulate_control_c --vgdb-prefix=./vgdb-prefix-nlcontrolc 1 grep main nl
- #
- continue
- #
--# Here, all tasks should be blocked in a loooonnnng select, all in WaitSys
--info threads
--# We will unblock them by changing their timeout argument
--# To avoid going into the frame where the timeval arg is,
--# it has been defined as global variables, as the nr
--# of calls on the stack differs between 32bits and 64bits,
--# and/or between OS.
--# ensure select finishes in a few milliseconds max:
--p t[0].tv_sec = 0
--p t[1].tv_sec = 0
--p t[2].tv_sec = 0
--p t[3].tv_sec = 0
--#
--# We will change the burning parameters in a few  seconds
-+# Threads are burning cpu now
-+# We would like to fully test info threads here, but which thread are Runnable
-+# or Yielding is unpredictable. With a recent enough gdb, check the nr of
-+# threads by state using pipe commands and grep/wc.
-+init-if-undefined $_gdb_major = 0
-+init-if-undefined $_gdb_minor = 0
-+if $_gdb_major >= 9
-+  | info threads | grep VgTs_Runnable | wc -l
-+  | info threads | grep VgTs_Yielding | wc -l
-+else
-+  echo 1\n
-+  echo 3\n
-+end
-+# We change the variables so that all the threads are blocked in a syscall
-+p burn = 0
-+p sleepms = 1000000
-+#
-+#
- shell ./simulate_control_c --vgdb-prefix=./vgdb-prefix-nlcontrolc 1 grep changed nlcontrolc.stdoutB.out
- #
--echo changed burning parameters\n
-+echo changed burning parameters to sleeping parameters\n
- continue
-+# Here, all tasks should be blocked in a loooonnnng select, all in WaitSys
-+info threads
-+# We reset the sleepms to 0. The threads should still be blocked in the syscall
-+p sleepms = 0
-+shell ./simulate_control_c --vgdb-prefix=./vgdb-prefix-nlcontrolc 1 grep reset nlcontrolc.stdoutB.out
- #
--# Threads are burning cpu now
--# We would like to test info threads here, but which thread are Runnable or Yielding
--# is unpredictable.
--# info threads
--p burn = 0
--p loops = 0
--p report_finished = 0
-+echo reset to sleeping parameters\n
- continue
--# and the process should stop very quickly now
-+# threads should still be blocked in a loooonnnng select, all in WaitSys
-+info threads
-+if $_gdb_major >= 9
-+  | info threads | grep VgTs_WaitSys | wc -l
-+else
-+  echo 4\n
-+end
-+# Make the process die.
-+kill
- quit
-diff --git a/gdbserver_tests/nlcontrolc.stdoutB.exp b/gdbserver_tests/nlcontrolc.stdoutB.exp
-index e8a5ff8ba..2e8dc8498 100644
---- a/gdbserver_tests/nlcontrolc.stdoutB.exp
-+++ b/gdbserver_tests/nlcontrolc.stdoutB.exp
-@@ -1,18 +1,21 @@
- Continuing.
- Program received signal SIGTRAP, Trace/breakpoint trap.
-+do_burn () at sleepers.c:41
-+41	   for (i = 0; i < burn; i++) loopnr++;
-+ > > > > > >1
-+3
-+$1 = 0
-+$2 = 1000000
-+changed burning parameters to sleeping parameters
-+Continuing.
-+Program received signal SIGTRAP, Trace/breakpoint trap.
- 0x........ in syscall ...
- * 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
--$1 = 0
--$2 = 0
- $3 = 0
--$4 = 0
--changed burning parameters
-+reset to sleeping parameters
- Continuing.
- Program received signal SIGTRAP, Trace/breakpoint trap.
--do_burn () at sleepers.c:41
--41	   for (i = 0; i < burn; i++) loopnr++;
--$5 = 0
--$6 = 0
--$7 = 0
--Continuing.
--Program exited normally.
-+0x........ in syscall ...
-+* 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
-+ > > > >4
-+Kill the program being debugged? (y or n) [answered Y; input not from terminal]
-diff --git a/gdbserver_tests/nlcontrolc.vgtest b/gdbserver_tests/nlcontrolc.vgtest
-index bb5308403..09edfcaba 100644
---- a/gdbserver_tests/nlcontrolc.vgtest
-+++ b/gdbserver_tests/nlcontrolc.vgtest
-@@ -4,16 +4,16 @@
- #          and modify some variables
- #   the user can control-c an process with all threads in Running/Yielding
- #          and modify some variables
--# sleepers is started with argument so that it will compute during ages.
--# The variable modifications means it will exit in a reasonable time.
--# This test is disabled on Solaris because modifying select/poll/ppoll timeout
--# has no effect if a thread is already blocked in that syscall.
-+# sleepers is started so that it burns CPU.
-+# We then interrupt the process.
-+# We modify variables so that instead of burning cpu, sleepers blocks
-+# all threads in a select syscall.
- prog: sleepers
--args: 1000000000 1000000000 1000000000 BSBSBSBS 1
-+args: 1000000000 0 100000 BSBSBSBS 1
- vgopts: --tool=none --vgdb=yes --vgdb-error=0 --vgdb-prefix=./vgdb-prefix-nlcontrolc
- stderr_filter: filter_stderr
- # Bug 338633 nlcontrol hangs on arm64 currently.
--prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && ! ../tests/os_test solaris
-+prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/os_test solaris
- progB: gdb
- argsB: --quiet -l 60 --nx ./sleepers
- stdinB: nlcontrolc.stdinB.gdb
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
deleted file mode 100644
index 37f6ea667d..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Sat, 19 Sep 2020 08:08:59 -0700
-Subject: [PATCH] drd: Port to Fedora 33
-
-Apparently on Fedora 33 the POSIX thread functions exist in both libc and
-libpthread. Hence this patch that intercepts the pthread functions in
-libc. See also https://bugs.kde.org/show_bug.cgi?id=426144 .
-
-Signed-off-by: Bart Van Assche <bvanassche@acm.org>
-
-This patch was imported from the valgrind sourceware server
-(https://sourceware.org/git/?p=valgrind.git;a=commit;h=15330adf7c2471fbaa6a0818db07078d81dbff97)
-It was modified to remove the changes to the valgrind NEWS file,
-as these are difficult to maintain and don't impact the valgrind 
-code itself.
-
-Upstream-Status: Backport
-
-Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
----
- drd/drd_pthread_intercepts.c | 9 +++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
-index 58c45aaec..c2882e5ab 100644
---- a/drd/drd_pthread_intercepts.c
-+++ b/drd/drd_pthread_intercepts.c
-@@ -174,7 +174,16 @@ static int never_true;
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
-    { return implf argl; }
- #else
-+/*
-+ * On Linux, intercept both the libc and the libpthread functions. At
-+ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthread
-+ * functions in both libc and libpthread. Older glibc versions only have an
-+ * implementation of the pthread functions in libpthread.
-+ */
- #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
-+   { return implf argl; }                                               \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
-    { return implf argl; }
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
deleted file mode 100644
index e96bf3c611..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-The changes in 0001-drd-Port-to-Fedora-33.patch break builds on musl. These
-need a __GLIBC__ guard to ensure musl builds continue to work.
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: valgrind-3.16.1/drd/drd_pthread_intercepts.c
-===================================================================
---- valgrind-3.16.1.orig/drd/drd_pthread_intercepts.c
-+++ valgrind-3.16.1/drd/drd_pthread_intercepts.c
-@@ -180,6 +180,7 @@ static int never_true;
-  * functions in both libc and libpthread. Older glibc versions only have an
-  * implementation of the pthread functions in libpthread.
-  */
-+#ifdef __GLIBC__
- #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
-@@ -187,6 +188,12 @@ static int never_true;
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
-    { return implf argl; }
-+#else
-+#define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
-+   { return implf argl; }
-+#endif
- #endif
- 
- /**
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch b/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
deleted file mode 100644
index f66df3d2d2..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From cdec010444df5a4328e90d07a2024fdeefcc74b5 Mon Sep 17 00:00:00 2001
-From: Paul Floyd <paulf@free.fr>
-Date: Wed, 18 Nov 2020 12:49:20 -0400
-Subject: [PATCH] helgrind: Intercept libc functions
-
-PTH_FUNC definition needs to be modified in order to
-intercept posix thread functions in both libc and
-libpthread. In order to handle this in helgrind, weak alias
-the pthread functions in glibc.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Paul Floyd <paulf@free.fr>
-Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
----
- helgrind/hg_intercepts.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/helgrind/hg_intercepts.c b/helgrind/hg_intercepts.c
-index a10c3a4a3..316140ca6 100644
---- a/helgrind/hg_intercepts.c
-+++ b/helgrind/hg_intercepts.c
-@@ -77,6 +77,11 @@
- /*---                                                          ---*/
- /*----------------------------------------------------------------*/
- 
-+#define hg_expand(tok) #tok
-+#define hg_str(tok) hg_expand(tok)
-+# define hg_weak_alias(name, aliasname) \
-+  extern __typeof (name) aliasname __attribute__ ((weak, alias(hg_str(name))))
-+
- #if defined(VGO_solaris)
- /* On Solaris, libpthread is just a filter library on top of libc.
-  * Threading and synchronization functions in runtime linker are not
-@@ -91,9 +96,16 @@
- #define CREQ_PTHREAD_T Word
- #define SEM_ERROR ret
- #else
-+#ifdef MUSL_LIBC
-+#define PTH_FUNC(ret_ty, f, args...) \
-+   ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args); \
-+   ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args)
-+#else
- #define PTH_FUNC(ret_ty, f, args...) \
-    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args); \
-+   hg_weak_alias(I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f), I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBC_SONAME,f)); \
-    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args)
-+#endif
- #define CREQ_PTHREAD_T pthread_t
- #define SEM_ERROR errno
- #endif /* VGO_solaris */
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch b/meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch
deleted file mode 100644
index 7c62144978..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 0748ed5403a75c12ad9137b3fabf9d8397206ed8 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Tue, 1 Dec 2020 13:57:39 +0100
-Subject: [PATCH] lmw, lswi and related PowerPC insns aren't allowed on ppc64le
-
-lmw, lswi and related PowerPC insns aren't allowed on ppc64le
-
-Newer binutils produce an error when the assembly contains lmw, stmw,
-lswi, lswx, stswi, or stswx instructions in little-endian mode.
-
-Only build and run the lsw and ldst_multiple testcases on ppc64[be].
-
-https://bugs.kde.org/show_bug.cgi?id=427870
-Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=74b74174d572fee4015b8f4e326db3cd949bcdc3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- none/tests/ppc64/Makefile.am          | 9 ++++++---
- none/tests/ppc64/ldst_multiple.vgtest | 1 +
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/none/tests/ppc64/Makefile.am b/none/tests/ppc64/Makefile.am
-index 9bc0d0a..9d1e8b7 100644
---- a/none/tests/ppc64/Makefile.am
-+++ b/none/tests/ppc64/Makefile.am
-@@ -54,16 +54,20 @@ EXTRA_DIST = \
- 
- check_PROGRAMS = \
- 	allexec \
--	lsw jm-insns round \
-+	jm-insns round \
- 	test_isa_2_06_part1 test_isa_2_06_part2 test_isa_2_06_part3 \
- 	test_dfp1 test_dfp2 test_dfp3 test_dfp4 test_dfp5 \
- 	test_isa_2_07_part1 test_isa_2_07_part2 \
- 	test_isa_3_0 \
- 	subnormal_test \
--	test_tm test_touch_tm ldst_multiple data-cache-instructions \
-+	test_tm test_touch_tm data-cache-instructions \
- 	power6_mf_gpr std_reg_imm \
- 	twi_tdi tw_td power6_bcmp
- 
-+# lmw, stmw, lswi, lswx, stswi, stswx compile (and run) only on big endian.
-+if VGCONF_PLATFORMS_INCLUDE_PPC64BE_LINUX
-+check_PROGRAMS += lsw ldst_multiple
-+endif
- 
- AM_CFLAGS    += @FLAG_M64@
- AM_CXXFLAGS  += @FLAG_M64@
-@@ -175,4 +179,3 @@ test_isa_2_07_part2_LDADD = -lm
- test_tm_LDADD = -lm
- test_touch_tm_LDADD = -lm
- test_isa_3_0_LDADD = -lm
--
-diff --git a/none/tests/ppc64/ldst_multiple.vgtest b/none/tests/ppc64/ldst_multiple.vgtest
-index 87e668e..22dd46c 100644
---- a/none/tests/ppc64/ldst_multiple.vgtest
-+++ b/none/tests/ppc64/ldst_multiple.vgtest
-@@ -1 +1,2 @@
-+prereq: ../../../tests/is_ppc64_BE
- prog: ldst_multiple
--- 
-2.31.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index d641998d72..e421ac6c80 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -19,7 +19,7 @@ index 6e5a797b9..0ede1ab18 100644
 @@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
  
  
- FILE DESCRIPTORS: 6 open at exit.
+ FILE DESCRIPTORS: 6 open (3 std) at exit.
 -Open file descriptor ...: /tmp/data2
 +Open file descriptor ...: ...
     ...
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
index 480fe33247..7f0e38cb95 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
@@ -1,18 +1,58 @@
-From bd4e926e7e14747b3cd4d7b2a1bd5410b22f3ea2 Mon Sep 17 00:00:00 2001
+From 26c104adf6c5162572b7aa2fac89d0835b7f8f0b Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Tue, 16 Oct 2018 21:27:46 -0400
 Subject: [PATCH] context APIs are not available on musl
 
-Upstream-Status: Pending
-
 Updated patch for valgrind-3.14
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+
+Apply same patch to drd/tests/swapcontext.c
+for valgrind-3.17.
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=434775]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
+ drd/tests/swapcontext.c              | 6 ++++++
  memcheck/tests/linux/stack_changes.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
+ 2 files changed, 12 insertions(+), 1 deletion(-)
 
+diff --git a/drd/tests/swapcontext.c b/drd/tests/swapcontext.c
+index 622c70bc5..5e72bb0f3 100644
+--- a/drd/tests/swapcontext.c
++++ b/drd/tests/swapcontext.c
+@@ -20,6 +20,7 @@
+ 
+ #define STACKSIZE (PTHREAD_STACK_MIN + 4096)
+ 
++#ifdef __GLIBC__
+ typedef struct thread_local {
+   ucontext_t uc[3];
+   size_t nrsw;
+@@ -67,9 +68,11 @@ void *worker(void *data)
+   swapcontext(&tlocal->uc[0], &tlocal->uc[1]);
+   return NULL;
+ }
++#endif
+ 
+ int main(int argc, char *argv[])
+ {
++#ifdef __GLIBC__
+   enum { NR = 32 };
+   thread_local_t tlocal[NR];
+   pthread_t thread[NR];
+@@ -94,6 +97,9 @@ int main(int argc, char *argv[])
+ 
+   for (i = 0; i < NR; i++)
+     pthread_join(thread[i], NULL);
++#else
++    printf("libc context call APIs e.g. getcontext() are deprecated by posix\n");
++#endif
+ 
+   return 0;
+ }
 diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/stack_changes.c
 index 7f97b90a5..a26cb4ae6 100644
 --- a/memcheck/tests/linux/stack_changes.c
@@ -48,5 +88,5 @@ index 7f97b90a5..a26cb4ae6 100644
      return 0;
  }
 -- 
-2.17.0
+2.17.1
 
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index b431d3356e..db6867f625 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From 67e7a690107efb16d6d5aebfe420b64a552accdf Mon Sep 17 00:00:00 2001
+From d85cc45e0ddeda68adf594dead715964cb32d0e7 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
@@ -22,10 +22,11 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  cachegrind/cg_diff.in     | 2 +-
  massif/ms_print.in        | 2 +-
  perf/vg_perf.in           | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
+ tests/vg_regtest.in       | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/cachegrind/cg_annotate.in b/cachegrind/cg_annotate.in
-index 69365e8..978265d 100644
+index fea114b..5e814fd 100644
 --- a/cachegrind/cg_annotate.in
 +++ b/cachegrind/cg_annotate.in
 @@ -1,4 +1,4 @@
@@ -35,7 +36,7 @@ index 69365e8..978265d 100644
  ##--------------------------------------------------------------------##
  ##--- Cachegrind's annotator.                       cg_annotate.in ---##
 diff --git a/cachegrind/cg_diff.in b/cachegrind/cg_diff.in
-index 395460b..05873cc 100755
+index 9d9258e..d0f0ec7 100755
 --- a/cachegrind/cg_diff.in
 +++ b/cachegrind/cg_diff.in
 @@ -1,4 +1,4 @@
@@ -45,7 +46,7 @@ index 395460b..05873cc 100755
  ##--------------------------------------------------------------------##
  ##--- Cachegrind's differencer.                         cg_diff.in ---##
 diff --git a/massif/ms_print.in b/massif/ms_print.in
-index e6fae89..3b85b40 100755
+index a206ce4..df1bc31 100755
 --- a/massif/ms_print.in
 +++ b/massif/ms_print.in
 @@ -1,4 +1,4 @@
@@ -55,7 +56,7 @@ index e6fae89..3b85b40 100755
  ##--------------------------------------------------------------------##
  ##--- Massif's results printer                         ms_print.in ---##
 diff --git a/perf/vg_perf.in b/perf/vg_perf.in
-index 7a80cb0..28f6156 100644
+index 90ee1d2..c585096 100644
 --- a/perf/vg_perf.in
 +++ b/perf/vg_perf.in
 @@ -1,4 +1,4 @@
@@ -65,7 +66,7 @@ index 7a80cb0..28f6156 100644
  ##--- Valgrind performance testing script                  vg_perf ---##
  ##--------------------------------------------------------------------##
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index cb05b52..032e947 100755
+index 0fe6341..1b45eb7 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -1,4 +1,4 @@
@@ -74,5 +75,6 @@ index cb05b52..032e947 100755
  ##--------------------------------------------------------------------##
  ##--- Valgrind regression testing script                vg_regtest ---##
  ##--------------------------------------------------------------------##
----
-2.4.0
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index e8a1a668fc..3e0205fe6e 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -7,6 +7,7 @@
 # Randy MacLeod <Randy.MacLeod@windriver.com>
 ###############################################################
 VALGRIND_LIB=@libdir@/valgrind
+VALGRIND_LIBEXECDIR=@libexecdir@/valgrind
 VALGRIND_BIN=@bindir@/valgrind
 
 LOG="${VALGRIND_LIB}/ptest/valgrind_ptest_$(date +%Y%m%d-%H%M%S).log"
@@ -33,7 +34,7 @@ fi
 
 cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
     --valgrind=${VALGRIND_BIN} \
-    --valgrind-lib=${VALGRIND_LIB} \
+    --valgrind-lib=${VALGRIND_LIBEXECDIR} \
     --yocto-ptest \
     gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
     2>&1|tee ${LOG}  
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index eea671da0a..bde1241dc7 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,3 +1,8 @@
+From 8154d38bac5cdb3675cfdaf562ab9da01988b263 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Wed, 17 Mar 2021 12:16:31 -0400
+Subject: [PATCH 19/20] remove s390x_vec_op_t
+
 s390x_vec_op_t is not needed anywhere, only elements of enum are accessed
 removing it ensures that valgrind can be built with -fno-common option
 
@@ -6,14 +11,25 @@ ld: ../../VEX/libvex-amd64-linux.a(libvex_amd64_linux_a-guest_s390_helpers.o):/u
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ VEX/priv/guest_s390_defs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
+index 9054290..dab8002 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
-@@ -286,7 +286,7 @@ enum {
-    S390_VEC_OP_VFCHE = 18,
-    S390_VEC_OP_VFTCI = 19,
-    S390_VEC_OP_LAST = 20 // supposed to be the last element in enum
+@@ -284,7 +284,7 @@ typedef enum {
+    S390_VEC_OP_VBPERM,
+    S390_VEC_OP_VMSL,
+    S390_VEC_OP_LAST             // supposed to be the last element in enum
 -} s390x_vec_op_t;
 +};
  
  /* Arguments of s390x_dirtyhelper_vec_op(...) which are packed into one
     ULong variable.
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
similarity index 92%
rename from meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 2b1d185575..1e29896596 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -42,14 +42,10 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
-           file://0001-drd-Port-to-Fedora-33.patch \
-           file://0001-drd-musl-fix.patch \
-           file://0001-helgrind-Intercept-libc-functions.patch \
-           file://0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch \
-           file://0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch \
+           file://0001-Add-missing-musl.supp.patch \
            "
-SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
-SRC_URI[sha256sum] = "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
+SRC_URI[md5sum] = "afe11b5572c3121a781433b7c0ab741b"
+SRC_URI[sha256sum] = "ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
@@ -58,6 +54,7 @@ COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 # argument. Change expected stderr files accordingly.
 do_patch_append() {
     bb.build.exec_func('do_sed_paths', d)
+    
 }
 
 do_sed_paths() {
@@ -110,7 +107,7 @@ do_configure_prepend () {
 }
 
 do_install_append () {
-    install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
+    install -m 644 ${B}/default.supp ${D}/${libexecdir}/valgrind/
     oe_multilib_header valgrind/config.h
 }
 
@@ -125,7 +122,7 @@ VALGRINDARCH_powerpc = "ppc"
 VALGRINDARCH_powerpc64 = "ppc64"
 VALGRINDARCH_powerpc64el = "ppc64le"
 
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/valgrind/vgpreload_memcheck-${VALGRINDARCH}-linux.so"
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-${VALGRINDARCH}-linux.so"
 
 RDEPENDS_${PN} += "perl"
 
@@ -137,7 +134,8 @@ RDEPENDS_${PN}-ptest += " bash coreutils file \
    gdb libgomp \
    perl \
    perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
-   perl-module-overloading \
+   perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
+   perl-module-carp perl-module-symbol \
    procps sed ${PN}-dbg ${PN}-src"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
@@ -222,8 +220,13 @@ do_install_ptest() {
     sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann1.vgtest
     sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann2.vgtest
 
+    # point the expanded @abs_top_builddir@ of the host to PTEST_PATH
+    sed -i s:${S}:${PTEST_PATH}:g \
+        ${D}${PTEST_PATH}/memcheck/tests/linux/debuginfod-check.vgtest
+
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
+    sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
     sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
 
     # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
@@ -238,7 +241,7 @@ do_install_ptest() {
 
 # avoid stripping some generated binaries otherwise some of the tests will fail
 # run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
-INHIBIT_PACKAGE_STRIP_FILES = "\
+INHIBIT_PACKAGE_STRIP_FILES += "\
     ${PKGD}${PTEST_PATH}/none/tests/tls \
     ${PKGD}${PTEST_PATH}/none/tests/tls.so \
     ${PKGD}${PTEST_PATH}/none/tests/tls2.so \
-- 
2.17.1

