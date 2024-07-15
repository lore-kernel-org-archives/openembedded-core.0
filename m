Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B429AC3DA6C
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1381.1721071149192492716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Qo9eOhKD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SjvoOyc3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010190b7d59e16-cd53fc73-6d03-4ea0-842e-45410c492559-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V/tzWkeNuFe/ScMovPfgG5h6jbLkYeYeRBpSenQ3beg=;
	b=Qo9eOhKDNXocjSE5ODQXdewpidsoMVy5rj6QfxoDFJoExi1PClbTXtpbuqDOaF07
	EUiDrkIA0vdDGU8o8TFvmqOnF07V93up/GSnlu3synWIqeVmjPQgqgsQ3C26B3/B2cy
	ah8yohkQ9qPlGsQVxQ/LPwxhpZIv9z8Prd8sQOFU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V/tzWkeNuFe/ScMovPfgG5h6jbLkYeYeRBpSenQ3beg=;
	b=SjvoOyc32fK/aegddOB5BDOXB0rWyJjXFaNJXl0+xSfrW7mxq2Hohjl9ilqMmjew
	5tl1FNZ8wFqJY+6Vw9whGttJC3WFA4mQ/m3zwePEfN9upnmzVwOPe4Q3wC5XefeWbQE
	bTDlijqopUkDlkFFmw3+nf82tYVKidHVlrFX+dN8=
Content-Type: multipart/mixed; boundary="===============3237491503140047646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 272 SUCCEEDED
Message-ID: <01010190b7d59e16-cd53fc73-6d03-4ea0-842e-45410c492559-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202054

--===============3237491503140047646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *272* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-271-272.patch
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
From 559ec37eac93c504be2cd6e0f1cb8f880ce19ee7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 18:00:43 +0000
Subject: [PATCH] diffoscope: upgrade 271 -> 272

---
 .../diffoscope/{diffoscope_271.bb => diffoscope_272.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_271.bb => diffoscope_272.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_271.bb b/meta/recipes-support/diffoscope/diffoscope_272.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_271.bb
rename to meta/recipes-support/diffoscope/diffoscope_272.bb
index a8443183ec..55e4cc7832 100644
--- a/meta/recipes-support/diffoscope/diffoscope_271.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_272.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7690f284a84a866c6f89fa5bb33a867574417ee1c5f2c6d49655cd3761d0fe2c"
+SRC_URI[sha256sum] = "f8983580efb8f4644719705590a43817d1159d4136836d7ce6dd4fec754c3943"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.0


--===============3237491503140047646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-271.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-272.dist-info

--===============3237491503140047646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-64 sysroot...done.
Removing 128 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============3237491503140047646==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-271-272.patch"

RnJvbSA1NTllYzM3ZWFjOTNjNTA0YmUyY2Q2ZTBmMWNiOGY4ODBjZTE5ZWU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTg6MDA6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI3MSAtPiAyNzIKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjcxLmJiID0+IGRpZmZvc2NvcGVfMjcyLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNzEuYmIgPT4gZGlmZm9zY29wZV8y
NzIuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI3MS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNzIuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI3MS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI3Mi5iYgppbmRleCBhODQ0MzE4
M2VjLi41NWU0Y2M3ODMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjcxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNzIuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNzY5MGYyODRhODRhODY2YzZmODlmYTViYjMzYTg2NzU3NDQxN2VlMWM1ZjJjNmQ0OTY1
NWNkMzc2MWQwZmUyYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmODk4MzU4MGVmYjhmNDY0NDcx
OTcwNTU5MGE0MzgxN2QxMTU5ZDQxMzY4MzZkN2NlNmRkNGZlYzc1NGMzOTQzIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ0LjAKCg==

--===============3237491503140047646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 271 [default] to 272 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "271" to "272"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 271 [default] to 272 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "271" to "272"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 271 [default] to 272 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "271" to "272"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 271 [default] to 272 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "271" to "272"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 271 [default] to 272 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "271" to "272"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 271 [default] to 272 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "271" to "272"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 271 [default] to 272 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "271" to "272"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 271 [default] to 272 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-271.tar.gz;downloadfilename=diffoscope-271.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-272.tar.gz;downloadfilename=diffoscope-272.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "271" to "272"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-271.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-272.dist-info

--===============3237491503140047646==--

