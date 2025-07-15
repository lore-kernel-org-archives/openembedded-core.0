Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51853CA0ED8
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:03 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.12489.1752594939382042907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AaCcJso+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LmdC+3YG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101980eccae7f-4f3dbf23-d0f5-4aa1-95be-0ca5f2bf8713-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=phz5XwzqusqfOpnQqyOzKds/AyvXAEzVG3m2SL9mqa0=;
	b=AaCcJso+EXtwixfm49xm0JcakwZzuOTdFtih2YWT0Qi+kvhyEonqebuMfGd4oY1K
	5B0GZbvC9E5+gNY/PXy3lzQcfJSyKnvfZJKOWjwLQhXSdKMkhsg9heltqCmNhGLgtQ8
	hXyJHLxiCW86UbVScYNffrYkwlJ7iLwcP11Yd7A4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=phz5XwzqusqfOpnQqyOzKds/AyvXAEzVG3m2SL9mqa0=;
	b=LmdC+3YGJO2hAahw2V2hyMnMDQ4Ugtzd9DYU/Mv1UGDkh3Ahf6HR2g5L6LaFJypQ
	An0T3U9pkF1I5/TjKYTwrp3cg+vTX0Y9uLLLCfKmKicBN6GpRhW9hmg31AxtJvAUP91
	qLxKb4GWWn0f//0mN/ONtZtr3jSyfp1CtvwI+0do=
Content-Type: multipart/mixed; boundary="===============3895898578324797351=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xwayland: upgrading to 24.1.8 SUCCEEDED
Message-ID: <010101980eccae7f-4f3dbf23-d0f5-4aa1-95be-0ca5f2bf8713-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220382

--===============3895898578324797351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.6-24.1.8.patch
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
From 5e98870e19bae64ab376f02c08781c537ea39c64 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 14:21:59 +0000
Subject: [PATCH] xwayland: upgrade 24.1.6 -> 24.1.8

---
 .../xwayland/{xwayland_24.1.6.bb => xwayland_24.1.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.6.bb => xwayland_24.1.8.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
index 540ec100bd..900da524b3 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7"
+SRC_URI[sha256sum] = "c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e4cf3c0774d199907"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.47.1


--===============3895898578324797351==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.6-24.1.8.patch"

RnJvbSA1ZTk4ODcwZTE5YmFlNjRhYjM3NmYwMmMwODc4MWM1MzdlYTM5YzY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTQ6MjE6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyNC4xLjYgLT4gMjQuMS44CgotLS0KIC4uLi94d2F5bGFuZC97eHdh
eWxhbmRfMjQuMS42LmJiID0+IHh3YXlsYW5kXzI0LjEuOC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC97eHdheWxhbmRfMjQuMS42LmJiID0+IHh3YXlsYW5k
XzI0LjEuOC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjQuMS42LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5k
L3h3YXlsYW5kXzI0LjEuOC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS42LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS44LmJiCmluZGV4IDU0
MGVjMTAwYmQuLjkwMGRhNTI0YjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
d2F5bGFuZC94d2F5bGFuZF8yNC4xLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzI0LjEuOC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTVkZjg3OTUwYWY1MWFj
MmM1ODIyMDk0NTUzZWExODgwIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lngub3JnL2FyY2hp
dmUvaW5kaXZpZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI3MzdlNjEyY2EzNmJiZGY0MTVhOTExNjQ0ZWI3NTkyY2Y5Mzg5ODQ2ODQ3YjQ3
ZmE0NmRjNzA1YmQ3NTRkMmQ3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4OTA4ZDU3YzhlZDlj
ZWI4MjkzYzE2YmE3YWQ1YWY1MjJlZmFmMWJhN2U1MWY5ZTRjZjNjMDc3NGQxOTk5MDciCiAKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVyPlxkKyhcLig/ITkwXGQpXGQr
KSspXC50YXIiCiAKLS0gCjIuNDcuMQoK

--===============3895898578324797351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.6.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.8.tar.xz"
packages/core2-64-poky-linux/xwayland: PKGV changed from 24.1.6 [default] to 24.1.8 [default]
packages/core2-64-poky-linux/xwayland: PV changed from "24.1.6" to "24.1.8"
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12570920 to 12573688 (+0%)
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.6 [default] to 24.1.8 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.6" to "24.1.8"
packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGSIZE changed from 490 to 540 (+10%)
packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.6 [default] to 24.1.8 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.6" to "24.1.8"
packages/core2-64-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.6 [default] to 24.1.8 [default]
packages/core2-64-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.6" to "24.1.8"
packages/core2-64-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.6 [default] to 24.1.8 [default]
packages/core2-64-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.6" to "24.1.8"
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.6 [default] to 24.1.8 [default]
packages/core2-64-poky-linux/xwayland/xwayland-src: PV changed from "24.1.6" to "24.1.8"
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.6 [default] to 24.1.8 [default]
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.6" to "24.1.8"
packages/core2-64-poky-linux/xwayland/xwayland: PKGV changed from 24.1.6 [default] to 24.1.8 [default]
packages/core2-64-poky-linux/xwayland/xwayland: PV changed from "24.1.6" to "24.1.8"

--===============3895898578324797351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGSIZE changed from 490 to 540 (+10%)

--===============3895898578324797351==--

