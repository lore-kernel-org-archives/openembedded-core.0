Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8EDC2FC0E
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5942.1689456454751240927
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N8N8Q80R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73a999-072c004d-6964-46eb-acde-b975b8bce92f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9kYEuk8lW0qGCq0X5wOcVWFA+/pCszpIKgHVrJfti80=;
	b=N8N8Q80Rz36N2W0MPrb+DyrQv54ZgL+UDiRYKmdk6QFwfs6XQRi7DphHVvoBvNBZ
	9g0e5BDr2i7Bw1ikGR9nUFo5pSHEpEPr0cU8Z2hue6VGmibG60HpHXUMWE9qyfnAV3S
	OORY2OY5oizcus1oTcb6ThJrvc5zRC0WxOVdpEJs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9kYEuk8lW0qGCq0X5wOcVWFA+/pCszpIKgHVrJfti80=;
	b=IctvaFCVmG0yf3LU9g6DNP5827xZqny7R8javCSUIwiGhpu0SmSPYzbr1V9sVlHB
	wxJfr48X2fPunvRJo0IELx7b32LKtscEdXQNXzKUg39nXJCw8o++76/d6AlsVOFCp8c
	zANviRRLMYQdfbvmaIPyRrVTmfR+nW5rHRqRro6o=
Content-Type: multipart/mixed; boundary="===============8572080265604308086=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-editables: upgrading to 0.4 SUCCEEDED
Message-ID: <010101895b73a999-072c004d-6964-46eb-acde-b975b8bce92f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184338

--===============8572080265604308086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-editables* to *0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-editables-upgrade-0.3-0.4.patch
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
From f70d7b997a6c2952b7d5a41199ede86a6dd1d7a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 12:04:09 +0000
Subject: [PATCH] python3-editables: upgrade 0.3 -> 0.4

