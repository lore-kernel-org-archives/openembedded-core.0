Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.720.1610713822581751963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 03C2C38C12BB
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.2.27 SUCCEEDED
Message-ID: <MADEUP.165A67B0CBF67FA4.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146814
Content-Type: multipart/mixed; boundary="===============1858922926915054161=="

--===============1858922926915054161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.2.27* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.2.26-2.2.27.patch
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

--===============1858922926915054161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnupg/gnupg-dbg: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 16893504 to 16892708 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-dev: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-doc: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PKGSIZE changed from 236815 to 236683 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 241844 to 241717 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 220215 to 220097 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 217711 to 217601 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PKGSIZE changed from 225339 to 225212 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PKGSIZE changed from 211550 to 211394 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-it: PKGSIZE changed from 234778 to 234648 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 247673 to 247514 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PKGSIZE changed from 220096 to 219985 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PKGSIZE changed from 239588 to 239465 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PKGSIZE changed from 303864 to 303688 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PKGSIZE changed from 309216 to 309032 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PKGSIZE changed from 211959 to 211843 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PKGSIZE changed from 183888 to 183776 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-src: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-src: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 7720257 to 7723929 (+0%)
packages/core2-32-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg/gnupg: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg/gnupg: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg: PV changed from "2.2.26" to "2.2.27"
packages/core2-32-poky-linux/gnupg: PKGV changed from 2.2.26 [default] to 2.2.27 [default]
packages/core2-32-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.26.tar.bz2 file://0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch file://0002-use-pkgconfig-instead-of-npth-config.patch file://0003-dirmngr-uses-libgpg-error.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.27.tar.bz2 file://0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch file://0002-use-pkgconfig-instead-of-npth-config.patch file://0003-dirmngr-uses-libgpg-error.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"

--===============1858922926915054161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.2.26-2.2.27.patch"

From fd8ed712ae946eaec29df15ddaa1362f9bbfc19a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 12:06:23 +0000
Subject: [PATCH] gnupg: upgrade 2.2.26 -> 2.2.27

---
 ...-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/gnupg/relocate.patch                | 20 +++++++++----------
 .../{gnupg_2.2.26.bb => gnupg_2.2.27.bb}      |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.26.bb => gnupg_2.2.27.bb} (96%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index a0af2d48dc..0f2fc9e191 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From abc5c396aaddaef2e6811362e3e0cc0da28c2b34 Mon Sep 17 00:00:00 2001
+From 9144675c5fc1c526a5e20b707abe46914d4d15e7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 64cb8c6..3fe9027 100644
+index 3390319..d1a1702 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1824,7 +1824,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1841,7 +1841,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 7f7812cd46..26f780d28a 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From bd66af2ac7bb6d9294ac8055a55462ba7c4f9c9b Mon Sep 17 00:00:00 2001
+From f90c3cfd81cfb5c034eee22ba69f78dbbfd4ff69 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 4b6e46e..58989b4 100644
+index 85e09c4..e1410e2 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -763,7 +763,7 @@ gnupg_socketdir (void)
+@@ -788,7 +788,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -24,7 +24,7 @@ index 4b6e46e..58989b4 100644
      }
  
    return name;
-@@ -789,7 +789,7 @@ gnupg_sysconfdir (void)
+@@ -814,7 +814,7 @@ gnupg_sysconfdir (void)
      }
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -33,7 +33,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -818,7 +818,7 @@ gnupg_bindir (void)
+@@ -843,7 +843,7 @@ gnupg_bindir (void)
    else
      return rdir;
  #else /*!HAVE_W32_SYSTEM*/
@@ -42,7 +42,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -831,7 +831,7 @@ gnupg_libexecdir (void)
+@@ -856,7 +856,7 @@ gnupg_libexecdir (void)
  #ifdef HAVE_W32_SYSTEM
    return gnupg_bindir ();
  #else /*!HAVE_W32_SYSTEM*/
@@ -51,7 +51,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -845,7 +845,7 @@ gnupg_libdir (void)
+@@ -870,7 +870,7 @@ gnupg_libdir (void)
      name = xstrconcat (w32_rootdir (), DIRSEP_S "lib" DIRSEP_S "gnupg", NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -60,7 +60,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -859,7 +859,7 @@ gnupg_datadir (void)
+@@ -884,7 +884,7 @@ gnupg_datadir (void)
      name = xstrconcat (w32_rootdir (), DIRSEP_S "share" DIRSEP_S "gnupg", NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -69,7 +69,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -875,7 +875,7 @@ gnupg_localedir (void)
+@@ -900,7 +900,7 @@ gnupg_localedir (void)
                         NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -78,7 +78,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -943,7 +943,7 @@ gnupg_cachedir (void)
+@@ -971,7 +971,7 @@ gnupg_cachedir (void)
      }
    return dir;
  #else /*!HAVE_W32_SYSTEM*/
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.26.bb b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.2.26.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.27.bb
index 1c6e68b4b1..8b5fc9983a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.26.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
@@ -20,7 +20,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "517569e6c9fad22175df16be5900f94c991c41e53612db63c14493e814cfff6d"
+SRC_URI[sha256sum] = "34e60009014ea16402069136e0a5f63d9b65f90096244975db5cea74b3d02399"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.27.0


--===============1858922926915054161==--
