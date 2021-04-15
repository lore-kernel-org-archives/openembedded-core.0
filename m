Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1307.1618510599926392070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A9DC038C1297
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bison: upgrading to 3.7.6 SUCCEEDED
Message-ID: <MADEUP.16761AD0C60ECE47.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150495
Content-Type: multipart/mixed; boundary="===============0137962716413160810=="

--===============0137962716413160810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bison* to *3.7.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bison-upgrade-3.7.5-3.7.6.patch
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

--===============0137962716413160810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bison/bison-locale-fi: PKGSIZE changed from 18993 to 33408 (+76%)

--===============0137962716413160810==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-bison-upgrade-3.7.5-3.7.6.patch"

From 0486eaacc867c9b98491b1323e9d697c0f5d7dfd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 03:40:46 +0000
Subject: [PATCH] bison: upgrade 3.7.5 -> 3.7.6

---
 .../bison/{bison_3.7.5.bb => bison_3.7.6.bb}  | 49 ++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.7.5.bb => bison_3.7.6.bb} (37%)

diff --git a/meta/recipes-devtools/bison/bison_3.7.5.bb b/meta/recipes-devtools/bison/bison_3.7.6.bb
similarity index 37%
rename from meta/recipes-devtools/bison/bison_3.7.5.bb
rename to meta/recipes-devtools/bison/bison_3.7.6.bb
index c8bbea4454..97e93110f0 100644
--- a/meta/recipes-devtools/bison/bison_3.7.5.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.6.bb
@@ -1,3 +1,48 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,7 +1,7 @@
+#                      GNU GENERAL PUBLIC LICENSE
+#                         Version 3, 29 June 2007
+#  
+# - Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+# + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -645,7 +645,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License
+# -    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+# +    along with this program.  If not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# @@ -664,11 +664,11 @@
+#    You should also get your employer (if you work as a programmer) or school,
+#  if any, to sign a "copyright disclaimer" for the program, if necessary.
+#  For more information on this, and how to apply and follow the GNU GPL, see
+# -<http://www.gnu.org/licenses/>.
+# +<https://www.gnu.org/licenses/>.
+#  
+#    The GNU General Public License does not permit incorporating your program
+#  into proprietary programs.  If your program is a subroutine library, you
+#  may consider it more useful to permit linking proprietary applications with
+#  the library.  If this is what you want to do, use the GNU Lesser General
+#  Public License instead of this License.  But first, please read
+# -<http://www.gnu.org/philosophy/why-not-lgpl.html>.
+# +<https://www.gnu.org/licenses/why-not-lgpl.html>.
+# 
+#
+
 SUMMARY = "GNU Project parser generator (yacc replacement)"
 DESCRIPTION = "Bison is a general-purpose parser generator that converts an annotated context-free grammar into \
 an LALR(1) or GLR parser for that grammar.  Bison is upward compatible with Yacc: all properly-written Yacc \
@@ -5,7 +50,7 @@ grammars ought to work with Bison with no change. Anyone familiar with Yacc shou
 little trouble."
 HOMEPAGE = "http://www.gnu.org/software/bison/"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
@@ -13,7 +58,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-Use-mapped-file-name-for-symbols.patch \
            "
-SRC_URI[sha256sum] = "e8c53bc5bc396d636622d0f25e31ca92fd53f00b09629f13ef540d564a6b31ab"
+SRC_URI[sha256sum] = "67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.27.0


