Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D6ECFC611
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.53275.1728588954413364594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hP66Z7K/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pmjZA3ga;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019277ee566c-b118d410-0cae-453e-b183-e4605c63a56c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588961;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2emnWz2jQOK9LOXW/Jh6YM3RIHAmTMLadjCrkNBOrlo=;
	b=hP66Z7K/K2uGRF2WSHN4muss8DubIoxZ8U0PxJ9zSZV/pM+JM976bIU/piyYIlEK
	5jDFxWt+StpXKePG26I0oe8x/gTZslS95eLv0Olvlvc3A9iycTOSkhjtIs1YZhERcbu
	NT/7NXUrom5BN95JcxFrgxcxlQOIIxBhoX+UgWnY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588961;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2emnWz2jQOK9LOXW/Jh6YM3RIHAmTMLadjCrkNBOrlo=;
	b=pmjZA3gaHmxH8owmV0ga7WOeAjyaL0y8CidKjYC668L2DP2L57ZLFI6AJGsXreip
	ZwkI572df3v7npwlY5vfLWHK1683BsFFr/mH6kbXERWfgm1lLqXzO7l8K8wlr+krtr1
	U+fek3RrjSDJVml7SuCckkO9z5sYFLsXxNsTYAJs=
Content-Type: multipart/mixed; boundary="===============0777586362454070506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-rtd-theme: upgrading to 3.0.1 SUCCEEDED
Message-ID: <0101019277ee566c-b118d410-0cae-453e-b183-e4605c63a56c-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205500

--===============0777586362454070506==
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
From 796fc6f54c368457d1b98d249fbb66653f0b56cd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 13:51:55 +0000
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


--===============0777586362454070506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGSIZE changed from 3615173 to 9967150 (+176%)
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx_rtd_theme-2.0.0.dist-info -> /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.1.dist-info, removed "/usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv-printshiv.min.js /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv.min.js", added "/usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.eot /usr/lib
 /python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/versions.js_t /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.ttf /usr/lib/python3.12/site-packages/sphinx_
 rtd_theme/static/fonts/Lato/lato-italic.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.eot"
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

--===============0777586362454070506==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-rtd-theme-upgrade-2.0.0-3.0.1.patch"

RnJvbSA3OTZmYzZmNTRjMzY4NDU3ZDFiOThkMjQ5ZmJiNjY2NTNmMGI1NmNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTM6NTE6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
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

--===============0777586362454070506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinx-rtd-theme: PKGV changed from 2.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-2.0.0.tar.gz;downloadfilename=sphinx_rtd_theme-2.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-3.0.1.tar.gz;downloadfilename=sphinx_rtd_theme-3.0.1.tar.gz"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme: PV changed from "2.0.0" to "3.0.1"
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
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx_rtd_theme-2.0.0.dist-info -> /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.1.dist-info, removed "/usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv-printshiv.min.js /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/html5shiv.min.js", added "/usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff /usr/lib/python3.12/site-packages/
 sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bold.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/js/versions.js_t /usr/lib/python3.12/site-packages/
 sphinx_rtd_theme/static/fonts/Lato/lato-bold.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-bolditalic.woff2 /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-regular.woff /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-italic.ttf /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/Lato/lato-regular.eot /usr/lib/python3.12/site-packages/sphinx_rtd_theme/static/fonts/RobotoSlab/roboto-slab-v7-bold.woff"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PV changed from "2.0.0" to "3.0.1"
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

--===============0777586362454070506==--

