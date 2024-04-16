Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9547CC3DA47
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.13597.1713248039189377481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Zw4C9Iiv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=s0RlibH2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58aa16b-1fc33a02-e5a5-4d4d-947c-7f462b3b565d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lss49ymIAw6fENG8fkePPJeHjAOv+spg69Z9HiHVbkI=;
	b=Zw4C9Iiv+8SZEty3gQqlEzFVtzMvt9GsOB/49ppCufjhAG87hbdCKiWglrsfOziA
	nnWbVweimRJGXpYlOXC3AdSBqCcF8YGNpnxCcH4dXb2P1nQluoOkRz/Hc1OelkGoZ7m
	yJGkfx5wmSV02/xzelvKTUiF3UYacRl5lEcCiKpI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lss49ymIAw6fENG8fkePPJeHjAOv+spg69Z9HiHVbkI=;
	b=s0RlibH2Ee7oAxDsBRK0QgyG3rgrgbZaSF/ORrBsnb6eikuabgJ4NAjzUeXeqUPk
	YU4xdNpxOdMHXiRY0JoD0dtCr7Sb1g/EVkPZZUVM/4b58Z9YtVaMzxp45hPCEcuN8/E
	3Xh0eo/kfp5wzlChlN3LRAJAYurMv8W159TevU6E=
Content-Type: multipart/mixed; boundary="===============0028770831426456848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwpe: upgrading to 1.16.0 SUCCEEDED
Message-ID: <0101018ee58aa16b-1fc33a02-e5a5-4d4d-947c-7f462b3b565d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198409

--===============0028770831426456848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwpe* to *1.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwpe-upgrade-1.14.2-1.16.0.patch
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
From ae1f4c8ef88f58f1940c6aa3b45a3e4cf8335b62 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 02:23:26 +0000
Subject: [PATCH] libwpe: upgrade 1.14.2 -> 1.16.0

