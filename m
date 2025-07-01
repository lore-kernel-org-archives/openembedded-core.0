Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0E4C83F0A
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1433.1751386810735249284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jsMCLY4X;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QexCxKLA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010197c6c9f73c-a55c3de5-7d02-444c-a62e-31951c883547-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386814;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F2Yqypx9jTEEKcQH6shBSbznIO44zUEbsOT/l3HR0dM=;
	b=jsMCLY4XjqJicYT37dpP9pShGREq/UgY+r7E0hUdHvpqorIM46D2nuLsoa5HWwQ4
	02Ew3VspyFDWXZFs1/WCLrolqxMlut/o369EjS5tvLgL+kMcbCK0KZXbs88SPyd+QY2
	O8tU/i0Sc+7YaurzVbFJriWB0UBFMCGF40CvpqZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386814;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F2Yqypx9jTEEKcQH6shBSbznIO44zUEbsOT/l3HR0dM=;
	b=QexCxKLAaLmeCA6af0PdsPrXlcly6Aw8sYn2NChr4e7Kr7WE3KqsUUAGZa3HAxKh
	onrTbTqGiIKUUzi65ggbTTmZuBnGL6UWFYNoD6GKNCQQWho2p2eJHeqGRk9mqyaImEP
	yCklgNZD5f/fRdB3PdPas+M5x6uXURepXDF4sQaE=
Content-Type: multipart/mixed; boundary="===============4952292744676253127=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 6.0.0 SUCCEEDED
Message-ID: <01010197c6c9f73c-a55c3de5-7d02-444c-a62e-31951c883547-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219639

--===============4952292744676253127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-lxml* to *6.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-5.4.0-6.0.0.patch
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
From e35374c4fe98d47017441487e89d3b8b9cd71118 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 09:21:56 +0000
Subject: [PATCH] python3-lxml: upgrade 5.4.0 -> 6.0.0

