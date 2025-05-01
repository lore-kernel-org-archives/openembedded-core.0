Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53843C3ABB0
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1802.1746113612252095661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=M10gOoEA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Taej/Ox+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101968c7b46aa-f3b92d14-f73b-413b-bb50-402fe38a7f7f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113611;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+fy6wajdjmdcl10gujMPzj4TpNIbdmtwwNhAXy0Ruyc=;
	b=M10gOoEAsbSzIUGw6dwwLm5KPjfipK1Mkrd0ENx1jzDkTWbGek/QMCjUYFy/QLbp
	gfe9D+nJrJd+kAP6ODJGxWs+cJ7NS8Ab47BA+V0puamix5Hlqh11RLfy4eJla0ac8G0
	6YXRttcEpRwtFrVBfj0boE5jNRHHaUrnb5dNH+JA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113611;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+fy6wajdjmdcl10gujMPzj4TpNIbdmtwwNhAXy0Ruyc=;
	b=Taej/Ox+JMBsYNZBfXWpXPC+uzYDYOZwAbPNEhnjAiKdOb1JYs62+RsZkiAuYN3+
	amtvhM6hB3HKEoSvNxWc8IvkPnpGbQuZhvWqOjoIv7ru6eliX3ZmDkxfKE89JN/48s4
	L1l0RKwJEhYnBFWNeQlgqMiaYEmD6mvIvqrhaOfY=
Content-Type: multipart/mixed; boundary="===============1712898534371645365=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxft: upgrading to 2.3.9 SUCCEEDED
Message-ID: <010101968c7b46aa-f3b92d14-f73b-413b-bb50-402fe38a7f7f-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215784

--===============1712898534371645365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxft* to *2.3.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxft-upgrade-2.3.8-2.3.9.patch
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
From 7f8bfa668207ff5e608deacd8ce8b679eee8ed96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 06:54:44 +0000
Subject: [PATCH] libxft: upgrade 2.3.8 -> 2.3.9

