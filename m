Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.16465.1598724145521088421
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6469FE020D3; Sat, 29 Aug 2020 11:02:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.0 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C57FDE020ED
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:57 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.12 SUCCEEDED
Message-Id: <20200829180225.6469FE020D3@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:25 -0700 (PDT)
X-Groupsio-MsgNum: 141959
Content-Type: multipart/mixed; boundary="===============6758439849559700033=="

--===============6758439849559700033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *msmtp* to *1.8.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.11-1.8.12.patch
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

--===============6758439849559700033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/msmtp: PACKAGES: added "msmtp-locale-eo"

--===============6758439849559700033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/msmtp: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp: PACKAGES: added "msmtp-locale-eo"
packages/core2-32-poky-linux/msmtp: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 300052 to 300488 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 100590 to 100906 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGSIZE changed from 36822 to 37144 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGSIZE changed from 37530 to 37862 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGSIZE changed from 37412 to 37749 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 45396 to 45805 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGSIZE changed from 47185 to 47537 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 503248 to 504604 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-src: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.11" to "1.8.12"
packages/core2-32-poky-linux/msmtp/msmtp: PKGV changed from 1.8.11 [default] to 1.8.12 [default]
packages/core2-32-poky-linux/msmtp/msmtp: PV changed from "1.8.11" to "1.8.12"

--===============6758439849559700033==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.11-1.8.12.patch"

From a282f35a2f052bba2a132961fc815acad1bbe337 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 13:25:32 +0000
Subject: [PATCH] msmtp: upgrade 1.8.11 -> 1.8.12

---
 .../recipes-extended/msmtp/{msmtp_1.8.11.bb => msmtp_1.8.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.11.bb => msmtp_1.8.12.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.11.bb b/meta/recipes-extended/msmtp/msmtp_1.8.12.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.11.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.12.bb
index 804ed59b4e..54798f9e6f 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.11.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f25f0fa177ce9e0ad65c127e790a37f35fb64fee9e33d90345844c5c86780e60"
+SRC_URI[sha256sum] = "a86fef9477339923afefe974988a38e32d0feb90dfeeb88f7f55aac356a96354"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.17.1


--===============6758439849559700033==--
