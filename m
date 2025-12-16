Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AB3D5CC81
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17398.1765872136614573548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sGupV/jc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OYYHirc6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262e967c-0d71d2ae-b944-4e6f-927c-343982b7ef5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jyJwnl4p5uelBmb+UYwbUN4mahUAvj6iRtS2HBTSbw8=;
	b=sGupV/jcWuIemXuOE7H1p1NaIPsx4TTDDBEBqUQTxZij/5738V5Hej/bQzjbPuKo
	XzgQnj3fVQZYcQsjrRJt/AveOK2WcsmGDBSkwX7aggYfSp9vTLtWd9AMPXSj3PBEBBk
	HhNQqeRIJ6kVKxJkun+DUWk6igb4h52FheQcLUEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jyJwnl4p5uelBmb+UYwbUN4mahUAvj6iRtS2HBTSbw8=;
	b=OYYHirc6LM6enusEFqL0sChJgaDutA57RQCoI80SBrbWZcIt+y0CDtpv/gvH4rbY
	/iEZPAVy1tH7fAdld6luLqC96Nqyv1hvgEVXQrVbtoRWriicetWbjW3OI5ngtuzh0CX
	1e6b22bDC9x5uv68RPnHuy4bXLyFsyWdE/4ypqXM=
Content-Type: multipart/mixed; boundary="===============7720826556045400950=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 9.0.2 SUCCEEDED
Message-ID: <0101019b262e967c-0d71d2ae-b944-4e6f-927c-343982b7ef5a-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227821

--===============7720826556045400950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytest* to *9.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-8.4.2-9.0.2.patch
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
From 1c49032d385d0e2c3626125b9c2344990e10e228 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:06:11 +0000
Subject: [PATCH] python3-pytest: upgrade 8.4.2 -> 9.0.2

---
 .../python/{python3-pytest_8.4.2.bb => python3-pytest_9.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.4.2.bb => python3-pytest_9.0.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.4.2.bb b/meta/recipes-devtools/python/python3-pytest_9.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.4.2.bb
rename to meta/recipes-devtools/python/python3-pytest_9.0.2.bb
index d85033cd1f..007db2e732 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.4.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.0.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "86c0d0b93306b961d58d62a4db4879f27fe25513d4b969df351abdddb3c30e01"
+SRC_URI[sha256sum] = "75186651a92bd89611d1d9fc20f0b4345fd827c41ccd5c299a868a05d70edf11"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.1


--===============7720826556045400950==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-8.4.2-9.0.2.patch"

RnJvbSAxYzQ5MDMyZDM4NWQwZTJjMzYyNjEyNWI5YzIzNDQ5OTBlMTBlMjI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6MDY6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdDogdXBncmFkZSA4LjQuMiAtPiA5LjAuMgoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5dGVzdF84LjQuMi5iYiA9PiBweXRob24zLXB5dGVzdF85LjAuMi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dGVzdF84LjQuMi5iYiA9PiBw
eXRob24zLXB5dGVzdF85LjAuMi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzguNC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF85LjAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0
XzguNC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHl0ZXN0XzkuMC4yLmJiCmluZGV4IGQ4NTAzM2NkMWYuLjAwN2RiMmU3MzIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfOC40LjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF85LjAuMi5iYgpA
QCAtNSw3ICs1LDcgQEAgREVTQ1JJUFRJT04gPSAiVGhlIHB5dGVzdCBmcmFtZXdvcmsgbWFrZXMg
aXQgZWFzeSB0byB3cml0ZSBzbWFsbCB0ZXN0cywgeWV0IHNjYWwKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YmQyN2U0MWI2NTUwZmUwZmM0
NTM1NmQxZDgxZWUzN2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NmMwZDBiOTMzMDZiOTYx
ZDU4ZDYyYTRkYjQ4NzlmMjdmZTI1NTEzZDRiOTY5ZGYzNTFhYmRkZGIzYzMwZTAxIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjc1MTg2NjUxYTkyYmQ4OTYxMWQxZDlmYzIwZjBiNDM0NWZkODI3YzQx
Y2NkNWMyOTlhODY4YTA1ZDcwZWRmMTEiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29s
cy1zY20tbmF0aXZlIgogCi0tIAoyLjQ3LjEKCg==

--===============7720826556045400950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info -> /usr/lib/python3.13/site-packages/pytest-9.0.2.dist-info, removed "/usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info/licenses/AUTHORS /usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info/licenses/LICENSE", added "/usr/lib/python3.13/site-packages/_pytest/terminalprogress.py /usr/lib/python3.13/site-packages/_pytest/__pycache__/subtests.cpython-313.pyc /usr/lib/python3.13/site-packages/_pytest/__pycache__/terminalprogress.cpython-313.pyc /usr/lib/python3.13/site-packages/_pytest/subtests.py /usr/lib/python3.13/site-packages/pytest-9.0.2.dist-info/licenses/LICENSE"
Changes to packages/x86-64-v3-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info moved to /usr/lib/python3.13/site-packages/pytest-9.0.2.dist-info
  /usr/lib/python3.13/site-packages/_pytest/__pycache__/subtests.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/_pytest/__pycache__/terminalprogress.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/_pytest/subtests.py was added
  /usr/lib/python3.13/site-packages/_pytest/terminalprogress.py was added
  /usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info/licenses/AUTHORS was removed

--===============7720826556045400950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-8.4.2.tar.gz;downloadfilename=pytest-8.4.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-9.0.2.tar.gz;downloadfilename=pytest-9.0.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytest: PV changed from "8.4.2" to "9.0.2"
packages/x86-64-v3-poky-linux/python3-pytest: PKGV changed from 8.4.2 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "8.4.2" to "9.0.2"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 8.4.2 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "8.4.2" to "9.0.2"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 8.4.2 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "8.4.2" to "9.0.2"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 8.4.2 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "8.4.2" to "9.0.2"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 8.4.2 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-src: PV changed from "8.4.2" to "9.0.2"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 8.4.2 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "8.4.2" to "9.0.2"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 8.4.2 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PV changed from "8.4.2" to "9.0.2"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info -> /usr/lib/python3.13/site-packages/pytest-9.0.2.dist-info, removed "/usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info/licenses/LICENSE /usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info/licenses/AUTHORS", added "/usr/lib/python3.13/site-packages/pytest-9.0.2.dist-info/licenses/LICENSE /usr/lib/python3.13/site-packages/_pytest/__pycache__/subtests.cpython-313.pyc /usr/lib/python3.13/site-packages/_pytest/terminalprogress.py /usr/lib/python3.13/site-packages/_pytest/subtests.py /usr/lib/python3.13/site-packages/_pytest/__pycache__/terminalprogress.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGV changed from 8.4.2 [default] to 9.0.2 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2833788 to 2932382 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info moved to /usr/lib/python3.13/site-packages/pytest-9.0.2.dist-info
  /usr/lib/python3.13/site-packages/_pytest/__pycache__/subtests.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/_pytest/__pycache__/terminalprogress.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/_pytest/subtests.py was added
  /usr/lib/python3.13/site-packages/_pytest/terminalprogress.py was added
  /usr/lib/python3.13/site-packages/pytest-8.4.2.dist-info/licenses/AUTHORS was removed

--===============7720826556045400950==--

