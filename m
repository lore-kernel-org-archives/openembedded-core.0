Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94745F42107
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19826.1776261883261738456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mlr+6vvT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=c1QwIUk4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d9175617a-46336c71-c601-4fb7-8e1e-342da549a3fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KsOBOK8XAGyFJ8qMllm2syulz2TMMPcH+mF/188/DWU=;
	b=mlr+6vvT4gwCmvd9Zex0jVins1EPgSh9EXURWCKT4WP1QZL5re+ZDISTfukrbi+y
	Qp3PO3snBTBfOQwKmqgdDOrgKtVociYQFOiRLbh718h+2pHMB8FDB6XMm/B+7aSBVpx
	FkfKb62B0S6vran01M7QPA/T1fH++xe5CZJVkZ0k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KsOBOK8XAGyFJ8qMllm2syulz2TMMPcH+mF/188/DWU=;
	b=c1QwIUk4KiUVpMIWebfNma+1I9l4xK9G5+8LjU+repLDjnMQq+YsSlZulwbDR975
	1qfxqEBjphMfi4bqMFEFHYTkiHOkFdLr5kb9f8dXIlEMA8zaWncfcsmCcE7Z9w+5BRK
	wpx7A0lfgnL8/akK2hK6wSNRJIZ8g4yw4rzhGiyc=
Content-Type: multipart/mixed; boundary="===============1615250568005338617=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.12.1 SUCCEEDED
Message-ID: <0101019d9175617a-46336c71-c601-4fb7-8e1e-342da549a3fb-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235251

--===============1615250568005338617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-rust* to *1.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.12.0-1.12.1.patch
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
From 574542be19058f219b03e3b65f4b683fe4ab9c53 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:55:33 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.12.0 -> 1.12.1

---
 ...uptools-rust_1.12.0.bb => python3-setuptools-rust_1.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.12.0.bb => python3-setuptools-rust_1.12.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
index 062e97083d..a1135794ba 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.12.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.12.1.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c"
+SRC_URI[sha256sum] = "85ae70989d96c9cfeb5ef79cf3bac2d5200bc5564f720a06edceedbdf6664640"
 
 PYPI_PACKAGE = "setuptools_rust"
 
-- 
2.47.1


--===============1615250568005338617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info

--===============1615250568005338617==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.12.0-1.12.1.patch"

RnJvbSA1NzQ1NDJiZTE5MDU4ZjIxOWIwM2UzYjY1ZjRiNjgzZmU0YWI5YzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6NTU6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtcnVzdDogdXBncmFkZSAxLjEyLjAgLT4gMS4xMi4xCgotLS0KIC4u
LnVwdG9vbHMtcnVzdF8xLjEyLjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS4xMi4x
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29s
cy1ydXN0XzEuMTIuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjEyLjEuYmJ9ICg5
MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtcnVzdF8xLjEyLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuMTIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMtcnVzdF8xLjEyLjEuYmIKaW5kZXggMDYyZTk3MDgzZC4uYTExMzU3OTRi
YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMtcnVzdF8xLjEyLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjEyLjEuYmIKQEAgLTksNyArOSw3IEBAIEJVR1RSQUNL
RVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL1B5TzMvc2V0dXB0b29scy1ydXN0L2lzc3VlcyIKIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDEx
Y2Q5MmU3MDJkZDllNmIxYTI2MTU3YjZmZDUzZjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJk
OTRhOTNmMGM5Nzc1MWMxNzAxNDU2NWYwN2JkYzMyNGJlZTQ1ZDM5NmNkMWJiYTgzZDhlN2FmOTJi
OTQ1ZjBjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg1YWU3MDk4OWQ5NmM5Y2ZlYjVlZjc5Y2Yz
YmFjMmQ1MjAwYmM1NTY0ZjcyMGEwNmVkY2VlZGJkZjY2NjQ2NDAiCiAKIFBZUElfUEFDS0FHRSA9
ICJzZXR1cHRvb2xzX3J1c3QiCiAKLS0gCjIuNDcuMQoK

--===============1615250568005338617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.12.0.tar.gz;downloadfilename=setuptools_rust-1.12.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.12.1.tar.gz;downloadfilename=setuptools_rust-1.12.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-setuptools-rust: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 179827 to 186550 (+4%)
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.12.0" to "1.12.1"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_rust-1.12.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_rust-1.12.1.dist-info

--===============1615250568005338617==--

