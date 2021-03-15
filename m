Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.299.1615826520809447936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id DA9F338C1292
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburi-perl: upgrading to 5.08 SUCCEEDED
Message-ID: <MADEUP.166C91A8FBFD662D.17966@lists.openembedded.org>
X-Groupsio-MsgNum: 149493
Content-Type: multipart/mixed; boundary="===============2233746342784374578=="

--===============2233746342784374578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *liburi-perl* to *5.08* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburi-perl-upgrade-1.74-5.08.patch
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

--===============2233746342784374578==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-liburi-perl-upgrade-1.74-5.08.patch"

From c5386a59167e869725f72ade077a6665e232a3a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 06:11:56 +0000
Subject: [PATCH] liburi-perl: upgrade 1.74 -> 5.08

---
 .../perl/{liburi-perl_1.74.bb => liburi-perl_5.08.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.74.bb => liburi-perl_5.08.bb} (90%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.74.bb b/meta/recipes-devtools/perl/liburi-perl_5.08.bb
similarity index 90%
rename from meta/recipes-devtools/perl/liburi-perl_1.74.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.08.bb
index c27765bcbc..06509df5eb 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.74.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.08.bb
@@ -13,8 +13,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://www.cpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "892f7183b178af40f205ba37128225db"
-SRC_URI[sha256sum] = "a9c254f45f89cb1dd946b689dfe433095404532a4543bdaab0b71ce0fdcdd53d"
+SRC_URI[sha256sum] = "7e2c6fe3b1d5947da334fa558a96e748aaa619213b85bcdce5b5347d4d26c46e"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.17.1


--===============2233746342784374578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/liburi-perl: PKGV changed from 1.74 [default] to 5.08 [default]
packages/core2-32-poky-linux/liburi-perl: SRC_URI changed from "http://www.cpan.org/authors/id/E/ET/ETHER/URI-1.74.tar.gz file://ptest-perl/run-ptest" to "http://www.cpan.org/authors/id/E/ET/ETHER/URI-5.08.tar.gz file://ptest-perl/run-ptest"
packages/core2-32-poky-linux/liburi-perl: PV changed from "1.74" to "5.08"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-dbg: PKGV changed from 1.74 [default] to 5.08 [default]
packages/core2-32-poky-linux/liburi-perl/liburi-perl-dbg: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-dbg: PV changed from "1.74" to "5.08"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-dev: PKGV changed from 1.74 [default] to 5.08 [default]
packages/core2-32-poky-linux/liburi-perl/liburi-perl-dev: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-dev: PV changed from "1.74" to "5.08"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-doc: PKGV changed from 1.74 [default] to 5.08 [default]
packages/core2-32-poky-linux/liburi-perl/liburi-perl-doc: PKGSIZE changed from 97358 to 97589 (+0%)
packages/core2-32-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-doc: PV changed from "1.74" to "5.08"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-locale: PKGV changed from 1.74 [default] to 5.08 [default]
packages/core2-32-poky-linux/liburi-perl/liburi-perl-locale: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-locale: PV changed from "1.74" to "5.08"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-ptest: PKGV changed from 1.74 [default] to 5.08 [default]
packages/core2-32-poky-linux/liburi-perl/liburi-perl-ptest: PKGSIZE changed from 124887 to 125418 (+0%)
packages/core2-32-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-ptest: PV changed from "1.74" to "5.08"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-src: PKGV changed from 1.74 [default] to 5.08 [default]
packages/core2-32-poky-linux/liburi-perl/liburi-perl-src: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-src: PV changed from "1.74" to "5.08"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-staticdev: PKGV changed from 1.74 [default] to 5.08 [default]
packages/core2-32-poky-linux/liburi-perl/liburi-perl-staticdev: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-staticdev: PV changed from "1.74" to "5.08"
packages/core2-32-poky-linux/liburi-perl/liburi-perl: PKGV changed from 1.74 [default] to 5.08 [default]
packages/core2-32-poky-linux/liburi-perl/liburi-perl: PKGSIZE changed from 131704 to 132028 (+0%)
packages/core2-32-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl: PV changed from "1.74" to "5.08"
Changes to packages/core2-32-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm was added

--===============2233746342784374578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/liburi-perl/liburi-perl-dev: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-locale: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl-staticdev: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
packages/core2-32-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm"
Changes to packages/core2-32-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.32.1/URI/nntps.pm was added

--===============2233746342784374578==--
