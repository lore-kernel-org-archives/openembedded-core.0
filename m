Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.1348.1618510600151102655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 39E8438C13EB
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.40.1 SUCCEEDED
Message-ID: <MADEUP.16761AD0F4FC0EDC.6349@lists.openembedded.org>
X-Groupsio-MsgNum: 150519
Content-Type: multipart/mixed; boundary="===============9105906140541859997=="

--===============9105906140541859997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygobject* to *3.40.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.38.0-3.40.1.patch
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

--===============9105906140541859997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.38.0-3.40.1.patch"

From 1dc87b9571b45013f3be320dcda9b8d2e7d80fe1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:26:55 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.38.0 -> 3.40.1

---
 ...{python3-pygobject_3.38.0.bb => python3-pygobject_3.40.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.38.0.bb => python3-pygobject_3.40.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.40.1.bb
index 8df3150e37..f5679a4ba2 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[sha256sum] = "0372d1bb9122fc19f500a249b1f38c2bb67485000f5887497b4b205b3e7084d5"
+SRC_URI[sha256sum] = "00c6d591f4cb40c335ab1fd3e8c17869ba15cfda54416fe363290af766790035"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-- 
2.27.0


--===============9105906140541859997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dev: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-doc: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-locale: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-staticdev: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
Changes to packages/core2-32-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info moved to /usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info

--===============9105906140541859997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pygobject: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.38/pygobject-3.38.0.tar.xz file://0001-Do-not-build-tests.patch" to "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.40/pygobject-3.40.1.tar.xz file://0001-Do-not-build-tests.patch"
packages/core2-32-poky-linux/python3-pygobject: PV changed from "3.38.0" to "3.40.1"
packages/core2-32-poky-linux/python3-pygobject: PKGV changed from 3.38.0 [default] to 3.40.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.38.0" to "3.40.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.38.0 [default] to 3.40.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1099348 to 1105416 (+1%)
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.38.0" to "3.40.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dev: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.38.0 [default] to 3.40.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.38.0" to "3.40.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-doc: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.38.0 [default] to 3.40.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.38.0" to "3.40.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-locale: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.38.0 [default] to 3.40.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.38.0" to "3.40.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.38.0 [default] to 3.40.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 918671 to 920094 (+0%)
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.38.0" to "3.40.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-staticdev: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.38.0 [default] to 3.40.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.38.0" to "3.40.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info", added "/usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.38.0 [default] to 3.40.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 698703 to 703113 (+1%)
Changes to packages/core2-32-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.9/site-packages/PyGObject-3.38.0.egg-info moved to /usr/lib/python3.9/site-packages/PyGObject-3.40.1.egg-info

--===============9105906140541859997==--
