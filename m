Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF99C54E73
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1266.1710522010923857241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NXHij65O;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rAGQV+E/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e430e8cf6-c2829f9c-de48-4980-b833-e1faf5742b6f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2zMsJ1QfXEFGqSlaKWA0FDcYb2FSt7wssY7uBHapJ5I=;
	b=NXHij65OQ/4uFVn5uWN1P+yTD6dIlwp1VBxxcCUoGzL+V2wIWh7Ylq2sh3RhEtQ6
	HimIGlOWSChRczx+2juaRysmwWzY34P47CexpupXYCLx/DOtmYYq7jdbkyRPeouGj2D
	lk6sB5Q8/TTOhVv7I2gsh083xPHFCfPXpeJi1s3A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2zMsJ1QfXEFGqSlaKWA0FDcYb2FSt7wssY7uBHapJ5I=;
	b=rAGQV+E/tFmEHq781OF3yWEIy+78dsAS917JBv934+45pT3k5M35622hB5729s1n
	hSBjriA7iG3Ji/aK6EgBdeqRZp37laO5OI6kXJT0FJ57MIYLvGaIXOHeYdjmuLxqPLt
	Ska3C7LCfKy30fNaJzrZhf/SGbfiTZMVyPZS4oyA=
Content-Type: multipart/mixed; boundary="===============9040018931592453310=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.0.9 SUCCEEDED
Message-ID: <0101018e430e8cf6-c2829f9c-de48-4980-b833-e1faf5742b6f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197155

--===============9040018931592453310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *3.0.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.0.8-3.0.9.patch
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
From 87493da7bf13b178cbfa713f1ae3674f7a0c414c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 07:57:27 +0000
Subject: [PATCH] python3-cython: upgrade 3.0.8 -> 3.0.9

---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../python/{python3-cython_3.0.8.bb => python3-cython_3.0.9.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.8.bb => python3-cython_3.0.9.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index e54926ae6d..2235aa9332 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "8333423d8fd5765e7cceea3a9985dd1e0a5dfeb2734629e1a2ed2d6233d39de6"
+SRC_URI[sha256sum] = "a2d354f059d1f055d34cfaa62c5b68bc78ac2ceab6407148d47fb508cf3ba4f3"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.8.bb b/meta/recipes-devtools/python/python3-cython_3.0.9.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_3.0.8.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.9.bb
-- 
2.42.0


--===============9040018931592453310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cython: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-64-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-3.0.8.tar.gz;downloadfilename=Cython-3.0.8.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-3.0.9.tar.gz;downloadfilename=Cython-3.0.9.tar.gz"
packages/core2-64-poky-linux/python3-cython: PV changed from "3.0.8" to "3.0.9"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27665304 to 27683488 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.0.8" to "3.0.9"
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.0.8" to "3.0.9"
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.0.8" to "3.0.9"
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.0.8" to "3.0.9"
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 22890639 to 22908552 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PV changed from "3.0.8" to "3.0.9"
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.0.8" to "3.0.9"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14562323 to 14573139 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGV changed from 3.0.8 [default] to 3.0.9 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: PV changed from "3.0.8" to "3.0.9"
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info moved to /usr/lib/python3.12/site-packages/Cython-3.0.9.dist-info

--===============9040018931592453310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info moved to /usr/lib/python3.12/site-packages/Cython-3.0.9.dist-info

--===============9040018931592453310==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.0.8-3.0.9.patch"

RnJvbSA4NzQ5M2RhN2JmMTNiMTc4Y2JmYTcxM2YxYWUzNjc0ZjdhMGM0MTRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDc6NTc6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjAuOCAtPiAzLjAuOQoKLS0tCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24uaW5jICAgICAgICAgICAgICAgICAgfCAyICst
CiAuLi4vcHl0aG9uL3tweXRob24zLWN5dGhvbl8zLjAuOC5iYiA9PiBweXRob24zLWN5dGhvbl8z
LjAuOS5iYn0gfCAwCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jeXRob25f
My4wLjguYmIgPT4gcHl0aG9uMy1jeXRob25fMy4wLjkuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWN5dGhvbi5pbmMgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24uaW5jCmluZGV4IGU1NDkyNmFlNmQu
LjIyMzVhYTkzMzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uLWN5dGhvbi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24t
Y3l0aG9uLmluYwpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRS50eHQ7bWQ1PTYxYzNlZTg5NjE1NzU4NjFmYTg2YzdlNjJiYzlmNjljIgogUFlQSV9QQUNL
QUdFID0gIkN5dGhvbiIKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjgzMzM0MjNkOGZkNTc2NWU3Y2NlZWEzYTk5ODVkZDFlMGE1ZGZl
YjI3MzQ2MjllMWEyZWQyZDYyMzNkMzlkZTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTJkMzU0
ZjA1OWQxZjA1NWQzNGNmYWE2MmM1YjY4YmM3OGFjMmNlYWI2NDA3MTQ4ZDQ3ZmI1MDhjZjNiYTRm
MyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIkN5dGhvbi0oP1A8cHZlcj4uKilcLnRhciIKIAog
aW5oZXJpdCBweXBpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3l0aG9uXzMuMC44LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWN5dGhvbl8zLjAuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjAuOC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjAuOS5iYgot
LSAKMi40Mi4wCgo=

--===============9040018931592453310==--

