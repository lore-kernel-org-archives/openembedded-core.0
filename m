Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66F7D5CC8D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17401.1765872145995976586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bbUcA824;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YUPYwQY/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262e93df-e6bd3b47-6c65-47db-8e6e-a2476a863474-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2OjaX5Kf+4J/vCI78vPen0UfLTASWv2rdLZOOqk4Ixg=;
	b=bbUcA824RrAdM8dVRchkaKijhVEHkd/8o4CgDXdafo7xTvu1kpqBeBKqoQ1u8dRs
	5STTKDCmImY4ffawutr61eIoGKUrvcb+vfI2l02q4qTrClGDCSdqt0+mIhZhBxw8Ish
	iWjxUvGspwmf7uCKPx2PO6bgdCgbDICJK2zfh9p4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2OjaX5Kf+4J/vCI78vPen0UfLTASWv2rdLZOOqk4Ixg=;
	b=YUPYwQY/xH4GzjJQhNKpLyJ7hsOD6kuPyrzjgjHakH+/QvlD7w69piZB7r6jTkGx
	9XxayCW52yDKzpXNY89zq0owuzHy5yT/5QJTO4ZMsYzsrIuVABf/dZSltwqIGuaQsur
	wizfa9/fE7B/ZopS9AiXvPZfM1e6KvyfvO0W+izQ=
Content-Type: multipart/mixed; boundary="===============5215624053466568363=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycparser: upgrading to 2.23 SUCCEEDED
Message-ID: <0101019b262e93df-e6bd3b47-6c65-47db-8e6e-a2476a863474-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227817

--===============5215624053466568363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycparser* to *2.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycparser-upgrade-2.22-2.23.patch
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
From b307fcf574c6e8e909abe9943d8f38a41aeb5068 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:52:58 +0000
Subject: [PATCH] python3-pycparser: upgrade 2.22 -> 2.23

---
 .../{python3-pycparser_2.22.bb => python3-pycparser_2.23.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycparser_2.22.bb => python3-pycparser_2.23.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.22.bb b/meta/recipes-devtools/python/python3-pycparser_2.23.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pycparser_2.22.bb
rename to meta/recipes-devtools/python/python3-pycparser_2.23.bb
index 0be39ea383..a33a6553b4 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.22.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_2.23.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
 
-SRC_URI[sha256sum] = "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
+SRC_URI[sha256sum] = "78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============5215624053466568363==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycparser-upgrade-2.22-2.23.patch"

RnJvbSBiMzA3ZmNmNTc0YzZlOGU5MDlhYmU5OTQzZDhmMzhhNDFhZWI1MDY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6NTI6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3BhcnNlcjogdXBncmFkZSAyLjIyIC0+IDIuMjMKCi0tLQogLi4uL3tweXRob24z
LXB5Y3BhcnNlcl8yLjIyLmJiID0+IHB5dGhvbjMtcHljcGFyc2VyXzIuMjMuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNwYXJzZXJfMi4yMi5iYiA9
PiBweXRob24zLXB5Y3BhcnNlcl8yLjIzLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMi4yMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMi4yMy5iYgpzaW1pbGFyaXR5
IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHljcGFyc2VyXzIuMjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weWNwYXJzZXJfMi4yMy5iYgppbmRleCAwYmUzOWVhMzgzLi5hMzNhNjU1M2I0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcGFy
c2VyXzIuMjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Y3BhcnNlcl8yLjIzLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vZWxpYmVuL3B5Y3BhcnNlciIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9OTc2MWMzZmZlZTdiYTk5YzYwZGNhMDQw
OGZkMzI2MmIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OTFjOGJlOWMwNDBmNTM5MGY1YmY0
NGE1YjA3NzUyYmQwN2Y1NmVkZjk5MjM4MWIwNWM3MDE0MzllZWMxMGY2IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjc4ODE2ZDRmMjRhZGQ4ZjEwYTA2ZDZmMDViNGQ0MjRhZDllOTZjZmViZjY4YTRk
ZGM5OWM2NWMwNzIwZDAwYzIiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjQ3
LjEKCg==

--===============5215624053466568363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pycparser-2.22.dist-info -> /usr/lib/python3.13/site-packages/pycparser-2.23.dist-info, directory renamed /usr/lib/python3.13/site-packages/pycparser-2.22.dist-info/licenses -> /usr/lib/python3.13/site-packages/pycparser-2.23.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.13/site-packages/pycparser-2.22.dist-info moved to /usr/lib/python3.13/site-packages/pycparser-2.23.dist-info

--===============5215624053466568363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycparser: PKGV changed from 2.22 [default] to 2.23 [default]
packages/x86-64-v3-poky-linux/python3-pycparser: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.22.tar.gz;downloadfilename=pycparser-2.22.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.23.tar.gz;downloadfilename=pycparser-2.23.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycparser: PV changed from "2.22" to "2.23"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PKGV changed from 2.22 [default] to 2.23 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PV changed from "2.22" to "2.23"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PKGV changed from 2.22 [default] to 2.23 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PV changed from "2.22" to "2.23"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PKGV changed from 2.22 [default] to 2.23 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PV changed from "2.22" to "2.23"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PKGV changed from 2.22 [default] to 2.23 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PV changed from "2.22" to "2.23"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PKGV changed from 2.22 [default] to 2.23 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PV changed from "2.22" to "2.23"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PKGV changed from 2.22 [default] to 2.23 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PV changed from "2.22" to "2.23"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGV changed from 2.22 [default] to 2.23 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 1198204 to 1209244 (+1%)
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PV changed from "2.22" to "2.23"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pycparser-2.22.dist-info -> /usr/lib/python3.13/site-packages/pycparser-2.23.dist-info, directory renamed /usr/lib/python3.13/site-packages/pycparser-2.22.dist-info/licenses -> /usr/lib/python3.13/site-packages/pycparser-2.23.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.13/site-packages/pycparser-2.22.dist-info moved to /usr/lib/python3.13/site-packages/pycparser-2.23.dist-info

--===============5215624053466568363==--

