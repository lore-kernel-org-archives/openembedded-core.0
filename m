Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129FDD60040
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4685.1731964639947400615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cF+YNwBH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=yw7ZENrC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934123182f-783d22e8-e098-4638-a58e-cb91d981a90e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964639;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZHBWmsn30fM5ueHX3mtgxJ26KeW+86sZI9VS0bUcndc=;
	b=cF+YNwBHBOX9bh1PSg7nQW/5z4QbFrM3PFLHUd+93TNR3z1Pefst0jKLRTIf1qY9
	6tleoxun5VQxAgjHDEI1cYlV2vmde+Bj1Ae8MD+jgQ8uRH5w2ab4G1vKfSKF61HuprW
	vIgB8yyAMOf5wVUeGwAIePvLyu6EMy2nPxQIFlYE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964639;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZHBWmsn30fM5ueHX3mtgxJ26KeW+86sZI9VS0bUcndc=;
	b=yw7ZENrCsP+b/UiSJyd5jBGlTAQS5rfCyWfSzjEKAL902cf3Er/idInB076llwts
	1Vb+kIT8tjId7tCekdDyHLAd9UP0OL0imdt2/aivtn3VYVarO22byfmVA68m0jutUcM
	Uqj+Z9wAcjnSzqaD7tFK7PzzsUnHFY4eAyQa/3iw=
Content-Type: multipart/mixed; boundary="===============4590421430469978097=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-rtd-theme: upgrading to 3.0.2 SUCCEEDED
Message-ID: <010101934123182f-783d22e8-e098-4638-a58e-cb91d981a90e-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207294

--===============4590421430469978097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx-rtd-theme* to *3.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-rtd-theme-upgrade-3.0.0-3.0.2.patch
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
From b39e75e42052505f1bbd8dcc7c483232c16ed602 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 02:53:47 +0000
Subject: [PATCH] python3-sphinx-rtd-theme: upgrade 3.0.0 -> 3.0.2

---
 ...inx-rtd-theme_3.0.0.bb => python3-sphinx-rtd-theme_3.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_3.0.0.bb => python3-sphinx-rtd-theme_3.0.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
index f02f1fe42d..b2c6b892bb 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "905d67de03217fd3d76fbbdd992034ac8e77044ef8063a544dda1af74d409e08"
+SRC_URI[sha256sum] = "b7457bc25dda723b20b086a670b9953c859eab60a2a03ee8eb2bb23e176e5f85"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.44.1


--===============4590421430469978097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.0.dist-info moved to /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.2.dist-info

--===============4590421430469978097==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-rtd-theme-upgrade-3.0.0-3.0.2.patch"

RnJvbSBiMzllNzVlNDIwNTI1MDVmMWJiZDhkY2M3YzQ4MzIzMmMxNmVkNjAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDI6NTM6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueC1ydGQtdGhlbWU6IHVwZ3JhZGUgMy4wLjAgLT4gMy4wLjIKCi0tLQogLi4u
aW54LXJ0ZC10aGVtZV8zLjAuMC5iYiA9PiBweXRob24zLXNwaGlueC1ydGQtdGhlbWVfMy4wLjIu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGhpbngtcnRk
LXRoZW1lXzMuMC4wLmJiID0+IHB5dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8zLjAuMi5iYn0gKDg5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Bo
aW54LXJ0ZC10aGVtZV8zLjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zcGhpbngtcnRkLXRoZW1lXzMuMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbngtcnRkLXRo
ZW1lXzMuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3BoaW54LXJ0ZC10aGVtZV8zLjAuMi5iYgppbmRleCBmMDJmMWZlNDJkLi5iMmM2Yjg5MmJi
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
LXJ0ZC10aGVtZV8zLjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8zLjAuMi5iYgpAQCAtMTQsNyArMTQsNyBAQCBSREVQRU5E
Uzoke1BOfSArPSAiIFwKIAogUFlQSV9QQUNLQUdFID0gInNwaGlueF9ydGRfdGhlbWUiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI5MDVkNjdkZTAzMjE3ZmQzZDc2ZmJiZGQ5OTIwMzRhYzhlNzcw
NDRlZjgwNjNhNTQ0ZGRhMWFmNzRkNDA5ZTA4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI3NDU3
YmMyNWRkYTcyM2IyMGIwODZhNjcwYjk5NTNjODU5ZWFiNjBhMmEwM2VlOGViMmJiMjNlMTc2ZTVm
ODUiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA/PSAiL3NwaGlueC1ydGQtdGhlbWUvKD9QPHB2ZXI+
KFxkK1tcLlwtX10qKSspLyIKIAogaW5oZXJpdCBzZXR1cHRvb2xzMyBweXBpCi0tIAoyLjQ0LjEK
Cg==

--===============4590421430469978097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinx-rtd-theme: PV changed from "3.0.0" to "3.0.2"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-3.0.0.tar.gz;downloadfilename=sphinx_rtd_theme-3.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-3.0.2.tar.gz;downloadfilename=sphinx_rtd_theme-3.0.2.tar.gz"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme: PKGV changed from 3.0.0 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PV changed from "3.0.0" to "3.0.2"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PKGV changed from 3.0.0 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PV changed from "3.0.0" to "3.0.2"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PKGV changed from 3.0.0 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PV changed from "3.0.0" to "3.0.2"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PKGV changed from 3.0.0 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PV changed from "3.0.0" to "3.0.2"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PKGV changed from 3.0.0 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PV changed from "3.0.0" to "3.0.2"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PKGV changed from 3.0.0 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PV changed from "3.0.0" to "3.0.2"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PKGV changed from 3.0.0 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PV changed from "3.0.0" to "3.0.2"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGV changed from 3.0.0 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGSIZE changed from 9967098 to 9967526 (+0%)
Changes to packages/core2-64-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.0.dist-info moved to /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.2.dist-info

--===============4590421430469978097==--

