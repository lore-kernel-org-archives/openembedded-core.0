Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931B5C3DA66
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1384.1721071149265518613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MNd2tgW4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=HSckbncR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010190b7d59e4b-43d72d72-2e18-4b25-b1b5-44d2d2be7111-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RNi1hEeFYIdWLB4F7Fyvaue3B4MZmBgqEHDDeNXigC4=;
	b=MNd2tgW4TaBvM8AvI/6fbOoys8IWD48okM7+09JHJb0e9VHx8kdpnNFp/5nG5rV6
	aK5iWG9+/oapnV85Y7BwcpWL/ZgRqmqz5QEhNxwgJB/vyLLFvbZ04iDA+fO4it12oTZ
	oRKy5Zn/tASxJemIgwMAarYLcilJsHWSdEnSHrME=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RNi1hEeFYIdWLB4F7Fyvaue3B4MZmBgqEHDDeNXigC4=;
	b=HSckbncRIvmJY3L/588DZe0Vk4oofiwWgMmm3TXH9ZiRjqxvPLvB1Fu3mSvNR/21
	+6rv5O15QEGjoqwRSNkTBTe6XJzTjgiVG7eip6zmcMz1pfcIirZGJl0I3E+f8lK0umF
	k80b1UDv5rhLoeHiWBpx9y6noid45O/6BZXL57Rk=
Content-Type: multipart/mixed; boundary="===============4726469362725199819=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.0 FAILED
Message-ID: <01010190b7d59e4b-43d72d72-2e18-4b25-b1b5-44d2d2be7111-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202057

--===============4726469362725199819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.5.0* has Failed(do_compile).

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
From 5ec4c222cf724fd5833c65ec934184edd1f63277 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 18:24:24 +0000
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
index 83195b5bd4..9041159c81 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
+From df1996cfbd3fced995ae9bb9ed803724fc576a4f Mon Sep 17 00:00:00 2001
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
index f957f6b55e..e397f8a4e5 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 6b581c43bd01f815db78a410fd3814fc5994171e Mon Sep 17 00:00:00 2001
+From 4b3afb34cc9bda0fe24814e3613dfc289d5b130b Mon Sep 17 00:00:00 2001
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
index 0e58fd4c4d..905ef260cb 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d9048788d906774b1475c3bb1b17e22455c2add4 Mon Sep 17 00:00:00 2001
+From 9a192093cd4c625e52bd064121623078c7ab11fb Mon Sep 17 00:00:00 2001
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
index d664c36a1b..a401fb95b0 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 6a7f9b71d936847dcaeeac7d1b69d8299be4dd85 Mon Sep 17 00:00:00 2001
+From 6d104b8962c24a758acf56cc8a8e4fe2567f7c7b Mon Sep 17 00:00:00 2001
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
index ea0252026a..63e7ff741d 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c50d0a95fcf8f96c272fadd4ba85f3eeac39fcaf Mon Sep 17 00:00:00 2001
+From 0718e9c698a23d52b5d23380afffcde43425d665 Mon Sep 17 00:00:00 2001
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


--===============4726469362725199819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-0e13e689a423d8b67fb871cbffe2a975749a5c4d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0e13e689a423d8b67fb871cbffe2a975749a5c4d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 163 Local 151 Mirrors 0 Missed 12 Current 295 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 305 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 306 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 317 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 318 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 321 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.7.bb:do_create_spdx_setscene)
NOTE: Running task 643 of 1297 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_recipe_qa)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-2.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe npth-1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libksba-1.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnupg-2.5.0-r0: task do_recipe_qa: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libksba-1.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe npth-1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libassuan-2.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 421 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnupg-2.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 919 of 1297 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe gnupg-2.5.0-r0: task do_fetch: Started
NOTE: recipe gnupg-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 928 of 1297 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_unpack)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnupg-2.5.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 438 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 445 of 458 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 458 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: Running task 1155 of 1297 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnupg-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnupg-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnupg-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1281 of 1297 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_patch)
NOTE: Running task 1282 of 1297 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_collect_spdx_deps)
NOTE: recipe gnupg-2.5.0-r0: task do_patch: Started
NOTE: recipe gnupg-2.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnupg-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1283 of 1297 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1284 of 1297 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_populate_lic)
NOTE: recipe gnupg-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.5.0-r0: task do_populate_lic: Started
NOTE: recipe gnupg-2.5.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gnupg-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1285 of 1297 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_configure)
NOTE: recipe gnupg-2.5.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', 
 '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.7.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autom
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
| configure: autobuild timestamp... 20240715-182408
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
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| configure: checking for libraries
| checking for GPG_ERROR... no
| checking for LIBGCRYPT... no
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
| configure: WARNING:
| ***
| *** Building without LDAP support.
| *** No CRL access or X.509 certificate search available.
| ***
| checking for a mail transport program... /usr/sbin/sendmail
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
| configure: WARNING: result yes guessed because of cross compilation
| checking for working vfork... (cached) yes
| checking for atexit... yes
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
| *** You need libgcrypt to build this program.
| **  This library is for example available at
| ***   https://gnupg.org/ftp/gcrypt/libgcrypt/
| *** (at least version 1.11.0 (API 1) is required.)
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.2559257:291 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.2559257, line 291
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.2559257, line 267
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.2559257, line 237
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.2559257, line 157
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.2559257, line 295
NOTE: recipe gnupg-2.5.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1285 tasks of which 1276 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715182356.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715182356.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gnupg-2.5.0-r0 do_configure: configure failed
ERROR: gnupg-2.5.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/run.do_configure.2559257', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.0/temp/log.do_configure.2559257
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.0.bb:do_configure) failed with exit code '1'

