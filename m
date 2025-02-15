Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75DBC021AE
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:20 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.8046.1739623326598169694
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=d3TdQj+R;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0LeOncYR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019509a190ed-faa0383f-11e4-4527-8ccb-872ae76f87d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BwxTrOwLL8n5TKcOUogYLPYEVqSUaXe5y2dIBY0Ys3k=;
	b=d3TdQj+RPLWeAphyoCwErsJZGkNpvwswhXksYZqVB1aBzwfNfsVO+bYeQs4NmUDk
	yvXTg4nRyfIyuKxlojz4RiSdZIPfNnJFQ2LXaoGI4vDiFAcqs6oDURnflJw4IPBQ48T
	Yeo1e80seOsNgQqedBm3gxVgZk9BZ5t9fYgQvoJI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BwxTrOwLL8n5TKcOUogYLPYEVqSUaXe5y2dIBY0Ys3k=;
	b=0LeOncYRqGwxkIn4vTt6s3KkuYnrBUBJqDdGAeX4PT2IEPjpfvLtWQmyxf59bfak
	WCWy3yfD6ir058Lsm1uXy14XW3ESlYGkLy9eVvMkIGMSafoyKZSGZQ8A8gkqb4Oj9xn
	ZWF9yGEOCDhxCL9RLMGxii/+BWzDB70+D7x/F0G0=
Content-Type: multipart/mixed; boundary="===============1802195520251575773=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.3.9 SUCCEEDED
Message-ID: <0101019509a190ed-faa0383f-11e4-4527-8ccb-872ae76f87d4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211427

--===============1802195520251575773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-mako* to *1.3.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.8-1.3.9.patch
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
From 75abaeff26352fb885c302449041e6b39dbd7f89 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 07:55:15 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.8 -> 1.3.9

