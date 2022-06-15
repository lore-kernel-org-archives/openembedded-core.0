Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF87C2BBE7
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.4455.1655298220997218664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=maDBvXHQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101018167765fa2-2322076a-b2f8-427e-a13e-a2b20075d70a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2RyDK5wElQpTAZzswhnuzZEcsPbi5Chywkjqg+5oEfg=;
	b=maDBvXHQJkkSj+juLRwaKkeuzDLMlJfrdvrEdx4LOEEP4BLkpTad2Nwg1MBCBEH/
	9+mzdlxUI0TRdndOVi2TvlevF7DJCI08KbaYvoFqYCi34pwJ0oC7O3RCbfFlsdNvsJ5
	3GmtvW/Z/jCQ08XUvgiZYOlN0r3HhESkcGx9Zkdk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2RyDK5wElQpTAZzswhnuzZEcsPbi5Chywkjqg+5oEfg=;
	b=TLwt1AkwUP5hYjSgUKlaN7+ryRRpZOTattu0QP3Mm9O+PWE4MXFIDIzwc7hFZ1yn
	rryVBjdJeunVEgXwQr9JQGOOxS0jfBucEvbgvd2nLKDk1nQZCNT8O64Od2jad+lXl7a
	YWO1Jo7eArlg5kgnjswQHYOqCLHVGULcT964MY8E=
Content-Type: multipart/mixed; boundary="===============7402148668798064010=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] file: upgrading to 5.42 SUCCEEDED
Message-ID: 
 <0101018167765fa2-2322076a-b2f8-427e-a13e-a2b20075d70a-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166940

--===============7402148668798064010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *file* to *5.42* has Succeeded.

Next steps:
    - apply the patch: git am 0001-file-upgrade-5.41-5.42.patch
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
--===============7402148668798064010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/file/file-dbg: PKGSIZE changed from 504944 to 516608 (+2%)
packages/core2-32-poky-linux/file/file-dbg: PV changed from "5.41" to "5.42"
packages/core2-32-poky-linux/file/file-dbg: PKGV changed from 5.41 [default] to 5.42 [default]
packages/core2-32-poky-linux/file/file-dev: PV changed from "5.41" to "5.42"
packages/core2-32-poky-linux/file/file-dev: PKGV changed from 5.41 [default] to 5.42 [default]
packages/core2-32-poky-linux/file/file-doc: PV changed from "5.41" to "5.42"
packages/core2-32-poky-linux/file/file-doc: PKGV changed from 5.41 [default] to 5.42 [default]
packages/core2-32-poky-linux/file/file-locale: PV changed from "5.41" to "5.42"
packages/core2-32-poky-linux/file/file-locale: PKGV changed from 5.41 [default] to 5.42 [default]
packages/core2-32-poky-linux/file/file-src: PKGSIZE changed from 489631 to 499766 (+2%)
packages/core2-32-poky-linux/file/file-src: PV changed from "5.41" to "5.42"
packages/core2-32-poky-linux/file/file-src: PKGV changed from 5.41 [default] to 5.42 [default]
packages/core2-32-poky-linux/file/file-staticdev: PV changed from "5.41" to "5.42"
packages/core2-32-poky-linux/file/file-staticdev: PKGV changed from 5.41 [default] to 5.42 [default]
packages/core2-32-poky-linux/file/file: PKGSIZE changed from 7466297 to 7955473 (+7%)
packages/core2-32-poky-linux/file/file: PV changed from "5.41" to "5.42"
packages/core2-32-poky-linux/file/file: PKGV changed from 5.41 [default] to 5.42 [default]
packages/core2-32-poky-linux/file: PV changed from "5.41" to "5.42"
packages/core2-32-poky-linux/file: PKGV changed from 5.41 [default] to 5.42 [default]

--===============7402148668798064010==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-file-upgrade-5.41-5.42.patch"

From ed6f747bf396968fc8de53d75ba9014709d8b892 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 07:21:20 +0000
Subject: [PATCH] file: upgrade 5.41 -> 5.42

---
 meta/recipes-devtools/file/{file_5.41.bb => file_5.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.41.bb => file_5.42.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.41.bb b/meta/recipes-devtools/file/file_5.42.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.41.bb
rename to meta/recipes-devtools/file/file_5.42.bb
index 653887e97a..8efcf09c9c 100644
--- a/meta/recipes-devtools/file/file_5.41.bb
+++ b/meta/recipes-devtools/file/file_5.42.bb
@@ -13,7 +13,7 @@ DEPENDS:class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
 
-SRCREV = "504206e53a89fd6eed71aeaf878aa3512418eab1"
+SRCREV = "a42b38690579de23403e0aff9b7b2f9cdf55f534"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.31.1


--===============7402148668798064010==--

