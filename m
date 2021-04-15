Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1351.1618510601697272735
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id CD9B638C13E2
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.68.0 SUCCEEDED
Message-ID: <MADEUP.16761AD12F7748CF.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150542
Content-Type: multipart/mixed; boundary="===============5909916481678967451=="

--===============5909916481678967451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gobject-introspection* to *1.68.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.66.1-1.68.0.patch
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

--===============5909916481678967451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.66.1-1.68.0.patch"

From 8de5c505f65caca740b924d17cc2e6a6492dda00 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 11:48:37 +0000
Subject: [PATCH] gobject-introspection: upgrade 1.66.1 -> 1.68.0

---
 ...pository-directory-for-native-builds.patch |  2 +-
 ...ude-girepo_dep-if-introspection-data.patch | 25 -------------------
 ...6.1.bb => gobject-introspection_1.68.0.bb} |  3 +--
 3 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.66.1.bb => gobject-introspection_1.68.0.bb} (98%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 185ebc154a..9071245a84 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 41c3ee549787333a073a3ce6303efef625c74dce Mon Sep 17 00:00:00 2001
+From 5c606356523431769dffb02fffd2fbca8fb20232 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch
deleted file mode 100644
index 8fba0124cf..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From ef5446af0ddad6a341b47957097ac40c6cb5e6d3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 20 Oct 2020 22:40:14 +0200
-Subject: [PATCH] meson.build: exclude girepo_dep if introspection data is
- disabled
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/248]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 14af2b1..a3c27c3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -283,7 +283,7 @@ pkg.generate(
- # FIXME: meson.override_dependency() and declare_dependency()'s variable arguments
- # are new in Meson 0.54.0, older versions of Meson won't be able to use g-i as
- # subproject anyway
--if meson.version().version_compare('>=0.54.0')
-+if meson.version().version_compare('>=0.54.0') and get_option('build_introspection_data') == true
-   girepo_dep = declare_dependency(
-     sources: typelibs,
-     dependencies: girepo_dep,
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
similarity index 98%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
index ebac8d3a43..4c986a574f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
@@ -15,10 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
-           file://0001-meson.build-exclude-girepo_dep-if-introspection-data.patch \
            "
 
-SRC_URI[sha256sum] = "dd44a55ee5f426ea22b6b89624708f9e8d53f5cc94e5485c15c87cb30e06161d"
+SRC_URI[sha256sum] = "d229242481a201b84a0c66716de1752bca41db4133672cfcfb37c93eb6e54a27"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.27.0


--===============5909916481678967451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-doc: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-locale: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-staticdev: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
Changes to packages/core2-32-poky-linux/gobject-introspection (sysroot):
  /usr/lib/gobject-introspection/giscanner/libtoolimporter.py was removed
Changes to packages/x86_64-linux/gobject-introspection-native (sysroot):
  /usr/lib/gobject-introspection/giscanner/libtoolimporter.py was removed

--===============5909916481678967451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: PKGSIZE changed from 1576600 to 1577120 (+0%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: PV changed from "1.66.1" to "1.68.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: PKGV changed from 1.66.1 [default] to 1.68.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: PKGSIZE changed from 12124346 to 12137478 (+0%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: PV changed from "1.66.1" to "1.68.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: PKGV changed from 1.66.1 [default] to 1.68.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-doc: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-doc: PV changed from "1.66.1" to "1.68.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-doc: PKGV changed from 1.66.1 [default] to 1.68.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-locale: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-locale: PV changed from "1.66.1" to "1.68.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-locale: PKGV changed from 1.66.1 [default] to 1.68.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: PKGSIZE changed from 1450591 to 1450838 (+0%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: PV changed from "1.66.1" to "1.68.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: PKGV changed from 1.66.1 [default] to 1.68.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-staticdev: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-staticdev: PV changed from "1.66.1" to "1.68.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-staticdev: PKGV changed from 1.66.1 [default] to 1.68.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: FILELIST: removed "/usr/lib/gobject-introspection/giscanner/libtoolimporter.py"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: PKGSIZE changed from 1925721 to 1923191 (-0%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: PV changed from "1.66.1" to "1.68.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: PKGV changed from 1.66.1 [default] to 1.68.0 [default]
packages/core2-32-poky-linux/gobject-introspection: PV changed from "1.66.1" to "1.68.0"
packages/core2-32-poky-linux/gobject-introspection: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.66/gobject-introspection-1.66.1.tar.xz file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch file://0001-meson.build-exclude-girepo_dep-if-introspection-data.patch" to "https://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.68/gobject-introspection-1.68.0.tar.xz file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch"
packages/core2-32-poky-linux/gobject-introspection: PKGV changed from 1.66.1 [default] to 1.68.0 [default]
Changes to packages/core2-32-poky-linux/gobject-introspection (sysroot):
  /usr/lib/gobject-introspection/giscanner/libtoolimporter.py was removed
Changes to packages/x86_64-linux/gobject-introspection-native (sysroot):
  /usr/lib/gobject-introspection/giscanner/libtoolimporter.py was removed

--===============5909916481678967451==--
