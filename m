Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D57AC47089
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.19053.1652634914563237864
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PGmUjS7x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010180c8b78c97-653058d6-fd63-46df-a8d5-613c71d0b022-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fIF9W6p5R2kgZKl+NaP/U2r2MaYfoLkjFXH5lOoBPoQ=;
	b=PGmUjS7xh5VGW+g6KTeM+C0+feH3xAtMCihUehpaVL5YYWfK2+MasShYIaThF5gl
	rJEvHlA9+J77ePIvt3o/ondGgGxFAlMdPtC7KTonqxIri5Cd5zQMO88CvHnZjS988Tl
	t570jlmB8KwD17WAGOr7HxyDUfZtPdrExBST6qH8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fIF9W6p5R2kgZKl+NaP/U2r2MaYfoLkjFXH5lOoBPoQ=;
	b=Xd0jiEBIKG0kRj2ZbzH2b4c0mJhassE32EQ62m7ko+A72VfRqDQhT583TjXTrS8p
	p6ef6Zyp3jXu6tfUyX4mJtFPokD7xZBDzdiknHkJ/gstxbwfLym+vuxv3uXPc69i4wr
	fGjC5t9e8EgJwbRiY7/u+Q9YKpjPUkqdAdiPFISo=
Content-Type: multipart/mixed; boundary="===============0661593244756492411=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.20.2 SUCCEEDED
Message-ID: 
 <01010180c8b78c97-653058d6-fd63-46df-a8d5-613c71d0b022-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:13 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165640

--===============0661593244756492411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.20.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.20.1-1.20.2.patch
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
--===============0661593244756492411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-python: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.1.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.2.tar.xz"

--===============0661593244756492411==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.20.1-1.20.2.patch"

From 0c7365b11b9ff68ed39982a4e7f162a2bda26d43 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 15:24:53 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.20.1 -> 1.20.2

---
 ...reamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
index a8ae274631..34bc4bf4f4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ba6cd59faa3db3981d8c6982351c239d823c0b8e80b1acf58d2997b050289422"
+SRC_URI[sha256sum] = "853ea35a1088c762fb703e5aea9c30031a19222b59786b6599956e154620fa2f"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.31.1


--===============0661593244756492411==--

