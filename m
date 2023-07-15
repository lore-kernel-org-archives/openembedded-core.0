Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08190C2FC05
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5938.1689456454145348965
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IEJYjlC/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101895b73ab1d-0c013ca7-fd74-4bda-8da4-4c35bdbebfa2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Kg360xY3UOJrUn1Yh7wW3mnt8mSGH2t95/vfFS7qr5I=;
	b=IEJYjlC/TOwalQFTB0Dn+/nboVsmdBsSXF/8j2G172S+oPWSrmVV/W5MS9VqQoIG
	oeLX6zMDfQ+eixWyPLksAnjO5/5nYIU8LCb0gkXHblx/2tx+cWEsISUYUbt9OJ18NFq
	/g6N6iiHZuIsiRKGXn5J/Qbm5Pg1Bmlyv8QztqQw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Kg360xY3UOJrUn1Yh7wW3mnt8mSGH2t95/vfFS7qr5I=;
	b=mZbE60FwY1RfqTV6jHnCcEiRV4Vug2rbDuF+zJUADSzz/Qh8Q+u50gZf+A95n8iv
	0CPdnFJH03EKzCzk1BY+0dnWW0kQUYeuSNhpYZjDPAL2K/wvz3fW9cGxdKKYgOGluNq
	xun2YqFut9Ztv14nkDJLH8czMe8FKrHNG6yxlt5I=
Content-Type: multipart/mixed; boundary="===============1391085783976311716=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.16.2 SUCCEEDED
Message-ID: <010101895b73ab1d-0c013ca7-fd74-4bda-8da4-4c35bdbebfa2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184340

--===============1391085783976311716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.16.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.15.0-3.16.2.patch
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
From eaa47ae31486fea10f9e8f565c7f39797e6899b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 13:27:24 +0000
Subject: [PATCH] python3-zipp: upgrade 3.15.0 -> 3.16.2

---
 ...-zipp_3.15.0.bb => python3-zipp_3.16.2.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.15.0.bb => python3-zipp_3.16.2.bb} (34%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.15.0.bb b/meta/recipes-devtools/python/python3-zipp_3.16.2.bb
similarity index 34%
rename from meta/recipes-devtools/python/python3-zipp_3.15.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.16.2.bb
index 45654ff6f1..d3a39b6b70 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.16.2.bb
@@ -1,9 +1,28 @@
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
+# @@ -1,5 +1,3 @@
+# -Copyright Jason R. Coombs
+# -
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to
+#  deal in the Software without restriction, including without limitation the
+# 
+#
+
 SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "112929ad649da941c23de50f356a2b5570c954b65150642bccdd66bf194d224b"
+SRC_URI[sha256sum] = "ebc15946aa78bd63458992fc81ec3b6f7b1e92d51c35e6de1c3804e73b799147"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.39.2


--===============1391085783976311716==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.15.0-3.16.2.patch"

RnJvbSBlYWE0N2FlMzE0ODZmZWExMGY5ZThmNTY1YzdmMzk3OTdlNjg5OWI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTM6Mjc6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXppcHA6IHVwZ3JhZGUgMy4xNS4wIC0+IDMuMTYuMgoKLS0tCiAuLi4temlwcF8zLjE1
LjAuYmIgPT4gcHl0aG9uMy16aXBwXzMuMTYuMi5iYn0gfCAyMyArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXppcHBfMy4xNS4wLmJiID0+
IHB5dGhvbjMtemlwcF8zLjE2LjIuYmJ9ICgzNCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xNi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggMzQl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMu
MTUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXpp
cHBfMy4xNi4yLmJiCmluZGV4IDQ1NjU0ZmY2ZjEuLmQzYTM5YjZiNzAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMTUuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjE2LjIuYmIKQEAgLTEs
OSArMSwyOCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVl
biB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBs
ZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRo
ZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicg
dGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRl
ZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UK
KyMgQEAgLTEsNSArMSwzIEBACisjIC1Db3B5cmlnaHQgSmFzb24gUi4gQ29vbWJzCisjIC0KKyMg
IFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVy
c29uIG9idGFpbmluZyBhIGNvcHkKKyMgIG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQg
ZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0bworIyAgZGVhbCBpbiB0aGUg
U29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlv
biB0aGUKKyMgCisjCisKIFNVTU1BUlkgPSAiQmFja3BvcnQgb2YgcGF0aGxpYi1jb21wYXRpYmxl
IG9iamVjdCB3cmFwcGVyIGZvciB6aXAgZmlsZXMiCiBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vamFyYWNvL3ppcHAiCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTdhNzEyNmUwNjgyMDYyOTBmM2ZlOWY4ZDZjNzEzZWE2IgorTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTQxNjQzZTExYzQ4ODk4MTUwZGFh
ODM4MDJkYmM2NWYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMTI5MjlhZDY0OWRhOTQxYzIz
ZGU1MGYzNTZhMmI1NTcwYzk1NGI2NTE1MDY0MmJjY2RkNjZiZjE5NGQyMjRiIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImViYzE1OTQ2YWE3OGJkNjM0NTg5OTJmYzgxZWMzYjZmN2IxZTkyZDUxYzM1
ZTZkZTFjMzgwNGU3M2I3OTkxNDciCiAKIERFUEVORFMgKz0gIiR7UFlUSE9OX1BOfS1zZXR1cHRv
b2xzLXNjbS1uYXRpdmUiCiAKLS0gCjIuMzkuMgoK

--===============1391085783976311716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: PV changed from "3.15.0" to "3.16.2"
packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.15.0 [default] to 3.16.2 [default]
packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.15.0.tar.gz;downloadfilename=zipp-3.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.16.2.tar.gz;downloadfilename=zipp-3.16.2.tar.gz"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.15.0" to "3.16.2"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.15.0 [default] to 3.16.2 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.15.0" to "3.16.2"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.15.0 [default] to 3.16.2 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.15.0" to "3.16.2"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.15.0 [default] to 3.16.2 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.15.0" to "3.16.2"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.15.0 [default] to 3.16.2 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.15.0" to "3.16.2"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.15.0 [default] to 3.16.2 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.15.0" to "3.16.2"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.15.0 [default] to 3.16.2 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.11/site-packages/zipp-3.15.0.dist-info -> /usr/lib/python3.11/site-packages/zipp-3.16.2.dist-info, added "/usr/lib/python3.11/site-packages/zipp/glob.py /usr/lib/python3.11/site-packages/zipp/__pycache__/glob.cpython-311.pyc"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.15.0" to "3.16.2"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 37602 to 39157 (+4%)
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.15.0 [default] to 3.16.2 [default]
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.16.2.dist-info
  /usr/lib/python3.11/site-packages/zipp/glob.py was added
  /usr/lib/python3.11/site-packages/zipp/__pycache__/glob.cpython-311.pyc was added

--===============1391085783976311716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.11/site-packages/zipp-3.15.0.dist-info -> /usr/lib/python3.11/site-packages/zipp-3.16.2.dist-info, added "/usr/lib/python3.11/site-packages/zipp/__pycache__/glob.cpython-311.pyc /usr/lib/python3.11/site-packages/zipp/glob.py"
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.16.2.dist-info
  /usr/lib/python3.11/site-packages/zipp/glob.py was added
  /usr/lib/python3.11/site-packages/zipp/__pycache__/glob.cpython-311.pyc was added

--===============1391085783976311716==--

