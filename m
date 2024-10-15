Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1355D1D88D
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11802.1728994555781572509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JLI3c1qh;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=k33vTxBy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010192901b4482-7307d117-7c7d-4716-be65-8adb1140979a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f79zJirxgifijX2D1gASvrnAdNXotz99vbLzbFNZXjY=;
	b=JLI3c1qhItaL5CPE281jUZsUyGUGkQnfkd8h74jpTzpCrWmi2E2pRM0zIXRA6bb4
	qL48u70jDSffa3Cd22cgqLZ8bjDV7qmRlOWehWs16uv/FG/JTeIzQ/WHRTzXzbkC2m7
	W6u4rBnsXFADoaUZvJULlFPVeEFjvzMDenUD4cGQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f79zJirxgifijX2D1gASvrnAdNXotz99vbLzbFNZXjY=;
	b=k33vTxBy+K0E4fWCnperjv5eygReWhmgT7rFre4I8GXW2d7NB/PvJahFFEpp+G75
	W7K7+BhusvShnKPnq734OsDI5wbETMXFdWseqLnoL1BiakhxjwPiPiA5QFhtUvlS2KK
	g7dHQb1ut/Vt8bCi4Ptd7uWReHmYGMofL/6vHDwo=
Content-Type: multipart/mixed; boundary="===============5839122312929687227=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-rtd-theme: upgrading to 3.0.1 SUCCEEDED
Message-ID: <01010192901b4482-7307d117-7c7d-4716-be65-8adb1140979a-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205849

--===============5839122312929687227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx-rtd-theme* to *3.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-rtd-theme-upgrade-3.0.0-3.0.1.patch
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
From 843ce3891aabc03c470727858a01aae44a30c17f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:53:27 +0000
Subject: [PATCH] python3-sphinx-rtd-theme: upgrade 3.0.0 -> 3.0.1

---
 ...inx-rtd-theme_3.0.0.bb => python3-sphinx-rtd-theme_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_3.0.0.bb => python3-sphinx-rtd-theme_3.0.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.1.bb
index f02f1fe42d..b4d0d2be90 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.1.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "905d67de03217fd3d76fbbdd992034ac8e77044ef8063a544dda1af74d409e08"
+SRC_URI[sha256sum] = "a4c5745d1b06dfcb80b7704fe532eb765b44065a8fad9851e4258c8804140703"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.44.1


--===============5839122312929687227==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-rtd-theme-upgrade-3.0.0-3.0.1.patch"

RnJvbSA4NDNjZTM4OTFhYWJjMDNjNDcwNzI3ODU4YTAxYWFlNDRhMzBjMTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6NTM6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueC1ydGQtdGhlbWU6IHVwZ3JhZGUgMy4wLjAgLT4gMy4wLjEKCi0tLQogLi4u
aW54LXJ0ZC10aGVtZV8zLjAuMC5iYiA9PiBweXRob24zLXNwaGlueC1ydGQtdGhlbWVfMy4wLjEu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGhpbngtcnRk
LXRoZW1lXzMuMC4wLmJiID0+IHB5dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8zLjAuMS5iYn0gKDg5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Bo
aW54LXJ0ZC10aGVtZV8zLjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zcGhpbngtcnRkLXRoZW1lXzMuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbngtcnRkLXRo
ZW1lXzMuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3BoaW54LXJ0ZC10aGVtZV8zLjAuMS5iYgppbmRleCBmMDJmMWZlNDJkLi5iNGQwZDJiZTkw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
LXJ0ZC10aGVtZV8zLjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8zLjAuMS5iYgpAQCAtMTQsNyArMTQsNyBAQCBSREVQRU5E
Uzoke1BOfSArPSAiIFwKIAogUFlQSV9QQUNLQUdFID0gInNwaGlueF9ydGRfdGhlbWUiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI5MDVkNjdkZTAzMjE3ZmQzZDc2ZmJiZGQ5OTIwMzRhYzhlNzcw
NDRlZjgwNjNhNTQ0ZGRhMWFmNzRkNDA5ZTA4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE0YzU3
NDVkMWIwNmRmY2I4MGI3NzA0ZmU1MzJlYjc2NWI0NDA2NWE4ZmFkOTg1MWU0MjU4Yzg4MDQxNDA3
MDMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA/PSAiL3NwaGlueC1ydGQtdGhlbWUvKD9QPHB2ZXI+
KFxkK1tcLlwtX10qKSspLyIKIAogaW5oZXJpdCBzZXR1cHRvb2xzMyBweXBpCi0tIAoyLjQ0LjEK
Cg==

--===============5839122312929687227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.0.dist-info moved to /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.1.dist-info

--===============5839122312929687227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinx-rtd-theme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-3.0.0.tar.gz;downloadfilename=sphinx_rtd_theme-3.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-3.0.1.tar.gz;downloadfilename=sphinx_rtd_theme-3.0.1.tar.gz"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PV changed from "3.0.0" to "3.0.1"
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGSIZE changed from 9966998 to 9967150 (+0%)
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PV changed from "3.0.0" to "3.0.1"
Changes to packages/core2-64-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.0.dist-info moved to /usr/lib/python3.12/site-packages/sphinx_rtd_theme-3.0.1.dist-info

--===============5839122312929687227==--

