Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2BEC3DA41
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.13435.1713248038923158842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZN0sNR79;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bVtWCvZS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58aa389-54fafaa4-73fa-4862-8abd-b1bb318ae81d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VCTlLeVpOdh1pB8lNtGhh45cTAIcOAFNwZtGtMqWuHA=;
	b=ZN0sNR79imAGNzFBOnLM0I6LCe/z2G9eR1PTV7vLWPgjVV3RvGp5BKlVzkiWDfkd
	hlU3YvHe2v/4MIMNP6oqNHoy5XH2GBAOtNv20NGnLGoE1pbyHmSVbxOZp67o1kip7+i
	vngUQrrCsd0CofJ9gjuoLwf1B7qLjBybV1uBSF9k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VCTlLeVpOdh1pB8lNtGhh45cTAIcOAFNwZtGtMqWuHA=;
	b=bVtWCvZSzYyX9CLc4VTYxh0Qtbr80Ff8WrNuvyoyg2kkcJT0kBj5z+kdSMsPSJzk
	czK1YJLdaDhFtUNgtiFnZ/iJTsoXIC8ZGcc1rZc5RwCw8Utf9TTqFSYqFJzfkXw5FBc
	aAJzSj0MI+kCAU+jZbjwZP+BjGk3hOxVYt7vzbBk=
Content-Type: multipart/mixed; boundary="===============1647015578363690736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 74-2 FAILED
Message-ID: <0101018ee58aa389-54fafaa4-73fa-4862-8abd-b1bb318ae81d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198415

--===============1647015578363690736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *icu* to *74-2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-icu-upgrade-74-1-74-2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2c228a8f143a4a73fbd4471204c382309ed1bc41 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 05:21:27 +0000
Subject: [PATCH] icu: upgrade 74-1 -> 74-2

---
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch   | 17 +++++++----------
 .../icu/icu/0001-icu-Added-armeb-support.patch  | 13 ++++++-------
 .../icu/icu/fix-install-manx.patch              | 11 +++++------
 .../icu/{icu_74-1.bb => icu_74-2.bb}            |  2 +-
 4 files changed, 19 insertions(+), 24 deletions(-)
 rename meta/recipes-support/icu/{icu_74-1.bb => icu_74-2.bb} (98%)

diff --git a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
index 2968d571bb..2b1649e65c 100644
--- a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
+++ b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
@@ -1,4 +1,4 @@
-From 0c82d6aa02c08e41b13c83b14782bd7024e25d59 Mon Sep 17 00:00:00 2001
+From ef8bb573745237677352560a5ae6305d7da0876a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Feb 2014 21:06:42 +0000
 Subject: [PATCH] Disable LDFLAGSICUDT for Linux
