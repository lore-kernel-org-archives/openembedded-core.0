Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294A9C531DD
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75497.1722536828104115023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Timkmpd4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mPlL9eKw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f323fe8-fcf2174e-2a05-4f51-9a81-8f68967858aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AKn9aFQQr3bQQEfgdbvPt9t2LLNwAfIk0VgAlA1HS94=;
	b=Timkmpd4c6/EYsGQEKdyPY5pQl++5GfPs4tByIkDhd6qn5c8g1s5O3+JE/MFyY39
	MqLv7Psu/I+Wyurh1wtqsShfEKbvJnav+pWc8duhfUPQBqHgEw5g5eq6xq19qfEeqhn
	1auOVMtr44ektaNhmjUCm+s36pp9Ae7QESHedz3Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AKn9aFQQr3bQQEfgdbvPt9t2LLNwAfIk0VgAlA1HS94=;
	b=mPlL9eKwZ5mcpaEgwKClQM0UX8iz/tFewm4Y7jTZJSguquo77HxOOUJrRlNaAt9c
	c9dx02TQ5rqD3hlseICrMIOBQdN4eIvLBKhaJPjRo+813SL3LqCNk6iix87NxxQkgEy
	iRH9cWPmB3T9n5rgD8yFA7jtfPCqFU3oc9fo0a04=
Content-Type: multipart/mixed; boundary="===============1405000389405841129=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.0 FAILED
Message-ID: <010101910f323fe8-fcf2174e-2a05-4f51-9a81-8f68967858aa-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202871

--===============1405000389405841129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnupg* to *2.5.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.4.5-2.5.0.patch
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
From ff06f3652993e71a9aca68a5a39b4660e20adbbd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 17:23:42 +0000
Subject: [PATCH] gnupg: upgrade 2.4.5 -> 2.5.0

---
 ...erride-init-is-not-needed-with-gcc-9.patch |  7 ++-----
 ...-a-custom-value-for-the-location-of-.patch |  7 +++----
 ...use-pkgconfig-instead-of-npth-config.patch |  3 +--
 ...h-fix-find-version-for-beta-checking.patch |  9 ++++-----
 .../gnupg/gnupg/relocate.patch                | 19 +++++++++----------
 .../gnupg/{gnupg_2.4.5.bb => gnupg_2.5.0.bb}  |  2 +-
 6 files changed, 20 insertions(+), 27 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.5.bb => gnupg_2.5.0.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 83195b5bd4..42dcb25f6a 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
+From 869def5abab3fb39a0309a143b167ab5afa48a7f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dirmngr/dns.h b/dirmngr/dns.h
-index 024d6dcc8..c6e141e16 100644
+index 1f647e1..334acb6 100644
 --- a/dirmngr/dns.h
 +++ b/dirmngr/dns.h
 @@ -139,7 +139,7 @@ DNS_PUBLIC int *dns_debug_p(void);
@@ -29,6 +29,3 @@ index 024d6dcc8..c6e141e16 100644
  #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
  #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
  #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
--- 
-2.17.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index f957f6b55e..c2df1c96cb 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 6b581c43bd01f815db78a410fd3814fc5994171e Mon Sep 17 00:00:00 2001
+From e4c25d11a6bf599f47d4d2d253434fc07cb76a8d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -8,16 +8,15 @@ This should avoid clashes with the host gpg-agent observed on autobuilders.
 
 Upstream-Status: Inappropriate [oe-core specific, and only for -native]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 26d7f7b..e953c2e 100644
+index e4f8c0e..fa75ec8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1921,7 +1921,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1925,7 +1925,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 0e58fd4c4d..62b118524e 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d9048788d906774b1475c3bb1b17e22455c2add4 Mon Sep 17 00:00:00 2001
+From e85fabf8305841e8ffd7aa1ed95265f88f9331d5 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
@@ -9,7 +9,6 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  m4/npth.m4 | 53 ++++++++---------------------------------------------
  1 file changed, 8 insertions(+), 45 deletions(-)
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index d664c36a1b..5a0e7bfcf2 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 6a7f9b71d936847dcaeeac7d1b69d8299be4dd85 Mon Sep 17 00:00:00 2001
+From b4c271777564cc7d0aac425a32db4f9a9c7dc72b Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
@@ -13,20 +13,19 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  autogen.sh | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 0abf103..78753b5 100755
+index 9f91297..116fb7f 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -237,7 +237,6 @@ if [ "$myhost" = "find-version" ]; then
+@@ -270,7 +270,6 @@ if [ "$myhost" = "find-version" ]; then
        rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
      else
        ingit=no
 -      beta=yes
        tmp="-unknown"
