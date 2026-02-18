Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66A8E9A052
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1418.1771440097795864815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wwHkJmNA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ILNHmeUG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440104;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Pl6m1/WU3k0yjCeUz3tYFafDhQ958ACZbSIfH/tZgWo=;
	b=wwHkJmNAE9mSbHaCjwJd4L3Pey9dBCy8R0Vi/u6+CQeMo7m62HNXVNl4njcHXBeN
	3Xp3aJz4t1BbOnLkUg3ReveQdm3a43ZVz+POW5gxbcEOwpkW9IVGpoL3aMDTyAUOc/n
	VOxAo1DdTMJj6EaRr/qpjGa0bse/BbZPhfRaManM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440104;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Pl6m1/WU3k0yjCeUz3tYFafDhQ958ACZbSIfH/tZgWo=;
	b=ILNHmeUGlRlzj0qHBbvdEE1Nu37QhaARaoiRLs0FeBJJFfwnMWqMPKexQcrVrmxa
	ljuE1Im3s/QCmEnt+YwQuCmS8rM+YSZBe8biYP2YkS57wcyz+lf7R4cjTt4mbqe7CWQ
	YAG6TAO627D2aj4FkRZ7FaavCobDw0h2fONchCmE=
Content-Type: multipart/mixed; boundary="===============6098528928108491715=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED
Message-ID: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231360

--===============6098528928108491715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rdflib* to *7.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rdflib-upgrade-7.5.0-7.6.0.patch
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
From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:46:27 +0000
Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -> 7.6.0

