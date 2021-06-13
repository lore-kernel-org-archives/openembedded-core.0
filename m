Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.16335.1623585061225839537
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id D34C538C13C6
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcap: upgrading to 1.10.1 SUCCEEDED
Message-ID: <MADEUP.16882202DC120D52.12353@lists.openembedded.org>
X-Groupsio-MsgNum: 152884
Content-Type: multipart/mixed; boundary="===============2347990008054366885=="

--===============2347990008054366885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpcap* to *1.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcap-upgrade-1.10.0-1.10.1.patch
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

--===============2347990008054366885==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libpcap-upgrade-1.10.0-1.10.1.patch"

From 3a4ccde719262ed1675a997b160c6d88d7ab024b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 09:06:40 +0000
Subject: [PATCH] libpcap: upgrade 1.10.0 -> 1.10.1

---
 .../libpcap/{libpcap_1.10.0.bb => libpcap_1.10.1.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.0.bb => libpcap_1.10.1.bb} (92%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
similarity index 92%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
index 967eabcc13..3225b3f100 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
@@ -12,8 +12,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[md5sum] = "8c12dc19dd7e0d02d2bb6596eb5a71c7"
-SRC_URI[sha256sum] = "8d12b42623eeefee872f123bd0dc85d535b00df4d42e865f993c40f7bfc92b1e"
+SRC_URI[sha256sum] = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.17.1


--===============2347990008054366885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpcap: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libpcap: SRC_URI changed from "https://www.tcpdump.org/release/libpcap-1.10.0.tar.gz" to "https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz"
packages/core2-32-poky-linux/libpcap: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libpcap/libpcap-dbg: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PKGSIZE changed from 809620 to 803068 (-1%)
packages/core2-32-poky-linux/libpcap/libpcap-dev: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-dev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libpcap/libpcap-dev: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-dev: PKGSIZE changed from 160185 to 160600 (+0%)
packages/core2-32-poky-linux/libpcap/libpcap-doc: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-doc: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libpcap/libpcap-doc: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-doc: PKGSIZE changed from 240444 to 240494 (+0%)
packages/core2-32-poky-linux/libpcap/libpcap-locale: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-locale: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libpcap/libpcap-locale: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-src: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-src: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libpcap/libpcap-src: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-src: PKGSIZE changed from 1474290 to 1462330 (-1%)
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PKGSIZE changed from 1175682 to 1165426 (-1%)
packages/core2-32-poky-linux/libpcap/libpcap: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap: PKGSIZE changed from 325157 to 321061 (-1%)
Changes to packages/core2-32-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.0 to libpcap.so.1.10.1
  /usr/lib/libpcap.so.1.10.0 moved to /usr/lib/libpcap.so.1.10.1

--===============2347990008054366885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpcap/libpcap-dev: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-doc: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-locale: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
packages/core2-32-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.0", added "/usr/lib/libpcap.so.1.10.1"
Changes to packages/core2-32-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.0 to libpcap.so.1.10.1
  /usr/lib/libpcap.so.1.10.0 moved to /usr/lib/libpcap.so.1.10.1

--===============2347990008054366885==--
