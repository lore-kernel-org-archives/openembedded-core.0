Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC10C282C6
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:27 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7053.1740828323993215744
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=kG3kLwFP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VZWD5PdF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019551742e0f-1c2427e1-9e88-44ee-9e33-1e1fe709edb9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xQbvKh0IzJWIu9VuxOJviW8twVxWEa09ydtcrazYBOc=;
	b=kG3kLwFPybHl254F+qmTVIaw+3RWhW+BJIDfQFN1WkDjIWxWPElamCU8N2bbtgX3
	bTVbQUxd0lIQm65CYvzwyOMohFWBS4QyyBgmU2Qo9QMqZTPkT42bVPuDAxRtRXNqrum
	Uto+EJ+JAKm9r8L0//aNrX1muZaD5cUqyNfns7P4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xQbvKh0IzJWIu9VuxOJviW8twVxWEa09ydtcrazYBOc=;
	b=VZWD5PdFVcmuWsIHpg1gHXD8R+NKgeu5EKfrwd8/z5RWrbJ2sJCXgl5Zx9vuAvBt
	b5MjV0hsfw+JnLLjcw3CeERhCTD8j6lNr8eL4lg4hXem30S17e24l/AMdn51zyBXPeC
	NRepD2bgzU+n+R2ieFzLuoGf0/B50gxtxSy+w1Nc=
Content-Type: multipart/mixed; boundary="===============2165521379270673906=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 11.1.4 SUCCEEDED
Message-ID: <0101019551742e0f-1c2427e1-9e88-44ee-9e33-1e1fe709edb9-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212116

--===============2165521379270673906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fmt* to *11.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fmt-upgrade-11.1.3-11.1.4.patch
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
From 9a56244a5a107129891f1456886d0cb21ebe122c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 07:31:32 +0000
Subject: [PATCH] fmt: upgrade 11.1.3 -> 11.1.4

---
 meta/recipes-devtools/fmt/{fmt_11.1.3.bb => fmt_11.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fmt/{fmt_11.1.3.bb => fmt_11.1.4.bb} (90%)

diff --git a/meta/recipes-devtools/fmt/fmt_11.1.3.bb b/meta/recipes-devtools/fmt/fmt_11.1.4.bb
similarity index 90%
rename from meta/recipes-devtools/fmt/fmt_11.1.3.bb
rename to meta/recipes-devtools/fmt/fmt_11.1.4.bb
index 9a2ee396dd..7c860eb608 100644
--- a/meta/recipes-devtools/fmt/fmt_11.1.3.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.1.4.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "9cf9f38eded63e5e0fb95cd536ba51be601d7fa2"
+SRCREV = "123913715afeb8a437e6388b4473fcc4753e1c9a"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============2165521379270673906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/fmt/fmt-dbg: PKGV changed from 11.1.3 [default] to 11.1.4 [default]
packages/core2-64-poky-linux/fmt/fmt-dbg: FILELIST: removed "/usr/lib/.debug/libfmt.so.11.1.3", added "/usr/lib/.debug/libfmt.so.11.1.4"
packages/core2-64-poky-linux/fmt/fmt-dbg: PV changed from "11.1.3" to "11.1.4"
packages/core2-64-poky-linux/fmt/fmt-dbg: PKGSIZE changed from 1140008 to 1142920 (+0%)
packages/core2-64-poky-linux/fmt/fmt-dev: PKGV changed from 11.1.3 [default] to 11.1.4 [default]
packages/core2-64-poky-linux/fmt/fmt-dev: PV changed from "11.1.3" to "11.1.4"
packages/core2-64-poky-linux/fmt/fmt-dev: PKGSIZE changed from 582357 to 582401 (+0%)
packages/core2-64-poky-linux/fmt/fmt-doc: PKGV changed from 11.1.3 [default] to 11.1.4 [default]
packages/core2-64-poky-linux/fmt/fmt-doc: PV changed from "11.1.3" to "11.1.4"
packages/core2-64-poky-linux/fmt/fmt-locale: PKGV changed from 11.1.3 [default] to 11.1.4 [default]
packages/core2-64-poky-linux/fmt/fmt-locale: PV changed from "11.1.3" to "11.1.4"
packages/core2-64-poky-linux/fmt/fmt-src: PKGV changed from 11.1.3 [default] to 11.1.4 [default]
packages/core2-64-poky-linux/fmt/fmt-src: PV changed from "11.1.3" to "11.1.4"
packages/core2-64-poky-linux/fmt/fmt-src: PKGSIZE changed from 366521 to 367066 (+0%)
packages/core2-64-poky-linux/fmt/fmt-staticdev: PKGV changed from 11.1.3 [default] to 11.1.4 [default]
packages/core2-64-poky-linux/fmt/fmt-staticdev: PV changed from "11.1.3" to "11.1.4"
packages/core2-64-poky-linux/fmt/fmt: PKGV changed from 11.1.3 [default] to 11.1.4 [default]
packages/core2-64-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.11.1.3", added "/usr/lib/libfmt.so.11.1.4"
packages/core2-64-poky-linux/fmt/fmt: PV changed from "11.1.3" to "11.1.4"
packages/core2-64-poky-linux/fmt: PKGV changed from 11.1.3 [default] to 11.1.4 [default]
packages/core2-64-poky-linux/fmt: PV changed from "11.1.3" to "11.1.4"
Changes to packages/core2-64-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so.11 changed symlink target from libfmt.so.11.1.3 to libfmt.so.11.1.4
  /usr/lib/libfmt.so.11.1.3 moved to /usr/lib/libfmt.so.11.1.4

--===============2165521379270673906==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fmt-upgrade-11.1.3-11.1.4.patch"

RnJvbSA5YTU2MjQ0YTVhMTA3MTI5ODkxZjE0NTY4ODZkMGNiMjFlYmUxMjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNzozMTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZt
dDogdXBncmFkZSAxMS4xLjMgLT4gMTEuMS40CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9m
bXQve2ZtdF8xMS4xLjMuYmIgPT4gZm10XzExLjEuNC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZm10L3tmbXRfMTEuMS4zLmJiID0+IGZtdF8xMS4xLjQuYmJ9ICg5MCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS4zLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzExLjEuMy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS40LmJiCmluZGV4IDlhMmVlMzk2ZGQu
LjdjODYwZWI2MDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzEx
LjEuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMS4xLjQuYmIKQEAg
LTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRTttZDU9YjkyNTc3ODVmYzRmMzgwM2E0YjcxYjc2YzE0MTI3MjkiCiAKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9mbXRsaWIvZm10O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0
cHMiCi1TUkNSRVYgPSAiOWNmOWYzOGVkZWQ2M2U1ZTBmYjk1Y2Q1MzZiYTUxYmU2MDFkN2ZhMiIK
K1NSQ1JFViA9ICIxMjM5MTM3MTVhZmViOGE0MzdlNjM4OGI0NDczZmNjNDc1M2UxYzlhIgogCiBT
ID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQ0LjEKCg==

--===============2165521379270673906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.11.1.3", added "/usr/lib/libfmt.so.11.1.4"
Changes to packages/core2-64-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so.11 changed symlink target from libfmt.so.11.1.3 to libfmt.so.11.1.4
  /usr/lib/libfmt.so.11.1.3 moved to /usr/lib/libfmt.so.11.1.4

--===============2165521379270673906==--

