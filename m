Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2857510FCADE
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14656.1775054163475985309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tjhrDgY4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nf23glEf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d497914aa-5c08cc88-7cd9-4468-8e8b-55bef48dfd50-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ndJJE/8l220gyyiv0rHdJOkYJ7opoSRlfsedb49Yfgg=;
	b=tjhrDgY4uDGOA+yaw4mlbye0YzIXykzfSxWg+9pvRUPjOUvLbXR/r4iVEgvG3ziT
	si6HBrnwwIC/Jb69u3xYA5n4Q4CpU2FlsWNpgPDCuJ1seOlXBELydXI8K5vyZNVcEr7
	UOyd0XYIfDfLQdgo5IVVr3CupFuMBLzjqkzeCkEo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ndJJE/8l220gyyiv0rHdJOkYJ7opoSRlfsedb49Yfgg=;
	b=nf23glEfqQclcrrDrlQbQnIDkmmmQcxgKCXaKxCioFjQV9DBR1JR9DHx6FKhOPSD
	/tlrmn/nQdHe3LRLfUeq162wFC7vGIHzAUmfXaKchrtz+tOCEBJgzW/wswd/0MebgOr
	CRG0CNbD2OEOkV5LZVrEzBKpsra8hsakhcmhx7KI=
Content-Type: multipart/mixed; boundary="===============8458856912388246227=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-shacl2code: upgrading to 1.0.0 SUCCEEDED
Message-ID: <0101019d497914aa-5c08cc88-7cd9-4468-8e8b-55bef48dfd50-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234391

--===============8458856912388246227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-shacl2code* to *1.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-shacl2code-upgrade-0.0.24-1.0.0.patch
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
From b04a08cec88e3191fd46543a25bbe5259d2a1ed8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:34:39 +0000
Subject: [PATCH] python3-shacl2code: upgrade 0.0.24 -> 1.0.0

---
 ...python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb b/meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
index 93ed9a2530..49416b3a04 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "d8b511054ca564b4514b9186ece7f5eb8048cfc5daa6625def1a3adba13c4f66"
+SRC_URI[sha256sum] = "1f9d5cb786bf98d3a7de92218fe5e546143d6aa2aa134098200b06022629d005"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============8458856912388246227==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-shacl2code-upgrade-0.0.24-1.0.0.patch"

RnJvbSBiMDRhMDhjZWM4OGUzMTkxZmQ0NjU0M2EyNWJiZTUyNTlkMmExZWQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDozNDozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2hhY2wyY29kZTogdXBncmFkZSAwLjAuMjQgLT4gMS4wLjAKCi0tLQogLi4ucHl0aG9u
My1zaGFjbDJjb2RlXzAuMC4yNC5iYiA9PiBweXRob24zLXNoYWNsMmNvZGVfMS4wLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zaGFjbDJjb2RlXzAuMC4y
NC5iYiA9PiBweXRob24zLXNoYWNsMmNvZGVfMS4wLjAuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMC4wLjI0LmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMS4wLjAu
YmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMC4wLjI0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8xLjAuMC5iYgppbmRleCA5M2Vk
OWEyNTMwLi40OTQxNmIzYTA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8wLjAuMjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMS4wLjAuYmIKQEAgLTUsNyArNSw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDU4
MmYzNTg2MjhmMjk5ZjI5YzIzYmY1ZmIyZjczYzkiCiAKIFBZUElfUEFDS0FHRSA9ICJzaGFjbDJj
b2RlIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ4YjUxMTA1NGNhNTY0YjQ1MTRiOTE4NmVjZTdm
NWViODA0OGNmYzVkYWE2NjI1ZGVmMWEzYWRiYTEzYzRmNjYiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMWY5ZDVjYjc4NmJmOThkM2E3ZGU5MjIxOGZlNWU1NDYxNDNkNmFhMmFhMTM0MDk4MjAwYjA2
MDIyNjI5ZDAwNSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Ny4x
Cgo=

--===============8458856912388246227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2", added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/stub.pyi.j2"
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/stub.pyi.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2 was removed

--===============8458856912388246227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-0.0.24.tar.gz;downloadfilename=shacl2code-0.0.24.tar.gz" to "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.0.0.tar.gz;downloadfilename=shacl2code-1.0.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-shacl2code: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PV changed from "0.0.24" to "1.0.0"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGV changed from 0.0.24 [default] to 1.0.0 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info, removed "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2", added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/stub.pyi.j2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGSIZE changed from 1546856 to 1594868 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/shacl2code-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/cmd.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__init__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/__main__.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/model.py.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/stub.pyi.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/shacl2code-0.0.24.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python.j2 was removed

--===============8458856912388246227==--

