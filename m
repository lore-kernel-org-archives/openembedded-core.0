Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822F7C624CF
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 05:53:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1378.1788241992093522700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 22:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jGjSEpL1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i+JpS12n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a05b8754aa-0686514c-284d-4627-a443-1f69d0fd0f1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788241991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5mZ7PgqOjCrXCrtx+mXYj7RSLNalVBovYtga/K7tQKk=;
	b=jGjSEpL12yx3Rse4l3Ol6kBsQeefkvEHexDTWTacR8EabdWbdZTdP9FSBI3AszcD
	J0Ifoqq8DUICQmioIJ+w0SKvCufk0hNc5c42UtRuJbUbNflDsMsLaIjFk2OywvcsZ73
	sx2KV5KNV4dNvv5ZkM8AiDbYmEbMsUOgHDuFN4Vk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788241991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5mZ7PgqOjCrXCrtx+mXYj7RSLNalVBovYtga/K7tQKk=;
	b=i+JpS12nzIpp58P5JnmTEnoD9QaxLyPre/3y03XxfaCeO/25SEgU0rmFZ7PwQlG0
	cgSEu47SPgNcDAngZCcIRSwmWeVqApt9wP+Lz+Ll8sRL8NtbZX0AEdIXRCgZ6vLCr98
	DRA2aTjfpNLTXqmaHFMasJRJRa567V/2tptVVJLw=
Content-Type: multipart/mixed; boundary="===============8091158721142916412=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-shacl2code: upgrading to 1.3.2 SUCCEEDED
Message-ID: <010101a05b8754aa-0686514c-284d-4627-a443-1f69d0fd0f1b-000000@us-west-2.amazonses.com>
Date: Tue, 1 Sep 2026 05:53:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244790

--===============8091158721142916412==
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
From 4c37a2199ccf9ffcc6841262325738117ee09b90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Sep 2026 05:33:39 +0000
Subject: [PATCH] python3-shacl2code: upgrade 1.1.0 -> 1.3.2

---
 ...{python3-shacl2code_1.1.0.bb => python3-shacl2code_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_1.1.0.bb => python3-shacl2code_1.3.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb b/meta/recipes-devtools/python/python3-shacl2code_1.3.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.3.2.bb
index a9c8bec84f..f43f49f1f0 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "0f3a243c6482a0f95c5a793288d304908506b51b82dc6133de22be477cd75c24"
+SRC_URI[sha256sum] = "2dd0b7a4fd50958d0783764da6ca9ede1805ccdd22b6bed3afbf89136e8962be"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============8091158721142916412==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-shacl2code-upgrade-1.1.0-1.3.2.patch"

RnJvbSA0YzM3YTIxOTljY2Y5ZmZjYzY4NDEyNjIzMjU3MzgxMTdlZTA5YjkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBTZXAgMjAyNiAwNTozMzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2hhY2wyY29kZTogdXBncmFkZSAxLjEuMCAtPiAxLjMuMgoKLS0tCiAuLi57cHl0aG9u
My1zaGFjbDJjb2RlXzEuMS4wLmJiID0+IHB5dGhvbjMtc2hhY2wyY29kZV8xLjMuMi5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNoYWNsMmNvZGVfMS4xLjAu
YmIgPT4gcHl0aG9uMy1zaGFjbDJjb2RlXzEuMy4yLmJifSAoODElKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMS4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMS4zLjIuYmIK
c2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXNoYWNsMmNvZGVfMS4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMy4yLmJiCmluZGV4IGE5YzhiZWM4
NGYuLmY0M2Y0OWYxZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zaGFjbDJjb2RlXzEuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zaGFjbDJjb2RlXzEuMy4yLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA1ODJmMzU4
NjI4ZjI5OWYyOWMyM2JmNWZiMmY3M2M5IgogCiBQWVBJX1BBQ0tBR0UgPSAic2hhY2wyY29kZSIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwZjNhMjQzYzY0ODJhMGY5NWM1YTc5MzI4OGQzMDQ5MDg1
MDZiNTFiODJkYzYxMzNkZTIyYmU0NzdjZDc1YzI0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJk
ZDBiN2E0ZmQ1MDk1OGQwNzgzNzY0ZGE2Y2E5ZWRlMTgwNWNjZGQyMmI2YmVkM2FmYmY4OTEzNmU4
OTYyYmUiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDcuMQoK

--===============8091158721142916412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code: PV changed from "1.1.0" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-shacl2code: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-shacl2code: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.1.0.tar.gz;downloadfilename=shacl2code-1.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/shacl2code/shacl2code-1.3.2.tar.gz;downloadfilename=shacl2code-1.3.2.tar.gz"
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
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info, added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGSIZE changed from 1610517 to 1735219 (+8%)
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info
  /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 was added

--===============8091158721142916412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info, added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2"
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info
  /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 was added

--===============8091158721142916412==--

