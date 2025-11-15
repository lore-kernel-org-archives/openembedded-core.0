Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF41CED623
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:05 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12118.1763224717820855283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Izf+OtsF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sFa63BsH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a88624a76-4cdb971f-b2f6-4965-8be5-8d33b368bc4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8hi33KgOszQppPmDj7CtJbmDMyyL7+gPaAzZPEhuz+g=;
	b=Izf+OtsFN3au+VxAiObk4g1j5Jmcf+UjCZET9F4USAae6C7ZxDZuRYwCinHP+DsL
	qxP+kGsApvr5xctfzTuICPXPDMmfL9Qrns+pLslliVqXcWy7LX4DrR6LpyNXUs/H9LS
	YX+CkMFworAYiJb6zd5+/98x7aNT6Tu41aL/tuFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8hi33KgOszQppPmDj7CtJbmDMyyL7+gPaAzZPEhuz+g=;
	b=sFa63BsHfZy4RhHvbdChPm0JfqYOh9mkUjw+rpPifDGJFCAQWSApBZ04MnhiA32Q
	I+vqVW7d+xoE36b3oSSafl69ewupq8tvaPv/Vy0vToQMF3/fNChVJcO8NI9a2sqTKaZ
	zRaALsmcR8jN+Ww32bx5fc7odhLtPCSBNDYYaP+g=
Content-Type: multipart/mixed; boundary="===============0649846920215724438=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.18.16 SUCCEEDED
Message-ID: <0101019a88624a76-4cdb971f-b2f6-4965-8be5-8d33b368bc4f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226376

--===============0649846920215724438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-ruamel-yaml* to *0.18.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.18.15-0.18.16.patch
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
From 6a58025060cc4bb8f4bdc09d9c25b5b43c9f0fc0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 11:17:21 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.18.15 -> 0.18.16

---
 ...n3-ruamel-yaml_0.18.15.bb => python3-ruamel-yaml_0.18.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.15.bb => python3-ruamel-yaml_0.18.16.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.16.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.16.bb
index f14d043f56..a77f290e86 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.16.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "dbfca74b018c4c3fba0b9cc9ee33e53c371194a9000e694995e620490fd40700"
+SRC_URI[sha256sum] = "a6e587512f3c998b2225d68aa1f35111c29fad14aed561a26e73fab729ec5e5a"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.47.1


--===============0649846920215724438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-ruamel-yaml: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml: PV changed from "0.18.15" to "0.18.16"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.15.tar.gz;downloadfilename=ruamel.yaml-0.18.15.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.16.tar.gz;downloadfilename=ruamel.yaml-0.18.16.tar.gz"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.18.15" to "0.18.16"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.18.15" to "0.18.16"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.18.15" to "0.18.16"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.18.15" to "0.18.16"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.18.15" to "0.18.16"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.18.15" to "0.18.16"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1209426 to 1212241 (+0%)
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.18.15" to "0.18.16"
Changes to packages/x86-64-v3-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info moved to /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.16.dist-info

--===============0649846920215724438==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.18.15-0.18.16.patch"

RnJvbSA2YTU4MDI1MDYwY2M0YmI4ZjRiZGMwOWQ5YzI1YjViNDNjOWYwZmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTE6MTc6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJ1YW1lbC15YW1sOiB1cGdyYWRlIDAuMTguMTUgLT4gMC4xOC4xNgoKLS0tCiAuLi5u
My1ydWFtZWwteWFtbF8wLjE4LjE1LmJiID0+IHB5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4xNi5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJ1YW1lbC15YW1s
XzAuMTguMTUuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjE2LmJifSAoODUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFt
bF8wLjE4LjE1LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1l
bC15YW1sXzAuMTguMTYuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTguMTUuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8w
LjE4LjE2LmJiCmluZGV4IGYxNGQwNDNmNTYuLmE3N2YyOTBlODYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjE1LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4
LjE2LmJiCkBAIC05LDcgKzksNyBAQCBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0UgPSAiJHtQ
WVBJX1BBQ0tBR0V9IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0
YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGJmY2E3NGIwMThjNGMzZmJhMGI5Y2M5ZWUzM2U1
M2MzNzExOTRhOTAwMGU2OTQ5OTVlNjIwNDkwZmQ0MDcwMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJhNmU1ODc1MTJmM2M5OThiMjIyNWQ2OGFhMWYzNTExMWMyOWZhZDE0YWVkNTYxYTI2ZTczZmFi
NzI5ZWM1ZTVhIgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICAgIHB5dGhvbjMtc2hlbGwgXAot
LSAKMi40Ny4xCgo=

--===============0649846920215724438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info moved to /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.16.dist-info

--===============0649846920215724438==--

