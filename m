Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.611.1610562602223899110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 10:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gM/eKViR;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id p14so3191833qke.6
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 10:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j9JIfVW1jrwMVE2z5RgGEm5tZFG8bYJpwtEmMdOkEbs=;
        b=gM/eKViRUIbPx/0XhKA969Ox1mSn2o9z+nVGvqbx16//Kklf+w+lZkTJvtq7JHNU+u
         kUqrZ55T/5/c/TIneoBW6xUwJGhu/+zahRTUdfrM1k8aRqCweaiAAaYtHGK6qoq728l4
         6BlsEjmO/qyXptFgQBGI+/8W/HZM+sydN9/AA3c1hgSkKOjSJMFso0FatvikLQiDbVg1
         dPo08cqkQ3Hr7Qc310aNKhIEuwSAntb4WwCEAxeNoPsbhs1pACsPQMMrN0sBEjURVQbI
         /nOPdV/fZSWZ9c/v9Y6rxK5ofGeU74V+vJyMPVueR/28XAG9/Te0LXBc029iRAgugh61
         nZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j9JIfVW1jrwMVE2z5RgGEm5tZFG8bYJpwtEmMdOkEbs=;
        b=Y2WZZy8OPLs4IK0zeX4zklWtCjZvEjQbzbmXVH2Mfxd1f1drlYJR4LXtobDZqwhafN
         NYpkChVvgqqJsi8s+SD9Iol1pkI1QfB/DXDaWJv7TKQ9ht3P+plR6u/izVdo7Q6SPeqm
         AnowSlaz74ruAJJ4dHvLDAec7HVq932rK0EOsJRBCTi3GbNGvykAq1UDwGDYTb862B+1
         TC7hWFg8VnYdTGsfSD2nQJkLR4vwr2grUD50MDr3sgMDOYv7Um8aZn4cUocZtps8Xs2d
         V5p18swFcX31U5d2Ch/ixcNz7/GVZ2Bz3r2Q11Wd53QD1IuFZJ24PJr8X813CsSH5mbD
         jFuA==
X-Gm-Message-State: AOAM533Ahg3kmib0ohm/+Am77S2wBy6q+6GkmyJDVoD71d9ytMFjn3sz
	/AY1zQ1clytSUUDOEVAdN8M+st4UFSlETsLa2Ng=
X-Google-Smtp-Source: ABdhPJzVhZH19c5Eiu8A/Z+fKw2q1CGe0dEEuKqoQZia/3f1QXAJLb1wTbIFFl5aFdUCOhPFh/c3xtu5FDJW89bMIf0=
X-Received: by 2002:a05:620a:1139:: with SMTP id p25mr3369061qkk.9.1610562601114;
 Wed, 13 Jan 2021 10:30:01 -0800 (PST)
