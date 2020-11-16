Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.38948.1605551303469649819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id E068C38C062F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 1.8.1 SUCCEEDED
Message-ID: <MADEUP.164810676FA441A1.27635@lists.openembedded.org>
X-Groupsio-MsgNum: 144629
Content-Type: multipart/mixed; boundary="===============9025883493018928538=="

--===============9025883493018928538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kea* to *1.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-1.7.10-1.8.1.patch
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

--===============9025883493018928538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kea/kea-dev: FILELIST: removed "/usr/lib/libkea-http.so.6 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-cfgclient.so.9.0.0 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-process.so.10 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-asiodns.so.1.0.0", added "/usr/lib/libkea-util.so.16 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-asiolink.so.9.0.0 
 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-http.so.7 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-dhcp_ddns.so.3.0.0 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cfgclient.so.10 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-process.so.11 /usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-database.so.6 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-exceptions.so.0.2.1"
packages/core2-32-poky-linux/kea/kea-doc: FILELIST: removed "/usr/lib/libkea-http.so.6 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-cfgclient.so.9.0.0 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-process.so.10 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-asiodns.so.1.0.0", added "/usr/lib/libkea-util.so.16 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-asiolink.so.9.0.0 
 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-http.so.7 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-dhcp_ddns.so.3.0.0 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cfgclient.so.10 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-process.so.11 /usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-database.so.6 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-exceptions.so.0.2.1"
packages/core2-32-poky-linux/kea/kea-locale: FILELIST: removed "/usr/lib/libkea-http.so.6 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-cfgclient.so.9.0.0 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-process.so.10 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-asiodns.so.1.0.0", added "/usr/lib/libkea-util.so.16 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-asiolink.so.9.0
 .0 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-http.so.7 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-dhcp_ddns.so.3.0.0 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cfgclient.so.10 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-process.so.11 /usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-database.so.6 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-exceptions.so.0.2.1"
packages/core2-32-poky-linux/kea/kea-staticdev: FILELIST: removed "/usr/lib/libkea-http.so.6 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-cfgclient.so.9.0.0 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-process.so.10 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-asiodns.so.1.0.0", added "/usr/lib/libkea-util.so.16 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-asiolink.so.
 9.0.0 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-http.so.7 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-dhcp_ddns.so.3.0.0 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cfgclient.so.10 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-process.so.11 /usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-database.so.6 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-exceptions.so.0.2.1"
packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-http.so.6 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-cfgclient.so.9.0.0 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-process.so.10 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-asiodns.so.1.0.0", added "/usr/lib/libkea-util.so.16 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-asiolink.so.9.0.0 /usr
 /lib/libkea-hooks.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-http.so.7 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-dhcp_ddns.so.3.0.0 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cfgclient.so.10 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-process.so.11 /usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-database.so.6 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-exceptions.so.0.2.1"
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so.1 changed symlink target from libkea-asiodns.so.1.0.0 to libkea-asiodns.so.1.0.1
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.1.0.0 to libkea-asiodns.so.1.0.1
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.7.1.0 to libkea-asiolink.so.9.0.0
  /usr/lib/libkea-cc.so.8 changed symlink target from libkea-cc.so.8.1.4 to libkea-cc.so.8.1.5
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.8.1.4 to libkea-cc.so.8.1.5
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.9.0.0 to libkea-cfgclient.so.10.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.5.1.0 to libkea-database.so.6.1.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.2.0.1 to libkea-dhcp_ddns.so.3.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.18.0.0 to libkea-dhcp++.so.19.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.26.0.0 to libkea-dhcpsrv.so.28.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.4.0.0 to libkea-dns++.so.5.0.0
  /usr/lib/libkea-exceptions.so.0 changed symlink target from libkea-exceptions.so.0.2.0 to libkea-exceptions.so.0.2.1
  /usr/lib/libkea-exceptions.so changed symlink target from libkea-exceptions.so.0.2.0 to libkea-exceptions.so.0.2.1
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.15.0.0 to libkea-hooks.so.16.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.6.1.2 to libkea-http.so.7.1.0
  /usr/lib/libkea-log.so.6 changed symlink target from libkea-log.so.6.0.0 to libkea-log.so.6.0.1
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.6.0.0 to libkea-log.so.6.0.1
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.10.0.0 to libkea-process.so.11.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.15.0.0 to libkea-util.so.16.0.0
  /usr/lib/libkea-asiodns.so.1.0.0 moved to /usr/lib/libkea-asiodns.so.1.0.1
  /usr/lib/libkea-asiolink.so.7.1.0 moved to /usr/lib/libkea-asiolink.so.9.0.0
  /usr/lib/libkea-asiolink.so.7 moved to /usr/lib/libkea-asiolink.so.9
  /usr/lib/libkea-cc.so.8.1.4 moved to /usr/lib/libkea-cc.so.8.1.5
  /usr/lib/libkea-database.so.5.1.0 moved to /usr/lib/libkea-database.so.6.1.0
  /usr/lib/libkea-database.so.5 moved to /usr/lib/libkea-database.so.6
  /usr/lib/libkea-dhcp_ddns.so.2.0.1 moved to /usr/lib/libkea-dhcp_ddns.so.3.0.0
  /usr/lib/libkea-dhcp_ddns.so.2 moved to /usr/lib/libkea-dhcp_ddns.so.3
  /usr/lib/libkea-dhcp++.so.18.0.0 moved to /usr/lib/libkea-dhcp++.so.19.0.0
  /usr/lib/libkea-dhcp++.so.18 moved to /usr/lib/libkea-dhcp++.so.19
  /usr/lib/libkea-dhcpsrv.so.26.0.0 moved to /usr/lib/libkea-dhcpsrv.so.28.0.0
  /usr/lib/libkea-dhcpsrv.so.26 moved to /usr/lib/libkea-dhcpsrv.so.28
  /usr/lib/libkea-dns++.so.4.0.0 moved to /usr/lib/libkea-dns++.so.5.0.0
  /usr/lib/libkea-dns++.so.4 moved to /usr/lib/libkea-dns++.so.5
  /usr/lib/libkea-exceptions.so.0.2.0 moved to /usr/lib/libkea-exceptions.so.0.2.1
  /usr/lib/libkea-hooks.so.15.0.0 moved to /usr/lib/libkea-hooks.so.16.0.0
  /usr/lib/libkea-hooks.so.15 moved to /usr/lib/libkea-hooks.so.16
  /usr/lib/libkea-http.so.6.1.2 moved to /usr/lib/libkea-http.so.7.1.0
  /usr/lib/libkea-http.so.6 moved to /usr/lib/libkea-http.so.7
  /usr/lib/libkea-log.so.6.0.0 moved to /usr/lib/libkea-log.so.6.0.1
  /usr/lib/libkea-process.so.10.0.0 moved to /usr/lib/libkea-process.so.11.0.0
  /usr/lib/libkea-process.so.10 moved to /usr/lib/libkea-process.so.11
  /usr/lib/libkea-util.so.15.0.0 moved to /usr/lib/libkea-util.so.16.0.0
  /usr/lib/libkea-util.so.15 moved to /usr/lib/libkea-util.so.16
  /usr/lib/libkea-cfgclient.so.10.0.0 was added
  /usr/lib/libkea-cfgclient.so.10 was added
  /usr/lib/libkea-cfgclient.so.9.0.0 was removed
  /usr/lib/libkea-cfgclient.so.9 was removed

--===============9025883493018928538==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-kea-upgrade-1.7.10-1.8.1.patch"

From 31782a0d90cce05e76f16f89ff167db8f408b5fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 12:21:13 +0000
Subject: [PATCH] kea: upgrade 1.7.10 -> 1.8.1

---
 meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.8.1.bb} (96%)

diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.8.1.bb
similarity index 96%
rename from meta/recipes-connectivity/kea/kea_1.7.10.bb
rename to meta/recipes-connectivity/kea/kea_1.8.1.bb
index 1d011ace78..9b104a06df 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.8.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "\
     file://fix-multilib-conflict.patch \
     file://fix_pid_keactrl.patch \
 "
-SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
+SRC_URI[sha256sum] = "52020cb16889484b661746d7fc4c7cd88974b1af5b7fc436eb6e69c62eb83734"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.20.1


