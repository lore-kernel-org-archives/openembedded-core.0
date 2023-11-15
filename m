Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5702BC5AD4C
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:16 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.14621.1700059029845022459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HxJ4BDV3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NOUGodb7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018bd36a2ee0-5932484f-2399-42dd-b10f-e70fdeacd000-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yM4ggJd6MXSSIZjAEH0jgFqBE4UrT8yfZEZAJgLojyw=;
	b=HxJ4BDV3GeowAjg9tJICV83boKLwJ1RyeWlj4Wm9yK84eOJuMWjaCN4d7vPPUQ3a
	4HEDnERuMVdPJ5y9LOpw40GLBWrPdNmVD2cUOPvv7aWB5TTCvHY+9orUM94hLMWrrfC
	nzRb11TJG99yLdOXRf9Eien5iu+ZIAZbG8fgGXno=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yM4ggJd6MXSSIZjAEH0jgFqBE4UrT8yfZEZAJgLojyw=;
	b=NOUGodb7Dcvt/d7YY0dUhWIhFxALMXEcj44vGw2T8LmrM3Ut+vPG5s7pah0Kpx2m
	k8tBazvK6yX94iec9atPcdtuMvS803hQJM7U0HCHgM2cf3C0avGq941wXFG7QuaCslN
	xXOrsz6txIRMTLUduEDOzvmO6/+It2oEehf7wO/I=
Content-Type: multipart/mixed; boundary="===============5916079815927895815=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 251 SUCCEEDED
Message-ID: <0101018bd36a2ee0-5932484f-2399-42dd-b10f-e70fdeacd000-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190716

--===============5916079815927895815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *251* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-249-251.patch
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
From e4f65aaa3b9f8007e0768c9ac6f454990d22f5f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 13:55:17 +0000
Subject: [PATCH] diffoscope: upgrade 249 -> 251

---
 .../diffoscope/{diffoscope_249.bb => diffoscope_251.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_249.bb => diffoscope_251.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_249.bb b/meta/recipes-support/diffoscope/diffoscope_251.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_249.bb
rename to meta/recipes-support/diffoscope/diffoscope_251.bb
index b679103694..8862509e05 100644
--- a/meta/recipes-support/diffoscope/diffoscope_249.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_251.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "bc4d8cb3198025013784ef7e3fa61b7a642de39e5b790c45d7c29d153306fbdd"
+SRC_URI[sha256sum] = "c9ba2fc24379b2ba4457dc7be6970884cc2ee94c20d44f3889c2a4741e6178d3"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.39.2


--===============5916079815927895815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 50 skipped, 0 masked, 0 errors.
Removing 150 recipes from the core2-64 sysroot...done.
Removing 173 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============5916079815927895815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "249" to "251"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 249 [default] to 251 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "249" to "251"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 249 [default] to 251 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "249" to "251"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 249 [default] to 251 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "249" to "251"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 249 [default] to 251 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "249" to "251"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 249 [default] to 251 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "249" to "251"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 249 [default] to 251 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411418 to 1413735 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "249" to "251"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 249 [default] to 251 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-249.tar.gz;downloadfilename=diffoscope-249.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-251.tar.gz;downloadfilename=diffoscope-251.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "249" to "251"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 249 [default] to 251 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-249.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-251.dist-info

--===============5916079815927895815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-249.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-251.dist-info

--===============5916079815927895815==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-249-251.patch"

RnJvbSBlNGY2NWFhYTNiOWY4MDA3ZTA3NjhjOWFjNmY0NTQ5OTBkMjJmNWYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTM6NTU6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI0OSAtPiAyNTEKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjQ5LmJiID0+IGRpZmZvc2NvcGVfMjUxLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNDkuYmIgPT4gZGlmZm9zY29wZV8y
NTEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI0OS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNTEuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI0OS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI1MS5iYgppbmRleCBiNjc5MTAz
Njk0Li44ODYyNTA5ZTA1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjQ5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNTEuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYmM0ZDhjYjMxOTgwMjUwMTM3ODRlZjdlM2ZhNjFiN2E2NDJkZTM5ZTViNzkwYzQ1ZDdj
MjlkMTUzMzA2ZmJkZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjOWJhMmZjMjQzNzliMmJhNDQ1
N2RjN2JlNjk3MDg4NGNjMmVlOTRjMjBkNDRmMzg4OWMyYTQ3NDFlNjE3OGQzIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjM5LjIKCg==

--===============5916079815927895815==--

