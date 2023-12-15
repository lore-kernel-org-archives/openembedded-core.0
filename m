Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B088C48BF0
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.63139.1702649863638533798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KPRGWf3A;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j10zlACT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018c6dd7309b-3a2a965f-6dad-4e31-a11d-b99042510e09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L8/wH1+OWi0wVXhp9EZoiiOik5ih07nlsafK2D8vj/o=;
	b=KPRGWf3As3/X4fT4whh8rHzfQ5/ILSWfX3532Whx3o0nNm/VMUuE1C7FCUm6lBHE
	OFlOmLFmsvoURnLDmlvb096BaYPbfUtc8M12nOmY34INXBJhrpdiyyD7HcEf69GF9xh
	l2fll3N/BBUeRfLWN743szR+CiSky+AKIjkyvG8U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L8/wH1+OWi0wVXhp9EZoiiOik5ih07nlsafK2D8vj/o=;
	b=j10zlACTd2LxYdkUH5NPuPfS+hasf/WmGdZWX1EfDpbic4Q7R72V39j6686qHAc1
	cR1NfSarfirLU3hQu2fRhL0Q/e4KbRuHMU6OpTMfQvgqR3sF0sltp92Rj9IHDwVzggX
	mstNwi0fhYU6Ofbil/+cVfax0CFJB0kG5lXRgnoo=
Content-Type: multipart/mixed; boundary="===============8212360987640626836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 1.23.2 SUCCEEDED
Message-ID: <0101018c6dd7309b-3a2a965f-6dad-4e31-a11d-b99042510e09-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192530

--===============8212360987640626836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gpgme* to *1.23.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-1.23.1-1.23.2.patch
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
From e19caefccbc864ab41ca8d9b90d511643898a825 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 13:42:53 +0000
Subject: [PATCH] gpgme: upgrade 1.23.1 -> 1.23.2

---
 ...ild-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch |  2 +-
 .../0001-autogen.sh-remove-unknown-in-version.patch  | 10 ++++------
 .../recipes-support/gpgme/gpgme/0001-pkgconfig.patch |  8 ++++----
 ...001-posix-io.c-Use-off_t-instead-of-off64_t.patch |  3 ++-
 .../0001-use-closefrom-on-linux-and-glibc-2.34.patch | 10 ++++------
 ...g-python-gpg-error-config-should-not-be-use.patch |  2 +-
 .../0003-Correctly-install-python-modules.patch      | 12 +++++-------
 .../gpgme/gpgme/0004-python-import.patch             | 10 ++++------
 ...fig-skip-all-lib-or-usr-lib-directories-in-.patch | 12 +++++-------
 .../gpgme/gpgme/0006-fix-build-path-issue.patch      | 12 +++++-------
 .../gpgme/0008-do-not-auto-check-var-PYTHON.patch    |  6 +++---
 .../gpgme/{gpgme_1.23.1.bb => gpgme_1.23.2.bb}       |  2 +-
 12 files changed, 39 insertions(+), 50 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.23.1.bb => gpgme_1.23.2.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 8ed39280ca..de7248024e 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From ee1421f7a7a9f31400ba992a5be52b88d20170c9 Mon Sep 17 00:00:00 2001
