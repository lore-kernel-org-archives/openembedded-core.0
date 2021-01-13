Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.73])
 by mx.groups.io with SMTP id smtpd.web11.5240.1610525607058921961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 00:13:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=cFtF9vXK;
 spf=pass (domain: kpit.com, ip: 40.107.138.73, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIXA9kWYGCKWWFlNmQH4Q5lEYevKN8PM3ENy2xdJ5mqu3Gn1oRB3A4UE0e8t3VsvOQ8MtEVMqrfU0ST+TPTpCBSBCrcBx2b+InjuggFIA+Nioxi/tlvoIV98FysGzM16TieF5SyJuC6qebdPSc3bJYrBj+L8HyeNptlwTsEiojYPHoz4J0MVkF3+z5LrwFXAhmFIRbSlPltuzdqoysZrLOxvzDxrwor3oG/x2kUmqB65BUh072oc8JJJwSgCsA2eW24TO4/7Hngg87M3kNxFNfWsNlv+9NZ4pr0nn2NnoM6jZQ/dBWxBsa5WJPBSMriUseacvJtjm3bchUxyJueZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be9jZ1R0OQnWLB0Hf3yTpmdRHh5j5B2Gide32Yl0Gwo=;
 b=PO8KsgTi7w0Jt9X8W8zin8iTavvJ9wPRKgIX4Oqb3orR7RtrFLFluLSNjsvdZqquDRzDMRXgXtffo+O/PCAH4PXqyKxss/60mhH3w7X9IJF2yeXN4cIAhweYwXBCZAQwqqfpr5Dv3s3kDHTrANHJVI7Z4uCHc9gMjPPFAKfULpNfsDrMYwMo4dHTeiRuurJZB0B2x+s7P5o7h/Xft2buGN2cxY2Bljkrf5kOeaOaditJkV2Oklao2xYCjP2RsXwkicNvIROgSG4VEpL8GPe4sRqlppULTPXMAPZpFR+YI4K/M9fxtrEujOe7bWzDoONDdQzgUqY0tUDO/0hn8xAcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be9jZ1R0OQnWLB0Hf3yTpmdRHh5j5B2Gide32Yl0Gwo=;
 b=cFtF9vXKDPvrmk+dkOKHzZiHlE3r6LMQswibwmrqlGVFs/gIaGBtLs1xDcMrHuisIbCpDxuqYEBCp4n8YA0HF6AAXFn7Qd/uAKFY2BN74Il3L1KTcEt/jr1wtw/3nR8/jbHx2Z/c+0vNDAK8jv77sU4twc9P4i77qaku8eV2dyQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PNZPR01MB4367.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 08:13:20 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3763.010; Wed, 13 Jan 2021
 08:13:19 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com
Subject: [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to latest
Date: Wed, 13 Jan 2021 13:43:09 +0530
Message-Id: <1610525589-21507-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [182.48.232.78]
X-ClientProxiedBy: BM1PR0101CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::18) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (182.48.232.78) by BM1PR0101CA0008.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 08:13:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa34c3ed-4eb5-4820-df73-08d8b79b168e
X-MS-TrafficTypeDiagnostic: PNZPR01MB4367:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB4367A16DDFEDF2D2A500A44DEFA90@PNZPR01MB4367.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qv7DuEi6NRub7NtYUWIST2rbW0bZNNQxHPXAvvL80vWk3cT4TJcYtZcT39/3PTcdxXsb8db70Th4EFnoyHn02IAUgU7p9j4ENtDS4W9Js43QZqAhMvtHWDmxku7x+YGj7J1kc/RXYpBEDExWTCaulbRdk7Z6QlncqNG/yG49rGCPe+cg0n5nuWvi0H2hfp2lee+TjM3recClOz2Qf4HaXoxFwIaFMcUf9LP3w6k4N5yqWsjN0Ys1/dZaKJPnlZ2sWLq9Nj7KAxE9c4YCYP+dISFS12gvUb/lr79XW4jqL79zOaLcncGjPI0W3/MvyFTQDydFiZpjcuW6IwJC7odKQtlbEiU5jeYskOMb6lrzdbnV2gHG5+8EmyoQj46YC4cEXtjHWpB8bDKPxibdIexxbhqPPozE1TyQG6dQ+4RVnDiJWaA5dXgATE2jNpfVSuiBPVLGtoAVQBp2IrIHi7ixs2sE5UGWySTcoip7krOL4kFW1akBUf4+KVK0NCPaVH/kCgQV90ZVr2aYxhLnfToMeECnboCn3Q+y7PY9LoAsWr3y1Zes4MJCWK/ELbMWM+UI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(396003)(136003)(66556008)(19627235002)(5660300002)(66476007)(8936002)(52116002)(107886003)(83380400001)(6506007)(6666004)(316002)(6512007)(186003)(30864003)(478600001)(36756003)(66946007)(69590400011)(26005)(6486002)(2616005)(2906002)(8676002)(66574015)(16526019)(956004)(86362001)(966005)(4326008)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?nRQmU8aiMbhb06Vxvd8H5kxIRBstOyLYNTHotuKITBSMxJ4zHtBkMc/lloHz?=
 =?us-ascii?Q?oEjomOwZ/UY+eRD7JnoeYwf+zdJ0L5VcqWK89QuMLaPjds8dHOiKxzacot3D?=
 =?us-ascii?Q?iAQkZ57Gqh7M2nI5j6QeTKSC5WLekodxPO9Q7kHdO4Z0VvMHqr2lKOs0ESzP?=
 =?us-ascii?Q?pbV4/CMPNbH+EXv0W9VkqT6V5Vvlh+oAfgxa+QW5lxoOAoiqe0RQx648MyLu?=
 =?us-ascii?Q?xxzswgbsUG2RJRmbbDyc6C49kxtMDI4IsHvUaWK5j36sOsPdWPDGQLA/otry?=
 =?us-ascii?Q?wJS6yB1suDA2b05L6bE0UTVYnLvmPGH7/ie0YS2QWSLImcL+GZvgZu8P+Ku6?=
 =?us-ascii?Q?lLJaOKlx596XU3iq6StQMo3L3vY+dEWOB+3d1ASTw+8KYlRHZKgDTq2r31rV?=
 =?us-ascii?Q?7HV+QLDqeY72t4fiBlRBO8bHG4hna79VwPQSwnDLKVCX7fb72o6q9Bc+B2Jd?=
 =?us-ascii?Q?DkyeSTdGcSTJBDWRXymEqKOWTaLqysPzw7x4wXoM+6ZaHlwvbCj4KYAE94LM?=
 =?us-ascii?Q?+unaF4NquWXt0/Q0snmHiitKEGGc4Wu5v04PNx3H/HG31InOZakSlbiUhC7h?=
 =?us-ascii?Q?i5xUgiqFYAh71QYU58gbDyqm2nM83m6i+ADVn2FmiPRQaPapZUS7nNlcpa7X?=
 =?us-ascii?Q?dN4aJlkBN8QqUUFb4ckkIejB1kC1l9Kcwhsu4GMSP9xfadgeQfr9KC4pzbZe?=
 =?us-ascii?Q?7xHqSA75Lgkq9DXCMLdEjSajhaZYs85TB2u7DKejS4HoWY8ZuhHCvPF7fTtr?=
 =?us-ascii?Q?/Q0A9/fl/DIPKmsqpoRoU3WC8mXWn7kGIB4Avo2CEaTV8j93+WegiaRfFdWU?=
 =?us-ascii?Q?DCoVgEaAZeJ3eAAp95ZI/wwvd1WvTAn6V1+dsFoel3ld5yHwNdLDVaUilgwX?=
 =?us-ascii?Q?5x/Fxp8PF2LwMCI4fUP5MHwDQP9XG3tXBYAjMzmiymDfQemTpt4Cfx1kca56?=
 =?us-ascii?Q?Vq5M5fIGKc6hJSyB0HjczUFbYwWufpiM50gHSSwA/V9bVG8F2PiCMpmwXHOE?=
 =?us-ascii?Q?zbyK?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 08:13:18.8488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: fa34c3ed-4eb5-4820-df73-08d8b79b168e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdEdzCZ2haKK7NTWQ6IpuIsEbA0Juc6Ghs3ePhApb0LOsn6CqC9Hz6n1vnmgX998O4PgLhPRm8UARh+SpUGrnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4367
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
ce81bc9 Merge pull request #1760 from escherstair/fix_ce6_support
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
