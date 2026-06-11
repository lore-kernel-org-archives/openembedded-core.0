Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B74CD98E1
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50432.1781195513269909905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lfFBoQB+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3GD5Zl3f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019eb786cabd-917827bc-665b-4bcb-a7c3-30629c2e867e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195524;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=idvkVASKexd8GAFlmfvEshGtFF9FTaYV6deZCgx8uOo=;
	b=lfFBoQB+MdU3O7+jrQkrH8PSrvwKAHf8wW/apUdR168Kl2Cg4SlT5s2UcalkqIGS
	ynz6jM8FO45lk1Y0gmhZG9Ze5JG5iWAWxCKtzv4twVMtN5eKH6uDhiLwc5MkIgpHBZd
	9IE3YjTMhQX/baEaGdD34X+V8XQ3oo8/BRR3A8n0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195524;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=idvkVASKexd8GAFlmfvEshGtFF9FTaYV6deZCgx8uOo=;
	b=3GD5Zl3fD8pvh9zcd5VnANmcWGEAm9OHSDdOtZwJ1PJwokkgV1V8z1mzblLF7wTQ
	ZN5KQ3i9ruarA+JjVYXLb6cp+qKfyQNTZngEHVNu8/UMU0ZMF4J7Ptx1Pz1dQA/lR7g
	xUA49FZDQhm1CiJYNrCulY3BM6VplSfygU0JgTjc=
Content-Type: multipart/mixed; boundary="===============5920876295104693381=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libusb1: upgrading to 1.0.30 SUCCEEDED
Message-ID: <0101019eb786cabd-917827bc-665b-4bcb-a7c3-30629c2e867e-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238575

--===============5920876295104693381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libusb1* to *1.0.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libusb1-upgrade-1.0.29-1.0.30.patch
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
From 080b4465ce6619907804b1ba7f60f06f3328ffb1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 15:58:34 +0000
Subject: [PATCH] libusb1: upgrade 1.0.29 -> 1.0.30

