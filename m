Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5170.1613463848543488864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 095A038C12BB
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.62.2 SUCCEEDED
Message-ID: <MADEUP.16642CD3F2570F65.16989@lists.openembedded.org>
X-Groupsio-MsgNum: 148163
Content-Type: multipart/mixed; boundary="===============5362621549912266202=="

--===============5362621549912266202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vte* to *0.62.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vte-upgrade-0.62.1-0.62.2.patch
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

--===============5362621549912266202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.6200.1 to libvte-2.91.so.0.6200.2
  /usr/lib/libvte-2.91.so.0.6200.1 moved to /usr/lib/libvte-2.91.so.0.6200.2

--===============5362621549912266202==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.62.1-0.62.2.patch"

From 37fb294702ca45e82b76f53c3b4cd558ef19b515 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 08:24:06 +0000
Subject: [PATCH] vte: upgrade 0.62.1 -> 0.62.2

---
 meta/recipes-support/vte/{vte_0.62.1.bb => vte_0.62.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.62.1.bb => vte_0.62.2.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.62.1.bb b/meta/recipes-support/vte/vte_0.62.2.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.62.1.bb
rename to meta/recipes-support/vte/vte_0.62.2.bb
index 1a8e21dec4..b7e6f0bd8f 100644
--- a/meta/recipes-support/vte/vte_0.62.1.bb
+++ b/meta/recipes-support/vte/vte_0.62.2.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "c369e87c0c8284e09109d0a9aac821f543558f51c0cb9c7acfff3df64153308d"
+SRC_URI[archive.sha256sum] = "b0300bbcf0c02df5812a10a3cb8e4fff723bab92c08c97a0a90c167cf543aff0"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.17.1


--===============5362621549912266202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vte: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/vte/0.62/vte-0.62.1.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://ftp.gnome.org/pub/GNOME/sources/vte/0.62/vte-0.62.2.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-32-poky-linux/vte/libvte: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/libvte: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.6200.1 to libvte-2.91.so.0.6200.2
  /usr/lib/libvte-2.91.so.0.6200.1 moved to /usr/lib/libvte-2.91.so.0.6200.2
packages/core2-32-poky-linux/vte/vte-dbg: PKGSIZE changed from 5507736 to 5508728 (+0%)
packages/core2-32-poky-linux/vte/vte-dbg: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-dbg: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-dev: PKGSIZE changed from 364087 to 364367 (+0%)
packages/core2-32-poky-linux/vte/vte-dev: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-dev: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-doc: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-doc: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-am: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-am: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-an: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-an: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ang: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ang: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ar: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ar: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-as: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-as: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ast: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ast: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-az: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-az: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-be: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-be: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bg: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-bg: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-bn: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bs: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-bs: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ca: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ckb: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-cs: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-cs: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-cy: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-cy: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-da: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-da: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-de: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-de: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-dz: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-dz: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-el: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-el: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-eo: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-eo: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-es: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-es: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-et: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-et: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-eu: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-eu: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fa: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-fa: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fi: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-fi: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fr: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-fr: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fur: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-fur: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ga: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ga: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gd: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-gd: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gl: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-gl: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gu: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-gu: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-he: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-he: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hi: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-hi: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hr: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-hr: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hu: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-hu: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-id: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-id: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-is: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-is: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-it: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-it: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ja: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ja: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ka: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ka: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-kk: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-kk: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-kn: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-kn: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ko: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ko: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ku: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ku: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ky: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ky: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-li: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-li: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-lt: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-lt: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-lv: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-lv: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mai: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-mai: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mi: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-mi: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mjw: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mk: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-mk: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ml: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ml: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mn: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-mn: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mr: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-mr: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ms: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ms: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nb: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nds: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-nds: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ne: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ne: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nl: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-nl: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nn: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-nn: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-oc: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-or: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-or: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pa: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-pa: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pl: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-pl: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-pt: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ro: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ro: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ru: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ru: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-rw: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-rw: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-si: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-si: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sk: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-sk: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sl: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-sl: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sq: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-sq: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-sr: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sv: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-sv: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ta: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ta: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-te: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-te: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-tg: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-tg: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-th: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-th: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-tr: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-tr: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ug: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-ug: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-uk: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-uk: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-vi: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-vi: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-wa: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-wa: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-xh: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-xh: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-prompt: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-prompt: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-src: PKGSIZE changed from 2032684 to 2033851 (+0%)
packages/core2-32-poky-linux/vte/vte-src: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-src: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte-staticdev: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte-staticdev: PKGV changed from 0.62.1 [default] to 0.62.2 [default]
packages/core2-32-poky-linux/vte/vte: PV changed from "0.62.1" to "0.62.2"
packages/core2-32-poky-linux/vte/vte: PKGV changed from 0.62.1 [default] to 0.62.2 [default]

--===============5362621549912266202==--
