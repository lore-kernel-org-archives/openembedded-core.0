Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7D7CA5FB3
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:52 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1848.1790662721454358455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tttawstn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rWGe6qSV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0ebd0c8c0-7bee2884-1013-483f-ba32-ed99123b5e77-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m5lLcr6sSh8QomQ9K4Ha56NcocmFwHaZOwpWJiU7bks=;
	b=TttawstnYgB5hgK99SCHmV4XF54U6gBn1uRSOXYH+T37aXO2F6HUJO6oS2l7uWs2
	7p0Q5/eH4JFpzt/9c3sgbEblzeUq+5pd8BeP1RJlyUiHf8llGdrOrfex7XWIFSQV77y
	F+nBL+0IGODx0oym63xemHWFS7/F5X01fbpFIOKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m5lLcr6sSh8QomQ9K4Ha56NcocmFwHaZOwpWJiU7bks=;
	b=rWGe6qSVBlOb370sbbUvV0DwzZ0j2+/S5dqdm2MN+YkxUB3ZUdp0qvVdNQ0rLt3R
	fUkt4/XHayd9HvAhpoD+OBA/faVIjGmL9QgEXPlYc6rykYthkIEr3WoxpUt3tk1Mz0C
	RfeVwlaRjz2uoCeRI6bVh9DPPMWxS2UWA4RWNf7Y=
Content-Type: multipart/mixed; boundary="===============8632562402614642483=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 332 SUCCEEDED
Message-ID: <010101a0ebd0c8c0-7bee2884-1013-483f-ba32-ed99123b5e77-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246832

--===============8632562402614642483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *332* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-331-332.patch
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
From 177197cd4fdf6c331fdea78adc6d2c354473fb43 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 06:07:46 +0000
Subject: [PATCH] diffoscope: upgrade 331 -> 332

---
 .../diffoscope/{diffoscope_331.bb => diffoscope_332.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_331.bb => diffoscope_332.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_331.bb b/meta/recipes-support/diffoscope/diffoscope_332.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_331.bb
rename to meta/recipes-support/diffoscope/diffoscope_332.bb
index 3c64e12318..a43b20b460 100644
--- a/meta/recipes-support/diffoscope/diffoscope_331.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_332.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "298a62c374f5d60dd3d3af38cdea21cbad7148c84dbfe9cc5a91fdb1b5af4e37"
+SRC_URI[sha256sum] = "da858807ce2535f1bb5c3942020b01c7aef14f870257c964b70cd4e1f2333206"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============8632562402614642483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 331 [default] to 332 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "331" to "332"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 331 [default] to 332 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "331" to "332"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 331 [default] to 332 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "331" to "332"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 331 [default] to 332 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "331" to "332"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 331 [default] to 332 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "331" to "332"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 331 [default] to 332 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "331" to "332"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 331 [default] to 332 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1433306 to 1433312 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "331" to "332"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-331.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-332.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-331.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-331.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-332.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 331 [default] to 332 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "331" to "332"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-331.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-332.dist-info

--===============8632562402614642483==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-331-332.patch"

RnJvbSAxNzcxOTdjZDRmZGY2YzMzMWZkZWE3OGFkYzZkMmMzNTQ0NzNmYjQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDY6MDc6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMzMSAtPiAzMzIKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzMxLmJiID0+IGRpZmZvc2NvcGVfMzMyLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMzEuYmIgPT4gZGlmZm9zY29wZV8z
MzIuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMzMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMzIuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzMi5iYgppbmRleCAzYzY0ZTEy
MzE4Li5hNDNiMjBiNDYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzMxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMzIuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjk4YTYy
YzM3NGY1ZDYwZGQzZDNhZjM4Y2RlYTIxY2JhZDcxNDhjODRkYmZlOWNjNWE5MWZkYjFiNWFmNGUz
NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkYTg1ODgwN2NlMjUzNWYxYmI1YzM5NDIwMjBiMDFj
N2FlZjE0Zjg3MDI1N2M5NjRiNzBjZDRlMWYyMzMzMjA2IgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============8632562402614642483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-331.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-331.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-332.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-331.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-332.dist-info

--===============8632562402614642483==--

