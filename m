Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BC3C43211
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 06:08:04 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50707.1782540478439134568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 23:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aPs1V+3S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=N4p22C2p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f07b12508-15fa68d9-2471-4d80-b264-4ec751bc4127-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782540477;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yqyNatWgyF5LQpb2MsCBfwWz4rj9R/dh7xpkpU8GPb0=;
	b=aPs1V+3SRJ9AFVWt2iIO2F/qcrcEO+ZK/cY9cr81okYdv19JD+CNsyttt07KZOl+
	eSptb8vWiEqXLJVD/yxXIVopYhRFmd2m8m/6z1sQaCVe+ctaVbPCDOljVQrpp5DeKmR
	dODax5QVc0J2jX8+w1ggXtDUBYML2RhUpAfUMpRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782540477;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yqyNatWgyF5LQpb2MsCBfwWz4rj9R/dh7xpkpU8GPb0=;
	b=N4p22C2pO9TYzXC6ERybRWZcbT2PUhaI5wuBUUSat2pxZz1zAIRzagTKinU5CKR/
	XHNnoHGaXGBXkSGPizaEa93/G43rB1tKMWU0ZJSQsj3kOL6YrxN9fiuyaT3lGN2dxVw
	LRdTSrHpTrdS8y2ffE4i9vwT3fmCN9qCNPjZdU1I=
Content-Type: multipart/mixed; boundary="===============3363020716862353612=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 322 SUCCEEDED
Message-ID: <0101019f07b12508-15fa68d9-2471-4d80-b264-4ec751bc4127-000000@us-west-2.amazonses.com>
Date: Sat, 27 Jun 2026 06:07:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.27-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239680

--===============3363020716862353612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *322* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-319-322.patch
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
From a3a4ef817145818a3720f36e75e7db46b2368c32 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 27 Jun 2026 05:54:56 +0000
Subject: [PATCH] diffoscope: upgrade 319 -> 322

---
 .../diffoscope/{diffoscope_319.bb => diffoscope_322.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_319.bb => diffoscope_322.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_319.bb b/meta/recipes-support/diffoscope/diffoscope_322.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_319.bb
rename to meta/recipes-support/diffoscope/diffoscope_322.bb
index 258dab9027..b2f62901d1 100644
--- a/meta/recipes-support/diffoscope/diffoscope_319.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_322.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "990d8ac71a5e7045c8ad6c66353f6a0dcbf5537ab323295e31bd795b043aa916"
+SRC_URI[sha256sum] = "456b0ef4265468f21fdf3c3e08bcacf1fc270d3bda799c84f93298604d3dc24d"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============3363020716862353612==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-319-322.patch"

RnJvbSBhM2E0ZWY4MTcxNDU4MThhMzcyMGYzNmU3NWU3ZGI0NmIyMzY4YzMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjcgSnVuIDIwMjYgMDU6NTQ6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMxOSAtPiAzMjIKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzE5LmJiID0+IGRpZmZvc2NvcGVfMzIyLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMTkuYmIgPT4gZGlmZm9zY29wZV8z
MjIuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMxOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxOS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyMi5iYgppbmRleCAyNThkYWI5
MDI3Li5iMmY2MjkwMWQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzE5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMjIuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTkwZDhh
YzcxYTVlNzA0NWM4YWQ2YzY2MzUzZjZhMGRjYmY1NTM3YWIzMjMyOTVlMzFiZDc5NWIwNDNhYTkx
NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0NTZiMGVmNDI2NTQ2OGYyMWZkZjNjM2UwOGJjYWNm
MWZjMjcwZDNiZGE3OTljODRmOTMyOTg2MDRkM2RjMjRkIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============3363020716862353612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 319 [default] to 322 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "319" to "322"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 319 [default] to 322 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "319" to "322"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 319 [default] to 322 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "319" to "322"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 319 [default] to 322 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "319" to "322"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 319 [default] to 322 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "319" to "322"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 319 [default] to 322 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "319" to "322"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411758 to 1412475 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-322.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-322.dist-info
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 319 [default] to 322 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "319" to "322"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-319.tar.gz;downloadfilename=diffoscope-319.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-322.tar.gz;downloadfilename=diffoscope-322.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 319 [default] to 322 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "319" to "322"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-319.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-322.dist-info

--===============3363020716862353612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-322.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-322.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-319.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-322.dist-info

--===============3363020716862353612==--

