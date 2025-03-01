Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7024FC021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7168.1740828323633416534
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EaaondXm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=X4d+W/9C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019551743f9c-36fa5cf0-9401-4dd6-a30a-1ac7eeae1c28-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iaZJtSPasG/RgGj6ArsPXX+auo3nO+nDpMFoztsQ4Nw=;
	b=EaaondXmn7a/lCjyWIvoZ0tYLfNa/iZvODuLYcQ3uOwNjGN/9GMd1OJCxGDTN77W
	1dBDHTW++osGdbIEKaGj9L2TAxW7Y4yPIBxWDjOhM2hLFzx6RAM9Mt3hZZeWqwW+RFK
	3s64P6VzUcjek5veFhU5fGpWhgsuu0wrmOE9Z5NI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iaZJtSPasG/RgGj6ArsPXX+auo3nO+nDpMFoztsQ4Nw=;
	b=X4d+W/9CCuv0RZHgQd9kATfNl22sLSWV4pwpcOIl+duBMtwoWZToB+YcEg0H9NDP
	osiahxIspSgrIrmolHjVMBHIu5DobAOBF2oJ2QwkEvC/oUnG71NU4TL8j3wlOHLM3Zf
	Hny6WjpuC+eGIFQ5tZ9cdFHuEqFPvbrdxZW0Cqs4=
Content-Type: multipart/mixed; boundary="===============0702318457911112378=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 15.0 SUCCEEDED
Message-ID: <0101019551743f9c-36fa5cf0-9401-4dd6-a30a-1ac7eeae1c28-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212133

--===============0702318457911112378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-14.2-15.0.patch
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
From 297b639d42db06dc32927ef83568e1228e146877 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 08:19:24 +0000
Subject: [PATCH] python3-websockets: upgrade 14.2 -> 15.0

---
 .../{python3-websockets_14.2.bb => python3-websockets_15.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_14.2.bb => python3-websockets_15.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_14.2.bb b/meta/recipes-devtools/python/python3-websockets_15.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_14.2.bb
rename to meta/recipes-devtools/python/python3-websockets_15.0.bb
index 0c7b7d2470..9a7456dee4 100644
--- a/meta/recipes-devtools/python/python3-websockets_14.2.bb
+++ b/meta/recipes-devtools/python/python3-websockets_15.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5059ed9c54945efb321f097084b4c7e52c246f2c869815876a69d1efc4ad6eb5"
+SRC_URI[sha256sum] = "ca36151289a15b39d8d683fd8b7abbe26fc50be311066c5f8dcf3cb8cee107ab"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.44.1


--===============0702318457911112378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-14.2.tar.gz;downloadfilename=websockets-14.2.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-15.0.tar.gz;downloadfilename=websockets-15.0.tar.gz"
packages/core2-64-poky-linux/python3-websockets: PV changed from "14.2" to "15.0"
packages/core2-64-poky-linux/python3-websockets: PKGV changed from 14.2 [default] to 15.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "14.2" to "15.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 14.2 [default] to 15.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "14.2" to "15.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 14.2 [default] to 15.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "14.2" to "15.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 14.2 [default] to 15.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "14.2" to "15.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 14.2 [default] to 15.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PV changed from "14.2" to "15.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 14.2 [default] to 15.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "14.2" to "15.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 14.2 [default] to 15.0 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.13/site-packages/websockets-14.2.dist-info -> /usr/lib/python3.13/site-packages/websockets-15.0.dist-info, added "/usr/lib/python3.13/site-packages/websockets/sync/__pycache__/router.cpython-313.pyc /usr/lib/python3.13/site-packages/websockets/sync/router.py /usr/lib/python3.13/site-packages/websockets/asyncio/__pycache__/router.cpython-313.pyc /usr/lib/python3.13/site-packages/websockets/asyncio/router.py"
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1171227 to 1274161 (+9%)
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PV changed from "14.2" to "15.0"
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGV changed from 14.2 [default] to 15.0 [default]
Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-14.2.dist-info moved to /usr/lib/python3.13/site-packages/websockets-15.0.dist-info
  /usr/lib/python3.13/site-packages/websockets/asyncio/__pycache__/router.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/websockets/asyncio/router.py was added
  /usr/lib/python3.13/site-packages/websockets/sync/__pycache__/router.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/websockets/sync/router.py was added

--===============0702318457911112378==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-14.2-15.0.patch"

RnJvbSAyOTdiNjM5ZDQyZGIwNmRjMzI5MjdlZjgzNTY4ZTEyMjhlMTQ2ODc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwODoxOToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2Vic29ja2V0czogdXBncmFkZSAxNC4yIC0+IDE1LjAKCi0tLQogLi4uL3tweXRob24z
LXdlYnNvY2tldHNfMTQuMi5iYiA9PiBweXRob24zLXdlYnNvY2tldHNfMTUuMC5iYn0gIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJzb2NrZXRzXzE0LjIuYmIg
PT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE1LjAuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTQuMi5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE1LjAuYmIKc2ltaWxh
cml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXdlYnNvY2tldHNfMTQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTUuMC5iYgppbmRleCAwYzdiN2QyNDcwLi45YTc0
NTZkZWU0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2Vic29ja2V0c18xNC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13ZWJzb2NrZXRzXzE1LjAuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTUxOTI0YTZhZjQ0OTViOGNmYWVlMWIxZGE4NjliNmY0Igog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNTA1OWVkOWM1NDk0NWVmYjMyMWYwOTcwODRiNGM3ZTUyYzI0NmYyYzg2OTgx
NTg3NmE2OWQxZWZjNGFkNmViNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjYTM2MTUxMjg5YTE1
YjM5ZDhkNjgzZmQ4YjdhYmJlMjZmYzUwYmUzMTEwNjZjNWY4ZGNmM2NiOGNlZTEwN2FiIgogCiBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDQuMQoK

--===============0702318457911112378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.13/site-packages/websockets-14.2.dist-info -> /usr/lib/python3.13/site-packages/websockets-15.0.dist-info, added "/usr/lib/python3.13/site-packages/websockets/asyncio/__pycache__/router.cpython-313.pyc /usr/lib/python3.13/site-packages/websockets/sync/__pycache__/router.cpython-313.pyc /usr/lib/python3.13/site-packages/websockets/asyncio/router.py /usr/lib/python3.13/site-packages/websockets/sync/router.py"
Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-14.2.dist-info moved to /usr/lib/python3.13/site-packages/websockets-15.0.dist-info
  /usr/lib/python3.13/site-packages/websockets/asyncio/__pycache__/router.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/websockets/asyncio/router.py was added
  /usr/lib/python3.13/site-packages/websockets/sync/__pycache__/router.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/websockets/sync/router.py was added

--===============0702318457911112378==--

