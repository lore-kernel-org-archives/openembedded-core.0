Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6ACC54F58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1275.1710522012370447044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=crJ5keN8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xbWnv/Qp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e430ea0bf-9c5b5783-5d84-4f30-bd6d-8739b745a33a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u1QdXHVOX9DSOv5mlC43lASQ6saaAP9QgqJhqmBc30g=;
	b=crJ5keN8l4t3+jpjxh8ZKo+dATvwq5O/lFFeUKCP8KPLJeo22BuNiu26h1bs6SAC
	BcbI+Ht/1NCxt0asO7XD3GzMvcfRESF1Wa3Xba674rYddAGBKVuM7/SxtNnzpiCDDb3
	Zif1pNxutW5Q/QYq9jCi+ZqCigR4BwTil+Bu3Hfo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u1QdXHVOX9DSOv5mlC43lASQ6saaAP9QgqJhqmBc30g=;
	b=xbWnv/Qp6HH1m/4eiw6+ds6ARoi7cowXTAvm74qAMqyT+VuX/SHCacII2Kck8o+G
	io0HA+/io0VlT+fXcMsogwMroODJh+iQ8/RDGAWNMmFZZOQq/InUkMjWuFkI/QAnLcC
	yzLeitPn2FE/A3w5yfwYco7eCOm/kZyXr7Sap/H0=
Content-Type: multipart/mixed; boundary="===============1077996989638844108=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 260 SUCCEEDED
Message-ID: <0101018e430ea0bf-9c5b5783-5d84-4f30-bd6d-8739b745a33a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197236

--===============1077996989638844108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *260* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-259-260.patch
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
From d7cc7943322f25997d6bedfb7d1a7de32e397979 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 15:13:41 +0000
Subject: [PATCH] diffoscope: upgrade 259 -> 260

---
 .../diffoscope/{diffoscope_259.bb => diffoscope_260.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_259.bb => diffoscope_260.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_259.bb b/meta/recipes-support/diffoscope/diffoscope_260.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_259.bb
rename to meta/recipes-support/diffoscope/diffoscope_260.bb
index eca2c208fc..297a53fb53 100644
--- a/meta/recipes-support/diffoscope/diffoscope_259.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_260.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c1f14452467f84c4be804a3725cbfdd5eadf977ece7ad463be8b647d1a87fb42"
+SRC_URI[sha256sum] = "405a55502c8b2c988e46c0800d6a93e8e4e7632c1542b0a540dda50aeea41dac"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.42.0


--===============1077996989638844108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 259 [default] to 260 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "259" to "260"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 259 [default] to 260 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "259" to "260"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 259 [default] to 260 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "259" to "260"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 259 [default] to 260 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "259" to "260"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 259 [default] to 260 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "259" to "260"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 259 [default] to 260 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "259" to "260"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1350135 to 1350522 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-259.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-260.dist-info, removed "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py", added "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 259 [default] to 260 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "259" to "260"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 259 [default] to 260 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "259" to "260"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-259.tar.gz;downloadfilename=diffoscope-259.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-260.tar.gz;downloadfilename=diffoscope-260.tar.gz"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-259.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-260.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py was removed
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc was removed

--===============1077996989638844108==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-259-260.patch"

RnJvbSBkN2NjNzk0MzMyMmYyNTk5N2Q2YmVkZmI3ZDFhN2RlMzJlMzk3OTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTU6MTM6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI1OSAtPiAyNjAKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjU5LmJiID0+IGRpZmZvc2NvcGVfMjYwLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNTkuYmIgPT4gZGlmZm9zY29wZV8y
NjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI1OS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI1OS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI2MC5iYgppbmRleCBlY2EyYzIw
OGZjLi4yOTdhNTNmYjUzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjU5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNjAuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYzFmMTQ0NTI0NjdmODRjNGJlODA0YTM3MjVjYmZkZDVlYWRmOTc3ZWNlN2FkNDYzYmU4
YjY0N2QxYTg3ZmI0MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MDVhNTU1MDJjOGIyYzk4OGU0
NmMwODAwZDZhOTNlOGU0ZTc2MzJjMTU0MmIwYTU0MGRkYTUwYWVlYTQxZGFjIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQyLjAKCg==

--===============1077996989638844108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1878 targets, 46 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-64 sysroot...done.
Removing 127 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============1077996989638844108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-259.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-260.dist-info, removed "/usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-259.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-260.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py was removed
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc was removed

--===============1077996989638844108==--

