Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84277C5B548
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:07 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.131104.1723748334708902271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NlF0/q39;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ppkTlofb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019157683a30-ce93e0b2-4b72-4d22-a0ac-9b37876d4a01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qz3a2GjuGnAcFaYWZmL8+kDDQa5SwVnVnOOX7WuUZoU=;
	b=NlF0/q39s6p9YY1i8m/stSYB0J+ItPs7LA9fCtf1SkBGHHxp1dq6TOekz3XuHtQz
	bI9Olfvyhst9aSoCTNmYn+H5+knzcIEPyJjOXD9nLtFIvCkx7rtiWfV+Hp+F4q+ql3+
	B5ua8LBaxRN/EHO9MLXx6DpT99q1rUnrCZOOf3z8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qz3a2GjuGnAcFaYWZmL8+kDDQa5SwVnVnOOX7WuUZoU=;
	b=ppkTlofbLxm7mCHF+SWzUPFYW3Sc5EPYLmfAJV17v/JD+lW8NRIyDD6sNOcYTAXh
	ETWSWnnO4BNuvEqGjYJUiIyi51V1IrRdij/jMNZclz9knF1OM7k26u497qlbLEf9B3w
	mfZ75GNZt5EZrHOs3ZE26eFYmk+jFvmqxl6IJ35Y=
Content-Type: multipart/mixed; boundary="===============2290840658054933274=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 5.3.0 SUCCEEDED
Message-ID: <0101019157683a30-ce93e0b2-4b72-4d22-a0ac-9b37876d4a01-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203382

--===============2290840658054933274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-lxml* to *5.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-5.2.2-5.3.0.patch
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
From 9cf465a5a57debea68a6d186e2e63bf4d47ed8fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 11:44:36 +0000
Subject: [PATCH] python3-lxml: upgrade 5.2.2 -> 5.3.0

---
 .../python/{python3-lxml_5.2.2.bb => python3-lxml_5.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.2.2.bb => python3-lxml_5.3.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.2.2.bb b/meta/recipes-devtools/python/python3-lxml_5.3.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.2.2.bb
rename to meta/recipes-devtools/python/python3-lxml_5.3.0.bb
index b114c18763..4c9c22e5c4 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.2.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.3.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "bb2dc4898180bea79863d5487e5f9c7c34297414bad54bcd0f0852aee9cfdb87"
+SRC_URI[sha256sum] = "4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.44.0


--===============2290840658054933274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.12/site-packages/lxml-5.2.2.dist-info moved to /usr/lib/python3.12/site-packages/lxml-5.3.0.dist-info

--===============2290840658054933274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.2.2.tar.gz;downloadfilename=lxml-5.2.2.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.2.2.tar.gz;downloadfilename=lxml-5.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.0.tar.gz;downloadfilename=lxml-5.3.0.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-5.3.0.tar.gz;downloadfilename=lxml-5.3.0.tar.gz"
packages/core2-64-poky-linux/python3-lxml: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/python3-lxml: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 18013616 to 18011480 (-0%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 18497924 to 18479026 (-0%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PV changed from "5.2.2" to "5.3.0"
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5133336 to 5131610 (-0%)
packages/core2-64-poky-linux/python3-lxml/python3-lxml: PKGV changed from 5.2.2 [default] to 5.3.0 [default]
Changes to packages/core2-64-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.12/site-packages/lxml-5.2.2.dist-info moved to /usr/lib/python3.12/site-packages/lxml-5.3.0.dist-info

--===============2290840658054933274==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-5.2.2-5.3.0.patch"

RnJvbSA5Y2Y0NjVhNWE1N2RlYmVhNjhhNmQxODZlMmU2M2JmNGQ0N2VkOGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTE6NDQ6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWx4bWw6IHVwZ3JhZGUgNS4yLjIgLT4gNS4zLjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1seG1sXzUuMi4yLmJiID0+IHB5dGhvbjMtbHhtbF81LjMuMC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1seG1sXzUuMi4yLmJiID0+IHB5dGhv
bjMtbHhtbF81LjMuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjIuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1seG1sXzUuMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzUuMi4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjMuMC5i
YgppbmRleCBiMTE0YzE4NzYzLi40YzljMjJlNWM0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjIuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF81LjMuMC5iYgpAQCAtMTgsNyArMTgsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy50eHQ7bWQ1PWU0YzA0NWViYWQ5NThl
YWQ0YjQ4MDA4ZjcwODM4NDAzIFwKIAogREVQRU5EUyArPSAibGlieG1sMiBsaWJ4c2x0IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYmIyZGM0ODk4MTgwYmVhNzk4NjNkNTQ4N2U1ZjljN2MzNDI5
NzQxNGJhZDU0YmNkMGYwODUyYWVlOWNmZGI4NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZTEw
OWNhMzBkMWVkZWMxYWM2MGNkYmUzNDE5MDVkYzNiOGY1NWIxNjg1NWUwM2E1NGFhZjU5ZTUxZWM4
YzZmIgogCiBTUkNfVVJJICs9ICIke1BZUElfU1JDX1VSSX0iCiBpbmhlcml0IHBrZ2NvbmZpZyBw
eXBpIHNldHVwdG9vbHMzCi0tIAoyLjQ0LjAKCg==

--===============2290840658054933274==--

