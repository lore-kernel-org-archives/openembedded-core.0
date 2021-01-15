Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.671.1610713822567044692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id D7B0038C11CA
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] socat: upgrading to 1.7.4.1 SUCCEEDED
Message-ID: <MADEUP.165A67B0133F2855.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146747
Content-Type: multipart/mixed; boundary="===============3838530901904315327=="

--===============3838530901904315327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *socat* to *1.7.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-socat-upgrade-1.7.3.4-1.7.4.1.patch
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

--===============3838530901904315327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-socat-upgrade-1.7.3.4-1.7.4.1.patch"

From e54a099b2f0231c5c9693383898b040a1ef8304a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 03:39:16 +0000
Subject: [PATCH] socat: upgrade 1.7.3.4 -> 1.7.4.1

---
 .../{socat_1.7.3.4.bb => socat_1.7.4.1.bb}    | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.7.3.4.bb => socat_1.7.4.1.bb} (56%)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.4.bb b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
similarity index 56%
rename from meta/recipes-connectivity/socat/socat_1.7.3.4.bb
rename to meta/recipes-connectivity/socat/socat_1.7.4.1.bb
index f3f569d262..a98b379736 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
@@ -1,3 +1,36 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README
+# +++ README
+# @@ -1,3 +1,9 @@
+# +smoothly also under RedHat Linux. After yodl 1.31 installation, the following
+# +correction must be performed in /usr/share/yodl/shared.yo in two places:
+# +< whenhtml(htmlcommand(<!)ARG1+htmlcommand(>)))
+# +> whenhtml(htmlcommand(<!--)ARG1+htmlcommand(-->)))
+# +
+# +
+#  license
+#  -------
+#  
+# @@ -23,9 +29,3 @@
+#  
+#      This program is distributed in the hope that it will be useful,
+#      but WITHOUT ANY WARRANTY; without even the implied warranty of
+# -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# -    GNU General Public License for more details.
+# -
+# -    You should have received a copy of the GNU General Public License
+# -    along with this program; if not, write to the Free Software
+# -    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+# 
+#
+
 SUMMARY = "Multipurpose relay for bidirectional data transfer"
 DESCRIPTION = "Socat is a relay for bidirectional data \
 transfer between two independent data channels."
@@ -7,13 +40,13 @@ SECTION = "console/network"
 
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86 \
+                    "
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "3cca4f8cd9d2d1caabd9cc099451bac9"
-SRC_URI[sha256sum] = "972374ca86f65498e23e3259c2ee1b8f9dbeb04d12c2a78c0c9b5d1cb97dfdfc"
+SRC_URI[sha256sum] = "3faca25614e89123dff5045680549ecef519d02e331aaf3c4f5a8f6837c675e9"
 
 inherit autotools
 
-- 
2.27.0


--===============3838530901904315327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/socat: SRC_URI changed from "http://www.dest-unreach.org/socat/download/socat-1.7.3.4.tar.bz2" to "http://www.dest-unreach.org/socat/download/socat-1.7.4.1.tar.bz2"
packages/core2-32-poky-linux/socat: PKGV changed from 1.7.3.4 [default] to 1.7.4.1 [default]
packages/core2-32-poky-linux/socat: PV changed from "1.7.3.4" to "1.7.4.1"
packages/core2-32-poky-linux/socat/socat-dbg: PKGV changed from 1.7.3.4 [default] to 1.7.4.1 [default]
packages/core2-32-poky-linux/socat/socat-dbg: PKGSIZE changed from 1352344 to 1427716 (+6%)
packages/core2-32-poky-linux/socat/socat-dbg: PV changed from "1.7.3.4" to "1.7.4.1"
packages/core2-32-poky-linux/socat/socat-dev: PKGV changed from 1.7.3.4 [default] to 1.7.4.1 [default]
packages/core2-32-poky-linux/socat/socat-dev: PV changed from "1.7.3.4" to "1.7.4.1"
packages/core2-32-poky-linux/socat/socat-doc: PKGV changed from 1.7.3.4 [default] to 1.7.4.1 [default]
packages/core2-32-poky-linux/socat/socat-doc: PKGSIZE changed from 131443 to 140340 (+7%)
packages/core2-32-poky-linux/socat/socat-doc: PV changed from "1.7.3.4" to "1.7.4.1"
packages/core2-32-poky-linux/socat/socat-locale: PKGV changed from 1.7.3.4 [default] to 1.7.4.1 [default]
packages/core2-32-poky-linux/socat/socat-locale: PV changed from "1.7.3.4" to "1.7.4.1"
packages/core2-32-poky-linux/socat/socat-src: PKGV changed from 1.7.3.4 [default] to 1.7.4.1 [default]
packages/core2-32-poky-linux/socat/socat-src: PKGSIZE changed from 974822 to 1056238 (+8%)
packages/core2-32-poky-linux/socat/socat-src: PV changed from "1.7.3.4" to "1.7.4.1"
packages/core2-32-poky-linux/socat/socat-staticdev: PKGV changed from 1.7.3.4 [default] to 1.7.4.1 [default]
packages/core2-32-poky-linux/socat/socat-staticdev: PV changed from "1.7.3.4" to "1.7.4.1"
packages/core2-32-poky-linux/socat/socat: PKGV changed from 1.7.3.4 [default] to 1.7.4.1 [default]
packages/core2-32-poky-linux/socat/socat: PKGSIZE changed from 566684 to 599648 (+6%)
packages/core2-32-poky-linux/socat/socat: PV changed from "1.7.3.4" to "1.7.4.1"

--===============3838530901904315327==--
