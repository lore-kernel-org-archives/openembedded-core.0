Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1B8C3DA48
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.13430.1713248038587367288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LPIxeYiW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PUPzfTsw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018ee58aa212-0c21cd7b-a9ac-4262-8d54-acbb8b78c381-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8uYulXyA1zOcrhbSzE39AbiCrD6Ftv8IpfYyO/U9qqM=;
	b=LPIxeYiWKB4Wn9KWayMTmhKiOJ+74/d0ZBjytwTLj0xedVkalnwYoNkS/veNeTKz
	A+0mmRVh83hy06d/5Z+mQyUEC7en7oi5BEVM0xiTtL15gYBQL6UVivNHqEQefgpWHbZ
	A2o6At3EtUWhQdEyfSF6ZN99QD3eld6tZzi4OXnQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8uYulXyA1zOcrhbSzE39AbiCrD6Ftv8IpfYyO/U9qqM=;
	b=PUPzfTswV8ihMDCrMcgh5IZglIl2WE4GTJ7q/vSWCQk9s+tYLaqeLChdoHNqhxps
	ohZ7qZoUGYf2M45T/mIYbUSF2mks9tIZtt0jZOl9b9lbrov/G0ZWEy+rNyPCThaSp9n
	c3TTNyAVl0e7bwbM4EzxwpQvpOJkLFYdYlF2L/BA=
Content-Type: multipart/mixed; boundary="===============0229804335365498318=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 264 SUCCEEDED
Message-ID: <0101018ee58aa212-0c21cd7b-a9ac-4262-8d54-acbb8b78c381-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198407

--===============0229804335365498318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *264* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-259-264.patch
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
From 800033147e17d99e773051149ad58df1e90126ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 04:12:51 +0000
Subject: [PATCH] diffoscope: upgrade 259 -> 264

---
 .../diffoscope/{diffoscope_259.bb => diffoscope_264.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_259.bb => diffoscope_264.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_259.bb b/meta/recipes-support/diffoscope/diffoscope_264.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_259.bb
rename to meta/recipes-support/diffoscope/diffoscope_264.bb
index eca2c208fc..edf4ec1417 100644
--- a/meta/recipes-support/diffoscope/diffoscope_259.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_264.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c1f14452467f84c4be804a3725cbfdd5eadf977ece7ad463be8b647d1a87fb42"
+SRC_URI[sha256sum] = "ca3f34f81e343baf2ad87c9397f2aa387204d537f4d292c174ddd3f34a3dd98c"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.42.0


--===============0229804335365498318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-259.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-264.dist-info, removed "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py", added "/usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-259.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-264.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py was removed
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc was removed

--===============0229804335365498318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "259" to "264"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 259 [default] to 264 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "259" to "264"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 259 [default] to 264 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "259" to "264"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 259 [default] to 264 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "259" to "264"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 259 [default] to 264 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "259" to "264"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 259 [default] to 264 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "259" to "264"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 259 [default] to 264 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "259" to "264"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1350199 to 1355704 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 259 [default] to 264 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.12/site-packages/diffoscope-259.dist-info -> /usr/lib/python3.12/site-packages/diffoscope-264.dist-info, removed "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py", added "/usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py"
packages/core2-64-poky-linux/diffoscope: PV changed from "259" to "264"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-259.tar.gz;downloadfilename=diffoscope-259.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-264.tar.gz;downloadfilename=diffoscope-264.tar.gz"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 259 [default] to 264 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-259.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-264.dist-info
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/sevenz.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/sevenz.py was added
  /usr/lib/python3.12/site-packages/diffoscope/comparators/7z.py was removed
  /usr/lib/python3.12/site-packages/diffoscope/comparators/__pycache__/7z.cpython-312.pyc was removed

--===============0229804335365498318==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-259-264.patch"

RnJvbSA4MDAwMzMxNDdlMTdkOTllNzczMDUxMTQ5YWQ1OGRmMWU5MDEyNmFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDQ6MTI6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI1OSAtPiAyNjQKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjU5LmJiID0+IGRpZmZvc2NvcGVfMjY0LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNTkuYmIgPT4gZGlmZm9zY29wZV8y
NjQuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI1OS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI1OS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI2NC5iYgppbmRleCBlY2EyYzIw
OGZjLi5lZGY0ZWMxNDE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjU5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNjQuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYzFmMTQ0NTI0NjdmODRjNGJlODA0YTM3MjVjYmZkZDVlYWRmOTc3ZWNlN2FkNDYzYmU4
YjY0N2QxYTg3ZmI0MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjYTNmMzRmODFlMzQzYmFmMmFk
ODdjOTM5N2YyYWEzODcyMDRkNTM3ZjRkMjkyYzE3NGRkZDNmMzRhM2RkOThjIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQyLjAKCg==

--===============0229804335365498318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-64 sysroot...done.
Removing 127 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============0229804335365498318==--

