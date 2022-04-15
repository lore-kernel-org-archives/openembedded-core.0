Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5883C47085
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11826.1650052687461315447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dXwnF7JS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101802ecde347-bdd7e4c8-b106-4461-a177-f7491da90c0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iBlkkkpTA4k/ek+FcBLDSN1K/8zdyjb6DkcPji2rlfs=;
	b=dXwnF7JSTj8lz5FuvLktmPEgfbHcomk5guVWgXtXdz7utDI2OTQnQxA073/e+aFs
	qso0gzNgNpnzjf1kMrg6zIzDxV5ILZ3m5lOQbPIlunFv/5FpvuKQB8z153PaWIujhwa
	R/QgyJYV8FOp1lIrj+tY5pdwhdI/eDDjNGJWfN7k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iBlkkkpTA4k/ek+FcBLDSN1K/8zdyjb6DkcPji2rlfs=;
	b=DS9uw5PAJuTT/XiNsF2YMKUuuupC6rvXc7A7AFdWKVcNQrnbx7Umw7re0FeCB3j5
	qtRhZBym4pojHwRrvO+obQbcnJOyu1DeoPZl+5oykDDl95kTFtb0sYNkAlyN0zV0ch9
	8A7Yuf++7x0bTPGWNmpYzC6yA/us4XasMn74IvwU=
Content-Type: multipart/mixed; boundary="===============0892117132561872364=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-c: upgrading to 0.16 SUCCEEDED
Message-ID: 
 <010101802ecde347-bdd7e4c8-b106-4461-a177-f7491da90c0d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164454

--===============0892117132561872364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *json-c* to *0.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-json-c-upgrade-0.15-0.16.patch
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
--===============0892117132561872364==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-json-c-upgrade-0.15-0.16.patch"

From 71fddd74aedb0528767134011a57932d71a71bd4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 08:06:57 +0000
Subject: [PATCH] json-c: upgrade 0.15 -> 0.16

---
 meta/recipes-devtools/json-c/{json-c_0.15.bb => json-c_0.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/json-c/{json-c_0.15.bb => json-c_0.16.bb} (87%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.16.bb
similarity index 87%
rename from meta/recipes-devtools/json-c/json-c_0.15.bb
rename to meta/recipes-devtools/json-c/json-c_0.16.bb
index a4673a2f0e..fdec5ec9af 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
+SRC_URI[sha256sum] = "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
-- 
2.27.0


--===============0892117132561872364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/json-c/json-c: FILELIST: removed "/usr/lib/libjson-c.so.5.1.0", added "/usr/lib/libjson-c.so.5.2.0"
Changes to packages/core2-32-poky-linux/json-c (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.1.0 to libjson-c.so.5.2.0
  /usr/lib/libjson-c.so.5.1.0 moved to /usr/lib/libjson-c.so.5.2.0

--===============0892117132561872364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/json-c/json-c-dbg: PKGSIZE changed from 140852 to 144336 (+2%)
packages/core2-32-poky-linux/json-c/json-c-dbg: FILELIST: removed "/usr/lib/.debug/libjson-c.so.5.1.0", added "/usr/lib/.debug/libjson-c.so.5.2.0"
packages/core2-32-poky-linux/json-c/json-c-dbg: PKGV changed from 0.15 [default] to 0.16 [default]
packages/core2-32-poky-linux/json-c/json-c-dbg: PV changed from "0.15" to "0.16"
packages/core2-32-poky-linux/json-c/json-c-dev: PKGSIZE changed from 104342 to 107096 (+3%)
packages/core2-32-poky-linux/json-c/json-c-dev: PKGV changed from 0.15 [default] to 0.16 [default]
packages/core2-32-poky-linux/json-c/json-c-dev: PV changed from "0.15" to "0.16"
packages/core2-32-poky-linux/json-c/json-c-doc: PKGV changed from 0.15 [default] to 0.16 [default]
packages/core2-32-poky-linux/json-c/json-c-doc: PV changed from "0.15" to "0.16"
packages/core2-32-poky-linux/json-c/json-c-locale: PKGV changed from 0.15 [default] to 0.16 [default]
packages/core2-32-poky-linux/json-c/json-c-locale: PV changed from "0.15" to "0.16"
packages/core2-32-poky-linux/json-c/json-c-src: PKGSIZE changed from 235456 to 240175 (+2%)
packages/core2-32-poky-linux/json-c/json-c-src: PKGV changed from 0.15 [default] to 0.16 [default]
packages/core2-32-poky-linux/json-c/json-c-src: PV changed from "0.15" to "0.16"
packages/core2-32-poky-linux/json-c/json-c-staticdev: PKGSIZE changed from 257684 to 261102 (+1%)
packages/core2-32-poky-linux/json-c/json-c-staticdev: PKGV changed from 0.15 [default] to 0.16 [default]
packages/core2-32-poky-linux/json-c/json-c-staticdev: PV changed from "0.15" to "0.16"
packages/core2-32-poky-linux/json-c/json-c: FILELIST: removed "/usr/lib/libjson-c.so.5.1.0", added "/usr/lib/libjson-c.so.5.2.0"
packages/core2-32-poky-linux/json-c/json-c: PKGV changed from 0.15 [default] to 0.16 [default]
packages/core2-32-poky-linux/json-c/json-c: PV changed from "0.15" to "0.16"
packages/core2-32-poky-linux/json-c: PKGV changed from 0.15 [default] to 0.16 [default]
packages/core2-32-poky-linux/json-c: SRC_URI changed from "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.15.tar.gz" to "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.16.tar.gz"
packages/core2-32-poky-linux/json-c: PV changed from "0.15" to "0.16"
Changes to packages/core2-32-poky-linux/json-c (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.1.0 to libjson-c.so.5.2.0
  /usr/lib/libjson-c.so.5.1.0 moved to /usr/lib/libjson-c.so.5.2.0

--===============0892117132561872364==--

