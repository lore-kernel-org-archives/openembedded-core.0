Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C826EE9A055
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1402.1771440114027875593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jghyQQYl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Hdzb4Nsh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720f076a-186fde78-b3a0-45cd-8146-01a7031d4eb0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CtDQkGdB23Ajl8XVliClSHHDOUdE8fnEeJC9I7UylcA=;
	b=jghyQQYl5K3aIgqGyIbAZAAx4GE2XpQ2aYAe6yGBupeS1S5qjTNP1vxU/ackxv9K
	7omV1cLDFPruCE3YrfIlX6mD0jS2EnK6xtoCr9LGduFOVJ61ubP0ZomrWzuqzBLn87r
	6DzjBegx+fAZJcE0CKx5wq6ciytT869QHn6tgJNc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CtDQkGdB23Ajl8XVliClSHHDOUdE8fnEeJC9I7UylcA=;
	b=Hdzb4NshEYEei+dEt0WYDVUOTx5HDpTKZ1bx65He/CvKIsjzQeR0evYxxbOFoOLd
	wvn2QrsYseOxcCpTKlTt/sxT9fgokMT0YUuglZd/eZR16Z6PDSW3t/NcV8MEf2AoLRC
	uVIWoTbRfo0PTse4V8Px3TnVS8FOIe1MPJk8pzHw=
Content-Type: multipart/mixed; boundary="===============4576777323673410571=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] enchant2: upgrading to 2.8.15 SUCCEEDED
Message-ID: <0101019c720f076a-186fde78-b3a0-45cd-8146-01a7031d4eb0-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231403

--===============4576777323673410571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.14-2.8.15.patch
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
From dbb14eef8df090378cb91bc0b60dbf3db9ba0df1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 18:09:27 +0000
Subject: [PATCH] enchant2: upgrade 2.8.14 -> 2.8.15

---
 .../enchant/{enchant2_2.8.14.bb => enchant2_2.8.15.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.14.bb => enchant2_2.8.15.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.14.bb b/meta/recipes-support/enchant/enchant2_2.8.15.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.14.bb
rename to meta/recipes-support/enchant/enchant2_2.8.15.bb
index 4f8f2cf7f8..bc1c5f7a67 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.14.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.15.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d04588769399ff7140fa214b9731e6fc6eda9bb2e75df9f67263717710bb4c4b"
+SRC_URI[sha256sum] = "d3fd9e4170bfb5110b0bda577fe764a38fb606b3c25d2f0c3840234521ff1252"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============4576777323673410571==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.14-2.8.15.patch"

RnJvbSBkYmIxNGVlZjhkZjA5MDM3OGNiOTFiYzBiNjBkYmYzZGI5YmEwZGYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTg6MDk6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bmNoYW50MjogdXBncmFkZSAyLjguMTQgLT4gMi44LjE1CgotLS0KIC4uLi9lbmNoYW50L3tlbmNo
YW50Ml8yLjguMTQuYmIgPT4gZW5jaGFudDJfMi44LjE1LmJifSAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuOC4xNC5iYiA9PiBlbmNoYW50Ml8y
LjguMTUuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFu
dC9lbmNoYW50Ml8yLjguMTQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hh
bnQyXzIuOC4xNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjguMTUuYmIKaW5kZXggNGY4ZjJjZjdmOC4u
YmMxYzVmN2E2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNo
YW50Ml8yLjguMTQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50
Ml8yLjguMTUuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICJnbGliLTIuMCBncm9mZi1u
YXRpdmUiCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgZ2l0aHViLXJlbGVhc2VzCiAKIFNS
Q19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9lbmNoYW50LSR7UFZ9
LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkMDQ1ODg3NjkzOTlmZjcxNDBmYTIxNGI5
NzMxZTZmYzZlZGE5YmIyZTc1ZGY5ZjY3MjYzNzE3NzEwYmI0YzRiIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImQzZmQ5ZTQxNzBiZmI1MTEwYjBiZGE1NzdmZTc2NGEzOGZiNjA2YjNjMjVkMmYwYzM4
NDAyMzQ1MjFmZjEyNTIiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20v
cnJ0aG9tYXMvZW5jaGFudC9yZWxlYXNlcyIKIAotLSAKMi40Ny4xCgo=

--===============4576777323673410571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.14", added "/usr/lib/libenchant-2.so.2.8.15"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.14 to libenchant-2.so.2.8.15
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.14 to libenchant-2.so.2.8.15
  /usr/lib/libenchant-2.so.2.8.14 moved to /usr/lib/libenchant-2.so.2.8.15

--===============4576777323673410571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 444848 to 449544 (+1%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.14 [default] to 2.8.15 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.14" to "2.8.15"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.14", added "/usr/lib/.debug/libenchant-2.so.2.8.15"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.14 [default] to 2.8.15 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.14" to "2.8.15"
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.14 [default] to 2.8.15 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.14" to "2.8.15"
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.14 [default] to 2.8.15 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.14" to "2.8.15"
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 499485 to 506074 (+1%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.14 [default] to 2.8.15 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PV changed from "2.8.14" to "2.8.15"
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.8.14/lib -> /usr/src/debug/enchant2/2.8.15/lib, directory renamed /usr/src/debug/enchant2/2.8.14/providers -> /usr/src/debug/enchant2/2.8.15/providers, directory renamed /usr/src/debug/enchant2/2.8.14/src -> /usr/src/debug/enchant2/2.8.15/src
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.14 [default] to 2.8.15 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.14" to "2.8.15"
packages/x86-64-v3-poky-linux/enchant2/enchant2: PKGV changed from 2.8.14 [default] to 2.8.15 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: PV changed from "2.8.14" to "2.8.15"
packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.14", added "/usr/lib/libenchant-2.so.2.8.15"
packages/x86-64-v3-poky-linux/enchant2: PKGV changed from 2.8.14 [default] to 2.8.15 [default]
packages/x86-64-v3-poky-linux/enchant2: PV changed from "2.8.14" to "2.8.15"
packages/x86-64-v3-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.14/enchant-2.8.14.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.15/enchant-2.8.15.tar.gz"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.14 to libenchant-2.so.2.8.15
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.14 to libenchant-2.so.2.8.15
  /usr/lib/libenchant-2.so.2.8.14 moved to /usr/lib/libenchant-2.so.2.8.15

--===============4576777323673410571==--

