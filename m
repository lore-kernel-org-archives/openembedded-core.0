Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.2086.1622683485305506921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 18:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6B2CF38C0F49
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Jun 2021 01:24:44 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Weinberger <richard@nod.at>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 20191016 SUCCEEDED
Message-ID: <MADEUP.1684EE085BD427A1.11265@lists.openembedded.org>
X-Groupsio-MsgNum: 152562
Content-Type: multipart/mixed; boundary="===============7469273871533581254=="

--===============7469273871533581254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *erofs-utils* to *20191016* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.2.1-20191016.patch
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

--===============7469273871533581254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.2.1" to "20191016"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.2.1 [default] to 20191016 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 167228 to 167232 (+0%)
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.2.1" to "20191016"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.2.1 [default] to 20191016 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.2.1" to "20191016"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.2.1 [default] to 20191016 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.2.1" to "20191016"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.2.1 [default] to 20191016 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.2.1" to "20191016"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.2.1 [default] to 20191016 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.2.1" to "20191016"
packages/core2-32-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.2.1 [default] to 20191016 [default]
packages/core2-32-poky-linux/erofs-utils/erofs-utils: PV changed from "1.2.1" to "20191016"
packages/core2-32-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.2.1 [default] to 20191016 [default]
packages/core2-32-poky-linux/erofs-utils: PV changed from "1.2.1" to "20191016"
packages/core2-32-poky-linux/erofs-utils: PKGV changed from 1.2.1 [default] to 20191016 [default]

--===============7469273871533581254==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.2.1-20191016.patch"

From dce7793cff90c96310f4e2eaf85f31219fdfc2c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 2 Jun 2021 16:16:54 +0000
Subject: [PATCH] erofs-utils: upgrade 1.2.1 -> 20191016

---
 .../erofs-utils/{erofs-utils_1.2.1.bb => erofs-utils_20191016.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.2.1.bb => erofs-utils_20191016.bb} (100%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_20191016.bb
similarity index 100%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_20191016.bb
-- 
2.17.1


--===============7469273871533581254==--
