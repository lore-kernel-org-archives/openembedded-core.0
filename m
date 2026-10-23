Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1100.1792734605376915732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 22:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=q8tUorhn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4ihEmRlI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1674f2c45-81fb6691-22d9-4d79-bcd1-38284c4be793-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792734604;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=UZgBSNxz8N7N9sHtMYeszWwhk/xRanXAMrxjZLGkwL8=;
	b=q8tUorhn05clb7cL5DktJJBUfS2qLk6jDIuSqbcQvee3LkN1/eXZKeOmd9LZnNy6
	vEKsBWIt5SOGzM5ZLzwmrUyOClL0T548LmE9WC1tUJEgIcTFdxbSws53QqUntLduXcW
	zP2Gf0YlEKIcp47on63wyjRDPbYokv2Nq3Civpzc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792734604;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=UZgBSNxz8N7N9sHtMYeszWwhk/xRanXAMrxjZLGkwL8=;
	b=4ihEmRlIch056zAGExvY8Khp4FIq79CZc1JlpQybfcwgQ6JZ2VdFu3Ezn14DC7Nu
	tSTfBODULfrod1q5e0gdacbBerFt9IuMUG1pP/8Xe2izqt7tv3HrjuVKPKvDtxMExxs
	Qhc6IL19ydWf1NC9gTVzix2krv5byv+z3yBtP9v8=
Content-Type: multipart/mixed; boundary="===============1426504344788279475=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 79.1 FAILED
Message-ID: <010101a1674f2c45-81fb6691-22d9-4d79-bcd1-38284c4be793-000000@us-west-2.amazonses.com>
Date: Fri, 23 Oct 2026 05:50:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.23-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 05:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248480

--===============1426504344788279475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *icu* to *79.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe icu failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1996 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-b0fbd5fd57a96abdd4e23eb26c706c8863cbb719"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:b0fbd5fd57a96abdd4e23eb26c706c8863cbb719"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1997 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-b0fbd5fd57a96abdd4e23eb26c706c8863cbb719"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:b0fbd5fd57a96abdd4e23eb26c706c8863cbb719"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  13% |####                                | ETA:  0:00:04
Adding changed files:  26% |#########                           | ETA:  0:00:02
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  66% |########################            | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/unicode-org/icu/releases/download/release-79.1/icu4c-79.1-sources.tgz;name=code...
INFO: Rebasing devtool onto 745054caef420d57c439dfab253a82e13a8ba1d6
WARNING: Command 'git rebase 745054caef420d57c439dfab253a82e13a8ba1d6' failed:
Auto-merging source/test/intltest/intltest.cpp
CONFLICT (content): Merge conflict in source/test/intltest/intltest.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 745054caef420d57c439dfab253a82e13a8ba1d6
WARNING: Command 'git rebase 745054caef420d57c439dfab253a82e13a8ba1d6' failed:
Auto-merging source/test/intltest/intltest.cpp
CONFLICT (content): Merge conflict in source/test/intltest/intltest.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/icu
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/icu/icu_79.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/icu.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/icu.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1426504344788279475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="icu-changelog.txt"

---------------------------------------------------------------------------- ***
Unicode 18.0 update for ICU 79

Note: Between Unicode 18 beta and Unicode 18 final, the Chisoi script was
removed.
The log below reflects its addition as of the beta.

https://www.unicode.org/versions/Unicode18.0.0/
https://www.unicode.org/versions/beta-18.0.0.html
https://www.unicode.org/Public/draft/
https://www.unicode.org/reports/uax-proposed-updates.html
https://www.unicode.org/reports/tr44/tr44-37.html

https://unicode-org.atlassian.net/browse/ICU-23343 Unicode 18
https://unicode-org.atlassian.net/browse/CLDR-19339 BRS Unicode 18

Markus:

