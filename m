Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685ADC87FCC
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:36 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1428.1751386807920747292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KIYyKYZF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EKz4atw8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010197c6ca2dc3-9d0d0f16-f124-460a-89f1-e8ccaca6cbaa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=quwoXwhI+5kers8u9wOXX/mSZie1gEpZRy+gapXUTeo=;
	b=KIYyKYZFOomQjJGwKmHU6Awu7ra3yXgiTY7sjYCYqTmPg7/1TDgRGA5KeECZEvNQ
	Aj6LNmImgRsgiX5P6bsB8Q/VbcVjZPqc88si/99XwlPciQAHNAfaT6w4raIWS/4FRpT
	qzHbGAqss1U5JYnq7mdcZWFPNuBfwukDAklDDRjI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=quwoXwhI+5kers8u9wOXX/mSZie1gEpZRy+gapXUTeo=;
	b=EKz4atw8GXK5KcXTvaWLUznIdGeQ/v5+U4oSlVRjSZDf9yIPzh1JobfIQhuns78T
	pS6gMygBf3ztImvyFUoslwNxkxChg1bAfCh1HCWJ5fFKcwDzFzOhBcToEkkJllBkaM8
	ge0AF95+3QnW33q/Q8xommTlVu4FN5qsJ89RrksE=
Content-Type: multipart/mixed; boundary="===============0698601036290905118=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xwayland: upgrading to 24.1.8 SUCCEEDED
Message-ID: <01010197c6ca2dc3-9d0d0f16-f124-460a-89f1-e8ccaca6cbaa-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219684

--===============0698601036290905118==
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
From 05f8835355110ad0cf22eda5dccf6975a1aec695 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 14:56:02 +0000
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


--===============0698601036290905118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGSIZE changed from 490 to 540 (+10%)

--===============0698601036290905118==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.6-24.1.8.patch"

RnJvbSAwNWY4ODM1MzU1MTEwYWQwY2YyMmVkYTVkY2NmNjk3NWExYWVjNjk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNDo1NjowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh3
YXlsYW5kOiB1cGdyYWRlIDI0LjEuNiAtPiAyNC4xLjgKCi0tLQogLi4uL3h3YXlsYW5kL3t4d2F5
bGFuZF8yNC4xLjYuYmIgPT4geHdheWxhbmRfMjQuMS44LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3t4d2F5bGFuZF8yNC4xLjYuYmIgPT4geHdheWxhbmRf
MjQuMS44LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5
bGFuZC94d2F5bGFuZF8yNC4xLjYuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQv
eHdheWxhbmRfMjQuMS44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjYuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjguYmIKaW5kZXggNTQw
ZWMxMDBiZC4uOTAwZGE1MjRiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzI0LjEuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjQuMS44LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTUlU
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWRmODc5NTBhZjUxYWMy
YzU4MjIwOTQ1NTNlYTE4ODAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cueC5vcmcvYXJjaGl2
ZS9pbmRpdmlkdWFsL3hzZXJ2ZXIveHdheWxhbmQtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjczN2U2MTJjYTM2YmJkZjQxNWE5MTE2NDRlYjc1OTJjZjkzODk4NDY4NDdiNDdm
YTQ2ZGM3MDViZDc1NGQyZDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzg5MDhkNTdjOGVkOWNl
YjgyOTNjMTZiYTdhZDVhZjUyMmVmYWYxYmE3ZTUxZjllNGNmM2MwNzc0ZDE5OTkwNyIKIAogVVBT
VFJFQU1fQ0hFQ0tfUkVHRVggPSAieHdheWxhbmQtKD9QPHB2ZXI+XGQrKFwuKD8hOTBcZClcZCsp
KylcLnRhciIKIAotLSAKMi40Ny4xCgo=

--===============0698601036290905118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xwayland: PKGV changed from 24.1.6 [default] to 24.1.8 [default]
packages/core2-64-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.6.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.8.tar.xz"
packages/core2-64-poky-linux/xwayland: PV changed from "24.1.6" to "24.1.8"
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12570904 to 12573672 (+0%)
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

--===============0698601036290905118==--

