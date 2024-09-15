Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C73CC3600D
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.115396.1726410841059629046
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XBvSKcyy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hV9YpixY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191f61ade00-a78322b5-e7f9-4a0b-8208-ae65815a3ffa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KzHYBfhplUTDZCi7jU5ttj1uG90hw/YjqGqVT7bvKPo=;
	b=XBvSKcyyJm1cyr4iJwWjgVcrIfpKlbexDcxJxfmACMsR0AXotYFDbBk5HAva9R2l
	HQjHHDdBNN8L+gB7A5xeiisdOL6hZQUR/q53BsaqEsXpaLPWMC7i1OF6XUrXxLYaiu9
	dsRW6nUJ+rd5zY3S6GGSqIQL3gpBJPyr80ryQY74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KzHYBfhplUTDZCi7jU5ttj1uG90hw/YjqGqVT7bvKPo=;
	b=hV9YpixYgHGYRpXjtI/cYzBpM8DsGIwiv1CzBGZqDRohMvBy+GyfkMGag4LyJVJW
	8x6JrDpRYHTcDfsdeZf0hYXo2yCMvauwMrlXEtvVy8HlxEqT8My2ZVtJo0KgMmbRJXW
	0gLR/qBmXK8+n03mkjbvdvji0a95G2OqXQQAP0Hc=
Content-Type: multipart/mixed; boundary="===============5111315861079788778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libevdev: upgrading to 1.13.3 SUCCEEDED
Message-ID: <01010191f61ade00-a78322b5-e7f9-4a0b-8208-ae65815a3ffa-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204565

--===============5111315861079788778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libevdev* to *1.13.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libevdev-upgrade-1.13.2-1.13.3.patch
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
From 293c5437bdd99e086557800a71f9b9075a31eef9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 14:27:57 +0000
Subject: [PATCH] libevdev: upgrade 1.13.2 -> 1.13.3

---
 .../libevdev/{libevdev_1.13.2.bb => libevdev_1.13.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.2.bb => libevdev_1.13.3.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.2.bb b/meta/recipes-support/libevdev/libevdev_1.13.3.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.2.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.3.bb
index fd2bfdad9b..b920b349cf 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.2.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "3eca86a6ce55b81d5bce910637fc451c8bbe373b1f9698f375c7f1ad0de3ac48"
+SRC_URI[sha256sum] = "abf1aace86208eebdd5d3550ffded4c8d73bb405b796d51c389c9d0604cbcfbf"
 
 inherit autotools pkgconfig
 
-- 
2.44.0


--===============5111315861079788778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libevdev: SRC_URI changed from "http://www.freedesktop.org/software/libevdev/libevdev-1.13.2.tar.xz" to "http://www.freedesktop.org/software/libevdev/libevdev-1.13.3.tar.xz"
packages/core2-64-poky-linux/libevdev: PKGV changed from 1.13.2 [default] to 1.13.3 [default]
packages/core2-64-poky-linux/libevdev: PV changed from "1.13.2" to "1.13.3"
packages/core2-64-poky-linux/libevdev/libevdev-dbg: PKGV changed from 1.13.2 [default] to 1.13.3 [default]
packages/core2-64-poky-linux/libevdev/libevdev-dbg: PV changed from "1.13.2" to "1.13.3"
packages/core2-64-poky-linux/libevdev/libevdev-dev: PKGV changed from 1.13.2 [default] to 1.13.3 [default]
packages/core2-64-poky-linux/libevdev/libevdev-dev: PV changed from "1.13.2" to "1.13.3"
packages/core2-64-poky-linux/libevdev/libevdev-doc: PKGV changed from 1.13.2 [default] to 1.13.3 [default]
packages/core2-64-poky-linux/libevdev/libevdev-doc: PV changed from "1.13.2" to "1.13.3"
packages/core2-64-poky-linux/libevdev/libevdev-locale: PKGV changed from 1.13.2 [default] to 1.13.3 [default]
packages/core2-64-poky-linux/libevdev/libevdev-locale: PV changed from "1.13.2" to "1.13.3"
packages/core2-64-poky-linux/libevdev/libevdev-src: PKGV changed from 1.13.2 [default] to 1.13.3 [default]
packages/core2-64-poky-linux/libevdev/libevdev-src: PKGSIZE changed from 284119 to 284347 (+0%)
packages/core2-64-poky-linux/libevdev/libevdev-src: PV changed from "1.13.2" to "1.13.3"
packages/core2-64-poky-linux/libevdev/libevdev-staticdev: PKGV changed from 1.13.2 [default] to 1.13.3 [default]
packages/core2-64-poky-linux/libevdev/libevdev-staticdev: PV changed from "1.13.2" to "1.13.3"
packages/core2-64-poky-linux/libevdev/libevdev: PKGV changed from 1.13.2 [default] to 1.13.3 [default]
packages/core2-64-poky-linux/libevdev/libevdev: PV changed from "1.13.2" to "1.13.3"

--===============5111315861079788778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libevdev-upgrade-1.13.2-1.13.3.patch"

RnJvbSAyOTNjNTQzN2JkZDk5ZTA4NjU1NzgwMGE3MWY5YjkwNzVhMzFlZWY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTQ6Mjc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJldmRldjogdXBncmFkZSAxLjEzLjIgLT4gMS4xMy4zCgotLS0KIC4uLi9saWJldmRldi97bGli
ZXZkZXZfMS4xMy4yLmJiID0+IGxpYmV2ZGV2XzEuMTMuMy5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L3tsaWJldmRldl8xLjEzLjIuYmIgPT4gbGliZXZkZXZf
MS4xMy4zLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2
ZGV2L2xpYmV2ZGV2XzEuMTMuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xp
YmV2ZGV2XzEuMTMuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJldmRldi9saWJldmRldl8xLjEzLjIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xpYmV2ZGV2XzEuMTMuMy5iYgppbmRleCBmZDJiZmRh
ZDliLi5iOTIwYjM0OWNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmRl
di9saWJldmRldl8xLjEzLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYv
bGliZXZkZXZfMS4xMy4zLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTgwYzU1MGIzMTk3YmNiOGRhN2Q3NTU3ZWJjYzNmYzQ2IFwKICAg
ICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuZnJlZWRlc2t0b3Au
b3JnL3NvZnR3YXJlL2xpYmV2ZGV2LyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIzZWNhODZhNmNlNTViODFkNWJjZTkxMDYzN2ZjNDUxYzhiYmUzNzNiMWY5Njk4ZjM3NWM3ZjFh
ZDBkZTNhYzQ4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFiZjFhYWNlODYyMDhlZWJkZDVkMzU1
MGZmZGVkNGM4ZDczYmI0MDViNzk2ZDUxYzM4OWM5ZDA2MDRjYmNmYmYiCiAKIGluaGVyaXQgYXV0
b3Rvb2xzIHBrZ2NvbmZpZwogCi0tIAoyLjQ0LjAKCg==

--===============5111315861079788778==--

