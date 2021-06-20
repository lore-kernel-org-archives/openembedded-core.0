Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.32453.1624189110242699935
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8B24B38C0960
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dejagnu: upgrading to 1.6.3 SUCCEEDED
Message-ID: <MADEUP.168A4763FAFCA43C.3236@lists.openembedded.org>
X-Groupsio-MsgNum: 153100
Content-Type: multipart/mixed; boundary="===============6102859919423477550=="

--===============6102859919423477550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dejagnu* to *1.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dejagnu-upgrade-1.6.2-1.6.3.patch
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

--===============6102859919423477550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dejagnu/dejagnu-dbg: FILELIST: added "/usr/share/dejagnu/baseboards/moxie-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/share/dejagnu/commands/report-card.awk /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/commands/help.sh"
packages/core2-32-poky-linux/dejagnu/dejagnu-dbg: PV changed from "1.6.2" to "1.6.3"
packages/core2-32-poky-linux/dejagnu/dejagnu-dbg: PKGV changed from 1.6.2 [default] to 1.6.3 [default]
packages/core2-32-poky-linux/dejagnu/dejagnu-dev: FILELIST: added "/usr/share/dejagnu/baseboards/moxie-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/share/dejagnu/commands/report-card.awk /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/commands/help.sh"
packages/core2-32-poky-linux/dejagnu/dejagnu-dev: PKGSIZE changed from 6283 to 5791 (-8%)
packages/core2-32-poky-linux/dejagnu/dejagnu-dev: PV changed from "1.6.2" to "1.6.3"
packages/core2-32-poky-linux/dejagnu/dejagnu-dev: PKGV changed from 1.6.2 [default] to 1.6.3 [default]
packages/core2-32-poky-linux/dejagnu/dejagnu-doc: FILELIST: added "/usr/share/dejagnu/baseboards/moxie-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/share/dejagnu/commands/report-card.awk /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/commands/help.sh"
packages/core2-32-poky-linux/dejagnu/dejagnu-doc: PKGSIZE changed from 181611 to 269035 (+48%)
packages/core2-32-poky-linux/dejagnu/dejagnu-doc: PV changed from "1.6.2" to "1.6.3"
packages/core2-32-poky-linux/dejagnu/dejagnu-doc: PKGV changed from 1.6.2 [default] to 1.6.3 [default]
packages/core2-32-poky-linux/dejagnu/dejagnu-locale: FILELIST: added "/usr/share/dejagnu/baseboards/moxie-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/share/dejagnu/commands/report-card.awk /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/commands/help.sh"
packages/core2-32-poky-linux/dejagnu/dejagnu-locale: PV changed from "1.6.2" to "1.6.3"
packages/core2-32-poky-linux/dejagnu/dejagnu-locale: PKGV changed from 1.6.2 [default] to 1.6.3 [default]
packages/core2-32-poky-linux/dejagnu/dejagnu-src: FILELIST: added "/usr/share/dejagnu/baseboards/moxie-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/share/dejagnu/commands/report-card.awk /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/commands/help.sh"
packages/core2-32-poky-linux/dejagnu/dejagnu-src: PV changed from "1.6.2" to "1.6.3"
packages/core2-32-poky-linux/dejagnu/dejagnu-src: PKGV changed from 1.6.2 [default] to 1.6.3 [default]
packages/core2-32-poky-linux/dejagnu/dejagnu-staticdev: FILELIST: added "/usr/share/dejagnu/baseboards/moxie-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/share/dejagnu/commands/report-card.awk /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/commands/help.sh"
packages/core2-32-poky-linux/dejagnu/dejagnu-staticdev: PV changed from "1.6.2" to "1.6.3"
packages/core2-32-poky-linux/dejagnu/dejagnu-staticdev: PKGV changed from 1.6.2 [default] to 1.6.3 [default]
packages/core2-32-poky-linux/dejagnu/dejagnu: FILELIST: added "/usr/share/dejagnu/baseboards/moxie-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/share/dejagnu/commands/report-card.awk /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/commands/help.sh"
packages/core2-32-poky-linux/dejagnu/dejagnu: PKGSIZE changed from 488354 to 548887 (+12%)
packages/core2-32-poky-linux/dejagnu/dejagnu: PV changed from "1.6.2" to "1.6.3"
packages/core2-32-poky-linux/dejagnu/dejagnu: PKGV changed from 1.6.2 [default] to 1.6.3 [default]
packages/core2-32-poky-linux/dejagnu: PKGV changed from 1.6.2 [default] to 1.6.3 [default]
packages/core2-32-poky-linux/dejagnu: PV changed from "1.6.2" to "1.6.3"
packages/core2-32-poky-linux/dejagnu: SRC_URI changed from "https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.2.tar.gz" to "https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.3.tar.gz"
Changes to packages/core2-32-poky-linux/dejagnu (sysroot):
  /usr/share/dejagnu/baseboards/generic-sim.exp was added
  /usr/share/dejagnu/baseboards/moxie-sim.exp was added
  /usr/share/dejagnu/baseboards/pi.exp was added
  /usr/share/dejagnu/baseboards/pru-sim.exp was added
  /usr/share/dejagnu/baseboards/qemu.exp was added
  /usr/share/dejagnu/baseboards/riscv-sim.exp was added
  /usr/share/dejagnu/commands was added
  /usr/share/dejagnu/commands/help.sh was added
  /usr/share/dejagnu/commands/report-card.awk was added