--===============9025883493018928538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kea/kea-dbg: PV changed from "1.7.10" to "1.8.1"
packages/core2-32-poky-linux/kea/kea-dbg: PKGV changed from 1.7.10 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/kea/kea-dbg: PKGSIZE changed from 258778088 to 259214668 (+0%)
packages/core2-32-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-asiodns.so.1.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-process.so.10 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-http.so.6 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cfgclient.so.9.0.0", added "/usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-database.so.6 /usr/lib/libkea-http.so.7 /usr/lib/libkea-cfgclient.so.10 /u
 sr/lib/libkea-exceptions.so.0.2.1 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-asiolink.so.9.0.0 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-process.so.11 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-util.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-dhcp_ddns.so.3.0.0"
packages/core2-32-poky-linux/kea/kea-dev: PV changed from "1.7.10" to "1.8.1"
packages/core2-32-poky-linux/kea/kea-dev: PKGV changed from 1.7.10 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/kea/kea-dev: PKGSIZE changed from 3458982 to 3466873 (+0%)
packages/core2-32-poky-linux/kea/kea-dev: FILELIST: removed "/usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-asiodns.so.1.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-process.so.10 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-http.so.6 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cfgclient.so.9.0.0", added "/usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-database.so.6 /usr/lib/libkea-http.so.7 /usr/lib/libkea-cfgclient.so.10 /u
 sr/lib/libkea-exceptions.so.0.2.1 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-asiolink.so.9.0.0 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-process.so.11 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-util.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-dhcp_ddns.so.3.0.0"
packages/core2-32-poky-linux/kea/kea-doc: PV changed from "1.7.10" to "1.8.1"
packages/core2-32-poky-linux/kea/kea-doc: PKGV changed from 1.7.10 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/kea/kea-doc: PKGSIZE changed from 889774 to 894379 (+1%)
packages/core2-32-poky-linux/kea/kea-doc: FILELIST: removed "/usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-asiodns.so.1.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-process.so.10 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-http.so.6 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cfgclient.so.9.0.0", added "/usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-database.so.6 /usr/lib/libkea-http.so.7 /usr/lib/libkea-cfgclient.so.10 /u
 sr/lib/libkea-exceptions.so.0.2.1 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-asiolink.so.9.0.0 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-process.so.11 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-util.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-dhcp_ddns.so.3.0.0"
packages/core2-32-poky-linux/kea/kea-locale: PV changed from "1.7.10" to "1.8.1"
packages/core2-32-poky-linux/kea/kea-locale: PKGV changed from 1.7.10 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/kea/kea-locale: FILELIST: removed "/usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-asiodns.so.1.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-process.so.10 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-http.so.6 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cfgclient.so.9.0.0", added "/usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-database.so.6 /usr/lib/libkea-http.so.7 /usr/lib/libkea-cfgclient.so.10
  /usr/lib/libkea-exceptions.so.0.2.1 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-asiolink.so.9.0.0 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-process.so.11 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-util.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-dhcp_ddns.so.3.0.0"
packages/core2-32-poky-linux/kea/kea-src: PV changed from "1.7.10" to "1.8.1"
packages/core2-32-poky-linux/kea/kea-src: PKGV changed from 1.7.10 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/kea/kea-src: PKGSIZE changed from 8192136 to 8226699 (+0%)
packages/core2-32-poky-linux/kea/kea-src: FILELIST: removed "/usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-asiodns.so.1.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-process.so.10 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-http.so.6 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cfgclient.so.9.0.0", added "/usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-database.so.6 /usr/lib/libkea-http.so.7 /usr/lib/libkea-cfgclient.so.10 /u
 sr/lib/libkea-exceptions.so.0.2.1 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-asiolink.so.9.0.0 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-process.so.11 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-util.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-dhcp_ddns.so.3.0.0"
packages/core2-32-poky-linux/kea/kea-staticdev: PV changed from "1.7.10" to "1.8.1"
packages/core2-32-poky-linux/kea/kea-staticdev: PKGV changed from 1.7.10 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/kea/kea-staticdev: FILELIST: removed "/usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-asiodns.so.1.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-process.so.10 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-http.so.6 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cfgclient.so.9.0.0", added "/usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-database.so.6 /usr/lib/libkea-http.so.7 /usr/lib/libkea-cfgclient.so
 .10 /usr/lib/libkea-exceptions.so.0.2.1 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-asiolink.so.9.0.0 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-process.so.11 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-util.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-dhcp_ddns.so.3.0.0"
