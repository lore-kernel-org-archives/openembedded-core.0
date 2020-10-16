Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12520.1602843683017164064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id F2CC838C166B
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:21 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 8.4p1 SUCCEEDED
Message-ID: <MADEUP.163E71D66A8FD500.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143412
Content-Type: multipart/mixed; boundary="===============4272831179315986890=="

--===============4272831179315986890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssh* to *8.4p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-8.3p1-8.4p1.patch
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

--===============4272831179315986890==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-8.3p1-8.4p1.patch"

From ad5104f973b8db3f6d7f50ac35f9b6d15bfbbaea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 00:07:02 +0000
Subject: [PATCH] openssh: upgrade 8.3p1 -> 8.4p1

---
 .../openssh/{openssh_8.3p1.bb => openssh_8.4p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.3p1.bb => openssh_8.4p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_8.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.4p1.bb
index e007328704..720b238e71 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
+SRC_URI[sha256sum] = "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.18.4


--===============4272831179315986890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/openssh: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-dbg: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-dbg: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 10948312 to 11109236 (+1%)
packages/core2-32-poky-linux/openssh/openssh-dev: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-dev: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-doc: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-doc: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-doc: PKGSIZE changed from 298001 to 303199 (+2%)
packages/core2-32-poky-linux/openssh/openssh-keygen: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-keygen: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 533948 to 542140 (+2%)
packages/core2-32-poky-linux/openssh/openssh-locale: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-locale: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-misc: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-misc: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2571294 to 2608447 (+1%)
packages/core2-32-poky-linux/openssh/openssh-ptest: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-ptest: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 759369 to 817358 (+8%)
packages/core2-32-poky-linux/openssh/openssh-scp: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-scp: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGSIZE changed from 140716 to 144812 (+3%)
packages/core2-32-poky-linux/openssh/openssh-sftp: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-sftp: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-src: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-src: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-src: PKGSIZE changed from 3069258 to 3097442 (+1%)
packages/core2-32-poky-linux/openssh/openssh-ssh: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-ssh: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-ssh: PKGSIZE changed from 888004 to 896196 (+1%)
packages/core2-32-poky-linux/openssh/openssh-sshd: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-sshd: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 1476470 to 1536687 (+4%)
packages/core2-32-poky-linux/openssh/openssh-staticdev: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh-staticdev: PKGV changed from 8.3p1 [default] to 8.4p1 [default]
packages/core2-32-poky-linux/openssh/openssh: PV changed from "8.3p1" to "8.4p1"
packages/core2-32-poky-linux/openssh/openssh: PKGV changed from 8.3p1 [default] to 8.4p1 [default]

--===============4272831179315986890==--