--===============0137962716413160810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bison/bison-dbg: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-dbg: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-dbg: PKGSIZE changed from 1895552 to 1895704 (+0%)
packages/core2-32-poky-linux/bison/bison-dev: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-dev: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-doc: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-doc: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-doc: PKGSIZE changed from 1031392 to 1035439 (+0%)
packages/core2-32-poky-linux/bison/bison-locale-af: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-af: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-af: PKGSIZE changed from 1371 to 1412 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-ast: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ast: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ast: PKGSIZE changed from 1352 to 1393 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-be: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-be: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-be: PKGSIZE changed from 1762 to 1803 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-bg: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-bg: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-bg: PKGSIZE changed from 42289 to 42029 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-ca: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ca: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ca: PKGSIZE changed from 15795 to 15572 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-cs: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-cs: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-cs: PKGSIZE changed from 2144 to 2185 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-da: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-da: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-da: PKGSIZE changed from 18077 to 17909 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-de: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-de: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-de: PKGSIZE changed from 32938 to 32734 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-el: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-el: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-el: PKGSIZE changed from 37304 to 37062 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-eo: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-eo: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-eo: PKGSIZE changed from 31747 to 31561 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-es: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-es: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-es: PKGSIZE changed from 16598 to 16382 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-et: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-et: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-et: PKGSIZE changed from 29987 to 29799 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-eu: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-eu: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-eu: PKGSIZE changed from 1060 to 1101 (+4%)
packages/core2-32-poky-linux/bison/bison-locale-fi: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-fi: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-fi: PKGSIZE changed from 18993 to 33408 (+76%)
packages/core2-32-poky-linux/bison/bison-locale-fr: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-fr: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-fr: PKGSIZE changed from 33739 to 33514 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-ga: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ga: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ga: PKGSIZE changed from 17479 to 17243 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-gl: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-gl: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-gl: PKGSIZE changed from 3340 to 3422 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-hr: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-hr: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-hr: PKGSIZE changed from 13277 to 13015 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-hu: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-hu: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-hu: PKGSIZE changed from 3624 to 3706 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-ia: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ia: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ia: PKGSIZE changed from 1300 to 1341 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-id: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-id: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-id: PKGSIZE changed from 8391 to 8473 (+1%)
packages/core2-32-poky-linux/bison/bison-locale-it: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-it: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-it: PKGSIZE changed from 9617 to 9740 (+1%)
packages/core2-32-poky-linux/bison/bison-locale-ja: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ja: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ja: PKGSIZE changed from 33097 to 32857 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-ko: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ko: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ko: PKGSIZE changed from 1349 to 1390 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-ky: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ky: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ky: PKGSIZE changed from 1618 to 1659 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-lt: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-lt: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-lt: PKGSIZE changed from 1443 to 1484 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-lv: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-lv: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-lv: PKGSIZE changed from 1473 to 1514 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-ms: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ms: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ms: PKGSIZE changed from 18340 to 18480 (+1%)
packages/core2-32-poky-linux/bison/bison-locale-nb: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-nb: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-nb: PKGSIZE changed from 6532 to 6655 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-nl: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-nl: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-nl: PKGSIZE changed from 20509 to 20331 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-pl: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-pl: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-pl: PKGSIZE changed from 19141 to 18924 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PKGSIZE changed from 32945 to 32754 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-pt: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-pt: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-pt: PKGSIZE changed from 29208 to 29027 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-ro: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ro: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ro: PKGSIZE changed from 6243 to 6366 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-ru: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ru: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ru: PKGSIZE changed from 15513 to 15636 (+1%)
packages/core2-32-poky-linux/bison/bison-locale-rw: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-rw: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-rw: PKGSIZE changed from 540 to 581 (+8%)
packages/core2-32-poky-linux/bison/bison-locale-sk: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-sk: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-sk: PKGSIZE changed from 863 to 904 (+5%)
packages/core2-32-poky-linux/bison/bison-locale-sl: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-sl: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-sl: PKGSIZE changed from 3592 to 3674 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-sq: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-sq: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-sq: PKGSIZE changed from 1337 to 1378 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-sr: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-sr: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-sr: PKGSIZE changed from 41144 to 40906 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-sv: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-sv: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-sv: PKGSIZE changed from 31977 to 31786 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-ta: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-ta: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-ta: PKGSIZE changed from 1905 to 1946 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-th: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-th: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-th: PKGSIZE changed from 2292 to 2333 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-tr: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-tr: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-tr: PKGSIZE changed from 16689 to 16445 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-uk: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-uk: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-uk: PKGSIZE changed from 43417 to 43056 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-vi: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-vi: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-vi: PKGSIZE changed from 18718 to 18480 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PKGSIZE changed from 15381 to 15173 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PKGSIZE changed from 26151 to 25953 (-1%)
packages/core2-32-poky-linux/bison/bison-src: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-src: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison-src: PKGSIZE changed from 2358768 to 2358934 (+0%)
packages/core2-32-poky-linux/bison/bison-staticdev: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison-staticdev: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison/bison: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison/bison: PKGSIZE changed from 1270559 to 1270598 (+0%)
packages/core2-32-poky-linux/bison: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/bison: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/bison: SRC_URI changed from "https://ftp.gnu.org/gnu/bison/bison-3.7.5.tar.xz file://add-with-bisonlocaledir.patch file://0001-Use-mapped-file-name-for-symbols.patch" to "https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz file://add-with-bisonlocaledir.patch file://0001-Use-mapped-file-name-for-symbols.patch"
packages/core2-32-poky-linux/glibc/glibc-src: PKGSIZE changed from 14265030 to 14265031 (+0%)

--===============0137962716413160810==--
