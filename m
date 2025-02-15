Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9FAC282DE
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.8057.1739623333782655408
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bl3+BNxG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BhZBoXMg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019509a1a7e6-5ac71255-0134-4c04-b26d-efe3a54fc2bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uP48CLJfu0dqA7cJSWirgMga37zRMHJuOWzAgV80hxk=;
	b=bl3+BNxGeFB+dkoU2uNktAuRyF+2uPBmXAI4AOYq+xt8SpqwtJlJA5R80zbM1Rg7
	gzSs6DDwWIaFLfUgEtzAjY7cQhbWoPeBGyeVtAN1lP2RQFgsgrJFl6FW+BIlx1nDwp5
	0mKiGY63u7BEdIl2C/hkgYhNv+gBpXAbc9tdWUpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uP48CLJfu0dqA7cJSWirgMga37zRMHJuOWzAgV80hxk=;
	b=BhZBoXMgCfe/MqsfN3OFSKwjeeVYfjo5jd+4Zi8f/8X9NoCxpiuuDwmy6Uyv5Voo
	0JjU87jCCWEV0FliREMcaprtQDU5OZfzrVXG4IPg4EMowtvf3Zn8iE2w+xYqK0QVGD5
	Q1hQS5jkA0HUaXvf+1E+5zPDPjNq/NujaaASxbXc=
Content-Type: multipart/mixed; boundary="===============5490405958930458393=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libportal: upgrading to 0.9.1 SUCCEEDED
Message-ID: <0101019509a1a7e6-5ac71255-0134-4c04-b26d-efe3a54fc2bd-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211448

--===============5490405958930458393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libportal* to *0.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libportal-upgrade-0.9.0-0.9.1.patch
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

-- >8 --
From 29c1d5fb971e337617d4c658a0b242a93be89207 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 09:27:39 +0000
Subject: [PATCH] libportal: upgrade 0.9.0 -> 0.9.1

