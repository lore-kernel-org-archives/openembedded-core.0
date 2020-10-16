Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12524.1602843683381519813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id B628638C17A9
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.50.1 SUCCEEDED
Message-ID: <MADEUP.163E71D6BF6507E6.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143448
Content-Type: multipart/mixed; boundary="===============1531531738829914669=="

--===============1531531738829914669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.50.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.48.9-0.50.1.patch
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

--===============1531531738829914669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vala (sysroot):
  /usr/bin/valac changed symlink target from valac-0.48 to valac-0.50
  /usr/bin/vala-gen-introspect changed symlink target from vala-gen-introspect-0.48 to vala-gen-introspect-0.50
  /usr/bin/vala changed symlink target from vala-0.48 to vala-0.50
  /usr/bin/vapigen changed symlink target from vapigen-0.48 to vapigen-0.50
  /usr/lib/pkgconfig/vapigen.pc changed symlink target from vapigen-0.48.pc to vapigen-0.50.pc
  /usr/lib/vala-0.48/gen-introspect-0.48 moved to /usr/lib/vala-0.50/gen-introspect-0.50
  /usr/bin/vala-0.48 moved to /usr/bin/vala-0.50
  /usr/bin/valac-0.48 moved to /usr/bin/valac-0.50
  /usr/bin/vala-gen-introspect-0.48 moved to /usr/bin/vala-gen-introspect-0.50
  /usr/bin/vapigen-0.48 moved to /usr/bin/vapigen-0.50
  /usr/include/vala-0.48 moved to /usr/include/vala-0.50
  /usr/lib/libvala-0.48.so.0.0.0 moved to /usr/lib/libvala-0.50.so.0.0.0
  /usr/lib/libvala-0.48.so.0 moved to /usr/lib/libvala-0.50.so.0
  /usr/lib/libvala-0.48.so moved to /usr/lib/libvala-0.50.so
  /usr/lib/pkgconfig/libvala-0.48.pc moved to /usr/lib/pkgconfig/libvala-0.50.pc
  /usr/lib/pkgconfig/vapigen-0.48.pc moved to /usr/lib/pkgconfig/vapigen-0.50.pc
  /usr/lib/vala-0.48 moved to /usr/lib/vala-0.50
  /usr/share/vala-0.48 moved to /usr/share/vala-0.50
  /usr/share/vala/vapi/libvala-0.48.vapi moved to /usr/share/vala/vapi/libvala-0.50.vapi
