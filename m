Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.16387.1598724162526347983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63BBDE020DA; Sat, 29 Aug 2020 11:02:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.0 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DAD5E020F8
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:58 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.46.1 SUCCEEDED
Message-Id: <20200829180242.63BBDE020DA@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:42 -0700 (PDT)
X-Groupsio-MsgNum: 141964
Content-Type: multipart/mixed; boundary="===============7674912503958521908=="

--===============7674912503958521908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pango* to *1.46.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.46.0-1.46.1.patch
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

--===============7674912503958521908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pango/pango-dev: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0", added "/usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoxft-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-doc: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0", added "/usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoxft-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-locale: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0", added "/usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoxft-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-ptest: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0", added "/usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoxft-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-staticdev: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0", added "/usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoxft-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0", added "/usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoxft-1.0.so.0.4600.1"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.4600.0 to libpango-1.0.so.0.4600.1
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.4600.0 to libpangocairo-1.0.so.0.4600.1
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.4600.0 to libpangoft2-1.0.so.0.4600.1
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.4600.0 to libpangoxft-1.0.so.0.4600.1
  /usr/lib/libpango-1.0.so.0.4600.0 moved to /usr/lib/libpango-1.0.so.0.4600.1
  /usr/lib/libpangocairo-1.0.so.0.4600.0 moved to /usr/lib/libpangocairo-1.0.so.0.4600.1
  /usr/lib/libpangoft2-1.0.so.0.4600.0 moved to /usr/lib/libpangoft2-1.0.so.0.4600.1
  /usr/lib/libpangoxft-1.0.so.0.4600.0 moved to /usr/lib/libpangoxft-1.0.so.0.4600.1

--===============7674912503958521908==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.46.0-1.46.1.patch"

From 438c1dfa1ed4a0fc5d561d8fe264011b83d6b076 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 14:32:36 +0000
Subject: [PATCH] pango: upgrade 1.46.0 -> 1.46.1

---
 .../recipes-graphics/pango/{pango_1.46.0.bb => pango_1.46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.46.0.bb => pango_1.46.1.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.46.0.bb b/meta/recipes-graphics/pango/pango_1.46.1.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.46.0.bb
rename to meta/recipes-graphics/pango/pango_1.46.1.bb
index 54440ea786..cc6cc1e35c 100644
--- a/meta/recipes-graphics/pango/pango_1.46.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.46.1.bb
@@ -16,7 +16,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "9a81572ebb946187fbdd69d5ffc57e2f7a1f768cd8d2fd89dbb03fb9002a99b5"
+SRC_URI[archive.sha256sum] = "fe516b10711bbb6fd75011d66dd08fabfce18f7931aed7415136d53c4aadf1c5"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.17.1


--===============7674912503958521908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pango: PKGV changed from 1.46.0 [default] to 1.46.1 [default]
packages/core2-32-poky-linux/pango: PV changed from "1.46.0" to "1.46.1"
packages/core2-32-poky-linux/pango/pango-dbg: PKGSIZE changed from 1949300 to 1950104 (+0%)
packages/core2-32-poky-linux/pango/pango-dbg: PKGV changed from 1.46.0 [default] to 1.46.1 [default]
packages/core2-32-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0", added "/usr/lib/libpangoxft-1.0.so.0.4600.1 /usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-dbg: PV changed from "1.46.0" to "1.46.1"
packages/core2-32-poky-linux/pango/pango-dev: PKGSIZE changed from 1464129 to 1463981 (-0%)
packages/core2-32-poky-linux/pango/pango-dev: PKGV changed from 1.46.0 [default] to 1.46.1 [default]
packages/core2-32-poky-linux/pango/pango-dev: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0", added "/usr/lib/libpangoxft-1.0.so.0.4600.1 /usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-dev: PV changed from "1.46.0" to "1.46.1"
packages/core2-32-poky-linux/pango/pango-doc: PKGV changed from 1.46.0 [default] to 1.46.1 [default]
packages/core2-32-poky-linux/pango/pango-doc: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0", added "/usr/lib/libpangoxft-1.0.so.0.4600.1 /usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-doc: PV changed from "1.46.0" to "1.46.1"
packages/core2-32-poky-linux/pango/pango-locale: PKGV changed from 1.46.0 [default] to 1.46.1 [default]
packages/core2-32-poky-linux/pango/pango-locale: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0", added "/usr/lib/libpangoxft-1.0.so.0.4600.1 /usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-locale: PV changed from "1.46.0" to "1.46.1"
packages/core2-32-poky-linux/pango/pango-ptest: PKGV changed from 1.46.0 [default] to 1.46.1 [default]
packages/core2-32-poky-linux/pango/pango-ptest: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0", added "/usr/lib/libpangoxft-1.0.so.0.4600.1 /usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-ptest: PV changed from "1.46.0" to "1.46.1"
packages/core2-32-poky-linux/pango/pango-src: PKGSIZE changed from 1829954 to 1831457 (+0%)
packages/core2-32-poky-linux/pango/pango-src: PKGV changed from 1.46.0 [default] to 1.46.1 [default]
packages/core2-32-poky-linux/pango/pango-src: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0", added "/usr/lib/libpangoxft-1.0.so.0.4600.1 /usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-src: PV changed from "1.46.0" to "1.46.1"
packages/core2-32-poky-linux/pango/pango-staticdev: PKGV changed from 1.46.0 [default] to 1.46.1 [default]
packages/core2-32-poky-linux/pango/pango-staticdev: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0", added "/usr/lib/libpangoxft-1.0.so.0.4600.1 /usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango-staticdev: PV changed from "1.46.0" to "1.46.1"
packages/core2-32-poky-linux/pango/pango: PKGSIZE changed from 706119 to 706103 (-0%)
packages/core2-32-poky-linux/pango/pango: PKGV changed from 1.46.0 [default] to 1.46.1 [default]
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4600.0 /usr/lib/libpangoxft-1.0.so.0.4600.0 /usr/lib/libpangoft2-1.0.so.0.4600.0 /usr/lib/libpangocairo-1.0.so.0.4600.0", added "/usr/lib/libpangoxft-1.0.so.0.4600.1 /usr/lib/libpango-1.0.so.0.4600.1 /usr/lib/libpangocairo-1.0.so.0.4600.1 /usr/lib/libpangoft2-1.0.so.0.4600.1"
packages/core2-32-poky-linux/pango/pango: PV changed from "1.46.0" to "1.46.1"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.4600.0 to libpango-1.0.so.0.4600.1
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.4600.0 to libpangocairo-1.0.so.0.4600.1
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.4600.0 to libpangoft2-1.0.so.0.4600.1
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.4600.0 to libpangoxft-1.0.so.0.4600.1
  /usr/lib/libpango-1.0.so.0.4600.0 moved to /usr/lib/libpango-1.0.so.0.4600.1
  /usr/lib/libpangocairo-1.0.so.0.4600.0 moved to /usr/lib/libpangocairo-1.0.so.0.4600.1
  /usr/lib/libpangoft2-1.0.so.0.4600.0 moved to /usr/lib/libpangoft2-1.0.so.0.4600.1
  /usr/lib/libpangoxft-1.0.so.0.4600.0 moved to /usr/lib/libpangoxft-1.0.so.0.4600.1

--===============7674912503958521908==--
