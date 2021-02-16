Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.5135.1613463848528049364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 46F5838C126E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 7.75.0 SUCCEEDED
Message-ID: <MADEUP.16642CD3C15ECBAC.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148154
Content-Type: multipart/mixed; boundary="===============1055755418043722261=="

--===============1055755418043722261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *curl* to *7.75.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-curl-upgrade-7.74.0-7.75.0.patch
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

--===============1055755418043722261==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-curl-upgrade-7.74.0-7.75.0.patch"

From bc8ec11c9e78befb7dce872425f4929de4177272 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 06:43:34 +0000
Subject: [PATCH] curl: upgrade 7.74.0 -> 7.75.0

---
 .../curl/{curl_7.74.0.bb => curl_7.75.0.bb}   | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.74.0.bb => curl_7.75.0.bb} (81%)

diff --git a/meta/recipes-support/curl/curl_7.74.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
similarity index 81%
rename from meta/recipes-support/curl/curl_7.74.0.bb
rename to meta/recipes-support/curl/curl_7.75.0.bb
index 873bbe8143..5fa5a35a73 100644
--- a/meta/recipes-support/curl/curl_7.74.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -1,15 +1,36 @@
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
+# @@ -1,6 +1,6 @@
+#  COPYRIGHT AND PERMISSION NOTICE
+#  
+# -Copyright (c) 1996 - 2020, Daniel Stenberg, <daniel@haxx.se>, and many
+# +Copyright (c) 1996 - 2021, Daniel Stenberg, <daniel@haxx.se>, and many
+#  contributors, see the THANKS file.
+#  
+#  All rights reserved.
+# 
+#
+
 SUMMARY = "Command line tool and library for client-side URL transfers"
 HOMEPAGE = "http://curl.haxx.se/"
 BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
+LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "0f4d63e6681636539dc88fa8e929f934cd3a840c46e0bf28c73be11e521b77a5"
+SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.17.1


--===============1055755418043722261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/curl/curl-dbg: PKGSIZE changed from 2758904 to 2802620 (+2%)
packages/core2-32-poky-linux/curl/curl-dbg: PKGV changed from 7.74.0 [default] to 7.75.0 [default]
packages/core2-32-poky-linux/curl/curl-dbg: PV changed from "7.74.0" to "7.75.0"
packages/core2-32-poky-linux/curl/curl-dev: PKGSIZE changed from 234267 to 234662 (+0%)
packages/core2-32-poky-linux/curl/curl-dev: PKGV changed from 7.74.0 [default] to 7.75.0 [default]
packages/core2-32-poky-linux/curl/curl-dev: PV changed from "7.74.0" to "7.75.0"
packages/core2-32-poky-linux/curl/curl-doc: PKGSIZE changed from 1651111 to 1647405 (-0%)
packages/core2-32-poky-linux/curl/curl-doc: PKGV changed from 7.74.0 [default] to 7.75.0 [default]
packages/core2-32-poky-linux/curl/curl-doc: PV changed from "7.74.0" to "7.75.0"
packages/core2-32-poky-linux/curl/curl-locale: PKGV changed from 7.74.0 [default] to 7.75.0 [default]
packages/core2-32-poky-linux/curl/curl-locale: PV changed from "7.74.0" to "7.75.0"
packages/core2-32-poky-linux/curl/curl-src: PKGSIZE changed from 3491297 to 3533791 (+1%)
packages/core2-32-poky-linux/curl/curl-src: PKGV changed from 7.74.0 [default] to 7.75.0 [default]
packages/core2-32-poky-linux/curl/curl-src: PV changed from "7.74.0" to "7.75.0"
packages/core2-32-poky-linux/curl/curl-staticdev: PKGV changed from 7.74.0 [default] to 7.75.0 [default]
packages/core2-32-poky-linux/curl/curl-staticdev: PV changed from "7.74.0" to "7.75.0"
packages/core2-32-poky-linux/curl/curl: PKGSIZE changed from 181680 to 185776 (+2%)
packages/core2-32-poky-linux/curl/curl: PKGV changed from 7.74.0 [default] to 7.75.0 [default]
packages/core2-32-poky-linux/curl/curl: PV changed from "7.74.0" to "7.75.0"
packages/core2-32-poky-linux/curl: SRC_URI changed from "https://curl.haxx.se/download/curl-7.74.0.tar.bz2 file://0001-replace-krb5-config-with-pkg-config.patch" to "https://curl.haxx.se/download/curl-7.75.0.tar.bz2 file://0001-replace-krb5-config-with-pkg-config.patch"
packages/core2-32-poky-linux/curl: PKGV changed from 7.74.0 [default] to 7.75.0 [default]
packages/core2-32-poky-linux/curl: PV changed from "7.74.0" to "7.75.0"
packages/core2-32-poky-linux/curl/libcurl: PKGSIZE changed from 510104 to 518312 (+2%)
packages/core2-32-poky-linux/curl/libcurl: PKGV changed from 7.74.0 [default] to 7.75.0 [default]
packages/core2-32-poky-linux/curl/libcurl: PV changed from "7.74.0" to "7.75.0"

--===============1055755418043722261==--
