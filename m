Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0789FEFCBC3
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28966.1773582114513410546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Z9JX6n2G;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yP+5Xt+r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019cf1bb5bef-e025a785-0557-4bd4-9b6d-603fbfa84f99-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=svwf8evW8qduYHfGk5kElU7dz9AxUwhCYC55UXUhfZo=;
	b=Z9JX6n2G8Qv4xX6EuO2gz4egtb4Psb/KO3WY9OvVyUgIB7VdPpjKDPmNELUDRyl8
	MLQvFRbkIts6ULvCVAkJCoL7iK637juAD+edXDl4fW83axUPNP3hsFObTYTbx4cHMc0
	ToBgROwgiKfwbi4E2/M9mWt3+glBBJzwOiqqLHVE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=svwf8evW8qduYHfGk5kElU7dz9AxUwhCYC55UXUhfZo=;
	b=yP+5Xt+rsHW7gYUp87hB2hY5cY0NCCJsHWE8bgmRPAr0RsmJhxCh42AtSMPEik7N
	9QeZ6JAOsmAQSX2ULNf5nlw8Dh3mPyBCAkHngILNPRZXJGOE4TtWEWWnZaUvrWXN6eW
	TT/5nP+12Uy3KnzoDt4wrOX/KHuOFPxavWmicFL8=
Content-Type: multipart/mixed; boundary="===============2418496299053397645=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libuv: upgrading to 1.52.1 SUCCEEDED
Message-ID: <0101019cf1bb5bef-e025a785-0557-4bd4-9b6d-603fbfa84f99-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233127

--===============2418496299053397645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libuv* to *1.52.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.52.0-1.52.1.patch
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
From 1975ea0494f048c47ae785e3bf192e6504d3657e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 06:08:57 +0000
Subject: [PATCH] libuv: upgrade 1.52.0 -> 1.52.1

---
 .../libuv/{libuv_1.52.0.bb => libuv_1.52.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.52.0.bb => libuv_1.52.1.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.52.0.bb b/meta/recipes-connectivity/libuv/libuv_1.52.1.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.52.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.52.1.bb
index 25177bc05d..08f0755911 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.52.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.52.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "b556c0629d0fd250b5feefbc91b84c6f5e3dae48"
+SRCREV = "1cfa32ff59c076ffb6ed735bbc8c18361558661f"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============2418496299053397645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libuv: PV changed from "1.52.0" to "1.52.1"
packages/x86-64-v3-poky-linux/libuv: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/x86-64-v3-poky-linux/libuv: SRC_URI changed from "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v1.52.0" to "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v1.52.1"
packages/x86-64-v3-poky-linux/libuv/libuv-dbg: PV changed from "1.52.0" to "1.52.1"
packages/x86-64-v3-poky-linux/libuv/libuv-dbg: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 836296 to 837448 (+0%)
packages/x86-64-v3-poky-linux/libuv/libuv-dev: PV changed from "1.52.0" to "1.52.1"
packages/x86-64-v3-poky-linux/libuv/libuv-dev: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-dev: PKGSIZE changed from 109586 to 109592 (+0%)
packages/x86-64-v3-poky-linux/libuv/libuv-doc: PV changed from "1.52.0" to "1.52.1"
packages/x86-64-v3-poky-linux/libuv/libuv-doc: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-locale: PV changed from "1.52.0" to "1.52.1"
packages/x86-64-v3-poky-linux/libuv/libuv-locale: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-src: PV changed from "1.52.0" to "1.52.1"
packages/x86-64-v3-poky-linux/libuv/libuv-src: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-src: PKGSIZE changed from 665747 to 667214 (+0%)
packages/x86-64-v3-poky-linux/libuv/libuv-src: FILELIST: directory renamed /usr/src/debug/libuv/1.52.0/src -> /usr/src/debug/libuv/1.52.1/src, directory renamed /usr/src/debug/libuv/1.52.0/include/uv -> /usr/src/debug/libuv/1.52.1/include/uv, directory renamed /usr/src/debug/libuv/1.52.0/src/unix -> /usr/src/debug/libuv/1.52.1/src/unix, directory renamed /usr/src/debug/libuv/1.52.0/include -> /usr/src/debug/libuv/1.52.1/include
packages/x86-64-v3-poky-linux/libuv/libuv-staticdev: PV changed from "1.52.0" to "1.52.1"
packages/x86-64-v3-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.52.0 [default] to 1.52.1 [default]
packages/x86-64-v3-poky-linux/libuv/libuv: PV changed from "1.52.0" to "1.52.1"
packages/x86-64-v3-poky-linux/libuv/libuv: PKGV changed from 1.52.0 [default] to 1.52.1 [default]

--===============2418496299053397645==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.52.0-1.52.1.patch"

RnJvbSAxOTc1ZWEwNDk0ZjA0OGM0N2FlNzg1ZTNiZjE5MmU2NTA0ZDM2NTdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDY6MDg6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1djogdXBncmFkZSAxLjUyLjAgLT4gMS41Mi4xCgotLS0KIC4uLi9saWJ1di97bGlidXZfMS41
Mi4wLmJiID0+IGxpYnV2XzEuNTIuMS5iYn0gICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbGlidXYve2xpYnV2XzEuNTIuMC5iYiA9PiBsaWJ1dl8xLjUyLjEu
YmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9s
aWJ1dl8xLjUyLjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEu
NTIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEuNTIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjUyLjEuYmIKaW5kZXggMjUxNzdiYzA1ZC4uMDhmMDc1
NTkxMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8x
LjUyLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjUy
LjEuYmIKQEAgLTYsNyArNiw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9NzRiNmYyZjc4MThhNGUzYTgwZDAzNTU2ZjcxYjEyOWIgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS1leHRyYTttZDU9ZjkzMDc0MTc3NDll
MTliZDFkNmQ2OGEzOTRiNDkzMjQiCiAKLVNSQ1JFViA9ICJiNTU2YzA2MjlkMGZkMjUwYjVmZWVm
YmM5MWI4NGM2ZjVlM2RhZTQ4IgorU1JDUkVWID0gIjFjZmEzMmZmNTljMDc2ZmZiNmVkNzM1YmJj
OGMxODM2MTU1ODY2MWYiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGlidXYvbGlidXYu
Z2l0O2JyYW5jaD12MS54O3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0iCiBVUFNUUkVBTV9DSEVD
S19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoyLjQ3LjEKCg==

--===============2418496299053397645==--