---
 ...dflib_7.5.0.bb => python3-rdflib_7.6.0.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.5.0.bb => python3-rdflib_7.6.0.bb} (34%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
similarity index 34%
rename from meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
index e421aa2bac..1b830e8aa9 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
@@ -1,10 +1,31 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  BSD 3-Clause License
+#  
+# -Copyright (c) 2002-2025, RDFLib Team
+# +Copyright (c) 2002-2026, RDFLib Team
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "RDFLib is a pure Python package for working with RDF"
 HOMEPAGE = "https://github.com/RDFLib/rdflib"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7006e973486c4700556f6d58cba0ab6c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0ac0171cee5250c44d7d49847ae53a3e"
 
-SRC_URI[sha256sum] = "663083443908b1830e567350d72e74d9948b310f827966358d76eebdc92bf592"
+SRC_URI[sha256sum] = "6c831288d5e4a5a7ece85d0ccde9877d512a3d0f02d7c06455d00d6d0ea379df"
 
 inherit pypi python_poetry_core
 
-- 
2.47.1


--===============6098528928108491715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: PKGSIZE changed from 4290556 to 4734952 (+10%)
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: FILELIST: directory renamed /usr/lib/python3.14/site-packages/rdflib-7.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/rdflib-7.6.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/rdflib-7.5.0.dist-info -> /usr/lib/python3.14/site-packages/rdflib-7.6.0.dist-info, removed "/usr/bin/sq", added "/usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/util.py /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/models.py /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/exceptions.py /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/util.cpython-314.pyc /usr/lib/python3.14/site-packages/rdflib/plugins/sparql/__pycache__/pyparsing_compat.cpython-314.pyc /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/models.cpython-314.pyc /usr/lib/python3.14/site-packages/rdflib/plugins/sparql/pyparsing_compat.py /usr/lib/python3.14/site-packages/rdflib/cont
 rib/graphdb/__pycache__/exceptions.cpython-314.pyc /usr/bin/sparqlquery"
Changes to packages/x86-64-v3-poky-linux/python3-rdflib (sysroot):
  /usr/lib/python3.14/site-packages/rdflib-7.5.0.dist-info moved to /usr/lib/python3.14/site-packages/rdflib-7.6.0.dist-info
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/exceptions.py was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/models.py was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/exceptions.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/models.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/util.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/util.py was added
  /usr/lib/python3.14/site-packages/rdflib/plugins/sparql/__pycache__/pyparsing_compat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/rdflib/plugins/sparql/pyparsing_compat.py was added
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info

--===============6098528928108491715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-rdflib: PV changed from "7.5.0" to "7.6.0"
packages/x86-64-v3-poky-linux/python3-rdflib: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rdflib/rdflib-7.5.0.tar.gz;downloadfilename=rdflib-7.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/r/rdflib/rdflib-7.6.0.tar.gz;downloadfilename=rdflib-7.6.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-rdflib: PKGV changed from 7.5.0 [default] to 7.6.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-dbg: PV changed from "7.5.0" to "7.6.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-dbg: PKGV changed from 7.5.0 [default] to 7.6.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-dev: PV changed from "7.5.0" to "7.6.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-dev: PKGV changed from 7.5.0 [default] to 7.6.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-doc: PV changed from "7.5.0" to "7.6.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-doc: PKGV changed from 7.5.0 [default] to 7.6.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-locale: PV changed from "7.5.0" to "7.6.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-locale: PKGV changed from 7.5.0 [default] to 7.6.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-src: PV changed from "7.5.0" to "7.6.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-src: PKGV changed from 7.5.0 [default] to 7.6.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-staticdev: PV changed from "7.5.0" to "7.6.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-staticdev: PKGV changed from 7.5.0 [default] to 7.6.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: PKGSIZE changed from 4290556 to 4734952 (+10%)
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: PV changed from "7.5.0" to "7.6.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: PKGV changed from 7.5.0 [default] to 7.6.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: FILELIST: directory renamed /usr/lib/python3.14/site-packages/rdflib-7.5.0.dist-info -> /usr/lib/python3.14/site-packages/rdflib-7.6.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/rdflib-7.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/rdflib-7.6.0.dist-info/licenses, removed "/usr/bin/sq", added "/usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/exceptions.cpython-314.pyc /usr/lib/python3.14/site-packages/rdflib/plugins/sparql/__pycache__/pyparsing_compat.cpython-314.pyc /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/util.cpython-314.pyc /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/exceptions.py /usr/lib/python3.14/site-packages/rdflib/plugins/sparql/pyparsing_compat.py /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/models.py /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/util.py /usr/lib/python3.14/site-packages/rdflib/
 contrib/graphdb/__pycache__/models.cpython-314.pyc /usr/bin/sparqlquery"
Changes to packages/x86-64-v3-poky-linux/python3-rdflib (sysroot):
  /usr/lib/python3.14/site-packages/rdflib-7.5.0.dist-info moved to /usr/lib/python3.14/site-packages/rdflib-7.6.0.dist-info
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/exceptions.py was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/models.py was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/exceptions.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/models.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/__pycache__/util.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/rdflib/contrib/graphdb/util.py was added
  /usr/lib/python3.14/site-packages/rdflib/plugins/sparql/__pycache__/pyparsing_compat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/rdflib/plugins/sparql/pyparsing_compat.py was added
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.14/site-packages/poetry_core-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/poetry_core-2.2.1.dist-info

--===============6098528928108491715==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rdflib-upgrade-7.5.0-7.6.0.patch"

RnJvbSA2YTIzMDY4NDc4MmNiZTQ3YTRmMGU1ZmU2YzIyNjhkYTU3MDkxZmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6NDY6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJkZmxpYjogdXBncmFkZSA3LjUuMCAtPiA3LjYuMAoKLS0tCiAuLi5kZmxpYl83LjUu
MC5iYiA9PiBweXRob24zLXJkZmxpYl83LjYuMC5iYn0gfCAyNSArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJkZmxpYl83LjUuMC5iYiA9
PiBweXRob24zLXJkZmxpYl83LjYuMC5iYn0gKDM0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmRmbGliXzcuNS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJkZmxpYl83LjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDM0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmRm
bGliXzcuNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcmRmbGliXzcuNi4wLmJiCmluZGV4IGU0MjFhYTJiYWMuLjFiODMwZThhYTkgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZGZsaWJfNy41LjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJkZmxpYl83LjYuMC5i
YgpAQCAtMSwxMCArMSwzMSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysr
IExJQ0VOU0UKKyMgQEAgLTEsNiArMSw2IEBACisjICBCU0QgMy1DbGF1c2UgTGljZW5zZQorIyAg
CisjIC1Db3B5cmlnaHQgKGMpIDIwMDItMjAyNSwgUkRGTGliIFRlYW0KKyMgK0NvcHlyaWdodCAo
YykgMjAwMi0yMDI2LCBSREZMaWIgVGVhbQorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAor
IyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0
aCBvciB3aXRob3V0CisjIAorIworCiBTVU1NQVJZID0gIlJERkxpYiBpcyBhIHB1cmUgUHl0aG9u
IHBhY2thZ2UgZm9yIHdvcmtpbmcgd2l0aCBSREYiCiBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vUkRGTGliL3JkZmxpYiIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9
ICJCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03
MDA2ZTk3MzQ4NmM0NzAwNTU2ZjZkNThjYmEwYWI2YyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTBhYzAxNzFjZWU1MjUwYzQ0ZDdkNDk4NDdhZTUzYTNlIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNjYzMDgzNDQzOTA4YjE4MzBlNTY3MzUwZDcyZTc0ZDk5NDhiMzEw
ZjgyNzk2NjM1OGQ3NmVlYmRjOTJiZjU5MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2YzgzMTI4
OGQ1ZTRhNWE3ZWNlODVkMGNjZGU5ODc3ZDUxMmEzZDBmMDJkN2MwNjQ1NWQwMGQ2ZDBlYTM3OWRm
IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BvZXRyeV9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============6098528928108491715==--