--===============6102859919423477550==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-dejagnu-upgrade-1.6.2-1.6.3.patch"

From ad7557a41506e1f9da71e0e97df89cba7f1fc059 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 08:20:02 +0000
Subject: [PATCH] dejagnu: upgrade 1.6.2 -> 1.6.3

---
 .../dejagnu/{dejagnu_1.6.2.bb => dejagnu_1.6.3.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/dejagnu/{dejagnu_1.6.2.bb => dejagnu_1.6.3.bb} (78%)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
similarity index 78%
rename from meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
rename to meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
index ce242c3593..ce35b806ba 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
@@ -13,7 +13,6 @@ inherit autotools
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "e1b07516533f351b3aba3423fafeffd6"
-SRC_URI[sha256sum] = "0d0671e1b45189c5fc8ade4b3b01635fb9eeab45cf54f57db23e4c4c1a17d261"
+SRC_URI[sha256sum] = "87daefacd7958b4a69f88c6856dbd1634261963c414079d0c371f589cd66a2e3"
 
 BBCLASSEXTEND = "native"
-- 
2.20.1


--===============6102859919423477550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dejagnu/dejagnu-dev: FILELIST: added "/usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/commands/help.sh /usr/share/dejagnu/baseboards/moxie-sim.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/commands/report-card.awk"
packages/core2-32-poky-linux/dejagnu/dejagnu-doc: PKGSIZE changed from 181611 to 269035 (+48%)
packages/core2-32-poky-linux/dejagnu/dejagnu-doc: FILELIST: added "/usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/commands/help.sh /usr/share/dejagnu/baseboards/moxie-sim.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/commands/report-card.awk"
packages/core2-32-poky-linux/dejagnu/dejagnu-locale: FILELIST: added "/usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/commands/help.sh /usr/share/dejagnu/baseboards/moxie-sim.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/commands/report-card.awk"
packages/core2-32-poky-linux/dejagnu/dejagnu-staticdev: FILELIST: added "/usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/commands/help.sh /usr/share/dejagnu/baseboards/moxie-sim.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/commands/report-card.awk"
packages/core2-32-poky-linux/dejagnu/dejagnu: PKGSIZE changed from 488354 to 548887 (+12%)
packages/core2-32-poky-linux/dejagnu/dejagnu: FILELIST: added "/usr/share/dejagnu/baseboards/generic-sim.exp /usr/share/dejagnu/commands/help.sh /usr/share/dejagnu/baseboards/moxie-sim.exp /usr/share/dejagnu/baseboards/riscv-sim.exp /usr/bin/dejagnu /usr/share/dejagnu/baseboards/pi.exp /usr/share/dejagnu/baseboards/qemu.exp /usr/share/dejagnu/baseboards/pru-sim.exp /usr/share/dejagnu/commands/report-card.awk"
Changes to packages/core2-32-poky-linux/dejagnu (sysroot):
  /usr/share/dejagnu/baseboards/generic-sim.exp was added
  /usr/share/dejagnu/baseboards/moxie-sim.exp was added
  /usr/share/dejagnu/baseboards/pi.exp was added
  /usr/share/dejagnu/baseboards/pru-sim.exp was added
  /usr/share/dejagnu/baseboards/qemu.exp was added
  /usr/share/dejagnu/baseboards/riscv-sim.exp was added
  /usr/share/dejagnu/commands was added
  /usr/share/dejagnu/commands/help.sh was added
  /usr/share/dejagnu/commands/report-card.awk was added

--===============6102859919423477550==--
