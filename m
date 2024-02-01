Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75706C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:09:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9063.1706764145768868003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n23cYIDq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706764146; x=1738300146;
  h=from:to:cc:subject:date:message-id;
  bh=a/Z8Mvc5dTyJEHDlMevcXL8u14R8LQGkfxyBVrDgJfI=;
  b=n23cYIDqCHkifpUWlJhHW6WfRGcKmFITJHlSPbKKKPh+sK2e60SUt5jt
   UCFYQvB2qrrXLxIpFQQ3Sub4xGw2ndjjhvZh8eIucbwHthdL0pSRxKY+o
   uGYuNBTEwylSPW8ioZjozkcwk7k28snu6TU+u/Eycv2It7wVgd1DPbP3P
   Vh4R3VQSk5HIsglWf3AnIx+NPkFhvS/fzIkBw+5y1wwtdNZcBeqNjZb9r
   W2WHYkUQI54j/gQav5Hb98Qdm0QmEFCeaDVNiyoxRKH+ZAURddnV4lcYV
   h7gCyAQu40euecxAqj9xm5DEadbUtO0aEzOOQDW905rNFLKsQU5GxB66e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="147476654"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="147476654"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:09:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A894B176CAE
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:09:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E12C7CF7CA
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:08:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C28D200977AE
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:08:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DC7D91A006A;
	Thu,  1 Feb 2024 13:08:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gnupg: upgrade 2.4.3 -> 2.4.4
Date: Thu,  1 Feb 2024 13:07:28 +0800
Message-Id: <1706764048-12418-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--7.574600-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyWhLh9e7qvSIt9G
	7A5l4wBGdB9aRZ3DyIT4FYZ9LELwjG94Ipa1otxouce7gFxhKa2XBPRemiwRNb5/tqn0MloN7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q2VUcz8XpiS9MasJhDgVSnq5bT3PusujkxkZb
	xGNSeTiFO0I5R+qJ4A2Yg28zQHJnVMGF0Ua9spp8Q4mpKyfkqZ2FA7wK9mP9cQRik6+J7XSWqLY
	0630P+j61nSqo5xsDPQvbuwy1I9/mk5Fql3Faa7fZhebaJ3bi8t1/cXsi3M5CBQRBOQhaJiOFu5
	pRApemwx2CPL/Yx2QUQVxhnFZxOuTvHzGcGqiILdCok3ibXlQX0tCKdnhB58k4rY1r+vswgXvQk
	Gi3tjz46HM5rqDwqtFgNHbKr2wu8LtKl+whTDQI8CXAVYipEoK2QEvuR3WK/ychzNjpfvcQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194564

From: Wang Mingyu <wangmy@fujitsu.com>

fix-ldap.patch
removed since it's included in 2.4.4.

0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
0004-autogen.sh-fix-find-version-for-beta-checking.patch
relocate.patch
refreshed for 2.4.4

Changelog:
 https://dev.gnupg.org/T6578

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-a-custom-value-for-the-location-of-.patch |  6 ++--
 ...h-fix-find-version-for-beta-checking.patch | 12 +++----
 .../gnupg/gnupg/fix-ldap.patch                | 34 -------------------
 .../gnupg/gnupg/relocate.patch                | 18 +++++-----
 .../gnupg/{gnupg_2.4.3.bb => gnupg_2.4.4.bb}  |  3 +-
 5 files changed, 18 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/fix-ldap.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.3.bb => gnupg_2.4.4.bb} (96%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 561616584c..f957f6b55e 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From acdb7e1d2844cd4088f099617e25352b3dc5b075 Mon Sep 17 00:00:00 2001
+From 6b581c43bd01f815db78a410fd3814fc5994171e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e68b779..eec9f89 100644
+index 26d7f7b..e953c2e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1922,7 +1922,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1921,7 +1921,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index dcd8582ca6..d664c36a1b 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,7 +1,7 @@
-From 914ae4a3f7529fb069467bf0ded57dd24ee2e763 Mon Sep 17 00:00:00 2001
+From 6a7f9b71d936847dcaeeac7d1b69d8299be4dd85 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
-Subject: [PATCH 4/4] autogen.sh: fix find-version for beta checking
+Subject: [PATCH] autogen.sh: fix find-version for beta checking
 
 find-version always assumes that gnupg is beta if autogen.sh is run
 out of git-repo. This doesn't work for users whom just take release
@@ -13,15 +13,16 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  autogen.sh | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index e5ba5bf..05e0e11 100755
+index 0abf103..78753b5 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -245,7 +245,6 @@ if [ "$myhost" = "find-version" ]; then
+@@ -237,7 +237,6 @@ if [ "$myhost" = "find-version" ]; then
        rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
      else
        ingit=no
@@ -29,6 +30,3 @@ index e5ba5bf..05e0e11 100755
        tmp="-unknown"
        rev="0000000"
        rvd="0"
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/fix-ldap.patch b/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
deleted file mode 100644
index 4754781565..0000000000
--- a/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dc13361524c1477b2106c7385f2059f9ea111b84 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Wed, 5 Jul 2023 09:29:54 +0900
-Subject: [PATCH] dirmngr: Enable the call of ks_ldap_help_variables when
- USE_LDAP.
-
-* dirmngr/server.c [USE_LDAP] (cmd_ad_query): Conditionalize.
-
---
-
-Upstream-Status: Backport
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- dirmngr/server.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/dirmngr/server.c b/dirmngr/server.c
-index 51a149cb2..ee61f63d6 100644
---- a/dirmngr/server.c
-+++ b/dirmngr/server.c
-@@ -2776,7 +2776,9 @@ cmd_ad_query (assuan_context_t ctx, char *line)
- 
-   if (opt_help)
-     {
-+#if USE_LDAP
-       ks_ldap_help_variables (ctrl);
-+#endif
-       err = 0;
-       goto leave;
-     }
--- 
-2.11.0
-
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index d540e9edbb..ea0252026a 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 0e4b325c199354ce54cc4687532cced1440fd496 Mon Sep 17 00:00:00 2001
+From c50d0a95fcf8f96c272fadd4ba85f3eeac39fcaf Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 286685f..212a945 100644
+index 6f99f3e..f22aa9e 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1213,7 +1213,7 @@ gnupg_socketdir (void)
+@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +26,7 @@ index 286685f..212a945 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1245,7 +1245,7 @@ gnupg_sysconfdir (void)
+@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +35,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1281,7 +1281,7 @@ gnupg_bindir (void)
+@@ -1352,7 +1352,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +44,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1308,7 +1308,7 @@ gnupg_libexecdir (void)
+@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +53,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1338,7 +1338,7 @@ gnupg_libdir (void)
+@@ -1409,7 +1409,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +62,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1369,7 +1369,7 @@ gnupg_datadir (void)
+@@ -1440,7 +1440,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +71,7 @@ index 286685f..212a945 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1401,7 +1401,7 @@ gnupg_localedir (void)
+@@ -1472,7 +1472,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.3.bb b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.4.3.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.4.bb
index e91ef34b7d..5b9869b4f3 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.3.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
@@ -18,13 +18,12 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
-           file://fix-ldap.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "a271ae6d732f6f4d80c258ad9ee88dd9c94c8fdc33c3e45328c4d7c126bd219d"
+SRC_URI[sha256sum] = "67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.34.1


