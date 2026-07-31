Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1A3C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:35:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.502.1785476098506337623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=crij40gx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=otw7DDsG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019fb6ab25f5-379a57fb-9380-48fc-a2f1-0321e6d72754-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785476097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OJDWNjASdJr0y2u/cb+PMkonmbBYYH/vpOVjXumO7Xk=;
	b=crij40gxPPKOYTUuwlWmfsCcIUK3I6i4tpGbakJPfVP/fHhJ3YFF5xTgfYE351z9
	nZDFeCXCTvfXVMqZuqDEDxTlg9ewhVDk9LlW9J0GTyDh2WxyF8R7VudrFha40kKzlTr
	v30IPJd4FbvHWz6IqrhxjbPR9m03vdNDaIGuMw5k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785476097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OJDWNjASdJr0y2u/cb+PMkonmbBYYH/vpOVjXumO7Xk=;
	b=otw7DDsGRCwuKV50B4R5tdEKD5J1OEcfFDJnZpC93vAjZeUD212dRrZUaTk8/lGo
	HcnHxgSeaw+zf8nR3dz1YrG6SW5BRYMNV9tG8UzNNmI5S2coxa7lJF+RRVb7FbQjZY4
	olLmnJZe+ozUxriYmzii6Nc3hhK1dm/fdYzLja9w=
Content-Type: multipart/mixed; boundary="===============5034459639923275067=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 326 SUCCEEDED
Message-ID: <0101019fb6ab25f5-379a57fb-9380-48fc-a2f1-0321e6d72754-000000@us-west-2.amazonses.com>
Date: Fri, 31 Jul 2026 05:34:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.31-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242395

--===============5034459639923275067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *326* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-325-326.patch
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
From f39236cad1ac7d8d1ef515e08ccdcf4d25dad002 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 31 Jul 2026 05:34:50 +0000
Subject: [PATCH] diffoscope: upgrade 325 -> 326

---
 .../diffoscope/{diffoscope_325.bb => diffoscope_326.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_325.bb => diffoscope_326.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_325.bb b/meta/recipes-support/diffoscope/diffoscope_326.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_325.bb
rename to meta/recipes-support/diffoscope/diffoscope_326.bb
index 521b2b5b04..3ab679f34f 100644
--- a/meta/recipes-support/diffoscope/diffoscope_325.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_326.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d74a2edb0555a9ee306d5362b921f80c144bb941c0a6d61794473d1540d729ad"
+SRC_URI[sha256sum] = "21aaa977a9fbdf6e2b70b675a700ad1f80e878ac1dac59cf6fb0ba5f319616c7"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============5034459639923275067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-325.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-326.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-325.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-326.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-325.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-326.dist-info

--===============5034459639923275067==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-325-326.patch"

RnJvbSBmMzkyMzZjYWQxYWM3ZDhkMWVmNTE1ZTA4Y2NkY2Y0ZDI1ZGFkMDAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzEgSnVsIDIwMjYgMDU6MzQ6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMyNSAtPiAzMjYKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzI1LmJiID0+IGRpZmZvc2NvcGVfMzI2LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMjUuYmIgPT4gZGlmZm9zY29wZV8z
MjYuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMyNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyNS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyNi5iYgppbmRleCA1MjFiMmI1
YjA0Li4zYWI2NzlmMzRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzI1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMjYuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDc0YTJl
ZGIwNTU1YTllZTMwNmQ1MzYyYjkyMWY4MGMxNDRiYjk0MWMwYTZkNjE3OTQ0NzNkMTU0MGQ3Mjlh
ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMWFhYTk3N2E5ZmJkZjZlMmI3MGI2NzVhNzAwYWQx
ZjgwZTg3OGFjMWRhYzU5Y2Y2ZmIwYmE1ZjMxOTYxNmM3IgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============5034459639923275067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 325 [default] to 326 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "325" to "326"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 325 [default] to 326 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "325" to "326"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 325 [default] to 326 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "325" to "326"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 325 [default] to 326 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "325" to "326"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 325 [default] to 326 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "325" to "326"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 325 [default] to 326 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "325" to "326"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-325.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-326.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-325.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-326.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 325 [default] to 326 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1413133 to 1413166 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "325" to "326"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-325.tar.gz;downloadfilename=diffoscope-325.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-326.tar.gz;downloadfilename=diffoscope-326.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 325 [default] to 326 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "325" to "326"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-325.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-326.dist-info

--===============5034459639923275067==--