packages/core2-32-poky-linux/kea/kea: PV changed from "1.7.10" to "1.8.1"
packages/core2-32-poky-linux/kea/kea: PKGV changed from 1.7.10 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/kea/kea: PKGSIZE changed from 14115514 to 14156488 (+0%)
packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-hooks.so.15.0.0 /usr/lib/libkea-exceptions.so.0.2.0 /usr/lib/libkea-asiolink.so.7.1.0 /usr/lib/libkea-process.so.10.0.0 /usr/lib/libkea-http.so.6.1.2 /usr/lib/libkea-hooks.so.15 /usr/lib/libkea-log.so.6.0.0 /usr/lib/libkea-database.so.5 /usr/lib/libkea-dhcp_ddns.so.2 /usr/lib/libkea-dhcp_ddns.so.2.0.1 /usr/lib/libkea-dns++.so.4.0.0 /usr/lib/libkea-util.so.15.0.0 /usr/lib/libkea-asiodns.so.1.0.0 /usr/lib/libkea-dns++.so.4 /usr/lib/libkea-database.so.5.1.0 /usr/lib/libkea-process.so.10 /usr/lib/libkea-asiolink.so.7 /usr/lib/libkea-cfgclient.so.9 /usr/lib/libkea-dhcp++.so.18 /usr/lib/libkea-cc.so.8.1.4 /usr/lib/libkea-dhcpsrv.so.26 /usr/lib/libkea-dhcp++.so.18.0.0 /usr/lib/libkea-dhcpsrv.so.26.0.0 /usr/lib/libkea-http.so.6 /usr/lib/libkea-util.so.15 /usr/lib/libkea-cfgclient.so.9.0.0", added "/usr/lib/libkea-asiolink.so.9 /usr/lib/libkea-database.so.6 /usr/lib/libkea-http.so.7 /usr/lib/libkea-cfgclient.so.10 /usr/l
 ib/libkea-exceptions.so.0.2.1 /usr/lib/libkea-cfgclient.so.10.0.0 /usr/lib/libkea-dns++.so.5 /usr/lib/libkea-process.so.11.0.0 /usr/lib/libkea-dhcpsrv.so.28.0.0 /usr/lib/libkea-cc.so.8.1.5 /usr/lib/libkea-dns++.so.5.0.0 /usr/lib/libkea-asiolink.so.9.0.0 /usr/lib/libkea-asiodns.so.1.0.1 /usr/lib/libkea-process.so.11 /usr/lib/libkea-database.so.6.1.0 /usr/lib/libkea-dhcp++.so.19 /usr/lib/libkea-dhcp_ddns.so.3 /usr/lib/libkea-util.so.16.0.0 /usr/lib/libkea-log.so.6.0.1 /usr/lib/libkea-util.so.16 /usr/lib/libkea-http.so.7.1.0 /usr/lib/libkea-dhcpsrv.so.28 /usr/lib/libkea-dhcp++.so.19.0.0 /usr/lib/libkea-hooks.so.16.0.0 /usr/lib/libkea-hooks.so.16 /usr/lib/libkea-dhcp_ddns.so.3.0.0"
