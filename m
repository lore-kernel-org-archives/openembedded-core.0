Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD202C5320D
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.75736.1722536822878673328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=P3hh2LHZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hw0jaNOR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101910f321279-0ac6a78f-435d-4b45-9423-b42f5befa024-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536825;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R+JXO52R1Y/YA5dDG1fvX9pJo8aZkGVEOT4mO9Fvpqg=;
	b=P3hh2LHZvmxeJfXpEtBb0/hBCwIpztxPtGP29S8reo56P6hR2k3D+h+/pot6rAh4
	zx+L1oTVMyiq2swsOgFJTfN2BV2Wyjtmi3JFLKhAQofwu7k8gGR+aOiId3jRVEowZ9u
	CkmsHeSXD+Qe56T0/UVS5tezJfbLinldjZI7H9wY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536825;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R+JXO52R1Y/YA5dDG1fvX9pJo8aZkGVEOT4mO9Fvpqg=;
	b=hw0jaNORcMwPgwRpfhj2L06HuZ+a6mFLGA/zxamOMZCpBtgwkutJ6I7iQGbxlG5w
	HewiLsFM0JljqXpI4AN4xFlOl9SwXoQUBMUtrs0KpVZyBjNf7+Bb3YChZlYMwC1oJid
	Yncr/AH6RLrT2wRLyDee93omPTh+eE/O74RwrWmw=
Content-Type: multipart/mixed; boundary="===============6365916778213421317=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-alabaster: upgrading to 1.0.0 SUCCEEDED
Message-ID: <010101910f321279-0ac6a78f-435d-4b45-9423-b42f5befa024-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202797

--===============6365916778213421317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-alabaster* to *1.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-alabaster-upgrade-0.7.16-1.0.0.patch
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
From 4f655a04e0e5f80951777d069b03ea1f4cacfb14 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 10:18:20 +0000
Subject: [PATCH] python3-alabaster: upgrade 0.7.16 -> 1.0.0

---
 .../{python3-alabaster_0.7.16.bb => python3-alabaster_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-alabaster_0.7.16.bb => python3-alabaster_1.0.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb b/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-alabaster_0.7.16.bb
rename to meta/recipes-devtools/python/python3-alabaster_1.0.0.bb
index c61fce454f..40be6039eb 100644
--- a/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb
+++ b/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=21860fdb805bf4e0bfaf94b566b747fa"
 
-SRC_URI[sha256sum] = "75a8b99c28a5dad50dd7f8ccdd447a121ddb3892da9e53d1ca5cca3106d58d65"
+SRC_URI[sha256sum] = "c00dca57bca26fa62a6d7d0a9fcce65f3e026e9bfe33e9c538fd3fbb2144fd9e"
 
 inherit python_flit_core pypi
 
-- 
2.44.0


--===============6365916778213421317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: FILELIST: directory renamed /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info -> /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info, added "/usr/lib/python3.12/site-packages/alabaster/static/github-banner.svg"
Changes to packages/core2-64-poky-linux/python3-alabaster (sysroot):
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/LICENSE.rst was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/alabaster/static/github-banner.svg was added
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/LICENSE.rst was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/WHEEL was removed

--===============6365916778213421317==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-alabaster-upgrade-0.7.16-1.0.0.patch"

RnJvbSA0ZjY1NWEwNGUwZTVmODA5NTE3NzdkMDY5YjAzZWExZjRjYWNmYjE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMDoxODoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYWxhYmFzdGVyOiB1cGdyYWRlIDAuNy4xNiAtPiAxLjAuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtYWxhYmFzdGVyXzAuNy4xNi5iYiA9PiBweXRob24zLWFsYWJhc3Rlcl8xLjAuMC5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWFsYWJhc3Rlcl8wLjcuMTYu
YmIgPT4gcHl0aG9uMy1hbGFiYXN0ZXJfMS4wLjAuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFsYWJhc3Rlcl8wLjcuMTYuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYWxhYmFzdGVyXzEuMC4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1hbGFiYXN0ZXJfMC43LjE2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYWxhYmFzdGVyXzEuMC4wLmJiCmluZGV4IGM2MWZjZTQ1NGYu
LjQwYmU2MDM5ZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1hbGFiYXN0ZXJfMC43LjE2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1hbGFiYXN0ZXJfMS4wLjAuYmIKQEAgLTUsNyArNSw3IEBAIFNFQ1RJT04gPSAi
ZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLnJzdDttZDU9MjE4NjBmZGI4MDViZjRlMGJmYWY5NGI1NjZiNzQ3
ZmEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3NWE4Yjk5YzI4YTVkYWQ1MGRkN2Y4Y2NkZDQ0
N2ExMjFkZGIzODkyZGE5ZTUzZDFjYTVjY2EzMTA2ZDU4ZDY1IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImMwMGRjYTU3YmNhMjZmYTYyYTZkN2QwYTlmY2NlNjVmM2UwMjZlOWJmZTMzZTljNTM4ZmQz
ZmJiMjE0NGZkOWUiCiAKIGluaGVyaXQgcHl0aG9uX2ZsaXRfY29yZSBweXBpCiAKLS0gCjIuNDQu
MAoK

--===============6365916778213421317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-alabaster: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/alabaster/alabaster-0.7.16.tar.gz;downloadfilename=alabaster-0.7.16.tar.gz" to "https://files.pythonhosted.org/packages/source/a/alabaster/alabaster-1.0.0.tar.gz;downloadfilename=alabaster-1.0.0.tar.gz"
packages/core2-64-poky-linux/python3-alabaster: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-dbg: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-dbg: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-dev: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-dev: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-doc: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-doc: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-locale: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-locale: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-src: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-src: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-staticdev: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-staticdev: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: FILELIST: directory renamed /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info -> /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info, added "/usr/lib/python3.12/site-packages/alabaster/static/github-banner.svg"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: PKGSIZE changed from 42751 to 43118 (+1%)
Changes to packages/core2-64-poky-linux/python3-alabaster (sysroot):
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/LICENSE.rst was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/alabaster/static/github-banner.svg was added
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/LICENSE.rst was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/WHEEL was removed

--===============6365916778213421317==--

