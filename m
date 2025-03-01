Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7042BC282D1
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.7180.1740828338146430776
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZBkyHr4q;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NjHNelu0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101955174651e-1a9c65ff-2197-4d57-a66a-711ea3c050e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hsFS72ZjYe2rWxH89oN6gLvIOfgKXgIYaxo7DwUWd9Y=;
	b=ZBkyHr4qof0UGPEql9eMzDoUKprDUFbQ6E9w3Me1jfRgUxoDgM+R2VR59h3LL+2A
	TYut6apK+wjRh7o5cB78ls3iK/GkYgHQD1zKJ93eddBfH5/d/f0eqBE1iRrh6h0NxF7
	Njbcry+T/P2u1EJTRr8b/QssTSKoT1JGreOlTNYo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hsFS72ZjYe2rWxH89oN6gLvIOfgKXgIYaxo7DwUWd9Y=;
	b=NjHNelu089xoCEUVu+Em56c25Bf6jkI7mpot9zfDplqkxDj85ruC5ZPL5tLgpMd0
	vp0LbRfMXdqBjEpHqPe4dg7x2o+EnLFoP6Ql+KPbliBwbm3OxOy/TnLii3O80maLnxI
	ubQZeFzAI3SFapiVFx3LDMV5S5VSVMiriRv6hcQE=
Content-Type: multipart/mixed; boundary="===============2829729394378301894=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xwayland: upgrading to 24.1.6 SUCCEEDED
Message-ID: <010101955174651e-1a9c65ff-2197-4d57-a66a-711ea3c050e7-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212164

--===============2829729394378301894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.5-24.1.6.patch
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
From 9e20013af9c1c0c82b16d7e1e0fbbf411e8af3fc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 10:39:45 +0000
Subject: [PATCH] xwayland: upgrade 24.1.5 -> 24.1.6

---
 .../xwayland/{xwayland_24.1.5.bb => xwayland_24.1.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.5.bb => xwayland_24.1.6.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.5.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
index 19a6384087..350b8e93cc 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cb4bd170e6fa6b545ba0567be8f693d2eeccfc62d04c67037dd14f06daad361d"
+SRC_URI[sha256sum] = "737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.44.1


--===============2829729394378301894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.5.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.6.tar.xz"
packages/core2-64-poky-linux/xwayland: PV changed from "24.1.5" to "24.1.6"
packages/core2-64-poky-linux/xwayland: PKGV changed from 24.1.5 [default] to 24.1.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12584592 to 12585280 (+0%)
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.5" to "24.1.6"
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.5 [default] to 24.1.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.5" to "24.1.6"
packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.5 [default] to 24.1.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.5" to "24.1.6"
packages/core2-64-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.5 [default] to 24.1.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.5" to "24.1.6"
packages/core2-64-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.5 [default] to 24.1.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8887828 to 8888752 (+0%)
packages/core2-64-poky-linux/xwayland/xwayland-src: PV changed from "24.1.5" to "24.1.6"
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.5 [default] to 24.1.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.5" to "24.1.6"
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.5 [default] to 24.1.6 [default]
packages/core2-64-poky-linux/xwayland/xwayland: PV changed from "24.1.5" to "24.1.6"
packages/core2-64-poky-linux/xwayland/xwayland: PKGV changed from 24.1.5 [default] to 24.1.6 [default]

--===============2829729394378301894==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.5-24.1.6.patch"

RnJvbSA5ZTIwMDEzYWY5YzFjMGM4MmIxNmQ3ZTFlMGZiYmY0MTFlOGFmM2ZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMDozOTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh3
YXlsYW5kOiB1cGdyYWRlIDI0LjEuNSAtPiAyNC4xLjYKCi0tLQogLi4uL3h3YXlsYW5kL3t4d2F5
bGFuZF8yNC4xLjUuYmIgPT4geHdheWxhbmRfMjQuMS42LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3t4d2F5bGFuZF8yNC4xLjUuYmIgPT4geHdheWxhbmRf
MjQuMS42LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5
bGFuZC94d2F5bGFuZF8yNC4xLjUuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQv
eHdheWxhbmRfMjQuMS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjUuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjYuYmIKaW5kZXggMTlh
NjM4NDA4Ny4uMzUwYjhlOTNjYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzI0LjEuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjQuMS42LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTUlU
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWRmODc5NTBhZjUxYWMy
YzU4MjIwOTQ1NTNlYTE4ODAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cueC5vcmcvYXJjaGl2
ZS9pbmRpdmlkdWFsL3hzZXJ2ZXIveHdheWxhbmQtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImNiNGJkMTcwZTZmYTZiNTQ1YmEwNTY3YmU4ZjY5M2QyZWVjY2ZjNjJkMDRjNjcw
MzdkZDE0ZjA2ZGFhZDM2MWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzM3ZTYxMmNhMzZiYmRm
NDE1YTkxMTY0NGViNzU5MmNmOTM4OTg0Njg0N2I0N2ZhNDZkYzcwNWJkNzU0ZDJkNyIKIAogVVBT
VFJFQU1fQ0hFQ0tfUkVHRVggPSAieHdheWxhbmQtKD9QPHB2ZXI+XGQrKFwuKD8hOTBcZClcZCsp
KylcLnRhciIKIAotLSAKMi40NC4xCgo=

--===============2829729394378301894==--

