Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5837CC54790
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20158.1708018344559275301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AAB1ZgBu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BviYQP/g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dadd3acd6-6772f585-bfb2-4969-b062-24d58adf72e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0gZTNMbQ8tN9uI0vDvHhTY/RtKKxCn4gKwSbh7AJ1qk=;
	b=AAB1ZgBupAv7ZggclSEEy69qPCeTRO7L6QNf56S5wga/O+Dt0/u9Z612DVxWenEY
	PqHlBjyEQAIwYK7gdErwftuhsdc69kksOT2rVxyKhEJ6b8qkQJqYFHU/5AHAXVoX/A8
	LdwuVJPodoThcXNmZ+mcFuA0MaGV0HyhJYTQ/8+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0gZTNMbQ8tN9uI0vDvHhTY/RtKKxCn4gKwSbh7AJ1qk=;
	b=BviYQP/gxvpe+kTQDN783e1jp2qotPIMveZtzc5mcbByzDeeqW2utklVNO30HUs9
	r/Xa7opKVaAtVCi5W8L+ab2PaakCkW342Hzt74InSVrm07kVKgvsufkJOsNk6GQipps
	7yyBsdWECwaR/fV18prORuv7R4/165z4ziIEGoKc=
Content-Type: multipart/mixed; boundary="===============8637742602071444798=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 257 SUCCEEDED
Message-ID: <0101018dadd3acd6-6772f585-bfb2-4969-b062-24d58adf72e0-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195666

--===============8637742602071444798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *257* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-253-257.patch
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
From 9f648f95d8f8ff4583cf79a079a78e40aab97af2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 16:50:33 +0000
Subject: [PATCH] diffoscope: upgrade 253 -> 257

---
 .../diffoscope/{diffoscope_253.bb => diffoscope_257.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_253.bb => diffoscope_257.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_253.bb b/meta/recipes-support/diffoscope/diffoscope_257.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_253.bb
rename to meta/recipes-support/diffoscope/diffoscope_257.bb
index a1fc63efc3..91e6719a58 100644
--- a/meta/recipes-support/diffoscope/diffoscope_253.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_257.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ca3d826b691f4998d6de28a016b3555d56a7283b97ad92944ce643ea6e7eb614"
+SRC_URI[sha256sum] = "1bceee9ca6fe2d7faa2f21daf9f4a83d83e1f1be8b682691b1d985d5e870077f"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.42.0


--===============8637742602071444798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "253" to "257"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 253 [default] to 257 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "253" to "257"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 253 [default] to 257 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "253" to "257"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 253 [default] to 257 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "253" to "257"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 253 [default] to 257 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "253" to "257"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 253 [default] to 257 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "253" to "257"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 253 [default] to 257 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-253.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-257.dist-info, added "/usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1333244 to 1350079 (+1%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "253" to "257"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 253 [default] to 257 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-253.tar.gz;downloadfilename=diffoscope-253.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-257.tar.gz;downloadfilename=diffoscope-257.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "253" to "257"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 253 [default] to 257 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-253.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-257.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py was added

--===============8637742602071444798==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-253-257.patch"

RnJvbSA5ZjY0OGY5NWQ4ZjhmZjQ1ODNjZjc5YTA3OWE3OGU0MGFhYjk3YWYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTY6NTA6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI1MyAtPiAyNTcKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjUzLmJiID0+IGRpZmZvc2NvcGVfMjU3LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNTMuYmIgPT4gZGlmZm9zY29wZV8y
NTcuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI1My5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNTcuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI1My5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI1Ny5iYgppbmRleCBhMWZjNjNl
ZmMzLi45MWU2NzE5YTU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjUzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNTcuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiY2EzZDgyNmI2OTFmNDk5OGQ2ZGUyOGEwMTZiMzU1NWQ1NmE3MjgzYjk3YWQ5Mjk0NGNl
NjQzZWE2ZTdlYjYxNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxYmNlZWU5Y2E2ZmUyZDdmYWEy
ZjIxZGFmOWY0YTgzZDgzZTFmMWJlOGI2ODI2OTFiMWQ5ODVkNWU4NzAwNzdmIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQyLjAKCg==

--===============8637742602071444798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1858 targets, 46 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-64 sysroot...done.
Removing 127 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============8637742602071444798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-253.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-257.dist-info, added "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-253.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-257.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py was added

--===============8637742602071444798==--

