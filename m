Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549A6E77376
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.65022.1696183991027724086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U/Jd5KOT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SABeRJz+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018aec71b84d-0ec7e1e6-6f39-43c7-8e8e-b4b7fc51ccef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Dtum1s/aq6cZt7oeDLekizf7aO8cWv5Rb3PPcOxS9t4=;
	b=U/Jd5KOTo2f1KmfJ4MK5iAdGdBmFJEQRZqwlnp1af3dwyEvlO0azHX3QIPTISRZy
	d2doyhbuj6jTOH7QMVp/sq0k23mri33rpEjtc2s10LttutM/L4oCEcVrvSwk5FVaRls
	ourxNA4uo6Hoo2uioN3VKOQEAhKUkVkqMdBQGjdI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Dtum1s/aq6cZt7oeDLekizf7aO8cWv5Rb3PPcOxS9t4=;
	b=SABeRJz+dDqb4Ud1nhP0Q4LoBJwFJG+8xgbqsrL432G8eU5lub2JznInptKrWLIb
	IkUWvIqnn2vUs5STUuQr5dTNrpasYW8cT4DDnDWibewP/aeenr8V3AW/wTGcfy8asnK
	qXkWX4sR6jRMY+Q5kZg1uNrb/ARIF/PDznFbEMfs=
Content-Type: multipart/mixed; boundary="===============6216862154294336828=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.17.33 SUCCEEDED
Message-ID: <0101018aec71b84d-0ec7e1e6-6f39-43c7-8e8e-b4b7fc51ccef-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188536

--===============6216862154294336828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-ruamel-yaml* to *0.17.33* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.17.32-0.17.33.patch
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
From 7ec5092c9f2dc218b4aa6df081ab2c45ef91f096 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 10:04:57 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.17.32 -> 0.17.33

---
 ...n3-ruamel-yaml_0.17.32.bb => python3-ruamel-yaml_0.17.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.32.bb => python3-ruamel-yaml_0.17.33.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.33.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.17.33.bb
index 4b5e77e6e3..7e646c7152 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.33.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ec939063761914e14542972a5cba6d33c23b0859ab6342f61cf070cfc600efc2"
+SRC_URI[sha256sum] = "5c56aa0bff2afceaa93bffbfc78b450b7dc1e01d5edb80b3a570695286ae62b1"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.39.2


--===============6216862154294336828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.32.tar.gz;downloadfilename=ruamel.yaml-0.17.32.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.33.tar.gz;downloadfilename=ruamel.yaml-0.17.33.tar.gz"
packages/core2-32-poky-linux/python3-ruamel-yaml: PKGV changed from 0.17.32 [default] to 0.17.33 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml: PV changed from "0.17.32" to "0.17.33"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.17.32 [default] to 0.17.33 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.17.32" to "0.17.33"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.17.32 [default] to 0.17.33 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.17.32" to "0.17.33"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.17.32 [default] to 0.17.33 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.17.32" to "0.17.33"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.17.32 [default] to 0.17.33 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.17.32" to "0.17.33"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.17.32 [default] to 0.17.33 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.17.32" to "0.17.33"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.17.32 [default] to 0.17.33 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.17.32" to "0.17.33"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1227492 to 1225886 (-0%)
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.17.32 [default] to 0.17.33 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.17.32" to "0.17.33"
Changes to packages/core2-32-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.32.dist-info moved to /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.33.dist-info

--===============6216862154294336828==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.17.32-0.17.33.patch"

RnJvbSA3ZWM1MDkyYzlmMmRjMjE4YjRhYTZkZjA4MWFiMmM0NWVmOTFmMDk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxMDowNDo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xNy4zMiAtPiAwLjE3LjMzCgotLS0KIC4uLm4z
LXJ1YW1lbC15YW1sXzAuMTcuMzIuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE3LjMzLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcnVhbWVsLXlhbWxf
MC4xNy4zMi5iYiA9PiBweXRob24zLXJ1YW1lbC15YW1sXzAuMTcuMzMuYmJ9ICg4NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1s
XzAuMTcuMzIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVs
LXlhbWxfMC4xNy4zMy5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xNy4zMi5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAu
MTcuMzMuYmIKaW5kZXggNGI1ZTc3ZTZlMy4uN2U2NDZjNzE1MiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTcuMzIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTcu
MzMuYmIKQEAgLTgsNyArOCw3IEBAIFBZUElfUEFDS0FHRSA9ICJydWFtZWwueWFtbCIKIAogaW5o
ZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlYzkzOTA2Mzc2
MTkxNGUxNDU0Mjk3MmE1Y2JhNmQzM2MyM2IwODU5YWI2MzQyZjYxY2YwNzBjZmM2MDBlZmMyIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjVjNTZhYTBiZmYyYWZjZWFhOTNiZmZiZmM3OGI0NTBiN2Rj
MWUwMWQ1ZWRiODBiM2E1NzA2OTUyODZhZTYyYjEiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAg
ICAgJHtQWVRIT05fUE59LXNoZWxsIFwKLS0gCjIuMzkuMgoK

--===============6216862154294336828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.32.dist-info moved to /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.33.dist-info

--===============6216862154294336828==--

