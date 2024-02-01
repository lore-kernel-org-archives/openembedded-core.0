Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0688C54E9D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.2102.1706810405526946317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WSZcxIJQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hWqg17eV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d65d3f396-0867ba32-342c-4c2e-96b7-f3d7df418b78-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d2aAiXxA5Y4ob87Gt7gym+sG92B/4HMr29hHc9hiEtA=;
	b=WSZcxIJQgA6aMVmcp9gp3E1vSg95j4oY8hhc7fKgQfpcL77vPLYxT3fJqn+aiIKQ
	7pZ5fJS898sJmlDqAoCJ4+gggaCiufnolGLW+vukvGWFCXAClAxK1+4v38me+iAwyca
	/DDJcbNW2TQRD3cYTu9zbnsfcN9PqmggU7kSbljY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d2aAiXxA5Y4ob87Gt7gym+sG92B/4HMr29hHc9hiEtA=;
	b=hWqg17eVahWgXfT6Oe1S2fWICrIGyAZGThwprypMPQ2/YZltjpRcj0E2hIhDcnLL
	/NDUNjiBWIvoJIDnJHtaGW5OnA53HxgYsWrwOftXmUHjO0p3fLWKfEwcFpgxHSeWAnN
	VAnAKqdeM+GpYCXuhro27igRLhdI8V4vyAdErHVE=
Content-Type: multipart/mixed; boundary="===============1006937173290821702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-qthelp: upgrading to 1.0.7 SUCCEEDED
Message-ID: <0101018d65d3f396-0867ba32-342c-4c2e-96b7-f3d7df418b78-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194641

--===============1006937173290821702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-qthelp* to *1.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-qthelp-upgrade-1.0.6-1.0.7.patch
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
From 8f48307231cd73c64cc5f810c8116c8344db2482 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 08:33:05 +0000
Subject: [PATCH] python3-sphinxcontrib-qthelp: upgrade 1.0.6 -> 1.0.7

---
 ...ib-qthelp_1.0.6.bb => python3-sphinxcontrib-qthelp_1.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-qthelp_1.0.6.bb => python3-sphinxcontrib-qthelp_1.0.7.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
index 3538b063d6..b24f7f8e6f 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f7a83b72ea86d04827575ec0b63430eb"
 
-SRC_URI[sha256sum] = "62b9d1a186ab7f5ee3356d906f648cacb7a6bdb94d201ee7adf26db55092982d"
+SRC_URI[sha256sum] = "053dedc38823a80a7209a80860b16b722e9e0209e32fea98c90e4e6624588ed6"
 
 PYPI_PACKAGE = "sphinxcontrib-qthelp"
 
-- 
2.42.0


--===============1006937173290821702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_qthelp-1.0.6.dist-info moved to /usr/lib/python3.12/site-packages/sphinxcontrib_qthelp-1.0.7.dist-info

--===============1006937173290821702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-qthelp/sphinxcontrib_qthelp-1.0.6.tar.gz;downloadfilename=sphinxcontrib_qthelp-1.0.6.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-qthelp/sphinxcontrib_qthelp-1.0.7.tar.gz;downloadfilename=sphinxcontrib_qthelp-1.0.7.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-dbg: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-dbg: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-dev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-dev: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-doc: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-doc: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-locale: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-locale: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-src: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-src: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-staticdev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-staticdev: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp: PKGSIZE changed from 159712 to 159862 (+0%)
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_qthelp-1.0.6.dist-info moved to /usr/lib/python3.12/site-packages/sphinxcontrib_qthelp-1.0.7.dist-info

--===============1006937173290821702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-qthelp-upgrade-1.0.6-1.0.7.patch"

RnJvbSA4ZjQ4MzA3MjMxY2Q3M2M2NGNjNWY4MTBjODExNmM4MzQ0ZGIyNDgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwODozMzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54Y29udHJpYi1xdGhlbHA6IHVwZ3JhZGUgMS4wLjYgLT4gMS4wLjcKCi0tLQog
Li4uaWItcXRoZWxwXzEuMC42LmJiID0+IHB5dGhvbjMtc3BoaW54Y29udHJpYi1xdGhlbHBfMS4w
LjcuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGhpbnhj
b250cmliLXF0aGVscF8xLjAuNi5iYiA9PiBweXRob24zLXNwaGlueGNvbnRyaWItcXRoZWxwXzEu
MC43LmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zcGhpbnhjb250cmliLXF0aGVscF8xLjAuNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLXF0aGVscF8xLjAuNy5iYgpzaW1pbGFy
aXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc3BoaW54Y29udHJpYi1xdGhlbHBfMS4wLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLXF0aGVscF8xLjAuNy5iYgpp
bmRleCAzNTM4YjA2M2Q2Li5iMjRmN2Y4ZTZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1xdGhlbHBfMS4wLjYuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItcXRoZWxw
XzEuMC43LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vYmFiZWwuZWRnZXdh
bGwub3JnLyIKIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ZjdhODNiNzJlYTg2ZDA0ODI3NTc1ZWMwYjYzNDMwZWIiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI2MmI5ZDFhMTg2YWI3ZjVlZTMzNTZkOTA2ZjY0OGNhY2I3YTZi
ZGI5NGQyMDFlZTdhZGYyNmRiNTUwOTI5ODJkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA1M2Rl
ZGMzODgyM2E4MGE3MjA5YTgwODYwYjE2YjcyMmU5ZTAyMDllMzJmZWE5OGM5MGU0ZTY2MjQ1ODhl
ZDYiCiAKIFBZUElfUEFDS0FHRSA9ICJzcGhpbnhjb250cmliLXF0aGVscCIKIAotLSAKMi40Mi4w
Cgo=

--===============1006937173290821702==--

