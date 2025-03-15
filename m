Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019E8C35FF6
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10358.1742048293296256688
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hX+GbA7N;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=aywnTj0p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101959a2b946c-0ba1ffa8-3cf7-4ebf-bd19-7112bf2daac8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xlml1UAVSXIP80oAGW8uXzaMbaKzLGYakkMhJYt/Wsw=;
	b=hX+GbA7NaI2igVLyhr9L1uhCtcBt3etFhBbReqKqVKTCxcV6v7UzU12tub04BXX3
	jockC95/IMpGMfDBPejHpYeALi0HVbmM0Cvhsl6kgpGJ+QBOS+XyG6igMIfnGxA62ai
	znXZH6Vcls3RC2GgTz5UHAXu7L/1tLSZy6NZpbd4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xlml1UAVSXIP80oAGW8uXzaMbaKzLGYakkMhJYt/Wsw=;
	b=aywnTj0pJt5g6vKlGBHeRUH/RYazZrvrnwXyI1kJNubPIadKGzENqiuFOgQJTldC
	xY477SNS3OUAj9ifZeOW0ufcBkMBYucvRZxoEQ1BARU5MjlVhOU8RDjlHdm67Vs0pU7
	9ZoKp0J7BrffOu8b0eUV4wBSud5qOn3l/MKJqLCo=
Content-Type: multipart/mixed; boundary="===============6935432747004979599=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.3.13.13 SUCCEEDED
Message-ID: <010101959a2b946c-0ba1ffa8-3cf7-4ebf-bd19-7112bf2daac8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212922

--===============6935432747004979599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.3.13.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.2.18.16-2025..patch
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
From 4c50ed4156d564f3884dec80b05f421fac77206a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 09:49:24 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.2.18.16 ->
 2025.3.13.13

---
 ...025.2.18.16.bb => python3-trove-classifiers_2025.3.13.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.2.18.16.bb => python3-trove-classifiers_2025.3.13.13.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
index 6bdce9dc79..f2b06b2919 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b1ee2e1668589217d4edf506743e28b1834da128f8a122bad522c02d837006e1"
+SRC_URI[sha256sum] = "2a5e24ddafb20da2225a825fe167c4fd4ecbf312cef4310d67f19dc40da7dc8d"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.44.1


--===============6935432747004979599==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.2.18.16-2025..patch"

RnJvbSA0YzUwZWQ0MTU2ZDU2NGYzODg0ZGVjODBiMDVmNDIxZmFjNzcyMDZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDk6NDk6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjUuMi4xOC4xNiAtPgogMjAyNS4z
LjEzLjEzCgotLS0KIC4uLjAyNS4yLjE4LjE2LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNS4zLjEzLjEzLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS4yLjE4LjE2LmJiID0+IHB5dGhvbjMtdHJvdmUt
Y2xhc3NpZmllcnNfMjAyNS4zLjEzLjEzLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjIuMTgu
MTYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3Np
ZmllcnNfMjAyNS4zLjEzLjEzLmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1
LjIuMTguMTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjMuMTMuMTMuYmIKaW5kZXggNmJkY2U5ZGM3OS4uZjJi
MDZiMjkxOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMi4xOC4xNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS4zLjEzLjEzLmJiCkBA
IC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS90cm92ZS1j
bGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYjFlZTJlMTY2ODU4OTIxN2Q0ZWRmNTA2NzQzZTI4YjE4MzRk
YTEyOGY4YTEyMmJhZDUyMmMwMmQ4MzcwMDZlMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyYTVl
MjRkZGFmYjIwZGEyMjI1YTgyNWZlMTY3YzRmZDRlY2JmMzEyY2VmNDMxMGQ2N2YxOWRjNDBkYTdk
YzhkIgogCiBQWVBJX1BBQ0tBR0UgPSAidHJvdmVfY2xhc3NpZmllcnMiCiBVUFNUUkVBTV9DSEVD
S19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgotLSAKMi40NC4xCgo=

--===============6935432747004979599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2025.2.18.16" to "2025.3.13.13"
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.2.18.16.tar.gz;downloadfilename=trove_classifiers-2025.2.18.16.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.3.13.13.tar.gz;downloadfilename=trove_classifiers-2025.3.13.13.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2025.2.18.16 [default] to 2025.3.13.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.2.18.16" to "2025.3.13.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.2.18.16 [default] to 2025.3.13.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.2.18.16" to "2025.3.13.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.2.18.16 [default] to 2025.3.13.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.2.18.16" to "2025.3.13.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.2.18.16 [default] to 2025.3.13.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.2.18.16" to "2025.3.13.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.2.18.16 [default] to 2025.3.13.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.2.18.16" to "2025.3.13.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.2.18.16 [default] to 2025.3.13.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.2.18.16" to "2025.3.13.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.2.18.16 [default] to 2025.3.13.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.2.18.16" to "2025.3.13.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.2.18.16 [default] to 2025.3.13.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.2.18.16" to "2025.3.13.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.2.18.16 [default] to 2025.3.13.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 93215 to 93387 (+0%)
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.2.18.16.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.13.13.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.2.18.16.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.13.13.dist-info

--===============6935432747004979599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.2.18.16.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.13.13.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.2.18.16.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.13.13.dist-info

--===============6935432747004979599==--

