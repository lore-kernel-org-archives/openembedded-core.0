Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86755D5E130
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17404.1765872149942206345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sHJ6Y7S/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZtLFJOf6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b262ea2ee-9ca252d5-8c26-4e2f-995f-a400a260349f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0qWSivYYJOzgOu5fK62I7cx28ZyDIP+frAUfRc710qM=;
	b=sHJ6Y7S/X3LPLA+TEesDVNCgKR6zsTgwVuf0d+326x3G3Ah12srU09HUYB9vNgga
	uKuHLaqgpfkTB5/UOmf/pBNMI4EsgCkUXosVcb+Ku3JhopNhRYG6oriMOHrp6vdmS+h
	2yBc2LjpYupplXz193qgN0uOlkZNcVbJ78eXupik=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0qWSivYYJOzgOu5fK62I7cx28ZyDIP+frAUfRc710qM=;
	b=ZtLFJOf6RJUkq5B/zzYWCxl8yNG9tQpnDg2p980/Y50z9rVka3b43cjSydSlV8OT
	QT8WYxxH0foj4dFJpgeMr5hRxCIaQk0E1/j7KNyRcfxKvVJ/sO4K5IwGn+nbMejr6ln
	nQk7RrAK/eo1heAYLQRRDGWSm5u4DWsdDpjuda/E=
Content-Type: multipart/mixed; boundary="===============5470539989940729075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.12.1.14 SUCCEEDED
Message-ID: <0101019b262ea2ee-9ca252d5-8c26-4e2f-995f-a400a260349f-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227831

--===============5470539989940729075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.12.1.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.9.11.17-2025..patch
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
From 712449eea49aa46936f035a3cce6c9dc9c4954d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:33:06 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.9.11.17 ->
 2025.12.1.14

---
 ...025.9.11.17.bb => python3-trove-classifiers_2025.12.1.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.9.11.17.bb => python3-trove-classifiers_2025.12.1.14.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
index 4bbdd243ef..5ca8ff24c0 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd"
+SRC_URI[sha256sum] = "a74f0400524fc83620a9be74a07074b5cbe7594fd4d97fd4c2bfde625fdc1633"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============5470539989940729075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was removed

--===============5470539989940729075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.9.11.17.tar.gz;downloadfilename=trove_classifiers-2025.9.11.17.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.12.1.14.tar.gz;downloadfilename=trove_classifiers-2025.12.1.14.tar.gz"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PV changed from "2025.9.11.17" to "2025.12.1.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PKGV changed from 2025.9.11.17 [default] to 2025.12.1.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.9.11.17" to "2025.12.1.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.9.11.17 [default] to 2025.12.1.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.9.11.17" to "2025.12.1.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.9.11.17 [default] to 2025.12.1.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.9.11.17" to "2025.12.1.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.9.11.17 [default] to 2025.12.1.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.9.11.17" to "2025.12.1.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.9.11.17 [default] to 2025.12.1.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.9.11.17" to "2025.12.1.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.9.11.17 [default] to 2025.12.1.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.9.11.17" to "2025.12.1.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.9.11.17 [default] to 2025.12.1.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.9.11.17" to "2025.12.1.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.9.11.17 [default] to 2025.12.1.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.9.11.17" to "2025.12.1.14"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.9.11.17 [default] to 2025.12.1.14 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info, directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 95627 to 95949 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.12.1.14.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was removed

--===============5470539989940729075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.9.11.17-2025..patch"

RnJvbSA3MTI0NDllZWE0OWFhNDY5MzZmMDM1YTNjY2U2YzlkYzljNDk1NGQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6MzM6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjUuOS4xMS4xNyAtPgogMjAyNS4x
Mi4xLjE0CgotLS0KIC4uLjAyNS45LjExLjE3LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNS4xMi4xLjE0LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS45LjExLjE3LmJiID0+IHB5dGhvbjMtdHJvdmUt
Y2xhc3NpZmllcnNfMjAyNS4xMi4xLjE0LmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjkuMTEu
MTcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3Np
ZmllcnNfMjAyNS4xMi4xLjE0LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1
LjkuMTEuMTcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjEyLjEuMTQuYmIKaW5kZXggNGJiZGQyNDNlZi4uNWNh
OGZmMjRjMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuOS4xMS4xNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS4xMi4xLjE0LmJiCkBA
IC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS90cm92ZS1j
bGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOTMxY2E5ODQxYTVlOWM5NDA4YmMyYWU2N2I1MGQyOGFjZjg1
YmVmNTYyMTliNTY4NjA4NzZkZDFmMmQwMjRkZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNzRm
MDQwMDUyNGZjODM2MjBhOWJlNzRhMDcwNzRiNWNiZTc1OTRmZDRkOTdmZDRjMmJmZGU2MjVmZGMx
NjMzIgogCiBQWVBJX1BBQ0tBR0UgPSAidHJvdmVfY2xhc3NpZmllcnMiCiBVUFNUUkVBTV9DSEVD
S19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgotLSAKMi40Ny4xCgo=

--===============5470539989940729075==--

