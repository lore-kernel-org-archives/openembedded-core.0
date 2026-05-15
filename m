Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F6FCD5BCB
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34834.1778851235157759110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cOIaXOOD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WmpXBtSm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e2bcbdd7c-aa909615-7374-47c9-b39a-084922eddaf2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iS2cFVCGasjio5lsWigHi7AR3z5T3vSB86S3VGlGqGk=;
	b=cOIaXOOD6irh2OEfdp2WVioaARR+9eycG3uxwxGrmsxkJ4h5I7AGyaUrOWxn2fYV
	XkyGoJ1+6NVnEbcJEN3jgCbb/3UIMUv+J6m+s06U9d+mRtMkK2QIFkgn4H+JpjdpiEG
	g+H8lqvd0ej+0cmsUDnr/Wk7X6h8xv2+n4Q7GiDs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iS2cFVCGasjio5lsWigHi7AR3z5T3vSB86S3VGlGqGk=;
	b=WmpXBtSmMbuN1ROc0MJm18HxqBWjEkl+se5+bhJRbMAsDacrfucsCOCVYVsnrdRT
	xcYyCSNF/iF9ZhYVprqVmb+RSe5Y/ckqxCiE5NYWtfJ6/8IRgJtAqQCtKyG3yjWax5v
	G8F17XBTto4VLHubm6MPfBL8oikpmfcodGz2yJZY=
Content-Type: multipart/mixed; boundary="===============7672644498561128197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 318 SUCCEEDED
Message-ID: <0101019e2bcbdd7c-aa909615-7374-47c9-b39a-084922eddaf2-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237161

--===============7672644498561128197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *318* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-317-318.patch
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
From e8e12f2311f264d4c3f9501e3c89986e23f49624 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 12:05:22 +0000
Subject: [PATCH] diffoscope: upgrade 317 -> 318

---
 .../diffoscope/{diffoscope_317.bb => diffoscope_318.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_317.bb => diffoscope_318.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_317.bb b/meta/recipes-support/diffoscope/diffoscope_318.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_317.bb
rename to meta/recipes-support/diffoscope/diffoscope_318.bb
index 06c3ee1a30..7a4562cfce 100644
--- a/meta/recipes-support/diffoscope/diffoscope_317.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_318.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9c8741f76bcbd1faec59227da31981a524abca63e19d03f3a594c19f326de542"
+SRC_URI[sha256sum] = "313261c0da6b6c02e525a6b8a898a00aaba32cb7c5511364d5939fc0394295d9"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============7672644498561128197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-317.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-318.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-317.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-318.dist-info
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411702 to 1411641 (-0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-317.tar.gz;downloadfilename=diffoscope-317.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-318.tar.gz;downloadfilename=diffoscope-318.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 317 [default] to 318 [default]
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-317.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-318.dist-info

--===============7672644498561128197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-317.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-318.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-317.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-318.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-317.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-318.dist-info

--===============7672644498561128197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-317-318.patch"

RnJvbSBlOGUxMmYyMzExZjI2NGQ0YzNmOTUwMWUzYzg5OTg2ZTIzZjQ5NjI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTI6MDU6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMxNyAtPiAzMTgKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzE3LmJiID0+IGRpZmZvc2NvcGVfMzE4LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMTcuYmIgPT4gZGlmZm9zY29wZV8z
MTguYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMxNy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMTguYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxNy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxOC5iYgppbmRleCAwNmMzZWUx
YTMwLi43YTQ1NjJjZmNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzE3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMTguYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOWM4NzQxZjc2YmNiZDFmYWVjNTkyMjdkYTMxOTgxYTUyNGFiY2E2M2UxOWQwM2YzYTU5
NGMxOWYzMjZkZTU0MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMTMyNjFjMGRhNmI2YzAyZTUy
NWE2YjhhODk4YTAwYWFiYTMyY2I3YzU1MTEzNjRkNTkzOWZjMDM5NDI5NWQ5IgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============7672644498561128197==--

