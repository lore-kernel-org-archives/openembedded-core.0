Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12420.1602843683161759980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A9E0D38C17D3
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 7.73.0 SUCCEEDED
Message-ID: <MADEUP.163E71D74EB666BB.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143500
Content-Type: multipart/mixed; boundary="===============3190869139757199399=="

--===============3190869139757199399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *curl* to *7.73.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-curl-upgrade-7.72.0-7.73.0.patch
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

--===============3190869139757199399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/curl (sysroot):
  /usr/lib/libcurl.so.4 changed symlink target from libcurl.so.4.6.0 to libcurl.so.4.7.0
  /usr/lib/libcurl.so changed symlink target from libcurl.so.4.6.0 to libcurl.so.4.7.0
  /usr/lib/libcurl.so.4.6.0 moved to /usr/lib/libcurl.so.4.7.0
  /usr/include/curl/options.h was added
Changes to packages/x86_64-linux/curl-native (sysroot):
  /usr/lib/libcurl.so.4 changed symlink target from libcurl.so.4.6.0 to libcurl.so.4.7.0
  /usr/lib/libcurl.so changed symlink target from libcurl.so.4.6.0 to libcurl.so.4.7.0
  /usr/lib/libcurl.so.4.6.0 moved to /usr/lib/libcurl.so.4.7.0
  /usr/include/curl/options.h was added

--===============3190869139757199399==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-curl-upgrade-7.72.0-7.73.0.patch"

From 8f0cf0baa4e6dd79d79b2c2eff70c4b8c909634a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:57:36 +0000
Subject: [PATCH] curl: upgrade 7.72.0 -> 7.73.0

---
 meta/recipes-support/curl/{curl_7.72.0.bb => curl_7.73.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.72.0.bb => curl_7.73.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.72.0.bb b/meta/recipes-support/curl/curl_7.73.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.72.0.bb
rename to meta/recipes-support/curl/curl_7.73.0.bb
index 7d0268253d..0f26b0f1af 100644
--- a/meta/recipes-support/curl/curl_7.72.0.bb
+++ b/meta/recipes-support/curl/curl_7.73.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "ad91970864102a59765e20ce16216efc9d6ad381471f7accceceab7d905703ef"
+SRC_URI[sha256sum] = "cf34fe0b07b800f1c01a499a6e8b2af548f6d0e044dca4a29d88a4bee146d131"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.18.4


--===============3190869139757199399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/curl/curl-dbg: PKGSIZE changed from 2624780 to 2666856 (+2%)
packages/core2-32-poky-linux/curl/curl-dbg: PV changed from "7.72.0" to "7.73.0"
packages/core2-32-poky-linux/curl/curl-dbg: PKGV changed from 7.72.0 [default] to 7.73.0 [default]
packages/core2-32-poky-linux/curl/curl-dev: PKGSIZE changed from 228341 to 232569 (+2%)
packages/core2-32-poky-linux/curl/curl-dev: PV changed from "7.72.0" to "7.73.0"
packages/core2-32-poky-linux/curl/curl-dev: PKGV changed from 7.72.0 [default] to 7.73.0 [default]
packages/core2-32-poky-linux/curl/curl-doc: PKGSIZE changed from 1613704 to 1632903 (+1%)
packages/core2-32-poky-linux/curl/curl-doc: PV changed from "7.72.0" to "7.73.0"
packages/core2-32-poky-linux/curl/curl-doc: PKGV changed from 7.72.0 [default] to 7.73.0 [default]
packages/core2-32-poky-linux/curl/curl-locale: PV changed from "7.72.0" to "7.73.0"
packages/core2-32-poky-linux/curl/curl-locale: PKGV changed from 7.72.0 [default] to 7.73.0 [default]
packages/core2-32-poky-linux/curl/curl-src: PKGSIZE changed from 3413429 to 3464005 (+1%)
packages/core2-32-poky-linux/curl/curl-src: PV changed from "7.72.0" to "7.73.0"
packages/core2-32-poky-linux/curl/curl-src: PKGV changed from 7.72.0 [default] to 7.73.0 [default]
packages/core2-32-poky-linux/curl/curl-staticdev: PV changed from "7.72.0" to "7.73.0"
packages/core2-32-poky-linux/curl/curl-staticdev: PKGV changed from 7.72.0 [default] to 7.73.0 [default]
packages/core2-32-poky-linux/curl/curl: PKGSIZE changed from 173428 to 181620 (+5%)
packages/core2-32-poky-linux/curl/curl: PV changed from "7.72.0" to "7.73.0"
packages/core2-32-poky-linux/curl/curl: PKGV changed from 7.72.0 [default] to 7.73.0 [default]
packages/core2-32-poky-linux/curl: PV changed from "7.72.0" to "7.73.0"
packages/core2-32-poky-linux/curl: PKGV changed from 7.72.0 [default] to 7.73.0 [default]
packages/core2-32-poky-linux/curl/libcurl: PKGSIZE changed from 492972 to 501760 (+2%)
packages/core2-32-poky-linux/curl/libcurl: PV changed from "7.72.0" to "7.73.0"
packages/core2-32-poky-linux/curl/libcurl: PKGV changed from 7.72.0 [default] to 7.73.0 [default]
Changes to packages/core2-32-poky-linux/curl (sysroot):
  /usr/lib/libcurl.so.4 changed symlink target from libcurl.so.4.6.0 to libcurl.so.4.7.0
  /usr/lib/libcurl.so changed symlink target from libcurl.so.4.6.0 to libcurl.so.4.7.0
  /usr/lib/libcurl.so.4.6.0 moved to /usr/lib/libcurl.so.4.7.0
  /usr/include/curl/options.h was added
Changes to packages/x86_64-linux/curl-native (sysroot):
  /usr/lib/libcurl.so.4 changed symlink target from libcurl.so.4.6.0 to libcurl.so.4.7.0
  /usr/lib/libcurl.so changed symlink target from libcurl.so.4.6.0 to libcurl.so.4.7.0
  /usr/lib/libcurl.so.4.6.0 moved to /usr/lib/libcurl.so.4.7.0
  /usr/include/curl/options.h was added

--===============3190869139757199399==--
