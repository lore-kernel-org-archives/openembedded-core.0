Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3606EC47DDB
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.63136.1702649863339255368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U0vmuDhW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lsH+1fD+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c6dd7300c-08211ad1-2c44-4b39-812a-267a3b53660c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xVEpHScaUWf0TyHQL4EvVdj3i3TW81I4XhoaHfiA2Ao=;
	b=U0vmuDhWn8eIyfOe3Kl6yZKfTYJHXxcsPJM1NnmrYaGe2crO2OKUZRiig9DLNKJK
	PyF98h6YJRBHA4q/zPrLImw4QwhEH2u4CVZHLmk77pOaDNc7Fv/XcM2sVNQGyIA0rIY
	nQyUU295j334vLePmM5vOIwibPe46NEOmDWtHZ/o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xVEpHScaUWf0TyHQL4EvVdj3i3TW81I4XhoaHfiA2Ao=;
	b=lsH+1fD+QFN2ePiMMWfbGzTMFCW7df3HsNM71TPY18owU7AOANr8scqJXSdteopu
	1FxTMpEWA409FmeoZBMhNyJfOzVmXIRkxxD7oLhKIDeY31cwB+kIdtczcB0rvR8eZ6Y
	tePYeiPds6cCTwHrD09BBdcjgVFk5lbRX2sHhtRA=
Content-Type: multipart/mixed; boundary="===============7476163070307576296=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 253 SUCCEEDED
Message-ID: <0101018c6dd7300c-08211ad1-2c44-4b39-812a-267a3b53660c-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192516

--===============7476163070307576296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *253* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-252-253.patch
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
From ad2cebf05c9da489ae3019b963d2b92064746b6d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 13:35:52 +0000
Subject: [PATCH] diffoscope: upgrade 252 -> 253

---
 .../diffoscope/{diffoscope_252.bb => diffoscope_253.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_252.bb => diffoscope_253.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_252.bb b/meta/recipes-support/diffoscope/diffoscope_253.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_252.bb
rename to meta/recipes-support/diffoscope/diffoscope_253.bb
index 86dc85df83..a1fc63efc3 100644
--- a/meta/recipes-support/diffoscope/diffoscope_252.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_253.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e268384fa484f3dd8a936da626e6ef1b231dcb286d09a360f37548637f8dd46d"
+SRC_URI[sha256sum] = "ca3d826b691f4998d6de28a016b3555d56a7283b97ad92944ce643ea6e7eb614"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.42.0


--===============7476163070307576296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 49 skipped, 0 masked, 0 errors.
Removing 99 recipes from the core2-64 sysroot...done.
Removing 126 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============7476163070307576296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 252 [default] to 253 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "252" to "253"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 252 [default] to 253 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "252" to "253"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 252 [default] to 253 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "252" to "253"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 252 [default] to 253 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "252" to "253"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 252 [default] to 253 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "252" to "253"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 252 [default] to 253 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "252" to "253"
packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-252.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-253.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/7z.py /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/7z.cpython-311.pyc"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 252 [default] to 253 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "252" to "253"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1414083 to 1421975 (+1%)
packages/core2-64-poky-linux/diffoscope: PKGV changed from 252 [default] to 253 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "252" to "253"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-252.tar.gz;downloadfilename=diffoscope-252.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-253.tar.gz;downloadfilename=diffoscope-253.tar.gz"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-252.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-253.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/7z.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/7z.cpython-311.pyc was added

--===============7476163070307576296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-252.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-253.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/7z.py /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/7z.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-252.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-253.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/7z.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/7z.cpython-311.pyc was added

--===============7476163070307576296==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-252-253.patch"

RnJvbSBhZDJjZWJmMDVjOWRhNDg5YWUzMDE5Yjk2M2QyYjkyMDY0NzQ2YjZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMTM6MzU6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI1MiAtPiAyNTMKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjUyLmJiID0+IGRpZmZvc2NvcGVfMjUzLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNTIuYmIgPT4gZGlmZm9zY29wZV8y
NTMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI1Mi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNTMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI1Mi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI1My5iYgppbmRleCA4NmRjODVk
ZjgzLi5hMWZjNjNlZmMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjUyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNTMuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZTI2ODM4NGZhNDg0ZjNkZDhhOTM2ZGE2MjZlNmVmMWIyMzFkY2IyODZkMDlhMzYwZjM3
NTQ4NjM3ZjhkZDQ2ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjYTNkODI2YjY5MWY0OTk4ZDZk
ZTI4YTAxNmIzNTU1ZDU2YTcyODNiOTdhZDkyOTQ0Y2U2NDNlYTZlN2ViNjE0IgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQyLjAKCg==

--===============7476163070307576296==--

