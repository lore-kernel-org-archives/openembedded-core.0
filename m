Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BD6C7114A
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.27784.1748786124066601956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RhHD0sCW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RZ8kwX4l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101972bc691b3-de067b34-b164-421c-a7cf-cfbb28c01a83-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786123;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7+rPP1muVXLykOGqCIJQe5jn7Y7Jsnp7S6LFP06OWmo=;
	b=RhHD0sCWHp7ft4HO5yTnBckdSNV1mQ8qE2bwDZkEkc+qZUKfOpiFxkFAh87FhgF8
	ZEjyup5aob+emX6iXCmn8efRR6huI16f3CSQMTsf9PEni//JNNj1UJxvToAvat78RBO
	YRx0Q56JBEEkKpth57pAKWvBH49I69byscyc7IuU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786123;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7+rPP1muVXLykOGqCIJQe5jn7Y7Jsnp7S6LFP06OWmo=;
	b=RZ8kwX4lzPamLbKh2n6kuXjqRdIGOfvBIuv3WDsfEuSdNTX/QOspqbr8ok5Etf27
	qMlNCJQnPjylK9kKOFcDNye6nB/j2OjNFCt92zZpdQddlgQzwSemcg7c8w0eb0+XXRH
	u8koFgEy/A0Zc6EAWCAGtVkYpD1GHH/fWbQWJoq8=
Content-Type: multipart/mixed; boundary="===============2734860265900611579=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex,python3-pycryptodome: upgrading to
 3.23.0,3.23.0 SUCCEEDED
Message-ID: <010101972bc691b3-de067b34-b164-421c-a7cf-cfbb28c01a83-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217564

--===============2734860265900611579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodomex,python3-pycryptodome* to *3.23.0,3.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-python3-pycryptodome-upgrade-3.patch
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
From e7d96a93a70e0a8f818345c8b873ac71e2ce556f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 05:39:49 +0000
Subject: [PATCH] python3-pycryptodomex,python3-pycryptodome: upgrade 3.22.0 ->
 3.23.0,3.22.0 -> 3.23.0

---
 ...n3-pycryptodome_3.22.0.bb => python3-pycryptodome_3.23.0.bb} | 2 +-
 ...-pycryptodomex_3.22.0.bb => python3-pycryptodomex_3.23.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.22.0.bb => python3-pycryptodome_3.23.0.bb} (44%)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.22.0.bb => python3-pycryptodomex_3.23.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
similarity index 44%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
index c65b2a71fc..2528162ff8 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "fd7ab568b3ad7b77c908d7c3f7e167ec5a8f035c64ff74f10d47a4edd043d723"
+SRC_URI[sha256sum] = "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
 
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.22.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.22.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
index 5cc37d81c2..43dba3faa3 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.22.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a1da61bacc22f93a91cbe690e3eb2022a03ab4123690ab16c46abb693a9df63d"
+SRC_URI[sha256sum] = "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.47.1


--===============2734860265900611579==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-python3-pycryptodome-upgrade-3.patch"