---
 .../libusb/{libusb1_1.0.29.bb => libusb1_1.0.30.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.29.bb => libusb1_1.0.30.bb} (93%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes-support/libusb/libusb1_1.0.30.bb
similarity index 93%
rename from meta/recipes-support/libusb/libusb1_1.0.29.bb
rename to meta/recipes-support/libusb/libusb1_1.0.30.bb
index 856e32d1c6..caac5ceb57 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.30.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85"
+SRC_URI[sha256sum] = "fea36f34f9156400209595e300840767ab1a385ede1dc7ee893015aea9c6dbaf"
 
 S = "${UNPACKDIR}/libusb-${PV}"
 
-- 
2.47.1


--===============5920876295104693381==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libusb1-upgrade-1.0.29-1.0.30.patch"

RnJvbSAwODBiNDQ2NWNlNjYxOTkwNzgwNGIxYmE3ZjYwZjA2ZjMzMjhmZmIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTU6NTg6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1c2IxOiB1cGdyYWRlIDEuMC4yOSAtPiAxLjAuMzAKCi0tLQogLi4uL2xpYnVzYi97bGlidXNi
MV8xLjAuMjkuYmIgPT4gbGlidXNiMV8xLjAuMzAuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlidXNiL3tsaWJ1c2IxXzEuMC4yOS5iYiA9PiBsaWJ1c2IxXzEuMC4z
MC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2IvbGli
dXNiMV8xLjAuMjkuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2IvbGlidXNiMV8xLjAu
MzAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGlidXNiL2xpYnVzYjFfMS4wLjI5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJ1c2IvbGlidXNiMV8xLjAuMzAuYmIKaW5kZXggODU2ZTMyZDFjNi4uY2FhYzVjZWI1NyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXNiL2xpYnVzYjFfMS4wLjI5LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVzYi9saWJ1c2IxXzEuMC4zMC5iYgpAQCAt
MTksNyArMTksNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQ
Vn0vbGlidXNiLSR7UFZ9LnRhci5iejIgXAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9saWJ1c2IvbGlidXNiL3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAi
cmVsZWFzZXMvdGFnL3Y/KD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjU5NzdmYzk1MGY4ZDEzOTVjY2VhOWJkNDhjMDZiM2Y4MDhmZDNjMmM5NjFiNDRiMGMy
ZTZlMjlmYzNhNzBhODUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmVhMzZmMzRmOTE1NjQwMDIw
OTU5NWUzMDA4NDA3NjdhYjFhMzg1ZWRlMWRjN2VlODkzMDE1YWVhOWM2ZGJhZiIKIAogUyA9ICIk
e1VOUEFDS0RJUn0vbGlidXNiLSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============5920876295104693381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libusb1: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1: SRC_URI changed from "https://github.com/libusb/libusb/releases/download/v1.0.29/libusb-1.0.29.tar.bz2 file://run-ptest" to "https://github.com/libusb/libusb/releases/download/v1.0.30/libusb-1.0.30.tar.bz2 file://run-ptest"
packages/x86-64-v3-poky-linux/libusb1: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-dbg: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-dbg: PKGSIZE changed from 427832 to 439192 (+3%)
packages/x86-64-v3-poky-linux/libusb1/libusb1-dbg: FILELIST: removed "/usr/lib/.debug/libusb-1.0.so.0.5.0", added "/usr/lib/.debug/libusb-1.0.so.0.6.0"
packages/x86-64-v3-poky-linux/libusb1/libusb1-dbg: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-dev: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-dev: PKGSIZE changed from 86610 to 88054 (+2%)
packages/x86-64-v3-poky-linux/libusb1/libusb1-dev: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-doc: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-doc: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-locale: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-locale: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-ptest: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-ptest: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-src: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-src: PKGSIZE changed from 566896 to 582671 (+3%)
packages/x86-64-v3-poky-linux/libusb1/libusb1-src: FILELIST: directory renamed /usr/src/debug/libusb1/1.0.29/libusb -> /usr/src/debug/libusb1/1.0.30/libusb, directory renamed /usr/src/debug/libusb1/1.0.29/tests -> /usr/src/debug/libusb1/1.0.30/tests, directory renamed /usr/src/debug/libusb1/1.0.29/libusb/os -> /usr/src/debug/libusb1/1.0.30/libusb/os
packages/x86-64-v3-poky-linux/libusb1/libusb1-src: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-staticdev: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-staticdev: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1: FILELIST: removed "/usr/lib/libusb-1.0.so.0.5.0", added "/usr/lib/libusb-1.0.so.0.6.0"
packages/x86-64-v3-poky-linux/libusb1/libusb1: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
Changes to packages/x86-64-v3-poky-linux/libusb1 (sysroot):
  /usr/lib/libusb-1.0.so.0 changed symlink target from libusb-1.0.so.0.5.0 to libusb-1.0.so.0.6.0
  /usr/lib/libusb-1.0.so changed symlink target from libusb-1.0.so.0.5.0 to libusb-1.0.so.0.6.0
  /usr/lib/libusb-1.0.so.0.5.0 moved to /usr/lib/libusb-1.0.so.0.6.0

--===============5920876295104693381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libusb1/libusb1: FILELIST: removed "/usr/lib/libusb-1.0.so.0.5.0", added "/usr/lib/libusb-1.0.so.0.6.0"
Changes to packages/x86-64-v3-poky-linux/libusb1 (sysroot):
  /usr/lib/libusb-1.0.so.0 changed symlink target from libusb-1.0.so.0.5.0 to libusb-1.0.so.0.6.0
  /usr/lib/libusb-1.0.so changed symlink target from libusb-1.0.so.0.5.0 to libusb-1.0.so.0.6.0
  /usr/lib/libusb-1.0.so.0.5.0 moved to /usr/lib/libusb-1.0.so.0.6.0

--===============5920876295104693381==--

