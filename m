Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80971CD343B
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15718.1777645544784749158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sIKb1aS6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xHoYtbWL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019de3ee62ee-b923ee02-69b8-407e-aac4-29c9ffae16ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g8kQq4fui8x64nOM0JBKl1KkUAqIxtVP9twu7nfyRkI=;
	b=sIKb1aS6KwqcQQjxEOhfI3XGTGTAlcykdem/HYgJobSly+p4KQB56QlumRv9R+ho
	WaozxZrAgZwrWUnAAqAKgsnc/nwlTepsCrllxcSX8jnSV5erQ9MGhVp6p2akenKHfwb
	ApoOTHvMX5Sss+6g7SQLwe3nRRjO8cVpJFEtohV4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g8kQq4fui8x64nOM0JBKl1KkUAqIxtVP9twu7nfyRkI=;
	b=xHoYtbWLODTrJIAH48NlwSVrNu2mEQfj5Kw0YjKZge6yp+T40X1CCWsgflx+eUha
	e1Inzd2hgyj7HSk/3MI4wXBMIh936HzTL4ySGGGA9Aksrq03R7fUPiyUJUW5qIFabZZ
	8P5Je4eHwpqvAa6nUFJkF7EdNuTxaIfqiV8n4+jQ=
Content-Type: multipart/mixed; boundary="===============4567005382433465902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 6.1.0 SUCCEEDED
Message-ID: <0101019de3ee62ee-b923ee02-69b8-407e-aac4-29c9ffae16ad-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236249

--===============4567005382433465902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *6.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-6.0.1-6.1.0.patch
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
From c9f763037b2b39daae3fbe96bbe79f20ef951d90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 09:24:02 +0000
Subject: [PATCH] python3-uritools: upgrade 6.0.1 -> 6.1.0

---
 .../{python3-uritools_6.0.1.bb => python3-uritools_6.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.0.1.bb => python3-uritools_6.1.0.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.0.1.bb b/meta/recipes-devtools/python/python3-uritools_6.1.0.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-uritools_6.0.1.bb
rename to meta/recipes-devtools/python/python3-uritools_6.1.0.bb
index 718de87eab..eeeca59e21 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
 
-SRC_URI[sha256sum] = "2f9e9cb954e7877232b2c863f724a44a06eb98d9c7ebdd69914876e9487b94f8"
+SRC_URI[sha256sum] = "be97e452528e7a42ef0a4df68364ddd77833e982c5bac5cdcfee15c81f65e96b"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============4567005382433465902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-6.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uritools-6.0.1.dist-info -> /usr/lib/python3.14/site-packages/uritools-6.1.0.dist-info, added "/usr/lib/python3.14/site-packages/uritools/py.typed /usr/lib/python3.14/site-packages/uritools/__init__.pyi"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 65488 to 73597 (+12%)
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.0.1.dist-info moved to /usr/lib/python3.14/site-packages/uritools-6.1.0.dist-info
  /usr/lib/python3.14/site-packages/uritools/__init__.pyi was added
  /usr/lib/python3.14/site-packages/uritools/py.typed was added

--===============4567005382433465902==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-6.0.1-6.1.0.patch"

RnJvbSBjOWY3NjMwMzdiMmIzOWRhYWUzZmJlOTZiYmU3OWYyMGVmOTUxZDkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwOToyNDowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJpdG9vbHM6IHVwZ3JhZGUgNi4wLjEgLT4gNi4xLjAKCi0tLQogLi4uL3tweXRob24z
LXVyaXRvb2xzXzYuMC4xLmJiID0+IHB5dGhvbjMtdXJpdG9vbHNfNi4xLjAuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cml0b29sc182LjAuMS5iYiA9
PiBweXRob24zLXVyaXRvb2xzXzYuMS4wLmJifSAoNzYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc182LjAuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc182LjEuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDc2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXJpdG9vbHNfNi4wLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11cml0b29sc182LjEuMC5iYgppbmRleCA3MThkZTg3ZWFiLi5lZWVjYTU5ZTIx
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9v
bHNfNi4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVy
aXRvb2xzXzYuMS4wLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vdGtlbS91cml0b29scy8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWUyMWJiZTUzYjI3MzBiZmUxOTExY2YzODFiODE4MjFlIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmY5ZTljYjk1NGU3ODc3MjMyYjJjODYzZjcyNGE0NGEw
NmViOThkOWM3ZWJkZDY5OTE0ODc2ZTk0ODdiOTRmOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJi
ZTk3ZTQ1MjUyOGU3YTQyZWYwYTRkZjY4MzY0ZGRkNzc4MzNlOTgyYzViYWM1Y2RjZmVlMTVjODFm
NjVlOTZiIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVz
dC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============4567005382433465902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.0.1.tar.gz;downloadfilename=uritools-6.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.1.0.tar.gz;downloadfilename=uritools-6.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-uritools: PKGV changed from 6.0.1 [default] to 6.1.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools: PV changed from "6.0.1" to "6.1.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "6.0.1" to "6.1.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 6.0.1 [default] to 6.1.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "6.0.1" to "6.1.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 6.0.1 [default] to 6.1.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "6.0.1" to "6.1.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 6.0.1 [default] to 6.1.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "6.0.1" to "6.1.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 6.0.1 [default] to 6.1.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PV changed from "6.0.1" to "6.1.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 47222 to 50103 (+6%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGV changed from 6.0.1 [default] to 6.1.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PV changed from "6.0.1" to "6.1.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 6.0.1 [default] to 6.1.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "6.0.1" to "6.1.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 6.0.1 [default] to 6.1.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PV changed from "6.0.1" to "6.1.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 65488 to 73597 (+12%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGV changed from 6.0.1 [default] to 6.1.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-6.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uritools-6.0.1.dist-info -> /usr/lib/python3.14/site-packages/uritools-6.1.0.dist-info, added "/usr/lib/python3.14/site-packages/uritools/py.typed /usr/lib/python3.14/site-packages/uritools/__init__.pyi"
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.0.1.dist-info moved to /usr/lib/python3.14/site-packages/uritools-6.1.0.dist-info
  /usr/lib/python3.14/site-packages/uritools/__init__.pyi was added
  /usr/lib/python3.14/site-packages/uritools/py.typed was added

--===============4567005382433465902==--