+       cid="0000000"
        rev="0000000"
-       rvd="0"
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index ea0252026a..e0b4f4b3fa 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c50d0a95fcf8f96c272fadd4ba85f3eeac39fcaf Mon Sep 17 00:00:00 2001
+From ee86692f437643b43c6330b77967ab29fc6087a1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -8,16 +8,15 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  common/homedir.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 6f99f3e..f22aa9e 100644
+index 3929108..d3a7b8f 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)
+@@ -1439,7 +1439,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +25,7 @@ index 6f99f3e..f22aa9e 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)
+@@ -1468,7 +1468,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +34,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1352,7 +1352,7 @@ gnupg_bindir (void)
+@@ -1504,7 +1504,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +43,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)
+@@ -1531,7 +1531,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +52,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1409,7 +1409,7 @@ gnupg_libdir (void)
+@@ -1561,7 +1561,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +61,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1440,7 +1440,7 @@ gnupg_datadir (void)
+@@ -1592,7 +1592,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +70,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1472,7 +1472,7 @@ gnupg_localedir (void)
+@@ -1624,7 +1624,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.5.bb b/meta/recipes-support/gnupg/gnupg_2.5.0.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.5.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.0.bb
index 99996968b1..7c6d7bdc1a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.0.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277"
+SRC_URI[sha256sum] = "2222c827d4e7087f15e7f72739d004abc1d05c6c5f0a5a12b24c6a6cc5d173fb"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.44.0


--===============1405000389405841129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-3e1031bac2f353d53f98cf8da68c3093d4a3ab15"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3e1031bac2f353d53f98cf8da68c3093d4a3ab15"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 151 Local 139 Mirrors 0 Missed 12 Current 308 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1080 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_recipe_qa)
NOTE: recipe gnupg-2.5.0-r0: task do_recipe_qa: Started
NOTE: recipe gnupg-2.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_recipe_qa unihash changed to f500abeb4693722133194272a8d5ed58c66722a46b511832ee2be1f55259c365
NOTE: Setscene tasks completed
NOTE: Running task 1279 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_fetch)
NOTE: recipe gnupg-2.5.0-r0: task do_fetch: Started
NOTE: recipe gnupg-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1280 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_unpack)
NOTE: Running task 1281 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.5.0-r0: task do_unpack: Started
NOTE: recipe gnupg-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnupg-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1282 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_patch)
NOTE: Running task 1283 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_collect_spdx_deps)
NOTE: recipe gnupg-2.5.0-r0: task do_patch: Started
NOTE: recipe gnupg-2.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnupg-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1284 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1285 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_populate_lic)
NOTE: recipe gnupg-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.5.0-r0: task do_populate_lic: Started
NOTE: recipe gnupg-2.5.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_populate_lic unihash changed to b3236c67cd7a90ab7b156e50dceb094f19c40be5933dc4ca1d7b573238e49bcd
NOTE: recipe gnupg-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_deploy_source_date_epoch unihash changed to 4d54cb3352fdb2a61779e36171f629765015a25f8e2bbc6804ffd01a5ee6e086
NOTE: Setscene tasks completed
NOTE: Running task 1286 of 1298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_configure)
NOTE: recipe gnupg-2.5.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', 
 '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.7.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autom
 ake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'libxcrypt', 'ncurses', 'readline', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'bzip2', 'cracklib', 'libidn2', 'libpam', 'texinfo-dummy-native', 'linux-libc-headers', 'gmp', 'gnutls', 'libtasn1', 'libassuan', 'libcap', 'libgcrypt', 'libgpg-error', 'libksba', 'libseccomp', 'libunistring', 'nettle', 'npth', 'gettext-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/gnupg-2.5.0/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/gnupg-2.5.0/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/gnupg-2.5.0/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/gnupg-2.5.0/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| autoreconf: 'build-aux/install-sh' is updated
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../gnupg-2.5.0/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking --disable-ldap 		--disable-ccid-driver 		--with-zlib=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot/usr/lib/.. 		--with-bzip2=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot/usr/lib/.. 		--with-readline=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot/usr/lib/.. 		--with-mailprog=/usr/sbin/sendma
 il 		--enable-gpg-is-gpg2 		--disable-tests                 --disable-static  --enable-gnutls  --disable-sqlite --enable-nls