---
 ...n3-mako_1.3.8.bb => python3-mako_1.3.9.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.8.bb => python3-mako_1.3.9.bb} (39%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.8.bb b/meta/recipes-devtools/python/python3-mako_1.3.9.bb
similarity index 39%
rename from meta/recipes-devtools/python/python3-mako_1.3.8.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.9.bb
index 3cfe56e043..cdef8ad59f 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.8.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.9.bb
@@ -1,8 +1,27 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright 2006-2024 the Mako authors and contributors <see AUTHORS file>.
+# +Copyright 2006-2025 the Mako authors and contributors <see AUTHORS file>.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# 
+#
+
 SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d0995d6f7ba3f186a03118f244e88f57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=73026b50800163bd3c75cfdc121d9eb5"
 
 PYPI_PACKAGE = "mako"
 
@@ -10,7 +29,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 
 
-SRC_URI[sha256sum] = "577b97e414580d3e088d47c2dbbe9594aa7a5146ed2875d4dfa9075af2dd3cc8"
+SRC_URI[sha256sum] = "b5d65ff3462870feec922dbccf38f6efb44e5714d7b593a656be86663d8600ac"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.44.1


--===============1802195520251575773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.8.tar.gz;downloadfilename=mako-1.3.8.tar.gz" to "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.9.tar.gz;downloadfilename=mako-1.3.9.tar.gz"
packages/core2-64-poky-linux/python3-mako: PV changed from "1.3.8" to "1.3.9"
packages/core2-64-poky-linux/python3-mako: PKGV changed from 1.3.8 [default] to 1.3.9 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.8" to "1.3.9"
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.8 [default] to 1.3.9 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.8" to "1.3.9"
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.8 [default] to 1.3.9 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.8" to "1.3.9"
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.8 [default] to 1.3.9 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.8" to "1.3.9"
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.8 [default] to 1.3.9 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-ptest: PKGSIZE changed from 352048 to 352058 (+0%)
packages/core2-64-poky-linux/python3-mako/python3-mako-ptest: PV changed from "1.3.8" to "1.3.9"
packages/core2-64-poky-linux/python3-mako/python3-mako-ptest: PKGV changed from 1.3.8 [default] to 1.3.9 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.8" to "1.3.9"
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.8 [default] to 1.3.9 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.8" to "1.3.9"
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.8 [default] to 1.3.9 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 640279 to 639707 (-0%)
packages/core2-64-poky-linux/python3-mako/python3-mako: PV changed from "1.3.8" to "1.3.9"
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.8 [default] to 1.3.9 [default]
Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.13/site-packages/Mako-1.3.8.dist-info moved to /usr/lib/python3.13/site-packages/Mako-1.3.9.dist-info

--===============1802195520251575773==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.8-1.3.9.patch"

RnJvbSA3NWFiYWVmZjI2MzUyZmI4ODVjMzAyNDQ5MDQxZTZiMzlkYmQ3Zjg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDc6NTU6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1ha286IHVwZ3JhZGUgMS4zLjggLT4gMS4zLjkKCi0tLQogLi4ubjMtbWFrb18xLjMu
OC5iYiA9PiBweXRob24zLW1ha29fMS4zLjkuYmJ9IHwgMjMgKysrKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYWtvXzEuMy44LmJiID0+IHB5
dGhvbjMtbWFrb18xLjMuOS5iYn0gKDM5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy45LmJiCnNpbWlsYXJpdHkgaW5kZXggMzklCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy44LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMu
OS5iYgppbmRleCAzY2ZlNTZlMDQzLi5jZGVmOGFkNTlmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuOC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuOS5iYgpAQCAtMSw4ICsxLDI3IEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw0
ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAyMDA2LTIwMjQgdGhlIE1ha28gYXV0aG9ycyBhbmQgY29u
dHJpYnV0b3JzIDxzZWUgQVVUSE9SUyBmaWxlPi4KKyMgK0NvcHlyaWdodCAyMDA2LTIwMjUgdGhl
IE1ha28gYXV0aG9ycyBhbmQgY29udHJpYnV0b3JzIDxzZWUgQVVUSE9SUyBmaWxlPi4KKyMgIAor
IyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBw
ZXJzb24gb2J0YWluaW5nIGEgY29weSBvZgorIyAgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRl
ZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4KKyMgCisj
CisKIFNVTU1BUlkgPSAiVGVtcGxhdGluZyBsaWJyYXJ5IGZvciBQeXRob24iCiBIT01FUEFHRSA9
ICJodHRwOi8vd3d3Lm1ha290ZW1wbGF0ZXMub3JnLyIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9u
IgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT1kMDk5NWQ2ZjdiYTNmMTg2YTAzMTE4ZjI0NGU4OGY1NyIKK0xJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTczMDI2YjUwODAwMTYzYmQzYzc1Y2ZkYzEyMWQ5ZWI1IgogCiBQ
WVBJX1BBQ0tBR0UgPSAibWFrbyIKIApAQCAtMTAsNyArMjksNyBAQCBpbmhlcml0IHB5cGkgcHl0
aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVzdC1weXRob24tcHl0ZXN0CiAKIAogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNTc3Yjk3ZTQxNDU4MGQzZTA4OGQ0N2MyZGJiZTk1OTRhYTdhNTE0
NmVkMjg3NWQ0ZGZhOTA3NWFmMmRkM2NjOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiNWQ2NWZm
MzQ2Mjg3MGZlZWM5MjJkYmNjZjM4ZjZlZmI0NGU1NzE0ZDdiNTkzYTY1NmJlODY2NjNkODYwMGFj
IgogCiBSREVQRU5EUzoke1BOfSA9ICJweXRob24zLWh0bWwgXAogICAgICAgICAgICAgICAgICAg
cHl0aG9uMy1tYXJrdXBzYWZlIFwKLS0gCjIuNDQuMQoK

--===============1802195520251575773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.13/site-packages/Mako-1.3.8.dist-info moved to /usr/lib/python3.13/site-packages/Mako-1.3.9.dist-info

--===============1802195520251575773==--

