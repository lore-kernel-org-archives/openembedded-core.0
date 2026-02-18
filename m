Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9271BE9A04F
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1425.1771440105404873589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P77WX5m7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mt05GgVY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c720ee4f4-beb714ed-883c-433e-a890-db8952300533-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440104;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DAc85SqGlOsuwUh9FJjP0rKKFNERScdOwdqFhHoGlvY=;
	b=P77WX5m7JUzvSY6/QSJf8MNOm/biMkJ1ZCICk9hgtLACCG4G5sY3e2yhlJSktgtq
	DA1l4sPoaKwuDyuME3Ll1aq7/7Xox9hiieeSsQWdk+fmVOU7P14Tmd3FHJEJ2mf0lFj
	nd1s/c0YnsDvhmHspMkKjaLtPhvfWfHu6BumK1QU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440104;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DAc85SqGlOsuwUh9FJjP0rKKFNERScdOwdqFhHoGlvY=;
	b=mt05GgVYSX9vFBxgmRad7TQt+OdVA20WqeQhmD6i9/8ydrOAdRrhMYyuc81xIP0x
	22bMoC2H4XpnUIae7R5lKozUHFzUb+fupI0bf5H3VcYtb6MtO4hcRmgSarrv+zDuoiQ
	KtXopat1ki5sKJPoSzdfG9FVA4TESlcvvCQyCd4k=
Content-Type: multipart/mixed; boundary="===============5560755158928691837=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2026.1.14.14 SUCCEEDED
Message-ID: <0101019c720ee4f4-beb714ed-883c-433e-a890-db8952300533-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231362

--===============5560755158928691837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2026.1.14.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.12.1.14-2026..patch
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
From b8689193a3f9365af4869e29864a1772a39a2692 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:58:52 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.12.1.14 ->
 2026.1.14.14

---
 ...025.12.1.14.bb => python3-trove-classifiers_2026.1.14.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.12.1.14.bb => python3-trove-classifiers_2026.1.14.14.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
index 5ca8ff24c0..c334fdfc72 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a74f0400524fc83620a9be74a07074b5cbe7594fd4d97fd4c2bfde625fdc1633"
+SRC_URI[sha256sum] = "00492545a1402b09d4858605ba190ea33243d361e2b01c9c296ce06b5c3325f3"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============5560755158928691837==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.12.1.14-2026..patch"

RnJvbSBiODY4OTE5M2EzZjkzNjVhZjQ4NjllMjk4NjRhMTc3MmEzOWEyNjkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6NTg6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjUuMTIuMS4xNCAtPgogMjAyNi4x
LjE0LjE0CgotLS0KIC4uLjAyNS4xMi4xLjE0LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNi4xLjE0LjE0LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS4xMi4xLjE0LmJiID0+IHB5dGhvbjMtdHJvdmUt
Y2xhc3NpZmllcnNfMjAyNi4xLjE0LjE0LmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjEyLjEu
MTQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3Np
ZmllcnNfMjAyNi4xLjE0LjE0LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1
LjEyLjEuMTQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjEuMTQuMTQuYmIKaW5kZXggNWNhOGZmMjRjMC4uYzMz
NGZkZmM3MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMTIuMS4xNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNi4xLjE0LjE0LmJiCkBA
IC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS90cm92ZS1j
bGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYTc0ZjA0MDA1MjRmYzgzNjIwYTliZTc0YTA3MDc0YjVjYmU3
NTk0ZmQ0ZDk3ZmQ0YzJiZmRlNjI1ZmRjMTYzMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMDQ5
MjU0NWExNDAyYjA5ZDQ4NTg2MDViYTE5MGVhMzMyNDNkMzYxZTJiMDFjOWMyOTZjZTA2YjVjMzMy
NWYzIgogCiBQWVBJX1BBQ0tBR0UgPSAidHJvdmVfY2xhc3NpZmllcnMiCiBVUFNUUkVBTV9DSEVD
S19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgotLSAKMi40Ny4xCgo=

--===============5560755158928691837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was removed

--===============5560755158928691837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers: PKGV changed from 2025.12.1.14 [default] to 2026.1.14.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PV changed from "2025.12.1.14" to "2026.1.14.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.12.1.14.tar.gz;downloadfilename=trove_classifiers-2025.12.1.14.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2026.1.14.14.tar.gz;downloadfilename=trove_classifiers-2026.1.14.14.tar.gz"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.12.1.14 [default] to 2026.1.14.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.12.1.14" to "2026.1.14.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.12.1.14 [default] to 2026.1.14.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.12.1.14" to "2026.1.14.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.12.1.14 [default] to 2026.1.14.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.12.1.14" to "2026.1.14.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.12.1.14 [default] to 2026.1.14.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.12.1.14" to "2026.1.14.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.12.1.14 [default] to 2026.1.14.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.12.1.14" to "2026.1.14.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.12.1.14 [default] to 2026.1.14.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.12.1.14" to "2026.1.14.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.12.1.14 [default] to 2026.1.14.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.12.1.14" to "2026.1.14.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.12.1.14 [default] to 2026.1.14.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 113032 to 113218 (+0%)
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.12.1.14" to "2026.1.14.14"
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was removed

--===============5560755158928691837==--

