Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAB4D5E363
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17197.1765872154647957023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=L5dwMm2J;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FZSQVUPK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b262ed6a1-1e3c2a39-39c1-46ad-9e1f-24e4bcf26912-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Af1Xmlf+XaW1xYEtxjrsh5CCcyPvwAjLPZqsr/CHTF4=;
	b=L5dwMm2JR+nHclAWbim06FGr6ApD6YGUBbVd83PEXNrOnPFUhJJcXW4E3/zZyMyP
	XyqDsaZNXlYmYWdqi64ik8mqfFKZvUDUrxWKmUZAT7gWLfdPT42KSgc3Cm0gXI1MCJk
	Dt1wBl0iCFxPqTAlhAl5KPmoo7hC+B4yc9zIdBaI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Af1Xmlf+XaW1xYEtxjrsh5CCcyPvwAjLPZqsr/CHTF4=;
	b=FZSQVUPK9AJlsGRfnqac0vG0H1LUZFuPXluPFcnCoGTkWJRYV2froKwytKE7MRU7
	PK4P1dROc7MbzDaFeolyqLoB1+Dv6Sc9vq+nWuvr2IAImNjJ3hNKs0BebUD21OhR5V6
	QdMq7MvOl4nEfYJzXEqrLFWOBwTp0Ydy9SG2JdMI=
Content-Type: multipart/mixed; boundary="===============4952049106252692433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-utils: upgrading to 1.3.0 SUCCEEDED
Message-ID: <0101019b262ed6a1-1e3c2a39-39c1-46ad-9e1f-24e4bcf26912-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227882

--===============4952049106252692433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-utils* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-utils-upgrade-1.2.0-1.3.0.patch
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
From db56b955d8067bb4902715de184d2cca72fe94c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:20:33 +0000
Subject: [PATCH] wayland-utils: upgrade 1.2.0 -> 1.3.0

---
 .../wayland/{wayland-utils_1.2.0.bb => wayland-utils_1.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-utils_1.2.0.bb => wayland-utils_1.3.0.bb} (90%)

diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
similarity index 90%
rename from meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
rename to meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
index 59d414a0a6..9a1828ccb0 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
+SRC_URI[sha256sum] = "a39d0e65617c6ae186d768c223f57060a3a435f6f9f02d03074f945313bfcf0d"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============4952049106252692433==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-utils-upgrade-1.2.0-1.3.0.patch"

RnJvbSBkYjU2Yjk1NWQ4MDY3YmI0OTAyNzE1ZGUxODRkMmNjYTcyZmU5NGMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6MjA6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXV0aWxzOiB1cGdyYWRlIDEuMi4wIC0+IDEuMy4wCgotLS0KIC4uLi93YXlsYW5kL3t3
YXlsYW5kLXV0aWxzXzEuMi4wLmJiID0+IHdheWxhbmQtdXRpbHNfMS4zLjAuYmJ9ICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3t3YXlsYW5kLXV0aWxzXzEuMi4wLmJiID0+IHdh
eWxhbmQtdXRpbHNfMS4zLjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3dheWxhbmQvd2F5bGFuZC11dGlsc18xLjIuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy93YXlsYW5kL3dheWxhbmQtdXRpbHNfMS4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC11dGlsc18x
LjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC11
dGlsc18xLjMuMC5iYgppbmRleCA1OWQ0MTRhMGE2Li45YTE4MjhjY2IwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXV0aWxzXzEuMi4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQtdXRpbHNfMS4zLjAuYmIKQEAg
LTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NTQ4
YTY2MDM4YTc3NDE1ZTFkZjUxMTE4NjI1ZTgzMmYgXAogICAgICAgICAgICAgICAgICAgICIKIAog
U1JDX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5k
LXV0aWxzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzLyR7QlBOfS0ke1BWfS50YXIueHoiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZDkyNzhjMjI1NTQ1ODY4ODE4MDI1NDA3NTFiY2M0MjU2OTI2
MmJmODBjZDlhYzliMGZkMTJmZjRiZDA5YTllNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMzlk
MGU2NTYxN2M2YWUxODZkNzY4YzIyM2Y1NzA2MGEzYTQzNWY2ZjlmMDJkMDMwNzRmOTQ1MzEzYmZj
ZjBkIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL3dheWxhbmQvd2F5bGFuZC11dGlscy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJyZWxlYXNlcy8oP1A8cHZlcj4uKykiCi0tIAoyLjQ3LjEKCg==

