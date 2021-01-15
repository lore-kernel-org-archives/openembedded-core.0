Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.721.1610713822642426781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id F228338C126C
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffstat: upgrading to 1.64 SUCCEEDED
Message-ID: <MADEUP.165A67B016ED40DC.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146751
Content-Type: multipart/mixed; boundary="===============3445194951140325416=="

--===============3445194951140325416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffstat* to *1.64* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffstat-upgrade-1.63-1.64.patch
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

--===============3445194951140325416==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffstat-upgrade-1.63-1.64.patch"

From a8f4bb3ee4fcac8f93d27e9725e048e4e723d664 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 04:17:11 +0000
Subject: [PATCH] diffstat: upgrade 1.63 -> 1.64

---
 .../{diffstat_1.63.bb => diffstat_1.64.bb}    | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.63.bb => diffstat_1.64.bb} (50%)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.63.bb b/meta/recipes-devtools/diffstat/diffstat_1.64.bb
similarity index 50%
rename from meta/recipes-devtools/diffstat/diffstat_1.63.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.64.bb
index 863f924b22..8b383898fb 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.63.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.64.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,4 +1,4 @@
+# -Copyright 1994-2018,2019 by Thomas E. Dickey
+# +Copyright 1994-2019,2021 by Thomas E. Dickey
+#  All Rights Reserved.
+#  
+#  Permission to use, copy, modify, and distribute this software and its
+# 
+#
+
 SUMMARY = "Tool to produce a statistics based on a diff"
 DESCRIPTION = "diffstat reads the output of diff and displays a histogram of \
 the insertions, deletions, and modifications per-file. It is useful for \
@@ -5,7 +24,7 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a3d0bb117493e804b0c1a868ddf23321"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f605b1986cc3b808ec0e4fa9d0e0f2d9"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
@@ -13,8 +32,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-aclocal.m4-add-missing-header-defines.patch \
            "
 
-SRC_URI[md5sum] = "b9272ec8af6257103261ec3622692991"
-SRC_URI[sha256sum] = "7eddd53401b99b90bac3f7ebf23dd583d7d99c6106e67a4f1161b7a20110dc6f"
+SRC_URI[sha256sum] = "b8aee38d9d2e1d05926e6b55810a9d2c2dd407f24d6a267387563a4436e3f7fc"
 
 inherit autotools gettext ptest
 
-- 
2.27.0


--===============3445194951140325416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffstat/diffstat-dbg: PKGSIZE changed from 134792 to 137240 (+2%)
packages/core2-32-poky-linux/diffstat/diffstat-dbg: PKGV changed from 1.63 [default] to 1.64 [default]
packages/core2-32-poky-linux/diffstat/diffstat-dbg: PV changed from "1.63" to "1.64"
packages/core2-32-poky-linux/diffstat/diffstat-dev: PKGV changed from 1.63 [default] to 1.64 [default]
packages/core2-32-poky-linux/diffstat/diffstat-dev: PV changed from "1.63" to "1.64"
packages/core2-32-poky-linux/diffstat/diffstat-doc: PKGV changed from 1.63 [default] to 1.64 [default]
packages/core2-32-poky-linux/diffstat/diffstat-doc: PV changed from "1.63" to "1.64"
packages/core2-32-poky-linux/diffstat/diffstat-locale: PKGV changed from 1.63 [default] to 1.64 [default]
packages/core2-32-poky-linux/diffstat/diffstat-locale: PV changed from "1.63" to "1.64"
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PKGSIZE changed from 550064 to 558757 (+2%)
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PKGV changed from 1.63 [default] to 1.64 [default]
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PV changed from "1.63" to "1.64"
packages/core2-32-poky-linux/diffstat/diffstat-src: PKGSIZE changed from 83988 to 85056 (+1%)
packages/core2-32-poky-linux/diffstat/diffstat-src: PKGV changed from 1.63 [default] to 1.64 [default]
packages/core2-32-poky-linux/diffstat/diffstat-src: PV changed from "1.63" to "1.64"
packages/core2-32-poky-linux/diffstat/diffstat-staticdev: PKGV changed from 1.63 [default] to 1.64 [default]
packages/core2-32-poky-linux/diffstat/diffstat-staticdev: PV changed from "1.63" to "1.64"
packages/core2-32-poky-linux/diffstat/diffstat: PKGV changed from 1.63 [default] to 1.64 [default]
packages/core2-32-poky-linux/diffstat/diffstat: PV changed from "1.63" to "1.64"
packages/core2-32-poky-linux/diffstat: PKGV changed from 1.63 [default] to 1.64 [default]
packages/core2-32-poky-linux/diffstat: PV changed from "1.63" to "1.64"
packages/core2-32-poky-linux/diffstat: SRC_URI changed from "http://invisible-mirror.net/archives/diffstat/diffstat-1.63.tgz file://run-ptest file://avoid-check-user-break-cc.patch file://0001-aclocal.m4-add-missing-header-defines.patch" to "http://invisible-mirror.net/archives/diffstat/diffstat-1.64.tgz file://run-ptest file://avoid-check-user-break-cc.patch file://0001-aclocal.m4-add-missing-header-defines.patch"

--===============3445194951140325416==--
