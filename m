Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25A9CD342F
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2346.1762384574956722874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IoCaxOoI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=O9+GyqDX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a564e9dac-dd717e22-204e-4022-8635-8411951ed5d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384584;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GITE2+DF35gDIM9b9g6BM3Xyc7oI8BEXK9+WKc6hSFE=;
	b=IoCaxOoIyt8dxI1S71fxkOG4aYenwSwwgNSj6HgC7fbpv9QnlTECeG3XZrm9Npt6
	7+MQR1KS0ynp9HE4q4OHOVSJ4XUwqnZ2BwmL3jf/c2TbucQpCxAY+Gcc0srrWM5bSch
	BGUxtBq/TkIkSP4qUROqZX+ZUnNZi2cfcEXNWZvw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384584;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GITE2+DF35gDIM9b9g6BM3Xyc7oI8BEXK9+WKc6hSFE=;
	b=O9+GyqDXjkkkomGCpGOcEF5+WrlKbHxevVZFk/hyvGRIXwGw1xSN7Tjis8IvbdLP
	TqOO2fL/SDbwTuJlrem74LXA7q3Z2sBBpBeNA5HZeYjUyLNUTojtrstWNLNv52bfDtk
	3IJm2ngqDIcPTDWx9Wxnt1qIqgCgnwDVtLNW87Rs=
Content-Type: multipart/mixed; boundary="===============4400452680332888326=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.22.2 SUCCEEDED
Message-ID: <0101019a564e9dac-dd717e22-204e-4022-8635-8411951ed5d5-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225828

--===============4400452680332888326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-docutils* to *0.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.22-0.22.2.patch
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
From 84f0c22ce07191653c1b893d2f67bea3472b3848 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 16:56:36 +0000
Subject: [PATCH] python3-docutils: upgrade 0.22 -> 0.22.2

---
 .../{python3-docutils_0.22.bb => python3-docutils_0.22.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.22.bb => python3-docutils_0.22.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.bb b/meta/recipes-devtools/python/python3-docutils_0.22.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-docutils_0.22.bb
rename to meta/recipes-devtools/python/python3-docutils_0.22.2.bb
index 2dafa034fb..014cda556a 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.22.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.22.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
 
-SRC_URI[sha256sum] = "ba9d57750e92331ebe7c08a1bbf7a7f8143b86c476acd51528b042216a6aad0f"
+SRC_URI[sha256sum] = "9fdb771707c8784c8f2728b67cb2c691305933d68137ef95a75db5f4dfbc213d"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============4400452680332888326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/COPYING.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/licenses was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/licenses/BSD-0-Clause.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/licenses/BSD-2-Clause.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/licenses/gpl-3-0.txt was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/COPYING.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/BSD-0-Clause.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/BSD-2-Clause.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/gpl-3-0.txt was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/WHEEL was removed

--===============4400452680332888326==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.22-0.22.2.patch"

RnJvbSA4NGYwYzIyY2UwNzE5MTY1M2MxYjg5M2QyZjY3YmVhMzQ3MmIzODQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNjo1NjozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZG9jdXRpbHM6IHVwZ3JhZGUgMC4yMiAtPiAwLjIyLjIKCi0tLQogLi4uL3tweXRob24z
LWRvY3V0aWxzXzAuMjIuYmIgPT4gcHl0aG9uMy1kb2N1dGlsc18wLjIyLjIuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kb2N1dGlsc18wLjIyLmJiID0+
IHB5dGhvbjMtZG9jdXRpbHNfMC4yMi4yLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2N1dGlsc18wLjIyLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjIuMi5iYgpzaW1pbGFyaXR5
IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZG9jdXRpbHNfMC4yMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWRvY3V0aWxzXzAuMjIuMi5iYgppbmRleCAyZGFmYTAzNGZiLi4wMTRjZGE1NTZh
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRp
bHNfMC4yMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9j
dXRpbHNfMC4yMi4yLmJiCkBAIC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIK
IExJQ0VOU0UgPSAiQ0MwLTEuMCAmIEJTRC0yLUNsYXVzZSAmIEdQTC0zLjAtb25seSIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcucnN0O21kNT1jZTQ2N2IwNGIzNWM3YWMzNDI5
YjY5MDhmYzhiMzE4ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJhOWQ1Nzc1MGU5MjMzMWVi
ZTdjMDhhMWJiZjdhN2Y4MTQzYjg2YzQ3NmFjZDUxNTI4YjA0MjIxNmE2YWFkMGYiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiOWZkYjc3MTcwN2M4Nzg0YzhmMjcyOGI2N2NiMmM2OTEzMDU5MzNkNjgx
MzdlZjk1YTc1ZGI1ZjRkZmJjMjEzZCIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0X2NvcmUK
IAotLSAKMi40Ny4xCgo=

--===============4400452680332888326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-docutils: PV changed from "0.22" to "0.22.2"
packages/x86-64-v3-poky-linux/python3-docutils: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.22.tar.gz;downloadfilename=docutils-0.22.tar.gz" to "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.22.2.tar.gz;downloadfilename=docutils-0.22.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-docutils: PKGV changed from 0.22 [default] to 0.22.2 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PV changed from "0.22" to "0.22.2"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PKGV changed from 0.22 [default] to 0.22.2 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PV changed from "0.22" to "0.22.2"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PKGV changed from 0.22 [default] to 0.22.2 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PV changed from "0.22" to "0.22.2"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PKGV changed from 0.22 [default] to 0.22.2 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PV changed from "0.22" to "0.22.2"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PKGV changed from 0.22 [default] to 0.22.2 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PV changed from "0.22" to "0.22.2"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PKGV changed from 0.22 [default] to 0.22.2 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PV changed from "0.22" to "0.22.2"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PKGV changed from 0.22 [default] to 0.22.2 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGSIZE changed from 4227190 to 4242761 (+0%)
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PV changed from "0.22" to "0.22.2"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGV changed from 0.22 [default] to 0.22.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/COPYING.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/licenses was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/licenses/BSD-0-Clause.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/licenses/BSD-2-Clause.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/licenses/licenses/gpl-3-0.txt was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/docutils-0.22.2.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/COPYING.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/BSD-0-Clause.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/BSD-2-Clause.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/gpl-3-0.txt was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/WHEEL was removed

--===============4400452680332888326==--

