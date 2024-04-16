Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5B1C2BB9A
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.13582.1713248037649172335
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y63Do8v8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZJcIk64B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018ee58a6da1-9d1c4d58-d221-48b7-908a-18a55c00e924-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UNWTnR1aYkuWj4HfoXcBzU34iyX/Nenync+WgbCnioM=;
	b=Y63Do8v8Id9WlJOYPtWohn9K33LYD7yPcKbKdeu12hgsV31xfEJQNMO/WSdZoELP
	TXqglRlOPHAqYqxwNOMtf/VwMazyMsH6xlu5Ubss2gnX/ryMsxOfwwv5REBz3y1Sa1D
	7uh639czEAAE3zbF940cIGqPHFeTNgoyqAy5gGwo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UNWTnR1aYkuWj4HfoXcBzU34iyX/Nenync+WgbCnioM=;
	b=ZJcIk64BQpgh+jXPFoiWCAGS5J5bDp+eXHefTGPn1yPidyppKSKI5gYbW3nYM61W
	oHwWzf5fJohMjCxM9tAV73UYCqRSqiT9+hNBUXzHNZig2HYdHWHEYm5CEt7eFD5uXbg
	MbIBoEYmvW1TS4hUP945oDPYPCKhdeK46/+0ypfo=
Content-Type: multipart/mixed; boundary="===============8619448149054128591=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.23.0 SUCCEEDED
Message-ID: <0101018ee58a6da1-9d1c4d58-d221-48b7-908a-18a55c00e924-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198270

--===============8619448149054128591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.21.1-1.23.0.patch
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
From c16b3e863b3be342ac6b65ded2b979af9d16c077 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:05:44 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.21.1 -> 1.23.0

---
 ...{python3-hatchling_1.21.1.bb => python3-hatchling_1.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.21.1.bb => python3-hatchling_1.23.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.23.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.23.0.bb
index 09d936aa7d..dc9c798c80 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.23.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "bba440453a224e7d4478457fa2e8d8c3633765bafa02975a6b53b9bf917980bc"
+SRC_URI[sha256sum] = "bca7bb8e449ff044bb74fbead333a6d8e87109cc0245dfc63f177eaeb3ebaa38"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.42.0


--===============8619448149054128591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info -> /usr/lib/python3.12/site-packages/hatchling-1.23.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info/licenses -> /usr/lib/python3.12/site-packages/hatchling-1.23.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc /usr/lib/python3.12/site-packages/hatchling/builders/binary.py"
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.23.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/binary.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc was added

--===============8619448149054128591==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.21.1-1.23.0.patch"

RnJvbSBjMTZiM2U4NjNiM2JlMzQyYWM2YjY1ZGVkMmI5NzlhZjlkMTZjMDc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6MDU6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjIxLjEgLT4gMS4yMy4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjIxLjEuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4yMy4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjEu
MS5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjIzLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjIxLjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjMuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjIzLjAuYmIKaW5kZXggMDlkOTM2
YWE3ZC4uZGM5Yzc5OGM4MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjIxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjIzLjAuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIERF
UEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRob24zLWhhdGNobGluZy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYmE0NDA0NTNhMjI0ZTdkNDQ3ODQ1N2ZhMmU4ZDhjMzYz
Mzc2NWJhZmEwMjk3NWE2YjUzYjliZjkxNzk4MGJjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJj
YTdiYjhlNDQ5ZmYwNDRiYjc0ZmJlYWQzMzNhNmQ4ZTg3MTA5Y2MwMjQ1ZGZjNjNmMTc3ZWFlYjNl
YmFhMzgiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsKICAgICBleHBvcnQgUFlUSE9OUEFUSD1z
cmMKLS0gCjIuNDIuMAoK

--===============8619448149054128591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatchling: PKGV changed from 1.21.1 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.21.1.tar.gz;downloadfilename=hatchling-1.21.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.23.0.tar.gz;downloadfilename=hatchling-1.23.0.tar.gz"
packages/core2-64-poky-linux/python3-hatchling: PV changed from "1.21.1" to "1.23.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.21.1" to "1.23.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.21.1 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.21.1" to "1.23.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.21.1 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.21.1" to "1.23.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.21.1 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.21.1" to "1.23.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.21.1 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.21.1" to "1.23.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.21.1 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.21.1" to "1.23.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.21.1 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info -> /usr/lib/python3.12/site-packages/hatchling-1.23.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info/licenses -> /usr/lib/python3.12/site-packages/hatchling-1.23.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc /usr/lib/python3.12/site-packages/hatchling/builders/binary.py"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 654724 to 713065 (+9%)
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.21.1" to "1.23.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.21.1 [default] to 1.23.0 [default]
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.23.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/binary.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc was added

--===============8619448149054128591==--