---
 .../python/{python3-lxml_5.4.0.bb => python3-lxml_6.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.4.0.bb => python3-lxml_6.0.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.4.0.bb b/meta/recipes-devtools/python/python3-lxml_6.0.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.4.0.bb
rename to meta/recipes-devtools/python/python3-lxml_6.0.0.bb
index 126fbe99b4..56f5664c9b 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.4.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "d12832e1dbea4be280b22fd0ea7c9b87f0d8fc51ba06e92dc62d52f804f78ebd"
+SRC_URI[sha256sum] = "032e65120339d44cdc3efc326c9f660f5f7205f3a535c1fdbf898b29ea01fb72"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.47.1


--===============4952292744676253127==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-5.4.0-6.0.0.patch"

RnJvbSBlMzUzNzRjNGZlOThkNDcwMTc0NDE0ODdlODlkM2I4YjljZDcxMTE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwOToyMTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbHhtbDogdXBncmFkZSA1LjQuMCAtPiA2LjAuMAoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLWx4bWxfNS40LjAuYmIgPT4gcHl0aG9uMy1seG1sXzYuMC4wLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWx4bWxfNS40LjAuYmIgPT4gcHl0aG9u
My1seG1sXzYuMC4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1seG1sXzUuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWx4bWxfNi4wLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWx4bWxfNS40LjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4wLmJi
CmluZGV4IDEyNmZiZTk5YjQuLjU2ZjU2NjRjOWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzUuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4wLmJiCkBAIC0xOCw3ICsxOCw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTLnR4dDttZDU9ZTRjMDQ1ZWJhZDk1OGVh
ZDRiNDgwMDhmNzA4Mzg0MDMgXAogCiBERVBFTkRTICs9ICJsaWJ4bWwyIGxpYnhzbHQiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJkMTI4MzJlMWRiZWE0YmUyODBiMjJmZDBlYTdjOWI4N2YwZDhm
YzUxYmEwNmU5MmRjNjJkNTJmODA0Zjc4ZWJkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAzMmU2
NTEyMDMzOWQ0NGNkYzNlZmMzMjZjOWY2NjBmNWY3MjA1ZjNhNTM1YzFmZGJmODk4YjI5ZWEwMWZi
NzIiCiAKIFNSQ19VUkkgKz0gIiR7UFlQSV9TUkNfVVJJfSIKIGluaGVyaXQgcGtnY29uZmlnIHB5
cGkgc2V0dXB0b29sczMKLS0gCjIuNDcuMQoK

--===============4952292744676253127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 17742416 to 21488312 (+21%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 18479867 to 21120119 (+14%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5236123 to 5906582 (+13%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.13/site-packages/lxml-5.4.0.dist-info -> /usr/lib/python3.13/site-packages/lxml-6.0.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/lxml-5.4.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/lxml-6.0.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/lxml/html/__pycache__/_difflib.cpython-313.pyc /usr/lib/python3.13/site-packages/lxml/html/_difflib.cpython-313-x86_64-linux-gnu.so /usr/lib/python3.13/site-packages/lxml/html/_difflib.py"
Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-5.4.0.dist-info moved to /usr/lib/python3.13/site-packages/lxml-6.0.0.dist-info
  /usr/lib/python3.13/site-packages/lxml/html/_difflib.cpython-313-x86_64-linux-gnu.so was added
  /usr/lib/python3.13/site-packages/lxml/html/_difflib.py was added
  /usr/lib/python3.13/site-packages/lxml/html/__pycache__/_difflib.cpython-313.pyc was added

--===============4952292744676253127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.4.0.tar.gz;downloadfilename=lxml-5.4.0.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.4.0.tar.gz;downloadfilename=lxml-5.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.0.tar.gz;downloadfilename=lxml-6.0.0.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.0.tar.gz;downloadfilename=lxml-6.0.0.tar.gz"
packages/core2-64-poky-linux/python3-lxml: PKGV changed from 5.4.0 [default] to 6.0.0 [default]
packages/core2-64-poky-linux/python3-lxml: PV changed from "5.4.0" to "6.0.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 5.4.0 [default] to 6.0.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: FILELIST: added "/usr/lib/python3.13/site-packages/lxml/html/.debug/_difflib.cpython-313-x86_64-linux-gnu.so"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "5.4.0" to "6.0.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 17742416 to 21488312 (+21%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 5.4.0 [default] to 6.0.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "5.4.0" to "6.0.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 5.4.0 [default] to 6.0.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "5.4.0" to "6.0.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 5.4.0 [default] to 6.0.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "5.4.0" to "6.0.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 5.4.0 [default] to 6.0.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: FILELIST: directory renamed /usr/src/debug/python3-lxml/5.4.0/src/lxml -> /usr/src/debug/python3-lxml/6.0.0/src/lxml, directory renamed /usr/src/debug/python3-lxml/5.4.0/src/lxml/includes -> /usr/src/debug/python3-lxml/6.0.0/src/lxml/includes, removed "/usr/src/debug/python3-lxml/5.4.0/src/lxml/html/diff.c", added "/usr/src/debug/python3-lxml/6.0.0/src/lxml/html/_difflib.c /usr/src/debug/python3-lxml/6.0.0/src/lxml/html/diff.c"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PV changed from "5.4.0" to "6.0.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 18479867 to 21120119 (+14%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 5.4.0 [default] to 6.0.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "5.4.0" to "6.0.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGV changed from 5.4.0 [default] to 6.0.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.13/site-packages/lxml-5.4.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/lxml-6.0.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/lxml-5.4.0.dist-info -> /usr/lib/python3.13/site-packages/lxml-6.0.0.dist-info, added "/usr/lib/python3.13/site-packages/lxml/html/__pycache__/_difflib.cpython-313.pyc /usr/lib/python3.13/site-packages/lxml/html/_difflib.cpython-313-x86_64-linux-gnu.so /usr/lib/python3.13/site-packages/lxml/html/_difflib.py"
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PV changed from "5.4.0" to "6.0.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5236123 to 5906582 (+13%)
Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.13/site-packages/lxml-5.4.0.dist-info moved to /usr/lib/python3.13/site-packages/lxml-6.0.0.dist-info
  /usr/lib/python3.13/site-packages/lxml/html/_difflib.cpython-313-x86_64-linux-gnu.so was added
  /usr/lib/python3.13/site-packages/lxml/html/_difflib.py was added
  /usr/lib/python3.13/site-packages/lxml/html/__pycache__/_difflib.cpython-313.pyc was added

--===============4952292744676253127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1918 targets, 50 skipped, 0 masked, 0 errors.
Removing 22 recipes from the core2-64 sysroot...done.
Removing 56 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-bb1641d231c6604e5fbd79cc0aa38ef42b82047d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bb1641d231c6604e5fbd79cc0aa38ef42b82047d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 438 Local 424 Mirrors 0 Missed 14 Current 229 (96% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 244 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 256 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 257 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 258 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 259 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 269 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 282 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 290 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_package_qa_setscene)
NOTE: Running setscene task 291 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 293 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 306 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-lxml-6.0.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_package_qa_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_package_qa_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 317 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 707 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_recipe_qa)
NOTE: recipe libxml2-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 321 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_recipe_qa: Started
NOTE: recipe libxslt-1.1.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 333 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 335 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 336 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 356 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxslt-1.1.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxml2/2.14.3/temp/log.do_packagedata_setscene.2346713
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 383 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_package_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running task 825 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_fetch)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_fetch: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 859 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 419 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running task 861 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running task 872 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 873 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.14.3-r0: task do_package_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 920 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running task 931 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 944 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 945 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 946 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_check_backend)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running setscene task 482 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe python3-lxml-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_check_backend: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 496 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_check_backend: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 968 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 984 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 556 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 572 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 612 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 613 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 625 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1229 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 627 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1299 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 667 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1671 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata)
NOTE: Running task 1720 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Load average limiting set to True as load average: 1.5569915771484375 - using 2/16 bitbake threads
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1754 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_configure)
NOTE: recipe python3-lxml-6.0.0-r0: task do_configure: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1755 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_compile)
NOTE: recipe python3-lxml-6.0.0-r0: task do_compile: Started
NOTE: Load average limiting set to False as load average: 1.4768218994140625 - using 1/16 bitbake threads
NOTE: Running task 1861 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-lxml-6.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1874 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_install)
NOTE: recipe python3-lxml-6.0.0-r0: task do_install: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1875 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_package)
NOTE: Running task 1876 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-lxml-6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_package: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1877 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_packagedata)
NOTE: recipe python3-lxml-6.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1878 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_create_spdx)
NOTE: Running task 1879 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_package_write_ipk)
NOTE: Running task 1880 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_package_write_deb)
NOTE: Running task 1881 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_package_write_rpm)
NOTE: Running task 1882 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_package_qa)
NOTE: recipe python3-lxml-6.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1883 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_create_package_spdx)
NOTE: recipe python3-lxml-6.0.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-lxml-6.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-lxml-6.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1884 of 1884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-lxml_6.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1884 tasks of which 1853 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4952292744676253127==--

