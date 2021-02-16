Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5218.1613463848513890660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id AF45D38C1276
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:07 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 5.10.1 SUCCEEDED
Message-ID: <MADEUP.16642CD263EDF0ED.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148094
Content-Type: multipart/mixed; boundary="===============8325994742219850181=="

--===============8325994742219850181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *5.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-5.10-5.10.1.patch
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

--===============8325994742219850181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info/top_level.txt was removed

--===============8325994742219850181==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-5.10-5.10.1.patch"

From 03c11d337f677b291a476701dccd303659ba0204 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 19:05:16 +0000
Subject: [PATCH] btrfs-tools: upgrade 5.10 -> 5.10.1

---
 .../btrfs-tools/{btrfs-tools_5.10.bb => btrfs-tools_5.10.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.10.bb => btrfs-tools_5.10.1.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
index 8095319f0c..fca010d4ae 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "273380d98f4412ae8b0f35ad69debf682e48c6bd"
+SRCREV = "f2ffce38b9c1477a7350bfe165f0e34b9bde40f5"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.17.1


--===============8325994742219850181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 5.10 [default] to 5.10.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "5.10" to "5.10.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 20520356 to 20518088 (-0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 5.10 [default] to 5.10.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "5.10" to "5.10.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 214939 to 214943 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 5.10 [default] to 5.10.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "5.10" to "5.10.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 5.10 [default] to 5.10.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "5.10" to "5.10.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 5.10 [default] to 5.10.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "5.10" to "5.10.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3293391 to 3293887 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 5.10 [default] to 5.10.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "5.10" to "5.10.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 5.10 [default] to 5.10.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "5.10" to "5.10.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6257088 to 6257090 (+0%)
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 5.10 [default] to 5.10.1 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "5.10" to "5.10.1"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/btrfsutil-5.10-py3.9.egg-info/top_level.txt was removed

--===============8325994742219850181==--