MIME-Version: 1.0
References: <1610522931-30226-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
In-Reply-To: <1610522931-30226-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 13 Jan 2021 10:29:34 -0800
Message-ID: <CAMKF1srootS+Nb8yfzjhHW9_MwtspchscLHuOj7YgutQ7R+4rw@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH] rapidjson: Upgrade SRCREV to latest
To: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Aditya Tayade <aditya.tayade@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 11:29 PM Harpritkaur Bhandari
<Harpritkaur.Bhandari@kpit.com> wrote:
>
> Upgrade SRCREV to latest as it fixes the below issue:
> Running UndefinedBehaviorSanitizer on projects that use
> rapidjson triggers 'applying non-zero offset <NN> to null
> pointer' findings in 'internal/stack.h' which are hard
> to suppress by library users.
> Removed "0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
> as the changes are already incorporated in the latest
> codebase.
> As per abi-compliance-checker report the source compatibility
> and binary compatibility between previous SRCREV
> 6a905f9311f82d306da77bd963ec5aa5da07da9c and current
> SRCREV 0ccdbf364c577803e2a751f5aededce935314313
> is 100% and this patch is already tested on 64bit
> ARM (aarch64) in a product with on target CI tests.
>
> Below commits are added in upgrade:
>
> git log --format=3D"%h %s" 6a905f9311f82d306da77bd963ec5aa5da07da9c..0ccd=
bf364c577803e2a751f5aededce935314313
> 0ccdbf3 Merge pull request #1786 from ssb22/master
> b7734d9 Remove unnecessary wording from BSD license not needed for MIT li=
cense (fixes #528)
> ice81bc9 Merge pull request #1760 from escherstair/fix_ce6_support
> 5fbf8bf fix unit test
> 7f559ec fix naive implementation for clzll()
> 58e2964 add unit test for clzll()
> aa5dd60 fix naive version implementation
> 91940e8 fallback to the naive version for CE6
> 6364c8e fix _BitScanReverse() usage for CE6
> f56928d Merge pull request #1744 from lklein53/improve-surrogate-handling
> 6694c99 Add test case for low surrogate handling
> ed73d7b Improve surrogate handling
> 88bd956 Merge pull request #1453 from eidosmontreal/custom_malloc
> 004e8e6 Merge branch 'master' into custom_malloc
> 1a80382 Merge pull request #1720 from madeso/master
> ac0fc79 Fixes issue #1718
> 8f4c021 Merge pull request #1689 from g199209/master
> 1ce28f4 Add CMake minimum version required.
> f376690 Add a target to RapidJSONConfig.cmake.in (#1350)
> 234ff04 ci: upgrade distro to xenial and add arm64 test cases (#1662)
> 36481c3 Update Visual Studio Visualizer (#1665)
> d4f03d0 Doc: Fix some typos. (#1675)
> ebcbd04 Three-way comparison for CLang 10 fix (#1679)
> 2661a17 Avoid warnings when using -std=3Dc++20 and clang 10: use three wa=
y comparision for iterators when possible. (#1667)
> 814bb27 Replace RAPIDJSON_CLZLL with internal clzll (#1660)
> 563fe5b PrettyWriter constructor uninitialized member (#1654)
> 2bed293 Update biginteger.h (#1652)
> b16cec1 Closes #1643 (#1644)
> 98f52b6 Fix simple typo: drived -> derived (#1646)
> a895ce1 Allow escaped apostrophe in values (#1639)
> 418331e Merge pull request #1631 from PhoebeHui/dev/Phoebe/vcpkg_instruct=
ions
> b4cf6e7 Add vcpkg installation instructions
> dfbe1db Merge pull request #1502 from ylavic/compilation_fixes
> eeb9d55 Merge pull request #1617 from JPEWdev/master
> 134af9d Remove shadow typedef
> 35e480f Merge pull request #1609 from piratf/readme_contributing
> 6cadd4b add contributing section in readme.md, introduced the basic coope=
ration process.
> 6534506 Merge pull request #1603 from piratf/cmakelist_upgrade
> 46d980b fix CMake policy CMP0048 warning #1154
> c4c6a65 Merge pull request #1548 from TranslucentTB/master
> e54aca7 Merge branch 'master' of https://github.com/Tencent/rapidjson
> bb5f966 Merge pull request #1591 from veekxt/patch-1
> 67b245e doc: fix a typo
> 1a825d2 Merge pull request #1529 from rkoshy/master
> 6a6bed2 Merge pull request #1582 from crazyscot/master
> 5592c2e Merge pull request #1544 from fredgan/master
> 39db117 fix some misspellings
> 4116912 Use C++17 fallthrough tag instead of disabling warning
> d67a69a Merge pull request #1490 from MalcolmTyrrell/fixCompileErrorInPoi=
nterH
> 5777291 Merge pull request #1579 from Tencent/vs2010
> 88a1ba9 Provide default implementations for move constructor/assignment i=
n GenericMember
> c36b713 Disable copy constructor in GenericMember
> 6006d6b Merge pull request #1573 from esrrhs/master
> 02d4ae8 Update travis-doxygen.sh
> 4c1d9ed Update travis-doxygen.sh
> c136acf Update travis-doxygen.sh
> b286156 Update travis-doxygen.sh
> ed234bf Update .travis.yml
> d3c4b2b Update .travis.yml
> fcec773 Merge pull request #1567 from AtnNn/master
> 123d7c8 add test for non-null-terminated token
> 6102f0b fix template parameter
> 6fe9977 Allow pointer tokens to have non-null-terminated strings
> 2648a73 Merge pull request #1557 from MBoldyrev/doc/fix-uint-case
> 8973b27 fixed Uint case in docs
> 02230fe Change #ifdef to #if defined
> dfc0b35 Update comment
> 0d671a2 Fix signedness error
> 07e1d78 Fix build error under non-Clang compilers
> d5d7171 Fix ARM NEON under MSVC
> a133b16 Merge pull request #1 from Tencent/master
> d87b698 Change all GenericMemberIterator from struct to class
> c43697c - Fixed a build issue by initializing "index" in the header file
> 4b3d7c2 Merge pull request #1506 from ylavic/CreatePattern
> 92f99bc RAPIDJSON_NOEXCEPT_ASSERT() should never throw.
> b4538b5 Fix compilation of sortkeys.cpp with MSVC 2013 (hopefully).
> 94fc463 Add missing curly brackets in STDREGEX's CreatePattern().
> c840a7a Fix vs2017 compile error C2105: '--' needs l-value
> 01950eb Merge pull request #1488 from somone23412/somone23412-fix-typo-1
> 0798d5b fix typo
> e80257a Merge pull request #1481 from liangdzou/patch-1
> 13687a6 add missing header "ios"
> e123f65 Merge pull request #1479 from MaxXSoft/patch-tutorial
> d5c5b87 doc/tutorial.zh-cn: fixed some typos
> 55c3c24 Merge pull request #1477 from eisaev/patch-1
> 9264a9a Update allocators.h
> 091de04 Merge pull request #1462 from ra1u/master
> 40cae03 Allow user to define custom RAPIDJSON_NOEXCEPT_ASSERT macro
> 3cf4f7c Merge pull request #727 from mapbox/silence-dereference-null-poin=
ter
> 7484e06 Update doxygen download URL
> 1ede098 Workaround of sortkeys example
> cef07fb Added parameters to RAPIDJSON_MALLOC, RAPIDJSON_REALLOC and RAPID=
JSON_FREE
> ad2e536 Adding a single customization point that ensures all allocations =
within rapidjson can be performed with a custom memory allocator; Introduce=
s the macros RAPIDJSON_MALLOC, RAPIDJSON_REALLOC, and RAPIDJSON_FREE.
> b94c2a1 Adding swap() for GenericMember
> 0739a3e Fix gcc compilation error in sortkeys
> f595f8a Update sortkeys.cpp
> 1892013 Merge pull request #1421 from HomeControlAS/sort_by_name_example
> 79a6dab Merge pull request #1439 from ylavic/schema_pointer_allocator
> 93cb84a Merge pull request #1442 from rbilovol/cmake-fixup
> efad259 Merge pull request #1444 from leolchat/patch-1
> bf09397 Correct complexity claim
> 8d272e5 CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path
> dbb594b Use the allocator of the Schema for its Pointer.
> bfdcf49 Merge pull request #1426 from ylavic/pointer_less_than
> b56eb28 Merge branch 'master' into pointer_less_than
> 8549e3d Merge pull request #1431 from ylavic/pointer_swap
> 2ce91b8 Pointer tests now need <algorithm> (for std::swap), but no tabs.
> a66cf79 Allow to (std::)Swap two pointers.
> eb6ee17 Speed up Pointer::operator<().
> 0e34ed4 Rework Pointer::operator<() loop.
> af17f19 Unit test for Pointer::operator<().
> 055f1fa Add less than operator to Pointer.
> 66eb606 Merge pull request #1425 from ylavic/filereadstream_peek4
> b4b0e13 Merge pull request #1424 from ylavic/file_input_streams
> eea3e57 Merge pull request #1416 from ylavic/regex_syntax_noassert
> 38d25d7 Fix FileReadStream::Peek4().
> 8aab3db Base buffered BasicIStreamWrapper on the original (better perform=
ing) FileReadStream algorithm.
> 124e8b6 Possibly std::ios::binary helps with streams on Windows
> 2498c57 Optimize FileReadStream and BasicIStreamWrapper.
> d018846 removed std::string and receiving const Value in printIt
> c9060b4 added example for sorting keys
> 8c14787 Unit test for invalid GenericRegex (unclosed parenthesis).
> be96f4d GenericRegex: don't throw/abort on syntax error (unclosed parenth=
esis).
> 30d92a6 Merge pull request #1413 from ylavic/schema_regex_leak
> 1c5b90f Merge pull request #1414 from ylavic/regex_allocator
> 3e69567 Fix a memory leak for invalid std::regex in Schema.
> b0c96f9 Use passed in allocator for internal regex parser.
> a632160 Merge pull request #1388 from yhager/yhager/clang-7
> 595ed48 Merge pull request #1403 from jcmonnin/fix-warning
> 51ca982 Fix warning when NDEBUG is defined [-Wunused-variable]
> 0cc44c8 Update test/unittest/pointertest.cpp
> a77b49d silence clang-7 self-assign-overloaded warning
> 67fac85 Merge pull request #1373 from lelit/issue1368
> 91d50c8 Add test case on kParseNumbersAsStringsFlag being able to load bi=
g ints
> 16872af Avoid pointer arithmetic on null pointer to remove undefined beha=
vior
> 663f076 Merge pull request #1362 from jiapengwen/master
> 2a5e733 Merge pull request #1364 from jcourtat/fixfaq
> 68349ed faq: fix document insertion example
> 1cfa861 fix tutorial error
> c0ca05f Merge pull request #1329 from pah/fix-noexcept
> c2aa79d Merge pull request #1356 from gongminmin/AppVeyor2017
> 783b819 Update rapidjson.h
> a6be583 Update appveyor rule to support VS2017.
> 8a96a95 Merge branch 'master' into fix-noexcept
> f5f6052 Merge pull request #1327 from gongminmin/FixCompileInVS
> 08b1a8a Merge pull request #1302 from chwarr/min-max-guard
> 81af404 Merge pull request #1284 from mobileben/noexcept-assert
> 73063f5 Merge pull request #1340 from lelit/issue1336
> c9eabf9 Extend the test on issue #1336 to cover all basic types
> 3fc9299 Add simple test for issue #1336
> 11defb7 Wrap all WriteXxx() calls within EndValue(), to ensure a flush af=
ter root-level scalar value
> f54f6b5 Add RAPIDJSON_NOEXCEPT_ASSERT
> ff76343 Update the code to adapt the new gtest.
> 960b9cf Guard against min/max being macros in reader.h
> fdd2db9 Updated google test to latest commit
> 5b0610a Handle non-throwing exception specifications that can still throw=
 #1280
>

I think the commit it too detailed. It will be better to either
summarize it. or point to release notes should be sufficient.


> Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> ---
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-o=
e/recipes-devtools/rapidjson/rapidjson_git.bb
> index e3ed9c6..5b5c8b2 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -4,10 +4,9 @@ SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://license.txt;md5=3Dba04aa8f65de1396a7e59d1d7=
46c2125"
>
> -SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1 \
> -           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-pa=
th.patch"
> +SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1"
>
> -SRCREV =3D "6a905f9311f82d306da77bd963ec5aa5da07da9c"
> +SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"
>
>  PV =3D "1.1.0+git${SRCPV}"
>
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
