Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF87DC83F3F
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.5731.1693650553823954706
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Hv+359f2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=N63SqDhL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a5570892e-923621e3-6435-49d6-aeed-56ba673998e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XoPFg+X/280qTX8pG3Ap+FalO4R4SV7NyJ0V9SunOuQ=;
	b=Hv+359f2v+fI+J49899rFvy2PDcwuXz14vSz6PKc/GS/D6rEqH8nIix0oGB+42Ke
	t2J1FM0cXmRWuYINJ0tR3yksnck8pwrZmDxsMZOOuNUYSTGrgueZCZPtWrJiUUym+TO
	NgOZEXdYST9+VcuE4VVQr1t3vqit+lVAIqpO+ztE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XoPFg+X/280qTX8pG3Ap+FalO4R4SV7NyJ0V9SunOuQ=;
	b=N63SqDhLgYLn3oykwjoEawEaP6Lz5eeHmq8KM9jZ2YlPP+r3xCXvimDjDLelEsgc
	A/3n46yKh7EMbvFKTFpXk6FKcVbMPdmfrXQLdeM8mtE1XqP0XpACSssdEy23uZLwFxp
	l0TmVnBjjcELutcUmr8wfruxoZFnE4qStyZEYbXw=
Content-Type: multipart/mixed; boundary="===============8787484815129825163=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-rtd-theme: upgrading to 1.3.0 SUCCEEDED
Message-ID: <0101018a5570892e-923621e3-6435-49d6-aeed-56ba673998e3-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187074

--===============8787484815129825163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx-rtd-theme* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-rtd-theme-upgrade-1.2.2-1.3.0.patch
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
From 0e973926b292b160995a69aa383ae3eabe826a2b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 16:25:38 +0000
Subject: [PATCH] python3-sphinx-rtd-theme: upgrade 1.2.2 -> 1.3.0

---
 ...inx-rtd-theme_1.2.2.bb => python3-sphinx-rtd-theme_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_1.2.2.bb => python3-sphinx-rtd-theme_1.3.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.3.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.3.0.bb
index 0fac83a1c9..83bf705766 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.3.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "01c5c5a72e2d025bd23d1f06c59a4831b06e6ce6c01fdd5ebfe9986c0a880fc7"
+SRC_URI[sha256sum] = "590b030c7abb9cf038ec053b95e5380b5c70d61591eb0b552063fbe7c41f0931"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.39.2


--===============8787484815129825163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx-rtd-theme: PV changed from "1.2.2" to "1.3.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-1.2.2.tar.gz;downloadfilename=sphinx_rtd_theme-1.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-1.3.0.tar.gz;downloadfilename=sphinx_rtd_theme-1.3.0.tar.gz"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PV changed from "1.2.2" to "1.3.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PV changed from "1.2.2" to "1.3.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PV changed from "1.2.2" to "1.3.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PV changed from "1.2.2" to "1.3.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PV changed from "1.2.2" to "1.3.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PV changed from "1.2.2" to "1.3.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PV changed from "1.2.2" to "1.3.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGV changed from 1.2.2 [default] to 1.3.0 [default]
Changes to packages/core2-32-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.11/site-packages/sphinx_rtd_theme-1.2.2.dist-info moved to /usr/lib/python3.11/site-packages/sphinx_rtd_theme-1.3.0.dist-info

--===============8787484815129825163==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-rtd-theme-upgrade-1.2.2-1.3.0.patch"

RnJvbSAwZTk3MzkyNmIyOTJiMTYwOTk1YTY5YWEzODNhZTNlYWJlODI2YTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNjoyNTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54LXJ0ZC10aGVtZTogdXBncmFkZSAxLjIuMiAtPiAxLjMuMAoKLS0tCiAuLi5p
bngtcnRkLXRoZW1lXzEuMi4yLmJiID0+IHB5dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8xLjMuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueC1ydGQt
dGhlbWVfMS4yLjIuYmIgPT4gcHl0aG9uMy1zcGhpbngtcnRkLXRoZW1lXzEuMy4wLmJifSAoODgl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhp
bngtcnRkLXRoZW1lXzEuMi4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNwaGlueC1ydGQtdGhlbWVfMS4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueC1ydGQtdGhl
bWVfMS4yLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zcGhpbngtcnRkLXRoZW1lXzEuMy4wLmJiCmluZGV4IDBmYWM4M2ExYzkuLjgzYmY3MDU3NjYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbngt
cnRkLXRoZW1lXzEuMi4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zcGhpbngtcnRkLXRoZW1lXzEuMy4wLmJiCkBAIC0xMyw3ICsxMyw3IEBAIFJERVBFTkRT
OiR7UE59ICs9ICIgXAogCiBQWVBJX1BBQ0tBR0UgPSAic3BoaW54X3J0ZF90aGVtZSIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjAxYzVjNWE3MmUyZDAyNWJkMjNkMWYwNmM1OWE0ODMxYjA2ZTZj
ZTZjMDFmZGQ1ZWJmZTk5ODZjMGE4ODBmYzciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTkwYjAz
MGM3YWJiOWNmMDM4ZWMwNTNiOTVlNTM4MGI1YzcwZDYxNTkxZWIwYjU1MjA2M2ZiZTdjNDFmMDkz
MSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID89ICIvc3BoaW54LXJ0ZC10aGVtZS8oP1A8cHZlcj4o
XGQrW1wuXC1fXSopKykvIgogCiBpbmhlcml0IHNldHVwdG9vbHMzIHB5cGkKLS0gCjIuMzkuMgoK

--===============8787484815129825163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.11/site-packages/sphinx_rtd_theme-1.2.2.dist-info moved to /usr/lib/python3.11/site-packages/sphinx_rtd_theme-1.3.0.dist-info

--===============8787484815129825163==--

