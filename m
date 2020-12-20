Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.24431.1608473714742252705
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id CBD6B38C1546
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng: upgrading to 0.8.2 SUCCEEDED
Message-ID: <MADEUP.16527252E3F879F4.5278@lists.openembedded.org>
X-Groupsio-MsgNum: 145987
Content-Type: multipart/mixed; boundary="===============2151451481502361661=="

--===============2151451481502361661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap-ng* to *0.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-ng-upgrade-0.8.1-0.8.2.patch
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

--===============2151451481502361661==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libcap-ng-upgrade-0.8.1-0.8.2.patch"

From acf4385aca48ebdf9cc76c4dae842d3a04ec80a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 13:35:14 +0000
Subject: [PATCH] libcap-ng: upgrade 0.8.1 -> 0.8.2

---
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.8.1.bb => libcap-ng_0.8.2.bb}        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.1.bb => libcap-ng_0.8.2.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index a312b602ff..842f77dfa4 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -11,6 +11,6 @@ SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
            file://python.patch \
 "
 
-SRC_URI[sha256sum] = "f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055"
+SRC_URI[sha256sum] = "52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb
-- 
2.20.1


--===============2151451481502361661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcap-ng: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/libcap-ng: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/libcap-ng: SRC_URI changed from "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.1.tar.gz file://python.patch" to "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.2.tar.gz file://python.patch"
packages/core2-32-poky-linux/libcap-ng/libcap-ng-bin: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/libcap-ng/libcap-ng-bin: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/libcap-ng/libcap-ng-dbg: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/libcap-ng/libcap-ng-dbg: PKGSIZE changed from 146084 to 147140 (+1%)
packages/core2-32-poky-linux/libcap-ng/libcap-ng-dbg: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/libcap-ng/libcap-ng-dev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/libcap-ng/libcap-ng-dev: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/libcap-ng/libcap-ng-doc: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/libcap-ng/libcap-ng-doc: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/libcap-ng/libcap-ng-locale: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/libcap-ng/libcap-ng-locale: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/libcap-ng/libcap-ng-src: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/libcap-ng/libcap-ng-src: PKGSIZE changed from 75707 to 77348 (+2%)
packages/core2-32-poky-linux/libcap-ng/libcap-ng-src: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/libcap-ng/libcap-ng-staticdev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/libcap-ng/libcap-ng-staticdev: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/libcap-ng/libcap-ng: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/libcap-ng/libcap-ng: PV changed from "0.8.1" to "0.8.2"

--===============2151451481502361661==--
