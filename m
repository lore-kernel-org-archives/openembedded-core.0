Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD09CD13D3
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:47 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2368.1762384583580536215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lka0Vce4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=U5NLI/f0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a564ef2fd-1298a7c8-7ee1-4099-a4fb-61bb23bce603-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4DCjc4Liy4kLKyQzTstYpZIsxms/VjdJUZBUYahL/ug=;
	b=lka0Vce4b9HE7VMjLOXGX1BiFprglicitITynxSZ/2J/4PIwlqF17Nme7nnCC6kr
	jm1fp1/bgI6AYSguC7xVha5wSyefAv9h0wyARO8cl0wBxpdOeqUOLbGUOPV8pA6nZje
	AiI0f0UHuXtmahpV3MfHTnnWI/VR5aDwpkoDLhbA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4DCjc4Liy4kLKyQzTstYpZIsxms/VjdJUZBUYahL/ug=;
	b=U5NLI/f0er13/1yOtn8qW6S5ofF5PtPEHfNEtt8FRTRJQluCVgG66N/huAiLUjlI
	8Ucvc7TPlqyvexh43i+QTwOqegPGqs3kETE+QCAefeE9JFUNISeP52oK0hFwrP3atUK
	dnHVeUMjTNtOjEccr4Ldm10+bVFxC/FHRv3BdXkc=
Content-Type: multipart/mixed; boundary="===============9131008257758529479=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdisplay-info: upgrading to 0.3.0 SUCCEEDED
Message-ID: <0101019a564ef2fd-1298a7c8-7ee1-4099-a4fb-61bb23bce603-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225917

--===============9131008257758529479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdisplay-info* to *0.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdisplay-info-upgrade-0.2.0-0.3.0.patch
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
From 7ccb46359c5ce2f800004a7b17fb5dd10b26fc19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 22:43:12 +0000
Subject: [PATCH] libdisplay-info: upgrade 0.2.0 -> 0.3.0

---
 .../{libdisplay-info_0.2.0.bb => libdisplay-info_0.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libdisplay-info/{libdisplay-info_0.2.0.bb => libdisplay-info_0.3.0.bb} (92%)

diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
similarity index 92%
rename from meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
rename to meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
index 812a30495e..3dc02261dd 100644
--- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
 DEPENDS = "hwdata-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
-SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
+SRCREV = "47a5590e9c4eb35d67651b8c05a55f1a48259329"
 
 inherit meson pkgconfig lib_package
-- 
2.47.1


--===============9131008257758529479==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdisplay-info-upgrade-0.2.0-0.3.0.patch"

RnJvbSA3Y2NiNDYzNTljNWNlMmY4MDAwMDRhN2IxN2ZiNWRkMTBiMjZmYzE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMjo0MzoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRpc3BsYXktaW5mbzogdXBncmFkZSAwLjIuMCAtPiAwLjMuMAoKLS0tCiAuLi4ve2xpYmRpc3Bs
YXktaW5mb18wLjIuMC5iYiA9PiBsaWJkaXNwbGF5LWluZm9fMC4zLjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJkaXNwbGF5LWluZm8ve2xpYmRpc3BsYXktaW5mb18wLjIu
MC5iYiA9PiBsaWJkaXNwbGF5LWluZm9fMC4zLjAuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mb18wLjIuMC5i
YiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm9f
MC4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mb18wLjIuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mb18wLjMu
MC5iYgppbmRleCA4MTJhMzA0OTVlLi4zZGMwMjI2MWRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJkaXNwbGF5LWluZm8vbGliZGlzcGxheS1pbmZvXzAuMi4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm9fMC4z
LjAuYmIKQEAgLTksNiArOSw2IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWU0NDI2NDA5OTU3MDgwZWUwMzUyMTI4MzU0Y2VhMmRlIgogREVQRU5EUyA9ICJod2RhdGEt
bmF0aXZlIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZW1lcnNp
b24vbGliZGlzcGxheS1pbmZvLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKLVNSQ1JF
ViA9ICI2NmI4MDJkMDViMzc0Y2Q4ZjM4OGRjNmFkMWU3YWU0ZjA4Y2IzMzAwIgorU1JDUkVWID0g
IjQ3YTU1OTBlOWM0ZWIzNWQ2NzY1MWI4YzA1YTU1ZjFhNDgyNTkzMjkiCiAKIGluaGVyaXQgbWVz
b24gcGtnY29uZmlnIGxpYl9wYWNrYWdlCi0tIAoyLjQ3LjEKCg==

--===============9131008257758529479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGSIZE changed from 63616 to 75904 (+19%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGSIZE changed from 565576 to 662288 (+17%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGSIZE changed from 87045 to 104854 (+20%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: FILELIST: added "/usr/include/libdisplay-info/displayid2.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKG changed from libdisplay-info2 to libdisplay-info3
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: FILELIST: removed "/usr/lib/libdisplay-info.so.0.2.0 /usr/lib/libdisplay-info.so.2", added "/usr/lib/libdisplay-info.so.0.3.0 /usr/lib/libdisplay-info.so.3"
Changes to packages/x86-64-v3-poky-linux/libdisplay-info (sysroot):
  /usr/lib/libdisplay-info.so changed symlink target from libdisplay-info.so.2 to libdisplay-info.so.3
  /usr/lib/libdisplay-info.so.0.2.0 moved to /usr/lib/libdisplay-info.so.0.3.0
  /usr/lib/libdisplay-info.so.2 moved to /usr/lib/libdisplay-info.so.3
  /usr/include/libdisplay-info/displayid2.h was added

--===============9131008257758529479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libdisplay-info: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGSIZE changed from 63616 to 75904 (+19%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: FILELIST: removed "/usr/lib/.debug/libdisplay-info.so.0.2.0", added "/usr/lib/.debug/libdisplay-info.so.0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGSIZE changed from 565576 to 662288 (+17%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: FILELIST: added "/usr/include/libdisplay-info/displayid2.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGSIZE changed from 87045 to 104854 (+20%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-doc: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-doc: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-locale: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-locale: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-staticdev: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-staticdev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: FILELIST: removed "/usr/lib/libdisplay-info.so.0.2.0 /usr/lib/libdisplay-info.so.2", added "/usr/lib/libdisplay-info.so.0.3.0 /usr/lib/libdisplay-info.so.3"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKG changed from libdisplay-info2 to libdisplay-info3
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKGSIZE changed from 227256 to 239544 (+5%)
Changes to packages/x86-64-v3-poky-linux/libdisplay-info (sysroot):
  /usr/lib/libdisplay-info.so changed symlink target from libdisplay-info.so.2 to libdisplay-info.so.3
  /usr/lib/libdisplay-info.so.0.2.0 moved to /usr/lib/libdisplay-info.so.0.3.0
  /usr/lib/libdisplay-info.so.2 moved to /usr/lib/libdisplay-info.so.3
  /usr/include/libdisplay-info/displayid2.h was added

--===============9131008257758529479==--

