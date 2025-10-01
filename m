Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FBACCA472
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.17955.1759325541749950653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tNNoXqpG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ADe7nvS+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101999ff95159-9b888d18-aff7-455d-a9f7-232819086216-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZdtsR5Ydfzgi0dpwF7b63k9N8ra5T2QMHvKsRjT9yrQ=;
	b=tNNoXqpGDHjIvpNbLSIiNw2OzWWVK7rpb63mDR+lCBZQnTZnMMfmy9JxrS7AlOIy
	ymFuL2TN+i+VTvHP8pb8zP0e4zAhnU97ODNc2kqimsYf+08ZG+UPxrKlk/EmubaPf25
	ZtEH2iMyYSTFNC/VdJlQ7TuDG+Hj1TL+8wZod4sQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZdtsR5Ydfzgi0dpwF7b63k9N8ra5T2QMHvKsRjT9yrQ=;
	b=ADe7nvS+8feY4WuEuXw3qmpAoE3rnWz8nOT4cOJAoVPJZ8ZUZLI1KwMsMeV/+tl7
	1r6AMqYwqa1Srz6oWdqIShQEA+VJ9X4+iuWcVtSvDvrARIMwc9UaoQ/4N/Fm182q0Xs
	FH0iF9r3Cc4m2FXMim/lfPbpteNC1SgaLytnsbik=
Content-Type: multipart/mixed; boundary="===============6045860866886576538=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markupsafe: upgrading to 3.0.3 SUCCEEDED
Message-ID: <010101999ff95159-9b888d18-aff7-455d-a9f7-232819086216-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224243

--===============6045860866886576538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markupsafe* to *3.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markupsafe-upgrade-3.0.2-3.0.3.patch
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
From 9bea0bac90d89aa27b30cd405f1aca0465fa621f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 09:10:36 +0000
Subject: [PATCH] python3-markupsafe: upgrade 3.0.2 -> 3.0.3

---
 ...{python3-markupsafe_3.0.2.bb => python3-markupsafe_3.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_3.0.2.bb => python3-markupsafe_3.0.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
rename to meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
index b90dd84f48..dace235bb8 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
+SRC_URI[sha256sum] = "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
 
 PYPI_PACKAGE = "markupsafe"
 inherit pypi python_setuptools_build_meta ptest-python-pytest
-- 
2.47.1


--===============6045860866886576538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markupsafe: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/python3-markupsafe: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markupsafe/markupsafe-3.0.2.tar.gz;downloadfilename=markupsafe-3.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markupsafe/markupsafe-3.0.3.tar.gz;downloadfilename=markupsafe-3.0.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-markupsafe: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PKGSIZE changed from 32120 to 32168 (+0%)
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-dev: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-dev: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-doc: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-doc: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-locale: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-locale: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGSIZE changed from 10159 to 11077 (+9%)
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-ptest: FILELIST: added "/usr/lib/python3-markupsafe/ptest/tests/test_ext_init.py"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-src: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGSIZE changed from 4149 to 4327 (+4%)
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe: PKGSIZE changed from 59478 to 58482 (-2%)
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.13/site-packages/markupsafe-3.0.2.dist-info moved to /usr/lib/python3.13/site-packages/markupsafe-3.0.3.dist-info
Changes to packages/x86_64-linux/python3-markupsafe-native (sysroot):
  /usr/lib/python3.13/site-packages/markupsafe-3.0.2.dist-info moved to /usr/lib/python3.13/site-packages/markupsafe-3.0.3.dist-info

--===============6045860866886576538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markupsafe-upgrade-3.0.2-3.0.3.patch"

RnJvbSA5YmVhMGJhYzkwZDg5YWEyN2IzMGNkNDA1ZjFhY2EwNDY1ZmE2MjFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwOToxMDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya3Vwc2FmZTogdXBncmFkZSAzLjAuMiAtPiAzLjAuMwoKLS0tCiAuLi57cHl0aG9u
My1tYXJrdXBzYWZlXzMuMC4yLmJiID0+IHB5dGhvbjMtbWFya3Vwc2FmZV8zLjAuMy5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1hcmt1cHNhZmVfMy4wLjIu
YmIgPT4gcHl0aG9uMy1tYXJrdXBzYWZlXzMuMC4zLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzMuMC4yLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmt1cHNhZmVfMy4wLjMuYmIK
c2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1hcmt1cHNhZmVfMy4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzMuMC4zLmJiCmluZGV4IGI5MGRkODRm
NDguLmRhY2UyMzViYjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1tYXJrdXBzYWZlXzMuMC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzMuMC4zLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFH
RSA9ICJodHRwOi8vZ2l0aHViLmNvbS9taXRzdWhpa28vbWFya3Vwc2FmZSIKIExJQ0VOU0UgPSAi
QlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1
PWZmZWZmYTU5YzkwYzljNGEwMzNjNzU3NGY4ZjNmYjc1IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZWU1NWQzZWRmODAxNjdlNDhlYTExYTkyM2M3Mzg2ZjQ2NjlkZjY3ZDc5OTQ1NTQzODdmODRl
N2Q4YjBhMmJmMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3MjI2OTU4MDhmNGI2NDU3YjMyMGZk
YzEzMTI4MDc5NmJkY2ViMDRhYjUwZmUxNzk1Y2Q1NDA3OTllYmUxNjk4IgogCiBQWVBJX1BBQ0tB
R0UgPSAibWFya3Vwc2FmZSIKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9t
ZXRhIHB0ZXN0LXB5dGhvbi1weXRlc3QKLS0gCjIuNDcuMQoK

--===============6045860866886576538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-ptest: FILELIST: added "/usr/lib/python3-markupsafe/ptest/tests/test_ext_init.py"
Changes to packages/x86-64-v3-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.13/site-packages/markupsafe-3.0.2.dist-info moved to /usr/lib/python3.13/site-packages/markupsafe-3.0.3.dist-info
Changes to packages/x86_64-linux/python3-markupsafe-native (sysroot):
  /usr/lib/python3.13/site-packages/markupsafe-3.0.2.dist-info moved to /usr/lib/python3.13/site-packages/markupsafe-3.0.3.dist-info

--===============6045860866886576538==--