@@ -7,14 +7,14 @@ Upstream-Status: Inappropriate [ OE Configuration ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- source/config/mh-linux |    2 +-
+ source/config/mh-linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/config/mh-linux b/config/mh-linux
-index 366f0cc..2689aab 100644
---- a/config/mh-linux
-+++ b/config/mh-linux
-@@ -21,7 +21,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
+diff --git a/source/config/mh-linux b/source/config/mh-linux
+index 53d6780..b622513 100644
+--- a/source/config/mh-linux
++++ b/source/config/mh-linux
+@@ -23,7 +23,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
  LD_RPATH_PRE = -Wl,-rpath,
  
  ## These are the library specific LDFLAGS
@@ -23,6 +23,3 @@ index 366f0cc..2689aab 100644
  
  ## Compiler switch to embed a library name
  # The initial tab in the next line is to prevent icu-config from reading it.
--- 
-1.7.10.4
-
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index 578517b57f..119e93d0c9 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From e3c25af4b40d64f098e7b8ae5a91fdc3c90163c4 Mon Sep 17 00:00:00 2001
+From f3ed494619265559a785d50f978ee4e0600882da Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 8 May 2019 14:42:30 +0900
 Subject: [PATCH] icu: Added armeb support.
@@ -8,16 +8,15 @@ Make icu support arm32 BE.
 Upstream-Status: Pending
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
-
 ---
- i18n/double-conversion-utils.h | 2 +-
+ source/i18n/double-conversion-utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
-index 7f23e0a..7f89094 100644
---- a/i18n/double-conversion-utils.h
-+++ b/i18n/double-conversion-utils.h
-@@ -115,7 +115,7 @@ int main(int argc, char** argv) {
+index 303668f..7d859dc 100644
+--- a/source/i18n/double-conversion-utils.h
++++ b/source/i18n/double-conversion-utils.h
+@@ -146,7 +146,7 @@ int main(int argc, char** argv) {
  //
  // If it prints "correct" then the architecture should be here, in the "correct" section.
  #if defined(_M_X64) || defined(__x86_64__) || \
diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
index 925b064ebd..2b0f7cc2ee 100644
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -1,4 +1,4 @@
-From a6ddabc8cadb76bfe2d2e374a6702442cfe51cce Mon Sep 17 00:00:00 2001
+From 652528d2bebfa18d85f8ecba72634ae2cb87f44c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 9 Oct 2015 17:50:41 +0100
 Subject: [PATCH] icu: fix install race
@@ -13,15 +13,14 @@ in the install command.
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  source/Makefile.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index be9435b..ada20d7 100644
---- a/Makefile.in
-+++ b/Makefile.in
+diff --git a/source/Makefile.in b/source/Makefile.in
+index 8366f01..79b91c9 100644
+--- a/source/Makefile.in
++++ b/source/Makefile.in
 @@ -77,7 +77,7 @@ EXTRA_DATA =
  
  ## List of phony targets
diff --git a/meta/recipes-support/icu/icu_74-1.bb b/meta/recipes-support/icu/icu_74-2.bb
similarity index 98%
rename from meta/recipes-support/icu/icu_74-1.bb
rename to meta/recipes-support/icu/icu_74-2.bb
index 88ded166b5..ef9b36f79b 100644
--- a/meta/recipes-support/icu/icu_74-1.bb
+++ b/meta/recipes-support/icu/icu_74-2.bb
@@ -111,7 +111,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "86ce8e60681972e60e4dcb2490c697463fcec60dd400a5f9bffba26d0b52b8d0"
+SRC_URI[code.sha256sum] = "68db082212a96d6f53e35d60f47d38b962e9f9d207a74cfac78029ae8ff5e08c"
 SRC_URI[data.sha256sum] = "67d5ab39c5187e1dd0fed60a3fe52794dce9784b4c045cb85e19f5d317fd783f"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
-- 
2.42.0


--===============1647015578363690736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-77855414d184771488ec42e47da1ac3524717295"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:77855414d184771488ec42e47da1ac3524717295"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 108 Local 94 Mirrors 0 Missed 14 Current 194 (87% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 203 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 212 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 214 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 257 of 302 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-74-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-native-74-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 272 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe icu-74-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 700 of 921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch)
NOTE: recipe icu-native-74-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 702 of 921 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 274 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe icu-74-2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
WARNING: icu-74-2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip
Cleaning and trying again.
WARNING: icu-74-2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip to /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip_bad-checksum_c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-native-74-2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 278 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 285 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 294 of 302 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: icu-74-2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-74-2/icu4c-74_2-data.zip;name=data - will attempt other sources if available
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
WARNING: icu-74-2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip
Cleaning and trying again.
WARNING: icu-74-2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip to /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip_bad-checksum_c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
WARNING: icu-native-74-2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-74-2/icu4c-74_2-data.zip;name=data - will attempt other sources if available
WARNING: icu-native-74-2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip
Cleaning and trying again.
WARNING: icu-native-74-2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip to /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip_bad-checksum_c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6
NOTE: recipe icu-74-2-r0: task do_fetch: Failed
NOTE: recipe icu-native-74-2-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 890 tasks of which 888 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416052109.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416052109.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch
Summary: There were 8 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: icu-74-2-r0 do_fetch: Checksum failure fetching https://github.com/unicode-org/icu/releases/download/release-74-2/icu4c-74_2-data.zip;name=data
ERROR: icu-74-2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip\' has sha256 checksum \'c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6\' when \'67d5ab39c5187e1dd0fed60a3fe52794dce9784b4c045cb85e19f5d317fd783f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[data.sha256sum] = "c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://github.com/unicode-org/icu/releases/download/release-74-2/icu4c-74_2-data.zip;name=data')
ERROR: icu-native-74-2-r0 do_fetch: Checksum failure fetching https://github.com/unicode-org/icu/releases/download/release-74-2/icu4c-74_2-data.zip;name=data
ERROR: icu-native-74-2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip\' has sha256 checksum \'c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6\' when \'67d5ab39c5187e1dd0fed60a3fe52794dce9784b4c045cb85e19f5d317fd783f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[data.sha256sum] = "c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://github.com/unicode-org/icu/releases/download/release-74-2/icu4c-74_2-data.zip;name=data')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/icu/74-2/temp/log.do_fetch.459089
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/icu-native/74-2/temp/log.do_fetch.459105
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch) failed with exit code '1'

