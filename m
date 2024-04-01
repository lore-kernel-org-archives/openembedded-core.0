Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DA3CD12A1
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.44904.1711995071160590406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XDZ4L0kz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Z/3yq0d4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9adba846-14ea14e8-6154-4072-82d9-e7b8bea273b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WVbLmuEU1vEQBeYd0mjkuQozzDeTb6YdKy1ymZxLZZ4=;
	b=XDZ4L0kz5gcrxwNFqaxDFm57KepQzAzK9KhHvcOPKAuroIxPFrJQ5NgWNo0OdZ7m
	9eBX+vtTIrhnvxvY+gxlA6LEdw4BJpFL54qkwj0Q24X1aJyd2dxAaAdgE21G01lF1I2
	EnTXa6TJFqipWyIRn4ky98bM3EmQA76/pPEnMu+Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WVbLmuEU1vEQBeYd0mjkuQozzDeTb6YdKy1ymZxLZZ4=;
	b=Z/3yq0d4m6oW7Nh2N382h+wxCe8NCqOJ/YPX4Bzab1JHcrwn5mGz1D71jPj4+hWM
	mWye7abg9KOQKW7o9OJ5CQDhppjwhXrR08KYpLowo8SYNUWUctsL1RXlYzLvtq1HJIn
	d2VBa2Im3KsLkRFiaVPfMfSY1WcgYylMursfG800=
Content-Type: multipart/mixed; boundary="===============6217475305115550718=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 74-2 FAILED
Message-ID: <0101018e9adba846-14ea14e8-6154-4072-82d9-e7b8bea273b9-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197825

--===============6217475305115550718==
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
From 4f21edc140666eaf71d7a3f375a9768e211b8caa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 17:27:01 +0000
Subject: [PATCH] icu: upgrade 74-1 -> 74-2

---
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch   | 17 +++++++----------
 .../icu/icu/0001-icu-Added-armeb-support.patch  | 13 ++++++-------
 .../icu/icu/fix-install-manx.patch              | 11 +++++------
 .../icu/{icu_74-1.bb => icu_74-2.bb}            |  2 +-
 4 files changed, 19 insertions(+), 24 deletions(-)
 rename meta/recipes-support/icu/{icu_74-1.bb => icu_74-2.bb} (98%)

diff --git a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
index 2968d571bb..25e99c8f42 100644
--- a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
+++ b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
@@ -1,4 +1,4 @@
-From 0c82d6aa02c08e41b13c83b14782bd7024e25d59 Mon Sep 17 00:00:00 2001
+From 1deddeffe1df01adf2c2235c755c9401d49f24dc Mon Sep 17 00:00:00 2001
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
index 578517b57f..408f34cafa 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From e3c25af4b40d64f098e7b8ae5a91fdc3c90163c4 Mon Sep 17 00:00:00 2001
+From 61468006e773d6b1dcbe6d324b687b86220ef4c4 Mon Sep 17 00:00:00 2001
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
index 925b064ebd..dac23165cd 100644
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -1,4 +1,4 @@
-From a6ddabc8cadb76bfe2d2e374a6702442cfe51cce Mon Sep 17 00:00:00 2001
+From c1ffe881edb65e17d56ba3755a4c32c723fc5c86 Mon Sep 17 00:00:00 2001
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


--===============6217475305115550718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-5f96fa0524978a52db937478a9ba341f2ff28a79"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5f96fa0524978a52db937478a9ba341f2ff28a79"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 111 Local 96 Mirrors 0 Missed 15 Current 191 (86% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 209 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 302 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_recipe_qa_setscene)
NOTE: Running task 645 of 921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-74-2-r0: task do_recipe_qa: Started
NOTE: recipe icu-native-74-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 272 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe icu-74-2-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_recipe_qa unihash changed to 6d06fdc099477050ade6be636e8e41ce19523e308422552e865b4712b36d39b0
NOTE: recipe icu-native-74-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 269 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 271 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: Running task 702 of 921 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch)
NOTE: Running task 704 of 921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-2-r0: task do_fetch: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
WARNING: icu-74-2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip
Cleaning and trying again.
WARNING: icu-74-2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip to /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip_bad-checksum_c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6
NOTE: recipe icu-native-74-2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 285 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 294 of 302 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
WARNING: icu-74-2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-74-2/icu4c-74_2-data.zip;name=data - will attempt other sources if available
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
WARNING: icu-74-2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip
Cleaning and trying again.
WARNING: icu-74-2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip to /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip_bad-checksum_c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6
WARNING: icu-native-74-2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-74-2/icu4c-74_2-data.zip;name=data - will attempt other sources if available
WARNING: icu-native-74-2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip
Cleaning and trying again.
WARNING: icu-native-74-2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip to /srv/autobuilder/autobuilder.yocto.io/current_sources/icu4c-74_2-data.zip_bad-checksum_c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6
NOTE: recipe icu-74-2-r0: task do_fetch: Failed
NOTE: recipe icu-native-74-2-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 890 tasks of which 887 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401172641.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401172641.txt [-s server]
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/icu/74-2/temp/log.do_fetch.1649994
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/icu-native/74-2/temp/log.do_fetch.1649993
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_fetch) failed with exit code '1'

