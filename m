Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6D7C369D2
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20159.1744723979433064394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MzWPgnkW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=S84XGihl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019639a72a94-72f322da-f216-4927-9a0e-b16df6871ef2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723979;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kLpuOuIOAXUdW5ANXgyfR25jrLMCbPBwIyCj+B5pN7A=;
	b=MzWPgnkW6hDicjZNiO+YhPYstZuTBqwiuopJxUmZbm/QMx8aqJeWutVCz06nq3J6
	IpAcqery+BpMeg69hoHm7bwd55mcpoK/gSFf0iwzI7EpEVFN6ckg854pwqLBJ2g9amJ
	7QFyR7E2e7i0MnY5W5/ScSqVmxdu59JV4SlzJRjI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723979;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kLpuOuIOAXUdW5ANXgyfR25jrLMCbPBwIyCj+B5pN7A=;
	b=S84XGihlgmtkUdY65Amr/G6Sz1l3p3EsWQXjBJLBbZKm6IQoqWGYpLNrWHtzyhsm
	QSBT4tXahIPIjS8khPui165G2hj3dk6zG4L5A9fxeevAvLTDNC3+bUId42760T0OZyN
	cAwv/zhH1+1jznQ9+SZ6pnLzV1Dbyq4Tq/Eu0dag=
Content-Type: multipart/mixed; boundary="===============8502981741320029289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.4.11.15 SUCCEEDED
Message-ID: <0101019639a72a94-72f322da-f216-4927-9a0e-b16df6871ef2-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214885

--===============8502981741320029289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.4.11.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.3.19.19-2025..patch
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
From e794df1b80724aefb4a3914a7f21800c1efa4998 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:47:18 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.3.19.19 ->
 2025.4.11.15

---
 ...025.3.19.19.bb => python3-trove-classifiers_2025.4.11.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.3.19.19.bb => python3-trove-classifiers_2025.4.11.15.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.4.11.15.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.4.11.15.bb
index 39fb997e88..34ced66939 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.4.11.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "98e9d396fe908d5f43b7454fa4c43d17cd0fdadf046f45fb38a5e3af8d959ecd"
+SRC_URI[sha256sum] = "634728aa6698dc1ae3db161da94d9e4c7597a9a5da2c4410211b36f15fed60fc"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============8502981741320029289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.3.19.19-2025..patch"

RnJvbSBlNzk0ZGYxYjgwNzI0YWVmYjRhMzkxNGE3ZjIxODAwYzFlZmE0OTk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6NDc6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjUuMy4xOS4xOSAtPgogMjAyNS40
LjExLjE1CgotLS0KIC4uLjAyNS4zLjE5LjE5LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNS40LjExLjE1LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS4zLjE5LjE5LmJiID0+IHB5dGhvbjMtdHJvdmUt
Y2xhc3NpZmllcnNfMjAyNS40LjExLjE1LmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjMuMTku
MTkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3Np
ZmllcnNfMjAyNS40LjExLjE1LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1
LjMuMTkuMTkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjQuMTEuMTUuYmIKaW5kZXggMzlmYjk5N2U4OC4uMzRj
ZWQ2NjkzOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMy4xOS4xOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS40LjExLjE1LmJiCkBA
IC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS90cm92ZS1j
bGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOThlOWQzOTZmZTkwOGQ1ZjQzYjc0NTRmYTRjNDNkMTdjZDBm
ZGFkZjA0NmY0NWZiMzhhNWUzYWY4ZDk1OWVjZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MzQ3
MjhhYTY2OThkYzFhZTNkYjE2MWRhOTRkOWU0Yzc1OTdhOWE1ZGEyYzQ0MTAyMTFiMzZmMTVmZWQ2
MGZjIgogCiBQWVBJX1BBQ0tBR0UgPSAidHJvdmVfY2xhc3NpZmllcnMiCiBVUFNUUkVBTV9DSEVD
S19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgotLSAKMi40Ny4xCgo=

--===============8502981741320029289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.3.19.19.tar.gz;downloadfilename=trove_classifiers-2025.3.19.19.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.4.11.15.tar.gz;downloadfilename=trove_classifiers-2025.4.11.15.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2025.3.19.19 [default] to 2025.4.11.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2025.3.19.19" to "2025.4.11.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.3.19.19 [default] to 2025.4.11.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.3.19.19" to "2025.4.11.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.3.19.19 [default] to 2025.4.11.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.3.19.19" to "2025.4.11.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.3.19.19 [default] to 2025.4.11.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.3.19.19" to "2025.4.11.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.3.19.19 [default] to 2025.4.11.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.3.19.19" to "2025.4.11.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.3.19.19 [default] to 2025.4.11.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.3.19.19" to "2025.4.11.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.3.19.19 [default] to 2025.4.11.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.3.19.19" to "2025.4.11.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.3.19.19 [default] to 2025.4.11.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.3.19.19" to "2025.4.11.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.3.19.19 [default] to 2025.4.11.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 93568 to 93628 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.3.19.19" to "2025.4.11.15"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.11.15.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.11.15.dist-info

--===============8502981741320029289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.11.15.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.11.15.dist-info

--===============8502981741320029289==--

