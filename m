Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D51C44521
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 05:19:44 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.901.1784351979171455606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 22:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rwDf18Me;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nD4rk1Zk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f73aa7295-a30c0e75-6996-46f2-8aeb-3b8df560dffd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784351978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T2wVbpfHXSLtESfLvsmRvVkUoh44zO1XeTmNtJcUrFc=;
	b=rwDf18MeBziOiBUjibXSJc1hkRdpCTzU02/FMITEeiUuPqUDZXMvZI62Xd3w85sj
	xzeuBRcUQvFTP4HAyVHxIWt4bnklw2WGItHgDK8jYzeNfYXVfODXPWzv0k7CMSuFjGs
	kfProeI+SYWseGLnNwgnY8TukfiW07wn+VXMyQIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784351978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T2wVbpfHXSLtESfLvsmRvVkUoh44zO1XeTmNtJcUrFc=;
	b=nD4rk1ZkZoI8kk0ATmZXUGGqLpVqKOkgRhmCtDHxVVPOAzVRxXy9yrEGhAWHfbZL
	xCevc//TPMVJVw5Fy9vuSB5sWO0oPnT9ZtJfsuHKFNPx0wPCBCQovxFiyVnX673Xbyq
	7zhuhrbInBlYqtP1U3IvatQdlsgGYqu5Z2+f8+N4=
Content-Type: multipart/mixed; boundary="===============5796690422171463252=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 325 SUCCEEDED
Message-ID: <0101019f73aa7295-a30c0e75-6996-46f2-8aeb-3b8df560dffd-000000@us-west-2.amazonses.com>
Date: Sat, 18 Jul 2026 05:19:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 05:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241234

--===============5796690422171463252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *325* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-324-325.patch
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
From 46dfcecdbf1f62ca7b2ed12e1015d22505541085 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 18 Jul 2026 05:19:31 +0000
Subject: [PATCH] diffoscope: upgrade 324 -> 325

---
 .../diffoscope/{diffoscope_324.bb => diffoscope_325.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_324.bb => diffoscope_325.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_324.bb b/meta/recipes-support/diffoscope/diffoscope_325.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_324.bb
rename to meta/recipes-support/diffoscope/diffoscope_325.bb
index 822446e985..521b2b5b04 100644
--- a/meta/recipes-support/diffoscope/diffoscope_324.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_325.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "daf539d33140ecd4c5dcf18c894bbc09aeab5307b44de28b12ca34434d47c5ba"
+SRC_URI[sha256sum] = "d74a2edb0555a9ee306d5362b921f80c144bb941c0a6d61794473d1540d729ad"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============5796690422171463252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 324 [default] to 325 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "324" to "325"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 324 [default] to 325 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "324" to "325"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 324 [default] to 325 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "324" to "325"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 324 [default] to 325 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "324" to "325"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 324 [default] to 325 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "324" to "325"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 324 [default] to 325 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "324" to "325"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 324 [default] to 325 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "324" to "325"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-324.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-325.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-324.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-325.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-324.tar.gz;downloadfilename=diffoscope-324.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-325.tar.gz;downloadfilename=diffoscope-325.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 324 [default] to 325 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "324" to "325"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-324.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-325.dist-info

--===============5796690422171463252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-324.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-325.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-324.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-325.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-324.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-325.dist-info

--===============5796690422171463252==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-324-325.patch"

RnJvbSA0NmRmY2VjZGJmMWY2MmNhN2IyZWQxMmUxMDE1ZDIyNTA1NTQxMDg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTggSnVsIDIwMjYgMDU6MTk6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMyNCAtPiAzMjUKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzI0LmJiID0+IGRpZmZvc2NvcGVfMzI1LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMjQuYmIgPT4gZGlmZm9zY29wZV8z
MjUuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMyNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMjUuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyNS5iYgppbmRleCA4MjI0NDZl
OTg1Li41MjFiMmI1YjA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzI0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMjUuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGFmNTM5
ZDMzMTQwZWNkNGM1ZGNmMThjODk0YmJjMDlhZWFiNTMwN2I0NGRlMjhiMTJjYTM0NDM0ZDQ3YzVi
YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNzRhMmVkYjA1NTVhOWVlMzA2ZDUzNjJiOTIxZjgw
YzE0NGJiOTQxYzBhNmQ2MTc5NDQ3M2QxNTQwZDcyOWFkIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============5796690422171463252==--

