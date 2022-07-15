Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC893CCA48F
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.936.1657900667516318321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EoXl5mJn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101018202948e78-e1c13763-cbeb-4d0e-8f51-75091715e049-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900666;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wwrWImsU4cEy7pEfcrMQynVMhGj1XYXjMid6/ZPKBqw=;
	b=EoXl5mJnLXo6ouOUtldhSQLap+e37KoH6bnGFTznFcXl92mTIozJMJkuVcqp90hY
	ZQzw1LY+C9RyGqfs683FsgVDhylFifUBXUJZh9AT7j74f7nFqLDZUxtAQ9n1WbIKp9k
	9og/7VnWKXWs91f+vE9YDugFOGDEQd1Hyqna0yL8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900666;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wwrWImsU4cEy7pEfcrMQynVMhGj1XYXjMid6/ZPKBqw=;
	b=YVwpZ/JO7xRdmNB9Ipe65pTPRxRMGwk3twPXL6DvKhkfunwVjB4Qgaptii9/qq0a
	2LQGlL1FDTa8R1C+MdikU081wMyDlzglUCgDfm1L+6hi2NAY/MonDdRKWeY5VHaK7EX
	EMC036bEw+RvZGjm5kDY0AXSDCdXgdx0/39SOhow=
Content-Type: multipart/mixed; boundary="===============3887652246686229093=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Armin Kuster <akuster@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libuv: upgrading to 1.44.2 SUCCEEDED
Message-ID: 
 <0101018202948e78-e1c13763-cbeb-4d0e-8f51-75091715e049-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168067

--===============3887652246686229093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libuv* to *1.44.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.44.1-1.44.2.patch
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
--===============3887652246686229093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libuv: PKGV changed from 1.44.1 [default] to 1.44.2 [default]
packages/core2-32-poky-linux/libuv: PV changed from "1.44.1" to "1.44.2"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGV changed from 1.44.1 [default] to 1.44.2 [default]
packages/core2-32-poky-linux/libuv/libuv-dbg: PV changed from "1.44.1" to "1.44.2"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 581804 to 582252 (+0%)
packages/core2-32-poky-linux/libuv/libuv-dev: PKGV changed from 1.44.1 [default] to 1.44.2 [default]
packages/core2-32-poky-linux/libuv/libuv-dev: PV changed from "1.44.1" to "1.44.2"
packages/core2-32-poky-linux/libuv/libuv-doc: PKGV changed from 1.44.1 [default] to 1.44.2 [default]
packages/core2-32-poky-linux/libuv/libuv-doc: PV changed from "1.44.1" to "1.44.2"
packages/core2-32-poky-linux/libuv/libuv-locale: PKGV changed from 1.44.1 [default] to 1.44.2 [default]
packages/core2-32-poky-linux/libuv/libuv-locale: PV changed from "1.44.1" to "1.44.2"
packages/core2-32-poky-linux/libuv/libuv-src: PKGV changed from 1.44.1 [default] to 1.44.2 [default]
packages/core2-32-poky-linux/libuv/libuv-src: PV changed from "1.44.1" to "1.44.2"
packages/core2-32-poky-linux/libuv/libuv-src: FILELIST: directory renamed /usr/src/debug/libuv/1.44.1-r0/git/include/uv -> /usr/src/debug/libuv/1.44.2-r0/git/include/uv, directory renamed /usr/src/debug/libuv/1.44.1-r0/git/src/unix -> /usr/src/debug/libuv/1.44.2-r0/git/src/unix, directory renamed /usr/src/debug/libuv/1.44.1-r0/git/include -> /usr/src/debug/libuv/1.44.2-r0/git/include, removed "/usr/src/debug/libuv/1.44.1-r0/git/src/strscpy.c /usr/src/debug/libuv/1.44.1-r0/git/src/heap-inl.h /usr/src/debug/libuv/1.44.1-r0/git/src/version.c /usr/src/debug/libuv/1.44.1-r0/git/src/timer.c /usr/src/debug/libuv/1.44.1-r0/git/src/inet.c /usr/src/debug/libuv/1.44.1-r0/git/src/threadpool.c /usr/src/debug/libuv/1.44.1-r0/git/src/random.c /usr/src/debug/libuv/1.44.1-r0/git/src/idna.h /usr/src/debug/libuv/1.44.1-r0/git/src/fs-poll.c /usr/src/debug/libuv/1.44.1-r0/git/src/strscpy.h /usr/src/debug/libuv/1.44.1-r0/git/src/uv-common.h /usr/src/debug/libuv/1.44.1-r0/git/src/queue.h /usr/src/debug/lib
 uv/1.44.1-r0/git/src/uv-data-getter-setters.c /usr/src/debug/libuv/1.44.1-r0/git/src/idna.c /usr/src/debug/libuv/1.44.1-r0/git/src/uv-common.c", added "/usr/src/debug/libuv/1.44.2-r0/git/src/inet.c /usr/src/debug/libuv/1.44.2-r0/git/src/strscpy.h /usr/src/debug/libuv/1.44.2-r0/git/src/threadpool.c /usr/src/debug/libuv/1.44.2-r0/git/src/uv-common.h /usr/src/debug/libuv/1.44.2-r0/git/src/queue.h /usr/src/debug/libuv/1.44.2-r0/git/src/random.c /usr/src/debug/libuv/1.44.2-r0/git/src/fs-poll.c /usr/src/debug/libuv/1.44.2-r0/git/src/strscpy.c /usr/src/debug/libuv/1.44.2-r0/git/src/uv-common.c /usr/src/debug/libuv/1.44.2-r0/git/src/uv-data-getter-setters.c /usr/src/debug/libuv/1.44.2-r0/git/src/timer.c /usr/src/debug/libuv/1.44.2-r0/git/src/heap-inl.h /usr/src/debug/libuv/1.44.2-r0/git/src/idna.c /usr/src/debug/libuv/1.44.2-r0/git/src/version.c /usr/src/debug/libuv/1.44.2-r0/git/src/strtok.h /usr/src/debug/libuv/1.44.2-r0/git/src/strtok.c /usr/src/debug/libuv/1.44.2-r0/git/src/idna.h"
packages/core2-32-poky-linux/libuv/libuv-src: PKGSIZE changed from 580688 to 585513 (+1%)
packages/core2-32-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.44.1 [default] to 1.44.2 [default]
packages/core2-32-poky-linux/libuv/libuv-staticdev: PV changed from "1.44.1" to "1.44.2"
packages/core2-32-poky-linux/libuv/libuv: PKGV changed from 1.44.1 [default] to 1.44.2 [default]
packages/core2-32-poky-linux/libuv/libuv: PV changed from "1.44.1" to "1.44.2"

--===============3887652246686229093==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.44.1-1.44.2.patch"

From 3a82a5fe4c547a20a57ab839a9218e2062853193 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 06:03:02 +0000
Subject: [PATCH] libuv: upgrade 1.44.1 -> 1.44.2

---
 .../libuv/{libuv_1.44.1.bb => libuv_1.44.2.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.44.1.bb => libuv_1.44.2.bb} (93%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.44.1.bb b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
similarity index 93%
rename from meta/recipes-connectivity/libuv/libuv_1.44.1.bb
rename to meta/recipes-connectivity/libuv/libuv_1.44.2.bb
index 4c96d80a65..4c1b8eed56 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.44.1.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d"
 
-SRCREV = "e8b7eb6908a847ffbe6ab2eec7428e43a0aa53a2"
+SRCREV = "0c1fa696aa502eb749c2c4735005f41ba00a27b8"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.31.1


--===============3887652246686229093==--

