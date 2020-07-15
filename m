Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.116.1594831439027162535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7B85E01E9F; Wed, 15 Jul 2020 09:43:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3814FE01EB8
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:43:00 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpcsvc-proto: upgrading to 1.4.2 SUCCEEDED
Message-Id: <20200715164358.D7B85E01E9F@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:43:58 -0700 (PDT)
X-Groupsio-MsgNum: 140666
Content-Type: multipart/mixed; boundary="===============3024911281514637838=="

--===============3024911281514637838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpcsvc-proto* to *1.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rpcsvc-proto-upgrade-1.4.1-1.4.2.patch
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

--===============3024911281514637838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/rpcsvc-proto: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/rpcsvc-proto: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-dbg: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-dbg: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-dev: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-dev: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-doc: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-doc: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-locale: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-locale: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-src: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-src: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-staticdev: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto-staticdev: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/rpcsvc-proto/rpcsvc-proto: PV changed from "1.4.1" to "1.4.2"

--===============3024911281514637838==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-rpcsvc-proto-upgrade-1.4.1-1.4.2.patch"

From 111abf2a3aee0073e1cafff0e0724bc2cac5b068 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 07:13:29 +0000
Subject: [PATCH] rpcsvc-proto: upgrade 1.4.1 -> 1.4.2

---
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index f2e9e3975e..5aff2b56a6 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0daaf958d5531ab86169ec6e275e1517"
 SECTION = "libs"
 DEPENDS += "rpcsvc-proto-native"
 
-PV = "1.4.1"
+PV = "1.4.2"
 
-SRCREV = "e295c9a3b67752734995dfc057bfbf5313ed0d82"
+SRCREV = "6f54e54455c073d08a56ea627c6cd2355a40eb53"
 
 SRC_URI = "git://github.com/thkukuk/${BPN} \
            file://0001-Use-cross-compiled-rpcgen.patch \
-- 
2.17.1


--===============3024911281514637838==--
