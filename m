Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D972CC77B7F
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.27798.1748786134729313030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=musoqYL6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RWOZItEi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101972bc6c47c-6e19725b-d8da-4e49-a69a-8fd4324af5b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y5+tLTR10NI34lZmuoN0UzYnXbF3x0OhTt4Zjja9cwQ=;
	b=musoqYL64f3PnH8uQPOTS6wHpoqRhbETX6f+h9iVPA3LsYayoGCLvL6vJp1g1hH/
	b6nMB4r8G1+tYpMRvC/7CFX5Ltt4Povv6p4dSOrxzmBRxS3QNr1AgYqMMFRdli53iQP
	1u7XQrxDva6ieyWInJgIs+ABP8FQSslr/HMipPjw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786136;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y5+tLTR10NI34lZmuoN0UzYnXbF3x0OhTt4Zjja9cwQ=;
	b=RWOZItEihvJh1RGTQrCiWZluBvkEnjJakDI0aAZBi9kDjjtYqWpnRyWRYgxqezrQ
	b40ZLnkBCJScfFgR/HcQ09f1OLMBvKe+EJFgRQYJbWTAYhCOumUKjAq61icfMvJpwLt
	qBUBOQwiTkH+UknqCECvApYRIJh/p0AmpQ1fVXz8=
Content-Type: multipart/mixed; boundary="===============2027640219513780751=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.18.12 SUCCEEDED
Message-ID: <010101972bc6c47c-6e19725b-d8da-4e49-a69a-8fd4324af5b9-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217606

--===============2027640219513780751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-ruamel-yaml* to *0.18.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.18.10-0.18.12.patch
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
From 67dc247309bbc6da6ef3ff44001ea54901efc480 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:45:41 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.18.10 -> 0.18.12

---
 ...n3-ruamel-yaml_0.18.10.bb => python3-ruamel-yaml_0.18.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.10.bb => python3-ruamel-yaml_0.18.12.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.12.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.12.bb
index 02b04e3c0c..3b136b3b58 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.12.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "20c86ab29ac2153f80a428e1254a8adf686d3383df04490514ca3b79a362db58"
+SRC_URI[sha256sum] = "5a38fd5ce39d223bebb9e3a6779e86b9427a03fb0bf9f270060f8b149cffe5e2"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.47.1


--===============2027640219513780751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-ruamel-yaml: PV changed from "0.18.10" to "0.18.12"
packages/core2-64-poky-linux/python3-ruamel-yaml: PKGV changed from 0.18.10 [default] to 0.18.12 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.10.tar.gz;downloadfilename=ruamel.yaml-0.18.10.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.12.tar.gz;downloadfilename=ruamel.yaml-0.18.12.tar.gz"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.18.10" to "0.18.12"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.18.10 [default] to 0.18.12 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.18.10" to "0.18.12"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.18.10 [default] to 0.18.12 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.18.10" to "0.18.12"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.18.10 [default] to 0.18.12 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.18.10" to "0.18.12"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.18.10 [default] to 0.18.12 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.18.10" to "0.18.12"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.18.10 [default] to 0.18.12 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.18.10" to "0.18.12"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.18.10 [default] to 0.18.12 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.18.10" to "0.18.12"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1200330 to 1203645 (+0%)
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.18.10 [default] to 0.18.12 [default]
Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.10.dist-info moved to /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.12.dist-info

--===============2027640219513780751==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.18.10-0.18.12.patch"

RnJvbSA2N2RjMjQ3MzA5YmJjNmRhNmVmM2ZmNDQwMDFlYTU0OTAxZWZjNDgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOTo0NTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xOC4xMCAtPiAwLjE4LjEyCgotLS0KIC4uLm4z
LXJ1YW1lbC15YW1sXzAuMTguMTAuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjEyLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcnVhbWVsLXlhbWxf
MC4xOC4xMC5iYiA9PiBweXRob24zLXJ1YW1lbC15YW1sXzAuMTguMTIuYmJ9ICg4NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1s
XzAuMTguMTAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVs
LXlhbWxfMC4xOC4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4xMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAu
MTguMTIuYmIKaW5kZXggMDJiMDRlM2MwYy4uM2IxMzZiM2I1OCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTguMTAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTgu
MTIuYmIKQEAgLTksNyArOSw3IEBAIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZ
UElfUEFDS0FHRX0iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRh
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMGM4NmFiMjlhYzIxNTNmODBhNDI4ZTEyNTRhOGFk
ZjY4NmQzMzgzZGYwNDQ5MDUxNGNhM2I3OWEzNjJkYjU4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjVhMzhmZDVjZTM5ZDIyM2JlYmI5ZTNhNjc3OWU4NmI5NDI3YTAzZmIwYmY5ZjI3MDA2MGY4YjE0
OWNmZmU1ZTIiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAgICAgcHl0aG9uMy1zaGVsbCBcCi0t
IAoyLjQ3LjEKCg==

--===============2027640219513780751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.10.dist-info moved to /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.12.dist-info

--===============2027640219513780751==--

