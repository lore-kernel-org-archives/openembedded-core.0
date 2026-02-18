Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BB7C531D9
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1418.1771440097795864815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R+P7ga3w;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kYhN8jy1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720ec780-9a3b8a18-6b4d-489e-afbb-1fe42d50ea1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FgdSmJ8LvyeeIs3XNb5O3bY4a1AMf+Ph8uzcFA6N+gs=;
	b=R+P7ga3wT7loEW4Gc4kDg+37lS92nMDEQm/CQrkbvMnx9oxP5yzxxApEvDFYQi7I
	lZXyKNcEmhC0ptzLAARN8geKJMTxPOUPd7a/NgvRD8rFSzGCoesAbHlbSYPq2HJFGzd
	/dQIYgrz3oqsOK9a4XoJNA20vqkUQxUBnqtutbuQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FgdSmJ8LvyeeIs3XNb5O3bY4a1AMf+Ph8uzcFA6N+gs=;
	b=kYhN8jy1/4zP1vKX9lSZ1OsiR/mbx4P+GLn7ZeHWAkZ4f4C0yu8BYpjPW9kl3Tx3
	FaSHyRIfpw4RB4KLd6XUaXGAaJRxle6DCC3E2I/Nm/dEtk+H2TKzZ0a0ErlD22Pl1kx
	/MyKMY+4nnyKExxCLDf/USl0gtznkHbs6UexYYTM=
Content-Type: multipart/mixed; boundary="===============5451793730175541964=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libuv: upgrading to 1.52.0 SUCCEEDED
Message-ID: <0101019c720ec780-9a3b8a18-6b4d-489e-afbb-1fe42d50ea1b-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231333

--===============5451793730175541964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libuv* to *1.52.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.51.0-1.52.0.patch
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
From 6293bb2993b033aebd259aa28c80e52dd112bea9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 11:39:21 +0000
Subject: [PATCH] libuv: upgrade 1.51.0 -> 1.52.0

---
 .../libuv/{libuv_1.51.0.bb => libuv_1.52.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.51.0.bb => libuv_1.52.0.bb} (93%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb b/meta/recipes-connectivity/libuv/libuv_1.52.0.bb
similarity index 93%
rename from meta/recipes-connectivity/libuv/libuv_1.51.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.52.0.bb
index 9ff9cf35e2..44893c0954 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.52.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "5152db2cbfeb5582e9c27c5ea1dba2cd9e10759b"
+SRCREV = "b556c0629d0fd250b5feefbc91b84c6f5e3dae48"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============5451793730175541964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libuv: PKGV changed from 1.51.0 [default] to 1.52.0 [default]
packages/x86-64-v3-poky-linux/libuv: SRC_URI changed from "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v1.51.0" to "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v1.52.0"
packages/x86-64-v3-poky-linux/libuv: PV changed from "1.51.0" to "1.52.0"
packages/x86-64-v3-poky-linux/libuv/libuv-dbg: PKGV changed from 1.51.0 [default] to 1.52.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-dbg: PV changed from "1.51.0" to "1.52.0"
packages/x86-64-v3-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 782480 to 787816 (+1%)
packages/x86-64-v3-poky-linux/libuv/libuv-dev: PKGV changed from 1.51.0 [default] to 1.52.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-dev: PV changed from "1.51.0" to "1.52.0"
packages/x86-64-v3-poky-linux/libuv/libuv-dev: PKGSIZE changed from 109506 to 109586 (+0%)
packages/x86-64-v3-poky-linux/libuv/libuv-doc: PKGV changed from 1.51.0 [default] to 1.52.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-doc: PV changed from "1.51.0" to "1.52.0"
packages/x86-64-v3-poky-linux/libuv/libuv-locale: PKGV changed from 1.51.0 [default] to 1.52.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-locale: PV changed from "1.51.0" to "1.52.0"
packages/x86-64-v3-poky-linux/libuv/libuv-src: PKGV changed from 1.51.0 [default] to 1.52.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-src: PV changed from "1.51.0" to "1.52.0"
packages/x86-64-v3-poky-linux/libuv/libuv-src: PKGSIZE changed from 658341 to 665747 (+1%)
packages/x86-64-v3-poky-linux/libuv/libuv-src: FILELIST: directory renamed /usr/src/debug/libuv/1.51.0/src -> /usr/src/debug/libuv/1.52.0/src, directory renamed /usr/src/debug/libuv/1.51.0/src/unix -> /usr/src/debug/libuv/1.52.0/src/unix, directory renamed /usr/src/debug/libuv/1.51.0/include/uv -> /usr/src/debug/libuv/1.52.0/include/uv, directory renamed /usr/src/debug/libuv/1.51.0/include -> /usr/src/debug/libuv/1.52.0/include
packages/x86-64-v3-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.51.0 [default] to 1.52.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-staticdev: PV changed from "1.51.0" to "1.52.0"
packages/x86-64-v3-poky-linux/libuv/libuv: PKGV changed from 1.51.0 [default] to 1.52.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv: PV changed from "1.51.0" to "1.52.0"

--===============5451793730175541964==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.51.0-1.52.0.patch"

RnJvbSA2MjkzYmIyOTkzYjAzM2FlYmQyNTlhYTI4YzgwZTUyZGQxMTJiZWE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTE6Mzk6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1djogdXBncmFkZSAxLjUxLjAgLT4gMS41Mi4wCgotLS0KIC4uLi9saWJ1di97bGlidXZfMS41
MS4wLmJiID0+IGxpYnV2XzEuNTIuMC5iYn0gICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbGlidXYve2xpYnV2XzEuNTEuMC5iYiA9PiBsaWJ1dl8xLjUyLjAu
YmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9s
aWJ1dl8xLjUxLjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEu
NTIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEuNTEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjUyLjAuYmIKaW5kZXggOWZmOWNmMzVlMi4uNDQ4OTNj
MDk1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8x
LjUxLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjUy
LjAuYmIKQEAgLTYsNyArNiw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9NzRiNmYyZjc4MThhNGUzYTgwZDAzNTU2ZjcxYjEyOWIgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS1leHRyYTttZDU9ZjkzMDc0MTc3NDll
MTliZDFkNmQ2OGEzOTRiNDkzMjQiCiAKLVNSQ1JFViA9ICI1MTUyZGIyY2JmZWI1NTgyZTljMjdj
NWVhMWRiYTJjZDllMTA3NTliIgorU1JDUkVWID0gImI1NTZjMDYyOWQwZmQyNTBiNWZlZWZiYzkx
Yjg0YzZmNWUzZGFlNDgiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGlidXYvbGlidXYu
Z2l0O2JyYW5jaD12MS54O3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0iCiBVUFNUUkVBTV9DSEVD
S19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoyLjQ3LjEKCg==

--===============5451793730175541964==--

