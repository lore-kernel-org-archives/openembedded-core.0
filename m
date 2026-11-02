Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6418.1793597020683384797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 21:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I3ARaZj5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xw/GwagH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a19ab695de-2866ec8a-6e78-4faa-8260-49a2de2d934e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793597019;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2Zj13objAmD1MpjdPGu5gjicRxxfuxeY0YXK1eTuFnU=;
	b=I3ARaZj5/IJsIXxRdpnNrWFxS4udmvYYJLS4N+37jaCzV+H5jDjN+K5W2eTnpd2e
	lRFZak8jkKPORM1Y+5vxHc1cRUT9KInJ3I+THbX/robGgg7VCa0hrCbCSMON90HkD8C
	AFjUo4yThZyj+MoJ6DI6PFpwsWEeAIzR4mhxRTpo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793597019;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2Zj13objAmD1MpjdPGu5gjicRxxfuxeY0YXK1eTuFnU=;
	b=xw/GwagHdKm8eyiJfoNf68HNVcHpRKWQDLU3BtPMbmNzHARdjrdNIRxM+26RS8XT
	leNYnMIMnzlz/pwcRjiG/kXUX/3jcrfNhJJx78ymFQnxb5XDU56Za/27u5mz3Kxu+3g
	exDVzFooSI4A7iEENik9pegIY4v5r9ZWabLf54qU=
Content-Type: multipart/mixed; boundary="===============2276730060902879777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-shacl2code: upgrading to 1.3.2 SUCCEEDED
Message-ID: <010101a19ab695de-2866ec8a-6e78-4faa-8260-49a2de2d934e-000000@us-west-2.amazonses.com>
Date: Mon, 2 Nov 2026 05:23:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 05:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249178

--===============2276730060902879777==
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
From 352d31e517f0e6c669f0512c4049c629add96e2f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 2 Nov 2026 05:17:22 +0000
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


--===============2276730060902879777==
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
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGSIZE changed from 1610517 to 1735219 (+8%)
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info, added "/usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2"
packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: PKGV changed from 1.1.0 [default] to 1.3.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info
  /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 was added

--===============2276730060902879777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-shacl2code-upgrade-1.1.0-1.3.2.patch"

RnJvbSAzNTJkMzFlNTE3ZjBlNmM2NjlmMDUxMmM0MDQ5YzYyOWFkZDk2ZTJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMiBOb3YgMjAyNiAwNToxNzoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============2276730060902879777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-shacl2code/python3-shacl2code: FILELIST: directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info/licenses, added "/usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2"
Changes to packages/x86-64-v3-poky-linux/python3-shacl2code (sysroot):
  /usr/lib/python3.14/site-packages/shacl2code-1.1.0.dist-info moved to /usr/lib/python3.14/site-packages/shacl2code-1.3.2.dist-info
  /usr/lib/python3.14/site-packages/shacl2code/lang/__pycache__/rust.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/rust.py was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/python/_macros.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/Cargo.toml.j2 was added
  /usr/lib/python3.14/site-packages/shacl2code/lang/templates/rust/lib.rs.j2 was added

--===============2276730060902879777==--
