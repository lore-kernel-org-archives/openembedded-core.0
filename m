Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.81])
 by mx.groups.io with SMTP id smtpd.web10.5095.1610525002941243039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 00:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Nbh1BZhF;
 spf=pass (domain: kpit.com, ip: 40.107.139.81, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bpmlt7GpegmtnjxQ9/3ectIkdOjpfWjvzTrR10dNQTufudA1a2QyITb1vwbiuIPtZZQdQT0bjzisFdJuPn9qnI2EyWL/0XHB18aCOJVu8y9JwMMbvuv99VyE8or8f3oTn1sMHcg9T0JwTiKEbVgWwpt06MnsaL2NBVVBk8MpWz2zikEWaHfMnPF9iYOaMswQOpakF1n8d2BLqjwhosJXoFgKKl4jckJsJuLKutwarViP3gwRmiFkzhEwO9w91L+nm5hP509HEBZvXurZVHf7XAKSsG/qe4BGhXiWfmiwkK8JhBcv2Z+vn9M3JZICeixy6YSQe/T4CqwVEfZGvduDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2WhPq0MVv208r0Fh+UlWRqx20TBMqWKwuKq2VWoSIk=;
 b=QG1Km0mLcK7pcT0qLMOizi5PJkCoB3Te4vn6UrrLVEPiNO+BKKbSIpIlWFL38zi2zXDPi3u3EGZ0i9WZMeH8LXmZRkEg095UP6EJl/nUJO6KCpq3FXmcByr1iXrGWlvfC9dHjZBZaQrHOjJJnX0BuF7N4MFm8a8xMeEvO8ci57lLFkc0MXryejFVYOFm6KkaTfprzokGPcoa4Cf/k/QX4by9eXNORKSSxGVD4fZ/8RlRWz1vALuLXY6gQHMz6SWF4smPYC01qIdDhcJkt+v5i5w4pmmzXrBsJtaaoD2kfwFesJNephXgOlBwhrem3jf8C4OOtVpGCF93Gw+5Qui6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2WhPq0MVv208r0Fh+UlWRqx20TBMqWKwuKq2VWoSIk=;
 b=Nbh1BZhF8v0yWyRB18QceuHUZHhRht+tK2hYGhO4ZdIxz6iKXXOh5Agu0T9/YcPgAqolfEDpXgYG5Opv6OW+16mtjoX09ephod5v7F5szdKsinlWzqOcrA2hGTh8c6Ugnw3B9ey1pGWPjNdr7W63avLfggpQy556Jpa+hBfmF3g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN1PR0101MB1663.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:17::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 08:03:17 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3763.010; Wed, 13 Jan 2021
 08:03:17 +0000
From: harpritkaur.bhandari@kpit.com
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com
Subject: [meta-oe][master][PATCH] rapidjson: Upgrade SRCREV to latest
Date: Wed, 13 Jan 2021 13:33:06 +0530
Message-Id: <1610524986-32470-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [182.48.232.78]
X-ClientProxiedBy: BMXPR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::18) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (182.48.232.78) by BMXPR01CA0078.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 08:03:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ad3bba3-c2e9-4cf5-bdb4-08d8b799af41
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1663:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB16637F047941199173625E0EEFA90@PN1PR0101MB1663.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l3OOvEVIanIsGSjIlHBD6Bz/EaVdY8TeHVxQ399BE2XCaRhnHBGR7/OTnBQQG+NnUkkprURXVB2ACb/c4zq1WfKGB+9OViLUqu042/abjlFHqHFVHxGg5diRxbqfM6WQGxwR/ztjjSyO6QYGAK69gXEKSVzKuPBvXlMI1ZG4eNAmvoAxK5PMK/2MKgx+ovV07eL576Hk0+cNaMaMFc+xZLhcLX+xP2QWBWXKz9RmyivjzDm50uGLd4nEp+vohTLELtoQ0qII4veM1Proa9aEmkBmBMTnj6/eSe7g5qLE927uWKmvjpFfpxFNoJ0wF7bdglsz5ZFwizsRZL2nAphdsKXhMGrEUa652tM0605Q4BsSvmlen36Xq78WHStCZRea93JfUNEQoEC/w8xolJuGDkRgRpTHHS8mePaklpEZD9uK8jTlcDlNUgu1WTab/GVvd7wVTTcwOepohiXQKUEstjV8ffYoY9lRSXK51O/NiKCNm+rB3/PBWgestUqy1rsKicziqaczBhs3HBXxdM4yt23SC7hGMXcUVdPufyOZQ+nLP4J/L0eKWKfDz33LIJfg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39850400004)(366004)(376002)(956004)(2616005)(8676002)(69590400011)(66476007)(6506007)(6486002)(6512007)(5660300002)(52116002)(26005)(2906002)(478600001)(30864003)(86362001)(6666004)(66574015)(8936002)(4326008)(186003)(107886003)(16526019)(66556008)(83380400001)(19627235002)(36756003)(316002)(966005)(66946007)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3u558N6AQHFsw6Rvt0ILdA0Ud0LpoFqvmmNb3ITMFmmEnoawCSs+P6QEBwLE?=
 =?us-ascii?Q?cuTbUK+Q0OVvwb3e5HaocPa06XW56TIaorMqN7BfrTk26TVJSYwPVxXraGv4?=
 =?us-ascii?Q?t3hqW3WXGz71OeWrYp3jyJBmMxQ4MTYY7XHu2FuvwxF82AEy+VLL3NEw1oi9?=
 =?us-ascii?Q?MZ+/AS0flL4ciJZJYSIyeomyUKTvdip3V9hkdT2uhyM/fXdt0AmBhJhNjcdi?=
 =?us-ascii?Q?NrQWwEqZ2HrBopCEiMCo0uL39T4EBTmCrUEYttq1jpsxTgJ6BBGYHMf4dlfE?=
 =?us-ascii?Q?Fx1IHhK1YGmS+wkgWroy368iQcx8WNd/lLvD3KEE0Et+elE9wsfdkPmrCbcc?=
 =?us-ascii?Q?NsOB3nfWXFYy0itIRjBOHtcVL2F8yZPNoG68ELKgZexrIHZq1LT0jxEPvK1v?=
 =?us-ascii?Q?gQvdMyezrOiSyk4hzUHo3+uAUefZtfK9fX3/Nd3BDmTdaUe3m3pFo2aTbVok?=
 =?us-ascii?Q?DI9lpCFamfRpVXRxNyMpn9N/OW87LrXu9heZP9lBwTVEGhGR5kcsKk1hTUsv?=
 =?us-ascii?Q?Bn/S2iLX8TnJoe1VMUtc8GL2zy8UtnBgDqIEsDWxvh06G6Jr0i7ngXDdgSn/?=
 =?us-ascii?Q?HbtuRxtpIohhnKBf2wjsNKvVFUF20A3LjHaa590v0tsNvNfQprf0AdiiuCXe?=
 =?us-ascii?Q?otsO9F5lvUlL1zxAvLMxcUv16ightvRNBS7neJSwosVCGWGoQwHsM+/d68O+?=
 =?us-ascii?Q?LWYfo3sB+u6Oeq29mc31DkUN+yYpTPztynWAPlyb6B9VreugABdHvlcoROlP?=
 =?us-ascii?Q?eK67PGc13f1caaERBksZawpmv7E6GWyFhTRlBtM27BhsmJkoer5WbyFnHHwl?=
 =?us-ascii?Q?2ImI30BnPrK1Q8ZxHraY8PulBks7GEYGIWzRA77RGz8ClrewZAQ3V9eQi6Em?=
 =?us-ascii?Q?WsutMiTR24onSokuCGc4446enUDZo0ZoN5oRR4RBgQPu2Mi+LUmQIsb4OSF5?=
 =?us-ascii?Q?y3JIrf59kx/cTQeQFExiV6EFcKepVkg3BV8zBTjUycSXqkVIeeLdNoJKR9OP?=
 =?us-ascii?Q?7wJm?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 08:03:16.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad3bba3-c2e9-4cf5-bdb4-08d8b799af41
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6OZXewBYHQ9i7cuFqhW02YROjKOTnaDk7U/xI9qv96QYFVTx+//+QAcy0Y9WnnRh1wmxXx72/ldPUm66vEItA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1663
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Upgrade SRCREV to latest as it fixes the below issue:
Running UndefinedBehaviorSanitizer on projects that use
rapidjson triggers 'applying non-zero offset <NN> to null
pointer' findings in 'internal/stack.h' which are hard
to suppress by library users.
Removed "0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
as the changes are already incorporated in the latest
codebase.
As per abi-compliance-checker report the source compatibility
and binary compatibility between previous SRCREV
6a905f9311f82d306da77bd963ec5aa5da07da9c and current
SRCREV 0ccdbf364c577803e2a751f5aededce935314313
is 100% and this patch is already tested on 64bit
ARM (aarch64) in a product with on target CI tests.