---
 .../xorg-lib/{libxft_2.3.8.bb => libxft_2.3.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.8.bb => libxft_2.3.9.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb
index 2699c1dfd7..0b7c736451 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb
@@ -20,7 +20,7 @@ PROVIDES = "xft"
 
 PE = "1"
 
-SRC_URI[sha256sum] = "5e8c3c4bc2d4c0a40aef6b4b38ed2fb74301640da29f6528154b5009b1c6dd49"
+SRC_URI[sha256sum] = "60a25b78945ed6932635b3bb1899a517d31df7456e69867ffba27f89ff3976f5"
 
 XORG_PN = "libXft"
 
-- 
2.47.1


--===============1712898534371645365==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxft-upgrade-2.3.8-2.3.9.patch"

RnJvbSA3ZjhiZmE2NjgyMDdmZjVlNjA4ZGVhY2Q4Y2U4YjY3OWVlZThlZDk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNjo1NDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhmdDogdXBncmFkZSAyLjMuOCAtPiAyLjMuOQoKLS0tCiAuLi4veG9yZy1saWIve2xpYnhmdF8y
LjMuOC5iYiA9PiBsaWJ4ZnRfMi4zLjkuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhmdF8yLjMuOC5iYiA9PiBsaWJ4ZnRfMi4zLjkuYmJ9
ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhm
dF8yLjMuOC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4ZnRfMi4zLjku
YmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctbGliL2xpYnhmdF8yLjMuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctbGliL2xpYnhmdF8yLjMuOS5iYgppbmRleCAyNjk5YzFkZmQ3Li4wYjdjNzM2NDUxIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGZ0XzIuMy44LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4ZnRfMi4zLjkuYmIKQEAg
LTIwLDcgKzIwLDcgQEAgUFJPVklERVMgPSAieGZ0IgogCiBQRSA9ICIxIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNWU4YzNjNGJjMmQ0YzBhNDBhZWY2YjRiMzhlZDJmYjc0MzAxNjQwZGEyOWY2
NTI4MTU0YjUwMDliMWM2ZGQ0OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MGEyNWI3ODk0NWVk
NjkzMjYzNWIzYmIxODk5YTUxN2QzMWRmNzQ1NmU2OTg2N2ZmYmEyN2Y4OWZmMzk3NmY1IgogCiBY
T1JHX1BOID0gImxpYlhmdCIKIAotLSAKMi40Ny4xCgo=

--===============1712898534371645365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxft: PV changed from "2.3.8" to "2.3.9"
packages/core2-64-poky-linux/libxft: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXft-2.3.8.tar.xz" to "https://www.x.org/releases//individual/lib/libXft-2.3.9.tar.xz"
packages/core2-64-poky-linux/libxft: PKGV changed from 2.3.8 [default] to 2.3.9 [default]
packages/core2-64-poky-linux/libxft/libxft-dbg: PV changed from "2.3.8" to "2.3.9"
packages/core2-64-poky-linux/libxft/libxft-dbg: PKGSIZE changed from 542888 to 542832 (-0%)
packages/core2-64-poky-linux/libxft/libxft-dbg: PKGV changed from 2.3.8 [default] to 2.3.9 [default]
packages/core2-64-poky-linux/libxft/libxft-dbg: FILELIST: removed "/usr/lib/.debug/libXft.so.2.3.8", added "/usr/lib/.debug/libXft.so.2.3.9"
packages/core2-64-poky-linux/libxft/libxft-dev: PV changed from "2.3.8" to "2.3.9"
packages/core2-64-poky-linux/libxft/libxft-dev: PKGSIZE changed from 18186 to 18061 (-1%)
packages/core2-64-poky-linux/libxft/libxft-dev: PKGV changed from 2.3.8 [default] to 2.3.9 [default]
packages/core2-64-poky-linux/libxft/libxft-doc: PV changed from "2.3.8" to "2.3.9"
packages/core2-64-poky-linux/libxft/libxft-doc: PKGSIZE changed from 40778 to 40750 (-0%)
packages/core2-64-poky-linux/libxft/libxft-doc: PKGV changed from 2.3.8 [default] to 2.3.9 [default]
packages/core2-64-poky-linux/libxft/libxft-locale: PV changed from "2.3.8" to "2.3.9"
packages/core2-64-poky-linux/libxft/libxft-locale: PKGV changed from 2.3.8 [default] to 2.3.9 [default]
packages/core2-64-poky-linux/libxft/libxft-src: PV changed from "2.3.8" to "2.3.9"
packages/core2-64-poky-linux/libxft/libxft-src: PKGSIZE changed from 12707 to 12626 (-1%)
packages/core2-64-poky-linux/libxft/libxft-src: PKGV changed from 2.3.8 [default] to 2.3.9 [default]
packages/core2-64-poky-linux/libxft/libxft-staticdev: PV changed from "2.3.8" to "2.3.9"
packages/core2-64-poky-linux/libxft/libxft-staticdev: PKGV changed from 2.3.8 [default] to 2.3.9 [default]
packages/core2-64-poky-linux/libxft/libxft: PV changed from "2.3.8" to "2.3.9"
packages/core2-64-poky-linux/libxft/libxft: PKGV changed from 2.3.8 [default] to 2.3.9 [default]
packages/core2-64-poky-linux/libxft/libxft: FILELIST: removed "/usr/lib/libXft.so.2.3.8", added "/usr/lib/libXft.so.2.3.9"
Changes to packages/core2-64-poky-linux/libxft (sysroot):
  /usr/lib/libXft.so.2 changed symlink target from libXft.so.2.3.8 to libXft.so.2.3.9
  /usr/lib/libXft.so changed symlink target from libXft.so.2.3.8 to libXft.so.2.3.9
  /usr/lib/libXft.so.2.3.8 moved to /usr/lib/libXft.so.2.3.9

--===============1712898534371645365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxft/libxft: FILELIST: removed "/usr/lib/libXft.so.2.3.8", added "/usr/lib/libXft.so.2.3.9"
Changes to packages/core2-64-poky-linux/libxft (sysroot):
  /usr/lib/libXft.so.2 changed symlink target from libXft.so.2.3.8 to libXft.so.2.3.9
  /usr/lib/libXft.so changed symlink target from libXft.so.2.3.8 to libXft.so.2.3.9
  /usr/lib/libXft.so.2.3.8 moved to /usr/lib/libXft.so.2.3.9

--===============1712898534371645365==--