packages/core2-32-poky-linux/vala/vala-dev: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/bin/vapigen-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/bin/valac-0.48 /usr/lib/libvala-0.48.so.0.0.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/share/vala/vapi/libvala-0.48.vapi /usr/lib/vala-0.48/libvalaccodegen.so", added "/usr/lib/libvala-0.50.so.0 /usr/bin/vala-0.50 /usr/bin/valac-0.50 /usr/lib/libvala-0.50.so.0.0.0 /usr/lib/vala-0.50/gen-introspect-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/lib/vala-0.50/libvalaccodegen.so"
packages/core2-32-poky-linux/vala/vala-doc: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/bin/vapigen-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/bin/valac-0.48 /usr/lib/libvala-0.48.so.0.0.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/share/vala/vapi/libvala-0.48.vapi /usr/lib/vala-0.48/libvalaccodegen.so", added "/usr/lib/libvala-0.50.so.0 /usr/bin/vala-0.50 /usr/bin/valac-0.50 /usr/lib/libvala-0.50.so.0.0.0 /usr/lib/vala-0.50/gen-introspect-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/lib/vala-0.50/libvalaccodegen.so"
packages/core2-32-poky-linux/vala/vala-locale: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/bin/vapigen-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/bin/valac-0.48 /usr/lib/libvala-0.48.so.0.0.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/share/vala/vapi/libvala-0.48.vapi /usr/lib/vala-0.48/libvalaccodegen.so", added "/usr/lib/libvala-0.50.so.0 /usr/bin/vala-0.50 /usr/bin/valac-0.50 /usr/lib/libvala-0.50.so.0.0.0 /usr/lib/vala-0.50/gen-introspect-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/lib/vala-0.50/libvalaccodegen.so"
packages/core2-32-poky-linux/vala/vala-staticdev: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/bin/vapigen-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/bin/valac-0.48 /usr/lib/libvala-0.48.so.0.0.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/share/vala/vapi/libvala-0.48.vapi /usr/lib/vala-0.48/libvalaccodegen.so", added "/usr/lib/libvala-0.50.so.0 /usr/bin/vala-0.50 /usr/bin/valac-0.50 /usr/lib/libvala-0.50.so.0.0.0 /usr/lib/vala-0.50/gen-introspect-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/lib/vala-0.50/libvalaccodegen.so"
packages/core2-32-poky-linux/vala/vala: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/bin/vapigen-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/bin/valac-0.48 /usr/lib/libvala-0.48.so.0.0.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/share/vala/vapi/libvala-0.48.vapi /usr/lib/vala-0.48/libvalaccodegen.so", added "/usr/lib/libvala-0.50.so.0 /usr/bin/vala-0.50 /usr/bin/valac-0.50 /usr/lib/libvala-0.50.so.0.0.0 /usr/lib/vala-0.50/gen-introspect-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/lib/vala-0.50/libvalaccodegen.so"
Changes to packages/x86_64-linux/vala-native (sysroot):
  /usr/bin/valac changed symlink target from valac-0.48 to valac-0.50
  /usr/bin/vala-gen-introspect changed symlink target from vala-gen-introspect-0.48 to vala-gen-introspect-0.50
  /usr/bin/vala changed symlink target from vala-0.48 to vala-0.50
  /usr/bin/vapigen changed symlink target from vapigen-0.48 to vapigen-0.50
  /usr/lib/vala-0.48/gen-introspect-0.48 moved to /usr/lib/vala-0.50/gen-introspect-0.50
  /usr/bin/vala-0.48 moved to /usr/bin/vala-0.50
  /usr/bin/valac-0.48 moved to /usr/bin/valac-0.50
  /usr/bin/vala-gen-introspect-0.48 moved to /usr/bin/vala-gen-introspect-0.50
  /usr/bin/vapigen-0.48 moved to /usr/bin/vapigen-0.50
  /usr/include/vala-0.48 moved to /usr/include/vala-0.50
  /usr/lib/libvala-0.48.so.0.0.0 moved to /usr/lib/libvala-0.50.so.0.0.0
  /usr/lib/libvala-0.48.so.0 moved to /usr/lib/libvala-0.50.so.0
  /usr/lib/libvala-0.48.so moved to /usr/lib/libvala-0.50.so
  /usr/lib/pkgconfig/libvala-0.48.pc moved to /usr/lib/pkgconfig/libvala-0.50.pc
  /usr/lib/pkgconfig/vapigen-0.48.pc moved to /usr/lib/pkgconfig/vapigen-0.50.pc
  /usr/lib/vala-0.48 moved to /usr/lib/vala-0.50
  /usr/share/vala-0.48 moved to /usr/share/vala-0.50
  /usr/share/vala/vapi/libvala-0.48.vapi moved to /usr/share/vala/vapi/libvala-0.50.vapi

--===============1531531738829914669==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.48.9-0.50.1.patch"

From a64f49024e00b12ee88d1c62b28b702ed16a73b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 05:42:15 +0000
Subject: [PATCH] vala: upgrade 0.48.9 -> 0.50.1

