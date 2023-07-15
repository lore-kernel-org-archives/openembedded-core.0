Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B553AC27C5E
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.6033.1689456455017974743
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YXOOdvMg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101895b73aa6e-124fedd4-e937-4f97-82ef-6b7c1646c2d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fI9NWHnKDLAASxBPcwzXRDhYI6kY8zsusgZHsiEvVgc=;
	b=YXOOdvMgTNkZBMbPG0Z80Y8k/vC2cl2HxWSxkByok8qJaxGbLrF6okRE5Z8sPsrj
	6vwb1q4WYNKZaqZve4cnrnm2LmQ1Iz/fq1CUjiyvJzIIxThUA1FZ9cpokVNQrGiW7Rn
	XeSjpkNv89wRMI2xIAwSEmHwWTrwcsM/rimSEUAk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fI9NWHnKDLAASxBPcwzXRDhYI6kY8zsusgZHsiEvVgc=;
	b=CKStLpeUiRjtL5N1aCCAgEs0NrA4cy7/cnRY1tOyAGTam1yECWxYu0Wj/i0bNAp+
	pwW2ssPQyCsKzBBRjSVTF5SPCdihLZ8dmrc9JX1/5ivKgGrNE2Pe/eJN40VutLZTpfO
	/Yzzv8+PYF4kwbbl5Ltvz/dFui2iKYsbdePG3QO4=
Content-Type: multipart/mixed; boundary="===============1715459489694128484=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 6.8.0 SUCCEEDED
Message-ID: <010101895b73aa6e-124fedd4-e937-4f97-82ef-6b7c1646c2d9-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184353

--===============1715459489694128484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *6.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-6.7.0-6.8.0.patch
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
From 1a731bd0761168c36b581dea06095123544aa5a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 12:19:20 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 6.7.0 -> 6.8.0

---
 ...ib-metadata_6.7.0.bb => python3-importlib-metadata_6.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_6.7.0.bb => python3-importlib-metadata_6.8.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
index 5ad7ae81ad..b8dd4bb701 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "1aaf550d4f73e5d6783e7acb77aec43d49da8017410afae93822cc9cca98c4d4"
+SRC_URI[sha256sum] = "dbace7892d8c0c4ac1ad096662232f831d4e64f4c4545bd53016a3e9d4654743"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.39.2


--===============1715459489694128484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 6.7.0 [default] to 6.8.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "6.7.0" to "6.8.0"
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.7.0.tar.gz;downloadfilename=importlib_metadata-6.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.8.0.tar.gz;downloadfilename=importlib_metadata-6.8.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 6.7.0 [default] to 6.8.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "6.7.0" to "6.8.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 6.7.0 [default] to 6.8.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "6.7.0" to "6.8.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 6.7.0 [default] to 6.8.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "6.7.0" to "6.8.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 6.7.0 [default] to 6.8.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "6.7.0" to "6.8.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 6.7.0 [default] to 6.8.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "6.7.0" to "6.8.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 6.7.0 [default] to 6.8.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "6.7.0" to "6.8.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 146024 to 145900 (-0%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 6.7.0 [default] to 6.8.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "6.7.0" to "6.8.0"
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.7.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.8.0.dist-info

--===============1715459489694128484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.7.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.8.0.dist-info

--===============1715459489694128484==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-6.7.0-6.8.0.patch"

RnJvbSAxYTczMWJkMDc2MTE2OGMzNmI1ODFkZWEwNjA5NTEyMzU0NGFhNWE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTI6MTk6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YTogdXBncmFkZSA2LjcuMCAtPiA2LjguMAoKLS0tCiAu
Li5pYi1tZXRhZGF0YV82LjcuMC5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82Ljgu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWltcG9ydGxp
Yi1tZXRhZGF0YV82LjcuMC5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjguMC5i
Yn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuNy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjguMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1w
b3J0bGliLW1ldGFkYXRhXzYuNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuOC4wLmJiCmluZGV4IDVhZDdhZTgx
YWQuLmI4ZGQ0YmI3MDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNi43LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjguMC5iYgpAQCAtOCw3
ICs4LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIFBZUElf
UEFDS0FHRSA9ICJpbXBvcnRsaWJfbWV0YWRhdGEiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIv
aW1wb3J0bGliLW1ldGFkYXRhLyg/UDxwdmVyPihcZCtbXC5cLV9dKikrKS8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIxYWFmNTUwZDRmNzNlNWQ2NzgzZTdhY2I3N2FlYzQzZDQ5ZGE4MDE3NDEw
YWZhZTkzODIyY2M5Y2NhOThjNGQ0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRiYWNlNzg5MmQ4
YzBjNGFjMWFkMDk2NjYyMjMyZjgzMWQ0ZTY0ZjRjNDU0NWJkNTMwMTZhM2U5ZDQ2NTQ3NDMiCiAK
IFMgPSAiJHtXT1JLRElSfS9pbXBvcnRsaWJfbWV0YWRhdGEtJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============1715459489694128484==--

