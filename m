Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CBDC27C52
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.832.1686887483844981475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LfxEunYW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188c2544504-d85a0a8d-6aed-4ac4-b3eb-6531920d8374-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lx0eqFB3K8ngvUQEqgz0CQKuGswsHcu02MX0UXT0SsI=;
	b=LfxEunYWm5zCRJJqmXeus61NMkIOLMoHXU9d3e9LQ5yTEXzvDUSQ4M0FMrViDDMx
	JH/D51gn/fKvU8tC7p1fBoBzTfchIGBrV4iyHrCt+9b4s+iQuDbVKqLZIN0lT2JSb4o
	WxCgRzf1ZAuCPGIDD3EKFJXkwQ1s0OYO2Sb/reS0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lx0eqFB3K8ngvUQEqgz0CQKuGswsHcu02MX0UXT0SsI=;
	b=Bo5zE0XErII0t40GwfoqXLGWdHmemJkmzF1JVMiPdKpLkHUEf9xEBvGaK119nsSA
	RVZhI0srmWR5jS5jL5LC+lH9Do7K0V30BLtsuftn50PEUsyNTQWHE+c6Q9pk8oB3obV
	tf2LrKby5uoO9uSLMODnUzvmdgX/gyzGK9n4YJvo=
Content-Type: multipart/mixed; boundary="===============0327293549197915061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 6.6.0 SUCCEEDED
Message-ID: <01010188c2544504-d85a0a8d-6aed-4ac4-b3eb-6531920d8374-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182934

--===============0327293549197915061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *6.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-6.2.0-6.6.0.patch
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
From 8bbf667f082819db45ec8709e971a7e4b4f9c85c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:21:48 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 6.2.0 -> 6.6.0

---
 ...ib-metadata_6.2.0.bb => python3-importlib-metadata_6.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_6.2.0.bb => python3-importlib-metadata_6.6.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_6.6.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_6.6.0.bb
index 3e9b40ee9d..34bc55b0e1 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.6.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "9127aad2f49d7203e7112098c12b92e4fd1061ccd18548cdfdc49171a8c073cc"
+SRC_URI[sha256sum] = "92501cdf9cc66ebd3e612f1b4f0c0765dfa42f0fa38ffb319b6bd84dd675d705"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.39.2


--===============0327293549197915061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.2.0.tar.gz;downloadfilename=importlib_metadata-6.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.6.0.tar.gz;downloadfilename=importlib_metadata-6.6.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 134917 to 144970 (+7%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.2.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.6.0.dist-info

--===============0327293549197915061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.2.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.6.0.dist-info

--===============0327293549197915061==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-6.2.0-6.6.0.patch"

RnJvbSA4YmJmNjY3ZjA4MjgxOWRiNDVlYzg3MDllOTcxYTdlNGI0ZjljODVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6MjE6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YTogdXBncmFkZSA2LjIuMCAtPiA2LjYuMAoKLS0tCiAu
Li5pYi1tZXRhZGF0YV82LjIuMC5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjYu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWltcG9ydGxp
Yi1tZXRhZGF0YV82LjIuMC5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjYuMC5i
Yn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1w
b3J0bGliLW1ldGFkYXRhXzYuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuNi4wLmJiCmluZGV4IDNlOWI0MGVl
OWQuLjM0YmM1NWIwZTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNi4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjYuMC5iYgpAQCAtOCw3
ICs4LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIFBZUElf
UEFDS0FHRSA9ICJpbXBvcnRsaWJfbWV0YWRhdGEiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIv
aW1wb3J0bGliLW1ldGFkYXRhLyg/UDxwdmVyPihcZCtbXC5cLV9dKikrKS8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI5MTI3YWFkMmY0OWQ3MjAzZTcxMTIwOThjMTJiOTJlNGZkMTA2MWNjZDE4
NTQ4Y2RmZGM0OTE3MWE4YzA3M2NjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkyNTAxY2RmOWNj
NjZlYmQzZTYxMmYxYjRmMGMwNzY1ZGZhNDJmMGZhMzhmZmIzMTliNmJkODRkZDY3NWQ3MDUiCiAK
IFMgPSAiJHtXT1JLRElSfS9pbXBvcnRsaWJfbWV0YWRhdGEtJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============0327293549197915061==--

