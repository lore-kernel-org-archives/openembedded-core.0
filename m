Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5219.1613463848596552830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 041DC38C128C
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:12 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-glib: upgrading to 1.6.2 SUCCEEDED
Message-ID: <MADEUP.16642CD336150936.16989@lists.openembedded.org>
X-Groupsio-MsgNum: 148138
Content-Type: multipart/mixed; boundary="===============4781660390051222025=="

--===============4781660390051222025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *json-glib* to *1.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-json-glib-upgrade-1.6.0-1.6.2.patch
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

--===============4781660390051222025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/json-glib: PACKAGES: added "json-glib-locale-be"
Changes to packages/core2-32-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.600.0 to libjson-glib-1.0.so.0.600.2
  /usr/lib/libjson-glib-1.0.so.0.600.0 moved to /usr/lib/libjson-glib-1.0.so.0.600.2

--===============4781660390051222025==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-json-glib-upgrade-1.6.0-1.6.2.patch"

From 6bf1d8bd5fe2869b7e8b2b96499758b42e95c844 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 02:07:30 +0000
Subject: [PATCH] json-glib: upgrade 1.6.0 -> 1.6.2

---
 ...num-types.c.in-fix-build-reproducibi.patch | 30 -------------------
 ...{json-glib_1.6.0.bb => json-glib_1.6.2.bb} |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch
 rename meta/recipes-gnome/json-glib/{json-glib_1.6.0.bb => json-glib_1.6.2.bb} (85%)

diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch b/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch
deleted file mode 100644
index 0eb7244186..0000000000
--- a/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0f06c4cb4a57083c08312144b03c8346cf620be6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Oct 2020 22:15:29 +0000
-Subject: [PATCH] json-glib/json-enum-types.c.in: fix build reproducibility
-
-Changes the comment and include to reference the file basename
-instead of the full path. This ensures that the generated file is
-reproducible when it is included in source packages meant for debugging.
-
-Upstream-Status: Backport [6f3842abd5dff68b6ee5f2ef48a4ebf1cbebf434]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- json-glib/json-enum-types.c.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/json-glib/json-enum-types.c.in b/json-glib/json-enum-types.c.in
-index da07c46..7b39290 100644
---- a/json-glib/json-enum-types.c.in
-+++ b/json-glib/json-enum-types.c.in
-@@ -9,8 +9,8 @@
- 
- /*** BEGIN file-production ***/
- 
--/* enumerations from "@filename@" */
--#include "@filename@"
-+/* enumerations from "@basename@" */
-+#include "@basename@"
- 
- /*** END file-production ***/
- 
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.2.bb
similarity index 85%
rename from meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.6.2.bb
index 59b0609900..fdf3b245e8 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.2.bb
@@ -19,9 +19,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
-SRC_URI += "file://run-ptest \
-            file://0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch"
-SRC_URI[archive.sha256sum] = "0d7c67602c4161ea7070fab6c5823afd9bd7f7bc955f652a50d3753b08494e73"
+SRC_URI += " file://run-ptest"
+SRC_URI[archive.sha256sum] = "a33d66c6d038bda46b910c6c6d59c4e15db014e363dc997a0414c2e07d134f24"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-- 
2.17.1


--===============4781660390051222025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/json-glib/json-glib-bin: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-bin: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-dbg: PKGSIZE changed from 845728 to 847488 (+0%)
packages/core2-32-poky-linux/json-glib/json-glib-dbg: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-dbg: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-dev: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-dev: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-doc: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-doc: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-as: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-as: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-bg: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-bg: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-bn-in: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-bn-in: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-bs: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-bs: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ca+valencia: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ca+valencia: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ca: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ca: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-cs: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-cs: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-da: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-da: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-de: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-de: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-el: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-el: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-en-gb: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-en-gb: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-eo: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-eo: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-es: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-es: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-et: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-et: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-eu: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-eu: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-fr: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-fr: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-fur: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-fur: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-gl: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-gl: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-he: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-he: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-hi: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-hi: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-hr: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-hr: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-hu: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-hu: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-id: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-id: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-it: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-it: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ja: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ja: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ko: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ko: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ky: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ky: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-lt: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-lt: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-lv: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-lv: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ml: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ml: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ms: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ms: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-nb: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-nb: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ne: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ne: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-nl: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-nl: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-oc: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-oc: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-or: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-or: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-pa: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-pa: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-pl: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-pl: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-pt-br: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-pt-br: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-pt: PKGSIZE changed from 5234 to 5448 (+4%)
packages/core2-32-poky-linux/json-glib/json-glib-locale-pt: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-pt: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ro: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ro: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ru: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ru: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-sk: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-sk: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-sl: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-sl: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-sr+latin: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-sr+latin: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-sr: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-sr: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-sv: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-sv: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-te: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-te: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-tg: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-tg: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-tr: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-tr: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-ug: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-ug: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-uk: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-uk: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-vi: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-vi: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-zh-cn: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-zh-cn: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-zh-hk: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-zh-hk: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-locale-zh-tw: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-locale-zh-tw: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-ptest: PKGSIZE changed from 299805 to 299849 (+0%)
packages/core2-32-poky-linux/json-glib/json-glib-ptest: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-ptest: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-src: PKGSIZE changed from 610442 to 612723 (+0%)
packages/core2-32-poky-linux/json-glib/json-glib-src: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-src: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib-staticdev: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib-staticdev: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib/json-glib: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib/json-glib: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/json-glib: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/json-glib/1.6/json-glib-1.6.0.tar.xz;name=archive file://run-ptest file://0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch" to "https://ftp.gnome.org/pub/GNOME/sources/json-glib/1.6/json-glib-1.6.2.tar.xz;name=archive file://run-ptest"
packages/core2-32-poky-linux/json-glib: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/json-glib: PACKAGES: added "json-glib-locale-be"
packages/core2-32-poky-linux/json-glib: PV changed from "1.6.0" to "1.6.2"
Changes to packages/core2-32-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.600.0 to libjson-glib-1.0.so.0.600.2
  /usr/lib/libjson-glib-1.0.so.0.600.0 moved to /usr/lib/libjson-glib-1.0.so.0.600.2

--===============4781660390051222025==--
