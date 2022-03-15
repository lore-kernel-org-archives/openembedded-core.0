Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D20C38161
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.10406.1647349734994305275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=B0FQ05Ke;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db2237d-852156e5-a082-426c-b942-20f8c9fc2fad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349736;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M4eGcCgNCkKtN5cD4Q6RVvrmaxGMwW2KoMHr+ylxatA=;
	b=B0FQ05Kem6xnxfQvvn8Jagge/7zWJZAe3aBFdkG9iBYHtA0kuigKVvMlEWdd2IaN
	brT/BJv4SfXftB4PgRRV9HoED71yQdV66wPalNz0zlSOCbTN7D64KMdwXA6zGLHYJ32
	ghWE97U/1b6pdXLeU8pSerMYUN3IgvRUVPy6zMuE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349736;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M4eGcCgNCkKtN5cD4Q6RVvrmaxGMwW2KoMHr+ylxatA=;
	b=WJeDlSBWrNvd7zjdrY16vOyX8llDkdlswqAYPnmqEc1aK4Nxgp9hFzwn04NrWaVl
	NW5YQ3Esg2D4/FbD3PP0i8beVXsJdVGfk+UlcQyixaPRMwoYTe+SJACEar+yLU+y16o
	JAwJn37j+KFl7Hkg5OY6N4KfGSWp8DzC/+gucT0Q=
Content-Type: multipart/mixed; boundary="===============6999878141271666371=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.38.1 SUCCEEDED
Message-ID: 
 <0101017f8db2237d-852156e5-a082-426c-b942-20f8c9fc2fad-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:56 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163283

--===============6999878141271666371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sqlite3* to *3.38.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.38.0-3.38.1.patch
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
--===============6999878141271666371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2022/sqlite-autoconf-3380000.tar.gz" to "http://www.sqlite.org/2022/sqlite-autoconf-3380100.tar.gz"
packages/core2-32-poky-linux/sqlite3: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/sqlite3: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 648633 to 648807 (+0%)
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 4745932 to 4748432 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 9793993 to 9796922 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/sqlite3/sqlite3: PKGV changed from 3.38.0 [default] to 3.38.1 [default]

--===============6999878141271666371==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.38.0-3.38.1.patch"

From 0dae9eb0209a81a159a477f0e31176c335f7feb7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 13:08:12 +0000
Subject: [PATCH] sqlite3: upgrade 3.38.0 -> 3.38.1

---
 .../sqlite/{sqlite3_3.38.0.bb => sqlite3_3.38.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.38.0.bb => sqlite3_3.38.1.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.0.bb b/meta/recipes-support/sqlite/sqlite3_3.38.1.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.38.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.38.1.bb
index a797679f12..54b04d620e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.1.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "1c76e25dc63d9f3935e0f406aec520a33ee77cf54ea5147dffe1fae8369eff68"
+SRC_URI[sha256sum] = "8e3a8ceb9794d968399590d2ddf9d5c044a97dd83d38b9613364a245ec8a2fc4"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.27.0


--===============6999878141271666371==--