+From 900b489305cf8565bee05bf9181a43a528937cfa Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 14:18:04 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index 81af86e7b2..ff649a689b 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 46f346dff73122caffe62eda84596a3a3bec859e Mon Sep 17 00:00:00 2001
+From bbeb1297cdfce53496af6b81f1b34a92042dd07e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 28 Feb 2023 13:43:51 +0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
@@ -12,15 +12,16 @@ Remove the '-unknown' suffix to fix this issue.
 Upstream-Status: Submitted [https://lists.gnupg.org/pipermail/gnupg-devel/2023-February/035293.html]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  autogen.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 9b36158..d5cccd2 100755
+index 4e1665b..a55326d 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -266,7 +266,7 @@ if [ "$myhost" = "find-version" ]; then
+@@ -269,7 +269,7 @@ if [ "$myhost" = "find-version" ]; then
      else
        ingit=no
        beta=yes
@@ -29,6 +30,3 @@ index 9b36158..d5cccd2 100755
        rev="0000000"
        rvd="0"
      fi
--- 
-2.17.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 738b23cd58..b6d738e7e0 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From f8221238d51066b7a1a5f2917cce2791876ea8b0 Mon Sep 17 00:00:00 2001
+From 52b2a07dcff94467e01728583b62ecfb01fce46c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 10 May 2019 14:23:55 +0800
 Subject: [PATCH] pkgconfig
@@ -26,10 +26,10 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index d1b9aca..9c4f97c 100644
+index ae4c7da..df892c9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1043,6 +1043,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -1112,6 +1112,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -38,7 +38,7 @@ index d1b9aca..9c4f97c 100644
  AC_CONFIG_FILES(lang/cpp/tests/Makefile)
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 67805a8..d38ba02 100644
+index ca70950..bda5498 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
index be58c42128..d4eba66299 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From be33cf1812b4c2a3ed85fb2532992bfb2b27b3be Mon Sep 17 00:00:00 2001
+From 0b0854192203ce5feb6deafa31c428167b5646b4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 08:44:13 -0800
 Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
@@ -21,6 +21,7 @@ Fixes errors like below on 32-bit musl systems
 
 Upstream-Status: Submitted [https://lists.gnupg.org/pipermail/gnupg-devel/2022-December/035222.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/posix-io.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index f3de55f7b3..1bfcca4401 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From adb1d4e5498a19e9d591ac8f42f9ddfdb23a1354 Mon Sep 17 00:00:00 2001
+From e80d5ca264aa788debfae07dd2359fb762f47667 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
@@ -8,15 +8,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Rebase to 1.17.0
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
 ---
  src/posix-io.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/posix-io.c b/src/posix-io.c
-index 5c6cf1d..52e513a 100644
+index a422d8f..0d0a98b 100644
 --- a/src/posix-io.c
 +++ b/src/posix-io.c
-@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+@@ -577,7 +577,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
                if (fd_list[i].fd > fd)
                  fd = fd_list[i].fd;
              fd++;
@@ -25,6 +26,3 @@ index 5c6cf1d..52e513a 100644
              closefrom (fd);
              max_fds = fd;
  #else /*!__sun */
--- 
-2.25.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
index 0d2692912f..e5338d6bb8 100644
--- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
+++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
@@ -1,4 +1,4 @@
-From 9fce0689bc04506e5758444efa24ea99fe1ff5ef Mon Sep 17 00:00:00 2001
+From 9dcfe3501bef4a435f964f25934c487382682f35 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 14:30:36 +0800
 Subject: [PATCH] gpgme/lang/python: gpg-error-config should not be used
diff --git a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
index de1689ec05..5b497c6dc8 100644
--- a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
+++ b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
@@ -1,7 +1,7 @@
-From f632148fcc8757bb9a9601a6dab275e88cd309d2 Mon Sep 17 00:00:00 2001
+From 33d8d6136faf7978abc7811864c2e7cb02850646 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 15:28:49 +0800
-Subject: [PATCH 3/7] Correctly install python modules
+Subject: [PATCH] Correctly install python modules
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -12,15 +12,16 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Rebase to 1.10.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  lang/python/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 6988faf..36c6f7b 100644
+index 68b98e8..bbb9111 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -93,6 +93,7 @@ install-exec-local:
+@@ -97,6 +97,7 @@ install-exec-local:
  	  --build-base="$$(basename "$${PYTHON}")-gpg" \
  	  install \
  	  --prefix "$(DESTDIR)$(prefix)" \
@@ -28,6 +29,3 @@ index 6988faf..36c6f7b 100644
  	  --verbose ; \
  	done
  
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
index fa0eccfce3..5385a64543 100644
--- a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
+++ b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
@@ -1,7 +1,7 @@
-From f51bf1114bee6d56a950dcc6ebb46d6138b3faed Mon Sep 17 00:00:00 2001
+From 34c81f92ef6fb8763b37db8bce18c37506fd0076 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 16 Aug 2017 02:06:45 -0400
-Subject: [PATCH 4/7] python import
+Subject: [PATCH] python import
 
 Don't check for output on stderr to know if an import worked, host inputrc and
 sysroot readline can cause warnings on stderr.
@@ -12,12 +12,13 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 Rebase to 1.9.0
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  m4/ax_python_devel.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
-index b990d5b..318b089 100644
+index 55f0cff..e185284 100644
 --- a/m4/ax_python_devel.m4
 +++ b/m4/ax_python_devel.m4
 @@ -137,7 +137,7 @@ variable to configure. See ``configure --help'' for reference.
@@ -29,6 +30,3 @@ index b990d5b..318b089 100644
  		AC_MSG_RESULT([yes])
  	else
  		AC_MSG_RESULT([no])
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index 50bf21463f..7f46b01210 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,7 +1,7 @@
-From 8d9613c34ae495bbcbd725a2e7ac48138ba53c30 Mon Sep 17 00:00:00 2001
+From 484d78e00ad2714c2fc1710b6deb9be244ea604c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
-Subject: [PATCH 5/7] gpgme-config: skip all /lib* or /usr/lib* directories in
+Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
  output
 
 The logic was not working in multilib setups which use other
@@ -9,15 +9,16 @@ directory names than plain /lib or /usr/lib.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  src/gpgme-config.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/gpgme-config.in b/src/gpgme-config.in
-index a4d152e..8342865 100644
+index 56b98f8..e96f3c3 100644
 --- a/src/gpgme-config.in
 +++ b/src/gpgme-config.in
-@@ -154,7 +154,7 @@ while test $# -gt 0; do
+@@ -157,7 +157,7 @@ while test $# -gt 0; do
              for i in $libs $tmp_l $assuan_libs $gpg_error_libs $tmp_x; do
                skip=no
                case $i in
@@ -26,6 +27,3 @@ index a4d152e..8342865 100644
                        skip=yes
                        ;;
                    -L*|-l*)
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
index 1471184d67..f2d848c073 100644
--- a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
+++ b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
@@ -1,7 +1,7 @@
-From ef920688bfe1c7328c9e97229d62ccd35304ad84 Mon Sep 17 00:00:00 2001
+From abc703b5b1d2f5b15fee7b473b6455b2962b14bd Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 31 Jan 2018 11:01:09 +0800
-Subject: [PATCH 6/7] fix build path issue
+Subject: [PATCH] fix build path issue
 
 Get the "--root" directory supplied to the "install" command,
 and use it as a prefix to strip off the purported filename
@@ -12,15 +12,16 @@ to use relative path.
 
 Upstream-Status: Submitted [gnupg-devel@gnupg.org]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  lang/python/Makefile.am | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 36c6f7b..ce9a108 100644
+index bbb9111..cee499e 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -92,8 +92,9 @@ install-exec-local:
+@@ -96,8 +96,9 @@ install-exec-local:
  	  build \
  	  --build-base="$$(basename "$${PYTHON}")-gpg" \
  	  install \
@@ -32,6 +33,3 @@ index 36c6f7b..ce9a108 100644
  	  --verbose ; \
  	done
  
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
index 214cf348e4..fa2c34dc78 100644
--- a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
+++ b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
@@ -1,4 +1,4 @@
-From 94cf9f8fc79c0d1d4529cebdd74328927fda36a2 Mon Sep 17 00:00:00 2001
+From 454e9a17637a246d8b1a3192af25a376772c2e8b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 16:19:54 +0800
 Subject: [PATCH] do not auto check var-PYTHON
@@ -18,10 +18,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index df218ec..6a619ef 100644
+index df892c9..8c6194e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -521,9 +521,8 @@ if test "$found_py" = "1"; then
+@@ -590,9 +590,8 @@ if test "$found_py" = "1"; then
  	if test "$found_py" = "1" -o "$found_py3" = "1"; then
  	  # Reset everything, so that we can look for another Python.
            m4_foreach([mym4pythonver],
diff --git a/meta/recipes-support/gpgme/gpgme_1.23.1.bb b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.23.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.23.2.bb
index e029b73a8f..0d53400bd4 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "a0c316f7ab7d3bfb01a8753c3370dc906e5b61436021f3b54ff1483b513769bd"
+SRC_URI[sha256sum] = "9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
-- 
2.42.0


--===============8212360987640626836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 49 skipped, 0 masked, 0 errors.
Removing 32 recipes from the core2-64 sysroot...done.
Removing 62 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-1646ae62d497b2bb8064a1eeb7ffb88f6b81689c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1646ae62d497b2bb8064a1eeb7ffb88f6b81689c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 423 Local 409 Mirrors 0 Missed 14 Current 203 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 205 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 206 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 207 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 211 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 212 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 226 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 229 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 230 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-2.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 287 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx_setscene)
NOTE: Running task 652 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_fetch)
NOTE: recipe libassuan-2.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gpgme-1.23.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 303 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 306 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_fetch: Succeeded
NOTE: Running task 731 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-2.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gpgme-1.23.2-r0: task do_unpack: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 318 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 334 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 343 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_unpack: Succeeded
NOTE: Running task 792 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 360 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 370 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 384 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 386 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 419 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 423 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 434 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 447 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 468 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running task 989 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1012 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1013 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_populate_lic)
NOTE: Running task 1014 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1015 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 497 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-1.23.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 501 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_populate_lic: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/curl/8.4.0/temp/log.do_packagedata_setscene.964785
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 507 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gpgme-1.23.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_populate_lic unihash changed to fc2a088e4208a28d3ff6f798c343e566e879c55cab01f51e0ae4c1863099b2b6
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_deploy_source_date_epoch unihash changed to 6c1c33fd9e72a4d27b6b6d5f7d581c6e57cb42228e9219ff1af54a69d637c86c
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 502 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 530 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running task 1066 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1068 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running setscene task 541 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1099 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1100 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1111 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 556 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1142 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 614 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 626 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1579 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1607 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata)
NOTE: Running task 1725 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_collect_spdx_deps)
NOTE: recipe gpgme-1.23.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.23.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe gpgme-1.23.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gpgme-1.23.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1738 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_configure)
NOTE: recipe gpgme-1.23.2-r0: task do_configure: Started
NOTE: recipe gpgme-1.23.2-r0: task do_configure: Succeeded
NOTE: Running task 1739 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_compile)
NOTE: recipe gpgme-1.23.2-r0: task do_compile: Started
NOTE: recipe gpgme-1.23.2-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_install)
NOTE: recipe gpgme-1.23.2-r0: task do_install: Started
NOTE: recipe gpgme-1.23.2-r0: task do_install: Succeeded
NOTE: Running task 1741 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_package)
NOTE: Running task 1742 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_populate_sysroot)
NOTE: recipe gpgme-1.23.2-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.23.2-r0: task do_package: Started
NOTE: recipe gpgme-1.23.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.23.2-r0: task do_package: Succeeded
NOTE: Running task 1743 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_packagedata)
NOTE: recipe gpgme-1.23.2-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.23.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_packagedata unihash changed to 5b3754101c79a49abba465928fec47a542ffb2fc77758317e55038e67fd418aa
NOTE: Setscene tasks completed
NOTE: Running task 1744 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_create_spdx)
NOTE: Running task 1745 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_package_write_ipk)
NOTE: Running task 1746 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_package_write_deb)
NOTE: Running task 1747 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_package_write_rpm)
NOTE: Running task 1748 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_package_qa)
NOTE: recipe gpgme-1.23.2-r0: task do_create_spdx: Started
NOTE: recipe gpgme-1.23.2-r0: task do_package_write_ipk: Started
NOTE: recipe gpgme-1.23.2-r0: task do_package_write_deb: Started
NOTE: recipe gpgme-1.23.2-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.23.2-r0: task do_package_qa: Started
NOTE: recipe gpgme-1.23.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1749 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_create_runtime_spdx)
NOTE: recipe gpgme-1.23.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe gpgme-1.23.2-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_package_qa unihash changed to 70b5f5d637ed95e643f4c87e4b44f5ca3e350e51f60216ae545212d33d4a6655
NOTE: recipe gpgme-1.23.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gpgme-1.23.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_package_write_ipk unihash changed to 11f01e613b1fce46fdd3f8d7d95035d30852f33de71ae1cce90c9bba402e8c08
NOTE: recipe gpgme-1.23.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_package_write_rpm unihash changed to 19959a5e0252493faa61bc5dc49b26216ca4040fe029f292a5f75160fe911b3a
NOTE: recipe gpgme-1.23.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_package_write_deb unihash changed to f2342c376c6a81f5e6ee077caeb95d3c0fedfd3eb3a16dc843c6879626290404
NOTE: Running noexec task 1750 of 1750 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1750 tasks of which 1720 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-8.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:8.5.0-r0 to 0:8.4.0-r0) [version-going-backwards]
ERROR: curl-8.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:8.5.0-r0 to 0:8.4.0-r0) [version-going-backwards]
ERROR: curl-8.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:8.5.0-r0 to 0:8.4.0-r0) [version-going-backwards]
ERROR: curl-8.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:8.5.0-r0 to 0:8.4.0-r0) [version-going-backwards]
ERROR: curl-8.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:8.5.0-r0 to 0:8.4.0-r0) [version-going-backwards]
ERROR: curl-8.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:8.5.0-r0 to 0:8.4.0-r0) [version-going-backwards]
ERROR: curl-8.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:8.5.0-r0 to 0:8.4.0-r0) [version-going-backwards]
ERROR: curl-8.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:8.5.0-r0 to 0:8.4.0-r0) [version-going-backwards]
ERROR: curl-8.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:8.5.0-r0 to 0:8.4.0-r0) [version-going-backwards]
ERROR: curl-8.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8212360987640626836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gpgme/gpgme-cpp: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-cpp: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgmepp.so.6.20.0", added "/usr/lib/libgpgmepp.so.6.20.1"
packages/core2-64-poky-linux/gpgme/gpgme-dbg: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-dbg: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgme.so.11.32.0 /usr/lib/.debug/libgpgmepp.so.6.20.0", added "/usr/lib/.debug/libgpgme.so.11.32.1 /usr/lib/.debug/libgpgmepp.so.6.20.1"
packages/core2-64-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 10228328 to 10229888 (+0%)
packages/core2-64-poky-linux/gpgme/gpgme-dev: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-dev: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-doc: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-doc: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 474142 to 474094 (-0%)
packages/core2-64-poky-linux/gpgme/gpgme-locale: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-locale: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-src: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-src: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 3616747 to 3617911 (+0%)
packages/core2-64-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-staticdev: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.32.0", added "/usr/lib/libgpgme.so.11.32.1"
packages/core2-64-poky-linux/gpgme: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.23.1.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-python-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0006-fix-build-path-issue.patch file://0008-do-not-auto-check-var-PYTHON.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.23.2.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-pyt
 hon-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0006-fix-build-path-issue.patch file://0008-do-not-auto-check-var-PYTHON.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch"