| configure: WARNING: unrecognized options: --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| configure: autobuild project... gnupg
| configure: autobuild revision... 2.5.0-unknown
| configure: autobuild hostname... alma8-ty-1.yocto.io
| configure: autobuild timestamp... 20240801-172316
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot... none
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking for sys/socket.h... yes
| checking for vfork.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking whether SELinux support is requested... no
| checking whether to allocate extra secure memory... no
| checking calibrated passphrase-stretching (s2k) duration... 100 milliseconds
| checking whether to enable trust models... yes
| checking whether to enable TOFU... yes
| checking whether to enable libdns... yes
| checking whether to enable the RSA public key for gpg... yes
| checking whether to enable the ECDH public key for gpg... yes
| checking whether to enable the ECDSA public key for gpg... yes
| checking whether to enable the EdDSA public key for gpg... yes
| checking whether to enable the IDEA cipher for gpg... yes
| checking whether to enable the CAST5 cipher for gpg... yes
| checking whether to enable the BLOWFISH cipher for gpg... yes
| checking whether to enable the AES128 cipher for gpg... yes
| checking whether to enable the AES192 cipher for gpg... yes
| checking whether to enable the AES256 cipher for gpg... yes
| checking whether to enable the TWOFISH cipher for gpg... yes
| checking whether to enable the CAMELLIA128 cipher for gpg... yes
| checking whether to enable the CAMELLIA192 cipher for gpg... yes
| checking whether to enable the CAMELLIA256 cipher for gpg... yes
| checking whether to enable the MD5 hash for gpg... yes
| checking whether to enable the RIPE-MD160 hash for gpg... yes
| checking whether to enable the SHA-224 hash for gpg... yes
| checking whether to enable the SHA-384 hash for gpg... yes
| checking whether to enable the SHA-512 hash for gpg... yes
| checking whether to enable the ZIP and ZLIB compression algorithm... yes
| checking whether to enable the BZIP2 compression algorithm... yes
| checking whether to enable external program execution... yes
| checking whether to enable photo ID viewing... yes
| checking whether to use a fixed photo ID viewer... no
| checking for the size of the key and uid cache... 4096
| checking whether use of capabilities is requested... no
| checking whether smartcard support is requested... yes
| checking whether to enable the internal CCID driver... no
| checking whether to auto start dirmngr... yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| configure: checking for programs
| checking whether make sets $(MAKE)... (cached) yes
| checking whether build environment is sane... yes
| checking whether make supports nested variables... (cached) yes
| checking for gawk... (cached) gawk
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot... (cached) none
| checking how to run the C preprocessor... x86_64-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking whether ln -s works... yes
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for perl... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/perl
| checking for x86_64-poky-linux-windres... no
| checking for windres... no
| checking for yat2m... (cached) ./yat2m
| checking for library containing strerror... none required
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot option to enable large file support... none needed
| configure: awk with an option -n for hexadecimal
| checking for cc for build... gcc
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... configure: WARNING: using cross tools not prefixed with host triplet
| yes
| configure: checking for libraries
| checking for GPG_ERROR... no
| checking for gpgrt-config... no
| checking for LIBGCRYPT... yes
| checking LIBGCRYPT API version... okay
| checking for LIBASSUAN... no
| checking for KSBA... yes
| checking KSBA API version... okay
| checking for library containing dlopen... none required
| configure: WARNING:
| ***
| *** Building without SQLite support - TOFU and Keyboxd disabled
| ***
| ***
| ***
| checking for encfs... /usr/bin/encfs
| checking for fusermount... /usr/bin/fusermount
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/bin/pkg-config
| checking for NPTH - version >= 1.2... yes (1.7-unknown)
| configure: WARNING: GOT HERE - -lnpth
| checking for ntbtls-config... no
| checking for NTBTLS - version >= 0.2.0... no
| checking for LIBGNUTLS... yes
| configure: checking for networking options
| checking for gethostbyname... yes
| checking for setsockopt... yes
| checking for library containing res_query... none required
| checking for library containing dn_expand... none required
| checking for library containing res_9_dn_skipname... no
| checking for library containing dn_skipname... none required
| checking whether the resolver is usable... yes
| checking for a mail transport program... /usr/sbin/sendmail
| configure: WARNING:
| ***
| *** Building without LDAP support.
| *** No CRL access or X.509 certificate search available.
| ***
| checking for ld... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot  ) is GNU ld... yes
| checking for shared library run path origin... done
| checking 32-bit host C ABI... no
| checking for egrep -e... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for ELF binary format... yes
| checking for the common suffixes of directories in the library search path... lib,lib,lib64
| checking for iconv... yes
| checking for working iconv... (cached) yes
| checking whether iconv is compatible with its POSIX signature... yes
| configure: checking for gettext
| checking for a sed that does not truncate output... (cached) sed
| checking whether NLS is requested... yes
| checking for msgfmt... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/bin/msgfmt
| checking for gmsgfmt... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/bin/msgfmt
| checking for xgettext... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/bin/xgettext
| checking for msgmerge... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot-native/usr/bin/msgmerge
| checking for CFPreferencesCopyAppValue... no
| checking for CFLocaleCopyPreferredLanguages... no
| checking for GNU gettext in libc... yes
| checking whether to use NLS... yes
| checking where the gettext function comes from... libc
| checking for strchr... yes
| checking for nl_langinfo and CODESET... yes
| checking for LC_MESSAGES... yes
| configure: checking for header files
| checking for unistd.h... (cached) yes
| checking for langinfo.h... yes
| checking for termio.h... yes
| checking for locale.h... yes
| checking for pwd.h... yes
| checking for inttypes.h... (cached) yes
| checking for signal.h... yes
| checking for sys/select.h... yes
| checking for sys/time.h... yes
| checking for stdint.h... (cached) yes
| checking for signal.h... (cached) yes
| checking for termios.h... yes
| checking for ucred.h... no
| checking for sys/ucred.h... no
| checking for sys/sysmacros.h... yes
| checking for sys/mkdev.h... no
| configure: checking for system characteristics
| checking for an ANSI C-conforming const... yes
| checking for inline... inline
| checking for working volatile... yes
| checking for size_t... yes
| checking for mode_t... yes
| checking for sigdescr_np... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/recipe-sysroot options needed to detect all undeclared functions... none needed
| checking whether sys_siglist is declared... (cached) no
| checking for socklen_t... yes
| checking for library containing inet_addr... none required
| checking endianness... little
| checking for byte... no
| checking for ushort... yes
| checking for ulong... yes
| checking for u16... no
| checking for u32... no
| checking size of unsigned short... (cached) 2
| checking size of unsigned int... (cached) 4
| checking size of unsigned long... (cached) 8
| checking size of unsigned long long... 8
| checking size of size_t... (cached) 8
| checking size of time_t... 8
| checking whether time_t is unsigned... no
| checking for SOCKET... no
| configure: checking for library functions
| checking whether getpagesize is declared... yes
| checking for declarations of fseeko and ftello... yes
| checking for vprintf... yes
| checking for fork... yes
| checking for vfork... yes
| checking for pid_t... yes
| checking for working fork... cross
| checking for working vfork... (cached) yes
| checking for atexit... configure: WARNING: result yes guessed because of cross compilation
| yes
| checking for canonicalize_file_name... yes
| checking for clock_gettime... yes
| checking for ctermid... yes
| checking for explicit_bzero... yes
| checking for fcntl... yes
| checking for flockfile... yes
| checking for fsync... yes
| checking for ftello... yes
| checking for ftruncate... yes
| checking for funlockfile... yes
| checking for getaddrinfo... (cached) yes
| checking for getenv... yes
| checking for getpagesize... (cached) yes
| checking for getpwnam... yes
| checking for getpwuid... yes
| checking for getrlimit... yes
| checking for getrusage... yes
| checking for gettimeofday... yes
| checking for gmtime_r... yes
| checking for inet_ntop... yes
| checking for inet_pton... yes
| checking for isascii... yes
| checking for lstat... yes
| checking for memicmp... no
| checking for memmove... yes
| checking for memrchr... yes
| checking for mmap... yes
| checking for nl_langinfo... yes
| checking for pipe... yes
| checking for raise... yes
| checking for rand... yes
| checking for setenv... yes
| checking for setlocale... yes
| checking for setrlimit... yes
| checking for sigaction... yes
| checking for sigprocmask... yes
| checking for stat... yes
| checking for stpcpy... yes
| checking for strcasecmp... yes
| checking for strerror... (cached) yes
| checking for strftime... yes
| checking for stricmp... no
| checking for strlwr... no
| checking for strncasecmp... yes
| checking for strpbrk... yes
| checking for strsep... yes
| checking for strtol... yes
| checking for strtoul... yes
| checking for strtoull... yes
| checking for tcgetattr... yes
| checking for timegm... yes
| checking for times... yes
| checking for ttyname... yes
| checking for unsetenv... yes
| checking for wait4... yes
| checking for waitpid... yes
| checking for library containing nanosleep... none required
| checking for inotify_init... yes
| checking for struct sigaction... yes
| checking for sigset_t... yes
| checking for struct ucred.pid... yes
| checking for struct ucred.cr_pid... no
| checking for struct sockpeercred.pid... no
| checking for getpeerucred... no
| checking for zlib.h... yes
| checking for deflateInit2_ in -lz... yes
| checking for bzlib.h... yes
| checking for BZ2_bzCompressInit in -lbz2... yes
| checking whether readline via "-lreadline" is present and sane... yes
| checking for library containing TSS_Create... no
| checking for library containing Esys_Initialize... no
| configure: checking for cc features
| checking if gcc ignores unknown -Wno-* options... yes
| checking if gcc supports -Wpointer-arith... yes
| checking whether to enable log_clock... no
| checking whether "make check" shall run all tests... no
| checking whether tests should be run... no
| configure:
| ***
| *** You need libgpg-error to build this program.
| **  This library is for example available at
| ***   https://gnupg.org/ftp/gcrypt/gpgrt
| *** (at least version 1.50 is required.)
| ***
| configure:
| ***
| *** You need libassuan to build this program.
| *** This library is for example available at
| ***   https://gnupg.org/ftp/gcrypt/libassuan/
| *** (at least version 3.0.0 (API 3) is required).
| ***
| configure: error:
| ***
| *** Required libraries not found. Please consult the above messages
| *** and install them before running configure again.
| ***
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.989400:291 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.989400, line 291
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.989400, line 267
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.989400, line 237
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.989400, line 157
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.989400, line 295
NOTE: recipe gnupg-2.5.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1286 tasks of which 1277 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801172240.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801172240.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gnupg-2.5.0-r0 do_configure: configure failed
ERROR: gnupg-2.5.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.989400', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/log.do_configure.989400
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_configure) failed with exit code '1'

