Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA5CCD98F7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:51 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50418.1781195502152309190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HWtBfX3K;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KbC+7+xA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb78678d6-a67be9f5-b271-462c-8a33-f81745bbfa0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k7BRtgQrtPdyZiFlj5k2YrbcXaxY+LfSZHABibsPYwo=;
	b=HWtBfX3KOFHPqcA5U43okn9gb8mWQupztF4LD/AeHuYf9iPeyT+34XM2a0vVCszd
	/jgINVsrwG2IDYMMDqB80j96MhcaDR4yRzs6qZNPsdCGoPxwH40GPijdqn92OokQ2Lk
	8S4yd82pEanLY9EFtEQvg69yTJ2VssUWelNU21yk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k7BRtgQrtPdyZiFlj5k2YrbcXaxY+LfSZHABibsPYwo=;
	b=KbC+7+xAhm3Q2pBNX4SKwS/Eq1k+8cocLqdzqOv8f7GTyN1cJMoD3fIdW8tO+NVp
	k5hXxOcUGSDg8hv95uC5WkObo4LRrhg4v4lvpo/ieTDd5e1Yx+wfpmA+Cm4h/7AuUnW
	Ol0Rdfd2xVJvNKfm8MGICdWARh2Ir+IH/pxWPvoI=
Content-Type: multipart/mixed; boundary="===============1913764309171835127=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.23 SUCCEEDED
Message-ID: <0101019eb78678d6-a67be9f5-b271-462c-8a33-f81745bbfa0f-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238485

--===============1913764309171835127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-docutils* to *0.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.22.4-0.23.patch
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
From 006bf6a34fe247694941d8ed6c064fa49adfd1a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:24:27 +0000
Subject: [PATCH] python3-docutils: upgrade 0.22.4 -> 0.23

---
 .../{python3-docutils_0.22.4.bb => python3-docutils_0.23.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.22.4.bb => python3-docutils_0.23.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb b/meta/recipes-devtools/python/python3-docutils_0.23.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-docutils_0.22.4.bb
rename to meta/recipes-devtools/python/python3-docutils_0.23.bb
index 571a19a958..91592d470c 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.23.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
 
-SRC_URI[sha256sum] = "4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968"
+SRC_URI[sha256sum] = "746f5060322511280a1e50eb76846ed6bf2342984b2ac04dc42caa1a8d78799e"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============1913764309171835127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-docutils: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.22.4.tar.gz;downloadfilename=docutils-0.22.4.tar.gz" to "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.23.tar.gz;downloadfilename=docutils-0.23.tar.gz"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGSIZE changed from 4503201 to 4520999 (+0%)
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: FILELIST: directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info, directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PV changed from "0.22.4" to "0.23"
Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/COPYING.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/BSD-0-Clause.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/BSD-2-Clause.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/gpl-3-0.txt was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/COPYING.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/BSD-0-Clause.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/BSD-2-Clause.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/gpl-3-0.txt was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/WHEEL was removed

--===============1913764309171835127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: FILELIST: directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info, directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses, directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/COPYING.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/BSD-0-Clause.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/BSD-2-Clause.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/gpl-3-0.txt was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/COPYING.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/BSD-0-Clause.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/BSD-2-Clause.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/gpl-3-0.txt was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/WHEEL was removed

--===============1913764309171835127==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.22.4-0.23.patch"

RnJvbSAwMDZiZjZhMzRmZTI0NzY5NDk0MWQ4ZWQ2YzA2NGZhNDlhZGZkMWEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6MjQ6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRvY3V0aWxzOiB1cGdyYWRlIDAuMjIuNCAtPiAwLjIzCgotLS0KIC4uLi97cHl0aG9u
My1kb2N1dGlsc18wLjIyLjQuYmIgPT4gcHl0aG9uMy1kb2N1dGlsc18wLjIzLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZG9jdXRpbHNfMC4yMi40LmJi
ID0+IHB5dGhvbjMtZG9jdXRpbHNfMC4yMy5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4yMi40LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjMuYmIKc2ltaWxhcml0
eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWRvY3V0aWxzXzAuMjIuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjMuYmIKaW5kZXggNTcxYTE5YTk1OC4uOTE1OTJkNDcw
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRvY3V0
aWxzXzAuMjIuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
ZG9jdXRpbHNfMC4yMy5iYgpAQCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24i
CiBMSUNFTlNFID0gIkNDMC0xLjAgJiBCU0QtMi1DbGF1c2UgJiBHUEwtMy4wLW9ubHkiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLnJzdDttZDU9Y2U0NjdiMDRiMzVjN2FjMzQy
OWI2OTA4ZmM4YjMxOGUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZGI1M2IxZmRlOWFiZWNi
Yjc0ZDkxMjMwZDMyYWI2MjZkOTRmNmJhZGZjNTc1ZDZkYjkxOTRhNDlkZjI5OTY4IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjc0NmY1MDYwMzIyNTExMjgwYTFlNTBlYjc2ODQ2ZWQ2YmYyMzQyOTg0
YjJhYzA0ZGM0MmNhYTFhOGQ3ODc5OWUiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3Jl
CiAKLS0gCjIuNDcuMQoK

--===============1913764309171835127==--

