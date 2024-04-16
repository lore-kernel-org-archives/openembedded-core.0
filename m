Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A01C25B76
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.13445.1713248040131297253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fg8EivRD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KhJkq2cb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018ee58a72c4-e887e701-caf5-4025-bd7e-59e59b6bf0fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nBgcaA9BhxnETGxuTajF6O6k3idhA3kRsOA8HjbIzJk=;
	b=fg8EivRDFuDTpUzqwYh1jbmTSeKqpM3r42+EaaeE+FSoVYcskXJTCqcQRmopVe1i
	xtEKxe2SGIRu89KG7OP9u2+DAh/IMMplmcqbHVk966VPCOHykp/3juWTC1aNMJdSJ+q
	mC3duA5LYxD3vEWFwjhh7xVqpx8rwJ9b+RPNGK34=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nBgcaA9BhxnETGxuTajF6O6k3idhA3kRsOA8HjbIzJk=;
	b=KhJkq2cbA79WOE61oVtzYrJZ8C/Gi3hwvNDyFSUOgzvSjS4Uh7CteRnGOeEZ9vYM
	80BWnXGSYyYDIwjdL/6/s8G2Xil+hzkUp1nQdDNa8lOnWTAZ1ss+rHfug0cwzVSKELY
	rJGorq8jnGotiB1/9iX7/IunaeVxV0Vjt6RhrH3I=
Content-Type: multipart/mixed; boundary="===============4820683322606253536=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.18.1 SUCCEEDED
Message-ID: <0101018ee58a72c4-e887e701-caf5-4025-bd7e-59e59b6bf0fd-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198315

--===============4820683322606253536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.18.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.17.0-3.18.1.patch
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
From 5b1e31517322d31a0e3b30c8f35076109e8459a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 20:18:50 +0000
Subject: [PATCH] python3-zipp: upgrade 3.17.0 -> 3.18.1

---
 .../python/{python3-zipp_3.17.0.bb => python3-zipp_3.18.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.17.0.bb => python3-zipp_3.18.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb b/meta/recipes-devtools/python/python3-zipp_3.18.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-zipp_3.17.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.18.1.bb
index e9e220e315..e43432469d 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.18.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "84e64a1c28cf7e91ed2078bb8cc8c259cb19b76942096c8d7b84947690cabaf0"
+SRC_URI[sha256sum] = "2884ed22e7d8961de1c9a05142eb69a247f120291bc0206a00a7642f09b5b715"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.42.0


--===============4820683322606253536==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.17.0-3.18.1.patch"

RnJvbSA1YjFlMzE1MTczMjJkMzFhMGUzYjMwYzhmMzUwNzYxMDllODQ1OWEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjA6MTg6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXppcHA6IHVwZ3JhZGUgMy4xNy4wIC0+IDMuMTguMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXppcHBfMy4xNy4wLmJiID0+IHB5dGhvbjMtemlwcF8zLjE4LjEuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXppcHBfMy4xNy4wLmJiID0+IHB5
dGhvbjMtemlwcF8zLjE4LjEuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xNy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMTcu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBf
My4xOC4xLmJiCmluZGV4IGU5ZTIyMGUzMTUuLmU0MzQzMjQ2OWQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMTcuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjE4LjEuYmIKQEAgLTMsNyAr
Myw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9qYXJhY28vemlwcCIKIExJQ0VO
U0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTQxNjQz
ZTExYzQ4ODk4MTUwZGFhODM4MDJkYmM2NWYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NGU2
NGExYzI4Y2Y3ZTkxZWQyMDc4YmI4Y2M4YzI1OWNiMTliNzY5NDIwOTZjOGQ3Yjg0OTQ3NjkwY2Fi
YWYwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI4ODRlZDIyZTdkODk2MWRlMWM5YTA1MTQyZWI2
OWEyNDdmMTIwMjkxYmMwMjA2YTAwYTc2NDJmMDliNWI3MTUiCiAKIERFUEVORFMgKz0gInB5dGhv
bjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogCi0tIAoyLjQyLjAKCg==

--===============4820683322606253536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 39154 to 45627 (+17%)
packages/core2-64-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.12/site-packages/zipp-3.17.0.dist-info -> /usr/lib/python3.12/site-packages/zipp-3.18.1.dist-info, removed "/usr/lib/python3.12/site-packages/zipp/__pycache__/py310compat.cpython-312.pyc /usr/lib/python3.12/site-packages/zipp/py310compat.py", added "/usr/lib/python3.12/site-packages/zipp/compat/__init__.py /usr/lib/python3.12/site-packages/zipp/compat/py310.py /usr/lib/python3.12/site-packages/zipp/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/zipp/compat/__pycache__/py310.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.12/site-packages/zipp-3.17.0.dist-info moved to /usr/lib/python3.12/site-packages/zipp-3.18.1.dist-info
  /usr/lib/python3.12/site-packages/zipp/compat was added
  /usr/lib/python3.12/site-packages/zipp/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/zipp/compat/py310.py was added
  /usr/lib/python3.12/site-packages/zipp/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/zipp/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/zipp/compat/__pycache__/py310.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/zipp/py310compat.py was removed
  /usr/lib/python3.12/site-packages/zipp/__pycache__/py310compat.cpython-312.pyc was removed

--===============4820683322606253536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.17.0.tar.gz;downloadfilename=zipp-3.17.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.18.1.tar.gz;downloadfilename=zipp-3.18.1.tar.gz"
packages/core2-64-poky-linux/python3-zipp: PV changed from "3.17.0" to "3.18.1"
packages/core2-64-poky-linux/python3-zipp: PKGV changed from 3.17.0 [default] to 3.18.1 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.17.0" to "3.18.1"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.17.0 [default] to 3.18.1 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.17.0" to "3.18.1"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.17.0 [default] to 3.18.1 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.17.0" to "3.18.1"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.17.0 [default] to 3.18.1 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.17.0" to "3.18.1"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.17.0 [default] to 3.18.1 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.17.0" to "3.18.1"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.17.0 [default] to 3.18.1 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.17.0" to "3.18.1"
packages/core2-64-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.17.0 [default] to 3.18.1 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp: PV changed from "3.17.0" to "3.18.1"
packages/core2-64-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.17.0 [default] to 3.18.1 [default]
packages/core2-64-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 39154 to 45627 (+17%)
packages/core2-64-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.12/site-packages/zipp-3.17.0.dist-info -> /usr/lib/python3.12/site-packages/zipp-3.18.1.dist-info, removed "/usr/lib/python3.12/site-packages/zipp/__pycache__/py310compat.cpython-312.pyc /usr/lib/python3.12/site-packages/zipp/py310compat.py", added "/usr/lib/python3.12/site-packages/zipp/compat/__pycache__/py310.cpython-312.pyc /usr/lib/python3.12/site-packages/zipp/compat/py310.py /usr/lib/python3.12/site-packages/zipp/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/zipp/compat/__init__.py"
Changes to packages/core2-64-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.12/site-packages/zipp-3.17.0.dist-info moved to /usr/lib/python3.12/site-packages/zipp-3.18.1.dist-info
  /usr/lib/python3.12/site-packages/zipp/compat was added
  /usr/lib/python3.12/site-packages/zipp/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/zipp/compat/py310.py was added
  /usr/lib/python3.12/site-packages/zipp/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/zipp/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/zipp/compat/__pycache__/py310.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/zipp/py310compat.py was removed
  /usr/lib/python3.12/site-packages/zipp/__pycache__/py310compat.cpython-312.pyc was removed

--===============4820683322606253536==--

