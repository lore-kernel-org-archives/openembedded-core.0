Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4258FC48296
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:08:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2551.1706810901767458764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cdOEF9d5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YdTp1u9K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65db810f-6dba7ac3-5043-4554-a7d9-cdf86023f938-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810900;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3DIcJ7uPa6GQD3wZIKIJrX7y8cEmO6T7xdR6r7KUOBE=;
	b=cdOEF9d5X9PkYqaIxk5C5OA4oWJjyiA1kHFH9pdSbbQI7YVUDpYV1DmwyvuFOArL
	WuFRG++qSkxq7M//lDMFvLOiDrDYZiCP9qKXDj+r8ubkfgMBjfE0iWqpMahBp2+Zb6V
	5DNHs2l/UjLSVHw3DNd8lmK1AlReG02XxUN8OQwo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810900;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3DIcJ7uPa6GQD3wZIKIJrX7y8cEmO6T7xdR6r7KUOBE=;
	b=YdTp1u9K109wkK9Jemkx4bFIuZ50zXlPdQvkHCCc56aaBqprv/EpV8V4BEklcDKQ
	z1zQM7z24xN9ssJZ/e0FFxk2yTnG7tPUrDctDe73kcRFJwpILn1rBYJKe2UxY9w0Yrk
	CZeBQ9IjlSGNzPVJ/jQvTzJUgBQmjES0+nyFgsXA=
Content-Type: multipart/mixed; boundary="===============3585493277316937262=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 255 SUCCEEDED
Message-ID: <0101018d65db810f-6dba7ac3-5043-4554-a7d9-cdf86023f938-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:08:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194730

--===============3585493277316937262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *255* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-253-255.patch
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
From 2e4cba68644d142a62a1c7f34c4f23e3a5d53ffb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 17:30:46 +0000
Subject: [PATCH] diffoscope: upgrade 253 -> 255

---
 .../diffoscope/{diffoscope_253.bb => diffoscope_255.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_253.bb => diffoscope_255.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_253.bb b/meta/recipes-support/diffoscope/diffoscope_255.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_253.bb
rename to meta/recipes-support/diffoscope/diffoscope_255.bb
index a1fc63efc3..72edeb316a 100644
--- a/meta/recipes-support/diffoscope/diffoscope_253.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_255.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ca3d826b691f4998d6de28a016b3555d56a7283b97ad92944ce643ea6e7eb614"
+SRC_URI[sha256sum] = "db03f02c9c2c178207dba9d2f9e8be25daf11770e7a87be008ff58a8adb7cd9e"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.42.0


--===============3585493277316937262==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-253-255.patch"

RnJvbSAyZTRjYmE2ODY0NGQxNDJhNjJhMWM3ZjM0YzRmMjNlM2E1ZDUzZmZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNzozMDo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjUzIC0+IDI1NQoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yNTMuYmIgPT4gZGlmZm9zY29wZV8yNTUuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI1My5iYiA9PiBkaWZmb3Njb3BlXzI1
NS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjUzLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI1NS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjUzLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjU1LmJiCmluZGV4IGExZmM2M2Vm
YzMuLjcyZWRlYjMxNmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI1NS5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjYTNkODI2YjY5MWY0OTk4ZDZkZTI4YTAxNmIzNTU1ZDU2YTcyODNiOTdhZDkyOTQ0Y2U2
NDNlYTZlN2ViNjE0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRiMDNmMDJjOWMyYzE3ODIwN2Ri
YTlkMmY5ZThiZTI1ZGFmMTE3NzBlN2E4N2JlMDA4ZmY1OGE4YWRiN2NkOWUiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDIuMAoK

--===============3585493277316937262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-253.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-255.dist-info, added "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-253.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-255.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py was added

--===============3585493277316937262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1850 targets, 46 skipped, 0 masked, 0 errors.
Removing 114 recipes from the core2-64 sysroot...done.
Removing 126 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============3585493277316937262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 253 [default] to 255 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "253" to "255"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 253 [default] to 255 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "253" to "255"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 253 [default] to 255 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "253" to "255"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 253 [default] to 255 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "253" to "255"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 253 [default] to 255 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "253" to "255"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 253 [default] to 255 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "253" to "255"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 253 [default] to 255 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-253.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-255.dist-info, added "/usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1333244 to 1348333 (+1%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "253" to "255"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 253 [default] to 255 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-253.tar.gz;downloadfilename=diffoscope-253.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-255.tar.gz;downloadfilename=diffoscope-255.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "253" to "255"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-253.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-255.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py was added

--===============3585493277316937262==--

