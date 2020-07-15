Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.102.1594831467008950916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D59AAE01E93; Wed, 15 Jul 2020 09:44:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDB7FE01EDE
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:43:02 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.2.21 SUCCEEDED
Message-Id: <20200715164426.D59AAE01E93@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:44:26 -0700 (PDT)
X-Groupsio-MsgNum: 140683
Content-Type: multipart/mixed; boundary="===============8240538014665588753=="

--===============8240538014665588753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.2.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.2.20-2.2.21.patch
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

--===============8240538014665588753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnupg/gnupg-dbg: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 16832364 to 16936344 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-dev: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-doc: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-doc: PKGSIZE changed from 1013202 to 1016419 (+0%)
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1671328 to 1683616 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PKGSIZE changed from 237995 to 237911 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-da: PKGSIZE changed from 139770 to 139692 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 243416 to 243405 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 221580 to 221570 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 219092 to 219082 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PKGSIZE changed from 228443 to 228361 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PKGSIZE changed from 214794 to 214695 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-hu: PKGSIZE changed from 45340 to 45570 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 249898 to 249890 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PKGSIZE changed from 222242 to 222159 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PKGSIZE changed from 239646 to 239559 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PKGSIZE changed from 303896 to 303764 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-sv: PKGSIZE changed from 140069 to 139924 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PKGSIZE changed from 137923 to 137823 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PKGSIZE changed from 306152 to 306016 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PKGSIZE changed from 214857 to 214804 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PKGSIZE changed from 186795 to 186725 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-src: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-src: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 7423638 to 7525764 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg/gnupg: PKGV changed from 2.2.20 [default] to 2.2.21 [default]
packages/core2-32-poky-linux/gnupg/gnupg: PKGSIZE changed from 4564455 to 4597243 (+1%)
packages/core2-32-poky-linux/gnupg: PV changed from "2.2.20" to "2.2.21"
packages/core2-32-poky-linux/gnupg: PKGV changed from 2.2.20 [default] to 2.2.21 [default]

--===============8240538014665588753==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.2.20-2.2.21.patch"

From 4884403dcec4d91cc73656e5caecfa6d976a340a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 15:29:13 +0000
Subject: [PATCH] gnupg: upgrade 2.2.20 -> 2.2.21

---
 ...-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/gnupg/relocate.patch                | 20 +++++++++----------
 .../{gnupg_2.2.20.bb => gnupg_2.2.21.bb}      |  3 +--
 3 files changed, 14 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.20.bb => gnupg_2.2.21.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 2c204e0245..0e78f5679e 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From e7ad11cf54475e455fdb84d118e4782961698567 Mon Sep 17 00:00:00 2001
+From 0e51c62706a8c54e90a2d98c5250ecc894c65182 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 919ab31..cd58fdb 100644
+index f3c9863..a57f559 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1855,7 +1855,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1856,7 +1856,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index e5a82aa76d..25732a8277 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 59c077f32e81190955910cae02599c7a3edfa7fb Mon Sep 17 00:00:00 2001
+From 6e3b1d89758c3ee7072aeefa305ce5fe76f2e439 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index e9e75d0..19140aa 100644
+index 4b6e46e..58989b4 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -760,7 +760,7 @@ gnupg_socketdir (void)
+@@ -763,7 +763,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -24,7 +24,7 @@ index e9e75d0..19140aa 100644
      }
  
    return name;
-@@ -786,7 +786,7 @@ gnupg_sysconfdir (void)
+@@ -789,7 +789,7 @@ gnupg_sysconfdir (void)
      }
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -33,7 +33,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -815,7 +815,7 @@ gnupg_bindir (void)
+@@ -818,7 +818,7 @@ gnupg_bindir (void)
    else
      return rdir;
  #else /*!HAVE_W32_SYSTEM*/
@@ -42,7 +42,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -828,7 +828,7 @@ gnupg_libexecdir (void)
+@@ -831,7 +831,7 @@ gnupg_libexecdir (void)
  #ifdef HAVE_W32_SYSTEM
    return gnupg_bindir ();
  #else /*!HAVE_W32_SYSTEM*/
@@ -51,7 +51,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -842,7 +842,7 @@ gnupg_libdir (void)
+@@ -845,7 +845,7 @@ gnupg_libdir (void)
      name = xstrconcat (w32_rootdir (), DIRSEP_S "lib" DIRSEP_S "gnupg", NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -60,7 +60,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -856,7 +856,7 @@ gnupg_datadir (void)
+@@ -859,7 +859,7 @@ gnupg_datadir (void)
      name = xstrconcat (w32_rootdir (), DIRSEP_S "share" DIRSEP_S "gnupg", NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -69,7 +69,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -872,7 +872,7 @@ gnupg_localedir (void)
+@@ -875,7 +875,7 @@ gnupg_localedir (void)
                         NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -78,7 +78,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -940,7 +940,7 @@ gnupg_cachedir (void)
+@@ -943,7 +943,7 @@ gnupg_cachedir (void)
      }
    return dir;
  #else /*!HAVE_W32_SYSTEM*/
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.20.bb b/meta/recipes-support/gnupg/gnupg_2.2.21.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.2.20.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.21.bb
index f754573c88..701d769e64 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.21.bb
@@ -20,8 +20,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[md5sum] = "4ff88920cf52b35db0dedaee87bdbbb1"
-SRC_URI[sha256sum] = "04a7c9d48b74c399168ee8270e548588ddbe52218c337703d7f06373d326ca30"
+SRC_URI[sha256sum] = "61e83278fb5fa7336658a8b73ab26f379d41275bb1c7c6e694dd9f9a6e8e76ec"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1


--===============8240538014665588753==--
