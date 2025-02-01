Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC3BC0219C
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.42625.1738416048125297131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CyJR1wY6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RI+LrNlL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010194c1ac1f49-cfaa03a3-bd59-4f13-aef6-c07372f7b5fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kk2F+VORoGRp3vK8vnitzXxj5TM3jmbOG/S8Poj7mBI=;
	b=CyJR1wY6qViwiMU6ewu6Si9x9J+H4wk7X7l4v44NQeQfYzzYXUlOe89zQbWW1mmu
	YTfluPWf1VduFY5x7K65TrY6HeX+Q1IYuIY2CQuepFZIeTSqTRvZ9/nmcfYlxqBxi0z
	+q2ISTnzqxDEw4D5AHxwEa3LS1mTIk77pH54AjdY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kk2F+VORoGRp3vK8vnitzXxj5TM3jmbOG/S8Poj7mBI=;
	b=RI+LrNlL7npgrjn9EsjHZfW0/aA17b5xRra0QK0mFgZW7TMX2Ih05HisCBzr6Au2
	luFyK2p0aig12O9r/cqxjbC+C1oEPZD4mWCawVdHisdaQ2zJNoo846Y9JnLf1pj7YAv
	2AvncIv6C5XjFYf6q9idBekrarxa/ee9UNBEqtm8=
Content-Type: multipart/mixed; boundary="===============3074231660945087756=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 287 SUCCEEDED
Message-ID: <01010194c1ac1f49-cfaa03a3-bd59-4f13-aef6-c07372f7b5fe-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210596

--===============3074231660945087756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *287* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-284-287.patch
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
From 681c148825c659d98aa4ef2a94fcdb8b9c755195 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 13:06:03 +0000
Subject: [PATCH] diffoscope: upgrade 284 -> 287

---
 .../diffoscope/{diffoscope_284.bb => diffoscope_287.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_284.bb => diffoscope_287.bb} (95%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_284.bb b/meta/recipes-support/diffoscope/diffoscope_287.bb
similarity index 95%
rename from meta/recipes-support/diffoscope/diffoscope_284.bb
rename to meta/recipes-support/diffoscope/diffoscope_287.bb
index 77717d4238..8f8f114054 100644
--- a/meta/recipes-support/diffoscope/diffoscope_284.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_287.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c672e97ce3e69c229858419e8d368563bb583101a9cfc5eb70e28d441502b1b7"
+SRC_URI[sha256sum] = "51702676957edb4c16ad93bcfc25bfdbcdb0c39fa7d1d16f657db71cfaa58ceb"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.1


--===============3074231660945087756==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-284-287.patch"

RnJvbSA2ODFjMTQ4ODI1YzY1OWQ5OGFhNGVmMmE5NGZjZGI4YjljNzU1MTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMzowNjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjg0IC0+IDI4NwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yODQuYmIgPT4gZGlmZm9zY29wZV8yODcuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI4NC5iYiA9PiBkaWZmb3Njb3BlXzI4
Ny5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjg0LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI4Ny5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjg0LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjg3LmJiCmluZGV4IDc3NzE3ZDQy
MzguLjhmOGYxMTQwNTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yODQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI4Ny5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjNjcyZTk3Y2UzZTY5YzIyOTg1ODQxOWU4ZDM2ODU2M2JiNTgzMTAxYTljZmM1ZWI3MGUy
OGQ0NDE1MDJiMWI3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUxNzAyNjc2OTU3ZWRiNGMxNmFk
OTNiY2ZjMjViZmRiY2RiMGMzOWZhN2QxZDE2ZjY1N2RiNzFjZmFhNThjZWIiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDQuMQoK

--===============3074231660945087756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 284 [default] to 287 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "284" to "287"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 284 [default] to 287 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "284" to "287"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 284 [default] to 287 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "284" to "287"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 284 [default] to 287 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "284" to "287"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 284 [default] to 287 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "284" to "287"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 284 [default] to 287 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "284" to "287"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 284 [default] to 287 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1365693 to 1376338 (+1%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "284" to "287"
packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.13/site-packages/diffoscope-284.dist-info -> /usr/lib/python3.13/site-packages/diffoscope-287.dist-info, added "/usr/lib/python3.13/site-packages/diffoscope/comparators/__pycache__/asar.cpython-313.pyc /usr/lib/python3.13/site-packages/diffoscope/comparators/asar.py"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 284 [default] to 287 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-284.tar.gz;downloadfilename=diffoscope-284.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-287.tar.gz;downloadfilename=diffoscope-287.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "284" to "287"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-284.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-287.dist-info
  /usr/lib/python3.13/site-packages/diffoscope/comparators/asar.py was added
  /usr/lib/python3.13/site-packages/diffoscope/comparators/__pycache__/asar.cpython-313.pyc was added

--===============3074231660945087756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.13/site-packages/diffoscope-284.dist-info -> /usr/lib/python3.13/site-packages/diffoscope-287.dist-info, added "/usr/lib/python3.13/site-packages/diffoscope/comparators/__pycache__/asar.cpython-313.pyc /usr/lib/python3.13/site-packages/diffoscope/comparators/asar.py"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-284.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-287.dist-info
  /usr/lib/python3.13/site-packages/diffoscope/comparators/asar.py was added
  /usr/lib/python3.13/site-packages/diffoscope/comparators/__pycache__/asar.cpython-313.pyc was added

--===============3074231660945087756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 120 recipes from the core2-64 sysroot...done.
Removing 131 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============3074231660945087756==--

