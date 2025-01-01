Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45990C0218E
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11339.1735723946852807550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HVgLawZn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZC4snuAD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194213590b3-b7e8f9c9-182a-45fe-be0b-62a6f8a16d23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723946;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=indo0aheU9RC7VZw+wkidB5oRAbUBbJG8ucz8N3V+uY=;
	b=HVgLawZnRJo0YwWCNv/0NWMt9xkRXK/sIKOsKYFbSly9mOQgut10ioSaTM6znayP
	Li+WZvVqpPFyoebsyPdtyksygjLO3KSILR6eMDuFrr71v0Tda7F+1OiH68i8ahOj4U4
	4aISjB4kUsnd0wtUz/MG5n8prIaauPaj9c8dnneM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723946;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=indo0aheU9RC7VZw+wkidB5oRAbUBbJG8ucz8N3V+uY=;
	b=ZC4snuADufo1q+FtZHAsK2TfVy1ZqHdeniWpPdamagSsVun23VD+ODGY+u2bxF6R
	MEHfIFC0V87KD8CI28ivfK/ukVAe7vcdZAtPT7z5+ZdRo48QscjYID7rl4c0F/bzEb7
	KasVPPivHBN7AnG8sdtw+V+2gMDVEyug83Og7FYk=
Content-Type: multipart/mixed; boundary="===============9022556118596316220=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.18.7 SUCCEEDED
Message-ID: <01010194213590b3-b7e8f9c9-182a-45fe-be0b-62a6f8a16d23-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209215

--===============9022556118596316220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-ruamel-yaml* to *0.18.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.18.6-0.18.7.patch
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
From 3904cba8cc6b875feb2dc5870f1ea0fe00ccf334 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 07:23:51 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.18.6 -> 0.18.7

---
 ...hon3-ruamel-yaml_0.18.6.bb => python3-ruamel-yaml_0.18.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.6.bb => python3-ruamel-yaml_0.18.7.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.7.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.7.bb
index 8cdcee9ec2..137b528913 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.7.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f28863d9c45aac311b"
+SRC_URI[sha256sum] = "270638acec6659f7bb30f4ea40083c9a0d0d5afdcef5e63d666f11209091531a"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.44.1


--===============9022556118596316220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-ruamel-yaml: PKGV changed from 0.18.6 [default] to 0.18.7 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml: PV changed from "0.18.6" to "0.18.7"
packages/core2-64-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.6.tar.gz;downloadfilename=ruamel.yaml-0.18.6.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.7.tar.gz;downloadfilename=ruamel.yaml-0.18.7.tar.gz"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.18.6 [default] to 0.18.7 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.18.6" to "0.18.7"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.18.6 [default] to 0.18.7 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.18.6" to "0.18.7"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.18.6 [default] to 0.18.7 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.18.6" to "0.18.7"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.18.6 [default] to 0.18.7 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.18.6" to "0.18.7"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.18.6 [default] to 0.18.7 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.18.6" to "0.18.7"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.18.6 [default] to 0.18.7 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.18.6" to "0.18.7"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1201120 to 1197953 (-0%)
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.18.6 [default] to 0.18.7 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.18.6" to "0.18.7"
Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.6.dist-info moved to /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.7.dist-info

--===============9022556118596316220==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.18.6-0.18.7.patch"

RnJvbSAzOTA0Y2JhOGNjNmI4NzVmZWIyZGM1ODcwZjFlYTBmZTAwY2NmMzM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNzoyMzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xOC42IC0+IDAuMTguNwoKLS0tCiAuLi5ob24z
LXJ1YW1lbC15YW1sXzAuMTguNi5iYiA9PiBweXRob24zLXJ1YW1lbC15YW1sXzAuMTguNy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJ1YW1lbC15YW1sXzAu
MTguNi5iYiA9PiBweXRob24zLXJ1YW1lbC15YW1sXzAuMTguNy5iYn0gKDg1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4x
OC42LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1s
XzAuMTguNy5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC42LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC43LmJi
CmluZGV4IDhjZGNlZTllYzIuLjEzN2I1Mjg5MTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjYuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTguNy5iYgpAQCAt
OSw3ICs5LDcgQEAgVVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNLQUdFID0gIiR7UFlQSV9QQUNLQUdF
fSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjhiMjdlNmEyMTdlNzg2YzZmYmU1NjM0ZDhmM2YxMWJjNjNlMGY4MGY2
YTU4OTBmMjg4NjNkOWM0NWFhYzMxMWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjcwNjM4YWNl
YzY2NTlmN2JiMzBmNGVhNDAwODNjOWEwZDBkNWFmZGNlZjVlNjNkNjY2ZjExMjA5MDkxNTMxYSIK
IAogUkRFUEVORFM6JHtQTn0gKz0gIlwKICAgICBweXRob24zLXNoZWxsIFwKLS0gCjIuNDQuMQoK

--===============9022556118596316220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.6.dist-info moved to /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.7.dist-info

--===============9022556118596316220==--

