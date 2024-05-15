Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107F7C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:28 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1267.1715794340140130280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ur6esZ35;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=srMqNk36;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f7d4fe6fb-8ddcc88c-826f-4ce9-8dca-6b742cac025f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pzxE8Lc1e2di7m4P+1MmpF5xx8/KTZBj9jNoPzGUIKw=;
	b=Ur6esZ35WhZISsNAh8GhmAvI4cbupW9IkCVcwk8PtgF2PHL6y237X+DpWQkHfkIB
	ezkvAWaseFaDhCiSoNYk7R+yGGYj96UtWqFgf4VxZIg4ZBQDtDFVZc4DTOM4komX3z2
	1JJSinN3l5MMzBOz+oZvylzPyAmpCND5X3VNuawc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pzxE8Lc1e2di7m4P+1MmpF5xx8/KTZBj9jNoPzGUIKw=;
	b=srMqNk366S8JaLgmm4wrpQNI9tQHF41oO3GVFpPS7g3Vl2wfHdE7f9RC6VTemhM/
	J/blXQrxJGi3E+SX+SAAH8Pn+wCQxTlumOeMEAJU7qvXpwjLB/pzMPgDPvzE1kYFyC2
	WWhkOkWa59nUrroOA1/lMIMeGpddqBgaY9AsnkW8=
Content-Type: multipart/mixed; boundary="===============8635588062031916599=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 266 SUCCEEDED
Message-ID: <0101018f7d4fe6fb-8ddcc88c-826f-4ce9-8dca-6b742cac025f-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199408

--===============8635588062031916599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *266* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-265-266.patch
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
From 2f6de9ec1e1e8a00729b58d79b29f50515694412 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 16:21:57 +0000
Subject: [PATCH] diffoscope: upgrade 265 -> 266

---
 .../diffoscope/{diffoscope_265.bb => diffoscope_266.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_265.bb => diffoscope_266.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_265.bb b/meta/recipes-support/diffoscope/diffoscope_266.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_265.bb
rename to meta/recipes-support/diffoscope/diffoscope_266.bb
index 6af5abc974..1032c9a7cc 100644
--- a/meta/recipes-support/diffoscope/diffoscope_265.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_266.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7bdcbd7fc5bc4c821bf6ab5ffbbeb265103b04e6908ea4bb12144d7e5ca002ff"
+SRC_URI[sha256sum] = "47a93aa20f1644d090a131986be50feb3e645d9e8a892bb04c4c11da216769d9"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.0


--===============8635588062031916599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1880 targets, 46 skipped, 0 masked, 0 errors.
Removing 101 recipes from the core2-64 sysroot...done.
Removing 129 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============8635588062031916599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "265" to "266"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 265 [default] to 266 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "265" to "266"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 265 [default] to 266 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "265" to "266"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 265 [default] to 266 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "265" to "266"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 265 [default] to 266 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "265" to "266"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 265 [default] to 266 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "265" to "266"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 265 [default] to 266 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "265" to "266"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1355704 to 1357704 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 265 [default] to 266 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-265.tar.gz;downloadfilename=diffoscope-265.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-266.tar.gz;downloadfilename=diffoscope-266.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "265" to "266"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 265 [default] to 266 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-265.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-266.dist-info

--===============8635588062031916599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-265.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-266.dist-info

--===============8635588062031916599==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-265-266.patch"

RnJvbSAyZjZkZTllYzFlMWU4YTAwNzI5YjU4ZDc5YjI5ZjUwNTE1Njk0NDEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTY6MjE6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI2NSAtPiAyNjYKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjY1LmJiID0+IGRpZmZvc2NvcGVfMjY2LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNjUuYmIgPT4gZGlmZm9zY29wZV8y
NjYuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI2NS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI2NS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI2Ni5iYgppbmRleCA2YWY1YWJj
OTc0Li4xMDMyYzlhN2NjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjY1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNjYuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiN2JkY2JkN2ZjNWJjNGM4MjFiZjZhYjVmZmJiZWIyNjUxMDNiMDRlNjkwOGVhNGJiMTIx
NDRkN2U1Y2EwMDJmZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0N2E5M2FhMjBmMTY0NGQwOTBh
MTMxOTg2YmU1MGZlYjNlNjQ1ZDllOGE4OTJiYjA0YzRjMTFkYTIxNjc2OWQ5IgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ0LjAKCg==

--===============8635588062031916599==--

