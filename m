Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0679C54ECA
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.36635.1709330717123459758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZOngDOKz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WjOSmitd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dfc0cdb13-ed42a35e-b08d-4a94-9140-3eb90f5da817-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DoIF3I+AxBW8u9FcaRctl+lajBmeN77fTEWJr9fhVRM=;
	b=ZOngDOKzSS3zYiopqoslqC/1Bt3BSBLj0emcv501QmIxLoCAskECDzQsIPnddjV/
	i3Wh+ZtMSf1edZCXa46WQ4TS3Y94HpuWYNlfh6LbBL0ucOhFmGdBMvZLI2pDMR6N0QA
	2TtfLh+J7NHSKOWKQcFS6gElBogxoKetRFJuujAs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DoIF3I+AxBW8u9FcaRctl+lajBmeN77fTEWJr9fhVRM=;
	b=WjOSmitdLeQ5JBfGQ0lMcSf3Nbt0p5cAxsmIFFd853PE3M+bPN/DQ+axmjINEQ7p
	5QFk5OWwh5LEUbOeOI4LPH2qHoz1inXzS2njU+1x+tKb+bKNKNNRVvcUw1OqWI9delO
	Gvby02u53vP81bwq7zAG+Hqab2ifl2wumhrnzcyk=
Content-Type: multipart/mixed; boundary="===============2362373196459819711=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 259 SUCCEEDED
Message-ID: <0101018dfc0cdb13-ed42a35e-b08d-4a94-9140-3eb90f5da817-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196522

--===============2362373196459819711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *259* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-253-259.patch
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
From 6bded4ce7aad1c743ba954f68d01e6fad25fc5c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 21:41:57 +0000
Subject: [PATCH] diffoscope: upgrade 253 -> 259

---
 .../diffoscope/{diffoscope_253.bb => diffoscope_259.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_253.bb => diffoscope_259.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_253.bb b/meta/recipes-support/diffoscope/diffoscope_259.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_253.bb
rename to meta/recipes-support/diffoscope/diffoscope_259.bb
index a1fc63efc3..eca2c208fc 100644
--- a/meta/recipes-support/diffoscope/diffoscope_253.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_259.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ca3d826b691f4998d6de28a016b3555d56a7283b97ad92944ce643ea6e7eb614"
+SRC_URI[sha256sum] = "c1f14452467f84c4be804a3725cbfdd5eadf977ece7ad463be8b647d1a87fb42"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.42.0


--===============2362373196459819711==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-253-259.patch"

RnJvbSA2YmRlZDRjZTdhYWQxYzc0M2JhOTU0ZjY4ZDAxZTZmYWQyNWZjNWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAyMTo0MTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjUzIC0+IDI1OQoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yNTMuYmIgPT4gZGlmZm9zY29wZV8yNTkuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI1My5iYiA9PiBkaWZmb3Njb3BlXzI1
OS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjUzLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI1OS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjUzLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjU5LmJiCmluZGV4IGExZmM2M2Vm
YzMuLmVjYTJjMjA4ZmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI1OS5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjYTNkODI2YjY5MWY0OTk4ZDZkZTI4YTAxNmIzNTU1ZDU2YTcyODNiOTdhZDkyOTQ0Y2U2
NDNlYTZlN2ViNjE0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImMxZjE0NDUyNDY3Zjg0YzRiZTgw
NGEzNzI1Y2JmZGQ1ZWFkZjk3N2VjZTdhZDQ2M2JlOGI2NDdkMWE4N2ZiNDIiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDIuMAoK

--===============2362373196459819711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "253" to "259"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 253 [default] to 259 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "253" to "259"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 253 [default] to 259 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "253" to "259"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 253 [default] to 259 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "253" to "259"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 253 [default] to 259 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "253" to "259"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 253 [default] to 259 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "253" to "259"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 253 [default] to 259 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-253.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-259.dist-info, added "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py"
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "253" to "259"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1333244 to 1350135 (+1%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 253 [default] to 259 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-253.tar.gz;downloadfilename=diffoscope-253.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-259.tar.gz;downloadfilename=diffoscope-259.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "253" to "259"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 253 [default] to 259 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-253.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-259.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py was added

--===============2362373196459819711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1864 targets, 46 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-64 sysroot...done.
Removing 127 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============2362373196459819711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-253.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-259.dist-info, added "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-253.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-259.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/xar.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/xar.py was added

--===============2362373196459819711==--

