Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.39490.1605551303371045050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id E324238C0658
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ifupdown: upgrading to 0.8.36 SUCCEEDED
Message-ID: <MADEUP.164810676994B99F.27635@lists.openembedded.org>
X-Groupsio-MsgNum: 144628
Content-Type: multipart/mixed; boundary="===============0078961995818216066=="

--===============0078961995818216066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ifupdown* to *0.8.36* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ifupdown-upgrade-0.8.35-0.8.36.patch
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

--===============0078961995818216066==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ifupdown-upgrade-0.8.35-0.8.36.patch"

From a7b8292fabe3e28ffae4af965ffd3fd6097f276b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 12:24:02 +0000
Subject: [PATCH] ifupdown: upgrade 0.8.35 -> 0.8.36

---
 .../ifupdown/{ifupdown_0.8.35.bb => ifupdown_0.8.36.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.35.bb => ifupdown_0.8.36.bb} (97%)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
similarity index 97%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
index 53cb971d33..5b425da95c 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
            file://run-ptest \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
            "
-SRCREV = "4af76318cfc57f8e4a44d357104188666213bd4b"
+SRCREV = "c73226073e2b13970ca613b20a13b9c0253bf9da"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


--===============0078961995818216066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ifupdown/ifupdown-dbg: PKGV changed from 0.8.35 [default] to 0.8.36 [default]
packages/core2-32-poky-linux/ifupdown/ifupdown-dbg: PV changed from "0.8.35" to "0.8.36"
packages/core2-32-poky-linux/ifupdown/ifupdown-dev: PKGV changed from 0.8.35 [default] to 0.8.36 [default]
packages/core2-32-poky-linux/ifupdown/ifupdown-dev: PV changed from "0.8.35" to "0.8.36"
packages/core2-32-poky-linux/ifupdown/ifupdown-doc: PKGV changed from 0.8.35 [default] to 0.8.36 [default]
packages/core2-32-poky-linux/ifupdown/ifupdown-doc: PV changed from "0.8.35" to "0.8.36"
packages/core2-32-poky-linux/ifupdown/ifupdown-doc: PKGSIZE changed from 39975 to 40035 (+0%)
packages/core2-32-poky-linux/ifupdown/ifupdown-locale: PKGV changed from 0.8.35 [default] to 0.8.36 [default]
packages/core2-32-poky-linux/ifupdown/ifupdown-locale: PV changed from "0.8.35" to "0.8.36"
packages/core2-32-poky-linux/ifupdown/ifupdown-ptest: PKGV changed from 0.8.35 [default] to 0.8.36 [default]
packages/core2-32-poky-linux/ifupdown/ifupdown-ptest: PV changed from "0.8.35" to "0.8.36"
packages/core2-32-poky-linux/ifupdown/ifupdown-ptest: PKGSIZE changed from 47974 to 47982 (+0%)
packages/core2-32-poky-linux/ifupdown/ifupdown-src: PKGV changed from 0.8.35 [default] to 0.8.36 [default]
packages/core2-32-poky-linux/ifupdown/ifupdown-src: PV changed from "0.8.35" to "0.8.36"
packages/core2-32-poky-linux/ifupdown/ifupdown-src: PKGSIZE changed from 112948 to 113076 (+0%)
packages/core2-32-poky-linux/ifupdown/ifupdown-staticdev: PKGV changed from 0.8.35 [default] to 0.8.36 [default]
packages/core2-32-poky-linux/ifupdown/ifupdown-staticdev: PV changed from "0.8.35" to "0.8.36"
packages/core2-32-poky-linux/ifupdown/ifupdown: PKGV changed from 0.8.35 [default] to 0.8.36 [default]
packages/core2-32-poky-linux/ifupdown/ifupdown: PV changed from "0.8.35" to "0.8.36"
packages/core2-32-poky-linux/ifupdown: PKGV changed from 0.8.35 [default] to 0.8.36 [default]
packages/core2-32-poky-linux/ifupdown: PV changed from "0.8.35" to "0.8.36"

--===============0078961995818216066==--
