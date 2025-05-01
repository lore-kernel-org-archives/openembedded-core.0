Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD98C3ABC9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:34:08 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1793.1746113618967861266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cL9U4Sry;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mCQW53f1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7bbc1c-8f72fe23-2c12-431d-a8e9-09fb16830671-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113641;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1oQqVfRKfmGGLov6oYC+W8lqaEUe7WCKMZlvo48FvKc=;
	b=cL9U4Sryxf+uIFZhemAJzUQAvG+kBuLhHYsm4MWDXOSMzFrJoWB3vagXNruWJbWR
	CpiHrQP69YLx8xnxDYJ6h0IECFmxiwEdfvS5VqVPPPSjsBwELe8nKP2QUGr++DvUopa
	b0NrLDfFtH7wZRj3iX6BL3hK1VsmdjYLN+sSf2ZM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113641;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1oQqVfRKfmGGLov6oYC+W8lqaEUe7WCKMZlvo48FvKc=;
	b=mCQW53f1B1a3DDl1CV0XbbV2A3FeGyfYPx2AELB3YoNqLSnBgblbUzCkBm7Q5pbP
	Ui4BBg0H5GCDnx/82b2eR0+CK2vK98TDaFmBD8Nis9FR6Yj6Qjgt20K0qvNSUNTR3HN
	zAQcpc9Af6ocNP9U7Lkt9mMKUcU2tW00WtNE+Iz0=
Content-Type: multipart/mixed; boundary="===============5727349156370944641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjitterentropy: upgrading to 3.6.3 SUCCEEDED
Message-ID: <010101968c7bbc1c-8f72fe23-2c12-431d-a8e9-09fb16830671-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215897

--===============5727349156370944641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libjitterentropy* to *3.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjitterentropy-upgrade-3.6.2-3.6.3.patch
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
From 581d41599930d1c51788bbb25484b5642b19abf6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 15:13:40 +0000
Subject: [PATCH] libjitterentropy: upgrade 3.6.2 -> 3.6.3

---
 .../{libjitterentropy_3.6.2.bb => libjitterentropy_3.6.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.2.bb => libjitterentropy_3.6.3.bb} (95%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.2.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
similarity index 95%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.2.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
index 54a866c432..704e06f5ce 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.2.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "ddcf1124801b74bcf39285b070093ab674d8ea97"
+SRCREV = "c90ff465dcdb6a6949542c72a26a8ab496daa8cb"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.47.1


--===============5727349156370944641==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjitterentropy-upgrade-3.6.2-3.6.3.patch"

RnJvbSA1ODFkNDE1OTk5MzBkMWM1MTc4OGJiYjI1NDg0YjU2NDJiMTlhYmY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxNToxMzo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmppdHRlcmVudHJvcHk6IHVwZ3JhZGUgMy42LjIgLT4gMy42LjMKCi0tLQogLi4uL3tsaWJqaXR0
ZXJlbnRyb3B5XzMuNi4yLmJiID0+IGxpYmppdHRlcmVudHJvcHlfMy42LjMuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS97bGliaml0dGVyZW50cm9weV8z
LjYuMi5iYiA9PiBsaWJqaXR0ZXJlbnRyb3B5XzMuNi4zLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGliaml0dGVyZW50cm9weV8z
LjYuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGliaml0dGVy
ZW50cm9weV8zLjYuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJvcHlfMy42LjIuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGliaml0dGVy
ZW50cm9weV8zLjYuMy5iYgppbmRleCA1NGE4NjZjNDMyLi43MDRlMDZmNWNlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJvcHlf
My42LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJq
aXR0ZXJlbnRyb3B5XzMuNi4zLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWUwMTAyN2M0YWQxZmU1YTQ3NjhmODQ4OGM5NDVkNDkxIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0UuYnNkO21kNT02NmE1Y2VkYWY2MmM0
YjI2MzcwMjVmMDQ5ZjliODI2ZiBcCiAgICAgICAgICAgICAgICAgICAgICIKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9zbXVlbGxlckREL2ppdHRlcmVudHJvcHktbGlicmFyeS5naXQ7YnJh
bmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICJkZGNmMTEyNDgwMWI3NGJjZjM5
Mjg1YjA3MDA5M2FiNjc0ZDhlYTk3IgorU1JDUkVWID0gImM5MGZmNDY1ZGNkYjZhNjk0OTU0MmM3
MmEyNmE4YWI0OTZkYWE4Y2IiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBkb19jb25maWd1cmVb
bm9leGVjXSA9ICIxIgotLSAKMi40Ny4xCgo=

--===============5727349156370944641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libjitterentropy: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/libjitterentropy: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: FILELIST: removed "/usr/lib/.debug/libjitterentropy.so.3.6.2", added "/usr/lib/.debug/libjitterentropy.so.3.6.3"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 45296 to 45472 (+0%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dev: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 33814 to 34239 (+1%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dev: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-doc: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-doc: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-locale: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-locale: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-src: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 118316 to 119462 (+1%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-src: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-staticdev: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-staticdev: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.2", added "/usr/lib/libjitterentropy.so.3.6.3"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: PV changed from "3.6.2" to "3.6.3"
Changes to packages/core2-64-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.2 to libjitterentropy.so.3.6.3
  /usr/lib/libjitterentropy.so.3.6.2 moved to /usr/lib/libjitterentropy.so.3.6.3

--===============5727349156370944641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.2", added "/usr/lib/libjitterentropy.so.3.6.3"
Changes to packages/core2-64-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.2 to libjitterentropy.so.3.6.3
  /usr/lib/libjitterentropy.so.3.6.2 moved to /usr/lib/libjitterentropy.so.3.6.3

--===============5727349156370944641==--

