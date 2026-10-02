Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1A6CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 06:00:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5245.1790920846112337474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 23:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sq6szDzH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q1lH0S6g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0fb33670c-49101f0e-0a3d-49fa-9a7c-cb5249682840-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790920845;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AZ249lWAKCgcNDwDJ6p3MH3s1Pj+7vPJWVTf98YgXQs=;
	b=sq6szDzHnDdxgjTorICSt09fvSa0HCl2aot4ohdHiCkI4arLhbVTSy1Mnly8Ee6n
	iLpWaLdufUIRvzV0/UYTknPtTENTYslbLPzGQh5U4H2a2Hy4YL4Ap06yhQ8mHY9QZil
	XnvVgfUy5pdZXALzKL8epCwqIC/5Q9COg6pqSxe8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790920845;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AZ249lWAKCgcNDwDJ6p3MH3s1Pj+7vPJWVTf98YgXQs=;
	b=q1lH0S6gVbj2yxhYPRbKrdrXsg0gnFNbB6UbA/kA0sZ4YVi1+/vMlxzn182Dyzbj
	LSgc8eYUcTw8u24dER7RSX/lhj1wNocbDbdMmUgh2CbZX5yuSC7m0GF1RpbE6qyTFFg
	AnHWx+pYgU93wPUtAh3/hEO0laWCr9jIoaR4pGVc=
Content-Type: multipart/mixed; boundary="===============7166817996799246351=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-shacl2code: upgrading to 1.3.2 SUCCEEDED
Message-ID: <010101a0fb33670c-49101f0e-0a3d-49fa-9a7c-cb5249682840-000000@us-west-2.amazonses.com>
Date: Fri, 2 Oct 2026 06:00:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 06:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247063

--===============7166817996799246351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-shacl2code* to *1.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-shacl2code-upgrade-1.1.0-1.3.2.patch
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
From b94503f70473c41dda5077a52776dde37cca843c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 2 Oct 2026 05:46:34 +0000
Subject: [PATCH] python3-shacl2code: upgrade 1.1.0 -> 1.3.2

---
 ...{python3-shacl2code_1.1.0.bb => python3-shacl2code_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_1.1.0.bb => python3-shacl2code_1.3.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb b/meta/recipes-devtools/python/python3-shacl2code_1.3.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.3.2.bb
index dc98e445e0..4cc8470be7 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.3.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
-SRC_URI[sha256sum] = "0f3a243c6482a0f95c5a793288d304908506b51b82dc6133de22be477cd75c24"
+SRC_URI[sha256sum] = "2dd0b7a4fd50958d0783764da6ca9ede1805ccdd22b6bed3afbf89136e8962be"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============7166817996799246351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code: PV changed from "1.1.0" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-shacl2code: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.3.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PV changed from "1.1.0" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dbg: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PV changed from "1.1.0" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-dev: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PV changed from "1.1.0" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-doc: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PV changed from "1.1.0" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-locale: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PV changed from "1.1.0" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-src: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PV changed from "1.1.0" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code-staticdev: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PV changed from "1.1.0" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info, added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGSIZE changed from 1610517 to 1735219 (+8%)
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info
  /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 was added

--===============7166817996799246351==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-shacl2code-upgrade-1.1.0-1.3.2.patch"

RnJvbSBiOTQ1MDNmNzA0NzNjNDFkZGE1MDc3YTUyNzc2ZGRlMzdjY2E4NDNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBPY3QgMjAyNiAwNTo0NjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2hhY2wyY29kZTogdXBncmFkZSAxLjEuMCAtPiAxLjMuMgoKLS0tCiAuLi57cHl0aG9u
My1zaGFjbDJjb2RlXzEuMS4wLmJiID0+IHB5dGhvbjMtc2hhY2wyY29kZV8xLjMuMi5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNoYWNsMmNvZGVfMS4xLjAu
YmIgPT4gcHl0aG9uMy1zaGFjbDJjb2RlXzEuMy4yLmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMS4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMS4zLjIuYmIK
c2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMS4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMy4yLmJiCmluZGV4IGRjOThlNDQ1
ZTAuLjRjYzg0NzBiZTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zaGFjbDJjb2RlXzEuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMy4yLmJiCkBAIC00LDcgKzQsNyBAQCBTRUNUSU9O
ID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9MDU4MmYzNTg2MjhmMjk5ZjI5YzIzYmY1ZmIyZjczYzkiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIwZjNhMjQzYzY0ODJhMGY5NWM1YTc5MzI4OGQzMDQ5MDg1MDZi
NTFiODJkYzYxMzNkZTIyYmU0NzdjZDc1YzI0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJkZDBi
N2E0ZmQ1MDk1OGQwNzgzNzY0ZGE2Y2E5ZWRlMTgwNWNjZGQyMmI2YmVkM2FmYmY4OTEzNmU4OTYy
YmUiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDcuMQoK

--===============7166817996799246351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info/licenses, added "/usr/lib/python3.14/site-packages/shacl2code/lang/rust.py /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info
  /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 was added

--===============7166817996799246351==--

