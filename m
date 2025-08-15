Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC8DCA0FF6
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:23 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11333.1755263225452838599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vXUKa2Qj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WbQM1PYD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010198add78af6-9984f6fc-0b57-43c0-a1a3-210aed8f9503-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=laF6uYU2z72vC5TRx8FrwyLjPkJN4VSaBN5OP4BztKo=;
	b=vXUKa2QjTtlLPegNEz1elKANkzCx1LOVsM79Qpx1ekP0z9bhxJe4tI3Tcc2tPSFg
	wy/28HSycF8aUadZeiAjOyOtxPdyx62aAdOTfFa4mxluKYoWEeVzUVNi2YtYdri+Z13
	j/CvMvIcNrrnJxiRQkDFUFnAzzQcIkLvLCydIbxY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=laF6uYU2z72vC5TRx8FrwyLjPkJN4VSaBN5OP4BztKo=;
	b=WbQM1PYDyH72grY1gS9C0zjckuY6Lhfv4/cEvTm25hIr+x+pDa/0iIuAzywQDIxP
	bu+75eUZvL6FiTMy3GCS5UVRRxhn/c999gzE08vmfGZzwnK7lA/6I2V3+YKqiiucXvv
	VgdjRvPWavxKdeSp43VezcrvPKKv0hPzthCaY9es=
Content-Type: multipart/mixed; boundary="===============7953868319068279756=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.12 SUCCEEDED
Message-ID: <01010198add78af6-9984f6fc-0b57-43c0-a1a3-210aed8f9503-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221958

--===============7953868319068279756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.10-2.8.12.patch
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
From 2ea882085be18d0a73dc5ca7c879e0345b1768df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 12:48:41 +0000
Subject: [PATCH] enchant2: upgrade 2.8.10 -> 2.8.12

---
 .../enchant/{enchant2_2.8.10.bb => enchant2_2.8.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.10.bb => enchant2_2.8.12.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.10.bb b/meta/recipes-support/enchant/enchant2_2.8.12.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.10.bb
rename to meta/recipes-support/enchant/enchant2_2.8.12.bb
index e2965e9e10..84f0156bca 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.10.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.12.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6db791265ace652c63a6d24f376f4c562b742284d70d3ccb9e1ce8be45b288c9"
+SRC_URI[sha256sum] = "20e5fab2ca0f95ba9d1ef5052fe5b028e3e1d66d4cdea6b9adfcbd3e524c2a09"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============7953868319068279756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.10", added "/usr/lib/libenchant-2.so.2.8.12"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.10 to libenchant-2.so.2.8.12
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.10 to libenchant-2.so.2.8.12
  /usr/lib/libenchant-2.so.2.8.10 moved to /usr/lib/libenchant-2.so.2.8.12

--===============7953868319068279756==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.10-2.8.12.patch"

RnJvbSAyZWE4ODIwODViZTE4ZDBhNzNkYzVjYTdjODc5ZTAzNDViMTc2OGRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTI6NDg6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bmNoYW50MjogdXBncmFkZSAyLjguMTAgLT4gMi44LjEyCgotLS0KIC4uLi9lbmNoYW50L3tlbmNo
YW50Ml8yLjguMTAuYmIgPT4gZW5jaGFudDJfMi44LjEyLmJifSAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQve2VuY2hhbnQyXzIuOC4xMC5iYiA9PiBlbmNoYW50Ml8y
LjguMTIuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFu
dC9lbmNoYW50Ml8yLjguMTAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hh
bnQyXzIuOC4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjguMTIuYmIKaW5kZXggZTI5NjVlOWUxMC4u
ODRmMDE1NmJjYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNo
YW50Ml8yLjguMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50
Ml8yLjguMTIuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICJnbGliLTIuMCBncm9mZi1u
YXRpdmUiCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgZ2l0aHViLXJlbGVhc2VzCiAKIFNS
Q19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9lbmNoYW50LSR7UFZ9
LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZGI3OTEyNjVhY2U2NTJjNjNhNmQyNGYz
NzZmNGM1NjJiNzQyMjg0ZDcwZDNjY2I5ZTFjZThiZTQ1YjI4OGM5IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjIwZTVmYWIyY2EwZjk1YmE5ZDFlZjUwNTJmZTViMDI4ZTNlMWQ2NmQ0Y2RlYTZiOWFk
ZmNiZDNlNTI0YzJhMDkiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20v
cnJ0aG9tYXMvZW5jaGFudC9yZWxlYXNlcyIKIAotLSAKMi40Ny4xCgo=

--===============7953868319068279756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.10" to "2.8.12"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.10", added "/usr/lib/.debug/libenchant-2.so.2.8.12"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 444024 to 443672 (-0%)
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.10" to "2.8.12"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.10" to "2.8.12"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.10" to "2.8.12"
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.8.10" to "2.8.12"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 460930 to 463783 (+1%)
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.10" to "2.8.12"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.8.10" to "2.8.12"
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.10", added "/usr/lib/libenchant-2.so.2.8.12"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.10/enchant-2.8.10.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.12/enchant-2.8.12.tar.gz"
packages/core2-64-poky-linux/enchant2: PV changed from "2.8.10" to "2.8.12"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.10 to libenchant-2.so.2.8.12
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.10 to libenchant-2.so.2.8.12
  /usr/lib/libenchant-2.so.2.8.10 moved to /usr/lib/libenchant-2.so.2.8.12

--===============7953868319068279756==--

