Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44040D0EE1A
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:06 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.53260.1728588944661100897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=f2JQh2tX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jgTDYTua;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019277ee4838-e33506fc-a115-45b7-badf-68ddc3496626-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588957;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tgj6Zq/O+Pk5gw+e/m6otypV9W0KidD9+7SlyYDke0k=;
	b=f2JQh2tXyvKnmw7faY+FHNpEa4AgJpBBnJRWN+o18xCV7835lzXWP/5guH8GX5Ci
	HiFRXQuuRW5TyFoFMwl5ebTp5K8WQgcgsIDUe7l7jkbA93F8ci0DjS+UFRPDW7Mxjsy
	lLU4w6aAx2OcTIiogqglph0NZ9cAPOa+pTKWVFJs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588957;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tgj6Zq/O+Pk5gw+e/m6otypV9W0KidD9+7SlyYDke0k=;
	b=jgTDYTuaqV4EZe0YfDJw77rrVTGr5QyQC8ODA5/Q6ZfNuc8lWXcl2C3fI7s9GAJa
	WwAejx40BQkkETG+t31hA8Lmw46q+/wd7UpUSRgk1qT1YLUcScjYL+Dixmnr07qDapl
	pK4om9pugyLWJYe9eqxzS7fsw4TJRzvNNJoqtuKY=
Content-Type: multipart/mixed; boundary="===============3851166286408783003=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-rtd-theme: upgrading to 3.0.1 SUCCEEDED
Message-ID: <0101019277ee4838-e33506fc-a115-45b7-badf-68ddc3496626-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205486

--===============3851166286408783003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx-rtd-theme* to *3.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-rtd-theme-upgrade-2.0.0-3.0.1.patch
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
From 9877cf03aa748b82c115e3935876a708cce16d43 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 02:30:36 +0000
Subject: [PATCH] python3-sphinx-rtd-theme: upgrade 2.0.0 -> 3.0.1

---
 ...inx-rtd-theme_2.0.0.bb => python3-sphinx-rtd-theme_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_2.0.0.bb => python3-sphinx-rtd-theme_3.0.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.1.bb
index 22b4d96444..b4d0d2be90 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.1.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "bd5d7b80622406762073a04ef8fadc5f9151261563d47027de09910ce03afe6b"
+SRC_URI[sha256sum] = "a4c5745d1b06dfcb80b7704fe532eb765b44065a8fad9851e4258c8804140703"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.44.1


--===============3851166286408783003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx_rtd_theme-2.0.0.dist-info -> /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.1.dist-info, removed "/usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv.min.js /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv-printshiv.min.js", added "/usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.ttf /usr/lib/python3.12/site-pac
 kages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff /usr/lib/python3.12/site
 -packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/versions.js_t /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff2"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGSIZE changed from 3615173 to 9967150 (+176%)
Changes to packages/core2-64-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme-2.0.0.dist-info moved to /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.1.dist-info
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/versions.js_t was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv.min.js was removed
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv-printshiv.min.js was removed

--===============3851166286408783003==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-rtd-theme-upgrade-2.0.0-3.0.1.patch"

RnJvbSA5ODc3Y2YwM2FhNzQ4YjgyYzExNWUzOTM1ODc2YTcwOGNjZTE2ZDQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDI6MzA6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueC1ydGQtdGhlbWU6IHVwZ3JhZGUgMi4wLjAgLT4gMy4wLjEKCi0tLQogLi4u
aW54LXJ0ZC10aGVtZV8yLjAuMC5iYiA9PiBweXRob24zLXNwaGlueC1ydGQtdGhlbWVfMy4wLjEu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGhpbngtcnRk
LXRoZW1lXzIuMC4wLmJiID0+IHB5dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8zLjAuMS5iYn0gKDg5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Bo
aW54LXJ0ZC10aGVtZV8yLjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zcGhpbngtcnRkLXRoZW1lXzMuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbngtcnRkLXRo
ZW1lXzIuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3BoaW54LXJ0ZC10aGVtZV8zLjAuMS5iYgppbmRleCAyMmI0ZDk2NDQ0Li5iNGQwZDJiZTkw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
LXJ0ZC10aGVtZV8yLjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8zLjAuMS5iYgpAQCAtMTQsNyArMTQsNyBAQCBSREVQRU5E
Uzoke1BOfSArPSAiIFwKIAogUFlQSV9QQUNLQUdFID0gInNwaGlueF9ydGRfdGhlbWUiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJiZDVkN2I4MDYyMjQwNjc2MjA3M2EwNGVmOGZhZGM1ZjkxNTEy
NjE1NjNkNDcwMjdkZTA5OTEwY2UwM2FmZTZiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE0YzU3
NDVkMWIwNmRmY2I4MGI3NzA0ZmU1MzJlYjc2NWI0NDA2NWE4ZmFkOTg1MWU0MjU4Yzg4MDQxNDA3
MDMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA/PSAiL3NwaGlueC1ydGQtdGhlbWUvKD9QPHB2ZXI+
KFxkK1tcLlwtX10qKSspLyIKIAogaW5oZXJpdCBzZXR1cHRvb2xzMyBweXBpCi0tIAoyLjQ0LjEK
Cg==

--===============3851166286408783003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinx-rtd-theme: PKGV changed from 2.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme: PV changed from "2.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-2.0.0.tar.gz;downloadfilename=sphinx_rtd_theme-2.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-3.0.1.tar.gz;downloadfilename=sphinx_rtd_theme-3.0.1.tar.gz"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PKGV changed from 2.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PV changed from "2.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PKGV changed from 2.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PV changed from "2.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PKGV changed from 2.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PV changed from "2.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PKGV changed from 2.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PV changed from "2.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PKGV changed from 2.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PV changed from "2.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PKGV changed from 2.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PV changed from "2.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGV changed from 2.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGSIZE changed from 3615173 to 9967150 (+176%)
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx_rtd_theme-2.0.0.dist-info -> /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.1.dist-info, removed "/usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv-printshiv.min.js /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv.min.js", added "/usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/versions.js_t /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff2 /usr/lib/python
 3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff /usr/lib/python3
 .12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.ttf"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PV changed from "2.0.0" to "3.0.1"
Changes to packages/core2-64-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme-2.0.0.dist-info moved to /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.1.dist-info
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.eot was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.ttf was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff2 was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/versions.js_t was added
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv.min.js was removed
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv-printshiv.min.js was removed

--===============3851166286408783003==--

