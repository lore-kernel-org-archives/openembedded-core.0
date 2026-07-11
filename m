Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA57C44506
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 06:06:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.260.1783749982919246467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 23:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pSezjD/K;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kIEmC+wU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f4fc8b7ce-a1bbe326-a243-4573-885c-a5194e1d8fb0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783749982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y1Fkkq0gf1RoCTUkef0FNqyVVnuSePR3EzQt89/CJfw=;
	b=pSezjD/KaM0IjT+YRk+vyB9VAeYTuqa+4veg7Yy8uora4OiRSPVwQX6q27QbKY7a
	35KPWEZYEMVWxJ7d3grbrSiRUMMvWaaoB49Ul5ZCoyJxfa00wbNu3NW/aVNZDRijAz3
	BhGXM38PNnPLOkVVReVsD+QxGIFwysaw1VCsyTfc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783749982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y1Fkkq0gf1RoCTUkef0FNqyVVnuSePR3EzQt89/CJfw=;
	b=kIEmC+wUAP3HrcLV9vURqwnBpNRYY8IPmoC6+2Q+djP5d7G9vU3YgBLf+rBIYS7Q
	f/OYXqRq3zY1wKN3wdu4LN0FPC8yTVZV/H+2izXXVIM3fZ6ce+2f1w+d9eJUaccrOtT
	IoS3U5Rfn0E8CR7hz1QgQkvKlZcwlJfaxBeD+waA=
Content-Type: multipart/mixed; boundary="===============6840379884113866763=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 324 SUCCEEDED
Message-ID: <0101019f4fc8b7ce-a1bbe326-a243-4573-885c-a5194e1d8fb0-000000@us-west-2.amazonses.com>
Date: Sat, 11 Jul 2026 06:06:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 06:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240703

--===============6840379884113866763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *324* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-323-324.patch
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
From 9161b0d0d75e5b30b77a5545ae9941c73e87933d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 11 Jul 2026 05:42:20 +0000
Subject: [PATCH] diffoscope: upgrade 323 -> 324

---
 .../diffoscope/{diffoscope_323.bb => diffoscope_324.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_323.bb => diffoscope_324.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_323.bb b/meta/recipes-support/diffoscope/diffoscope_324.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_323.bb
rename to meta/recipes-support/diffoscope/diffoscope_324.bb
index dcc144775d..822446e985 100644
--- a/meta/recipes-support/diffoscope/diffoscope_323.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_324.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "28a1bff945de1d160efff07200f1d79e7890320913e1871f114bb697a52dbfcd"
+SRC_URI[sha256sum] = "daf539d33140ecd4c5dcf18c894bbc09aeab5307b44de28b12ca34434d47c5ba"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============6840379884113866763==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-323-324.patch"

RnJvbSA5MTYxYjBkMGQ3NWU1YjMwYjc3YTU1NDVhZTk5NDFjNzNlODc5MzNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTEgSnVsIDIwMjYgMDU6NDI6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMyMyAtPiAzMjQKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzIzLmJiID0+IGRpZmZvc2NvcGVfMzI0LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMjMuYmIgPT4gZGlmZm9zY29wZV8z
MjQuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMyMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyMy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyNC5iYgppbmRleCBkY2MxNDQ3
NzVkLi44MjI0NDZlOTg1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzIzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMjQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjhhMWJm
Zjk0NWRlMWQxNjBlZmZmMDcyMDBmMWQ3OWU3ODkwMzIwOTEzZTE4NzFmMTE0YmI2OTdhNTJkYmZj
ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkYWY1MzlkMzMxNDBlY2Q0YzVkY2YxOGM4OTRiYmMw
OWFlYWI1MzA3YjQ0ZGUyOGIxMmNhMzQ0MzRkNDdjNWJhIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============6840379884113866763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-323.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-324.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-323.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-324.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-323.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-324.dist-info

--===============6840379884113866763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "323" to "324"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 323 [default] to 324 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "323" to "324"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 323 [default] to 324 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "323" to "324"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 323 [default] to 324 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "323" to "324"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 323 [default] to 324 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "323" to "324"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 323 [default] to 324 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "323" to "324"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 323 [default] to 324 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1412475 to 1413133 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "323" to "324"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-323.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-324.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-323.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-324.dist-info
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 323 [default] to 324 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "323" to "324"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-323.tar.gz;downloadfilename=diffoscope-323.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-324.tar.gz;downloadfilename=diffoscope-324.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 323 [default] to 324 [default]
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-323.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-324.dist-info

--===============6840379884113866763==--

