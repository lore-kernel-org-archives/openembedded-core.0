Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2571DC61CE8
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11036.1747312311544518048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jin+XNqP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WArkUw17;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010196d3ee38e6-bc7f605a-cd5a-4ce1-90d6-711bddc6c3a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4Kz8XJlpgUseM9DhUdvxbIlNlPKoKSQmadXvBlfjTOY=;
	b=jin+XNqP9yHpiDaybTWMO/xbWKfE0WjXdCdFJjJn5N8FwJ2qpYEigvK8ATqrcc18
	RLTPQuuFNiih78UqIdq5SZqEJyfLDE5gKJ8m9Bzrt9p540ITY4K1Bgjg+m4Np7g7BgA
	QVLfEdMVgt/DOgpXgTD6pu+cCfNIIS5266i4jlqQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4Kz8XJlpgUseM9DhUdvxbIlNlPKoKSQmadXvBlfjTOY=;
	b=WArkUw17AwBi9NjFpgEJSTXMxnVrfvW4FCGcdkk09PArFzsQbQBJYVK6kn1M5YVm
	77r9GRZ6O/kUessV5tyJZfVLqblt2Y7YnUUlE0WVkKQHt04eBigeB90tWNerr3VtVTG
	hKlUublHsQM9bCMp0TpbIVSoSezA0pJxT1gjy5vE=
Content-Type: multipart/mixed; boundary="===============7142713274601529801=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 295 SUCCEEDED
Message-ID: <01010196d3ee38e6-bc7f605a-cd5a-4ce1-90d6-711bddc6c3a2-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216658

--===============7142713274601529801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *295* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-293-295.patch
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
From 478519730bdc7b0a358f3b4b771d0100ba81a9fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 12:09:00 +0000
Subject: [PATCH] diffoscope: upgrade 293 -> 295

---
 .../diffoscope/{diffoscope_293.bb => diffoscope_295.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_293.bb => diffoscope_295.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_293.bb b/meta/recipes-support/diffoscope/diffoscope_295.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_293.bb
rename to meta/recipes-support/diffoscope/diffoscope_295.bb
index 59e7cbe000..254c7322fd 100644
--- a/meta/recipes-support/diffoscope/diffoscope_293.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_295.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "15315d09babdee45449be7042ad1f57104a5f04853bd6951cdc0da171c13ac3b"
+SRC_URI[sha256sum] = "f99ad743fc888693b193fe768a08d0142e3c5c6b2503a7265be7c08a99cc2a5f"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============7142713274601529801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1917 targets, 48 skipped, 0 masked, 0 errors.
Removing 119 recipes from the core2-64 sysroot...done.
Removing 135 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============7142713274601529801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "293" to "295"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 293 [default] to 295 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "293" to "295"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 293 [default] to 295 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "293" to "295"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 293 [default] to 295 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "293" to "295"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 293 [default] to 295 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "293" to "295"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 293 [default] to 295 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "293" to "295"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 293 [default] to 295 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "293" to "295"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1378908 to 1379058 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 293 [default] to 295 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "293" to "295"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 293 [default] to 295 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-293.tar.gz;downloadfilename=diffoscope-293.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-295.tar.gz;downloadfilename=diffoscope-295.tar.gz"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-293.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-295.dist-info

--===============7142713274601529801==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-293-295.patch"

RnJvbSA0Nzg1MTk3MzBiZGM3YjBhMzU4ZjNiNGI3NzFkMDEwMGJhODFhOWZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTI6MDk6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI5MyAtPiAyOTUKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjkzLmJiID0+IGRpZmZvc2NvcGVfMjk1LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yOTMuYmIgPT4gZGlmZm9zY29wZV8y
OTUuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI5My5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yOTUuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI5My5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI5NS5iYgppbmRleCA1OWU3Y2Jl
MDAwLi4yNTRjNzMyMmZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjkzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yOTUuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMTUzMTVkMDliYWJkZWU0NTQ0OWJlNzA0MmFkMWY1NzEwNGE1ZjA0ODUzYmQ2OTUxY2Rj
MGRhMTcxYzEzYWMzYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmOTlhZDc0M2ZjODg4NjkzYjE5
M2ZlNzY4YTA4ZDAxNDJlM2M1YzZiMjUwM2E3MjY1YmU3YzA4YTk5Y2MyYTVmIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============7142713274601529801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-293.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-295.dist-info

--===============7142713274601529801==--

