Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5262C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:34 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.18048.1743511394239408831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=b8IsCZgM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nnYcm8KL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f160e3a2-f3d60423-ca08-4f9e-84c9-bffd07d211e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511413;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tTASbISRJO2P7saLk1VW1ppEAOeAuRIEITTLsxTUFj0=;
	b=b8IsCZgMtCWA925TQ0DDFXgPTzB/+s7hoeskH6YCcxqtH+ilG0danMdg7FqGKEaR
	O4aLDEEGRwX5Sll3SRXKncOHt1nMAjLuEe3kXCa0HPxtPVKhrFB60g+cS7L/acFoN+3
	I0qgjh5b2xdfZIySJvtY90zoh/RpLpiK4QozpVog=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511413;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tTASbISRJO2P7saLk1VW1ppEAOeAuRIEITTLsxTUFj0=;
	b=nnYcm8KLvD9VnAHug1WR4teM9yygR8XQq8NeoqOOq6R0wDFb083N7Q7DBqNgviBY
	kVQRnDcxLE150MkO2XI5y8oXD9Zz2J9LBvgs3zj93yHa8wrC++TT6a3sqcElcHleSS5
	YuQ9kIMcYukEhI8HHmP5eS88Ad0z++jFEAGNbb0I=
Content-Type: multipart/mixed; boundary="===============1244512887339360017=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libevdev: upgrading to 1.13.4 SUCCEEDED
Message-ID: <01010195f160e3a2-f3d60423-ca08-4f9e-84c9-bffd07d211e2-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214121

--===============1244512887339360017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libevdev* to *1.13.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libevdev-upgrade-1.13.3-1.13.4.patch
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
From 1892a7526ea2c66ea3ec0067203a0ee1e093a28e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 12:19:40 +0000
Subject: [PATCH] libevdev: upgrade 1.13.3 -> 1.13.4

---
 .../libevdev/{libevdev_1.13.3.bb => libevdev_1.13.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.3.bb => libevdev_1.13.4.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.3.bb b/meta/recipes-support/libevdev/libevdev_1.13.4.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.3.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.4.bb
index b920b349cf..3ff64bd04b 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.3.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "abf1aace86208eebdd5d3550ffded4c8d73bb405b796d51c389c9d0604cbcfbf"
+SRC_URI[sha256sum] = "f00ab8d42ad8b905296fab67e13b871f1a424839331516642100f82ad88127cd"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============1244512887339360017==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libevdev-upgrade-1.13.3-1.13.4.patch"

RnJvbSAxODkyYTc1MjZlYTJjNjZlYTNlYzAwNjcyMDNhMGVlMWUwOTNhMjhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMjoxOTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmV2ZGV2OiB1cGdyYWRlIDEuMTMuMyAtPiAxLjEzLjQKCi0tLQogLi4uL2xpYmV2ZGV2L3tsaWJl
dmRldl8xLjEzLjMuYmIgPT4gbGliZXZkZXZfMS4xMy40LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYve2xpYmV2ZGV2XzEuMTMuMy5iYiA9PiBsaWJldmRldl8x
LjEzLjQuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZk
ZXYvbGliZXZkZXZfMS4xMy4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYvbGli
ZXZkZXZfMS4xMy40LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xpYmV2ZGV2XzEuMTMuMy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYvbGliZXZkZXZfMS4xMy40LmJiCmluZGV4IGI5MjBiMzQ5
Y2YuLjNmZjY0YmQwNGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2
L2xpYmV2ZGV2XzEuMTMuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmRldi9s
aWJldmRldl8xLjEzLjQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ODBjNTUwYjMxOTdiY2I4ZGE3ZDc1NTdlYmNjM2ZjNDYgXAogICAg
ICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5mcmVlZGVza3RvcC5v
cmcvc29mdHdhcmUvbGliZXZkZXYvJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImFiZjFhYWNlODYyMDhlZWJkZDVkMzU1MGZmZGVkNGM4ZDczYmI0MDViNzk2ZDUxYzM4OWM5ZDA2
MDRjYmNmYmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjAwYWI4ZDQyYWQ4YjkwNTI5NmZhYjY3
ZTEzYjg3MWYxYTQyNDgzOTMzMTUxNjY0MjEwMGY4MmFkODgxMjdjZCIKIAogaW5oZXJpdCBhdXRv
dG9vbHMgcGtnY29uZmlnCiAKLS0gCjIuNDcuMQoK

--===============1244512887339360017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libevdev: PV changed from "1.13.3" to "1.13.4"
packages/core2-64-poky-linux/libevdev: PKGV changed from 1.13.3 [default] to 1.13.4 [default]
packages/core2-64-poky-linux/libevdev: SRC_URI changed from "http://www.freedesktop.org/software/libevdev/libevdev-1.13.3.tar.xz" to "http://www.freedesktop.org/software/libevdev/libevdev-1.13.4.tar.xz"
packages/core2-64-poky-linux/libevdev/libevdev-dbg: PV changed from "1.13.3" to "1.13.4"
packages/core2-64-poky-linux/libevdev/libevdev-dbg: PKGSIZE changed from 223296 to 224288 (+0%)
packages/core2-64-poky-linux/libevdev/libevdev-dbg: PKGV changed from 1.13.3 [default] to 1.13.4 [default]
packages/core2-64-poky-linux/libevdev/libevdev-dev: PV changed from "1.13.3" to "1.13.4"
packages/core2-64-poky-linux/libevdev/libevdev-dev: PKGV changed from 1.13.3 [default] to 1.13.4 [default]
packages/core2-64-poky-linux/libevdev/libevdev-doc: PV changed from "1.13.3" to "1.13.4"
packages/core2-64-poky-linux/libevdev/libevdev-doc: PKGV changed from 1.13.3 [default] to 1.13.4 [default]
packages/core2-64-poky-linux/libevdev/libevdev-locale: PV changed from "1.13.3" to "1.13.4"
packages/core2-64-poky-linux/libevdev/libevdev-locale: PKGV changed from 1.13.3 [default] to 1.13.4 [default]
packages/core2-64-poky-linux/libevdev/libevdev-src: PV changed from "1.13.3" to "1.13.4"
packages/core2-64-poky-linux/libevdev/libevdev-src: PKGSIZE changed from 284347 to 284812 (+0%)
packages/core2-64-poky-linux/libevdev/libevdev-src: PKGV changed from 1.13.3 [default] to 1.13.4 [default]
packages/core2-64-poky-linux/libevdev/libevdev-staticdev: PV changed from "1.13.3" to "1.13.4"
packages/core2-64-poky-linux/libevdev/libevdev-staticdev: PKGV changed from 1.13.3 [default] to 1.13.4 [default]
packages/core2-64-poky-linux/libevdev/libevdev: PV changed from "1.13.3" to "1.13.4"
packages/core2-64-poky-linux/libevdev/libevdev: PKGV changed from 1.13.3 [default] to 1.13.4 [default]

--===============1244512887339360017==--

