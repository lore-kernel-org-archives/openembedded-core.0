Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C50C5DF9C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 05:25:50 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1646.1787376342870728044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 22:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B4A5O7/N;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A2098v6T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a027ee9365-3a243e61-1c23-4351-b9b7-c610a2194e57-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787376342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ba7F+qftIfPSzWndmOzxWAbe0a52sU4ScE4iOUJvJZI=;
	b=B4A5O7/NEa77T0JTfSeCxcDHykU2wEkkcxVhkkBC+M9bseRSYj8nRBHHWSnWDuXb
	McO8NqGcTiGpQeh7HV/HRnlt367+FaZAFUD6ZyX76MxlkjkH+NOAHwO8gBD2IEVWn2O
	Yyu0i7GVgqXLb0QQYnliLd8N6AEU7q9W4KKcDG5Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787376342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ba7F+qftIfPSzWndmOzxWAbe0a52sU4ScE4iOUJvJZI=;
	b=A2098v6T+SfApEr2MhdN6pwJEzb2DSc3aH7G/8fnd7YX7f2h1YXvbIJsPF+6xEEj
	yxwiqaXeFvmFm4zFAFvN2TST46fze7iQWQBeEWxcVU4ptXuGOwJaZOrOiH62JcPchat
	wTNAt3aGUxzsc0rVIh9xWuleLU4sWLaiImeEaJMk=
Content-Type: multipart/mixed; boundary="===============2276916353929644253=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 329 SUCCEEDED
Message-ID: <010101a027ee9365-3a243e61-1c23-4351-b9b7-c610a2194e57-000000@us-west-2.amazonses.com>
Date: Sat, 22 Aug 2026 05:25:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.22-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 05:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243967

--===============2276916353929644253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *329* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-328-329.patch
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
From 57df4fff13027c3acea234e22ff254622d6c8f84 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 22 Aug 2026 05:25:36 +0000
Subject: [PATCH] diffoscope: upgrade 328 -> 329

---
 .../diffoscope/{diffoscope_328.bb => diffoscope_329.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_328.bb => diffoscope_329.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_328.bb b/meta/recipes-support/diffoscope/diffoscope_329.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_328.bb
rename to meta/recipes-support/diffoscope/diffoscope_329.bb
index 7b4bd7640b..f803321631 100644
--- a/meta/recipes-support/diffoscope/diffoscope_328.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_329.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8480ddffa8cc4860c6ada3c9c80a8169e75d6a39ad971662851f1ad776512870"
+SRC_URI[sha256sum] = "940ee30d8d98231f4d4855e36caf96e9eec9ec3d3cb359b744687b369b2b54d9"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============2276916353929644253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 328 [default] to 329 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "328" to "329"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 328 [default] to 329 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "328" to "329"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 328 [default] to 329 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "328" to "329"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 328 [default] to 329 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "328" to "329"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 328 [default] to 329 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "328" to "329"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 328 [default] to 329 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "328" to "329"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 328 [default] to 329 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-328.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-329.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-328.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-329.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "328" to "329"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 328 [default] to 329 [default]
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-328.tar.gz;downloadfilename=diffoscope-328.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-329.tar.gz;downloadfilename=diffoscope-329.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "328" to "329"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-328.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-329.dist-info

--===============2276916353929644253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-328.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-329.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-328.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-329.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-328.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-329.dist-info

--===============2276916353929644253==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-328-329.patch"

RnJvbSA1N2RmNGZmZjEzMDI3YzNhY2VhMjM0ZTIyZmYyNTQ2MjJkNmM4Zjg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjIgQXVnIDIwMjYgMDU6MjU6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMyOCAtPiAzMjkKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzI4LmJiID0+IGRpZmZvc2NvcGVfMzI5LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMjguYmIgPT4gZGlmZm9zY29wZV8z
MjkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMyOC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyOC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyOS5iYgppbmRleCA3YjRiZDc2
NDBiLi5mODAzMzIxNjMxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzI4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMjkuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODQ4MGRk
ZmZhOGNjNDg2MGM2YWRhM2M5YzgwYTgxNjllNzVkNmEzOWFkOTcxNjYyODUxZjFhZDc3NjUxMjg3
MCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NDBlZTMwZDhkOTgyMzFmNGQ0ODU1ZTM2Y2FmOTZl
OWVlYzllYzNkM2NiMzU5Yjc0NDY4N2IzNjliMmI1NGQ5IgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============2276916353929644253==--