---
 meta/recipes-sato/webkit/{libwpe_1.14.2.bb => libwpe_1.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.14.2.bb => libwpe_1.16.0.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.14.2.bb b/meta/recipes-sato/webkit/libwpe_1.16.0.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.14.2.bb
rename to meta/recipes-sato/webkit/libwpe_1.16.0.bb
index 03ee88193d..57f91ce87e 100644
--- a/meta/recipes-sato/webkit/libwpe_1.14.2.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.16.0.bb
@@ -11,7 +11,7 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8ae38022c50cb340c96fdbee1217f1e46ab57fbc1c8ba98142565abbedbe22ef"
+SRC_URI[sha256sum] = "c7f3a3c6b3d006790d486dc7cceda2b6d2e329de07f33bc47dfc53f00f334b2a"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.42.0


--===============0028770831426456848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.8.2", added "/usr/lib/libwpe-1.0.so.1.9.3"
Changes to packages/core2-64-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.8.2 to libwpe-1.0.so.1.9.3
  /usr/lib/libwpe-1.0.so.1.8.2 moved to /usr/lib/libwpe-1.0.so.1.9.3

--===============0028770831426456848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libwpe: SRC_URI changed from "https://wpewebkit.org/releases/libwpe-1.14.2.tar.xz" to "https://wpewebkit.org/releases/libwpe-1.16.0.tar.xz"
packages/core2-64-poky-linux/libwpe: PV changed from "1.14.2" to "1.16.0"
packages/core2-64-poky-linux/libwpe: PKGV changed from 1.14.2 [default] to 1.16.0 [default]
packages/core2-64-poky-linux/libwpe/libwpe-dbg: PV changed from "1.14.2" to "1.16.0"
packages/core2-64-poky-linux/libwpe/libwpe-dbg: PKGSIZE changed from 258912 to 260416 (+1%)
packages/core2-64-poky-linux/libwpe/libwpe-dbg: FILELIST: removed "/usr/lib/.debug/libwpe-1.0.so.1.8.2", added "/usr/lib/.debug/libwpe-1.0.so.1.9.3"
packages/core2-64-poky-linux/libwpe/libwpe-dbg: PKGV changed from 1.14.2 [default] to 1.16.0 [default]
packages/core2-64-poky-linux/libwpe/libwpe-dev: PV changed from "1.14.2" to "1.16.0"
packages/core2-64-poky-linux/libwpe/libwpe-dev: PKGSIZE changed from 263052 to 265366 (+1%)
packages/core2-64-poky-linux/libwpe/libwpe-dev: PKGV changed from 1.14.2 [default] to 1.16.0 [default]
packages/core2-64-poky-linux/libwpe/libwpe-doc: PV changed from "1.14.2" to "1.16.0"
packages/core2-64-poky-linux/libwpe/libwpe-doc: PKGV changed from 1.14.2 [default] to 1.16.0 [default]
packages/core2-64-poky-linux/libwpe/libwpe-locale: PV changed from "1.14.2" to "1.16.0"
packages/core2-64-poky-linux/libwpe/libwpe-locale: PKGV changed from 1.14.2 [default] to 1.16.0 [default]
packages/core2-64-poky-linux/libwpe/libwpe-src: PV changed from "1.14.2" to "1.16.0"
packages/core2-64-poky-linux/libwpe/libwpe-src: PKGSIZE changed from 252304 to 256120 (+2%)
packages/core2-64-poky-linux/libwpe/libwpe-src: PKGV changed from 1.14.2 [default] to 1.16.0 [default]
packages/core2-64-poky-linux/libwpe/libwpe-staticdev: PV changed from "1.14.2" to "1.16.0"
packages/core2-64-poky-linux/libwpe/libwpe-staticdev: PKGV changed from 1.14.2 [default] to 1.16.0 [default]
packages/core2-64-poky-linux/libwpe/libwpe: PV changed from "1.14.2" to "1.16.0"
packages/core2-64-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.8.2", added "/usr/lib/libwpe-1.0.so.1.9.3"
packages/core2-64-poky-linux/libwpe/libwpe: PKGV changed from 1.14.2 [default] to 1.16.0 [default]
Changes to packages/core2-64-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.8.2 to libwpe-1.0.so.1.9.3
  /usr/lib/libwpe-1.0.so.1.8.2 moved to /usr/lib/libwpe-1.0.so.1.9.3

--===============0028770831426456848==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwpe-upgrade-1.14.2-1.16.0.patch"

RnJvbSBhZTFmNGM4ZWY4OGY1OGYxOTQwYzZhYTNiNDVhM2U0Y2Y4MzM1YjYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDI6MjM6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ3cGU6IHVwZ3JhZGUgMS4xNC4yIC0+IDEuMTYuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQve2xpYndwZV8xLjE0LjIuYmIgPT4gbGlid3BlXzEuMTYuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc2F0by93ZWJraXQve2xpYndwZV8xLjE0LjIuYmIgPT4gbGlid3BlXzEuMTYuMC5iYn0g
KDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvbGlid3BlXzEuMTQu
Mi5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVfMS4xNi4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVf
MS4xNC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvbGlid3BlXzEuMTYu
MC5iYgppbmRleCAwM2VlODgxOTNkLi41N2Y5MWNlODdlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by93ZWJraXQvbGlid3BlXzEuMTQuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQvbGlid3BlXzEuMTYuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBpbmhlcml0IGNtYWtlIGZl
YXR1cmVzX2NoZWNrIHBrZ2NvbmZpZwogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIm9wZW5n
bCIKIAogU1JDX1VSSSA9ICJodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZXMvJHtCUE59LSR7
UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4YWUzODAyMmM1MGNiMzQwYzk2ZmRi
ZWUxMjE3ZjFlNDZhYjU3ZmJjMWM4YmE5ODE0MjU2NWFiYmVkYmUyMmVmIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImM3ZjNhM2M2YjNkMDA2NzkwZDQ4NmRjN2NjZWRhMmI2ZDJlMzI5ZGUwN2YzM2Jj
NDdkZmM1M2YwMGYzMzRiMmEiCiAKICMgVGhpcyBpcyBhIHR3ZWFrIG9mIHVwc3RyZWFtLXZlcnNp
b24taXMtZXZlbiBuZWVkZWQgYmVjYXVzZQogIyBpcHN0cmVhbSBkaXJlY3RvcnkgY29udGFpbnMg
dGFyYmFsbHMgZm9yIG90aGVyIGNvbXBvbmVudHMgYXMgd2VsbC4KLS0gCjIuNDIuMAoK

--===============0028770831426456848==--

