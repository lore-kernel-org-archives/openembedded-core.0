Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA3FCFD2FD
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.53253.1728588939658968366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EEWAbQYk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CFYisdNE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019277eeb4f6-be7fe900-bb9b-49a1-bd72-3205d7050d47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lZV2tAHQvTaZTxgAU5gAmE/gdZKvLwxJMEAb2O4Ow+s=;
	b=EEWAbQYkwGwphgovqWbN5vrnPt/L7ACP2923FtrpL0Y7ZlEtob3mauYloCW41E3p
	pXETrtulhjTnYj9JWR1ON8zvnvAjH9QoranDKQOw5HG59x/qX8+TzocWPfX2ND9Spii
	EvGgn65PkzGkcLq6qedRRC//88A+PpWJOWb9EdUg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lZV2tAHQvTaZTxgAU5gAmE/gdZKvLwxJMEAb2O4Ow+s=;
	b=CFYisdNE1zPeSTajtIMKUmaqbGqrz8/TQkOUK/1X10fJJPPL/9sRAwseddXu84yc
	VslcgPuL4JIlbfOM3drrf3DMASy4CRyXO1S0Dnj4KX4cEuamlzr1gEEWk8xwa/swj+7
	TzlINJNl3ndAoQoeYUZHeXo4K2EYNGFjsJvMGrWA=
Content-Type: multipart/mixed; boundary="===============8259068003247186304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pefile: upgrading to 2024.8.26 SUCCEEDED
Message-ID: <0101019277eeb4f6-be7fe900-bb9b-49a1-bd72-3205d7050d47-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205575

--===============8259068003247186304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pefile* to *2024.8.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pefile-upgrade-2023.2.7-2024.8.26.patch
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
From 99da9ea54f73876129bb7a0eadfe09306d1ad8d7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 13:40:51 +0000
Subject: [PATCH] python3-pefile: upgrade 2023.2.7 -> 2024.8.26

---
 ...023.2.7.bb => python3-pefile_2024.8.26.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pefile_2023.2.7.bb => python3-pefile_2024.8.26.bb} (46%)

diff --git a/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
similarity index 46%
rename from meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
rename to meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
index e30b362323..6a84f3f59d 100644
--- a/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
+++ b/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
@@ -1,11 +1,32 @@
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
+#  The MIT License (MIT)
+#  
+# -Copyright (c) 2004-2023 Ero Carrera
+# +Copyright (c) 2004-2024 Ero Carrera
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "Python PE parsing module"
 DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
 HOMEPAGE = "https://github.com/erocarrera/pefile"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e34c75178086aca0a17551ffbacaca53"
 
 inherit setuptools3 ptest
-SRCREV = "1ab2807c4eec16041e791d7a6acc68cc23fd5266"
+SRCREV = "4b3b1e2e568a88d4f1897d694d684f23d9e270c4"
 SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
            file://run-ptest"
 S = "${WORKDIR}/git"
-- 
2.44.1


--===============8259068003247186304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pefile-upgrade-2023.2.7-2024.8.26.patch"

RnJvbSA5OWRhOWVhNTRmNzM4NzYxMjliYjdhMGVhZGZlMDkzMDZkMWFkOGQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTM6NDA6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBlZmlsZTogdXBncmFkZSAyMDIzLjIuNyAtPiAyMDI0LjguMjYKCi0tLQogLi4uMDIz
LjIuNy5iYiA9PiBweXRob24zLXBlZmlsZV8yMDI0LjguMjYuYmJ9IHwgMjUgKysrKysrKysrKysr
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZWZpbGVfMjAy
My4yLjcuYmIgPT4gcHl0aG9uMy1wZWZpbGVfMjAyNC44LjI2LmJifSAoNDYlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZWZpbGVfMjAyMy4yLjcu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGVmaWxlXzIwMjQuOC4y
Ni5iYgpzaW1pbGFyaXR5IGluZGV4IDQ2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGVmaWxlXzIwMjMuMi43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGVmaWxlXzIwMjQuOC4yNi5iYgppbmRleCBlMzBi
MzYyMzIzLi42YTg0ZjNmNTlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcGVmaWxlXzIwMjMuMi43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1wZWZpbGVfMjAyNC44LjI2LmJiCkBAIC0xLDExICsxLDMyIEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw2ICsx
LDYgQEAKKyMgIFRoZSBNSVQgTGljZW5zZSAoTUlUKQorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIw
MDQtMjAyMyBFcm8gQ2FycmVyYQorIyArQ29weXJpZ2h0IChjKSAyMDA0LTIwMjQgRXJvIENhcnJl
cmEKKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2Us
IHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAgb2YgdGhpcyBzb2Z0d2FyZSBhbmQg
YXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwK
KyMgCisjCisKIFNVTU1BUlkgPSAiUHl0aG9uIFBFIHBhcnNpbmcgbW9kdWxlIgogREVTQ1JJUFRJ
T04gPSAiQSBtdWx0aS1wbGF0Zm9ybSBQeXRob24gbW9kdWxlIHRvIHBhcnNlIGFuZCB3b3JrIHdp
dGggUG9ydGFibGUgRXhlY3V0YWJsZSAoUEUpIGZpbGVzLiIKIEhPTUVQQUdFID0gImh0dHBzOi8v
Z2l0aHViLmNvbS9lcm9jYXJyZXJhL3BlZmlsZSIKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzgwNjY2Njc4ODhiMDFkODExOGZmOWNjMjNk
YTE4NzMiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1lMzRjNzUxNzgw
ODZhY2EwYTE3NTUxZmZiYWNhY2E1MyIKIAogaW5oZXJpdCBzZXR1cHRvb2xzMyBwdGVzdAotU1JD
UkVWID0gIjFhYjI4MDdjNGVlYzE2MDQxZTc5MWQ3YTZhY2M2OGNjMjNmZDUyNjYiCitTUkNSRVYg
PSAiNGIzYjFlMmU1NjhhODhkNGYxODk3ZDY5NGQ2ODRmMjNkOWUyNzBjNCIKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9lcm9jYXJyZXJhL3BlZmlsZTticmFuY2g9bWFzdGVyO3Byb3RvY29s
PWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCIKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCi0tIAoyLjQ0LjEKCg==