export UNIDATA_ROOT=~/unidata
export UNICODE_DATA=$UNIDATA_ROOT/uni18/final
export CLDR_SRC=~/cldr/uni/src
export ICU_ROOT=~/icu/uni
export ICU_SRC=$ICU_ROOT/src
export ICU_OUT=$ICU_ROOT/dbg
export ICUDT=icudt79b
export ICU4C_DATA_IN=$ICU_SRC/icu4c/source/data/in
export ICU4C_UNIDATA=$ICU_SRC/icu4c/source/data/unidata
export LD_LIBRARY_PATH=$ICU_OUT/icu4c/lib
export UNICODE_TOOLS=~/unitools/mine/src

Elango:

export UNIDATA_ROOT=~/oss/unidata
export UNICODE_DATA=$UNIDATA_ROOT/uni18/beta
export CLDR_SRC=~/oss/cldr/mine/src
export ICU_ROOT=~/oss/icu
export ICU_SRC=$ICU_ROOT
export ICU_OUT=$ICU_ROOT
export ICUDT=icudt79b
export ICU4C_DATA_IN=$ICU_SRC/icu4c/source/data/in
export ICU4C_UNIDATA=$ICU_SRC/icu4c/source/data/unidata
export LD_LIBRARY_PATH=$ICU_OUT/icu4c/lib
export UNICODE_TOOLS=~/oss/unicodetools/mine/src

*** Unicode version numbers
- icu4c/source/data/makedata.mak
- icu4c/source/common/unicode/uchar.h
- com.ibm.icu.util.VersionInfo
- com.ibm.icu.dev.test.lang.UCharacterTest.VERSION_

*** Configure: Build Unicode data for ICU4J
- Run ICU4C "configure" _after_ updating the Unicode version number in uchar.h
    so that the makefiles see the new version number.
- FYI: The option that adds the additional Unicode data files for ICU4J is
    ICU_DATA_BUILDTOOL_OPTS=--include_uni_core_data
- Markus's version:
  cd $ICU_OUT/icu4c
  ICU_DATA_BUILDTOOL_OPTS=--include_uni_core_data
  CXXFLAGS="-DU_USING_ICU_NAMESPACE=0 -Wimplicit-fallthrough"
  CPPFLAGS="-DU_NO_DEFAULT_INCLUDE_UTF_HEADERS=1 -fsanitize=bounds"
  LDFLAGS=-fsanitize=bounds ../../src/icu4c/source/runConfigureICU --enable-
  debug --disable-release Linux/clang
  --prefix=/usr/local/google/home/mscherer/icu/mine/inst/icu4c > config.out 2>&1
  ; tail config.out
- Elango's version (diff default C++ compiler & in-source build paths):
  cd $ICU_OUT/icu4c/source
  ICU_DATA_BUILDTOOL_OPTS=--include_uni_core_data
  CXXFLAGS="-DU_USING_ICU_NAMESPACE=0 -Wimplicit-fallthrough"
  CPPFLAGS="-DU_NO_DEFAULT_INCLUDE_UTF_HEADERS=1 -fsanitize=bounds"
  LDFLAGS=-fsanitize=bounds ./runConfigureICU --enable-debug --disable-release
  Linux/gcc --prefix=/usr/local/google/home/elango/oss/icu/icu4c > config.out
  2>&1 ; tail config.out

*** data files & enums & parser code

  $ICU_OUT/icu4c$ echo;echo; date; make -j20 tests &> out.txt ; tail -n 30
  out.txt ; date

See https://unicode-org.github.io/icu/processes/unicode-update#bazel-build-
process
for an overview and for setup instructions.

Consider running `bazelisk --version` outside of the $ICU_SRC folder
to find out the latest `bazel` version, and
copying that version number into the $ICU_SRC/.bazeliskrc config file.
(Revert if you find incompatibilities, or, better, update our build & config
files.)

- remember to define the environment variables
  (see the start of the section for this Unicode version)
- cd $ICU_SRC
- optional but not necessary:
    bazelisk clean
      or even
    bazelisk clean --expunge
- build/bootstrap/generate new files:
    icu4c/source/data/unidata/generate.sh

- If you get seemingly unrelated compiler/linker errors, first try to
    bazelisk clean --expunge
  and if that still does not help, try to use a different compiler, for example
  via
    export CC=clang
    export CXX=clang++

