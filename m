Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.1363.1618510600238628654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id C0A5538C1241
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcr: upgrading to 3.40.0 SUCCEEDED
Message-ID: <MADEUP.16761AD125A060BD.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150541
Content-Type: multipart/mixed; boundary="===============0750380818197600845=="

--===============0750380818197600845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcr* to *3.40.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gcr-upgrade-3.38.1-3.40.0.patch
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

--===============0750380818197600845==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gcr-upgrade-3.38.1-3.40.0.patch"

From ffd3bdb0a82bbf9542f629b6290f8d7698569a08 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 11:39:45 +0000
Subject: [PATCH] gcr: upgrade 3.38.1 -> 3.40.0

---
 meta/recipes-gnome/gcr/{gcr_3.38.1.bb => gcr_3.40.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_3.38.1.bb => gcr_3.40.0.bb} (93%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.38.1.bb b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
similarity index 93%
rename from meta/recipes-gnome/gcr/gcr_3.38.1.bb
rename to meta/recipes-gnome/gcr/gcr_3.40.0.bb
index 563087a360..64a1195aab 100644
--- a/meta/recipes-gnome/gcr/gcr_3.38.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -17,7 +17,7 @@ GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 
-SRC_URI[archive.sha256sum] = "17fcaf9c4a93a65fb1c72b82643bb102c13344084687d5886ea66313868d9ec9"
+SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "-Dgtk=true,-Dgtk=false,gtk+3"
-- 
2.27.0


--===============0750380818197600845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gcr/gcr-dbg: PKGSIZE changed from 3128616 to 3136640 (+0%)
packages/core2-32-poky-linux/gcr/gcr-dbg: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-dbg: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-dev: PKGSIZE changed from 1524632 to 1524780 (+0%)
packages/core2-32-poky-linux/gcr/gcr-dev: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-dev: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-doc: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-doc: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-af: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-af: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ar: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ar: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-as: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-as: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ast: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ast: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-az: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-az: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-be+latin: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-be+latin: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-be: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-be: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bg: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-bg: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bn-in: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-bn-in: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bn: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-bn: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bs: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-bs: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ca+valencia: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ca+valencia: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ca: PKGSIZE changed from 17389 to 17397 (+0%)
packages/core2-32-poky-linux/gcr/gcr-locale-ca: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ca: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ckb: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ckb: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-cs: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-cs: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-cy: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-cy: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-da: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-da: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-de: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-de: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-dz: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-dz: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-el: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-el: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-en+shaw: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-en+shaw: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-en-ca: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-en-ca: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-en-gb: PKGSIZE changed from 16238 to 16406 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-en-gb: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-en-gb: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-eo: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-eo: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-es: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-es: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-et: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-et: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-eu: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-eu: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fa: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-fa: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fi: PKGSIZE changed from 12343 to 13439 (+9%)
packages/core2-32-poky-linux/gcr/gcr-locale-fi: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-fi: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fr: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-fr: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fur: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-fur: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ga: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ga: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-gl: PKGSIZE changed from 17319 to 17326 (+0%)
packages/core2-32-poky-linux/gcr/gcr-locale-gl: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-gl: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-gu: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-gu: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-he: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-he: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-hi: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-hi: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-hr: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-hr: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-hu: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-hu: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-id: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-id: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-is: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-is: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-it: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-it: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ja: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ja: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ka: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ka: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-kk: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-kk: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-kn: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-kn: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ko: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ko: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-lt: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-lt: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-lv: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-lv: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mai: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mai: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mg: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mg: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mk: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mk: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ml: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ml: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mn: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mn: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mr: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mr: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ms: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ms: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-nb: PKGSIZE changed from 15875 to 16831 (+6%)
packages/core2-32-poky-linux/gcr/gcr-locale-nb: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-nb: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ne: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ne: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-nl: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-nl: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-nn: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-nn: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-oc: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-oc: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-or: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-or: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pa: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-pa: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pl: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-pl: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pt-br: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-pt-br: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pt: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-pt: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ro: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ro: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ru: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ru: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-rw: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-rw: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-si: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-si: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sk: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sk: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sl: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sl: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sq: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sq: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sr+latin: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sr+latin: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sr: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sr: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sv: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sv: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ta: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ta: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-te: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-te: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-tg: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-tg: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-th: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-th: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-tr: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-tr: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ug: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ug: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-uk: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-uk: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-vi: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-vi: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-xh: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-xh: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-zh-cn: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-zh-cn: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-zh-hk: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-zh-hk: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-zh-tw: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-locale-zh-tw: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-src: PKGSIZE changed from 2458814 to 2449592 (-0%)
packages/core2-32-poky-linux/gcr/gcr-src: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-src: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr-staticdev: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr-staticdev: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr/gcr: PKGSIZE changed from 1571359 to 1563213 (-1%)
packages/core2-32-poky-linux/gcr/gcr: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr/gcr: PKGV changed from 3.38.1 [default] to 3.40.0 [default]
packages/core2-32-poky-linux/gcr: PV changed from "3.38.1" to "3.40.0"
packages/core2-32-poky-linux/gcr: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/gcr/3.38/gcr-3.38.1.tar.xz;name=archive" to "https://ftp.gnome.org/pub/GNOME/sources/gcr/3.40/gcr-3.40.0.tar.xz;name=archive"
packages/core2-32-poky-linux/gcr: PKGV changed from 3.38.1 [default] to 3.40.0 [default]

--===============0750380818197600845==--