packages/core2-64-poky-linux/gpgme/python3-gpg: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/python3-gpg: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info", added "/usr/lib/python3.11/site-packages/gpg-1.23.2-py3.11.egg-info"
Changes to packages/core2-64-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.20.0 to libgpgmepp.so.6.20.1
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.20.0 to libgpgmepp.so.6.20.1
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.32.0 to libgpgme.so.11.32.1
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.32.0 to libgpgme.so.11.32.1
  /usr/lib/libgpgmepp.so.6.20.0 moved to /usr/lib/libgpgmepp.so.6.20.1
  /usr/lib/libgpgme.so.11.32.0 moved to /usr/lib/libgpgme.so.11.32.1
  /usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/gpg-1.23.2-py3.11.egg-info

--===============8212360987640626836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgmepp.so.6.20.0", added "/usr/lib/libgpgmepp.so.6.20.1"
packages/core2-64-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.32.0", added "/usr/lib/libgpgme.so.11.32.1"
packages/core2-64-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info", added "/usr/lib/python3.11/site-packages/gpg-1.23.2-py3.11.egg-info"
Changes to packages/core2-64-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.20.0 to libgpgmepp.so.6.20.1
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.20.0 to libgpgmepp.so.6.20.1
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.32.0 to libgpgme.so.11.32.1
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.32.0 to libgpgme.so.11.32.1
  /usr/lib/libgpgmepp.so.6.20.0 moved to /usr/lib/libgpgmepp.so.6.20.1
  /usr/lib/libgpgme.so.11.32.0 moved to /usr/lib/libgpgme.so.11.32.1
  /usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/gpg-1.23.2-py3.11.egg-info

