Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609CBC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4451.1655298222656828567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aJgiCD1m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010181677667fa-7f6955f4-02c9-44d0-ac20-ac70930582c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IQVTNauYPfI1mtROPu12urESXRu/rkTFVdraVtXUJOk=;
	b=aJgiCD1mrl6OgTsffRVZRjfhh4AZXu4PB7nebwqYmAWq7iSiy9UaPWIZs2U9FU0s
	0vvatUr3+4JM2Q1p/bVMAjVK0IplAL9qpveRWC+pPUt5+p53lEzk7ybdmVCdseHxV5a
	350PE5ULyPxM+PKU5HWW4drotySLXKYM3jjhhkyM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IQVTNauYPfI1mtROPu12urESXRu/rkTFVdraVtXUJOk=;
	b=DhbNmmaLLlRhDwjM3Wvpj48f8p7rOOA+ly8mCb7gVH9aw34k4SeW5DVJ0E38KA5U
	/lUsXxSMn5+fMRWtWZFfNwfZUuiVU2/1mKqgG02YZtLQV+/s9ZSQC3FzzIcO9UnNVVp
	I/Vug5HmoN4kqnxbyEyR06wKoyHHsbPEUBFr4HRU=
Content-Type: multipart/mixed; boundary="===============0108969339058793870=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.4.3 SUCCEEDED
Message-ID: 
 <01010181677667fa-7f6955f4-02c9-44d0-ac20-ac70930582c7-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:42 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166981

--===============0108969339058793870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dos2unix* to *7.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.4.2-7.4.3.patch
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
--===============0108969339058793870==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.4.2-7.4.3.patch"

From 4343a689c29f6377c1f6f81abb5f7a49a24e47c0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 13:03:38 +0000
Subject: [PATCH] dos2unix: upgrade 7.4.2 -> 7.4.3

---
 .../{dos2unix_7.4.2.bb => dos2unix_7.4.3.bb}  | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.4.2.bb => dos2unix_7.4.3.bb} (55%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.3.bb
similarity index 55%
rename from meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.4.3.bb
index 509a0a0ddc..39576ded47 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.3.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING.txt
+# +++ COPYING.txt
+# @@ -2,7 +2,7 @@
+#  See also http://www.freebsd.org/copyright/freebsd-license.html
+#  --------
+#  
+# -Copyright (C) 2009-2020  Erwin Waterlander
+# +Copyright (C) 2009-2022  Erwin Waterlander
+#  Copyright (C) 1998 Christian Wurll
+#  Copyright (C) 1998 Bernd Johannes Wuebben
+#  Copyright (C) 1994-1995 Benjamin Lin.
+# 
+#
+
 SUMMARY = "Convert text file line endings between CRLF and LF"
 DESCRIPTION = "The Dos2unix package includes utilities dos2unix and \
 unix2dos to convert plain text files in DOS or Mac format to Unix \
@@ -6,12 +28,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=8a7c3499a1142df819e727253cd53a12"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9641fc4af7b564646f533f3911074b7a"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "72596f0ae21faa25a07a872d4843bc885475115d"
+SRCREV = "dae6d4bbc42d03fabb89cde65ed89f22a165d16e"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.31.1


--===============0108969339058793870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.4.2" to "7.4.3"
packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.4.2" to "7.4.3"
packages/core2-32-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 192980 to 194047 (+1%)
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.4.2" to "7.4.3"
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.4.2" to "7.4.3"
packages/core2-32-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 192278 to 192350 (+0%)
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PV changed from "7.4.2" to "7.4.3"
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.4.2" to "7.4.3"
packages/core2-32-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix: PV changed from "7.4.2" to "7.4.3"
packages/core2-32-poky-linux/dos2unix/dos2unix: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-32-poky-linux/dos2unix: PV changed from "7.4.2" to "7.4.3"
packages/core2-32-poky-linux/dos2unix: PKGV changed from 7.4.2 [default] to 7.4.3 [default]

--===============0108969339058793870==--

