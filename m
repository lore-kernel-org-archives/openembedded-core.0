Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA6ACD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:50:33 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87358.1781337028354085458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=by2F6Jy3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=x6afaZrh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ebff5f2d1-05016b47-35bb-4e09-94c7-325d9648cb4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781337027;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0yPvNt2wUASQXcqTxrj2JHJlKnnpX+qgIqqspEHYptY=;
	b=by2F6Jy3hJKYDoBBLwa3JCrRp3ldp6mcnRu6PBQILI0mZdEoXcJvq9Qdw8Ov/srF
	nbsoY39ttzZEJ0AbthZDeuyLLHySizU6yUYTXqypTi3vczdng68At4+GnRZGRmMN8Sb
	LyT8Bq0UvJfca+DShYHL5FC/2hvJJZVX7L9ZMUAY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781337027;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0yPvNt2wUASQXcqTxrj2JHJlKnnpX+qgIqqspEHYptY=;
	b=x6afaZrhrSht4WLKk9vY32K6cEDUvRRFVJ1PFmoh5DqR22ZJRdj0rnZG9UOk36gO
	rhHYvw/KtB/dfjVKDgMFya/B47G4VZxgHb3qeiDCT8uvKqTuuocOaqGp7q2lAXqHzeq
	j85ikFJKl/fyC8EAB+xD0gWRkmqWD8jMZambxVvQ=
Content-Type: multipart/mixed; boundary="===============5778292630825759397=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 319 SUCCEEDED
Message-ID: <0101019ebff5f2d1-05016b47-35bb-4e09-94c7-325d9648cb4f-000000@us-west-2.amazonses.com>
Date: Sat, 13 Jun 2026 07:50:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.13-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 07:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238665

--===============5778292630825759397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *319* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-318-319.patch
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
From 18c71066db7e349fec72fa8e20b0e9f51fe87f87 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 13 Jun 2026 07:50:17 +0000
Subject: [PATCH] diffoscope: upgrade 318 -> 319

---
 .../diffoscope/{diffoscope_318.bb => diffoscope_319.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_318.bb => diffoscope_319.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_318.bb b/meta/recipes-support/diffoscope/diffoscope_319.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_318.bb
rename to meta/recipes-support/diffoscope/diffoscope_319.bb
index e874d2bce4..258dab9027 100644
--- a/meta/recipes-support/diffoscope/diffoscope_318.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_319.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "313261c0da6b6c02e525a6b8a898a00aaba32cb7c5511364d5939fc0394295d9"
+SRC_URI[sha256sum] = "990d8ac71a5e7045c8ad6c66353f6a0dcbf5537ab323295e31bd795b043aa916"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============5778292630825759397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 318 [default] to 319 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "318" to "319"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 318 [default] to 319 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "318" to "319"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 318 [default] to 319 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "318" to "319"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 318 [default] to 319 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "318" to "319"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 318 [default] to 319 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "318" to "319"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 318 [default] to 319 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "318" to "319"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411641 to 1411758 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-318.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-319.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-318.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-319.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 318 [default] to 319 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "318" to "319"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-318.tar.gz;downloadfilename=diffoscope-318.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-319.tar.gz;downloadfilename=diffoscope-319.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 318 [default] to 319 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "318" to "319"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-318.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-319.dist-info

--===============5778292630825759397==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-318-319.patch"

RnJvbSAxOGM3MTA2NmRiN2UzNDlmZWM3MmZhOGUyMGIwZTlmNTFmZTg3Zjg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTMgSnVuIDIwMjYgMDc6NTA6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMxOCAtPiAzMTkKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzE4LmJiID0+IGRpZmZvc2NvcGVfMzE5LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMTguYmIgPT4gZGlmZm9zY29wZV8z
MTkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMxOC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMTkuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxOC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxOS5iYgppbmRleCBlODc0ZDJi
Y2U0Li4yNThkYWI5MDI3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzE4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMTkuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzEzMjYx
YzBkYTZiNmMwMmU1MjVhNmI4YTg5OGEwMGFhYmEzMmNiN2M1NTExMzY0ZDU5MzlmYzAzOTQyOTVk
OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5OTBkOGFjNzFhNWU3MDQ1YzhhZDZjNjYzNTNmNmEw
ZGNiZjU1MzdhYjMyMzI5NWUzMWJkNzk1YjA0M2FhOTE2IgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============5778292630825759397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-318.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-319.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-318.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-319.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-318.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-319.dist-info

--===============5778292630825759397==--