--===============4726469362725199819==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.4.5-2.5.0.patch"

RnJvbSA1ZWM0YzIyMmNmNzI0ZmQ1ODMzYzY1ZWM5MzQxODRlZGQxZjYzMjc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTg6MjQ6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnVwZzogdXBncmFkZSAyLjQuNSAtPiAyLjUuMAoKLS0tCiAuLi5lcnJpZGUtaW5pdC1pcy1ub3Qt
bmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2ggfCAgNyArKy0tLS0tCiAuLi4tYS1jdXN0b20tdmFsdWUt
Zm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggfCAgNyArKystLS0tCiAuLi51c2UtcGtnY29uZmln
LWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2ggfCAgMyArLS0KIC4uLmgtZml4LWZpbmQtdmVy
c2lvbi1mb3ItYmV0YS1jaGVja2luZy5wYXRjaCB8ICA5ICsrKystLS0tLQogLi4uL2dudXBnL2du
dXBnL3JlbG9jYXRlLnBhdGNoICAgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrLS0tLS0tLS0t
LQogLi4uL2dudXBnL3tnbnVwZ18yLjQuNS5iYiA9PiBnbnVwZ18yLjUuMC5iYn0gIHwgIDIgKy0K
IDYgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcve2dudXBnXzIuNC41LmJiID0+IGdudXBnXzIu
NS4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2du
dXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1u
b3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKaW5kZXggODMxOTViNWJkNC4uOTA0MTE1OWM4MSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJp
ZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdp
dGgtZ2NjLTkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUzYWRjODE2ZDJkNTZkZDkyOTAx
NjA3MzkzN2JhMjRlMDFlMDNjYjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRmMTk5
NmNmYmQzZmNlZDk5NWFlOWJiOWVkODAzNzI0ZmM1NzZhNGYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMCBE
ZWMgMjAxOCAxNzozNzo0OCAtMDgwMAogU3ViamVjdDogW1BBVENIXSBXb3ZlcnJpZGUtaW5pdCBp
cyBub3QgbmVlZGVkIHdpdGggZ2NjIDkKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2Rpcm1uZ3IvZG5zLmggYi9kaXJt
bmdyL2Rucy5oCi1pbmRleCAwMjRkNmRjYzguLmM2ZTE0MWUxNiAxMDA2NDQKK2luZGV4IDFmNjQ3
ZTEuLjMzNGFjYjYgMTAwNjQ0CiAtLS0gYS9kaXJtbmdyL2Rucy5oCiArKysgYi9kaXJtbmdyL2Ru
cy5oCiBAQCAtMTM5LDcgKzEzOSw3IEBAIEROU19QVUJMSUMgaW50ICpkbnNfZGVidWdfcCh2b2lk
KTsKQEAgLTI5LDYgKzI5LDMgQEAgaW5kZXggMDI0ZDZkY2M4Li5jNmUxNDFlMTYgMTAwNjQ0CiAg
I2RlZmluZSBETlNfUFJBR01BX1BVU0ggX1ByYWdtYSgiR0NDIGRpYWdub3N0aWMgcHVzaCIpCiAg
I2RlZmluZSBETlNfUFJBR01BX1FVSUVUIF9QcmFnbWEoIkdDQyBkaWFnbm9zdGljIGlnbm9yZWQg
XCItV292ZXJyaWRlLWluaXRcIiIpCiAgI2RlZmluZSBETlNfUFJBR01BX1BPUCBfUHJhZ21hKCJH
Q0MgZGlhZ25vc3RpYyBwb3AiKQotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZh
bHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9j
YXRpb24tb2YtLnBhdGNoCmluZGV4IGY5NTdmNmI1NWUuLmUzOTdmOGE0ZTUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1h
LWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFs
dWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZiNTgx
YzQzYmQwMWY4MTVkYjc4YTQxMGZkMzgxNGZjNTk5NDE3MWUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDRiM2FmYjM0Y2M5YmRhMGZlMjQ4MTRlMzYxM2RmYzI4OWQ1YjEzMGIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjIgSmFuIDIwMTggMTg6MDA6MjEgKzAyMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gY29uZmlndXJlLmFjOiB1c2UgYSBjdXN0b20gdmFsdWUgZm9yIHRoZSBsb2Nh
dGlvbiBvZgpAQCAtOCwxNiArOCwxNSBAQCBUaGlzIHNob3VsZCBhdm9pZCBjbGFzaGVzIHdpdGgg
dGhlIGhvc3QgZ3BnLWFnZW50IG9ic2VydmVkIG9uIGF1dG9idWlsZGVycy4KIAogVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljLCBhbmQgb25seSBmb3IgLW5h
dGl2ZV0KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgotCiAtLS0KICBjb25maWd1cmUuYWMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMg
Yi9jb25maWd1cmUuYWMKLWluZGV4IDI2ZDdmN2IuLmU5NTNjMmUgMTAwNjQ0CitpbmRleCBlNGY4
YzBlLi5mYTc1ZWM4IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUu
YWMKLUBAIC0xOTIxLDcgKzE5MjEsNyBAQCBBQ19ERUZJTkVfVU5RVU9URUQoR1BHQ09ORl9ESVNQ
X05BTUUsICJHUEdDb25mIiwKK0BAIC0xOTI1LDcgKzE5MjUsNyBAQCBBQ19ERUZJTkVfVU5RVU9U
RUQoR1BHQ09ORl9ESVNQX05BTUUsICJHUEdDb25mIiwKICAKICBBQ19ERUZJTkVfVU5RVU9URUQo
R1BHVEFSX05BTUUsICJncGd0YXIiLCBbVGhlIG5hbWUgb2YgdGhlIGdwZ3RhciB0b29sXSkKICAK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBr
Z2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcu
cGF0Y2gKaW5kZXggMGU1OGZkNGM0ZC4uOTA1ZWYyNjBjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0
aC1jb25maWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAw
Mi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGQ5MDQ4Nzg4ZDkwNjc3NGIxNDc1YzNiYjFiMTdlMjI0NTVjMmFkZDQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlhMTkyMDkzY2Q0YzYyNWU1MmJkMDY0MTIxNjIzMDc4
YzdhYjExZmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTYXVsIFdvbGQgPHNnd0Bs
aW51eC5pbnRlbC5jb20+CiBEYXRlOiBXZWQsIDE2IEF1ZyAyMDE3IDExOjE2OjMwICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHVzZSBwa2djb25maWcgaW5zdGVhZCBvZiBucHRoIGNvbmZpZwpAQCAt
OSw3ICs5LDYgQEAgU2lnbmVkLW9mZi1ieTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29t
PgogCiBSZWJhc2UgdG8gMi4xLjIzCiBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+Ci0KIC0tLQogIG00L25wdGgubTQgfCA1MyArKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwNC1hdXRvZ2VuLnNoLWZpeC1maW5kLXZlcnNpb24t
Zm9yLWJldGEtY2hlY2tpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVw
Zy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1jaGVja2luZy5wYXRj
aAppbmRleCBkNjY0YzM2YTFiLi5hNDAxZmI5NWIwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3It
YmV0YS1jaGVja2luZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVw
Zy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1jaGVja2luZy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmE3ZjliNzFkOTM2ODQ3ZGNhZWVhYzdkMWI2OWQ4Mjk5
YmU0ZGQ4NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNmQxMDRiODk2MmMyNGE3NThh
Y2Y1NmNjOGE4ZTRmZTI1NjdmN2M3YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFdl
bnpvbmcgRmFuIDx3ZW56b25nLmZhbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxNiBBdWcg
MjAxNyAxMToyMzoyMiArMDgwMAogU3ViamVjdDogW1BBVENIXSBhdXRvZ2VuLnNoOiBmaXggZmlu
ZC12ZXJzaW9uIGZvciBiZXRhIGNoZWNraW5nCkBAIC0xMywyMCArMTMsMTkgQEAgU2lnbmVkLW9m
Zi1ieTogV2Vuem9uZyBGYW4gPHdlbnpvbmcuZmFuQHdpbmRyaXZlci5jb20+CiAKIFJlYmFzZSB0
byAyLjEuMjMKIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVy
LmNvbT4KLQogLS0tCiAgYXV0b2dlbi5zaCB8IDEgLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9hdXRvZ2VuLnNoIGIvYXV0b2dlbi5zaAotaW5kZXggMGFi
ZjEwMy4uNzg3NTNiNSAxMDA3NTUKK2luZGV4IDlmOTEyOTcuLjExNmZiN2YgMTAwNzU1CiAtLS0g
YS9hdXRvZ2VuLnNoCiArKysgYi9hdXRvZ2VuLnNoCi1AQCAtMjM3LDcgKzIzNyw2IEBAIGlmIFsg
IiRteWhvc3QiID0gImZpbmQtdmVyc2lvbiIgXTsgdGhlbgorQEAgLTI3MCw3ICsyNzAsNiBAQCBp
ZiBbICIkbXlob3N0IiA9ICJmaW5kLXZlcnNpb24iIF07IHRoZW4KICAgICAgICBydmQ9JCgoMHgk
KGVjaG8gJHtyZXZ9IHwgZGQgYnM9MSBjb3VudD00IDI+L2Rldi9udWxsKSkpCiAgICAgIGVsc2UK
ICAgICAgICBpbmdpdD1ubwogLSAgICAgIGJldGE9eWVzCiAgICAgICAgdG1wPSItdW5rbm93biIK
KyAgICAgICBjaWQ9IjAwMDAwMDAiCiAgICAgICAgcmV2PSIwMDAwMDAwIgotICAgICAgIHJ2ZD0i
MCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRl
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gK
aW5kZXggZWEwMjUyMDI2YS4uNjNlN2ZmNzQxZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM1MGQw
YTk1ZmNmOGY5NmMyNzJmYWRkNGJhODVmM2VlYWMzOWZjYWYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDA3MThlOWM2OThhMjNkNTJiNWQyMzM4MGFmZmZjZGU0MzQyNWQ2NjUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwu
Y29tPgogRGF0ZTogV2VkLCAxOSBTZXAgMjAxOCAxNDo0NDo0MCArMDEwMAogU3ViamVjdDogW1BB
VENIXSBBbGxvdyB0aGUgZW52aXJvbm1lbnQgdG8gb3ZlcnJpZGUgd2hlcmUgZ251cGcgbG9va3Mg
Zm9yIGl0cwpAQCAtOCwxNiArOCwxNSBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUg
W09FLXNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGlu
dGVsLmNvbT4KIAogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4KLQogLS0tCiAgY29tbW9uL2hvbWVkaXIuYyB8IDE0ICsrKysrKystLS0tLS0tCiAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL2NvbW1vbi9ob21lZGlyLmMgYi9jb21tb24vaG9tZWRpci5jCi1pbmRleCA2Zjk5ZjNl
Li5mMjJhYTllIDEwMDY0NAoraW5kZXggMzkyOTEwOC4uZDNhN2I4ZiAxMDA2NDQKIC0tLSBhL2Nv
bW1vbi9ob21lZGlyLmMKICsrKyBiL2NvbW1vbi9ob21lZGlyLmMKLUBAIC0xMjg0LDcgKzEyODQs
NyBAQCBnbnVwZ19zb2NrZXRkaXIgKHZvaWQpCitAQCAtMTQzOSw3ICsxNDM5LDcgQEAgZ251cGdf
c29ja2V0ZGlyICh2b2lkKQogICAgaWYgKCFuYW1lKQogICAgICB7CiAgICAgICAgdW5zaWduZWQg
aW50IGR1bW15OwpAQCAtMjYsNyArMjUsNyBAQCBpbmRleCA2Zjk5ZjNlLi5mMjJhYTllIDEwMDY0
NAogICAgICAgIGdwZ3J0X2Fubm90YXRlX2xlYWtlZF9vYmplY3QgKG5hbWUpOwogICAgICB9CiAg
Ci1AQCAtMTMxNiw3ICsxMzE2LDcgQEAgZ251cGdfc3lzY29uZmRpciAodm9pZCkKK0BAIC0xNDY4
LDcgKzE0NjgsNyBAQCBnbnVwZ19zeXNjb25mZGlyICh2b2lkKQogICAgaWYgKGRpcikKICAgICAg
cmV0dXJuIGRpcjsKICAgIGVsc2UKQEAgLTM1LDcgKzM0LDcgQEAgaW5kZXggNmY5OWYzZS4uZjIy
YWE5ZSAxMDA2NDQKICAjZW5kaWYgLyohSEFWRV9XMzJfU1lTVEVNKi8KICB9CiAgCi1AQCAtMTM1
Miw3ICsxMzUyLDcgQEAgZ251cGdfYmluZGlyICh2b2lkKQorQEAgLTE1MDQsNyArMTUwNCw3IEBA
IGdudXBnX2JpbmRpciAodm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxz
ZQpAQCAtNDQsNyArNDMsNyBAQCBpbmRleCA2Zjk5ZjNlLi5mMjJhYTllIDEwMDY0NAogICNlbmRp
ZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAKLUBAIC0xMzc5LDcgKzEzNzksNyBAQCBnbnVw
Z19saWJleGVjZGlyICh2b2lkKQorQEAgLTE1MzEsNyArMTUzMSw3IEBAIGdudXBnX2xpYmV4ZWNk
aXIgKHZvaWQpCiAgICAgICAgcmV0dXJuIG5hbWU7CiAgICAgIH0KICAgIGVsc2UKQEAgLTUzLDcg
KzUyLDcgQEAgaW5kZXggNmY5OWYzZS4uZjIyYWE5ZSAxMDA2NDQKICAjZW5kaWYgLyohSEFWRV9X
MzJfU1lTVEVNKi8KICB9CiAgCi1AQCAtMTQwOSw3ICsxNDA5LDcgQEAgZ251cGdfbGliZGlyICh2
b2lkKQorQEAgLTE1NjEsNyArMTU2MSw3IEBAIGdudXBnX2xpYmRpciAodm9pZCkKICAgICAgICBy
ZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxzZQpAQCAtNjIsNyArNjEsNyBAQCBpbmRleCA2Zjk5
ZjNlLi5mMjJhYTllIDEwMDY0NAogICNlbmRpZiAvKiFIQVZFX1czMl9TWVNURU0qLwogIH0KICAK
LUBAIC0xNDQwLDcgKzE0NDAsNyBAQCBnbnVwZ19kYXRhZGlyICh2b2lkKQorQEAgLTE1OTIsNyAr
MTU5Miw3IEBAIGdudXBnX2RhdGFkaXIgKHZvaWQpCiAgICAgICAgcmV0dXJuIG5hbWU7CiAgICAg
IH0KICAgIGVsc2UKQEAgLTcxLDcgKzcwLDcgQEAgaW5kZXggNmY5OWYzZS4uZjIyYWE5ZSAxMDA2
NDQKICAjZW5kaWYgLyohSEFWRV9XMzJfU1lTVEVNKi8KICB9CiAgCi1AQCAtMTQ3Miw3ICsxNDcy
LDcgQEAgZ251cGdfbG9jYWxlZGlyICh2b2lkKQorQEAgLTE2MjQsNyArMTYyNCw3IEBAIGdudXBn
X2xvY2FsZWRpciAodm9pZCkKICAgICAgICByZXR1cm4gbmFtZTsKICAgICAgfQogICAgZWxzZQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi40LjUuYmIgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQuNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjAuYmIKaW5k
ZXggOTk5OTY5NjhiMS4uN2M2ZDdiZGMxYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ251cGcvZ251cGdfMi40LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcv
Z251cGdfMi41LjAuYmIKQEAgLTIzLDcgKzIzLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0
aXZlID0gIiBmaWxlOi8vMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3JlbG9jYXRlLnBhdGNoIgog
U1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBmaWxlOi8vcmVsb2NhdGUucGF0Y2gi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNjhmN2Q3NWQwNmNiMTYzNWMzMzZkMzRkODQ0YWY5
NzQzNmMzZjY0ZWExNGJjYjdjODY5NzgyZjk2ZjQ0Mjc3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjIyMjJjODI3ZDRlNzA4N2YxNWU3ZjcyNzM5ZDAwNGFiYzFkMDVjNmM1ZjBhNWExMmIyNGM2YTZj
YzVkMTczZmIiCiAKIEVYVFJBX09FQ09ORiA9ICItLWRpc2FibGUtbGRhcCBcCiAJCS0tZGlzYWJs
ZS1jY2lkLWRyaXZlciBcCi0tIAoyLjQ0LjAKCg==

--===============4726469362725199819==--

