Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91309C3ABC4
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1771.1746113606695801833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CfpsH2ZA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Jj5aN7Aj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101968c7b6453-9c93b44c-3161-4602-b858-d90f0584c0e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113619;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iaYtCQDtwj2ZEAX0tAilcVFmJpk5mNLKLxZQBYLP4+k=;
	b=CfpsH2ZARZUMHm7haV55qP+sQXbwzXgYGHK3GVT2qypqi/hnxI4YZvqj1zr6+2fh
	gok0s+bwXHVmDSUAEiCHJT+d1R4SYINnEMCp93auOqkE7dB2W6YHJsZj5bK55RNGd3u
	R70zPmZUchcdztvPF48J2BSbI6Vp0zJd0FC01js4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113619;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iaYtCQDtwj2ZEAX0tAilcVFmJpk5mNLKLxZQBYLP4+k=;
	b=Jj5aN7AjEPGGi/vYMPZ3Duwb5o8N43002OU8zoEm8omUc0KoiQmqsrYUjQK1XPWd
	KSCRTfDQ9mdq+LdepKljslwAdliABNjbUJe4k5GIrcyujZI1YNhrjAxXkIJQjk0zSGY
	/wQfYAxPu6xUyqc8anh4FiSqIcQw9sIL1m5h8Y98=
Content-Type: multipart/mixed; boundary="===============1465373976758964576=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.3.10 SUCCEEDED
Message-ID: <010101968c7b6453-9c93b44c-3161-4602-b858-d90f0584c0e0-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215817

--===============1465373976758964576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-mako* to *1.3.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.9-1.3.10.patch
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
From c3dfd256d40d17ecbf49c29e9b9599080ff57607 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 09:01:33 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.9 -> 1.3.10

---
 .../python/{python3-mako_1.3.9.bb => python3-mako_1.3.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.9.bb => python3-mako_1.3.10.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.9.bb b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.9.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.10.bb
index 83b6149337..4facce9233 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.9.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 
 
-SRC_URI[sha256sum] = "b5d65ff3462870feec922dbccf38f6efb44e5714d7b593a656be86663d8600ac"
+SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.47.1


--===============1465373976758964576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.9.tar.gz;downloadfilename=mako-1.3.9.tar.gz" to "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.10.tar.gz;downloadfilename=mako-1.3.10.tar.gz"
packages/core2-64-poky-linux/python3-mako: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-ptest: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-ptest: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-ptest: PKGSIZE changed from 352058 to 352365 (+0%)
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 639729 to 639941 (+0%)
Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/WHEEL was removed

--===============1465373976758964576==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.9-1.3.10.patch"

RnJvbSBjM2RmZDI1NmQ0MGQxN2VjYmY0OWMyOWU5Yjk1OTkwODBmZjU3NjA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwOTowMTozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFrbzogdXBncmFkZSAxLjMuOSAtPiAxLjMuMTAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1tYWtvXzEuMy45LmJiID0+IHB5dGhvbjMtbWFrb18xLjMuMTAuYmJ9ICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYWtvXzEuMy45LmJiID0+IHB5dGhv
bjMtbWFrb18xLjMuMTAuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjkuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4x
MC5iYgppbmRleCA4M2I2MTQ5MzM3Li40ZmFjY2U5MjMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuOS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMTAuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9u
LXB5dGVzdAogCiAKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI1ZDY1ZmYzNDYyODcwZmVlYzky
MmRiY2NmMzhmNmVmYjQ0ZTU3MTRkN2I1OTNhNjU2YmU4NjY2M2Q4NjAwYWMiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiOTk1NzlhNmYzOTU4M2ZhN2U1NjMwYTI4YzNjMWY0NDBlNGU5N2E0MTRiODAz
NzI2NDljMGNlMzM4ZGEyZWEyOCIKIAogUkRFUEVORFM6JHtQTn0gPSAicHl0aG9uMy1odG1sIFwK
ICAgICAgICAgICAgICAgICAgIHB5dGhvbjMtbWFya3Vwc2FmZSBcCi0tIAoyLjQ3LjEKCg==

--===============1465373976758964576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/WHEEL was removed

--===============1465373976758964576==--

