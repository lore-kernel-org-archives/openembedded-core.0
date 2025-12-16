Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52096D5E39D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17191.1765872143528324452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W22K/kAT;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=P2WAyrHR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262ef1b6-df89ba1f-84a3-46dd-a4dc-704d94c4fd65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IpFa6rDrIfXhXsbo6Zdv8QfjKuZmJl6pgXKsAC+7OUs=;
	b=W22K/kATIqibTdZbINFPubr22VVKzYtL4uRO8pGGIB+drVuegc+xyv+qlFE1ZgCW
	efX4+YpM9KhWLqt5UPduHT75DMOsEZHpBiEY2RQ5F/awgSNl5LZxr/xSZVxNYpMkkem
	b/gq7lX4kkwuglLxcfx6nXAJFKveMooEChiiqAUk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IpFa6rDrIfXhXsbo6Zdv8QfjKuZmJl6pgXKsAC+7OUs=;
	b=P2WAyrHRohXkXOXs0zT8IoihigEHYQInU6e+rh5pLl/Kd+xkif9pZ8v+R6SubQgp
	gUGOJrKxgsqQFS3ZfbGMiY5t/FQNUsB0Pm8LtZySnktQq/nCNyvDRKfbrnNq8PLgGlv
	xgzHKUoFcmHGWGXkqVMdnfby5FUMQiPmbi6QoU08=
Content-Type: multipart/mixed; boundary="===============8555289347445153300=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libevdev: upgrading to 1.13.6 SUCCEEDED
Message-ID: <0101019b262ef1b6-df89ba1f-84a3-46dd-a4dc-704d94c4fd65-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227916

--===============8555289347445153300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libevdev* to *1.13.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libevdev-upgrade-1.13.5-1.13.6.patch
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
From 241e1fa3953ebde5692ba8929177be139bb9f2f1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:13:38 +0000
Subject: [PATCH] libevdev: upgrade 1.13.5 -> 1.13.6

---
 .../libevdev/{libevdev_1.13.5.bb => libevdev_1.13.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.5.bb => libevdev_1.13.6.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.5.bb b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.5.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.6.bb
index a42bd38489..4a2cfee4c1 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.5.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "89918ae7b7c13936e6482604a77a2bfbbb74544c5d039fde01c3fa1bdf639987"
+SRC_URI[sha256sum] = "73f215eccbd8233f414737ac06bca2687e67c44b97d2d7576091aa9718551110"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============8555289347445153300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libevdev: PV changed from "1.13.5" to "1.13.6"
packages/x86-64-v3-poky-linux/libevdev: SRC_URI changed from "http://www.freedesktop.org/software/libevdev/libevdev-1.13.5.tar.xz" to "http://www.freedesktop.org/software/libevdev/libevdev-1.13.6.tar.xz"
packages/x86-64-v3-poky-linux/libevdev: PKGV changed from 1.13.5 [default] to 1.13.6 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-dbg: PV changed from "1.13.5" to "1.13.6"
packages/x86-64-v3-poky-linux/libevdev/libevdev-dbg: PKGV changed from 1.13.5 [default] to 1.13.6 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-dev: PV changed from "1.13.5" to "1.13.6"
packages/x86-64-v3-poky-linux/libevdev/libevdev-dev: PKGV changed from 1.13.5 [default] to 1.13.6 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-doc: PV changed from "1.13.5" to "1.13.6"
packages/x86-64-v3-poky-linux/libevdev/libevdev-doc: PKGV changed from 1.13.5 [default] to 1.13.6 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-locale: PV changed from "1.13.5" to "1.13.6"
packages/x86-64-v3-poky-linux/libevdev/libevdev-locale: PKGV changed from 1.13.5 [default] to 1.13.6 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: PV changed from "1.13.5" to "1.13.6"
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: PKGSIZE changed from 285507 to 286660 (+0%)
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: FILELIST: directory renamed /usr/src/debug/libevdev/1.13.5/tools -> /usr/src/debug/libevdev/1.13.6/tools, directory renamed /usr/src/debug/libevdev/1.13.5/include/linux/linux -> /usr/src/debug/libevdev/1.13.6/include/linux/linux, directory renamed /usr/src/debug/libevdev/1.13.5/libevdev -> /usr/src/debug/libevdev/1.13.6/libevdev
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: PKGV changed from 1.13.5 [default] to 1.13.6 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-staticdev: PV changed from "1.13.5" to "1.13.6"
packages/x86-64-v3-poky-linux/libevdev/libevdev-staticdev: PKGV changed from 1.13.5 [default] to 1.13.6 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev: PV changed from "1.13.5" to "1.13.6"
packages/x86-64-v3-poky-linux/libevdev/libevdev: PKGV changed from 1.13.5 [default] to 1.13.6 [default]

--===============8555289347445153300==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libevdev-upgrade-1.13.5-1.13.6.patch"

RnJvbSAyNDFlMWZhMzk1M2ViZGU1NjkyYmE4OTI5MTc3YmUxMzliYjlmMmYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6MTM6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJldmRldjogdXBncmFkZSAxLjEzLjUgLT4gMS4xMy42CgotLS0KIC4uLi9saWJldmRldi97bGli
ZXZkZXZfMS4xMy41LmJiID0+IGxpYmV2ZGV2XzEuMTMuNi5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L3tsaWJldmRldl8xLjEzLjUuYmIgPT4gbGliZXZkZXZf
MS4xMy42LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2
ZGV2L2xpYmV2ZGV2XzEuMTMuNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xp
YmV2ZGV2XzEuMTMuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJldmRldi9saWJldmRldl8xLjEzLjUuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xpYmV2ZGV2XzEuMTMuNi5iYgppbmRleCBhNDJiZDM4
NDg5Li40YTJjZmVlNGMxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmRl
di9saWJldmRldl8xLjEzLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYv
bGliZXZkZXZfMS4xMy42LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTgwYzU1MGIzMTk3YmNiOGRhN2Q3NTU3ZWJjYzNmYzQ2IFwKICAg
ICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuZnJlZWRlc2t0b3Au
b3JnL3NvZnR3YXJlL2xpYmV2ZGV2LyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI4OTkxOGFlN2I3YzEzOTM2ZTY0ODI2MDRhNzdhMmJmYmJiNzQ1NDRjNWQwMzlmZGUwMWMzZmEx
YmRmNjM5OTg3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjczZjIxNWVjY2JkODIzM2Y0MTQ3Mzdh
YzA2YmNhMjY4N2U2N2M0NGI5N2QyZDc1NzYwOTFhYTk3MTg1NTExMTAiCiAKIGluaGVyaXQgYXV0
b3Rvb2xzIHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEKCg==

--===============8555289347445153300==--