- For debugging:
    bazelisk build -c dbg <target>

- UCA DUCET goes into Mark's Unicode tools,
  and a tool-tailored version goes into CLDR, see
    https://github.com/unicode-org/unicodetools/blob/main/docs/uca/index.md

- update source/data/unidata/FractionalUCA.txt with FractionalUCA_SHORT.txt
    cp -v $CLDR_SRC/common/uca/FractionalUCA_SHORT.txt
    $ICU4C_UNIDATA/FractionalUCA.txt
- update source/data/unidata/UCARules.txt with UCA_Rules_SHORT.txt
    cp -v $ICU4C_UNIDATA/UCARules.txt /tmp/UCARules-old.txt
    (note removing the underscore before "Rules")
    cp -v $CLDR_SRC/common/uca/UCA_Rules_SHORT.txt $ICU4C_UNIDATA/UCARules.txt
- restore TODO diffs in UCARules.txt; adjust boundaries as needed, e.g., for new
  currency symbols
    meld /tmp/UCARules-old.txt $ICU4C_UNIDATA/UCARules.txt
- update (ICU4C)/source/test/testdata/CollationTest_*.txt
  and (ICU4J)/main/tests/collate/src/com/ibm/icu/dev/data/CollationTest_*.txt
  from the CLDR root files (..._CLDR_..._SHORT.txt)
    cp -v $CLDR_SRC/common/uca/CollationTest_CLDR_NON_IGNORABLE_SHORT.txt
    $ICU_SRC/icu4c/source/test/testdata/CollationTest_NON_IGNORABLE_SHORT.txt
    cp -v $CLDR_SRC/common/uca/CollationTest_CLDR_SHIFTED_SHORT.txt
    $ICU_SRC/icu4c/source/test/testdata/CollationTest_SHIFTED_SHORT.txt
    cp -v $ICU_SRC/icu4c/source/test/testdata/CollationTest_*.txt
    $ICU_SRC/icu4j/main/collate/src/test/resources/com/ibm/icu/dev/data
- if CLDR common/uca/unihan-index.txt changes, then update
  CLDR common/collation/root.xml <collation type="private-unihan">
  and regenerate (or update in parallel)
  $ICU_SRC/icu4c/source/data/coll/root.txt

- update CollationFCD.java:
  copy & paste the initializers of lcccIndex[] etc.
  from
    $ICU_SRC/icu4c/source/i18n/collationfcd.cpp
  to
    $ICU_SRC/icu4j/main/collate/src/main/java/com/ibm/icu/impl/coll/CollationFCD
    .java
- generate data files, as above (generate.sh), now to pick up new collation data
    icu4c/source/data/unidata/generate.sh
- rebuild ICU4C (make clean, make check, as usual)
- run gencolusb for Unicode updates
  + https://github.com/markusicu/icu/blob/main/icu4c/source/tools/gencolusb/READ
  ME.md
  + until ICU-12062 is done
  + currently wants its own configure line; make clean, configure, build,
  generate
  + configure again using the command line in this file
  + rebuild ICU4C (make clean, make check, as usual)

*** API additions
- send notice to icu-design about new born-@stable API (enum constants etc.)

*** CLDR numbering systems
- look for new sets of decimal digits (gc=ND & nv=4) and add to CLDR
  for example:
    ~/unitools/mine/src$ diff -u
    unicodetools/data/ucd/17.0.0/extracted/DerivedGeneralCategory.txt
    unicodetools/data/ucd/dev/extracted/DerivedGeneralCategory.txt | grep '; Nd'
    | egrep '^\+'
    -->
      +16DA0..16DA9  ; Nd #  [10] CHISOI DIGIT ZERO..CHISOI DIGIT NINE
  --> CLDR-19339 bring back Chisoi script for Unicode 18
  --> removed once more from Unicode 18

*** merge the Unicode update branch back onto the main branch
- make sure that changes to Unicode tools are checked in:
  https://github.com/unicode-org/unicodetools

--===============1426504344788279475==--
