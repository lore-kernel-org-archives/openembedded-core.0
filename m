Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.702.1610713822889946820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 481F238C13A8
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.5p1 SUCCEEDED
Message-ID: <MADEUP.165A67B05FCA60D6.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146785
Content-Type: multipart/mixed; boundary="===============8704541459339462337=="

--===============8704541459339462337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.5p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.4p1-1.9.5p1.patch
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

--===============8704541459339462337==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.4p1-1.9.5p1.patch"

From 24bb2eb3a4005b1af02e082b49da97f84785e343 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 06:58:50 +0000
Subject: [PATCH] sudo: upgrade 1.9.4p1 -> 1.9.5p1

---
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../sudo/{sudo_1.9.4p1.bb => sudo_1.9.5p1.bb} | 23 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.4p1.bb => sudo_1.9.5p1.bb} (73%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 86a18be7e2..97ecabe0fc 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=828cd502ad216ff869bf83adf3301e02 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=fdff64d4fd19126330aa81b94d167173 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.4p1.bb b/meta/recipes-extended/sudo/sudo_1.9.5p1.bb
similarity index 73%
rename from meta/recipes-extended/sudo/sudo_1.9.4p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.5p1.bb
index 6b5a1ce752..45bac85108 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.4p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.5p1.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- doc/LICENSE
+# +++ doc/LICENSE
+# @@ -1,6 +1,6 @@
+#  Sudo is distributed under the following license:
+#  
+# -   Copyright (c) 1994-1996, 1998-2020
+# +   Copyright (c) 1994-1996, 1998-2021
+#          Todd C. Miller <Todd.Miller@sudo.ws>
+#  
+#     Permission to use, copy, modify, and distribute this software for any
+# 
+#
+
 require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
@@ -7,7 +28,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "1172099dfcdd2fa497e13a3c274a9f5920abd36ae7d2f7aaacd6bc6bc92fd677"
+SRC_URI[sha256sum] = "4dddf37c22653defada299e5681e0daef54bb6f5fc950f63997bb8eb966b7882"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.27.0


--===============8704541459339462337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.4p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.5p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/core2-32-poky-linux/sudo: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 3681976 to 3688780 (+0%)
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-dev: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 642027 to 645840 (+1%)
packages/core2-32-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-lib: PKGSIZE changed from 822632 to 822664 (+0%)
packages/core2-32-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-lib: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGSIZE changed from 87612 to 87622 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGSIZE changed from 86140 to 86900 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGSIZE changed from 87710 to 90457 (+3%)
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGSIZE changed from 108336 to 111683 (+3%)
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGSIZE changed from 81556 to 84153 (+3%)
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-src: PKGSIZE changed from 2320229 to 2330953 (+0%)
packages/core2-32-poky-linux/sudo/sudo-src: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo-sudo: PV changed from "1.9.4p1" to "1.9.5p1"
packages/core2-32-poky-linux/sudo/sudo: PKGSIZE changed from 1042160 to 1038128 (-0%)
packages/core2-32-poky-linux/sudo/sudo: PKGV changed from 1.9.4p1 [default] to 1.9.5p1 [default]
packages/core2-32-poky-linux/sudo/sudo: PV changed from "1.9.4p1" to "1.9.5p1"

--===============8704541459339462337==--
