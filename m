Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.673.1610713823048671891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id E361238C13C6
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.18.3 SUCCEEDED
Message-ID: <MADEUP.165A67B0ADC8E8A3.4055@lists.openembedded.org>
X-Groupsio-MsgNum: 146805
Content-Type: multipart/mixed; boundary="===============4236314739278594633=="

--===============4236314739278594633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0* to *1.18.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.18.2-1.18.3.patch
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

--===============4236314739278594633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.1802.0 to libgstbase-1.0.so.0.1803.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.1802.0 to libgstcheck-1.0.so.0.1803.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.1802.0 to libgstcontroller-1.0.so.0.1803.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.1802.0 to libgstnet-1.0.so.0.1803.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.1802.0 to libgstreamer-1.0.so.0.1803.0
  /usr/lib/libgstbase-1.0.so.0.1802.0 moved to /usr/lib/libgstbase-1.0.so.0.1803.0
  /usr/lib/libgstcheck-1.0.so.0.1802.0 moved to /usr/lib/libgstcheck-1.0.so.0.1803.0
  /usr/lib/libgstcontroller-1.0.so.0.1802.0 moved to /usr/lib/libgstcontroller-1.0.so.0.1803.0
  /usr/lib/libgstnet-1.0.so.0.1802.0 moved to /usr/lib/libgstnet-1.0.so.0.1803.0
  /usr/lib/libgstreamer-1.0.so.0.1802.0 moved to /usr/lib/libgstreamer-1.0.so.0.1803.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.1802.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.1803.0-gdb.py

--===============4236314739278594633==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.18.2-1.18.3.patch"

From 758cf9596a76c2afecabab3c6fd7610efcfbc793 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 11:27:44 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.18.2 -> 1.18.3

---
 .../{gstreamer1.0_1.18.2.bb => gstreamer1.0_1.18.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.2.bb => gstreamer1.0_1.18.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
index cce0f99226..7ad0248b7c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-Remove-unused-valgrind-detection.patch \
            file://0003-meson-Add-option-for-installed-tests.patch \
            "
-SRC_URI[sha256sum] = "66cdeb4f970c2e55932a2f427177d438fe2c55c0b6d29e80fda80263f2ae5446"
+SRC_URI[sha256sum] = "0c2e09e18f2df69a99b5cb3bd53c597b3cc2e35cf6c98043bb86a66f3d312100"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.27.0


--===============4236314739278594633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 12716550 to 12715146 (-0%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 5864247 to 5804952 (-1%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9101736 to 9115588 (+0%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: PKGSIZE changed from 3506482 to 3510578 (+0%)
packages/core2-32-poky-linux/gstreamer1.0: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.2.tar.xz file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch file://0002-Remove-unused-valgrind-detection.patch file://0003-meson-Add-option-for-installed-tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.3.tar.xz file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch file://0002-Remove-unused-valgrind-detection.patch file://0003-meson-Add-option-for-installed-tests.patch"
packages/core2-32-poky-linux/gstreamer1.0: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
Changes to packages/core2-32-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.1802.0 to libgstbase-1.0.so.0.1803.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.1802.0 to libgstcheck-1.0.so.0.1803.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.1802.0 to libgstcontroller-1.0.so.0.1803.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.1802.0 to libgstnet-1.0.so.0.1803.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.1802.0 to libgstreamer-1.0.so.0.1803.0
  /usr/lib/libgstbase-1.0.so.0.1802.0 moved to /usr/lib/libgstbase-1.0.so.0.1803.0
  /usr/lib/libgstcheck-1.0.so.0.1802.0 moved to /usr/lib/libgstcheck-1.0.so.0.1803.0
  /usr/lib/libgstcontroller-1.0.so.0.1802.0 moved to /usr/lib/libgstcontroller-1.0.so.0.1803.0
  /usr/lib/libgstnet-1.0.so.0.1802.0 moved to /usr/lib/libgstnet-1.0.so.0.1803.0
  /usr/lib/libgstreamer-1.0.so.0.1802.0 moved to /usr/lib/libgstreamer-1.0.so.0.1803.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.1802.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.1803.0-gdb.py

--===============4236314739278594633==--