Below commits are added in upgrade:

git log --format=3D"%h %s" 6a905f9311f82d306da77bd963ec5aa5da07da9c..0ccdbf=
364c577803e2a751f5aededce935314313
0ccdbf3 Merge pull request #1786 from ssb22/master
b7734d9 Remove unnecessary wording from BSD license not needed for MIT lice=
nse (fixes #528)
ice81bc9 Merge pull request #1760 from escherstair/fix_ce6_support
5fbf8bf fix unit test
7f559ec fix naive implementation for clzll()
58e2964 add unit test for clzll()
aa5dd60 fix naive version implementation
91940e8 fallback to the naive version for CE6
6364c8e fix _BitScanReverse() usage for CE6
f56928d Merge pull request #1744 from lklein53/improve-surrogate-handling
6694c99 Add test case for low surrogate handling
ed73d7b Improve surrogate handling
88bd956 Merge pull request #1453 from eidosmontreal/custom_malloc
004e8e6 Merge branch 'master' into custom_malloc
1a80382 Merge pull request #1720 from madeso/master
ac0fc79 Fixes issue #1718
8f4c021 Merge pull request #1689 from g199209/master
1ce28f4 Add CMake minimum version required.
f376690 Add a target to RapidJSONConfig.cmake.in (#1350)
234ff04 ci: upgrade distro to xenial and add arm64 test cases (#1662)
36481c3 Update Visual Studio Visualizer (#1665)
d4f03d0 Doc: Fix some typos. (#1675)
ebcbd04 Three-way comparison for CLang 10 fix (#1679)
2661a17 Avoid warnings when using -std=3Dc++20 and clang 10: use three way =
comparision for iterators when possible. (#1667)
814bb27 Replace RAPIDJSON_CLZLL with internal clzll (#1660)
563fe5b PrettyWriter constructor uninitialized member (#1654)
2bed293 Update biginteger.h (#1652)
b16cec1 Closes #1643 (#1644)
98f52b6 Fix simple typo: drived -> derived (#1646)
a895ce1 Allow escaped apostrophe in values (#1639)
418331e Merge pull request #1631 from PhoebeHui/dev/Phoebe/vcpkg_instructio=
ns
b4cf6e7 Add vcpkg installation instructions
dfbe1db Merge pull request #1502 from ylavic/compilation_fixes
eeb9d55 Merge pull request #1617 from JPEWdev/master
134af9d Remove shadow typedef
35e480f Merge pull request #1609 from piratf/readme_contributing
6cadd4b add contributing section in readme.md, introduced the basic coopera=
tion process.
6534506 Merge pull request #1603 from piratf/cmakelist_upgrade
46d980b fix CMake policy CMP0048 warning #1154
c4c6a65 Merge pull request #1548 from TranslucentTB/master
e54aca7 Merge branch 'master' of https://github.com/Tencent/rapidjson
bb5f966 Merge pull request #1591 from veekxt/patch-1
67b245e doc: fix a typo
1a825d2 Merge pull request #1529 from rkoshy/master
6a6bed2 Merge pull request #1582 from crazyscot/master
5592c2e Merge pull request #1544 from fredgan/master
39db117 fix some misspellings
4116912 Use C++17 fallthrough tag instead of disabling warning
d67a69a Merge pull request #1490 from MalcolmTyrrell/fixCompileErrorInPoint=
erH
5777291 Merge pull request #1579 from Tencent/vs2010
88a1ba9 Provide default implementations for move constructor/assignment in =
GenericMember
c36b713 Disable copy constructor in GenericMember
6006d6b Merge pull request #1573 from esrrhs/master
02d4ae8 Update travis-doxygen.sh
4c1d9ed Update travis-doxygen.sh
c136acf Update travis-doxygen.sh
b286156 Update travis-doxygen.sh
ed234bf Update .travis.yml
d3c4b2b Update .travis.yml
fcec773 Merge pull request #1567 from AtnNn/master
123d7c8 add test for non-null-terminated token
6102f0b fix template parameter
6fe9977 Allow pointer tokens to have non-null-terminated strings
2648a73 Merge pull request #1557 from MBoldyrev/doc/fix-uint-case
8973b27 fixed Uint case in docs
02230fe Change #ifdef to #if defined
dfc0b35 Update comment
0d671a2 Fix signedness error
07e1d78 Fix build error under non-Clang compilers
d5d7171 Fix ARM NEON under MSVC
a133b16 Merge pull request #1 from Tencent/master
d87b698 Change all GenericMemberIterator from struct to class
c43697c - Fixed a build issue by initializing "index" in the header file
4b3d7c2 Merge pull request #1506 from ylavic/CreatePattern
92f99bc RAPIDJSON_NOEXCEPT_ASSERT() should never throw.
b4538b5 Fix compilation of sortkeys.cpp with MSVC 2013 (hopefully).
94fc463 Add missing curly brackets in STDREGEX's CreatePattern().
c840a7a Fix vs2017 compile error C2105: '--' needs l-value
01950eb Merge pull request #1488 from somone23412/somone23412-fix-typo-1
0798d5b fix typo
e80257a Merge pull request #1481 from liangdzou/patch-1
13687a6 add missing header "ios"
e123f65 Merge pull request #1479 from MaxXSoft/patch-tutorial
d5c5b87 doc/tutorial.zh-cn: fixed some typos
55c3c24 Merge pull request #1477 from eisaev/patch-1
9264a9a Update allocators.h
091de04 Merge pull request #1462 from ra1u/master
40cae03 Allow user to define custom RAPIDJSON_NOEXCEPT_ASSERT macro
3cf4f7c Merge pull request #727 from mapbox/silence-dereference-null-pointe=
r
7484e06 Update doxygen download URL
1ede098 Workaround of sortkeys example
cef07fb Added parameters to RAPIDJSON_MALLOC, RAPIDJSON_REALLOC and RAPIDJS=
ON_FREE
ad2e536 Adding a single customization point that ensures all allocations wi=
thin rapidjson can be performed with a custom memory allocator; Introduces =
the macros RAPIDJSON_MALLOC, RAPIDJSON_REALLOC, and RAPIDJSON_FREE.
b94c2a1 Adding swap() for GenericMember
0739a3e Fix gcc compilation error in sortkeys
f595f8a Update sortkeys.cpp
1892013 Merge pull request #1421 from HomeControlAS/sort_by_name_example
79a6dab Merge pull request #1439 from ylavic/schema_pointer_allocator
93cb84a Merge pull request #1442 from rbilovol/cmake-fixup
efad259 Merge pull request #1444 from leolchat/patch-1
bf09397 Correct complexity claim
8d272e5 CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path
dbb594b Use the allocator of the Schema for its Pointer.
bfdcf49 Merge pull request #1426 from ylavic/pointer_less_than
b56eb28 Merge branch 'master' into pointer_less_than
8549e3d Merge pull request #1431 from ylavic/pointer_swap
2ce91b8 Pointer tests now need <algorithm> (for std::swap), but no tabs.
a66cf79 Allow to (std::)Swap two pointers.
eb6ee17 Speed up Pointer::operator<().
0e34ed4 Rework Pointer::operator<() loop.
af17f19 Unit test for Pointer::operator<().
055f1fa Add less than operator to Pointer.
66eb606 Merge pull request #1425 from ylavic/filereadstream_peek4
b4b0e13 Merge pull request #1424 from ylavic/file_input_streams
eea3e57 Merge pull request #1416 from ylavic/regex_syntax_noassert
38d25d7 Fix FileReadStream::Peek4().
8aab3db Base buffered BasicIStreamWrapper on the original (better performin=
g) FileReadStream algorithm.
124e8b6 Possibly std::ios::binary helps with streams on Windows
2498c57 Optimize FileReadStream and BasicIStreamWrapper.
d018846 removed std::string and receiving const Value in printIt
c9060b4 added example for sorting keys
8c14787 Unit test for invalid GenericRegex (unclosed parenthesis).
be96f4d GenericRegex: don't throw/abort on syntax error (unclosed parenthes=
is).
30d92a6 Merge pull request #1413 from ylavic/schema_regex_leak
1c5b90f Merge pull request #1414 from ylavic/regex_allocator
3e69567 Fix a memory leak for invalid std::regex in Schema.
b0c96f9 Use passed in allocator for internal regex parser.
a632160 Merge pull request #1388 from yhager/yhager/clang-7
595ed48 Merge pull request #1403 from jcmonnin/fix-warning
51ca982 Fix warning when NDEBUG is defined [-Wunused-variable]
0cc44c8 Update test/unittest/pointertest.cpp
a77b49d silence clang-7 self-assign-overloaded warning
67fac85 Merge pull request #1373 from lelit/issue1368
91d50c8 Add test case on kParseNumbersAsStringsFlag being able to load big =
ints
16872af Avoid pointer arithmetic on null pointer to remove undefined behavi=
or
663f076 Merge pull request #1362 from jiapengwen/master
2a5e733 Merge pull request #1364 from jcourtat/fixfaq
68349ed faq: fix document insertion example
1cfa861 fix tutorial error
c0ca05f Merge pull request #1329 from pah/fix-noexcept
c2aa79d Merge pull request #1356 from gongminmin/AppVeyor2017
783b819 Update rapidjson.h
a6be583 Update appveyor rule to support VS2017.
8a96a95 Merge branch 'master' into fix-noexcept
f5f6052 Merge pull request #1327 from gongminmin/FixCompileInVS
08b1a8a Merge pull request #1302 from chwarr/min-max-guard
81af404 Merge pull request #1284 from mobileben/noexcept-assert
73063f5 Merge pull request #1340 from lelit/issue1336
c9eabf9 Extend the test on issue #1336 to cover all basic types
3fc9299 Add simple test for issue #1336
11defb7 Wrap all WriteXxx() calls within EndValue(), to ensure a flush afte=
r root-level scalar value
f54f6b5 Add RAPIDJSON_NOEXCEPT_ASSERT
ff76343 Update the code to adapt the new gtest.
960b9cf Guard against min/max being macros in reader.h
fdd2db9 Updated google test to latest commit
5b0610a Handle non-throwing exception specifications that can still throw #=
1280

Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/=
recipes-devtools/rapidjson/rapidjson_git.bb
index e3ed9c6..5b5c8b2 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,10 +4,9 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://license.txt;md5=3Dba04aa8f65de1396a7e59d1d746=
c2125"

-SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1 \
-           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path=
.patch"
+SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1"

-SRCREV =3D "6a905f9311f82d306da77bd963ec5aa5da07da9c"
+SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"

 PV =3D "1.1.0+git${SRCPV}"

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