--===============8259068003247186304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pefile/python3-pefile: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info -> /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info, added "/usr/lib/python3.12/site-packages/ordlookup/wsock32.py /usr/lib/python3.12/site-packages/ordlookup/__pycache__/wsock32.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-pefile (sysroot):
  /usr/lib/python3.12/site-packages/ordlookup/__pycache__/wsock32.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/ordlookup/wsock32.py was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/WHEEL was removed

--===============8259068003247186304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pefile: PV changed from "2023.2.7" to "2024.8.26"
packages/core2-64-poky-linux/python3-pefile: PKGV changed from 2023.2.7 [default] to 2024.8.26 [default]
packages/core2-64-poky-linux/python3-pefile/python3-pefile-dbg: PV changed from "2023.2.7" to "2024.8.26"
packages/core2-64-poky-linux/python3-pefile/python3-pefile-dbg: PKGV changed from 2023.2.7 [default] to 2024.8.26 [default]
packages/core2-64-poky-linux/python3-pefile/python3-pefile-dev: PV changed from "2023.2.7" to "2024.8.26"
packages/core2-64-poky-linux/python3-pefile/python3-pefile-dev: PKGV changed from 2023.2.7 [default] to 2024.8.26 [default]
packages/core2-64-poky-linux/python3-pefile/python3-pefile-doc: PV changed from "2023.2.7" to "2024.8.26"
packages/core2-64-poky-linux/python3-pefile/python3-pefile-doc: PKGV changed from 2023.2.7 [default] to 2024.8.26 [default]
packages/core2-64-poky-linux/python3-pefile/python3-pefile-locale: PV changed from "2023.2.7" to "2024.8.26"
packages/core2-64-poky-linux/python3-pefile/python3-pefile-locale: PKGV changed from 2023.2.7 [default] to 2024.8.26 [default]
packages/core2-64-poky-linux/python3-pefile/python3-pefile-ptest: PV changed from "2023.2.7" to "2024.8.26"
packages/core2-64-poky-linux/python3-pefile/python3-pefile-ptest: PKGV changed from 2023.2.7 [default] to 2024.8.26 [default]
packages/core2-64-poky-linux/python3-pefile/python3-pefile-ptest: PKGSIZE changed from 64281599 to 64282578 (+0%)
packages/core2-64-poky-linux/python3-pefile/python3-pefile-src: PV changed from "2023.2.7" to "2024.8.26"
packages/core2-64-poky-linux/python3-pefile/python3-pefile-src: PKGV changed from 2023.2.7 [default] to 2024.8.26 [default]
packages/core2-64-poky-linux/python3-pefile/python3-pefile-staticdev: PV changed from "2023.2.7" to "2024.8.26"
packages/core2-64-poky-linux/python3-pefile/python3-pefile-staticdev: PKGV changed from 2023.2.7 [default] to 2024.8.26 [default]
packages/core2-64-poky-linux/python3-pefile/python3-pefile: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info -> /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info, added "/usr/lib/python3.12/site-packages/ordlookup/wsock32.py /usr/lib/python3.12/site-packages/ordlookup/__pycache__/wsock32.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pefile/python3-pefile: PV changed from "2023.2.7" to "2024.8.26"
packages/core2-64-poky-linux/python3-pefile/python3-pefile: PKGV changed from 2023.2.7 [default] to 2024.8.26 [default]
packages/core2-64-poky-linux/python3-pefile/python3-pefile: PKGSIZE changed from 634564 to 667547 (+5%)
Changes to packages/core2-64-poky-linux/python3-pefile (sysroot):
  /usr/lib/python3.12/site-packages/ordlookup/__pycache__/wsock32.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/ordlookup/wsock32.py was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/pefile-2024.8.26.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/pefile-2023.2.7.dist-info/WHEEL was removed

--===============8259068003247186304==--