packages/core2-32-poky-linux/kea: PV changed from "1.7.10" to "1.8.1"
packages/core2-32-poky-linux/kea: PKGV changed from 1.7.10 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/1.7.10/kea-1.7.10.tar.gz file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch" to "http://ftp.isc.org/isc/kea/1.8.1/kea-1.8.1.tar.gz file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch"
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so.1 changed symlink target from libkea-asiodns.so.1.0.0 to libkea-asiodns.so.1.0.1
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.1.0.0 to libkea-asiodns.so.1.0.1
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.7.1.0 to libkea-asiolink.so.9.0.0
  /usr/lib/libkea-cc.so.8 changed symlink target from libkea-cc.so.8.1.4 to libkea-cc.so.8.1.5
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.8.1.4 to libkea-cc.so.8.1.5
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.9.0.0 to libkea-cfgclient.so.10.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.5.1.0 to libkea-database.so.6.1.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.2.0.1 to libkea-dhcp_ddns.so.3.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.18.0.0 to libkea-dhcp++.so.19.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.26.0.0 to libkea-dhcpsrv.so.28.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.4.0.0 to libkea-dns++.so.5.0.0
  /usr/lib/libkea-exceptions.so.0 changed symlink target from libkea-exceptions.so.0.2.0 to libkea-exceptions.so.0.2.1
  /usr/lib/libkea-exceptions.so changed symlink target from libkea-exceptions.so.0.2.0 to libkea-exceptions.so.0.2.1
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.15.0.0 to libkea-hooks.so.16.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.6.1.2 to libkea-http.so.7.1.0
  /usr/lib/libkea-log.so.6 changed symlink target from libkea-log.so.6.0.0 to libkea-log.so.6.0.1
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.6.0.0 to libkea-log.so.6.0.1
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.10.0.0 to libkea-process.so.11.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.15.0.0 to libkea-util.so.16.0.0
  /usr/lib/libkea-asiodns.so.1.0.0 moved to /usr/lib/libkea-asiodns.so.1.0.1
  /usr/lib/libkea-asiolink.so.7.1.0 moved to /usr/lib/libkea-asiolink.so.9.0.0
  /usr/lib/libkea-asiolink.so.7 moved to /usr/lib/libkea-asiolink.so.9
  /usr/lib/libkea-cc.so.8.1.4 moved to /usr/lib/libkea-cc.so.8.1.5
  /usr/lib/libkea-database.so.5.1.0 moved to /usr/lib/libkea-database.so.6.1.0
  /usr/lib/libkea-database.so.5 moved to /usr/lib/libkea-database.so.6
  /usr/lib/libkea-dhcp_ddns.so.2.0.1 moved to /usr/lib/libkea-dhcp_ddns.so.3.0.0
  /usr/lib/libkea-dhcp_ddns.so.2 moved to /usr/lib/libkea-dhcp_ddns.so.3
  /usr/lib/libkea-dhcp++.so.18.0.0 moved to /usr/lib/libkea-dhcp++.so.19.0.0
  /usr/lib/libkea-dhcp++.so.18 moved to /usr/lib/libkea-dhcp++.so.19
  /usr/lib/libkea-dhcpsrv.so.26.0.0 moved to /usr/lib/libkea-dhcpsrv.so.28.0.0
  /usr/lib/libkea-dhcpsrv.so.26 moved to /usr/lib/libkea-dhcpsrv.so.28
  /usr/lib/libkea-dns++.so.4.0.0 moved to /usr/lib/libkea-dns++.so.5.0.0
  /usr/lib/libkea-dns++.so.4 moved to /usr/lib/libkea-dns++.so.5
  /usr/lib/libkea-exceptions.so.0.2.0 moved to /usr/lib/libkea-exceptions.so.0.2.1
  /usr/lib/libkea-hooks.so.15.0.0 moved to /usr/lib/libkea-hooks.so.16.0.0
  /usr/lib/libkea-hooks.so.15 moved to /usr/lib/libkea-hooks.so.16
  /usr/lib/libkea-http.so.6.1.2 moved to /usr/lib/libkea-http.so.7.1.0
  /usr/lib/libkea-http.so.6 moved to /usr/lib/libkea-http.so.7
  /usr/lib/libkea-log.so.6.0.0 moved to /usr/lib/libkea-log.so.6.0.1
  /usr/lib/libkea-process.so.10.0.0 moved to /usr/lib/libkea-process.so.11.0.0
  /usr/lib/libkea-process.so.10 moved to /usr/lib/libkea-process.so.11
  /usr/lib/libkea-util.so.15.0.0 moved to /usr/lib/libkea-util.so.16.0.0
  /usr/lib/libkea-util.so.15 moved to /usr/lib/libkea-util.so.16
  /usr/lib/libkea-cfgclient.so.10.0.0 was added
  /usr/lib/libkea-cfgclient.so.10 was added
  /usr/lib/libkea-cfgclient.so.9.0.0 was removed
  /usr/lib/libkea-cfgclient.so.9 was removed

--===============9025883493018928538==--
