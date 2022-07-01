Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96236CCA497
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.39620.1656687063933018334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ifnQ7Uaw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181ba3e70b0-7fb38f85-de04-4e95-97f3-31d877131208-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687063;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=gYV5g4s15coYaStowOCM1vVQC7nrdwcP5czRp5z1Adk=;
	b=ifnQ7UawAd8HWqdykCTdNkV+3e5XbQJczrk/X+jBDhAaLC9HpnpALy8xe34wIQOY
	QCX6TGCQd68jCVMoocW8BlbVPpslS522YyziXQC9YLrhHCoa2k2Sf2h0UudkK1E4oif
	B5o4Z7QpBoF9PndYVKTbq9fOCCZ1bHtdgZmtPxUw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687063;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=gYV5g4s15coYaStowOCM1vVQC7nrdwcP5czRp5z1Adk=;
	b=C0IHVB4MjSlWVrfbSeY607qMOancUMq4Ahkgv7PhwT9vEgZLSgoqwI9RRXGTCje8
	AfA/cyBXuKcFDmx2g59KMJnqEle4tO9S69l7CMUF9b7LOahxRSgVBDn/iE2nxPG9TU9
	zNG3k9k4y0ObvcDZH5xi96pzCXsZpxHgqEjVREic=
Content-Type: multipart/mixed; boundary="===============3461592691516886514=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xcb-proto: upgrading to 1.15.2 SUCCEEDED
Message-ID: 
 <01010181ba3e70b0-7fb38f85-de04-4e95-97f3-31d877131208-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167505

--===============3461592691516886514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xcb-proto* to *1.15.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xcb-proto-upgrade-1.15-1.15.2.patch
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
--===============3461592691516886514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xcb-proto: PV changed from "1.15" to "1.15.2"
packages/core2-32-poky-linux/xcb-proto: PKGV changed from 1.15 [default] to 1.15.2 [default]
packages/core2-32-poky-linux/xcb-proto: SRC_URI changed from "https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-1.15.tar.xz" to "https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-1.15.2.tar.xz"
packages/core2-32-poky-linux/xcb-proto/python-xcbgen: PV changed from "1.15" to "1.15.2"
packages/core2-32-poky-linux/xcb-proto/python-xcbgen: PKGV changed from 1.15 [default] to 1.15.2 [default]
Changes to packages/core2-32-poky-linux/xcb-proto (sysroot):
  /usr/share/pkgconfig was added
  /usr/share/pkgconfig/xcb-proto.pc was added
  /usr/share/xcb/dbe.xml was added
  /usr/lib/pkgconfig was removed
  /usr/lib/pkgconfig/xcb-proto.pc was removed
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dbg: PV changed from "1.15" to "1.15.2"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dbg: PKGV changed from 1.15 [default] to 1.15.2 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dev: PV changed from "1.15" to "1.15.2"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dev: FILELIST: directory renamed /usr/lib/pkgconfig -> /usr/share/pkgconfig, added "/usr/share/xcb/dbe.xml"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dev: PKGSIZE changed from 680839 to 687980 (+1%)
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dev: PKGV changed from 1.15 [default] to 1.15.2 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-doc: PV changed from "1.15" to "1.15.2"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-doc: PKGV changed from 1.15 [default] to 1.15.2 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-locale: PV changed from "1.15" to "1.15.2"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-locale: PKGV changed from 1.15 [default] to 1.15.2 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-src: PV changed from "1.15" to "1.15.2"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-src: PKGV changed from 1.15 [default] to 1.15.2 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto-staticdev: PV changed from "1.15" to "1.15.2"
packages/core2-32-poky-linux/xcb-proto/xcb-proto-staticdev: PKGV changed from 1.15 [default] to 1.15.2 [default]
packages/core2-32-poky-linux/xcb-proto/xcb-proto: PV changed from "1.15" to "1.15.2"
packages/core2-32-poky-linux/xcb-proto/xcb-proto: PKGV changed from 1.15 [default] to 1.15.2 [default]

--===============3461592691516886514==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-xcb-proto-upgrade-1.15-1.15.2.patch"

From 696803616b9ba70d5b703d068ef1651b974b1445 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 10:59:39 +0000
Subject: [PATCH] xcb-proto: upgrade 1.15 -> 1.15.2

---
 .../xorg-proto/{xcb-proto_1.15.bb => xcb-proto_1.15.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.15.bb => xcb-proto_1.15.2.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
index 070fb62455..7ea71514ce 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d34c3b264e8365d16fa9db49179cfa3e9952baaf9275badda0f413966b65955f"
+SRC_URI[sha256sum] = "7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed"
 
 inherit autotools pkgconfig python3native
 
-- 
2.31.1


--===============3461592691516886514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/xcb-proto (sysroot):
  /usr/share/pkgconfig was added
  /usr/share/pkgconfig/xcb-proto.pc was added
  /usr/share/xcb/dbe.xml was added
  /usr/lib/pkgconfig was removed
  /usr/lib/pkgconfig/xcb-proto.pc was removed
packages/core2-32-poky-linux/xcb-proto/xcb-proto-dev: FILELIST: directory renamed /usr/lib/pkgconfig -> /usr/share/pkgconfig, added "/usr/share/xcb/dbe.xml"

--===============3461592691516886514==--

