Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6894CA601A
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 06:50:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2261.1791528618967175631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 23:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lhOQUf4W;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HjaaI+DF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a11f6d47fa-26aa5da1-fcd7-418b-9d28-97b070dded5f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791528618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h85ltZIgnb7cfShIdNrREELRo+WD7MgJIXY7pM+iZJo=;
	b=lhOQUf4WgsRNhHUZ8xuF0xSkzYwYxoopaXJAFrKNWxjPmvDrmQt/wYPOoHR9xM/J
	zUL8k/iQE45IkuoDvfJMF8NiPwqqheZ5jU4WJV6K51QtOHIMZOz6ZizcuJX8zaDDe4I
	ty6KjQw1wJTAO5HEfh5tfsppY5BMM+/oqxFoTe58=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791528618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h85ltZIgnb7cfShIdNrREELRo+WD7MgJIXY7pM+iZJo=;
	b=HjaaI+DFYBDKgjmx54nPtVipXOtNhneqvNEZf1FWH7fpy3awL+kjFQ10f1caGE3d
	NIG3TSzHhrtU/KX7ldQ4fa1mJpRO/A1XTsZAhsxQgJnjfpKdoZU7qLU2eMZvaReY65+
	iaqTBVRz6xGWTvszilOGDsdVFVvqD1iSLTRa79xg=
Content-Type: multipart/mixed; boundary="===============9203854663842935099=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 3.0.8 SUCCEEDED
Message-ID: <010101a11f6d47fa-26aa5da1-fcd7-418b-9d28-97b070dded5f-000000@us-west-2.amazonses.com>
Date: Fri, 9 Oct 2026 06:50:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.09-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 06:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247457

--===============9203854663842935099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *3.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-3.0.7-3.0.8.patch
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
From f1317c6a210eb75578549339033ff5f547d0d867 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 9 Oct 2026 05:41:28 +0000
Subject: [PATCH] pkgconf: upgrade 3.0.7 -> 3.0.8

Changes from 3.0.7 to 3.0.8:
----------------------------
---
 .../pkgconf/{pkgconf_3.0.7.bb => pkgconf_3.0.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.7.bb => pkgconf_3.0.8.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
index 4579476ae4..cd55484c30 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "c926ff491cbd9a331a589160811bd97ab1749b4d5198a519338f2cdfabe6940a"
+SRC_URI[sha256sum] = "943f0bc88bcaeceb630b00262e2a8ad5ea4fac3fba72a4267d8b9ec6b35d1194"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
-- 
2.47.1


--===============9203854663842935099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: PV changed from "3.0.7" to "3.0.8"
packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.7.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.8.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 790664 to 793328 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "3.0.7" to "3.0.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "3.0.7" to "3.0.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 68209 to 68169 (-0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "3.0.7" to "3.0.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "3.0.7" to "3.0.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 573681 to 575604 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "3.0.7" to "3.0.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/3.0.7/libpkgconf -> /usr/src/debug/pkgconf/3.0.8/libpkgconf, directory renamed /usr/src/debug/pkgconf/3.0.7/cli -> /usr/src/debug/pkgconf/3.0.8/cli, directory renamed /usr/src/debug/pkgconf/3.0.7/cli/spdxtool -> /usr/src/debug/pkgconf/3.0.8/cli/spdxtool, directory renamed /usr/src/debug/pkgconf/3.0.7/cli/bomtool -> /usr/src/debug/pkgconf/3.0.8/cli/bomtool, directory renamed /usr/src/debug/pkgconf/3.0.7/cli/pccritic -> /usr/src/debug/pkgconf/3.0.8/cli/pccritic
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "3.0.7" to "3.0.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "3.0.7" to "3.0.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 3.0.7 [default] to 3.0.8 [default]
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============9203854663842935099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pkgconf-changelog.txt"

Changes from 3.0.7 to 3.0.8:
----------------------------

--===============9203854663842935099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============9203854663842935099==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-3.0.7-3.0.8.patch"

RnJvbSBmMTMxN2M2YTIxMGViNzU1Nzg1NDkzMzkwMzNmZjVmNTQ3ZDBkODY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgOSBPY3QgMjAyNiAwNTo0MToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMy4wLjcgLT4gMy4wLjgKCkNoYW5nZXMgZnJvbSAzLjAuNyB0byAzLjAu
ODoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotLS0KIC4uLi9wa2djb25mL3twa2djb25m
XzMuMC43LmJiID0+IHBrZ2NvbmZfMy4wLjguYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzMuMC43LmJiID0+IHBrZ2NvbmZfMy4wLjgu
YmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8zLjAuNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMy4w
LjguYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAuOC5iYgppbmRleCA0NTc5NDc2YWU0Li5jZDU1NDg0YzMw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC43
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjguYmIK
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3BrZy1jb25maWctbmF0
aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJjOTI2ZmY0OTFjYmQ5YTMzMWE1ODkxNjA4MTFiZDk3YWIxNzQ5YjRkNTE5OGE1
MTkzMzhmMmNkZmFiZTY5NDBhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk0M2YwYmM4OGJjYWVj
ZWI2MzBiMDAyNjJlMmE4YWQ1ZWE0ZmFjM2ZiYTcyYTQyNjdkOGI5ZWM2YjM1ZDExOTQiCiBVUFNU
UkVBTV9DSEVDS19SRUdFWCA9ICJwa2djb25mLSg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxk
KylcLnRhciIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnCi0tIAoyLjQ3LjEKCg==

--===============9203854663842935099==--