--===============1647015578363690736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-icu-upgrade-74-1-74-2.patch"

RnJvbSAyYzIyOGE4ZjE0M2E0YTczZmJkNDQ3MTIwNGMzODIzMDllZDFiYzQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDU6MjE6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
Y3U6IHVwZ3JhZGUgNzQtMSAtPiA3NC0yCgotLS0KIC4uLi8wMDAxLURpc2FibGUtTERGTEFHU0lD
VURULWZvci1MaW51eC5wYXRjaCAgIHwgMTcgKysrKysrKy0tLS0tLS0tLS0KIC4uLi9pY3UvaWN1
LzAwMDEtaWN1LUFkZGVkLWFybWViLXN1cHBvcnQucGF0Y2ggIHwgMTMgKysrKysrLS0tLS0tLQog
Li4uL2ljdS9pY3UvZml4LWluc3RhbGwtbWFueC5wYXRjaCAgICAgICAgICAgICAgfCAxMSArKysr
Ky0tLS0tLQogLi4uL2ljdS97aWN1Xzc0LTEuYmIgPT4gaWN1Xzc0LTIuYmJ9ICAgICAgICAgICAg
fCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3Uve2ljdV83NC0xLmJiID0+IGljdV83
NC0yLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3Uv
MDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VEVC1mb3ItTGludXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9pY3UvaWN1LzAwMDEtRGlzYWJsZS1MREZMQUdTSUNVRFQtZm9yLUxpbnV4LnBhdGNo
CmluZGV4IDI5NjhkNTcxYmIuLjJiMTY0OWU2NWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2ljdS9pY3UvMDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VEVC1mb3ItTGludXgucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAxLURpc2FibGUtTERGTEFHU0lD
VURULWZvci1MaW51eC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGM4MmQ2YWEwMmMwOGU0
MWIxM2M4M2IxNDc4MmJkNzAyNGUyNWQ1OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZWY4YmI1NzM3NDUyMzc2NzczNTI1NjBhNWFlNjMwNWQ3ZGEwODc2YSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQs
IDE1IEZlYiAyMDE0IDIxOjA2OjQyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgTERG
TEFHU0lDVURUIGZvciBMaW51eApAQCAtNywxNCArNywxNCBAQCBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgWyBPRSBDb25maWd1cmF0aW9uIF0KIAogU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KIC0tLQotIHNvdXJjZS9jb25maWcvbWgtbGludXggfCAg
ICAyICstCisgc291cmNlL2NvbmZpZy9taC1saW51eCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAotZGlmZiAtLWdpdCBhL2NvbmZpZy9taC1s
aW51eCBiL2NvbmZpZy9taC1saW51eAotaW5kZXggMzY2ZjBjYy4uMjY4OWFhYiAxMDA2NDQKLS0t
LSBhL2NvbmZpZy9taC1saW51eAotKysrIGIvY29uZmlnL21oLWxpbnV4Ci1AQCAtMjEsNyArMjEs
NyBAQCBMRF9SUEFUSD0gLVdsLC16b3JpZ2luLC1ycGF0aCwnJCQnT1JJR0lOCitkaWZmIC0tZ2l0
IGEvc291cmNlL2NvbmZpZy9taC1saW51eCBiL3NvdXJjZS9jb25maWcvbWgtbGludXgKK2luZGV4
IDUzZDY3ODAuLmI2MjI1MTMgMTAwNjQ0CistLS0gYS9zb3VyY2UvY29uZmlnL21oLWxpbnV4Cisr
KysgYi9zb3VyY2UvY29uZmlnL21oLWxpbnV4CitAQCAtMjMsNyArMjMsNyBAQCBMRF9SUEFUSD0g
LVdsLC16b3JpZ2luLC1ycGF0aCwnJCQnT1JJR0lOCiAgTERfUlBBVEhfUFJFID0gLVdsLC1ycGF0
aCwKICAKICAjIyBUaGVzZSBhcmUgdGhlIGxpYnJhcnkgc3BlY2lmaWMgTERGTEFHUwpAQCAtMjMs
NiArMjMsMyBAQCBpbmRleCAzNjZmMGNjLi4yNjg5YWFiIDEwMDY0NAogIAogICMjIENvbXBpbGVy
IHN3aXRjaCB0byBlbWJlZCBhIGxpYnJhcnkgbmFtZQogICMgVGhlIGluaXRpYWwgdGFiIGluIHRo
ZSBuZXh0IGxpbmUgaXMgdG8gcHJldmVudCBpY3UtY29uZmlnIGZyb20gcmVhZGluZyBpdC4KLS0t
IAotMS43LjEwLjQKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8w
MDAxLWljdS1BZGRlZC1hcm1lYi1zdXBwb3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
aWN1L2ljdS8wMDAxLWljdS1BZGRlZC1hcm1lYi1zdXBwb3J0LnBhdGNoCmluZGV4IDU3ODUxN2I1
N2YuLjExOWU5M2QwYzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3Uv
MDAwMS1pY3UtQWRkZWQtYXJtZWItc3VwcG9ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pY3UvaWN1LzAwMDEtaWN1LUFkZGVkLWFybWViLXN1cHBvcnQucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGUzYzI1YWY0YjQwZDY0ZjA5OGU3YjhhZTVhOTFmZGMzYzkwMTYzYzQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYzZWQ0OTQ2MTkyNjU1NTlhNzg1ZDUwZjk3OGVl
NGUwNjAwODgyZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMZWkgTWFvaHVpIDxs
ZWltYW9odWlAY24uZnVqaXRzdS5jb20+CiBEYXRlOiBXZWQsIDggTWF5IDIwMTkgMTQ6NDI6MzAg
KzA5MDAKIFN1YmplY3Q6IFtQQVRDSF0gaWN1OiBBZGRlZCBhcm1lYiBzdXBwb3J0LgpAQCAtOCwx
NiArOCwxNSBAQCBNYWtlIGljdSBzdXBwb3J0IGFybTMyIEJFLgogVXBzdHJlYW0tU3RhdHVzOiBQ
ZW5kaW5nCiAKIFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1aUBjbi5mdWppdHN1
LmNvbT4KLQogLS0tCi0gaTE4bi9kb3VibGUtY29udmVyc2lvbi11dGlscy5oIHwgMiArLQorIHNv
dXJjZS9pMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxzLmggfCAyICstCiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zb3VyY2Uv
aTE4bi9kb3VibGUtY29udmVyc2lvbi11dGlscy5oIGIvc291cmNlL2kxOG4vZG91YmxlLWNvbnZl
cnNpb24tdXRpbHMuaAotaW5kZXggN2YyM2UwYS4uN2Y4OTA5NCAxMDA2NDQKLS0tLSBhL2kxOG4v
ZG91YmxlLWNvbnZlcnNpb24tdXRpbHMuaAotKysrIGIvaTE4bi9kb3VibGUtY29udmVyc2lvbi11
dGlscy5oCi1AQCAtMTE1LDcgKzExNSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyKiogYXJn
dikgeworaW5kZXggMzAzNjY4Zi4uN2Q4NTlkYyAxMDA2NDQKKy0tLSBhL3NvdXJjZS9pMThuL2Rv
dWJsZS1jb252ZXJzaW9uLXV0aWxzLmgKKysrKyBiL3NvdXJjZS9pMThuL2RvdWJsZS1jb252ZXJz
aW9uLXV0aWxzLmgKK0BAIC0xNDYsNyArMTQ2LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIq
KiBhcmd2KSB7CiAgLy8KICAvLyBJZiBpdCBwcmludHMgImNvcnJlY3QiIHRoZW4gdGhlIGFyY2hp
dGVjdHVyZSBzaG91bGQgYmUgaGVyZSwgaW4gdGhlICJjb3JyZWN0IiBzZWN0aW9uLgogICNpZiBk
ZWZpbmVkKF9NX1g2NCkgfHwgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBcCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1L2ZpeC1pbnN0YWxsLW1hbngucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1L2ZpeC1pbnN0YWxsLW1hbngucGF0Y2gKaW5kZXggOTI1
YjA2NGViZC4uMmIwZjdjYzJlZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1
L2ljdS9maXgtaW5zdGFsbC1tYW54LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lj
dS9pY3UvZml4LWluc3RhbGwtbWFueC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTZkZGFi
YzhjYWRiNzZiZmUyZDJlMzc0YTY3MDI0NDJjZmU1MWNjZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNjUyNTI4ZDJiZWJmYTE4ZDg1ZjhlY2JhNzI2MzRhZTJjYjg3ZjQ0YyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5j
b20+CiBEYXRlOiBGcmksIDkgT2N0IDIwMTUgMTc6NTA6NDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRD
SF0gaWN1OiBmaXggaW5zdGFsbCByYWNlCkBAIC0xMywxNSArMTMsMTQgQEAgaW4gdGhlIGluc3Rh
bGwgY29tbWFuZC4KIAogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiBTaWduZWQtb2ZmLWJ5OiBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgotCiAtLS0KICBzb3VyY2UvTWFrZWZp
bGUuaW4gfCA4ICsrKystLS0tCiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKIAotZGlmZiAtLWdpdCBhL01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWlu
ZGV4IGJlOTQzNWIuLmFkYTIwZDcgMTAwNjQ0Ci0tLS0gYS9NYWtlZmlsZS5pbgotKysrIGIvTWFr
ZWZpbGUuaW4KK2RpZmYgLS1naXQgYS9zb3VyY2UvTWFrZWZpbGUuaW4gYi9zb3VyY2UvTWFrZWZp
bGUuaW4KK2luZGV4IDgzNjZmMDEuLjc5YjkxYzkgMTAwNjQ0CistLS0gYS9zb3VyY2UvTWFrZWZp
bGUuaW4KKysrKyBiL3NvdXJjZS9NYWtlZmlsZS5pbgogQEAgLTc3LDcgKzc3LDcgQEAgRVhUUkFf
REFUQSA9CiAgCiAgIyMgTGlzdCBvZiBwaG9ueSB0YXJnZXRzCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9pY3UvaWN1Xzc0LTEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3Uv
aWN1Xzc0LTIuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvaWN1L2ljdV83NC0xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9p
Y3UvaWN1Xzc0LTIuYmIKaW5kZXggODhkZWQxNjZiNS4uZWY5YjM2Zjc5YiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83NC0xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2ljdS9pY3VfNzQtMi5iYgpAQCAtMTExLDcgKzExMSw3IEBAIFNSQ19VUkkgPSAiJHtC
QVNFX1NSQ19VUkl9O25hbWU9Y29kZSBcCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAi
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VEVC1mb3ItTGludXgu
cGF0Y2ggXAogICAgICAgICAgICIKLVNSQ19VUklbY29kZS5zaGEyNTZzdW1dID0gIjg2Y2U4ZTYw
NjgxOTcyZTYwZTRkY2IyNDkwYzY5NzQ2M2ZjZWM2MGRkNDAwYTVmOWJmZmJhMjZkMGI1MmI4ZDAi
CitTUkNfVVJJW2NvZGUuc2hhMjU2c3VtXSA9ICI2OGRiMDgyMjEyYTk2ZDZmNTNlMzVkNjBmNDdk
MzhiOTYyZTlmOWQyMDdhNzRjZmFjNzgwMjlhZThmZjVlMDhjIgogU1JDX1VSSVtkYXRhLnNoYTI1
NnN1bV0gPSAiNjdkNWFiMzljNTE4N2UxZGQwZmVkNjBhM2ZlNTI3OTRkY2U5Nzg0YjRjMDQ1Y2I4
NWUxOWY1ZDMxN2ZkNzgzZiIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvdGFn
L3JlbGVhc2UtKD9QPHB2ZXI+KD8hLityYykuKykiCi0tIAoyLjQyLjAKCg==

--===============1647015578363690736==--