--===============1405000389405841129==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.4.5-2.5.0.patch"

RnJvbSBmZjA2ZjM2NTI5OTNlNzFhOWFjYTY4YTVhMzliNDY2MGUyMGFkYmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNzoyMzo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
dXBnOiB1cGdyYWRlIDIuNC41IC0+IDIuNS4wCgotLS0KIC4uLmVycmlkZS1pbml0LWlzLW5vdC1u
ZWVkZWQtd2l0aC1nY2MtOS5wYXRjaCB8ICA3ICsrLS0tLS0KIC4uLi1hLWN1c3RvbS12YWx1ZS1m
b3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaCB8ICA3ICsrKy0tLS0KIC4uLnVzZS1wa2djb25maWct
aW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaCB8ICAzICstLQogLi4uaC1maXgtZmluZC12ZXJz
aW9uLWZvci1iZXRhLWNoZWNraW5nLnBhdGNoIHwgIDkgKysrKy0tLS0tCiAuLi4vZ251cGcvZ251
cGcvcmVsb2NhdGUucGF0Y2ggICAgICAgICAgICAgICAgfCAxOSArKysrKysrKystLS0tLS0tLS0t
CiAuLi4vZ251cGcve2dudXBnXzIuNC41LmJiID0+IGdudXBnXzIuNS4wLmJifSAgfCAgMiArLQog
NiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy97Z251cGdfMi40LjUuYmIgPT4gZ251cGdfMi41
LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251
cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5v
dC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaAppbmRleCA4MzE5NWI1YmQ0Li40MmRjYjI1ZjZhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlk
ZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0
aC1nY2MtOS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTNhZGM4MTZkMmQ1NmRkOTI5MDE2
MDczOTM3YmEyNGUwMWUwM2NiOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODY5ZGVm
NWFiYWIzZmIzOWEwMzA5YTE0M2IxNjdhYjVhZmE0OGE3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIwIERl
YyAyMDE4IDE3OjM3OjQ4IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFdvdmVycmlkZS1pbml0IGlz
IG5vdCBuZWVkZWQgd2l0aCBnY2MgOQpAQCAtMTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZGlybW5nci9kbnMuaCBiL2Rpcm1u
Z3IvZG5zLmgKLWluZGV4IDAyNGQ2ZGNjOC4uYzZlMTQxZTE2IDEwMDY0NAoraW5kZXggMWY2NDdl
MS4uMzM0YWNiNiAxMDA2NDQKIC0tLSBhL2Rpcm1uZ3IvZG5zLmgKICsrKyBiL2Rpcm1uZ3IvZG5z
LmgKIEBAIC0xMzksNyArMTM5LDcgQEAgRE5TX1BVQkxJQyBpbnQgKmRuc19kZWJ1Z19wKHZvaWQp
OwpAQCAtMjksNiArMjksMyBAQCBpbmRleCAwMjRkNmRjYzguLmM2ZTE0MWUxNiAxMDA2NDQKICAj
ZGVmaW5lIEROU19QUkFHTUFfUFVTSCBfUHJhZ21hKCJHQ0MgZGlhZ25vc3RpYyBwdXNoIikKICAj
ZGVmaW5lIEROU19QUkFHTUFfUVVJRVQgX1ByYWdtYSgiR0NDIGRpYWdub3N0aWMgaWdub3JlZCBc
Ii1Xb3ZlcnJpZGUtaW5pdFwiIikKICAjZGVmaW5lIEROU19QUkFHTUFfUE9QIF9QcmFnbWEoIkdD
QyBkaWFnbm9zdGljIHBvcCIpCi0tLSAKLTIuMTcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFs
dWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVw
Zy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2Nh
dGlvbi1vZi0ucGF0Y2gKaW5kZXggZjk1N2Y2YjU1ZS4uYzJkZjFjOTZjYiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEt
Y3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1
ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmI1ODFj
NDNiZDAxZjgxNWRiNzhhNDEwZmQzODE0ZmM1OTk0MTcxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZTRjMjVkMTFhNmJmNTk5ZjQ3ZDRkMmQyNTM0MzRmYzA3Y2I3NmE4ZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogTW9uLCAyMiBKYW4gMjAxOCAxODowMDoyMSArMDIwMAogU3ViamVj
dDogW1BBVENIXSBjb25maWd1cmUuYWM6IHVzZSBhIGN1c3RvbSB2YWx1ZSBmb3IgdGhlIGxvY2F0
aW9uIG9mCkBAIC04LDE2ICs4LDE1IEBAIFRoaXMgc2hvdWxkIGF2b2lkIGNsYXNoZXMgd2l0aCB0
aGUgaG9zdCBncGctYWdlbnQgb2JzZXJ2ZWQgb24gYXV0b2J1aWxkZXJzLgogCiBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWMsIGFuZCBvbmx5IGZvciAtbmF0
aXZlXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+Ci0KIC0tLQogIGNvbmZpZ3VyZS5hYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBi
L2NvbmZpZ3VyZS5hYwotaW5kZXggMjZkN2Y3Yi4uZTk1M2MyZSAxMDA2NDQKK2luZGV4IGU0Zjhj
MGUuLmZhNzVlYzggMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5h
YwotQEAgLTE5MjEsNyArMTkyMSw3IEBAIEFDX0RFRklORV9VTlFVT1RFRChHUEdDT05GX0RJU1Bf
TkFNRSwgIkdQR0NvbmYiLAorQEAgLTE5MjUsNyArMTkyNSw3IEBAIEFDX0RFRklORV9VTlFVT1RF
RChHUEdDT05GX0RJU1BfTkFNRSwgIkdQR0NvbmYiLAogIAogIEFDX0RFRklORV9VTlFVT1RFRChH
UEdUQVJfTkFNRSwgImdwZ3RhciIsIFtUaGUgbmFtZSBvZiB0aGUgZ3BndGFyIHRvb2xdKQogIApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtn
Y29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnVwZy9nbnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5w
YXRjaAppbmRleCAwZTU4ZmQ0YzRkLi42MmIxMTg1MjRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRo
LWNvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAy
LXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZDkwNDg3ODhkOTA2Nzc0YjE0NzVjM2JiMWIxN2UyMjQ1NWMyYWRkNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTg1ZmFiZjgzMDU4NDFlOGZmZDdhYTFlZDk1MjY1Zjg4
ZjkzMzFkNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFNhdWwgV29sZCA8c2d3QGxp
bnV4LmludGVsLmNvbT4KIERhdGU6IFdlZCwgMTYgQXVnIDIwMTcgMTE6MTY6MzAgKzA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gdXNlIHBrZ2NvbmZpZyBpbnN0ZWFkIG9mIG5wdGggY29uZmlnCkBAIC05
LDcgKzksNiBAQCBTaWduZWQtb2ZmLWJ5OiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5jb20+
CiAKIFJlYmFzZSB0byAyLjEuMjMKIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5q
aWFAd2luZHJpdmVyLmNvbT4KLQogLS0tCiAgbTQvbnB0aC5tNCB8IDUzICsrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1m
b3ItYmV0YS1jaGVja2luZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
LzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1iZXRhLWNoZWNraW5nLnBhdGNo
CmluZGV4IGQ2NjRjMzZhMWIuLjVhMGU3YmZjZjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dudXBnL2dudXBnLzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1i
ZXRhLWNoZWNraW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
LzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1iZXRhLWNoZWNraW5nLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2YTdmOWI3MWQ5MzY4NDdkY2FlZWFjN2QxYjY5ZDgyOTli
ZTRkZDg1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiNGMyNzE3Nzc1NjRjYzdkMGFh
YzQyNWEzMmRiNGY5YTljN2RjNzJiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogV2Vu
em9uZyBGYW4gPHdlbnpvbmcuZmFuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDE2IEF1ZyAy
MDE3IDExOjIzOjIyICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF1dG9nZW4uc2g6IGZpeCBmaW5k
LXZlcnNpb24gZm9yIGJldGEgY2hlY2tpbmcKQEAgLTEzLDIwICsxMywxOSBAQCBTaWduZWQtb2Zm
LWJ5OiBXZW56b25nIEZhbiA8d2Vuem9uZy5mYW5Ad2luZHJpdmVyLmNvbT4KIAogUmViYXNlIHRv
IDIuMS4yMwogU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIu
Y29tPgotCiAtLS0KICBhdXRvZ2VuLnNoIHwgMSAtCiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKIAogZGlmZiAtLWdpdCBhL2F1dG9nZW4uc2ggYi9hdXRvZ2VuLnNoCi1pbmRleCAwYWJm
MTAzLi43ODc1M2I1IDEwMDc1NQoraW5kZXggOWY5MTI5Ny4uMTE2ZmI3ZiAxMDA3NTUKIC0tLSBh
L2F1dG9nZW4uc2gKICsrKyBiL2F1dG9nZW4uc2gKLUBAIC0yMzcsNyArMjM3LDYgQEAgaWYgWyAi
JG15aG9zdCIgPSAiZmluZC12ZXJzaW9uIiBdOyB0aGVuCitAQCAtMjcwLDcgKzI3MCw2IEBAIGlm
IFsgIiRteWhvc3QiID0gImZpbmQtdmVyc2lvbiIgXTsgdGhlbgogICAgICAgIHJ2ZD0kKCgweCQo
ZWNobyAke3Jldn0gfCBkZCBicz0xIGNvdW50PTQgMj4vZGV2L251bGwpKSkKICAgICAgZWxzZQog
ICAgICAgIGluZ2l0PW5vCiAtICAgICAgYmV0YT15ZXMKICAgICAgICB0bXA9Ii11bmtub3duIgor
ICAgICAgIGNpZD0iMDAwMDAwMCIKICAgICAgICByZXY9IjAwMDAwMDAiCi0gICAgICAgcnZkPSIw
IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaApp
bmRleCBlYTAyNTIwMjZhLi5lMGI0ZjRiM2ZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzUwZDBh
OTVmY2Y4Zjk2YzI3MmZhZGQ0YmE4NWYzZWVhYzM5ZmNhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZWU4NjY5MmY0Mzc2NDNiNDNjNjMzMGI3Nzk2N2FiMjlmYzYwODdhMSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5j
b20+CiBEYXRlOiBXZWQsIDE5IFNlcCAyMDE4IDE0OjQ0OjQwICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIEFsbG93IHRoZSBlbnZpcm9ubWVudCB0byBvdmVycmlkZSB3aGVyZSBnbnVwZyBsb29rcyBm
b3IgaXRzCkBAIC04LDE2ICs4LDE1IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBb
T0Utc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50
ZWwuY29tPgogCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJv
bml4LmRlPgotCiAtLS0KICBjb21tb24vaG9tZWRpci5jIHwgMTQgKysrKysrKy0tLS0tLS0KICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvY29tbW9uL2hvbWVkaXIuYyBiL2NvbW1vbi9ob21lZGlyLmMKLWluZGV4IDZmOTlmM2Uu
LmYyMmFhOWUgMTAwNjQ0CitpbmRleCAzOTI5MTA4Li5kM2E3YjhmIDEwMDY0NAogLS0tIGEvY29t
bW9uL2hvbWVkaXIuYwogKysrIGIvY29tbW9uL2hvbWVkaXIuYwotQEAgLTEyODQsNyArMTI4NCw3
IEBAIGdudXBnX3NvY2tldGRpciAodm9pZCkKK0BAIC0xNDM5LDcgKzE0MzksNyBAQCBnbnVwZ19z
b2NrZXRkaXIgKHZvaWQpCiAgICBpZiAoIW5hbWUpCiAgICAgIHsKICAgICAgICB1bnNpZ25lZCBp
bnQgZHVtbXk7CkBAIC0yNiw3ICsyNSw3IEBAIGluZGV4IDZmOTlmM2UuLmYyMmFhOWUgMTAwNjQ0
CiAgICAgICAgZ3BncnRfYW5ub3RhdGVfbGVha2VkX29iamVjdCAobmFtZSk7CiAgICAgIH0KICAK
LUBAIC0xMzE2LDcgKzEzMTYsNyBAQCBnbnVwZ19zeXNjb25mZGlyICh2b2lkKQorQEAgLTE0Njgs
NyArMTQ2OCw3IEBAIGdudXBnX3N5c2NvbmZkaXIgKHZvaWQpCiAgICBpZiAoZGlyKQogICAgICBy
ZXR1cm4gZGlyOwogICAgZWxzZQpAQCAtMzUsNyArMzQsNyBAQCBpbmRleCA2Zjk5ZjNlLi5mMjJh
YTllIDEwMDY0NAogICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xMzUy
LDcgKzEzNTIsNyBAQCBnbnVwZ19iaW5kaXIgKHZvaWQpCitAQCAtMTUwNCw3ICsxNTA0LDcgQEAg
Z251cGdfYmluZGlyICh2b2lkKQogICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBlbHNl
CkBAIC00NCw3ICs0Myw3IEBAIGluZGV4IDZmOTlmM2UuLmYyMmFhOWUgMTAwNjQ0CiAgI2VuZGlm
IC8qIUhBVkVfVzMyX1NZU1RFTSovCiAgfQogIAotQEAgLTEzNzksNyArMTM3OSw3IEBAIGdudXBn
X2xpYmV4ZWNkaXIgKHZvaWQpCitAQCAtMTUzMSw3ICsxNTMxLDcgQEAgZ251cGdfbGliZXhlY2Rp
ciAodm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxzZQpAQCAtNTMsNyAr
NTIsNyBAQCBpbmRleCA2Zjk5ZjNlLi5mMjJhYTllIDEwMDY0NAogICNlbmRpZiAvKiFIQVZFX1cz
Ml9TWVNURU0qLwogIH0KICAKLUBAIC0xNDA5LDcgKzE0MDksNyBAQCBnbnVwZ19saWJkaXIgKHZv
aWQpCitAQCAtMTU2MSw3ICsxNTYxLDcgQEAgZ251cGdfbGliZGlyICh2b2lkKQogICAgICAgIHJl
dHVybiBuYW1lOwogICAgICB9CiAgICBlbHNlCkBAIC02Miw3ICs2MSw3IEBAIGluZGV4IDZmOTlm
M2UuLmYyMmFhOWUgMTAwNjQ0CiAgI2VuZGlmIC8qIUhBVkVfVzMyX1NZU1RFTSovCiAgfQogIAot
QEAgLTE0NDAsNyArMTQ0MCw3IEBAIGdudXBnX2RhdGFkaXIgKHZvaWQpCitAQCAtMTU5Miw3ICsx
NTkyLDcgQEAgZ251cGdfZGF0YWRpciAodm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsKICAgICAg
fQogICAgZWxzZQpAQCAtNzEsNyArNzAsNyBAQCBpbmRleCA2Zjk5ZjNlLi5mMjJhYTllIDEwMDY0
NAogICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xNDcyLDcgKzE0NzIs
NyBAQCBnbnVwZ19sb2NhbGVkaXIgKHZvaWQpCitAQCAtMTYyNCw3ICsxNjI0LDcgQEAgZ251cGdf
bG9jYWxlZGlyICh2b2lkKQogICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBlbHNlCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQuNS5iYiBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC41LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMC5iYgppbmRl
eCA5OTk5Njk2OGIxLi43YzZkN2JkYzFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnVwZy9nbnVwZ18yLjQuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9n
bnVwZ18yLjUuMC5iYgpAQCAtMjMsNyArMjMsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRp
dmUgPSAiIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8vcmVsb2NhdGUucGF0Y2giCiBT
UkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY2OGY3ZDc1ZDA2Y2IxNjM1YzMzNmQzNGQ4NDRhZjk3
NDM2YzNmNjRlYTE0YmNiN2M4Njk3ODJmOTZmNDQyNzciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MjIyMmM4MjdkNGU3MDg3ZjE1ZTdmNzI3MzlkMDA0YWJjMWQwNWM2YzVmMGE1YTEyYjI0YzZhNmNj
NWQxNzNmYiIKIAogRVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS1sZGFwIFwKIAkJLS1kaXNhYmxl
LWNjaWQtZHJpdmVyIFwKLS0gCjIuNDQuMAoK

--===============1405000389405841129==--

