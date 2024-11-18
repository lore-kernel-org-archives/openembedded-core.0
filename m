Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342B8D60CEF
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4875.1731964671551732013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Hn2gw9pB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JfyUXIp6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101934123cfef-888a7750-5448-414f-9d4a-939d46a2de04-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L5tvl8FtLWwq310KhfsV3OSjIFneLyFjbR5fbrmZN2c=;
	b=Hn2gw9pBVh4twzDV47mETe62DEOI0RL/6Y6SbX6M4oBxSuYy7XXx+wy7HsgMGw11
	Wsp4iGerq+ttofLZBqLmVQ6PDnOJbi9vyyg8KeutiKZKySv2ZuGXycncQg9xzqQWleq
	jwc2lTe5Hi2dWKs8et3RihmXF12QdILakx5PXYvs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L5tvl8FtLWwq310KhfsV3OSjIFneLyFjbR5fbrmZN2c=;
	b=JfyUXIp6JpgHbSeXGyA7GRuyNMrffpafOzprZ62UksIaeswLyW3UbPwGgpwD8L8Q
	bZhZRS30Gwut3r6YiTBGRtdG7cXOVYI0rg2HjVPtC785wgW+/0LCZTCBwiSWdXhovrs
	F6vDv6vRn1OdM8jvOwp9JPH3TGm0ITXLxDgTYgTM=
Content-Type: multipart/mixed; boundary="===============6483952661859058860=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 283 SUCCEEDED
Message-ID: <010101934123cfef-888a7750-5448-414f-9d4a-939d46a2de04-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207357

--===============6483952661859058860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *283* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-277-283.patch
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
From f14f1563ee800b96d9717f50a4589c6b2b043fec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 11:39:55 +0000
Subject: [PATCH] diffoscope: upgrade 277 -> 283

---
 .../diffoscope/{diffoscope_277.bb => diffoscope_283.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_277.bb => diffoscope_283.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_277.bb b/meta/recipes-support/diffoscope/diffoscope_283.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_277.bb
rename to meta/recipes-support/diffoscope/diffoscope_283.bb
index f609e607f3..27aeaaa7b6 100644
--- a/meta/recipes-support/diffoscope/diffoscope_277.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_283.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d2d4236d7b72be8344b0c7a19506350a7b17d316bcd79d7bfc113e10400b0e10"
+SRC_URI[sha256sum] = "0469ff70e1f37b5e96496f5e3c88dbafcf03fafff409a90601ed84febc31c543"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.1


--===============6483952661859058860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.13/site-packages/diffoscope-277.dist-info -> /usr/lib/python3.13/site-packages/diffoscope-283.dist-info, added "/usr/lib/python3.13/site-packages/diffoscope/comparators/__pycache__/uki.cpython-313.pyc /usr/lib/python3.13/site-packages/diffoscope/comparators/uki.py"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-277.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-283.dist-info
  /usr/lib/python3.13/site-packages/diffoscope/comparators/__pycache__/uki.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/diffoscope/comparators/uki.py was added

--===============6483952661859058860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 277 [default] to 283 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "277" to "283"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 277 [default] to 283 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "277" to "283"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 277 [default] to 283 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "277" to "283"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 277 [default] to 283 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "277" to "283"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 277 [default] to 283 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "277" to "283"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 277 [default] to 283 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "277" to "283"
packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.13/site-packages/diffoscope-277.dist-info -> /usr/lib/python3.13/site-packages/diffoscope-283.dist-info, added "/usr/lib/python3.13/site-packages/diffoscope/comparators/uki.py /usr/lib/python3.13/site-packages/diffoscope/comparators/__pycache__/uki.cpython-313.pyc"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 277 [default] to 283 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1371769 to 1377215 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "277" to "283"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 277 [default] to 283 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "277" to "283"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-277.tar.gz;downloadfilename=diffoscope-277.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-283.tar.gz;downloadfilename=diffoscope-283.tar.gz"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-277.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-283.dist-info
  /usr/lib/python3.13/site-packages/diffoscope/comparators/__pycache__/uki.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/diffoscope/comparators/uki.py was added

--===============6483952661859058860==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-277-283.patch"

RnJvbSBmMTRmMTU2M2VlODAwYjk2ZDk3MTdmNTBhNDU4OWM2YjJiMDQzZmVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMTE6Mzk6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI3NyAtPiAyODMKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjc3LmJiID0+IGRpZmZvc2NvcGVfMjgzLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNzcuYmIgPT4gZGlmZm9zY29wZV8y
ODMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI3Ny5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yODMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI3Ny5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI4My5iYgppbmRleCBmNjA5ZTYw
N2YzLi4yN2FlYWFhN2I2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjc3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yODMuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDJkNDIzNmQ3YjcyYmU4MzQ0YjBjN2ExOTUwNjM1MGE3YjE3ZDMxNmJjZDc5ZDdiZmMx
MTNlMTA0MDBiMGUxMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwNDY5ZmY3MGUxZjM3YjVlOTY0
OTZmNWUzYzg4ZGJhZmNmMDNmYWZmZjQwOWE5MDYwMWVkODRmZWJjMzFjNTQzIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ0LjEKCg==

--===============6483952661859058860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1881 targets, 52 skipped, 0 masked, 0 errors.
Removing 152 recipes from the core2-64 sysroot...done.
Removing 168 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============6483952661859058860==--

