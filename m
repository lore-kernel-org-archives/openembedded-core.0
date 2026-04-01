Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689BC10FCAD0
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14749.1775054159972482975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y0IAuHp/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2tvNwf3W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d49791019-4b5ce33b-c492-4d21-80c9-9747499caded-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LrKEPjooJ6s0tD4lvp0e5dgIhVPCdJYibPCjiwBoIc4=;
	b=Y0IAuHp/SI005b0gFA2cDTbFmWG0dyoi72+hfQz4UkzUvrxqN/fteCt6w77p3SHF
	+HMVqNHZAXhuXq5bYJoJGkJSZuCTrkThFRK7zh2H1gaYmhsrdCwHS1hLqWVjuy0xPHi
	wAj/M+jqNkQX2K09rCorKFRO37yTdKPlyitAM1Sg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LrKEPjooJ6s0tD4lvp0e5dgIhVPCdJYibPCjiwBoIc4=;
	b=2tvNwf3Web8kj1AaZWYZ8cfvu2V+u87hPJUmt1JJoQ7u6dCr4HG7V6X0HsPXqX9O
	+HhDVhbvGD+56qMlKX8LNN61TDXee4tjdd8NiaAsb2iW9hzkylthv5A90hL4NkLtxmO
	U15ZG2dcaySS+1s0FcQ3FUzXhfdbYr3ZuTSiqLG4=
Content-Type: multipart/mixed; boundary="===============5694676310777072269=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.20.0 SUCCEEDED
Message-ID: <0101019d49791019-4b5ce33b-c492-4d21-80c9-9747499caded-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234386

--===============5694676310777072269==
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
From 140a5c22251cf063aacd09640dcbb54b0f6d164a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:16:00 +0000
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


--===============5694676310777072269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info -> /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info, added "/usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/rell.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/lexers/rell.py"
Changes to packages/x86-64-v3-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info moved to /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/rell.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/lexers/rell.py was added

--===============5694676310777072269==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.19.2-2.20.0.patch"

RnJvbSAxNDBhNWMyMjI1MWNmMDYzYWFjZDA5NjQwZGNiYjU0YjBmNmQxNjRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDoxNjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlnbWVudHM6IHVwZ3JhZGUgMi4xOS4yIC0+IDIuMjAuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtcHlnbWVudHNfMi4xOS4yLmJiID0+IHB5dGhvbjMtcHlnbWVudHNfMi4yMC4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Z21lbnRzXzIuMTkuMi5i
YiA9PiBweXRob24zLXB5Z21lbnRzXzIuMjAuMC5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnbWVudHNfMi4xOS4yLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMjAuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlnbWVudHNfMi4xOS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlnbWVudHNfMi4yMC4wLmJiCmluZGV4IGExZjczYjQ0MWQuLmFi
ZTYyMDUyOTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weWdtZW50c18yLjE5LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5Z21lbnRzXzIuMjAuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJCU0Qt
Mi1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zNmExM2M5
MDUxNGUyODk5ZjFlYmE3ZjQxYzNlZTU5MiIKIAogaW5oZXJpdCBweXRob25faGF0Y2hsaW5nCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNjM2Y2IyNDc3Y2VjN2Y4OTUyNTM2OTcwYmM1MzNiYzQzNzQz
NTQyZjcwMzkyYWUwMjYzNzQ2MDBhZGQ1Yjg4NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NzU3
Y2QwMzc2ODA1M2ZmOTlmMzAzOWMxYTM2ZDZjMGFhMGIyNjM0MzhmY2FiMTc1MjBiMzBhMzAzYTgy
YjVmIgogCiBpbmhlcml0IHB5cGkKIAotLSAKMi40Ny4xCgo=

--===============5694676310777072269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygments: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.19.2.tar.gz;downloadfilename=pygments-2.19.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.20.0.tar.gz;downloadfilename=pygments-2.20.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pygments: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 8779185 to 8828521 (+1%)
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: PV changed from "2.19.2" to "2.20.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info -> /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/pygments/lexers/rell.py /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/rell.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.19.2 [default] to 2.20.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.14/site-packages/pygments-2.19.2.dist-info moved to /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/rell.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/lexers/rell.py was added

--===============5694676310777072269==--