---
 meta/recipes-devtools/vala/{vala_0.48.9.bb => vala_0.50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.48.9.bb => vala_0.50.1.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.48.9.bb b/meta/recipes-devtools/vala/vala_0.50.1.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.48.9.bb
rename to meta/recipes-devtools/vala/vala_0.50.1.bb
index 09bfcd6474..cca7eef523 100644
--- a/meta/recipes-devtools/vala/vala_0.48.9.bb
+++ b/meta/recipes-devtools/vala/vala_0.50.1.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "9cea16d3bb3daddbfe0556b99fbfa08146230db7651e1e674cd08b4df5cefea9"
+SRC_URI[sha256sum] = "958d9f06c9c3d7d1b2145512a9bc2a7c6aefbbf0416a04c7a0ecf463f7138f6c"
-- 
2.18.4


--===============1531531738829914669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PKGV changed from 0.48.9 [default] to 0.50.1 [default]
packages/core2-32-poky-linux/vala: PV changed from "0.48.9" to "0.50.1"
Changes to packages/core2-32-poky-linux/vala (sysroot):
  /usr/bin/valac changed symlink target from valac-0.48 to valac-0.50
  /usr/bin/vala-gen-introspect changed symlink target from vala-gen-introspect-0.48 to vala-gen-introspect-0.50
  /usr/bin/vala changed symlink target from vala-0.48 to vala-0.50
  /usr/bin/vapigen changed symlink target from vapigen-0.48 to vapigen-0.50
  /usr/lib/pkgconfig/vapigen.pc changed symlink target from vapigen-0.48.pc to vapigen-0.50.pc
  /usr/lib/vala-0.48/gen-introspect-0.48 moved to /usr/lib/vala-0.50/gen-introspect-0.50
  /usr/bin/vala-0.48 moved to /usr/bin/vala-0.50
  /usr/bin/valac-0.48 moved to /usr/bin/valac-0.50
  /usr/bin/vala-gen-introspect-0.48 moved to /usr/bin/vala-gen-introspect-0.50
  /usr/bin/vapigen-0.48 moved to /usr/bin/vapigen-0.50
  /usr/include/vala-0.48 moved to /usr/include/vala-0.50
  /usr/lib/libvala-0.48.so.0.0.0 moved to /usr/lib/libvala-0.50.so.0.0.0
  /usr/lib/libvala-0.48.so.0 moved to /usr/lib/libvala-0.50.so.0
  /usr/lib/libvala-0.48.so moved to /usr/lib/libvala-0.50.so
  /usr/lib/pkgconfig/libvala-0.48.pc moved to /usr/lib/pkgconfig/libvala-0.50.pc
  /usr/lib/pkgconfig/vapigen-0.48.pc moved to /usr/lib/pkgconfig/vapigen-0.50.pc
  /usr/lib/vala-0.48 moved to /usr/lib/vala-0.50
  /usr/share/vala-0.48 moved to /usr/share/vala-0.50
  /usr/share/vala/vapi/libvala-0.48.vapi moved to /usr/share/vala/vapi/libvala-0.50.vapi
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.48.9 [default] to 0.50.1 [default]
packages/core2-32-poky-linux/vala/vala-dbg: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/valac-0.48 /usr/bin/vapigen-0.48 /usr/lib/vala-0.48/libvalaccodegen.so /usr/share/vala/vapi/libvala-0.48.vapi /usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/lib/libvala-0.48.so.0.0.0", added "/usr/lib/vala-0.50/gen-introspect-0.50 /usr/lib/libvala-0.50.so.0 /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/bin/valac-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-0.50 /usr/lib/vala-0.50/libvalaccodegen.so /usr/lib/libvala-0.50.so.0.0.0"
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 17942536 to 18354936 (+2%)
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.48.9" to "0.50.1"
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.48.9 [default] to 0.50.1 [default]
packages/core2-32-poky-linux/vala/vala-dev: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/valac-0.48 /usr/bin/vapigen-0.48 /usr/lib/vala-0.48/libvalaccodegen.so /usr/share/vala/vapi/libvala-0.48.vapi /usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/lib/libvala-0.48.so.0.0.0", added "/usr/lib/vala-0.50/gen-introspect-0.50 /usr/lib/libvala-0.50.so.0 /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/bin/valac-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-0.50 /usr/lib/vala-0.50/libvalaccodegen.so /usr/lib/libvala-0.50.so.0.0.0"
packages/core2-32-poky-linux/vala/vala-dev: PKGSIZE changed from 416077 to 411690 (-1%)
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.48.9" to "0.50.1"
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.48.9 [default] to 0.50.1 [default]
packages/core2-32-poky-linux/vala/vala-doc: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/valac-0.48 /usr/bin/vapigen-0.48 /usr/lib/vala-0.48/libvalaccodegen.so /usr/share/vala/vapi/libvala-0.48.vapi /usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/lib/libvala-0.48.so.0.0.0", added "/usr/lib/vala-0.50/gen-introspect-0.50 /usr/lib/libvala-0.50.so.0 /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/bin/valac-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-0.50 /usr/lib/vala-0.50/libvalaccodegen.so /usr/lib/libvala-0.50.so.0.0.0"
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 9655 to 9715 (+1%)
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.48.9" to "0.50.1"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.48.9 [default] to 0.50.1 [default]
packages/core2-32-poky-linux/vala/vala-locale: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/valac-0.48 /usr/bin/vapigen-0.48 /usr/lib/vala-0.48/libvalaccodegen.so /usr/share/vala/vapi/libvala-0.48.vapi /usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/lib/libvala-0.48.so.0.0.0", added "/usr/lib/vala-0.50/gen-introspect-0.50 /usr/lib/libvala-0.50.so.0 /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/bin/valac-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-0.50 /usr/lib/vala-0.50/libvalaccodegen.so /usr/lib/libvala-0.50.so.0.0.0"
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.48.9" to "0.50.1"
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.48.9 [default] to 0.50.1 [default]
packages/core2-32-poky-linux/vala/vala-src: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/valac-0.48 /usr/bin/vapigen-0.48 /usr/lib/vala-0.48/libvalaccodegen.so /usr/share/vala/vapi/libvala-0.48.vapi /usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/lib/libvala-0.48.so.0.0.0", added "/usr/lib/vala-0.50/gen-introspect-0.50 /usr/lib/libvala-0.50.so.0 /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/bin/valac-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-0.50 /usr/lib/vala-0.50/libvalaccodegen.so /usr/lib/libvala-0.50.so.0.0.0"
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 14820853 to 15071894 (+2%)
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.48.9" to "0.50.1"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.48.9 [default] to 0.50.1 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/valac-0.48 /usr/bin/vapigen-0.48 /usr/lib/vala-0.48/libvalaccodegen.so /usr/share/vala/vapi/libvala-0.48.vapi /usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/lib/libvala-0.48.so.0.0.0", added "/usr/lib/vala-0.50/gen-introspect-0.50 /usr/lib/libvala-0.50.so.0 /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/bin/valac-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-0.50 /usr/lib/vala-0.50/libvalaccodegen.so /usr/lib/libvala-0.50.so.0.0.0"
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.48.9" to "0.50.1"
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.48.9 [default] to 0.50.1 [default]
packages/core2-32-poky-linux/vala/vala: FILELIST: directory renamed /usr/share/vala-0.48/vapi -> /usr/share/vala-0.50/vapi, removed "/usr/bin/valac-0.48 /usr/bin/vapigen-0.48 /usr/lib/vala-0.48/libvalaccodegen.so /usr/share/vala/vapi/libvala-0.48.vapi /usr/bin/vala-0.48 /usr/lib/libvala-0.48.so.0 /usr/lib/vala-0.48/gen-introspect-0.48 /usr/bin/vala-gen-introspect-0.48 /usr/lib/libvala-0.48.so.0.0.0", added "/usr/lib/vala-0.50/gen-introspect-0.50 /usr/lib/libvala-0.50.so.0 /usr/bin/vala-gen-introspect-0.50 /usr/bin/vapigen-0.50 /usr/bin/valac-0.50 /usr/share/vala/vapi/libvala-0.50.vapi /usr/bin/vala-0.50 /usr/lib/vala-0.50/libvalaccodegen.so /usr/lib/libvala-0.50.so.0.0.0"
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 12148688 to 12199713 (+0%)
packages/core2-32-poky-linux/vala/vala: PV changed from "0.48.9" to "0.50.1"
packages/core2-32-poky-linux/vala/vala: FILES: removed "/usr/share/vala-0.48/vapi /usr/lib/vala-0.48/", added "/usr/lib/vala-0.50/ /usr/share/vala-0.50/vapi"
Changes to packages/x86_64-linux/vala-native (sysroot):
  /usr/bin/valac changed symlink target from valac-0.48 to valac-0.50
  /usr/bin/vala-gen-introspect changed symlink target from vala-gen-introspect-0.48 to vala-gen-introspect-0.50
  /usr/bin/vala changed symlink target from vala-0.48 to vala-0.50
  /usr/bin/vapigen changed symlink target from vapigen-0.48 to vapigen-0.50
  /usr/lib/vala-0.48/gen-introspect-0.48 moved to /usr/lib/vala-0.50/gen-introspect-0.50
  /usr/bin/vala-0.48 moved to /usr/bin/vala-0.50
  /usr/bin/valac-0.48 moved to /usr/bin/valac-0.50
  /usr/bin/vala-gen-introspect-0.48 moved to /usr/bin/vala-gen-introspect-0.50
  /usr/bin/vapigen-0.48 moved to /usr/bin/vapigen-0.50
  /usr/include/vala-0.48 moved to /usr/include/vala-0.50
  /usr/lib/libvala-0.48.so.0.0.0 moved to /usr/lib/libvala-0.50.so.0.0.0
  /usr/lib/libvala-0.48.so.0 moved to /usr/lib/libvala-0.50.so.0
  /usr/lib/libvala-0.48.so moved to /usr/lib/libvala-0.50.so
  /usr/lib/pkgconfig/libvala-0.48.pc moved to /usr/lib/pkgconfig/libvala-0.50.pc
  /usr/lib/pkgconfig/vapigen-0.48.pc moved to /usr/lib/pkgconfig/vapigen-0.50.pc
  /usr/lib/vala-0.48 moved to /usr/lib/vala-0.50
  /usr/share/vala-0.48 moved to /usr/share/vala-0.50
  /usr/share/vala/vapi/libvala-0.48.vapi moved to /usr/share/vala/vapi/libvala-0.50.vapi

--===============1531531738829914669==--