---
 .../{python3-editables_0.3.bb => python3-editables_0.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-editables_0.3.bb => python3-editables_0.4.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-editables_0.3.bb b/meta/recipes-devtools/python/python3-editables_0.4.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-editables_0.3.bb
rename to meta/recipes-devtools/python/python3-editables_0.4.bb
index b42ff06872..4987b02f0b 100644
--- a/meta/recipes-devtools/python/python3-editables_0.3.bb
+++ b/meta/recipes-devtools/python/python3-editables_0.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41bc1be47b7bb8240db3ef928c7cb0bf"
 
-SRC_URI[sha256sum] = "167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16161b1a"
+SRC_URI[sha256sum] = "dc322c42e7ccaf19600874035a4573898d88aadd07e177c239298135b75da772"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


--===============8572080265604308086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-editables: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/python3-editables: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/python3-editables: SRC_URI changed from "https://files.pythonhosted.org/packages/source/e/editables/editables-0.3.tar.gz;downloadfilename=editables-0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/e/editables/editables-0.4.tar.gz;downloadfilename=editables-0.4.tar.gz"
packages/core2-32-poky-linux/python3-editables/python3-editables-dbg: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/python3-editables/python3-editables-dbg: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/python3-editables/python3-editables-dev: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/python3-editables/python3-editables-dev: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/python3-editables/python3-editables-doc: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/python3-editables/python3-editables-doc: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/python3-editables/python3-editables-locale: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/python3-editables/python3-editables-locale: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/python3-editables/python3-editables-src: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/python3-editables/python3-editables-src: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/python3-editables/python3-editables-staticdev: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/python3-editables/python3-editables-staticdev: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/python3-editables/python3-editables: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/python3-editables/python3-editables: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/python3-editables/python3-editables: FILELIST: removed "/usr/lib/python3.11/site-packages/editables-0.3.dist-info/METADATA /usr/lib/python3.11/site-packages/editables-0.3.dist-info/RECORD /usr/lib/python3.11/site-packages/editables-0.3.dist-info/top_level.txt /usr/lib/python3.11/site-packages/editables-0.3.dist-info/WHEEL /usr/lib/python3.11/site-packages/editables-0.3.dist-info/LICENSE.txt", added "/usr/lib/python3.11/site-packages/editables-0.4.dist-info/WHEEL /usr/lib/python3.11/site-packages/editables-0.4.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/editables-0.4.dist-info/RECORD /usr/lib/python3.11/site-packages/editables-0.4.dist-info/METADATA"
packages/core2-32-poky-linux/python3-editables/python3-editables: PKGSIZE changed from 14946 to 18586 (+24%)
Changes to packages/core2-32-poky-linux/python3-editables (sysroot):
  /usr/lib/python3.11/site-packages/editables-0.3.dist-info moved to /usr/lib/python3.11/site-packages/editables-0.4.dist-info
  /usr/lib/python3.11/site-packages/editables-0.3.dist-info/top_level.txt was removed

--===============8572080265604308086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-editables/python3-editables: FILELIST: removed "/usr/lib/python3.11/site-packages/editables-0.3.dist-info/WHEEL /usr/lib/python3.11/site-packages/editables-0.3.dist-info/top_level.txt /usr/lib/python3.11/site-packages/editables-0.3.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/editables-0.3.dist-info/RECORD /usr/lib/python3.11/site-packages/editables-0.3.dist-info/METADATA", added "/usr/lib/python3.11/site-packages/editables-0.4.dist-info/METADATA /usr/lib/python3.11/site-packages/editables-0.4.dist-info/WHEEL /usr/lib/python3.11/site-packages/editables-0.4.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/editables-0.4.dist-info/RECORD"
packages/core2-32-poky-linux/python3-editables/python3-editables: PKGSIZE changed from 14946 to 18586 (+24%)
Changes to packages/core2-32-poky-linux/python3-editables (sysroot):
  /usr/lib/python3.11/site-packages/editables-0.3.dist-info moved to /usr/lib/python3.11/site-packages/editables-0.4.dist-info
  /usr/lib/python3.11/site-packages/editables-0.3.dist-info/top_level.txt was removed

--===============8572080265604308086==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-editables-upgrade-0.3-0.4.patch"

RnJvbSBmNzBkN2I5OTdhNmMyOTUyYjdkNWE0MTE5OWVkZTg2YTZkZDFkN2E2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTI6MDQ6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWVkaXRhYmxlczogdXBncmFkZSAwLjMgLT4gMC40CgotLS0KIC4uLi97cHl0aG9uMy1l
ZGl0YWJsZXNfMC4zLmJiID0+IHB5dGhvbjMtZWRpdGFibGVzXzAuNC5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZWRpdGFibGVzXzAuMy5iYiA9PiBw
eXRob24zLWVkaXRhYmxlc18wLjQuYmJ9ICg3NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWVkaXRhYmxlc18wLjMuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZWRpdGFibGVzXzAuNC5iYgpzaW1pbGFyaXR5IGluZGV4
IDc3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZWRp
dGFibGVzXzAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWVkaXRhYmxlc18wLjQuYmIKaW5kZXggYjQyZmYwNjg3Mi4uNDk4N2IwMmYwYiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWVkaXRhYmxlc18wLjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWVkaXRhYmxlc18w
LjQuYmIKQEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9
ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NDFiYzFi
ZTQ3YjdiYjgyNDBkYjNlZjkyOGM3Y2IwYmYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxNjc1
MjRlMzc3MzU4ZWQxZjEzNzRlNjFjMjY4ZjBkN2E0YmY3ZGJkMDQ2YzY1NmY3YjQxMGNkZTE2MTYx
YjFhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRjMzIyYzQyZTdjY2FmMTk2MDA4NzQwMzVhNDU3
Mzg5OGQ4OGFhZGQwN2UxNzdjMjM5Mjk4MTM1Yjc1ZGE3NzIiCiAKIGluaGVyaXQgcHlwaSBweXRo
b25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLS0gCjIuMzkuMgoK

--===============8572080265604308086==--

