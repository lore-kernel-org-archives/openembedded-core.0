Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474DAC77B7C
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8860.1749993279234242259
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lvUf+4AM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Hfy5aTih;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019773ba6f6e-09207268-e1a1-44b9-9e38-50a94723af3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N12FLw8EqNj7GeIiFnjVGbwsgTRdv0G44KPMMZnUwfA=;
	b=lvUf+4AMD5vcZpci02lFZUVE5a/EAqo/IJaqY3qJkqMWuCB3SCDYimTKc/zUc/6I
	N9PtFixcqXRvQX0l2GBKKWu7bxd7yP90DzE5BwqXf0+Ixyqgqjq1g7UFsGJHFKZ8b4P
	wEb/SNTvSnIgch2GPHgUyie3cNQbTJPf4AZt7YFs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N12FLw8EqNj7GeIiFnjVGbwsgTRdv0G44KPMMZnUwfA=;
	b=Hfy5aTihDdJJbZ9Ahz2NbVVuZ5r8UkGqMgSSSWaP6XBfYFvP7TBNAscUYgQkzT5k
	ZrZflxlrZh5kv2Dtvi0+QsDcJC3kuKVaSYbKb5oEkzQ5tMKkvn/mmG44gq7m2qVY7gi
	aMR3Qd2SMd9EY5bpgKYYHjloCX87YcQr5Bfw/F1M=
Content-Type: multipart/mixed; boundary="===============6327759662112812840=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2025.6.1 SUCCEEDED
Message-ID: <0101019773ba6f6e-09207268-e1a1-44b9-9e38-50a94723af3d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218681

--===============6327759662112812840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2025.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2025.2-2025.6.1.patch
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
From 072645843614ce4e88c5b4456bd40385c7d429b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:20:48 +0000
Subject: [PATCH] python3-dtschema: upgrade 2025.2 -> 2025.6.1

---
 ...{python3-dtschema_2025.2.bb => python3-dtschema_2025.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2025.2.bb => python3-dtschema_2025.6.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2025.2.bb b/meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2025.2.bb
rename to meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
index 2071763741..872084841b 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2025.2.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "9adeaff2079a8b5fbc4bd1c8f02cbd232016a84a9684739cac20b4df3b19509e"
+SRC_URI[sha256sum] = "6348fb23961d0cd1c89ea0c29b790c622bc34fdd1be56090724c6c1f76cbf10d"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.47.1


--===============6327759662112812840==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2025.2-2025.6.1.patch"

RnJvbSAwNzI2NDU4NDM2MTRjZTRlODhjNWI0NDU2YmQ0MDM4NWM3ZDQyOWI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6MjA6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjUuMiAtPiAyMDI1LjYuMQoKLS0tCiAuLi57cHl0
aG9uMy1kdHNjaGVtYV8yMDI1LjIuYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDI1LjYuMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjUu
Mi5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjUuNi4xLmJifSAoODUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI1LjIuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNS42LjEu
YmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjUuNi4xLmJiCmluZGV4IDIwNzE3
NjM3NDEuLjg3MjA4NDg0MWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kdHNjaGVtYV8yMDI1LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjUuNi4xLmJiCkBAIC03LDcgKzcsNyBAQCBpbmhl
cml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCiBQWVBJX1BBQ0tBR0UgPSAi
ZHRzY2hlbWEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5YWRlYWZmMjA3OWE4YjVmYmM0YmQx
YzhmMDJjYmQyMzIwMTZhODRhOTY4NDczOWNhYzIwYjRkZjNiMTk1MDllIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjYzNDhmYjIzOTYxZDBjZDFjODllYTBjMjliNzkwYzYyMmJjMzRmZGQxYmU1NjA5
MDcyNGM2YzFmNzZjYmYxMGQiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1zY20t
bmF0aXZlIgogUkRFUEVORFM6JHtQTn0gKz0gIlwKLS0gCjIuNDcuMQoK

--===============6327759662112812840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dtschema: PKGV changed from 2025.2 [default] to 2025.6.1 [default]
packages/core2-64-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2025.2.tar.gz;downloadfilename=dtschema-2025.2.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2025.6.1.tar.gz;downloadfilename=dtschema-2025.6.1.tar.gz"
packages/core2-64-poky-linux/python3-dtschema: PV changed from "2025.2" to "2025.6.1"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2025.2 [default] to 2025.6.1 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2025.2" to "2025.6.1"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2025.2 [default] to 2025.6.1 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2025.2" to "2025.6.1"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2025.2 [default] to 2025.6.1 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2025.2" to "2025.6.1"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2025.2 [default] to 2025.6.1 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2025.2" to "2025.6.1"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2025.2 [default] to 2025.6.1 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2025.2" to "2025.6.1"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2025.2 [default] to 2025.6.1 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2025.2" to "2025.6.1"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2025.2 [default] to 2025.6.1 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/dtschema/schemas/iommu/iommu-provider.yaml"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2025.2" to "2025.6.1"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 378491 to 393518 (+4%)
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/iommu/iommu-provider.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/WHEEL was removed

--===============6327759662112812840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/dtschema/schemas/iommu/iommu-provider.yaml"
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/iommu/iommu-provider.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/WHEEL was removed

--===============6327759662112812840==--

