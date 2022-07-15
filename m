Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD93C19F56
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.970.1657900669559509778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TlGz3tq6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101820294964a-3946a81b-5dfe-4a32-a2bb-928fbe273681-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=opc9r5WNclo+wQomuBz08XhJnE4SSvqiDmPL7oZnme0=;
	b=TlGz3tq6LIW2/rW5OagnJJFThMTJZHZNl7INwid13r0EK1g/CU7BkTYRyV68WFgk
	8XqFrcFjccetOxWXJttKBOFPk9wJpJLo7xnYoHObcY93x9GdKaBqa+uO1jUzrMxcVcN
	i5f6O/lKfTZ9+VXlk2tR9gPy8YB2HXWyI5OBHaIw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=opc9r5WNclo+wQomuBz08XhJnE4SSvqiDmPL7oZnme0=;
	b=GNbEclvOYZqnGT2bF8XPkez/ANhAc2dZktZ8nKGFelHl+eMLWgq9O3JbgCpP4htN
	8GkbuLxfmT1Vk0BvVDKe/VmdK9Owg7cVbFgX4EYd2+5rKKX/ChGABMzZJKq1bUzPpmb
	ICtFX/Q76JBPZi88BSAqx1hW/ndr26fkv54AfGqs=
Content-Type: multipart/mixed; boundary="===============3127417078991697515=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.26 SUCCEEDED
Message-ID: 
 <010101820294964a-3946a81b-5dfe-4a32-a2bb-928fbe273681-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168107

--===============3127417078991697515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wayland-protocols* to *1.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.25-1.26.patch
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
--===============3127417078991697515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.25" to "1.26"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.25 [default] to 1.26 [default]
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://wayland.freedesktop.org/releases/wayland-protocols-1.25.tar.xz" to "https://wayland.freedesktop.org/releases/wayland-protocols-1.26.tar.xz"
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/single-pixel-buffer was added
  /usr/share/wayland-protocols/staging/single-pixel-buffer/single-pixel-buffer-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.25" to "1.26"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.25 [default] to 1.26 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 472395 to 477229 (+1%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.25" to "1.26"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.25 [default] to 1.26 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/single-pixel-buffer/single-pixel-buffer-v1.xml"

--===============3127417078991697515==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.25-1.26.patch"

From 7d1a2d9de9fd56615118a20dc27dd4bdb66377c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 13:18:45 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.25 -> 1.26

---
 .../{wayland-protocols_1.25.bb => wayland-protocols_1.26.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.25.bb => wayland-protocols_1.26.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.26.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.26.bb
index 92ba296165..322f55dc71 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.26.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e759e822b75b571460"
+SRC_URI[sha256sum] = "c553384c1c68afd762fa537a2569cc9074fe7600da12d3472761e77a2ba56f13"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.31.1


--===============3127417078991697515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/single-pixel-buffer was added
  /usr/share/wayland-protocols/staging/single-pixel-buffer/single-pixel-buffer-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/single-pixel-buffer/single-pixel-buffer-v1.xml"

--===============3127417078991697515==--

