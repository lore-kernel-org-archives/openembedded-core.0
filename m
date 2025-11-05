Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24DFCD343D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2351.1762384574631610807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VXcHnMtb;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=b0hjwq2R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a564eb217-24069af3-4fcf-4295-b95e-b347ce246074-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384589;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d7lpoOl/COeDxX1BTMJsoeg6OXQOTG+qYWp9er2UNho=;
	b=VXcHnMtbXIWkHhPG3MTezdSQddb98DvLDPDgC8JzErNF1ORF8cjHDX27mLa0COLr
	jclnvZs/dzPU5wDaZzbg/lxDjdNvHc/LMnLZgOW5TMrA1WOPMu1aNGgLBQXYWzjnVdv
	luF3gjtft+12cdajRj3km11q2G6wi7gsKo4GlVwQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384589;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d7lpoOl/COeDxX1BTMJsoeg6OXQOTG+qYWp9er2UNho=;
	b=b0hjwq2RwbgYkgVI8liPtzii2AGJzT32suMVLBfPL4LdzlQ3wbopvIuBZsvTfetN
	VQTZz9AdXMg/iktwUpHN1Hlb0kVHkF9Yc4GOcrQSDwOLljDGdjfY/duGGyIyuWnnubL
	XZJGoPI+rcK4U7IGyLvBordk8iQarJHLwOIuCa30=
Content-Type: multipart/mixed; boundary="===============7910051697788175032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.18.16 SUCCEEDED
Message-ID: <0101019a564eb217-24069af3-4fcf-4295-b95e-b347ce246074-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225845

--===============7910051697788175032==
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
From 36484a6f1158398ea9a1691a5a881dac697a41d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:51:19 +0000
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


--===============7910051697788175032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info moved to /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.16.dist-info

--===============7910051697788175032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-ruamel-yaml: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.15.tar.gz;downloadfilename=ruamel.yaml-0.18.15.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.16.tar.gz;downloadfilename=ruamel.yaml-0.18.16.tar.gz"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml: PV changed from "0.18.15" to "0.18.16"
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
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.18.15 [default] to 0.18.16 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1209426 to 1212241 (+0%)
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.18.15" to "0.18.16"
Changes to packages/x86-64-v3-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info moved to /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.16.dist-info

--===============7910051697788175032==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.18.15-0.18.16.patch"

RnJvbSAzNjQ4NGE2ZjExNTgzOThlYTlhMTY5MWE1YTg4MWRhYzY5N2E0MWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzo1MToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xOC4xNSAtPiAwLjE4LjE2CgotLS0KIC4uLm4z
LXJ1YW1lbC15YW1sXzAuMTguMTUuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjE2LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcnVhbWVsLXlhbWxf
MC4xOC4xNS5iYiA9PiBweXRob24zLXJ1YW1lbC15YW1sXzAuMTguMTYuYmJ9ICg4NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1s
XzAuMTguMTUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVs
LXlhbWxfMC4xOC4xNi5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4xNS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAu
MTguMTYuYmIKaW5kZXggZjE0ZDA0M2Y1Ni4uYTc3ZjI5MGU4NiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTguMTUuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTgu
MTYuYmIKQEAgLTksNyArOSw3IEBAIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZ
UElfUEFDS0FHRX0iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRh
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkYmZjYTc0YjAxOGM0YzNmYmEwYjljYzllZTMzZTUz
YzM3MTE5NGE5MDAwZTY5NDk5NWU2MjA0OTBmZDQwNzAwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImE2ZTU4NzUxMmYzYzk5OGIyMjI1ZDY4YWExZjM1MTExYzI5ZmFkMTRhZWQ1NjFhMjZlNzNmYWI3
MjllYzVlNWEiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAgICAgcHl0aG9uMy1zaGVsbCBcCi0t
IAoyLjQ3LjEKCg==

--===============7910051697788175032==--

