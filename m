Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5892.1626056248347062294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 28AA338C08CF
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.60 SUCCEEDED
Message-ID: <MADEUP.1690E98AF18D7FA3.2174@lists.openembedded.org>
X-Groupsio-MsgNum: 153733
Content-Type: multipart/mixed; boundary="===============0847242426432638149=="

--===============0847242426432638149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.60* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.59-5.60.patch
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

--===============0847242426432638149==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.59-5.60.patch"

From ff35fefa5b45f46bc122039e1e5c049e5d9ebb6b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 18:58:00 +0000
Subject: [PATCH] bluez5: upgrade 5.59 -> 5.60

---
 .../bluez5/{bluez5_5.59.bb => bluez5_5.60.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.59.bb => bluez5_5.60.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.59.bb b/meta/recipes-connectivity/bluez5/bluez5_5.60.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.59.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.60.bb
index 7842eac76d..defa0c15cd 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.59.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.60.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "046b95b386d0bfb2a16311fe799d517ee7735045512d89902c4ed701db477316"
+SRC_URI[sha256sum] = "710999580d01ee59ec585e5e7c07fd94eddedc001aa26fe7464c546f9d945304"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
-- 
2.20.1


--===============0847242426432638149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bluez5/bluez5-dbg: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGSIZE changed from 24072124 to 24076112 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5-dev: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-dev: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5-doc: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-doc: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5-locale: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-locale: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5-obex: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-obex: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5-src: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGSIZE changed from 7299412 to 7301766 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5/bluez5: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5/bluez5: PKGV changed from 5.59 [default] to 5.60 [default]
packages/core2-32-poky-linux/bluez5: PV changed from "5.59" to "5.60"
packages/core2-32-poky-linux/bluez5: SRC_URI changed from "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.59.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch" to "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.60.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch"
packages/core2-32-poky-linux/bluez5: PKGV changed from 5.59 [default] to 5.60 [default]

--===============0847242426432638149==--
