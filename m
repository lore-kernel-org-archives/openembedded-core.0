Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C55F42119
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19737.1776261873959099597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hQjcIHB3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BoKRXI/Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d91755fe9-b44e1f60-e953-48a2-a75d-28646c5afa94-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IUCf4t8ynpdyZTakqmlRerXAtzIOyJVRJ6CU2NS3hy4=;
	b=hQjcIHB3bE8mdt8MNFEjB/RpAZn5qOB2QYTekIrmeZcVOVvTEqa8s8MnyxelVBb8
	eHqnlm91guv8r6ajtTKqzDcGXa/DajHGABygjtp6uGr9sj8DObi2Z0QgFOcxkPK5nhg
	SATN2T7XAXbuzov0VcwG6IkBkJbOPmiQFfcwDb6E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IUCf4t8ynpdyZTakqmlRerXAtzIOyJVRJ6CU2NS3hy4=;
	b=BoKRXI/Q2GMxowBf0iOtJPD/YVn17B347YJbrM61GLuifzuaOYWtKJajypoM1vuu
	8sA2hWN7v3IuioSucwvvmro0ZxQ/DFboU9KXAqNokmapB8mr2fvixTlQ8xXo7pJ1138
	hL/j5fxq4YH/czuaaUaGhij8gdcwVqr5zfJKd1g0=
Content-Type: multipart/mixed; boundary="===============7327722216726462842=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.20.0 SUCCEEDED
Message-ID: <0101019d91755fe9-b44e1f60-e953-48a2-a75d-28646c5afa94-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235245

--===============7327722216726462842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygments* to *2.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.19.2-2.20.0.patch
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
From 83433d95a7f68c600f93d11681d87fa3653528a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:42:08 +0000
Subject: [PATCH] python3-pygments: upgrade 2.19.2 -> 2.20.0

---
 .../{python3-pygments_2.19.2.bb => python3-pygments_2.20.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.19.2.bb => python3-pygments_2.20.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.19.2.bb b/meta/recipes-devtools/python/python3-pygments_2.20.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pygments_2.19.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.20.0.bb
index a1f73b441d..abe6205292 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.19.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.20.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
+SRC_URI[sha256sum] = "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
 
 inherit pypi
 
-- 
2.47.1


--===============7327722216726462842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info -> /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info, added "/usr/lib/python3.14/site-packages/pygments/lexers/rell.py /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/rell.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info moved to /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/rell.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/lexers/rell.py was added

--===============7327722216726462842==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.19.2-2.20.0.patch"

RnJvbSA4MzQzM2Q5NWE3ZjY4YzYwMGY5M2QxMTY4MWQ4N2ZhMzY1MzUyOGEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6NDI6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z21lbnRzOiB1cGdyYWRlIDIuMTkuMiAtPiAyLjIwLjAKCi0tLQogLi4uL3tweXRo
b24zLXB5Z21lbnRzXzIuMTkuMi5iYiA9PiBweXRob24zLXB5Z21lbnRzXzIuMjAuMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdtZW50c18yLjE5LjIu
YmIgPT4gcHl0aG9uMy1weWdtZW50c18yLjIwLjAuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTkuMi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdtZW50c18yLjIwLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z21lbnRzXzIuMTkuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMjAuMC5iYgppbmRleCBhMWY3M2I0NDFkLi5h
YmU2MjA1MjkyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlnbWVudHNfMi4xOS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWdtZW50c18yLjIwLjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNE
LTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzZhMTNj
OTA1MTRlMjg5OWYxZWJhN2Y0MWMzZWU1OTIiCiAKIGluaGVyaXQgcHl0aG9uX2hhdGNobGluZwot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjYzNmNiMjQ3N2NlYzdmODk1MjUzNjk3MGJjNTMzYmM0Mzc0
MzU0MmY3MDM5MmFlMDI2Mzc0NjAwYWRkNWI4ODciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjc1
N2NkMDM3NjgwNTNmZjk5ZjMwMzljMWEzNmQ2YzBhYTBiMjYzNDM4ZmNhYjE3NTIwYjMwYTMwM2E4
MmI1ZiIKIAogaW5oZXJpdCBweXBpCiAKLS0gCjIuNDcuMQoK

--===============7327722216726462842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygments: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.19.2.tar.gz;downloadfilename=pygments-2.19.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.20.0.tar.gz;downloadfilename=pygments-2.20.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pygments: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info -> /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/rell.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/lexers/rell.py"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 8779185 to 8828521 (+1%)
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: PV changed from "2.19.2" to "2.20.0"
Changes to packages/x86-64-v3-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info moved to /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/rell.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/lexers/rell.py was added

--===============7327722216726462842==--

