Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425B6CCF9F4
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:37 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17930.1759325533110206195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SulH02Gv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WGQ6/ukW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101999ff98cde-36365cf5-998a-4a68-ba61-9f18b70379c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ckq95j4q4KtcOMNOtofRdcl7R58Fzu//wiJyOsuE1LM=;
	b=SulH02GvqlFGR0biPF2vjI9UCAr4h6AhbJcNOlmy0SaIqmqwODsvHbii5jswLQzs
	6oAxEqx5B6rmhS5aMPpUbiHNQgwhnysblgkLC8/tatydlSzJ8OWXaFTI/7xwwyb5vVA
	SGnxqd6MFQMzajOFg9Ro90rdKYrwMzuzM1os46wc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ckq95j4q4KtcOMNOtofRdcl7R58Fzu//wiJyOsuE1LM=;
	b=WGQ6/ukWQF6FfORg9IE3hHGUvJ0DNl/ixyihLEpIfmcIchKqrQSRGoe2QlQouVLT
	K/DUZ9YDAjtiLIlpJ04Gi8zsx4wgNcXsnCKetox3uRrWmA/OkxqWSbTF6H2YLRqA1h1
	mkHY7ThWmIoBUZ7PGJot1ClBQCkOLGn0hEZR0rfI=
Content-Type: multipart/mixed; boundary="===============8642222488613783131=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdisplay-info: upgrading to 0.3.0 SUCCEEDED
Message-ID: <010101999ff98cde-36365cf5-998a-4a68-ba61-9f18b70379c8-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224298

--===============8642222488613783131==
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
From 76361aefb7fd2d2800b8e8cebd79af2ad23f336f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 13:07:35 +0000
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


--===============8642222488613783131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libdisplay-info: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGSIZE changed from 63616 to 75904 (+19%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGSIZE changed from 565576 to 662288 (+17%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: FILELIST: removed "/usr/lib/.debug/libdisplay-info.so.0.2.0", added "/usr/lib/.debug/libdisplay-info.so.0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGSIZE changed from 87045 to 104854 (+20%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: FILELIST: added "/usr/include/libdisplay-info/displayid2.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-doc: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-doc: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-locale: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-locale: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-staticdev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-staticdev: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKGSIZE changed from 227256 to 239544 (+5%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: FILELIST: removed "/usr/lib/libdisplay-info.so.2 /usr/lib/libdisplay-info.so.0.2.0", added "/usr/lib/libdisplay-info.so.3 /usr/lib/libdisplay-info.so.0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKG changed from libdisplay-info2 to libdisplay-info3
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PV changed from "0.2.0" to "0.3.0"
Changes to packages/x86-64-v3-poky-linux/libdisplay-info (sysroot):
  /usr/lib/libdisplay-info.so changed symlink target from libdisplay-info.so.2 to libdisplay-info.so.3
  /usr/lib/libdisplay-info.so.0.2.0 moved to /usr/lib/libdisplay-info.so.0.3.0
  /usr/lib/libdisplay-info.so.2 moved to /usr/lib/libdisplay-info.so.3
  /usr/include/libdisplay-info/displayid2.h was added

--===============8642222488613783131==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdisplay-info-upgrade-0.2.0-0.3.0.patch"

RnJvbSA3NjM2MWFlZmI3ZmQyZDI4MDBiOGU4Y2ViZDc5YWYyYWQyM2YzMzZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMzowNzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
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

--===============8642222488613783131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGSIZE changed from 63616 to 75904 (+19%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGSIZE changed from 565576 to 662288 (+17%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: FILELIST: added "/usr/include/libdisplay-info/displayid2.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGSIZE changed from 87045 to 104854 (+20%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKG changed from libdisplay-info2 to libdisplay-info3
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: FILELIST: removed "/usr/lib/libdisplay-info.so.2 /usr/lib/libdisplay-info.so.0.2.0", added "/usr/lib/libdisplay-info.so.3 /usr/lib/libdisplay-info.so.0.3.0"
Changes to packages/x86-64-v3-poky-linux/libdisplay-info (sysroot):
  /usr/lib/libdisplay-info.so changed symlink target from libdisplay-info.so.2 to libdisplay-info.so.3
  /usr/lib/libdisplay-info.so.0.2.0 moved to /usr/lib/libdisplay-info.so.0.3.0
  /usr/lib/libdisplay-info.so.2 moved to /usr/lib/libdisplay-info.so.3
  /usr/include/libdisplay-info/displayid2.h was added

--===============8642222488613783131==--