---
 .../libportal/{libportal_0.9.0.bb => libportal_0.9.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.9.0.bb => libportal_0.9.1.bb} (94%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.9.0.bb b/meta/recipes-gnome/libportal/libportal_0.9.1.bb
similarity index 94%
rename from meta/recipes-gnome/libportal/libportal_0.9.0.bb
rename to meta/recipes-gnome/libportal/libportal_0.9.1.bb
index 96c25b1db8..970db65bc5 100644
--- a/meta/recipes-gnome/libportal/libportal_0.9.0.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.9.1.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
-SRCREV = "731e7410fa5765e7c4eb76a51140a19637620c13"
+SRCREV = "8f5dc8d192f6e31dafe69e35219e3b707bde71ce"
 S = "${WORKDIR}/git"
 
 inherit meson gi-docgen gobject-introspection vala features_check pkgconfig
-- 
2.44.1


--===============5490405958930458393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libportal: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/libportal: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/libportal/libportal-dbg: PKGSIZE changed from 650640 to 662576 (+2%)
packages/core2-64-poky-linux/libportal/libportal-dbg: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/libportal/libportal-dbg: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/libportal/libportal-dev: PKGSIZE changed from 394279 to 394575 (+0%)
packages/core2-64-poky-linux/libportal/libportal-dev: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/libportal/libportal-dev: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/libportal/libportal-doc: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/libportal/libportal-doc: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/libportal/libportal-locale: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/libportal/libportal-locale: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/libportal/libportal-src: PKGSIZE changed from 484846 to 485800 (+0%)
packages/core2-64-poky-linux/libportal/libportal-src: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/libportal/libportal-src: FILELIST: removed "/usr/src/debug/libportal/0.9.0/libportal/settings.h /usr/src/debug/libportal/0.9.0/libportal/settings.c /usr/src/debug/libportal/0.9.0/libportal/inputcapture.c /usr/src/debug/libportal/0.9.0/libportal/background.c /usr/src/debug/libportal/0.9.0/libportal/inputcapture-zone.c /usr/src/debug/libportal/0.9.0/libportal/inputcapture.h /usr/src/debug/libportal/0.9.0/libportal/portal-helpers.h /usr/src/debug/libportal/0.9.0/libportal/filechooser.c /usr/src/debug/libportal/0.9.0/libportal/session-private.h /usr/src/debug/libportal/0.9.0/libportal/inputcapture-zone.h /usr/src/debug/libportal/0.9.0/libportal/background.h /usr/src/debug/libportal/0.9.0/libportal/notification.h /usr/src/debug/libportal/0.9.0/libportal/wallpaper.c /usr/src/debug/libportal/0.9.0/libportal/inputcapture-pointerbarrier.c /usr/src/debug/libportal/0.9.0/libportal/email.c /usr/src/debug/libportal/0.9.0/libportal/screenshot.c /usr/src/debug/libportal
 /0.9.0/libportal/notification.c /usr/src/debug/libportal/0.9.0/libportal/wallpaper.h /usr/src/debug/libportal/0.9.0/libportal/settings-private.h /usr/src/debug/libportal/0.9.0/libportal/email.h /usr/src/debug/libportal/0.9.0/libportal/remote.c /usr/src/debug/libportal/0.9.0/libportal/screenshot.h /usr/src/debug/libportal/0.9.0/libportal/dynamic-launcher.c /usr/src/debug/libportal/0.9.0/libportal/portal.c /usr/src/debug/libportal/0.9.0/libportal/dynamic-launcher.h /usr/src/debug/libportal/0.9.0/libportal/portal-gtk4.c /usr/src/debug/libportal/0.9.0/libportal/parent-private.h /usr/src/debug/libportal/0.9.0/libportal/portal-private.h /usr/src/debug/libportal/0.9.0/libportal/spawn.h /usr/src/debug/libportal/0.9.0/libportal/portal-gtk3.c /usr/src/debug/libportal/0.9.0/libportal/spawn.c /usr/src/debug/libportal/0.9.0/libportal/print.h /usr/src/debug/libportal/0.9.0/libportal/account.h /usr/src/debug/libportal/0.9.0/libportal/inhibit.h /usr/src/debug/libportal/0.9.0/libportal/openuri.h /us
 r/src/debug/libportal/0.9.0/libportal/session.h /usr/src/debug/libportal/0.9.0/libportal/updates.h /usr/src/debug/libportal/0.9.0/libportal/inhibit.c /usr/src/debug/libportal/0.9.0/libportal/account.c /usr/src/debug/libportal/0.9.0/libportal/openuri.c /usr/src/debug/libportal/0.9.0/libportal/print.c /usr/src/debug/libportal/0.9.0/libportal/session.c /usr/src/debug/libportal/0.9.0/libportal/location.c /usr/src/debug/libportal/0.9.0/libportal/updates.c /usr/src/debug/libportal/0.9.0/libportal/inputcapture-private.h /usr/src/debug/libportal/0.9.0/libportal/location.h /usr/src/debug/libportal/0.9.0/libportal/camera.h /usr/src/debug/libportal/0.9.0/libportal/inputcapture-pointerbarrier.h /usr/src/debug/libportal/0.9.0/libportal/parent.h /usr/src/debug/libportal/0.9.0/libportal/portal-enums.h /usr/src/debug/libportal/0.9.0/libportal/filechooser.h /usr/src/debug/libportal/0.9.0/libportal/remote.h /usr/src/debug/libportal/0.9.0/libportal/camera.c /usr/src/debug/libportal/0.9.0/libportal/typ
 es.h /usr/src/debug/libportal/0.9.0/libportal/trash.c /usr/src/debug/libportal/0.9.0/libportal/parent.c /usr/src/debug/libportal/0.9.0/libportal/portal-enums.c", added "/usr/src/debug/libportal/0.9.1/libportal/settings.h /usr/src/debug/libportal/0.9.1/libportal/settings.c /usr/src/debug/libportal/0.9.1/libportal/inputcapture.c /usr/src/debug/libportal/0.9.1/libportal/background.c /usr/src/debug/libportal/0.9.1/libportal/inputcapture-zone.c /usr/src/debug/libportal/0.9.1/libportal/inputcapture.h /usr/src/debug/libportal/0.9.1/libportal/portal-helpers.h /usr/src/debug/libportal/0.9.1/libportal/filechooser.c /usr/src/debug/libportal/0.9.1/libportal/session-private.h /usr/src/debug/libportal/0.9.1/libportal/inputcapture-zone.h /usr/src/debug/libportal/0.9.1/libportal/background.h /usr/src/debug/libportal/0.9.1/libportal/notification.h /usr/src/debug/libportal/0.9.1/libportal/wallpaper.c /usr/src/debug/libportal/0.9.1/libportal/inputcapture-pointerbarrier.c /usr/src/debug/libportal/0.9.1
 /libportal/email.c /usr/src/debug/libportal/0.9.1/libportal/screenshot.c /usr/src/debug/libportal/0.9.1/libportal/notification.c /usr/src/debug/libportal/0.9.1/libportal/wallpaper.h /usr/src/debug/libportal/0.9.1/libportal/settings-private.h /usr/src/debug/libportal/0.9.1/libportal/email.h /usr/src/debug/libportal/0.9.1/libportal/remote.c /usr/src/debug/libportal/0.9.1/libportal/screenshot.h /usr/src/debug/libportal/0.9.1/libportal/dynamic-launcher.c /usr/src/debug/libportal/0.9.1/libportal/portal.c /usr/src/debug/libportal/0.9.1/libportal/glib-backports.h /usr/src/debug/libportal/0.9.1/libportal/dynamic-launcher.h /usr/src/debug/libportal/0.9.1/libportal/portal-gtk4.c /usr/src/debug/libportal/0.9.1/libportal/parent-private.h /usr/src/debug/libportal/0.9.1/libportal/portal-private.h /usr/src/debug/libportal/0.9.1/libportal/spawn.h /usr/src/debug/libportal/0.9.1/libportal/portal-gtk3.c /usr/src/debug/libportal/0.9.1/libportal/spawn.c /usr/src/debug/libportal/0.9.1/libportal/print.h /
 usr/src/debug/libportal/0.9.1/libportal/account.h /usr/src/debug/libportal/0.9.1/libportal/inhibit.h /usr/src/debug/libportal/0.9.1/libportal/openuri.h /usr/src/debug/libportal/0.9.1/libportal/session.h /usr/src/debug/libportal/0.9.1/libportal/updates.h /usr/src/debug/libportal/0.9.1/libportal/inhibit.c /usr/src/debug/libportal/0.9.1/libportal/account.c /usr/src/debug/libportal/0.9.1/libportal/openuri.c /usr/src/debug/libportal/0.9.1/libportal/print.c /usr/src/debug/libportal/0.9.1/libportal/session.c /usr/src/debug/libportal/0.9.1/libportal/location.c /usr/src/debug/libportal/0.9.1/libportal/updates.c /usr/src/debug/libportal/0.9.1/libportal/inputcapture-private.h /usr/src/debug/libportal/0.9.1/libportal/location.h /usr/src/debug/libportal/0.9.1/libportal/camera.h /usr/src/debug/libportal/0.9.1/libportal/inputcapture-pointerbarrier.h /usr/src/debug/libportal/0.9.1/libportal/parent.h /usr/src/debug/libportal/0.9.1/libportal/portal-enums.h /usr/src/debug/libportal/0.9.1/libportal/fil
 echooser.h /usr/src/debug/libportal/0.9.1/libportal/remote.h /usr/src/debug/libportal/0.9.1/libportal/camera.c /usr/src/debug/libportal/0.9.1/libportal/types.h /usr/src/debug/libportal/0.9.1/libportal/trash.c /usr/src/debug/libportal/0.9.1/libportal/parent.c /usr/src/debug/libportal/0.9.1/libportal/portal-enums.c"
packages/core2-64-poky-linux/libportal/libportal-src: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/libportal/libportal-staticdev: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/libportal/libportal-staticdev: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/libportal/libportal: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/libportal/libportal: PKGV changed from 0.9.0 [default] to 0.9.1 [default]

--===============5490405958930458393==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libportal-upgrade-0.9.0-0.9.1.patch"

RnJvbSAyOWMxZDVmYjk3MWUzMzc2MTdkNGM2NThhMGIyNDJhOTNiZTg5MjA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDk6Mjc6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwb3J0YWw6IHVwZ3JhZGUgMC45LjAgLT4gMC45LjEKCi0tLQogLi4uL2xpYnBvcnRhbC97bGli
cG9ydGFsXzAuOS4wLmJiID0+IGxpYnBvcnRhbF8wLjkuMS5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdub21lL2xpYnBvcnRhbC97bGlicG9ydGFsXzAuOS4wLmJiID0+IGxpYnBvcnRhbF8w
LjkuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicG9ydGFs
L2xpYnBvcnRhbF8wLjkuMC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJwb3J0YWwvbGlicG9y
dGFsXzAuOS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJwb3J0YWwvbGlicG9ydGFsXzAuOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ25vbWUvbGlicG9ydGFsL2xpYnBvcnRhbF8wLjkuMS5iYgppbmRleCA5NmMyNWIxZGI4Li45
NzBkYjY1YmM1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicG9ydGFsL2xpYnBv
cnRhbF8wLjkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicG9ydGFsL2xpYnBvcnRh
bF8wLjkuMS5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJMR1BMLTMuMC1vbmx5IgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MzAwMDIwOGQ1MzllYzA2MWI4OTli
Y2UxZDljZTk0MDQiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9mbGF0cGFrLyR7QlBO
fS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiNzMxZTc0MTBmYTU3
NjVlN2M0ZWI3NmE1MTE0MGExOTYzNzYyMGMxMyIKK1NSQ1JFViA9ICI4ZjVkYzhkMTkyZjZlMzFk
YWZlNjllMzUyMTllM2I3MDdiZGU3MWNlIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJp
dCBtZXNvbiBnaS1kb2NnZW4gZ29iamVjdC1pbnRyb3NwZWN0aW9uIHZhbGEgZmVhdHVyZXNfY2hl
Y2sgcGtnY29uZmlnCi0tIAoyLjQ0LjEKCg==

--===============5490405958930458393==--