--===============4952049106252692433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-dbg: PKGSIZE changed from 151064 to 196264 (+30%)
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-src: PKGSIZE changed from 269154 to 447546 (+66%)
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils: PKGSIZE changed from 55944 to 72584 (+30%)

--===============4952049106252692433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/wayland-utils: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/1.2.0/downloads/wayland-utils-1.2.0.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/1.3.0/downloads/wayland-utils-1.3.0.tar.xz"
packages/x86-64-v3-poky-linux/wayland-utils: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/wayland-utils: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-dbg: PKGSIZE changed from 151064 to 196264 (+30%)
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-dbg: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-dbg: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-dev: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-dev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-doc: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-doc: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-locale: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-locale: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-src: FILELIST: removed "/usr/src/debug/wayland-utils/1.2.0/wayland-info/drm-lease-v1-client-protocol.h /usr/src/debug/wayland-utils/1.2.0/wayland-info/tablet-unstable-v2-protocol.c /usr/src/debug/wayland-utils/1.2.0/wayland-info/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.2.0/wayland-info/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/wayland-utils/1.2.0/wayland-info/presentation-time-client-protocol.h /usr/src/debug/wayland-utils/1.2.0/wayland-info/xdg-output-unstable-v1-protocol.c /usr/src/debug/wayland-utils/1.2.0/wayland-info/wayland-info.c /usr/src/debug/wayland-utils/1.2.0/wayland-info/tablet-unstable-v2-client-protocol.h /usr/src/debug/wayland-utils/1.2.0/wayland-info/presentation-time-protocol.c /usr/src/debug/wayland-utils/1.2.0/wayland-info/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.2.0/wayland-info/drm-lease-v1-protocol.c", added "/usr/src/debug/wayland-
 utils/1.3.0/wayland-info/drm-lease-v1-client-protocol.h /usr/src/debug/wayland-utils/1.3.0/wayland-info/color-representation-v1-protocol.c /usr/src/debug/wayland-utils/1.3.0/wayland-info/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.3.0/wayland-info/tablet-v2-client-protocol.h /usr/src/debug/wayland-utils/1.3.0/wayland-info/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/wayland-utils/1.3.0/wayland-info/color-representation-v1-client-protocol.h /usr/src/debug/wayland-utils/1.3.0/wayland-info/color-management-v1-protocol.c /usr/src/debug/wayland-utils/1.3.0/wayland-info/presentation-time-client-protocol.h /usr/src/debug/wayland-utils/1.3.0/wayland-info/xdg-output-unstable-v1-protocol.c /usr/src/debug/wayland-utils/1.3.0/wayland-info/wayland-info.c /usr/src/debug/wayland-utils/1.3.0/wayland-info/tablet-v2-protocol.c /usr/src/debug/wayland-utils/1.3.0/wayland-info/color-management-v1-client-protocol.h /usr/src/debug/wayland-utils/1.3.0/wayland-info/presen
 tation-time-protocol.c /usr/src/debug/wayland-utils/1.3.0/wayland-info/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/wayland-utils/1.3.0/wayland-info/drm-lease-v1-protocol.c"
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-src: PKGSIZE changed from 269154 to 447546 (+66%)
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-src: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-src: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-staticdev: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils-staticdev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils: PKGSIZE changed from 55944 to 72584 (+30%)
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils: PV changed from "1.2.0" to "1.3.0"
packages/x86-64-v3-poky-linux/wayland-utils/wayland-utils: PKGV changed from 1.2.0 [default] to 1.3.0 [default]

--===============4952049106252692433==--

