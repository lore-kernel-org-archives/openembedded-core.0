Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ABFF43830
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19749.1776261894086639253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZGH4zf0h;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=N08DDRJI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91758de1-1880f52e-555f-4454-93be-229105099023-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2stwIDoQyvYrRcdcTyi6sVp6trYXJNPdHHqNqxS5Ak4=;
	b=ZGH4zf0h732YYkf5eRezUqxq87IIsDVDqbrehrApoRhBwmaMzlpi2EWQrEhtnaow
	NnVDgDltIP36cyFJc0ZM01i9280ufButLnEXkwJrxswxvfiORSZcmDXAUJThIgkv6vE
	tI/cEqhvuv9iTSSNyHIAiIYyhkBJ7x0BXKWBth0o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2stwIDoQyvYrRcdcTyi6sVp6trYXJNPdHHqNqxS5Ak4=;
	b=N08DDRJIqaYDDuv+Sa/2RS2OaZ7g2QbMRUhda8V0wJbBfn4syGLw7xz3iN4Gkt0g
	ls71Pt9eDgTrt1T/GP3ZbCGDqs+38Inmj1W+e7Gqy+U4IuWSQeuPW7M/s3J/x7jkBod
	HS+W9XD8d3e8MKHiM91t6Ek9f9i5EbxbiZxKtxvU=
Content-Type: multipart/mixed; boundary="===============3885790461367615430=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 317 SUCCEEDED
Message-ID: <0101019d91758de1-1880f52e-555f-4454-93be-229105099023-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235295

--===============3885790461367615430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *317* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-314-317.patch
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
From bba23006c627eb2163fd0efdc502b9607e0b90ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 12:59:52 +0000
Subject: [PATCH] diffoscope: upgrade 314 -> 317

---
 .../diffoscope/{diffoscope_314.bb => diffoscope_317.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_314.bb => diffoscope_317.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_314.bb b/meta/recipes-support/diffoscope/diffoscope_317.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_314.bb
rename to meta/recipes-support/diffoscope/diffoscope_317.bb
index 11868dc8db..06c3ee1a30 100644
--- a/meta/recipes-support/diffoscope/diffoscope_314.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_317.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b347d6ebcadd913a5839555b89ea1026422a1cdf7b8b3be21bb2f112133c3ff8"
+SRC_URI[sha256sum] = "9c8741f76bcbd1faec59227da31981a524abca63e19d03f3a594c19f326de542"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============3885790461367615430==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-314-317.patch"

RnJvbSBiYmEyMzAwNmM2MjdlYjIxNjNmZDBlZmRjNTAyYjk2MDdlMGI5MGFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTI6NTk6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMxNCAtPiAzMTcKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzE0LmJiID0+IGRpZmZvc2NvcGVfMzE3LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMTQuYmIgPT4gZGlmZm9zY29wZV8z
MTcuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMxNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMTcuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxNy5iYgppbmRleCAxMTg2OGRj
OGRiLi4wNmMzZWUxYTMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzE0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMTcuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYjM0N2Q2ZWJjYWRkOTEzYTU4Mzk1NTViODllYTEwMjY0MjJhMWNkZjdiOGIzYmUyMWJi
MmYxMTIxMzNjM2ZmOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5Yzg3NDFmNzZiY2JkMWZhZWM1
OTIyN2RhMzE5ODFhNTI0YWJjYTYzZTE5ZDAzZjNhNTk0YzE5ZjMyNmRlNTQyIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============3885790461367615430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-314.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-317.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-314.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-317.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-314.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-317.dist-info

--===============3885790461367615430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "314" to "317"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 314 [default] to 317 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "314" to "317"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 314 [default] to 317 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "314" to "317"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 314 [default] to 317 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "314" to "317"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 314 [default] to 317 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "314" to "317"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 314 [default] to 317 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "314" to "317"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 314 [default] to 317 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "314" to "317"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411658 to 1411702 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 314 [default] to 317 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-314.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-317.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-314.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-317.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-314.tar.gz;downloadfilename=diffoscope-314.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-317.tar.gz;downloadfilename=diffoscope-317.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "314" to "317"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 314 [default] to 317 [default]
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-314.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-317.dist-info

--===============3885790461367615430==--