RnJvbSBlN2Q5NmE5M2E3MGUwYThmODE4MzQ1YzhiODczYWM3MWUyY2U1NTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwNTozOTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21leCxweXRob24zLXB5Y3J5cHRvZG9tZTogdXBncmFkZSAzLjIyLjAg
LT4KIDMuMjMuMCwzLjIyLjAgLT4gMy4yMy4wCgotLS0KIC4uLm4zLXB5Y3J5cHRvZG9tZV8zLjIy
LjAuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMy4wLmJifSB8IDIgKy0KIC4uLi1weWNy
eXB0b2RvbWV4XzMuMjIuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yMy4wLmJifSB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21l
XzMuMjIuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZV8zLjIzLjAuYmJ9ICg0NCUpCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNyeXB0b2RvbWV4XzMu
MjIuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yMy4wLmJifSAoNzElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVf
My4yMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRv
ZG9tZV8zLjIzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA0NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjIyLjAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4y
My4wLmJiCmluZGV4IGM2NWIyYTcxZmMuLjI1MjgxNjJmZjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMi4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMy4w
LmJiCkBAIC0xLDUgKzEsNSBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5o
ZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJmZDdhYjU2OGIzYWQ3Yjc3YzkwOGQ3YzNmN2UxNjdlYzVhOGYwMzVjNjRmZjc0ZjEwZDQ3YTRl
ZGQwNDNkNzIzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ0NzcwMGE2NTcxODJkNjAzMzhiYWIw
OWZkYjI3NTE4Zjg4NTZhZWNkODBhZTRjNmJkZGRiNjdmZjVkYTQ0ZWYiCiAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjIu
MC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4
XzMuMjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDcxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjIyLjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjMu
MC5iYgppbmRleCA1Y2MzN2Q4MWMyLi40M2RiYTNmYWEzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjIyLjAuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yMy4w
LmJiCkBAIC0xLDcgKzEsNyBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5o
ZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJhMWRhNjFiYWNjMjJmOTNhOTFjYmU2OTBlM2ViMjAyMmEwM2FiNDEyMzY5MGFiMTZjNDZhYmI2
OTNhOWRmNjNkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcxOTA5NzU4ZjAxMGM4MmJjOTliMGFi
ZjRlYTEyMDEyYzk4OTYyZmJmMDU4M2MyMTY0ZjhiODQ1MzNjMmU0ZGEiCiAKIEZJTEVTOiR7UE59
LXRlc3RzID0gIiBcCiAgICAgJHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vQ3J5cHRvZG9tZS9T
ZWxmVGVzdC8gXAotLSAKMi40Ny4xCgo=