--===============6217475305115550718==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-icu-upgrade-74-1-74-2.patch"

RnJvbSA0ZjIxZWRjMTQwNjY2ZWFmNzFkN2EzZjM3NWE5NzY4ZTIxMWI4Y2FhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNzoyNzowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlj
dTogdXBncmFkZSA3NC0xIC0+IDc0LTIKCi0tLQogLi4uLzAwMDEtRGlzYWJsZS1MREZMQUdTSUNV
RFQtZm9yLUxpbnV4LnBhdGNoICAgfCAxNyArKysrKysrLS0tLS0tLS0tLQogLi4uL2ljdS9pY3Uv
MDAwMS1pY3UtQWRkZWQtYXJtZWItc3VwcG9ydC5wYXRjaCAgfCAxMyArKysrKystLS0tLS0tCiAu
Li4vaWN1L2ljdS9maXgtaW5zdGFsbC1tYW54LnBhdGNoICAgICAgICAgICAgICB8IDExICsrKysr
LS0tLS0tCiAuLi4vaWN1L3tpY3VfNzQtMS5iYiA9PiBpY3VfNzQtMi5iYn0gICAgICAgICAgICB8
ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS97aWN1Xzc0LTEuYmIgPT4gaWN1Xzc0
LTIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8w
MDAxLURpc2FibGUtTERGTEFHU0lDVURULWZvci1MaW51eC5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2ljdS9pY3UvMDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VEVC1mb3ItTGludXgucGF0Y2gK
aW5kZXggMjk2OGQ1NzFiYi4uMjVlOTljOGY0MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvaWN1L2ljdS8wMDAxLURpc2FibGUtTERGTEFHU0lDVURULWZvci1MaW51eC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtRGlzYWJsZS1MREZMQUdTSUNV
RFQtZm9yLUxpbnV4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwYzgyZDZhYTAyYzA4ZTQx
YjEzYzgzYjE0NzgyYmQ3MDI0ZTI1ZDU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAx
ZGVkZGVmZmUxZGYwMWFkZjJjMjIzNWM3NTVjOTQwMWQ0OWYyNGRjIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwg
MTUgRmViIDIwMTQgMjE6MDY6NDIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJsZSBMREZM
QUdTSUNVRFQgZm9yIExpbnV4CkBAIC03LDE0ICs3LDE0IEBAIFVwc3RyZWFtLVN0YXR1czogSW5h
cHByb3ByaWF0ZSBbIE9FIENvbmZpZ3VyYXRpb24gXQogCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogLS0tCi0gc291cmNlL2NvbmZpZy9taC1saW51eCB8ICAg
IDIgKy0KKyBzb3VyY2UvY29uZmlnL21oLWxpbnV4IHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCi1kaWZmIC0tZ2l0IGEvY29uZmlnL21oLWxp
bnV4IGIvY29uZmlnL21oLWxpbnV4Ci1pbmRleCAzNjZmMGNjLi4yNjg5YWFiIDEwMDY0NAotLS0t
IGEvY29uZmlnL21oLWxpbnV4Ci0rKysgYi9jb25maWcvbWgtbGludXgKLUBAIC0yMSw3ICsyMSw3
IEBAIExEX1JQQVRIPSAtV2wsLXpvcmlnaW4sLXJwYXRoLCckJCdPUklHSU4KK2RpZmYgLS1naXQg
YS9zb3VyY2UvY29uZmlnL21oLWxpbnV4IGIvc291cmNlL2NvbmZpZy9taC1saW51eAoraW5kZXgg
NTNkNjc4MC4uYjYyMjUxMyAxMDA2NDQKKy0tLSBhL3NvdXJjZS9jb25maWcvbWgtbGludXgKKysr
KyBiL3NvdXJjZS9jb25maWcvbWgtbGludXgKK0BAIC0yMyw3ICsyMyw3IEBAIExEX1JQQVRIPSAt
V2wsLXpvcmlnaW4sLXJwYXRoLCckJCdPUklHSU4KICBMRF9SUEFUSF9QUkUgPSAtV2wsLXJwYXRo
LAogIAogICMjIFRoZXNlIGFyZSB0aGUgbGlicmFyeSBzcGVjaWZpYyBMREZMQUdTCkBAIC0yMyw2
ICsyMywzIEBAIGluZGV4IDM2NmYwY2MuLjI2ODlhYWIgMTAwNjQ0CiAgCiAgIyMgQ29tcGlsZXIg
c3dpdGNoIHRvIGVtYmVkIGEgbGlicmFyeSBuYW1lCiAgIyBUaGUgaW5pdGlhbCB0YWIgaW4gdGhl
IG5leHQgbGluZSBpcyB0byBwcmV2ZW50IGljdS1jb25maWcgZnJvbSByZWFkaW5nIGl0LgotLS0g
Ci0xLjcuMTAuNAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAw
MDEtaWN1LUFkZGVkLWFybWViLXN1cHBvcnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9p
Y3UvaWN1LzAwMDEtaWN1LUFkZGVkLWFybWViLXN1cHBvcnQucGF0Y2gKaW5kZXggNTc4NTE3YjU3
Zi4uNDA4ZjM0Y2FmYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8w
MDAxLWljdS1BZGRlZC1hcm1lYi1zdXBwb3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2ljdS9pY3UvMDAwMS1pY3UtQWRkZWQtYXJtZWItc3VwcG9ydC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gZTNjMjVhZjRiNDBkNjRmMDk4ZTdiOGFlNWE5MWZkYzNjOTAxNjNjNCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjE0NjgwMDZlNzczZDZiMWRjYmU2ZDMyNGI2ODdi
ODYyMjBlZjRjNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IExlaSBNYW9odWkgPGxl
aW1hb2h1aUBjbi5mdWppdHN1LmNvbT4KIERhdGU6IFdlZCwgOCBNYXkgMjAxOSAxNDo0MjozMCAr
MDkwMAogU3ViamVjdDogW1BBVENIXSBpY3U6IEFkZGVkIGFybWViIHN1cHBvcnQuCkBAIC04LDE2
ICs4LDE1IEBAIE1ha2UgaWN1IHN1cHBvcnQgYXJtMzIgQkUuCiBVcHN0cmVhbS1TdGF0dXM6IFBl
bmRpbmcKIAogU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGNuLmZ1aml0c3Uu
Y29tPgotCiAtLS0KLSBpMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxzLmggfCAyICstCisgc291
cmNlL2kxOG4vZG91YmxlLWNvbnZlcnNpb24tdXRpbHMuaCB8IDIgKy0KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NvdXJjZS9p
MThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxzLmggYi9zb3VyY2UvaTE4bi9kb3VibGUtY29udmVy
c2lvbi11dGlscy5oCi1pbmRleCA3ZjIzZTBhLi43Zjg5MDk0IDEwMDY0NAotLS0tIGEvaTE4bi9k
b3VibGUtY29udmVyc2lvbi11dGlscy5oCi0rKysgYi9pMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0
aWxzLmgKLUBAIC0xMTUsNyArMTE1LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIqKiBhcmd2
KSB7CitpbmRleCAzMDM2NjhmLi43ZDg1OWRjIDEwMDY0NAorLS0tIGEvc291cmNlL2kxOG4vZG91
YmxlLWNvbnZlcnNpb24tdXRpbHMuaAorKysrIGIvc291cmNlL2kxOG4vZG91YmxlLWNvbnZlcnNp
b24tdXRpbHMuaAorQEAgLTE0Niw3ICsxNDYsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhcioq
IGFyZ3YpIHsKICAvLwogIC8vIElmIGl0IHByaW50cyAiY29ycmVjdCIgdGhlbiB0aGUgYXJjaGl0
ZWN0dXJlIHNob3VsZCBiZSBoZXJlLCBpbiB0aGUgImNvcnJlY3QiIHNlY3Rpb24uCiAgI2lmIGRl
ZmluZWQoX01fWDY0KSB8fCBkZWZpbmVkKF9feDg2XzY0X18pIHx8IFwKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvZml4LWluc3RhbGwtbWFueC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvZml4LWluc3RhbGwtbWFueC5wYXRjaAppbmRleCA5MjVi
MDY0ZWJkLi5kYWMyMzE2NWNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3Uv
aWN1L2ZpeC1pbnN0YWxsLW1hbngucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1
L2ljdS9maXgtaW5zdGFsbC1tYW54LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhNmRkYWJj
OGNhZGI3NmJmZTJkMmUzNzRhNjcwMjQ0MmNmZTUxY2NlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBjMWZmZTg4MWVkYjY1ZTE3ZDU2YmEzNzU1YTRjMzJjNzIzZmM1Yzg2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNv
bT4KIERhdGU6IEZyaSwgOSBPY3QgMjAxNSAxNzo1MDo0MSArMDEwMAogU3ViamVjdDogW1BBVENI
XSBpY3U6IGZpeCBpbnN0YWxsIHJhY2UKQEAgLTEzLDE1ICsxMywxNCBAQCBpbiB0aGUgaW5zdGFs
bCBjb21tYW5kLgogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIFNpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+Ci0KIC0tLQogIHNvdXJjZS9NYWtlZmls
ZS5pbiB8IDggKysrKy0tLS0KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQogCi1kaWZmIC0tZ2l0IGEvTWFrZWZpbGUuaW4gYi9NYWtlZmlsZS5pbgotaW5k
ZXggYmU5NDM1Yi4uYWRhMjBkNyAxMDA2NDQKLS0tLSBhL01ha2VmaWxlLmluCi0rKysgYi9NYWtl
ZmlsZS5pbgorZGlmZiAtLWdpdCBhL3NvdXJjZS9NYWtlZmlsZS5pbiBiL3NvdXJjZS9NYWtlZmls
ZS5pbgoraW5kZXggODM2NmYwMS4uNzliOTFjOSAxMDA2NDQKKy0tLSBhL3NvdXJjZS9NYWtlZmls
ZS5pbgorKysrIGIvc291cmNlL01ha2VmaWxlLmluCiBAQCAtNzcsNyArNzcsNyBAQCBFWFRSQV9E
QVRBID0KICAKICAjIyBMaXN0IG9mIHBob255IHRhcmdldHMKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2ljdS9pY3VfNzQtMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9p
Y3VfNzQtMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9pY3UvaWN1Xzc0LTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2lj
dS9pY3VfNzQtMi5iYgppbmRleCA4OGRlZDE2NmI1Li5lZjliMzZmNzliIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1Xzc0LTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvaWN1L2ljdV83NC0yLmJiCkBAIC0xMTEsNyArMTExLDcgQEAgU1JDX1VSSSA9ICIke0JB
U0VfU1JDX1VSSX07bmFtZT1jb2RlIFwKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICJc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURpc2FibGUtTERGTEFHU0lDVURULWZvci1MaW51eC5w
YXRjaCBcCiAgICAgICAgICAgIgotU1JDX1VSSVtjb2RlLnNoYTI1NnN1bV0gPSAiODZjZThlNjA2
ODE5NzJlNjBlNGRjYjI0OTBjNjk3NDYzZmNlYzYwZGQ0MDBhNWY5YmZmYmEyNmQwYjUyYjhkMCIK
K1NSQ19VUklbY29kZS5zaGEyNTZzdW1dID0gIjY4ZGIwODIyMTJhOTZkNmY1M2UzNWQ2MGY0N2Qz
OGI5NjJlOWY5ZDIwN2E3NGNmYWM3ODAyOWFlOGZmNWUwOGMiCiBTUkNfVVJJW2RhdGEuc2hhMjU2
c3VtXSA9ICI2N2Q1YWIzOWM1MTg3ZTFkZDBmZWQ2MGEzZmU1Mjc5NGRjZTk3ODRiNGMwNDVjYjg1
ZTE5ZjVkMzE3ZmQ3ODNmIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcv
cmVsZWFzZS0oP1A8cHZlcj4oPyEuK3JjKS4rKSIKLS0gCjIuNDIuMAoK

--===============6217475305115550718==--

