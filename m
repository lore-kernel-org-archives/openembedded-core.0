Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B73C87FD2
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:36 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1430.1751386829723702343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jwDsoIlt;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BdOCm+iH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010197c6ca31c9-8f7100fc-64ea-4001-b484-a295dffdc342-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386829;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CPKN3i04HnwahkdkBIlqQNmoMANmVj+x3uoP3w5z8xI=;
	b=jwDsoIltUo37PwlseUdt8dmO6TiSMKEuz047Z4uKzKG5iId5OB1VdwS020KlaNr9
	KURvhLUNUqKu2AHbq95nKTwBA8iL9T39vqOHcTHIiw6R61AQTaH4ZXGfRRPu3/9CjiR
	+s2SF1gXZNJZnCVJQ3fvxDEO2sSUqD4bezH9fcms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386829;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CPKN3i04HnwahkdkBIlqQNmoMANmVj+x3uoP3w5z8xI=;
	b=BdOCm+iHqxvM4yCR7UIH1S7EaPnvG9lTp2YCM2aVTt/HHOxkqP1K5giezleQ+Njn
	gd5Hocu01giO5oW66puycVTIpyrXwlInEdeHiObaUcAt23bwcwx/KiRT3gs3bL7DKau
	+DtqHjrQZkcDxv2R+mVvY1AiFwDV6yvx7uQwlOuE=
Content-Type: multipart/mixed; boundary="===============0332669020177946129=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.26.3 SUCCEEDED
Message-ID: <01010197c6ca31c9-8f7100fc-64ea-4001-b484-a295dffdc342-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219692

--===============0332669020177946129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.26.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.26.2-1.26.3.patch
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
From 1f476e02f24a7bb5188e2990fc2851e89a902636 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 15:17:29 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.26.2 -> 1.26.3

---
 ...reamer1.0-python_1.26.2.bb => gstreamer1.0-python_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.2.bb => gstreamer1.0-python_1.26.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.3.bb
index 3c60e09d85..1f80063a0b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.3.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "757ae964c16a542d60708bcb8a67c56c5be83785c0d1c534b9b9366bf676746e"
+SRC_URI[sha256sum] = "9343b9a7c45f472498c24ddb6fea9aba5f1a24395ddbc0b79da6e485e42d1b12"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.47.1


--===============0332669020177946129==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.26.2-1.26.3.patch"

RnJvbSAxZjQ3NmUwMmYyNGE3YmI1MTg4ZTI5OTBmYzI4NTFlODlhOTAyNjM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNToxNzoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yNi4yIC0+IDEuMjYuMwoKLS0tCiAuLi5yZWFt
ZXIxLjAtcHl0aG9uXzEuMjYuMi5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjYuMy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yNi4yLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yNi4zLmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cHl0aG9uXzEuMjYuMi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjYuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8x
LjI2LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjYuMy5iYgppbmRleCAzYzYwZTA5ZDg1Li4xZjgwMDYzYTBiIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI2LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yNi4zLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3NTdhZTk2NGMxNmE1NDJkNjA3MDhiY2I4
YTY3YzU2YzViZTgzNzg1YzBkMWM1MzRiOWI5MzY2YmY2NzY3NDZlIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjkzNDNiOWE3YzQ1ZjQ3MjQ5OGMyNGRkYjZmZWE5YWJhNWYxYTI0Mzk1ZGRiYzBiNzlk
YTZlNDg1ZTQyZDFiMTIiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgog
UkRFUEVORFM6JHtQTn0gKz0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
IHB5dGhvbjMtcHlnb2JqZWN0IgotLSAKMi40Ny4xCgo=

--===============0332669020177946129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: FILELIST: added "/usr/lib/python3.13/site-packages/gi/overrides/__pycache__/GstApp.cpython-313.pyc /usr/lib/python3.13/site-packages/gi/overrides/GstApp.py"
Changes to packages/core2-64-poky-linux/gstreamer1.0-python (sysroot):
  /usr/lib/python3.13/site-packages/gi/overrides/GstApp.py was added
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/GstApp.cpython-313.pyc was added

--===============0332669020177946129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGSIZE changed from 210968 to 211512 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: FILELIST: added "/usr/lib/python3.13/site-packages/gi/overrides/__pycache__/GstApp.cpython-313.pyc /usr/lib/python3.13/site-packages/gi/overrides/GstApp.py"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGSIZE changed from 181940 to 185761 (+2%)
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.26.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.26.3.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-python: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: PV changed from "1.26.2" to "1.26.3"
Changes to packages/core2-64-poky-linux/gstreamer1.0-python (sysroot):
  /usr/lib/python3.13/site-packages/gi/overrides/GstApp.py was added
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/GstApp.cpython-313.pyc was added

--===============0332669020177946129==--

