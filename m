Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0928CD129E
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2305.1711995071961601668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EguOs67C;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JYa0qMId;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e9adbab96-66a911d8-5ace-487d-a94d-31d55b1c290b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HnQIqHeMlQp1VlNbG5y7ZjRCBRbpjgkGzt79Vei3yJA=;
	b=EguOs67CkbWXueasoZsEa4JPqlJhZDLpdYybkM7NxiQywz5PTYQpRwF2VfTFhnXR
	18e9ECXiCihuqM22p3ybPnZEm/Ax8pQKJYVh2qVEmUWsqKsqdKyYN2mo+p1uL0DIb+x
	7BI5gBbIpGt3jeFcivGA/uzWsDx3MnGRd111lbU8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HnQIqHeMlQp1VlNbG5y7ZjRCBRbpjgkGzt79Vei3yJA=;
	b=JYa0qMId+drzaJcWOt0BrJcYU6/9VOZ8DRhDo7ihq8UizX1gev6BXQo2qP1tc4lZ
	3/v2gSvg53tn+dk/mNJxq+M3YOJrtn80dwcY6zSbC3WK5AmgWdd+IlTQ7LkkPTPZ9cU
	qx1BGgvBtTgdZ+PZ7TMidfJuFX8zxU4rYUQxlBdc=
Content-Type: multipart/mixed; boundary="===============5985074568301623210=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 262 SUCCEEDED
Message-ID: <0101018e9adbab96-66a911d8-5ace-487d-a94d-31d55b1c290b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197839

--===============5985074568301623210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *262* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-259-262.patch
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
From ad04780ad6980ebaca98b44640c3361e57a2b71b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 16:50:51 +0000
Subject: [PATCH] diffoscope: upgrade 259 -> 262

---
 .../diffoscope/{diffoscope_259.bb => diffoscope_262.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_259.bb => diffoscope_262.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_259.bb b/meta/recipes-support/diffoscope/diffoscope_262.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_259.bb
rename to meta/recipes-support/diffoscope/diffoscope_262.bb
index eca2c208fc..25bc4c41a0 100644
--- a/meta/recipes-support/diffoscope/diffoscope_259.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_262.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c1f14452467f84c4be804a3725cbfdd5eadf977ece7ad463be8b647d1a87fb42"
+SRC_URI[sha256sum] = "010f0c2ad89f61a8b24f4710953ad2f2ba8c68ac9d05ba6b266929498c8bb06f"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.42.0


--===============5985074568301623210==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-259-262.patch"

RnJvbSBhZDA0NzgwYWQ2OTgwZWJhY2E5OGI0NDY0MGMzMzYxZTU3YTJiNzFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNjo1MDo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjU5IC0+IDI2MgoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yNTkuYmIgPT4gZGlmZm9zY29wZV8yNjIuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI1OS5iYiA9PiBkaWZmb3Njb3BlXzI2
Mi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjU5LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI2Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjU5LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjYyLmJiCmluZGV4IGVjYTJjMjA4
ZmMuLjI1YmM0YzQxYTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNTkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI2Mi5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjMWYxNDQ1MjQ2N2Y4NGM0YmU4MDRhMzcyNWNiZmRkNWVhZGY5NzdlY2U3YWQ0NjNiZThi
NjQ3ZDFhODdmYjQyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAxMGYwYzJhZDg5ZjYxYThiMjRm
NDcxMDk1M2FkMmYyYmE4YzY4YWM5ZDA1YmE2YjI2NjkyOTQ5OGM4YmIwNmYiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDIuMAoK

--===============5985074568301623210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-259.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-262.dist-info, removed "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py", added "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-259.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-262.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py was removed
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc was removed

--===============5985074568301623210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1875 targets, 46 skipped, 0 masked, 0 errors.
Removing 101 recipes from the core2-64 sysroot...done.
Removing 127 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============5985074568301623210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 259 [default] to 262 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "259" to "262"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 259 [default] to 262 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "259" to "262"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 259 [default] to 262 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "259" to "262"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 259 [default] to 262 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "259" to "262"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 259 [default] to 262 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "259" to "262"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 259 [default] to 262 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "259" to "262"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 259 [default] to 262 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "259" to "262"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1350135 to 1351637 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-259.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-262.dist-info, removed "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py", added "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 259 [default] to 262 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "259" to "262"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-259.tar.gz;downloadfilename=diffoscope-259.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-262.tar.gz;downloadfilename=diffoscope-262.tar.gz"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-259.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-262.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py was removed
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc was removed

--===============5985074568301623210==--

