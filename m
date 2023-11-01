Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2968C074FE
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8641.1698848702993284554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Uu0f36Uq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hxyfd8xF;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460b4f-a16a7692-ea17-4a72-9b67-a616b26c6049-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FJbl4XyPgzYcgq+rze/reKSgMvSyKv/o2rt02mm+dUw=;
	b=Uu0f36Uq91ghcL1X6kaazIrO9fC826QpC5/gdybl4bf9aV9okRpZ7HGUgk0j33fH
	WtczBNMIvzevqXmH+p7B+Rsx4cTgppjD/dpA3LtQnFU7GGu7Z20CFbpjwut8RV8XLqA
	g9R8vDopuFECbcD3JzcQ1IAxJQgUWs0tuauPLNoo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FJbl4XyPgzYcgq+rze/reKSgMvSyKv/o2rt02mm+dUw=;
	b=Hxyfd8xFrFIxUmLp8pPHJkaxiHMvzwoLyK5AFmEx7UwWawYw3gBIhlj7NndP5chS
	YsJwx+iTrBKbWwL3Ev7d+4+9+FlwESEjTPbT5+k3sRl4wPd43OgzNyr3VuuKAtRHEf7
	AbQbAUuft4R2yv9KxxZQ2moebN4oWpOFRAq7XidU=
Content-Type: multipart/mixed; boundary="===============6370115045690112542=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdrm: upgrading to 2.4.117 SUCCEEDED
Message-ID: <0101018b8b460b4f-a16a7692-ea17-4a72-9b67-a616b26c6049-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190005

--===============6370115045690112542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdrm* to *2.4.117* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.116-2.4.117.patch
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
From 687dc4e9216a081f412ec9ce9222f6449279e2c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:17:48 +0000
Subject: [PATCH] libdrm: upgrade 2.4.116 -> 2.4.117

---
 .../drm/{libdrm_2.4.116.bb => libdrm_2.4.117.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.116.bb => libdrm_2.4.117.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.116.bb b/meta/recipes-graphics/drm/libdrm_2.4.117.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.116.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.117.bb
index f0aaf314c6..3e6fb16e15 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.116.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.117.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a"
+SRC_URI[sha256sum] = "a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b"
 
 inherit meson pkgconfig manpages
 
-- 
2.39.2


--===============6370115045690112542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdrm: SRC_URI changed from "http://dri.freedesktop.org/libdrm/libdrm-2.4.116.tar.xz" to "http://dri.freedesktop.org/libdrm/libdrm-2.4.117.tar.xz"
packages/core2-64-poky-linux/libdrm: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PKGSIZE changed from 59888 to 60138 (+0%)
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-dbg: PKGSIZE changed from 1496512 to 1508768 (+1%)
packages/core2-64-poky-linux/libdrm/libdrm-dbg: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-dbg: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-dev: PKGSIZE changed from 746743 to 751707 (+1%)
packages/core2-64-poky-linux/libdrm/libdrm-dev: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-dev: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-doc: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-doc: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-drivers: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-drivers: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-etnaviv: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-etnaviv: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-exynos: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-exynos: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-freedreno: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-freedreno: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-intel: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-intel: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-locale: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-locale: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-nouveau: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-nouveau: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-omap: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-omap: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-radeon: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-radeon: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-src: PKGSIZE changed from 1651637 to 1662545 (+1%)
packages/core2-64-poky-linux/libdrm/libdrm-src: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-src: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-staticdev: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-staticdev: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-tests: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-tests: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm: PV changed from "2.4.116" to "2.4.117"

--===============6370115045690112542==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.116-2.4.117.patch"

RnJvbSA2ODdkYzRlOTIxNmEwODFmNDEyZWM5Y2U5MjIyZjY0NDkyNzllMmM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjoxNzo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRybTogdXBncmFkZSAyLjQuMTE2IC0+IDIuNC4xMTcKCi0tLQogLi4uL2RybS97bGliZHJtXzIu
NC4xMTYuYmIgPT4gbGliZHJtXzIuNC4xMTcuYmJ9ICAgICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2RybS97bGliZHJtXzIuNC4xMTYuYmIgPT4gbGliZHJtXzIuNC4xMTcu
YmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1f
Mi40LjExNi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC4xMTcuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2Ry
bS9saWJkcm1fMi40LjExNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9s
aWJkcm1fMi40LjExNy5iYgppbmRleCBmMGFhZjMxNGM2Li4zZTZmYjE2ZTE1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTE2LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC4xMTcuYmIKQEAgLTEzLDcgKzEzLDcgQEAg
REVQRU5EUyA9ICJsaWJwdGhyZWFkLXN0dWJzIgogU1JDX1VSSSA9ICJodHRwOi8vZHJpLmZyZWVk
ZXNrdG9wLm9yZy9saWJkcm0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI0NmM1M2Y0MDczNWVhM2QyNmQ2MTQyOTdmMTU1ZjYxMzFhNTEwNjI0YTI0
Mjc0ZjY1NGY2NDY5Y2E5MDUzMzlhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEyODg4ZDY5ZTNl
YjFjOGE3N2FkYzA4YTc1YTYwZmJhZTAxZjBkMjA4ZDI2ZjAzNGQxYTEyZTM2MjM2MTI0MmIiCiAK
IGluaGVyaXQgbWVzb24gcGtnY29uZmlnIG1hbnBhZ2VzCiAKLS0gCjIuMzkuMgoK

--===============6370115045690112542==--

