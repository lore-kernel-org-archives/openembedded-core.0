Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40954CFC61B
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:17 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.53294.1728588973976252794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ggzG+zWm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NiPQbAsP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019277ee8524-396faef3-6300-4955-b1c5-30b44dcc06e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588973;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rMU0ynFVVW9VTHm1jtmHmMPZQ5XyZOiNNBYi579Eqx4=;
	b=ggzG+zWm/vQQ8HOs0d9bf8NdPK+IsDn0xTDACzGxWizND0G7VDZgiTpXGOmCPmzF
	Fn5IeXAmuVtd/x8gjFgmYCSqyU4VjxHXhp+O5g9znrYeO+Zi/wLVrNmXOq9D7cRgZuN
	p5tdhcoJ+lbpa6PJM9b8Nh27lEe2vqgGxn5+jwAM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588973;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rMU0ynFVVW9VTHm1jtmHmMPZQ5XyZOiNNBYi579Eqx4=;
	b=NiPQbAsP7KbxwbEtJFcjtIB4RZDX72cCe14ZWk9LHjDHZEgb35oN1t+xatMVqSkT
	6xYLmYDdZUI07pKUlJ7ww6VznSZ3Mqhwl8oOeFh+9pcOq8aceyHAXYUge4JG1SyEBqu
	yniaoDQhrCl7Fet5hqE1onl1wuKg+YarnhmqNky0=
Content-Type: multipart/mixed; boundary="===============0534793925327564386=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-metadata: upgrading to 0.8.1 SUCCEEDED
Message-ID: <0101019277ee8524-396faef3-6300-4955-b1c5-30b44dcc06e5-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205533

--===============0534793925327564386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyproject-metadata* to *0.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyproject-metadata-upgrade-0.8.0-0.8.1.patch
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
From ddd69b741e7d2604d6d42ac28589f4c33a78f0e7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 02:20:24 +0000
Subject: [PATCH] python3-pyproject-metadata: upgrade 0.8.0 -> 0.8.1

---
 ...ct-metadata_0.8.0.bb => python3-pyproject-metadata_0.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.8.0.bb => python3-pyproject-metadata_0.8.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.8.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.8.1.bb
index 8d00826f86..545a5efeda 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.1.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE = "pyproject_metadata"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "376d5a00764ac29440a54579f88e66b7d9cb7e629d35c35a1c7248bfebc9b455"
+SRC_URI[sha256sum] = "e6b494d4fbac8007ed0efd3a08df067bb28a299fb113b885ce77e492ad1f0600"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.44.1


--===============0534793925327564386==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyproject-metadata-upgrade-0.8.0-0.8.1.patch"

RnJvbSBkZGQ2OWI3NDFlN2QyNjA0ZDZkNDJhYzI4NTg5ZjRjMzNhNzhmMGU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDI6MjA6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cHJvamVjdC1tZXRhZGF0YTogdXBncmFkZSAwLjguMCAtPiAwLjguMQoKLS0tCiAu
Li5jdC1tZXRhZGF0YV8wLjguMC5iYiA9PiBweXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjgu
MS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5cHJvamVj
dC1tZXRhZGF0YV8wLjguMC5iYiA9PiBweXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjguMS5i
Yn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjguMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlw
cm9qZWN0LW1ldGFkYXRhXzAuOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuOC4xLmJiCmluZGV4IDhkMDA4MjZm
ODYuLjU0NWE1ZWZlZGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weXByb2plY3QtbWV0YWRhdGFfMC44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjguMS5iYgpAQCAtMTYs
NyArMTYsNyBAQCBQWVBJX1BBQ0tBR0UgPSAicHlwcm9qZWN0X21ldGFkYXRhIgogCiBpbmhlcml0
IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMzc2ZDVhMDA3NjRhYzI5NDQwYTU0NTc5Zjg4ZTY2YjdkOWNiN2U2MjlkMzVjMzVhMWM3MjQ4
YmZlYmM5YjQ1NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNmI0OTRkNGZiYWM4MDA3ZWQwZWZk
M2EwOGRmMDY3YmIyOGEyOTlmYjExM2I4ODVjZTc3ZTQ5MmFkMWYwNjAwIgogCiBSREVQRU5EUzok
e1BOfSArPSAiIFwKICAgICBweXRob24zLWxvZ2dpbmcgXAotLSAKMi40NC4xCgo=

--===============0534793925327564386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.12/site-packages/pyproject_metadata-0.8.0.dist-info moved to /usr/lib/python3.12/site-packages/pyproject_metadata-0.8.1.dist-info

--===============0534793925327564386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyproject-metadata: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata: PV changed from "0.8.0" to "0.8.1"
packages/core2-64-poky-linux/python3-pyproject-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.8.0.tar.gz;downloadfilename=pyproject_metadata-0.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.8.1.tar.gz;downloadfilename=pyproject_metadata-0.8.1.tar.gz"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PV changed from "0.8.0" to "0.8.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PV changed from "0.8.0" to "0.8.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PV changed from "0.8.0" to "0.8.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PV changed from "0.8.0" to "0.8.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PV changed from "0.8.0" to "0.8.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PV changed from "0.8.0" to "0.8.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGV changed from 0.8.0 [default] to 0.8.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PV changed from "0.8.0" to "0.8.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGSIZE changed from 52250 to 54339 (+4%)
Changes to packages/core2-64-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.12/site-packages/pyproject_metadata-0.8.0.dist-info moved to /usr/lib/python3.12/site-packages/pyproject_metadata-0.8.1.dist-info

--===============0534793925327564386==--

