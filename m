Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12217.1602843682718558366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id D603738C162F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:21 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.55 SUCCEEDED
Message-ID: <MADEUP.163E71D65BBAC552.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143409
Content-Type: multipart/mixed; boundary="===============0822922265548524742=="

--===============0822922265548524742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.55* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.54-5.55.patch
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

--===============0822922265548524742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bluez5/bluez5-dev: FILELIST: removed "/lib/udev/hid2hci /lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-doc: FILELIST: removed "/lib/udev/hid2hci /lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-locale: FILELIST: removed "/lib/udev/hid2hci /lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: FILELIST: removed "/lib/udev/hid2hci /lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGSIZE changed from 3408596 to 4223700 (+24%)
packages/core2-32-poky-linux/bluez5/bluez5-obex: FILELIST: removed "/lib/udev/hid2hci /lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: FILELIST: removed "/lib/udev/hid2hci /lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 3199779 to 3527459 (+10%)
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: FILELIST: removed "/lib/udev/hid2hci /lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-testtools: FILELIST: removed "/lib/udev/hid2hci /lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5: FILELIST: removed "/lib/udev/hid2hci /lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5: PKGSIZE changed from 4653024 to 5306018 (+14%)
Changes to packages/core2-32-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.2 to libbluetooth.so.3.19.3
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.2 to libbluetooth.so.3.19.3
  /usr/lib/libbluetooth.so.3.19.2 moved to /usr/lib/libbluetooth.so.3.19.3
  /lib was removed
  /lib/udev was removed
  /lib/udev/hid2hci was removed
  /lib/udev/rules.d was removed
  /lib/udev/rules.d/97-hid2hci.rules was removed

--===============0822922265548524742==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.54-5.55.patch"

From de661db4cc46a71bcad62dac1245cab2ef8f22df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Oct 2020 22:52:14 +0000
Subject: [PATCH] bluez5: upgrade 5.54 -> 5.55

---
 .../bluez5/{bluez5_5.54.bb => bluez5_5.55.bb}                  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.54.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.55.bb
index 260eee1402..202d3d5650 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
@@ -1,7 +1,6 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "e637feb2dbb7582bbbff1708367a847c"
-SRC_URI[sha256sum] = "68cdab9e63e8832b130d5979dc8c96fdb087b31278f342874d992af3e56656dc"
+SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.18.4


--===============0822922265548524742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGSIZE changed from 22911388 to 24594476 (+7%)
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-dbg: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5-dev: PKGSIZE changed from 142614 to 142810 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-dev: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-dev: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-dev: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5-doc: PKGSIZE changed from 36736 to 35416 (-4%)
packages/core2-32-poky-linux/bluez5/bluez5-doc: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-doc: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-doc: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5-locale: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-locale: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-locale: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGSIZE changed from 3408596 to 4223700 (+24%)
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5-obex: PKGSIZE changed from 519747 to 560707 (+8%)
packages/core2-32-poky-linux/bluez5/bluez5-obex: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-obex: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-obex: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 3199779 to 3527459 (+10%)
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGSIZE changed from 7474189 to 7616085 (+2%)
packages/core2-32-poky-linux/bluez5/bluez5-src: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-src: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGSIZE changed from 177803 to 175234 (-1%)
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5-testtools: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5/bluez5: PKGSIZE changed from 4653024 to 5306018 (+14%)
packages/core2-32-poky-linux/bluez5/bluez5: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5/bluez5: FILELIST: removed "/lib/udev/rules.d/97-hid2hci.rules /usr/lib/libbluetooth.so.3.19.2 /lib/udev/hid2hci", added "/usr/lib/libbluetooth.so.3.19.3"
packages/core2-32-poky-linux/bluez5/bluez5: PKGV changed from 5.54 [default] to 5.55 [default]
packages/core2-32-poky-linux/bluez5: PV changed from "5.54" to "5.55"
packages/core2-32-poky-linux/bluez5: PKGV changed from 5.54 [default] to 5.55 [default]
Changes to packages/core2-32-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.2 to libbluetooth.so.3.19.3
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.2 to libbluetooth.so.3.19.3
  /usr/lib/libbluetooth.so.3.19.2 moved to /usr/lib/libbluetooth.so.3.19.3
  /lib was removed
  /lib/udev was removed
  /lib/udev/hid2hci was removed
  /lib/udev/rules.d was removed
  /lib/udev/rules.d/97-hid2hci.rules was removed

--===============0822922265548524742==--
