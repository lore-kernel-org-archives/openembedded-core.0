Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.4495.1621074783723262119
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7FA3838C13C8
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.2.3 SUCCEEDED
Message-ID: <MADEUP.167F36ED8CFC5E64.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151818
Content-Type: multipart/mixed; boundary="===============8974046757050317500=="

--===============8974046757050317500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.2.2-2.2.3.patch
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

--===============8974046757050317500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.2.2-2.2.3.patch"

From 9475b95eefeee7c4c92f8b42779b46ce8ae8b1a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 06:15:57 +0000
Subject: [PATCH] sysklogd: upgrade 2.2.2 -> 2.2.3

---
 .../sysklogd/{sysklogd_2.2.2.bb => sysklogd_2.2.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.2.2.bb => sysklogd_2.2.3.bb} (96%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
similarity index 96%
rename from meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
index 5dfeca5326..be34ec7b38 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.2.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.2.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://sysklogd \
            "
 
-SRCREV = "f507ed8ff3f1e9d71bb6f85acbf5d14b2fa4e5f7"
+SRCREV = "17b68ca89ab814bb623b615c4e7088d619ed8829"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============8974046757050317500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/core2-32-poky-linux/sysklogd: PV changed from "2.2.2" to "2.2.3"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 132472 to 140024 (+6%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.2.2" to "2.2.3"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9373 to 9366 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.2.2" to "2.2.3"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 78152 to 79233 (+1%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.2.2" to "2.2.3"
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.2.2" to "2.2.3"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 132187 to 133669 (+1%)
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.2.2" to "2.2.3"
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.2.2" to "2.2.3"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 83180 to 87276 (+5%)
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.2.2" to "2.2.3"

--===============8974046757050317500==--
