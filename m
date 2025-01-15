Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D266C021A3
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.17801.1736936771106152206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YOnSq6nO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XDMHW+zk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010194697fcb83-1aef548f-3c79-417e-946c-098a47f29136-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mXWsYRWXDTTXIXi5AbTTiCl/aJt4aqHCnXlKDGN0/OI=;
	b=YOnSq6nOtuTEKFvg5aV8OPG6IefuT8UFs4MnsR+7W7tmjcmx0WNx7xV9T/DDee06
	Hs9IGKoFx1lroXyuBln8hwnxtUeKB46W8PDLT2tIOXxmQO8CvnvMk3QIUbmFA2ptPA7
	OAF5zeB/KD+zBaTRVk5Dy8NCdlwTEXTCrc+0JwmI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mXWsYRWXDTTXIXi5AbTTiCl/aJt4aqHCnXlKDGN0/OI=;
	b=XDMHW+zk/vgAiJvCvE/tudhLE/E/fgbBsXlrGwVb9NxKYrYQ57Rba3qqJFOSNloL
	GpqFOX59MBRuKe5V2UBdLE6Inwb/z+4jtmc54x7+XYRpAd9ReXOrJ7uu38/FP3vxTkI
	fOyBbJooQ6DLPj5VOYfKls7dhq5xlbMR8blo/86g=
Content-Type: multipart/mixed; boundary="===============8604146292487237314=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.18.10 SUCCEEDED
Message-ID: <01010194697fcb83-1aef548f-3c79-417e-946c-098a47f29136-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209847

--===============8604146292487237314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-ruamel-yaml* to *0.18.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.18.9-0.18.10.patch
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
From 7115905603760a8e458c6e967c79fb00903b783a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:47:12 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.18.9 -> 0.18.10

---
 ...on3-ruamel-yaml_0.18.9.bb => python3-ruamel-yaml_0.18.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.9.bb => python3-ruamel-yaml_0.18.10.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
index efc07169f7..02b04e3c0c 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "59d0f8b10c658bd55ecd107e334d4117d766a2b9cc8f5176afcdadcff6f84a5e"
+SRC_URI[sha256sum] = "20c86ab29ac2153f80a428e1254a8adf686d3383df04490514ca3b79a362db58"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.44.1


--===============8604146292487237314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-ruamel-yaml: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.9.tar.gz;downloadfilename=ruamel.yaml-0.18.9.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.10.tar.gz;downloadfilename=ruamel.yaml-0.18.10.tar.gz"
packages/core2-64-poky-linux/python3-ruamel-yaml: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1199703 to 1200073 (+0%)
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.18.9" to "0.18.10"
Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/WHEEL was removed

--===============8604146292487237314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/WHEEL was removed

--===============8604146292487237314==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.18.9-0.18.10.patch"

RnJvbSA3MTE1OTA1NjAzNzYwYThlNDU4YzZlOTY3Yzc5ZmIwMDkwM2I3ODNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6NDc6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJ1YW1lbC15YW1sOiB1cGdyYWRlIDAuMTguOSAtPiAwLjE4LjEwCgotLS0KIC4uLm9u
My1ydWFtZWwteWFtbF8wLjE4LjkuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjEwLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcnVhbWVsLXlhbWxf
MC4xOC45LmJiID0+IHB5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4xMC5iYn0gKDg1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxf
MC4xOC45LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15
YW1sXzAuMTguMTAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTguOS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTgu
MTAuYmIKaW5kZXggZWZjMDcxNjlmNy4uMDJiMDRlM2MwYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTguOS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4xMC5i
YgpAQCAtOSw3ICs5LDcgQEAgVVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNLQUdFID0gIiR7UFlQSV9Q
QUNLQUdFfSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjU5ZDBmOGIxMGM2NThiZDU1ZWNkMTA3ZTMzNGQ0MTE3ZDc2
NmEyYjljYzhmNTE3NmFmY2RhZGNmZjZmODRhNWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjBj
ODZhYjI5YWMyMTUzZjgwYTQyOGUxMjU0YThhZGY2ODZkMzM4M2RmMDQ0OTA1MTRjYTNiNzlhMzYy
ZGI1OCIKIAogUkRFUEVORFM6JHtQTn0gKz0gIlwKICAgICBweXRob24zLXNoZWxsIFwKLS0gCjIu
NDQuMQoK

--===============8604146292487237314==--

