Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3007C021B5
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:33 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8048.1739623329317375018
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NYv4AGt4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SGzW4NwR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019509a1bb29-e667aa48-4541-49d2-8d21-28a354ff6940-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PkRaIkNW5UhOW/6hdDnmxIdYrZ3cttlSjHUWN9NklxU=;
	b=NYv4AGt4mzieVMBTYyMM5WyX8nneK17U1icgKingns5Riwpt+yxx7b/hb8urpwbF
	0bq1YTfjxMfNCbXyfN9Zgq5rDG6SLF8YEalpE1FIUKpMjPIcBJyArrka1cWmghociGm
	5Y15OGh9/OYwmTP7gJ9//+5rbcsaM+8hdJ4LMGgo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PkRaIkNW5UhOW/6hdDnmxIdYrZ3cttlSjHUWN9NklxU=;
	b=SGzW4NwR2eoXXcCmQ5uOcNKBSm5mXv0/5iY+R+Fd1V/VwmYoX2HN0zgyegQgKH5f
	cM0yDE/Do30eaWtgic0mKm2LFRbVDshZ8rFsN+Gnzj1/SRN7SCk9NJ0PY1Kt6hws5Ce
	C5B5qOwu7rMsFqNk4KJ2RWUTRPOWNXqVr8eksptU=
Content-Type: multipart/mixed; boundary="===============9155803652961156604=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xwayland: upgrading to 24.1.5 SUCCEEDED
Message-ID: <0101019509a1bb29-e667aa48-4541-49d2-8d21-28a354ff6940-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211464

--===============9155803652961156604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.4-24.1.5.patch
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
From 1fc8eb24447e3d068772dee80564ee542bd3485f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 10:35:31 +0000
Subject: [PATCH] xwayland: upgrade 24.1.4 -> 24.1.5

---
 .../xwayland/{xwayland_24.1.4.bb => xwayland_24.1.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.4.bb => xwayland_24.1.5.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
index 6f8589ba5a..19a6384087 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d96a78dbab819f55750173444444995b5031ebdcc15b77afebbd8dbc02af34f4"
+SRC_URI[sha256sum] = "cb4bd170e6fa6b545ba0567be8f693d2eeccfc62d04c67037dd14f06daad361d"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.44.1


--===============9155803652961156604==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.4-24.1.5.patch"

RnJvbSAxZmM4ZWIyNDQ0N2UzZDA2ODc3MmRlZTgwNTY0ZWU1NDJiZDM0ODVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMTA6MzU6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyNC4xLjQgLT4gMjQuMS41CgotLS0KIC4uLi94d2F5bGFuZC97eHdh
eWxhbmRfMjQuMS40LmJiID0+IHh3YXlsYW5kXzI0LjEuNS5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC97eHdheWxhbmRfMjQuMS40LmJiID0+IHh3YXlsYW5k
XzI0LjEuNS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjQuMS40LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5k
L3h3YXlsYW5kXzI0LjEuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS40LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS41LmJiCmluZGV4IDZm
ODU4OWJhNWEuLjE5YTYzODQwODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
d2F5bGFuZC94d2F5bGFuZF8yNC4xLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzI0LjEuNS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTVkZjg3OTUwYWY1MWFj
MmM1ODIyMDk0NTUzZWExODgwIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lngub3JnL2FyY2hp
dmUvaW5kaXZpZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJkOTZhNzhkYmFiODE5ZjU1NzUwMTczNDQ0NDQ0OTk1YjUwMzFlYmRjYzE1Yjc3
YWZlYmJkOGRiYzAyYWYzNGY0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNiNGJkMTcwZTZmYTZi
NTQ1YmEwNTY3YmU4ZjY5M2QyZWVjY2ZjNjJkMDRjNjcwMzdkZDE0ZjA2ZGFhZDM2MWQiCiAKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVyPlxkKyhcLig/ITkwXGQpXGQr
KSspXC50YXIiCiAKLS0gCjIuNDQuMQoK

--===============9155803652961156604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.4.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.5.tar.xz"
packages/core2-64-poky-linux/xwayland: PKGV changed from 24.1.4 [default] to 24.1.5 [default]
packages/core2-64-poky-linux/xwayland: PV changed from "24.1.4" to "24.1.5"
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12583696 to 12584592 (+0%)
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.4 [default] to 24.1.5 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.4" to "24.1.5"
packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.4 [default] to 24.1.5 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.4" to "24.1.5"
packages/core2-64-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.4 [default] to 24.1.5 [default]
packages/core2-64-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.4" to "24.1.5"
packages/core2-64-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.4 [default] to 24.1.5 [default]
packages/core2-64-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.4" to "24.1.5"
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8888213 to 8887828 (-0%)
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.4 [default] to 24.1.5 [default]
packages/core2-64-poky-linux/xwayland/xwayland-src: PV changed from "24.1.4" to "24.1.5"
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.4 [default] to 24.1.5 [default]
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.4" to "24.1.5"
packages/core2-64-poky-linux/xwayland/xwayland: PKGV changed from 24.1.4 [default] to 24.1.5 [default]
packages/core2-64-poky-linux/xwayland/xwayland: PV changed from "24.1.4" to "24.1.5"

--===============9155803652961156604==--