--===============8212360987640626836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-1.23.1-1.23.2.patch"

RnJvbSBlMTljYWVmY2NiYzg2NGFiNDFjYThkOWI5MGQ1MTE2NDM4OThhODI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMTM6NDI6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cGdtZTogdXBncmFkZSAxLjIzLjEgLT4gMS4yMy4yCgotLS0KIC4uLmlsZC1NYWtlLWdwZ21lLm00
LXVzZS1ncGdydC1jb25maWctd2l0aC0ucGMucGF0Y2ggfCAgMiArLQogLi4uLzAwMDEtYXV0b2dl
bi5zaC1yZW1vdmUtdW5rbm93bi1pbi12ZXJzaW9uLnBhdGNoICB8IDEwICsrKystLS0tLS0KIC4u
Li9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wa2djb25maWcucGF0Y2ggfCAgOCAr
KysrLS0tLQogLi4uMDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5w
YXRjaCB8ICAzICsrLQogLi4uLzAwMDEtdXNlLWNsb3NlZnJvbS1vbi1saW51eC1hbmQtZ2xpYmMt
Mi4zNC5wYXRjaCB8IDEwICsrKystLS0tLS0KIC4uLmctcHl0aG9uLWdwZy1lcnJvci1jb25maWct
c2hvdWxkLW5vdC1iZS11c2UucGF0Y2ggfCAgMiArLQogLi4uLzAwMDMtQ29ycmVjdGx5LWluc3Rh
bGwtcHl0aG9uLW1vZHVsZXMucGF0Y2ggICAgICB8IDEyICsrKysrLS0tLS0tLQogLi4uL2dwZ21l
L2dwZ21lLzAwMDQtcHl0aG9uLWltcG9ydC5wYXRjaCAgICAgICAgICAgICB8IDEwICsrKystLS0t
LS0KIC4uLmZpZy1za2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2gg
fCAxMiArKysrKy0tLS0tLS0KIC4uLi9ncGdtZS9ncGdtZS8wMDA2LWZpeC1idWlsZC1wYXRoLWlz
c3VlLnBhdGNoICAgICAgfCAxMiArKysrKy0tLS0tLS0KIC4uLi9ncGdtZS8wMDA4LWRvLW5vdC1h
dXRvLWNoZWNrLXZhci1QWVRIT04ucGF0Y2ggICAgfCAgNiArKystLS0KIC4uLi9ncGdtZS97Z3Bn
bWVfMS4yMy4xLmJiID0+IGdwZ21lXzEuMjMuMi5iYn0gICAgICAgfCAgMiArLQogMTIgZmlsZXMg
Y2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgNTAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ3BnbWUve2dwZ21lXzEuMjMuMS5iYiA9PiBncGdtZV8xLjIzLjIuYmJ9
ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAw
MS1SZXZlcnQtYnVpbGQtTWFrZS1ncGdtZS5tNC11c2UtZ3BncnQtY29uZmlnLXdpdGgtLnBjLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1SZXZlcnQtYnVpbGQt
TWFrZS1ncGdtZS5tNC11c2UtZ3BncnQtY29uZmlnLXdpdGgtLnBjLnBhdGNoCmluZGV4IDhlZDM5
MjgwY2EuLmRlNzI0ODAyNGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21l
L2dwZ21lLzAwMDEtUmV2ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZpZy13
aXRoLS5wYy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAx
LVJldmVydC1idWlsZC1NYWtlLWdwZ21lLm00LXVzZS1ncGdydC1jb25maWctd2l0aC0ucGMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGVlMTQyMWY3YTdhOWYzMTQwMGJhOTkyYTViZTUyYjg4
ZDIwMTcwYzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkwMGI0ODkzMDVjZjg1NjVi
ZWUwNWJmOTE4MWE0M2E1Mjg5MzdjZmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBGcmksIDEwIE1heSAy
MDE5IDE0OjE4OjA0ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAiYnVpbGQ6IE1ha2Ug
Z3BnbWUubTQgdXNlIGdwZ3J0LWNvbmZpZyB3aXRoICoucGMuIgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1hdXRvZ2VuLnNoLXJlbW92ZS11bmtub3du
LWluLXZlcnNpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAx
LWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaAppbmRleCA4MWFmODZl
N2IyLi5mZjY0OWE2ODliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9n
cGdtZS8wMDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLWF1dG9nZW4uc2gtcmVtb3Zl
LXVua25vd24taW4tdmVyc2lvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDZmMzQ2ZGZm
NzMxMjJjYWZmZTYyZWRhODQ1OTZhM2EzYmVjODU5ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gYmJlYjEyOTdjZGZjZTUzNDk2YWY2YjgxZjFiMzRhOTIwNDJkZDA3ZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERh
dGU6IFR1ZSwgMjggRmViIDIwMjMgMTM6NDM6NTEgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXV0
b2dlbi5zaDogcmVtb3ZlICctdW5rbm93bicgaW4gdmVyc2lvbgpAQCAtMTIsMTUgKzEyLDE2IEBA
IFJlbW92ZSB0aGUgJy11bmtub3duJyBzdWZmaXggdG8gZml4IHRoaXMgaXNzdWUuCiBVcHN0cmVh
bS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9saXN0cy5nbnVwZy5vcmcvcGlwZXJtYWlsL2du
dXBnLWRldmVsLzIwMjMtRmVicnVhcnkvMDM1MjkzLmh0bWxdCiAKIFNpZ25lZC1vZmYtYnk6IENo
ZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KKwogLS0tCiAgYXV0b2dlbi5zaCB8IDIgKy0K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2F1dG9nZW4uc2ggYi9hdXRvZ2VuLnNoCi1pbmRleCA5YjM2MTU4Li5kNWNjY2QyIDEw
MDc1NQoraW5kZXggNGUxNjY1Yi4uYTU1MzI2ZCAxMDA3NTUKIC0tLSBhL2F1dG9nZW4uc2gKICsr
KyBiL2F1dG9nZW4uc2gKLUBAIC0yNjYsNyArMjY2LDcgQEAgaWYgWyAiJG15aG9zdCIgPSAiZmlu
ZC12ZXJzaW9uIiBdOyB0aGVuCitAQCAtMjY5LDcgKzI2OSw3IEBAIGlmIFsgIiRteWhvc3QiID0g
ImZpbmQtdmVyc2lvbiIgXTsgdGhlbgogICAgICBlbHNlCiAgICAgICAgaW5naXQ9bm8KICAgICAg
ICBiZXRhPXllcwpAQCAtMjksNiArMzAsMyBAQCBpbmRleCA5YjM2MTU4Li5kNWNjY2QyIDEwMDc1
NQogICAgICAgIHJldj0iMDAwMDAwMCIKICAgICAgICBydmQ9IjAiCiAgICAgIGZpCi0tLSAKLTIu
MTcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAx
LXBrZ2NvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEt
cGtnY29uZmlnLnBhdGNoCmluZGV4IDczOGIyM2NkNTguLmI2ZDczOGU3ZTAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcGtnY29uZmlnLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcGtnY29uZmlnLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmODIyMTIzOGQ1MTA2NmI3YTFhNWYyOTE3Y2NlMjc5MTg3
NmVhOGIwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1MmIyYTA3ZGNmZjk0NDY3ZTAx
NzI4NTgzYjYyZWNmYjAxZmNlNDZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBG
cmksIDEwIE1heSAyMDE5IDE0OjIzOjU1ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBrZ2NvbmZp
ZwpAQCAtMjYsMTAgKzI2LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlA
ZnVqaXRzdS5jb20+CiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNyYy9ncGdtZS1wdGhyZWFkLnBjLmlu
CiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGQxYjlh
Y2EuLjljNGY5N2MgMTAwNjQ0CitpbmRleCBhZTRjN2RhLi5kZjg5MmM5IDEwMDY0NAogLS0tIGEv
Y29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0xMDQzLDYgKzEwNDMsNyBAQCBB
Q19DT05GSUdfRklMRVMoTWFrZWZpbGUgc3JjL01ha2VmaWxlCitAQCAtMTExMiw2ICsxMTEyLDcg
QEAgQUNfQ09ORklHX0ZJTEVTKE1ha2VmaWxlIHNyYy9NYWtlZmlsZQogICAgICAgICAgICAgICAg
ICBzcmMvZ3BnbWUtZ2xpYi5wYwogICAgICAgICAgICAgICAgICBzcmMvZ3BnbWUuaCkKICBBQ19D
T05GSUdfRklMRVMoc3JjL2dwZ21lLWNvbmZpZywgY2htb2QgK3ggc3JjL2dwZ21lLWNvbmZpZykK
QEAgLTM4LDcgKzM4LDcgQEAgaW5kZXggZDFiOWFjYS4uOWM0Zjk3YyAxMDA2NDQKICBBQ19DT05G
SUdfRklMRVMobGFuZy9jcHAvdGVzdHMvTWFrZWZpbGUpCiAgQUNfQ09ORklHX0ZJTEVTKGxhbmcv
Y3BwL3NyYy9HcGdtZXBwQ29uZmlnLXczMi5jbWFrZS5pbikKIGRpZmYgLS1naXQgYS9zcmMvTWFr
ZWZpbGUuYW0gYi9zcmMvTWFrZWZpbGUuYW0KLWluZGV4IDY3ODA1YTguLmQzOGJhMDIgMTAwNjQ0
CitpbmRleCBjYTcwOTUwLi5iZGE1NDk4IDEwMDY0NAogLS0tIGEvc3JjL01ha2VmaWxlLmFtCiAr
KysgYi9zcmMvTWFrZWZpbGUuYW0KIEBAIC0yMCwxMSArMjAsMTEgQEAKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcG9zaXgtaW8uYy1Vc2Utb2ZmX3Qt
aW5zdGVhZC1vZi1vZmY2NF90LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3Bn
bWUvMDAwMS1wb3NpeC1pby5jLVVzZS1vZmZfdC1pbnN0ZWFkLW9mLW9mZjY0X3QucGF0Y2gKaW5k
ZXggYmU1OGM0MjEyOC4uZDRlYmE2NjI5OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ3BnbWUvZ3BnbWUvMDAwMS1wb3NpeC1pby5jLVVzZS1vZmZfdC1pbnN0ZWFkLW9mLW9mZjY0
X3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wb3Np
eC1pby5jLVVzZS1vZmZfdC1pbnN0ZWFkLW9mLW9mZjY0X3QucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGJlMzNjZjE4MTJiNGMyYTNlZDg1ZmIyNTMyOTkyYmZiMmIyN2IzYmUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDBiMDg1NDE5MjIwM2NlNWZlYjZkZWFmYTMxYzQyODE2N2I1
NjQ2YjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogRGF0ZTogVGh1LCAxNSBEZWMgMjAyMiAwODo0NDoxMyAtMDgwMAogU3ViamVj
dDogW1BBVENIXSBwb3NpeC1pby5jOiBVc2Ugb2ZmX3QgaW5zdGVhZCBvZiBvZmY2NF90CkBAIC0y
MSw2ICsyMSw3IEBAIEZpeGVzIGVycm9ycyBsaWtlIGJlbG93IG9uIDMyLWJpdCBtdXNsIHN5c3Rl
bXMKIAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vbGlzdHMuZ251cGcub3Jn
L3BpcGVybWFpbC9nbnVwZy1kZXZlbC8yMDIyLURlY2VtYmVyLzAzNTIyMi5odG1sXQogU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCiAgc3JjL3Bvc2l4
LWlvLmMgfCA0ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAw
MS11c2UtY2xvc2Vmcm9tLW9uLWxpbnV4LWFuZC1nbGliYy0yLjM0LnBhdGNoIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS11c2UtY2xvc2Vmcm9tLW9uLWxpbnV4LWFuZC1n
bGliYy0yLjM0LnBhdGNoCmluZGV4IGYzZGU1NWY3YjMuLjFiZmNjYTQ0MDEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtdXNlLWNsb3NlZnJvbS1vbi1s
aW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdt
ZS9ncGdtZS8wMDAxLXVzZS1jbG9zZWZyb20tb24tbGludXgtYW5kLWdsaWJjLTIuMzQucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGFkYjFkNGU1NDk4YTE5ZTlkNTkxYWM4ZjQyZjlkZGZkYjIz
YTEzNTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU4MGQ1Y2EyNjRhYTc4OGRlYmZh
ZTA3ZGQyMzU5ZmI3NjJmNDc2NjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAxNSBKdWwgMjAyMSAxMjozMzox
MyAtMDcwMAogU3ViamVjdDogW1BBVENIXSB1c2UgY2xvc2Vmcm9tKCkgb24gbGludXggYW5kIGds
aWJjIDIuMzQrCkBAIC04LDE1ICs4LDE2IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CiAKIFJlYmFzZSB0byAxLjE3LjAKIFNpZ25lZC1vZmYtYnk6IFdhbmcg
TWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+CisKIC0tLQogIHNyYy9wb3NpeC1pby5jIHwgMiAr
LQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvc3JjL3Bvc2l4LWlvLmMgYi9zcmMvcG9zaXgtaW8uYwotaW5kZXggNWM2Y2YxZC4u
NTJlNTEzYSAxMDA2NDQKK2luZGV4IGE0MjJkOGYuLjBkMGE5OGIgMTAwNjQ0CiAtLS0gYS9zcmMv
cG9zaXgtaW8uYwogKysrIGIvc3JjL3Bvc2l4LWlvLmMKLUBAIC01NzAsNyArNTcwLDcgQEAgX2dw
Z21lX2lvX3NwYXduIChjb25zdCBjaGFyICpwYXRoLCBjaGFyICpjb25zdCBhcmd2W10sIHVuc2ln
bmVkIGludCBmbGFncywKK0BAIC01NzcsNyArNTc3LDcgQEAgX2dwZ21lX2lvX3NwYXduIChjb25z
dCBjaGFyICpwYXRoLCBjaGFyICpjb25zdCBhcmd2W10sIHVuc2lnbmVkIGludCBmbGFncywKICAg
ICAgICAgICAgICAgIGlmIChmZF9saXN0W2ldLmZkID4gZmQpCiAgICAgICAgICAgICAgICAgIGZk
ID0gZmRfbGlzdFtpXS5mZDsKICAgICAgICAgICAgICBmZCsrOwpAQCAtMjUsNiArMjYsMyBAQCBp
bmRleCA1YzZjZjFkLi41MmU1MTNhIDEwMDY0NAogICAgICAgICAgICAgIGNsb3NlZnJvbSAoZmQp
OwogICAgICAgICAgICAgIG1heF9mZHMgPSBmZDsKICAjZWxzZSAvKiFfX3N1biAqLwotLS0gCi0y
LjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAw
Mi1ncGdtZS1sYW5nLXB5dGhvbi1ncGctZXJyb3ItY29uZmlnLXNob3VsZC1ub3QtYmUtdXNlLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMi1ncGdtZS1sYW5nLXB5
dGhvbi1ncGctZXJyb3ItY29uZmlnLXNob3VsZC1ub3QtYmUtdXNlLnBhdGNoCmluZGV4IDBkMjY5
MjkxMmYuLmU1MzM4ZDZiYjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21l
L2dwZ21lLzAwMDItZ3BnbWUtbGFuZy1weXRob24tZ3BnLWVycm9yLWNvbmZpZy1zaG91bGQtbm90
LWJlLXVzZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAy
LWdwZ21lLWxhbmctcHl0aG9uLWdwZy1lcnJvci1jb25maWctc2hvdWxkLW5vdC1iZS11c2UucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlmY2UwNjg5YmMwNDUwNmU1NzU4NDQ0ZWZhMjRlYTk5
ZmUxZmY1ZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlkY2ZlMzUwMWJlZjRhNDM1
Zjk2NGYyNTkzNGM0ODczODI2ODJmMzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBGcmksIDEwIE1heSAy
MDE5IDE0OjMwOjM2ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdwZ21lL2xhbmcvcHl0aG9uOiBn
cGctZXJyb3ItY29uZmlnIHNob3VsZCBub3QgYmUgdXNlZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMy1Db3JyZWN0bHktaW5zdGFsbC1weXRob24tbW9k
dWxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDMtQ29ycmVj
dGx5LWluc3RhbGwtcHl0aG9uLW1vZHVsZXMucGF0Y2gKaW5kZXggZGUxNjg5ZWMwNS4uNWI0OTdj
NmRjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMy1D
b3JyZWN0bHktaW5zdGFsbC1weXRob24tbW9kdWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAzLUNvcnJlY3RseS1pbnN0YWxsLXB5dGhvbi1tb2R1bGVz
LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBmNjMyMTQ4ZmNjODc1N2JiOWE5NjAxYTZkYWIy
NzVlODhjZDMwOWQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzM2Q4ZDYxMzZmYWY3
OTc4YWJjNzgxMTg2NGMyZTdjYjAyODUwNjQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAzMCBK
YW4gMjAxOCAxNToyODo0OSArMDgwMAotU3ViamVjdDogW1BBVENIIDMvN10gQ29ycmVjdGx5IGlu
c3RhbGwgcHl0aG9uIG1vZHVsZXMKK1N1YmplY3Q6IFtQQVRDSF0gQ29ycmVjdGx5IGluc3RhbGwg
cHl0aG9uIG1vZHVsZXMKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3Jl
IHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CkBAIC0xMiwxNSArMTIsMTYgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEpp
YSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogCiBSZWJhc2UgdG8gMS4xMC4wCiBTaWduZWQt
b2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CisKIC0tLQogIGxh
bmcvcHl0aG9uL01ha2VmaWxlLmFtIHwgMSArCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCiAKIGRpZmYgLS1naXQgYS9sYW5nL3B5dGhvbi9NYWtlZmlsZS5hbSBiL2xhbmcvcHl0aG9u
L01ha2VmaWxlLmFtCi1pbmRleCA2OTg4ZmFmLi4zNmM2ZjdiIDEwMDY0NAoraW5kZXggNjhiOThl
OC4uYmJiOTExMSAxMDA2NDQKIC0tLSBhL2xhbmcvcHl0aG9uL01ha2VmaWxlLmFtCiArKysgYi9s
YW5nL3B5dGhvbi9NYWtlZmlsZS5hbQotQEAgLTkzLDYgKzkzLDcgQEAgaW5zdGFsbC1leGVjLWxv
Y2FsOgorQEAgLTk3LDYgKzk3LDcgQEAgaW5zdGFsbC1leGVjLWxvY2FsOgogIAkgIC0tYnVpbGQt
YmFzZT0iJCQoYmFzZW5hbWUgIiQke1BZVEhPTn0iKS1ncGciIFwKICAJICBpbnN0YWxsIFwKICAJ
ICAtLXByZWZpeCAiJChERVNURElSKSQocHJlZml4KSIgXApAQCAtMjgsNiArMjksMyBAQCBpbmRl
eCA2OTg4ZmFmLi4zNmM2ZjdiIDEwMDY0NAogIAkgIC0tdmVyYm9zZSA7IFwKICAJZG9uZQogIAot
LS0gCi0yLjcuNAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdt
ZS8wMDA0LXB5dGhvbi1pbXBvcnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9n
cGdtZS8wMDA0LXB5dGhvbi1pbXBvcnQucGF0Y2gKaW5kZXggZmEwZWNjZmNlMy4uNTM4NWE2NDU0
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwNC1weXRo
b24taW1wb3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAw
MDQtcHl0aG9uLWltcG9ydC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZjUxYmYxMTE0YmVl
NmQ1NmE5NTBkY2M2ZWJiNDZkNjEzOGIzZmFlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMzRjODFmOTJlZjZmYjg3NjNiMzdkYjhiY2UxOGMzNzUwNmZkMDA3NiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBE
YXRlOiBXZWQsIDE2IEF1ZyAyMDE3IDAyOjA2OjQ1IC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0ggNC83
XSBweXRob24gaW1wb3J0CitTdWJqZWN0OiBbUEFUQ0hdIHB5dGhvbiBpbXBvcnQKIAogRG9uJ3Qg
Y2hlY2sgZm9yIG91dHB1dCBvbiBzdGRlcnIgdG8ga25vdyBpZiBhbiBpbXBvcnQgd29ya2VkLCBo
b3N0IGlucHV0cmMgYW5kCiBzeXNyb290IHJlYWRsaW5lIGNhbiBjYXVzZSB3YXJuaW5ncyBvbiBz
dGRlcnIuCkBAIC0xMiwxMiArMTIsMTMgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJv
c3MuYnVydG9uQGludGVsLmNvbT4KIFJlYmFzZSB0byAxLjkuMAogCiBTaWduZWQtb2ZmLWJ5OiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CisKIC0tLQogIG00L2F4X3B5dGhv
bl9kZXZlbC5tNCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL200L2F4X3B5dGhvbl9kZXZlbC5tNCBiL200L2F4X3B5
dGhvbl9kZXZlbC5tNAotaW5kZXggYjk5MGQ1Yi4uMzE4YjA4OSAxMDA2NDQKK2luZGV4IDU1ZjBj
ZmYuLmUxODUyODQgMTAwNjQ0CiAtLS0gYS9tNC9heF9weXRob25fZGV2ZWwubTQKICsrKyBiL200
L2F4X3B5dGhvbl9kZXZlbC5tNAogQEAgLTEzNyw3ICsxMzcsNyBAQCB2YXJpYWJsZSB0byBjb25m
aWd1cmUuIFNlZSBgYGNvbmZpZ3VyZSAtLWhlbHAnJyBmb3IgcmVmZXJlbmNlLgpAQCAtMjksNiAr
MzAsMyBAQCBpbmRleCBiOTkwZDViLi4zMThiMDg5IDEwMDY0NAogIAkJQUNfTVNHX1JFU1VMVChb
eWVzXSkKICAJZWxzZQogIAkJQUNfTVNHX1JFU1VMVChbbm9dKQotLS0gCi0yLjcuNAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDA1LWdwZ21lLWNvbmZp
Zy1za2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDA1LWdwZ21lLWNvbmZpZy1za2lwLWFsbC1saWIt
b3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2gKaW5kZXggNTBiZjIxNDYzZi4uN2Y0NmIw
MTIxMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwNS1n
cGdtZS1jb25maWctc2tpcC1hbGwtbGliLW9yLXVzci1saWItZGlyZWN0b3JpZXMtaW4tLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDUtZ3BnbWUtY29uZmln
LXNraXAtYWxsLWxpYi1vci11c3ItbGliLWRpcmVjdG9yaWVzLWluLS5wYXRjaApAQCAtMSw3ICsx
LDcgQEAKLUZyb20gOGQ5NjEzYzM0YWU0OTViYmNiZDcyNWEyZTdhYzQ4MTM4YmE1M2MzMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDg0ZDc4ZTAwYWQyNzE0YzJmYzE3MTBiNmRlYjli
ZTI0NGVhNjA0YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAxMyBBcHIgMjAxNyAxNjo0
MDoyNyArMDMwMAotU3ViamVjdDogW1BBVENIIDUvN10gZ3BnbWUtY29uZmlnOiBza2lwIGFsbCAv
bGliKiBvciAvdXNyL2xpYiogZGlyZWN0b3JpZXMgaW4KK1N1YmplY3Q6IFtQQVRDSF0gZ3BnbWUt
Y29uZmlnOiBza2lwIGFsbCAvbGliKiBvciAvdXNyL2xpYiogZGlyZWN0b3JpZXMgaW4KICBvdXRw
dXQKIAogVGhlIGxvZ2ljIHdhcyBub3Qgd29ya2luZyBpbiBtdWx0aWxpYiBzZXR1cHMgd2hpY2gg
dXNlIG90aGVyCkBAIC05LDE1ICs5LDE2IEBAIGRpcmVjdG9yeSBuYW1lcyB0aGFuIHBsYWluIC9s
aWIgb3IgL3Vzci9saWIuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29y
ZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgorCiAtLS0KICBzcmMvZ3BnbWUtY29uZmlnLmluIHwgMiArLQogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
c3JjL2dwZ21lLWNvbmZpZy5pbiBiL3NyYy9ncGdtZS1jb25maWcuaW4KLWluZGV4IGE0ZDE1MmUu
LjgzNDI4NjUgMTAwNjQ0CitpbmRleCA1NmI5OGY4Li5lOTZmM2MzIDEwMDY0NAogLS0tIGEvc3Jj
L2dwZ21lLWNvbmZpZy5pbgogKysrIGIvc3JjL2dwZ21lLWNvbmZpZy5pbgotQEAgLTE1NCw3ICsx
NTQsNyBAQCB3aGlsZSB0ZXN0ICQjIC1ndCAwOyBkbworQEAgLTE1Nyw3ICsxNTcsNyBAQCB3aGls
ZSB0ZXN0ICQjIC1ndCAwOyBkbwogICAgICAgICAgICAgIGZvciBpIGluICRsaWJzICR0bXBfbCAk
YXNzdWFuX2xpYnMgJGdwZ19lcnJvcl9saWJzICR0bXBfeDsgZG8KICAgICAgICAgICAgICAgIHNr
aXA9bm8KICAgICAgICAgICAgICAgIGNhc2UgJGkgaW4KQEAgLTI2LDYgKzI3LDMgQEAgaW5kZXgg
YTRkMTUyZS4uODM0Mjg2NSAxMDA2NDQKICAgICAgICAgICAgICAgICAgICAgICAgc2tpcD15ZXMK
ICAgICAgICAgICAgICAgICAgICAgICAgOzsKICAgICAgICAgICAgICAgICAgICAtTCp8LWwqKQot
LS0gCi0yLjcuNAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdt
ZS8wMDA2LWZpeC1idWlsZC1wYXRoLWlzc3VlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z3BnbWUvZ3BnbWUvMDAwNi1maXgtYnVpbGQtcGF0aC1pc3N1ZS5wYXRjaAppbmRleCAxNDcxMTg0
ZDY3Li5mMmQ4NDhjMDczIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9n
cGdtZS8wMDA2LWZpeC1idWlsZC1wYXRoLWlzc3VlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dwZ21lL2dwZ21lLzAwMDYtZml4LWJ1aWxkLXBhdGgtaXNzdWUucGF0Y2gKQEAgLTEs
NyArMSw3IEBACi1Gcm9tIGVmOTIwNjg4YmZlMWM3MzI4YzllOTcyMjlkNjJjY2QzNTMwNGFkODQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGFiYzcwM2I1YjFkMmY1YjE1ZmVlN2I0NzNi
NjQ1NWIyOTYyYjE0YmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlh
IDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDMxIEphbiAyMDE4IDExOjAx
OjA5ICswODAwCi1TdWJqZWN0OiBbUEFUQ0ggNi83XSBmaXggYnVpbGQgcGF0aCBpc3N1ZQorU3Vi
amVjdDogW1BBVENIXSBmaXggYnVpbGQgcGF0aCBpc3N1ZQogCiBHZXQgdGhlICItLXJvb3QiIGRp
cmVjdG9yeSBzdXBwbGllZCB0byB0aGUgImluc3RhbGwiIGNvbW1hbmQsCiBhbmQgdXNlIGl0IGFz
IGEgcHJlZml4IHRvIHN0cmlwIG9mZiB0aGUgcHVycG9ydGVkIGZpbGVuYW1lCkBAIC0xMiwxNSAr
MTIsMTYgQEAgdG8gdXNlIHJlbGF0aXZlIHBhdGguCiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0
dGVkIFtnbnVwZy1kZXZlbEBnbnVwZy5vcmddCiBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxo
b25neHUuamlhQHdpbmRyaXZlci5jb20+CisKIC0tLQogIGxhbmcvcHl0aG9uL01ha2VmaWxlLmFt
IHwgNSArKystLQogIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9sYW5nL3B5dGhvbi9NYWtlZmlsZS5hbSBiL2xhbmcvcHl0aG9u
L01ha2VmaWxlLmFtCi1pbmRleCAzNmM2ZjdiLi5jZTlhMTA4IDEwMDY0NAoraW5kZXggYmJiOTEx
MS4uY2VlNDk5ZSAxMDA2NDQKIC0tLSBhL2xhbmcvcHl0aG9uL01ha2VmaWxlLmFtCiArKysgYi9s
YW5nL3B5dGhvbi9NYWtlZmlsZS5hbQotQEAgLTkyLDggKzkyLDkgQEAgaW5zdGFsbC1leGVjLWxv
Y2FsOgorQEAgLTk2LDggKzk2LDkgQEAgaW5zdGFsbC1leGVjLWxvY2FsOgogIAkgIGJ1aWxkIFwK
ICAJICAtLWJ1aWxkLWJhc2U9IiQkKGJhc2VuYW1lICIkJHtQWVRIT059IiktZ3BnIiBcCiAgCSAg
aW5zdGFsbCBcCkBAIC0zMiw2ICszMywzIEBAIGluZGV4IDM2YzZmN2IuLmNlOWExMDggMTAwNjQ0
CiAgCSAgLS12ZXJib3NlIDsgXAogIAlkb25lCiAgCi0tLSAKLTIuNy40Ci0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDgtZG8tbm90LWF1dG8tY2hlY2st
dmFyLVBZVEhPTi5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDgt
ZG8tbm90LWF1dG8tY2hlY2stdmFyLVBZVEhPTi5wYXRjaAppbmRleCAyMTRjZjM0OGU0Li5mYTJj
MzRkYzc4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDA4
LWRvLW5vdC1hdXRvLWNoZWNrLXZhci1QWVRIT04ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwOC1kby1ub3QtYXV0by1jaGVjay12YXItUFlUSE9OLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NGNmOWY4ZmM3OWMwZDFkNDUyOWNlYmRkNzQzMjg5Mjdm
ZGEzNmEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NTRlOWExNzYzN2EyNDZkOGIx
YTMxOTJhZjI1YTM3Njc3MmMyZThiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9u
Z3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAxMCBNYXkgMjAx
OSAxNjoxOTo1NCArMDgwMAogU3ViamVjdDogW1BBVENIXSBkbyBub3QgYXV0byBjaGVjayB2YXIt
UFlUSE9OCkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9u
Z3h1LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUu
YWMKLWluZGV4IGRmMjE4ZWMuLjZhNjE5ZWYgMTAwNjQ0CitpbmRleCBkZjg5MmM5Li44YzYxOTRl
IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC01MjEs
OSArNTIxLDggQEAgaWYgdGVzdCAiJGZvdW5kX3B5IiA9ICIxIjsgdGhlbgorQEAgLTU5MCw5ICs1
OTAsOCBAQCBpZiB0ZXN0ICIkZm91bmRfcHkiID0gIjEiOyB0aGVuCiAgCWlmIHRlc3QgIiRmb3Vu
ZF9weSIgPSAiMSIgLW8gIiRmb3VuZF9weTMiID0gIjEiOyB0aGVuCiAgCSAgIyBSZXNldCBldmVy
eXRoaW5nLCBzbyB0aGF0IHdlIGNhbiBsb29rIGZvciBhbm90aGVyIFB5dGhvbi4KICAgICAgICAg
ICAgbTRfZm9yZWFjaChbbXltNHB5dGhvbnZlcl0sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9ncGdtZS9ncGdtZV8xLjIzLjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdt
ZS9ncGdtZV8xLjIzLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMS4yMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9ncGdtZS9ncGdtZV8xLjIzLjIuYmIKaW5kZXggZTAyOWI3M2E4Zi4uMGQ1MzQw
MGJkNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMS4yMy4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzEuMjMuMi5iYgpAQCAt
MjQsNyArMjQsNyBAQCBTUkNfVVJJID0gIiR7R05VUEdfTUlSUk9SfS9ncGdtZS8ke0JQfS50YXIu
YnoyIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYXV0b2dlbi5zaC1yZW1vdmUtdW5rbm93bi1p
bi12ZXJzaW9uLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YTBjMzE2ZjdhYjdkM2JmYjAxYTg3NTNjMzM3MGRjOTA2ZTViNjE0MzYwMjFmM2I1NGZmMTQ4M2I1
MTM3NjliZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NDk5ZThiMWYzM2NjY2I2ODE1NTI3YTFi
YzE2MDQ5ZDM1YTYxOThhNmM1ZmFlMDE4NWYyYmQ1NjFiY2U1MjI0IgogCiBQWVRIT05fREVQUyA9
ICIke0BiYi51dGlscy5jb250YWlucygnTEFOR1VBR0VTJywgJ3B5dGhvbicsICdzd2lnLW5hdGl2
ZScsICcnLCBkKX0iCiAKLS0gCjIuNDIuMAoK

--===============8212360987640626836==--

