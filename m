Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E03CD5BBB
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34824.1778851228960723657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mvhsrlP7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gDWKkDl3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e2bcbdfc6-133ce7c1-7e0e-47ed-b80f-a5c6e2a3b3f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851242;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NOrpj5nkDIgx1JYq5L0Z48Bjzt8oacdbJN36CknE8NY=;
	b=mvhsrlP71VAgZQ0XYpKtAamUDstvsL7q6NmZSnuS4lXAXrOB51g6B6D9kZrf0lv5
	xbZFI0ftAcoBbARXFdF8UeotcuFYiV+hBwgnAs3BO5NZSweMYdJzRdkLmhwm7lH8H8G
	7bTtizRI3gqrGfia3CmrcQZeMABVLuy7DXzdws/U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851242;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NOrpj5nkDIgx1JYq5L0Z48Bjzt8oacdbJN36CknE8NY=;
	b=gDWKkDl3XNKUpcobAp0HTBr6m38pZBXJU6+BNOGh5LDkMGb1cumpzsOIIvEVKjRg
	yOUn5CUB3MsHLGyqty9mZljQLeZDkiUCO+8pe9kXqxNIdGZZITkvy/3/cK6xMA6hS0a
	M0F3CzFG+VJXzEKdAy+GtAQ4ozMJ9RbIYCmuwq2I=
Content-Type: multipart/mixed; boundary="===============8512376220147181986=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] enchant2: upgrading to 2.8.16 SUCCEEDED
Message-ID: <0101019e2bcbdfc6-133ce7c1-7e0e-47ed-b80f-a5c6e2a3b3f6-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237162

--===============8512376220147181986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.15-2.8.16.patch
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
From 5b46cc999fd7b3756d550dac28a415f65715e9ad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 12:09:18 +0000
Subject: [PATCH] enchant2: upgrade 2.8.15 -> 2.8.16

---
 .../enchant/{enchant2_2.8.15.bb => enchant2_2.8.16.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.15.bb => enchant2_2.8.16.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.15.bb b/meta/recipes-support/enchant/enchant2_2.8.16.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.15.bb
rename to meta/recipes-support/enchant/enchant2_2.8.16.bb
index bc1c5f7a67..e2c6eed602 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.15.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.16.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d3fd9e4170bfb5110b0bda577fe764a38fb606b3c25d2f0c3840234521ff1252"
+SRC_URI[sha256sum] = "d73162b5eff401a6397e1215e2b103bcef83f921c396c7f6b1394d2450d124e2"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============8512376220147181986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.15", added "/usr/lib/.debug/libenchant-2.so.2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 473704 to 473640 (-0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.8.15/lib -> /usr/src/debug/enchant2/2.8.16/lib, directory renamed /usr/src/debug/enchant2/2.8.15/providers -> /usr/src/debug/enchant2/2.8.16/providers, directory renamed /usr/src/debug/enchant2/2.8.15/src -> /usr/src/debug/enchant2/2.8.16/src
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 506074 to 506080 (+0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2/enchant2: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.15", added "/usr/lib/libenchant-2.so.2.8.16"
packages/x86-64-v3-poky-linux/enchant2: PV changed from "2.8.15" to "2.8.16"
packages/x86-64-v3-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.15/enchant-2.8.15.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.16/enchant-2.8.16.tar.gz"
packages/x86-64-v3-poky-linux/enchant2: PKGV changed from 2.8.15 [default] to 2.8.16 [default]
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.15 to libenchant-2.so.2.8.16
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.15 to libenchant-2.so.2.8.16
  /usr/lib/libenchant-2.so.2.8.15 moved to /usr/lib/libenchant-2.so.2.8.16

--===============8512376220147181986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.15", added "/usr/lib/libenchant-2.so.2.8.16"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.15 to libenchant-2.so.2.8.16
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.15 to libenchant-2.so.2.8.16
  /usr/lib/libenchant-2.so.2.8.15 moved to /usr/lib/libenchant-2.so.2.8.16

--===============8512376220147181986==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.15-2.8.16.patch"

RnJvbSA1YjQ2Y2M5OTlmZDdiMzc1NmQ1NTBkYWMyOGE0MTVmNjU3MTVlOWFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTI6MDk6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bmNoYW50MjogdXBncmFkZSAyLjguMTUgLT4gMi44LjE2CgotLS0KIC4uLi9lbmNoYW50L3tlbmNo
YW50Ml8yLjguMTUuYmIgPT4gZW5jaGFudDJfMi44LjE2LmJifSAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuOC4xNS5iYiA9PiBlbmNoYW50Ml8y
LjguMTYuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFu
dC9lbmNoYW50Ml8yLjguMTUuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hh
bnQyXzIuOC4xNi5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjguMTYuYmIKaW5kZXggYmMxYzVmN2E2Ny4u
ZTJjNmVlZDYwMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNo
YW50Ml8yLjguMTUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50
Ml8yLjguMTYuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICJnbGliLTIuMCBncm9mZi1u
YXRpdmUiCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgZ2l0aHViLXJlbGVhc2VzCiAKIFNS
Q19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9lbmNoYW50LSR7UFZ9
LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkM2ZkOWU0MTcwYmZiNTExMGIwYmRhNTc3
ZmU3NjRhMzhmYjYwNmIzYzI1ZDJmMGMzODQwMjM0NTIxZmYxMjUyIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImQ3MzE2MmI1ZWZmNDAxYTYzOTdlMTIxNWUyYjEwM2JjZWY4M2Y5MjFjMzk2YzdmNmIx
Mzk0ZDI0NTBkMTI0ZTIiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20v
cnJ0aG9tYXMvZW5jaGFudC9yZWxlYXNlcyIKIAotLSAKMi40Ny4xCgo=

--===============8512376220147181986==--