--===============2734860265900611579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycryptodome: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.22.0.tar.gz;downloadfilename=pycryptodome-3.22.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.23.0.tar.gz;downloadfilename=pycryptodome-3.23.0.tar.gz"
packages/core2-64-poky-linux/python3-pycryptodome: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1324128 to 1324464 (+0%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2800913 to 2800717 (-0%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: added "/usr/lib/python3.13/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_KW.cpython-313.pyc /usr/lib/python3.13/site-packages/Crypto/SelfTest/Cipher/test_KW.py"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 3064691 to 3082607 (+1%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pycryptodome-3.22.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/pycryptodome-3.23.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pycryptodome-3.22.0.dist-info -> /usr/lib/python3.13/site-packages/pycryptodome-3.23.0.dist-info, added "/usr/lib/python3.13/site-packages/Crypto/Cipher/__pycache__/_mode_kw.cpython-313.pyc /usr/lib/python3.13/site-packages/Crypto/Cipher/__pycache__/_mode_kwp.cpython-313.pyc /usr/lib/python3.13/site-packages/Crypto/Cipher/_mode_kwp.py /usr/lib/python3.13/site-packages/Crypto/Cipher/_mode_kw.py"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3629625 to 3654076 (+1%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.22.0" to "3.23.0"
Changes to packages/core2-64-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.13/site-packages/pycryptodome-3.22.0.dist-info moved to /usr/lib/python3.13/site-packages/pycryptodome-3.23.0.dist-info
  /usr/lib/python3.13/site-packages/Crypto/Cipher/_mode_kwp.py was added
  /usr/lib/python3.13/site-packages/Crypto/Cipher/_mode_kw.py was added
  /usr/lib/python3.13/site-packages/Crypto/Cipher/__pycache__/_mode_kw.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Crypto/Cipher/__pycache__/_mode_kwp.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_KW.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Crypto/SelfTest/Cipher/test_KW.py was added
packages/core2-64-poky-linux/python3-pycryptodomex: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.22.0.tar.gz;downloadfilename=pycryptodomex-3.22.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.23.0.tar.gz;downloadfilename=pycryptodomex-3.23.0.tar.gz"
packages/core2-64-poky-linux/python3-pycryptodomex: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 1324144 to 1324480 (+0%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2800913 to 2800717 (-0%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: added "/usr/lib/python3.13/site-packages/Cryptodome/SelfTest/Cipher/test_KW.py /usr/lib/python3.13/site-packages/Cryptodome/SelfTest/Cipher/__pycache__/test_KW.cpython-313.pyc"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 3068919 to 3086867 (+1%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.22.0" to "3.23.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pycryptodomex-3.22.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/pycryptodomex-3.23.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pycryptodomex-3.22.0.dist-info -> /usr/lib/python3.13/site-packages/pycryptodomex-3.23.0.dist-info, added "/usr/lib/python3.13/site-packages/Cryptodome/Cipher/_mode_kw.py /usr/lib/python3.13/site-packages/Cryptodome/Cipher/__pycache__/_mode_kw.cpython-313.pyc /usr/lib/python3.13/site-packages/Cryptodome/Cipher/__pycache__/_mode_kwp.cpython-313.pyc /usr/lib/python3.13/site-packages/Cryptodome/Cipher/_mode_kwp.py"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.22.0 [default] to 3.23.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3634265 to 3658764 (+1%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.22.0" to "3.23.0"
Changes to packages/core2-64-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.13/site-packages/pycryptodomex-3.22.0.dist-info moved to /usr/lib/python3.13/site-packages/pycryptodomex-3.23.0.dist-info
  /usr/lib/python3.13/site-packages/Cryptodome/Cipher/_mode_kwp.py was added
  /usr/lib/python3.13/site-packages/Cryptodome/Cipher/_mode_kw.py was added
  /usr/lib/python3.13/site-packages/Cryptodome/Cipher/__pycache__/_mode_kw.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Cryptodome/Cipher/__pycache__/_mode_kwp.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Cryptodome/SelfTest/Cipher/__pycache__/test_KW.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Cryptodome/SelfTest/Cipher/test_KW.py was added

--===============2734860265900611579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: added "/usr/lib/python3.13/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_KW.cpython-313.pyc /usr/lib/python3.13/site-packages/Crypto/SelfTest/Cipher/test_KW.py"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pycryptodome-3.22.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/pycryptodome-3.23.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pycryptodome-3.22.0.dist-info -> /usr/lib/python3.13/site-packages/pycryptodome-3.23.0.dist-info, added "/usr/lib/python3.13/site-packages/Crypto/Cipher/__pycache__/_mode_kwp.cpython-313.pyc /usr/lib/python3.13/site-packages/Crypto/Cipher/__pycache__/_mode_kw.cpython-313.pyc /usr/lib/python3.13/site-packages/Crypto/Cipher/_mode_kwp.py /usr/lib/python3.13/site-packages/Crypto/Cipher/_mode_kw.py"
Changes to packages/core2-64-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.13/site-packages/pycryptodome-3.22.0.dist-info moved to /usr/lib/python3.13/site-packages/pycryptodome-3.23.0.dist-info
  /usr/lib/python3.13/site-packages/Crypto/Cipher/_mode_kwp.py was added
  /usr/lib/python3.13/site-packages/Crypto/Cipher/_mode_kw.py was added
  /usr/lib/python3.13/site-packages/Crypto/Cipher/__pycache__/_mode_kw.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Crypto/Cipher/__pycache__/_mode_kwp.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_KW.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Crypto/SelfTest/Cipher/test_KW.py was added
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: added "/usr/lib/python3.13/site-packages/Cryptodome/SelfTest/Cipher/__pycache__/test_KW.cpython-313.pyc /usr/lib/python3.13/site-packages/Cryptodome/SelfTest/Cipher/test_KW.py"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pycryptodomex-3.22.0.dist-info -> /usr/lib/python3.13/site-packages/pycryptodomex-3.23.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/pycryptodomex-3.22.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/pycryptodomex-3.23.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/Cryptodome/Cipher/_mode_kw.py /usr/lib/python3.13/site-packages/Cryptodome/Cipher/__pycache__/_mode_kwp.cpython-313.pyc /usr/lib/python3.13/site-packages/Cryptodome/Cipher/__pycache__/_mode_kw.cpython-313.pyc /usr/lib/python3.13/site-packages/Cryptodome/Cipher/_mode_kwp.py"
Changes to packages/core2-64-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.13/site-packages/pycryptodomex-3.22.0.dist-info moved to /usr/lib/python3.13/site-packages/pycryptodomex-3.23.0.dist-info
  /usr/lib/python3.13/site-packages/Cryptodome/Cipher/_mode_kwp.py was added
  /usr/lib/python3.13/site-packages/Cryptodome/Cipher/_mode_kw.py was added
  /usr/lib/python3.13/site-packages/Cryptodome/Cipher/__pycache__/_mode_kw.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Cryptodome/Cipher/__pycache__/_mode_kwp.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Cryptodome/SelfTest/Cipher/__pycache__/test_KW.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/Cryptodome/SelfTest/Cipher/test_KW.py was added

--===============2734860265900611579==--

