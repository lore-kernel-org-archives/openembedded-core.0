Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.23884.1608473714106937002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id BE3B538C1447
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 7.74.0 SUCCEEDED
Message-ID: <MADEUP.16527252D95E14EA.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145985
Content-Type: multipart/mixed; boundary="===============2731287936496092263=="

--===============2731287936496092263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *curl* to *7.74.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-curl-upgrade-7.73.0-7.74.0.patch
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

--===============2731287936496092263==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-curl-upgrade-7.73.0-7.74.0.patch"

From af747ee15fca034626db12acc2bfecd5efdde92a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 13:04:28 +0000
Subject: [PATCH] curl: upgrade 7.73.0 -> 7.74.0

---
 meta/recipes-support/curl/{curl_7.73.0.bb => curl_7.74.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.73.0.bb => curl_7.74.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.73.0.bb b/meta/recipes-support/curl/curl_7.74.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.73.0.bb
rename to meta/recipes-support/curl/curl_7.74.0.bb
index 0f26b0f1af..873bbe8143 100644
--- a/meta/recipes-support/curl/curl_7.73.0.bb
+++ b/meta/recipes-support/curl/curl_7.74.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "cf34fe0b07b800f1c01a499a6e8b2af548f6d0e044dca4a29d88a4bee146d131"
+SRC_URI[sha256sum] = "0f4d63e6681636539dc88fa8e929f934cd3a840c46e0bf28c73be11e521b77a5"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.20.1


--===============2731287936496092263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/curl/curl-dbg: PKGSIZE changed from 2666856 to 2761220 (+4%)
packages/core2-32-poky-linux/curl/curl-dbg: PKGV changed from 7.73.0 [default] to 7.74.0 [default]
packages/core2-32-poky-linux/curl/curl-dbg: PV changed from "7.73.0" to "7.74.0"
packages/core2-32-poky-linux/curl/curl-dev: PKGSIZE changed from 232569 to 234255 (+1%)
packages/core2-32-poky-linux/curl/curl-dev: PKGV changed from 7.73.0 [default] to 7.74.0 [default]
packages/core2-32-poky-linux/curl/curl-dev: PV changed from "7.73.0" to "7.74.0"
packages/core2-32-poky-linux/curl/curl-doc: PKGSIZE changed from 1632903 to 1651111 (+1%)
packages/core2-32-poky-linux/curl/curl-doc: PKGV changed from 7.73.0 [default] to 7.74.0 [default]
packages/core2-32-poky-linux/curl/curl-doc: PV changed from "7.73.0" to "7.74.0"
packages/core2-32-poky-linux/curl/curl-locale: PKGV changed from 7.73.0 [default] to 7.74.0 [default]
packages/core2-32-poky-linux/curl/curl-locale: PV changed from "7.73.0" to "7.74.0"
packages/core2-32-poky-linux/curl/curl-src: PKGSIZE changed from 3464005 to 3491297 (+1%)
packages/core2-32-poky-linux/curl/curl-src: PKGV changed from 7.73.0 [default] to 7.74.0 [default]
packages/core2-32-poky-linux/curl/curl-src: PV changed from "7.73.0" to "7.74.0"
packages/core2-32-poky-linux/curl/curl-staticdev: PKGV changed from 7.73.0 [default] to 7.74.0 [default]
packages/core2-32-poky-linux/curl/curl-staticdev: PV changed from "7.73.0" to "7.74.0"
packages/core2-32-poky-linux/curl/curl: PKGV changed from 7.73.0 [default] to 7.74.0 [default]
packages/core2-32-poky-linux/curl/curl: PV changed from "7.73.0" to "7.74.0"
packages/core2-32-poky-linux/curl: SRC_URI changed from "https://curl.haxx.se/download/curl-7.73.0.tar.bz2 file://0001-replace-krb5-config-with-pkg-config.patch" to "https://curl.haxx.se/download/curl-7.74.0.tar.bz2 file://0001-replace-krb5-config-with-pkg-config.patch"
packages/core2-32-poky-linux/curl: PKGV changed from 7.73.0 [default] to 7.74.0 [default]
packages/core2-32-poky-linux/curl: PV changed from "7.73.0" to "7.74.0"
packages/core2-32-poky-linux/curl/libcurl: PKGSIZE changed from 501760 to 510048 (+2%)
packages/core2-32-poky-linux/curl/libcurl: PKGV changed from 7.73.0 [default] to 7.74.0 [default]
packages/core2-32-poky-linux/curl/libcurl: PV changed from "7.73.0" to "7.74.0"

--===============2731287936496092263==--
