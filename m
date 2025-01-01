Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8AEE7719B
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11334.1735723941377349030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X+fHly4c;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2FsU8GX5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019421357bb7-b79fe0ff-9f93-48bd-a226-abdd9fd33899-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723940;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QZtUjMjE41UUVljx/nN9cg8DLbEkVfPt0zA3MHMXySo=;
	b=X+fHly4cSHDBbev1q/HSn69YwNCH7Vwr1v7snIbplAA0KVUvCCUW5tjyiKGXhHqT
	WWZd9PIpMgOTgeD8Kn3pS5y4K14P0hsizfEyMIzqL1qAlLUuU9lwwh9DZvO+zzDP8B+
	EIsKV6HIU55HACDXNgd4t0OkliTiSyZR4/tRhZZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723940;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QZtUjMjE41UUVljx/nN9cg8DLbEkVfPt0zA3MHMXySo=;
	b=2FsU8GX5q2E/4b+dsmvKzB1X4b4F3WQCcQDmjADln3lyEM2a0Cf+xQGBW4lvoMSY
	2BStwKTW3xKyIgpcJ1G2V5izNPF1IUaK1N5SbhTI6+ozONOXypX+MX0kUXUYj2N4q0d
	MtMxlNbSQYWSRrFF492SGI+gMRC09cVfvuIKcVrM=
Content-Type: multipart/mixed; boundary="===============2597770862501069577=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] init-system-helpers: upgrading to 1.68 SUCCEEDED
Message-ID: <0101019421357bb7-b79fe0ff-9f93-48bd-a226-abdd9fd33899-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209204

--===============2597770862501069577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *init-system-helpers* to *1.68* has Succeeded.

Next steps:
    - apply the patch: git am 0001-init-system-helpers-upgrade-1.67-1.68.patch
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
From 6690b1fa8875737d86500a41459e05a54328ca1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 06:42:58 +0000
Subject: [PATCH] init-system-helpers: upgrade 1.67 -> 1.68

---
 ...{init-system-helpers_1.67.bb => init-system-helpers_1.68.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.67.bb => init-system-helpers_1.68.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.67.bb b/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.67.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.68.bb
index 1576f89a8c..036c86a536 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.67.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae"
 
-SRCREV = "7b1a5359d99c1667f7b81380c06686ddc57b8e71"
+SRCREV = "78486a4a2a305170b66ce4d907bedadbaed10daf"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 
-- 
2.44.1


--===============2597770862501069577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-dbg: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-dbg: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-dev: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-dev: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-doc: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-doc: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-locale: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-locale: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-service: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-service: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-src: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-src: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-staticdev: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers-staticdev: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers/init-system-helpers: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/init-system-helpers: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/init-system-helpers: PV changed from "1.67" to "1.68"

--===============2597770862501069577==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-init-system-helpers-upgrade-1.67-1.68.patch"

RnJvbSA2NjkwYjFmYTg4NzU3MzdkODY1MDBhNDE0NTllMDVhNTQzMjhjYTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNjo0Mjo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlu
aXQtc3lzdGVtLWhlbHBlcnM6IHVwZ3JhZGUgMS42NyAtPiAxLjY4CgotLS0KIC4uLntpbml0LXN5
c3RlbS1oZWxwZXJzXzEuNjcuYmIgPT4gaW5pdC1zeXN0ZW0taGVscGVyc18xLjY4LmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb3JlL2luaXRzY3JpcHRzL3tpbml0LXN5c3RlbS1oZWxwZXJzXzEuNjcu
YmIgPT4gaW5pdC1zeXN0ZW0taGVscGVyc18xLjY4LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2luaXRzY3JpcHRzL2luaXQtc3lzdGVtLWhlbHBlcnNfMS42Ny5iYiBi
L21ldGEvcmVjaXBlcy1jb3JlL2luaXRzY3JpcHRzL2luaXQtc3lzdGVtLWhlbHBlcnNfMS42OC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9pbml0
c2NyaXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEuNjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1jb3JlL2luaXRzY3JpcHRzL2luaXQtc3lzdGVtLWhlbHBlcnNfMS42OC5iYgppbmRleCAxNTc2
Zjg5YThjLi4wMzZjODZhNTM2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9pbml0c2Ny
aXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEuNjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
aW5pdHNjcmlwdHMvaW5pdC1zeXN0ZW0taGVscGVyc18xLjY4LmJiCkBAIC0xNiw3ICsxNiw3IEBA
IFNFQ1RJT04gPSAiYmFzZSIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgR1BMLTIuMC1vbmx5
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZGViaWFuL2NvcHlyaWdodDttZDU9YzRlYzIw
YWExNThmYTlkZTI2ZWUxYWNjZjc4ZGNhYWUiCiAKLVNSQ1JFViA9ICI3YjFhNTM1OWQ5OWMxNjY3
ZjdiODEzODBjMDY2ODZkZGM1N2I4ZTcxIgorU1JDUkVWID0gIjc4NDg2YTRhMmEzMDUxNzBiNjZj
ZTRkOTA3YmVkYWRiYWVkMTBkYWYiCiBTUkNfVVJJID0gImdpdDovL3NhbHNhLmRlYmlhbi5vcmcv
ZGViaWFuL2luaXQtc3lzdGVtLWhlbHBlcnMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0
ZXIiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj4oXGQrKFwuXGQrKSsp
KSg/IV9leHApIgogCi0tIAoyLjQ0LjEKCg==

--===============2597770862501069577==--

