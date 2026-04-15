Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF54F42135
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19740.1776261876710485576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rlzLzvyL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dDXp/kDB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d9175499e-7fd46aa5-e753-4bbd-9788-a62e1d8ef0ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5H3eVEBLx30f6hg+hDsJp9t9eHdZpULpvaPh+qU27vQ=;
	b=rlzLzvyLEpgAQxVSwzfZTvcxuIU1hTbL/pHiJuvjgxriWl55NIvjqE/f7bTxwmR2
	MgK+dWB1qqhMVUfZ6aqGxEkaUCLSFJqDzdrKvuFOqRrSbjypvgIesgHDRUht55DF5N9
	KFOEWkE2BHM5e21BkQqFONfyjsvPSRuogjwkCxYE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5H3eVEBLx30f6hg+hDsJp9t9eHdZpULpvaPh+qU27vQ=;
	b=dDXp/kDBeNmR6HICTLOq6bpKtYQld5YcAievzREzsKZ3rmOiNrN751lRob08HwjB
	2CAVxJa9/s4gOAW2wwGps63UlLqt6DCy1lgPUgYoPvjTQSqqpoY03xkMqoDdT7Wm2I3
	lO9Bz2/t8Rs7T67RlxcsJxbCSre2wh0S5ClbmblM=
Content-Type: multipart/mixed; boundary="===============5023051851504363699=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 26.1.0 SUCCEEDED
Message-ID: <0101019d9175499e-7fd46aa5-e753-4bbd-9788-a62e1d8ef0ff-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235226

--===============5023051851504363699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-attrs* to *26.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-attrs-upgrade-25.4.0-26.1.0.patch
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
From 91608a06d1138e8d3f758eaba0d592408af0cf44 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:14:58 +0000
Subject: [PATCH] python3-attrs: upgrade 25.4.0 -> 26.1.0

---
 .../python/{python3-attrs_25.4.0.bb => python3-attrs_26.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_25.4.0.bb => python3-attrs_26.1.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-attrs_25.4.0.bb
rename to meta/recipes-devtools/python/python3-attrs_26.1.0.bb
index 7bc581b875..03621e41a6 100644
--- a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11"
+SRC_URI[sha256sum] = "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32"
 
 inherit pypi ptest-python-pytest python_hatchling
 
-- 
2.47.1


--===============5023051851504363699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: FILELIST: directory renamed /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info -> /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info moved to /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info

--===============5023051851504363699==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-25.4.0-26.1.0.patch"

RnJvbSA5MTYwOGEwNmQxMTM4ZThkM2Y3NThlYWJhMGQ1OTI0MDhhZjBjZjQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6MTQ6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWF0dHJzOiB1cGdyYWRlIDI1LjQuMCAtPiAyNi4xLjAKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1hdHRyc18yNS40LjAuYmIgPT4gcHl0aG9uMy1hdHRyc18yNi4xLjAuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1hdHRyc18yNS40LjAuYmIgPT4g
cHl0aG9uMy1hdHRyc18yNi4xLjAuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI1LjQuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yNi4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJz
XzI1LjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWF0dHJzXzI2LjEuMC5iYgppbmRleCA3YmM1ODFiODc1Li4wMzYyMWU0MWE2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNfMjUuNC4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yNi4xLjAuYmIK
QEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHA6Ly93d3cuYXR0cnMub3JnLyIKIExJQ0VO
U0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NWU1NTcz
MTgyNGNmOTIwNWNmYWJlYWI5YTA2MDA4ODciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxNmQ1
OTY5Yjg3ZjA4NTllZjMzYTQ4YjM1ZDU1YWMxYmU2ZTQyYWU0OWQ1ZTg1M2I1OTdkYjcwYzM1YzU3
ZTExIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQwM2NlYjg5Y2IzMjJhOGZkNzA2ZDRmYjkxOTQw
NzM3YjY2NDJhYTM2OTk4ZmUxMzBhOWJjOTZjOTg1ZWZmMzIiCiAKIGluaGVyaXQgcHlwaSBwdGVz
dC1weXRob24tcHl0ZXN0IHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Ny4xCgo=

--===============5023051851504363699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-attrs: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/attrs/attrs-25.4.0.tar.gz;downloadfilename=attrs-25.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/a/attrs/attrs-26.1.0.tar.gz;downloadfilename=attrs-26.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-dbg: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-dbg: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-dev: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-dev: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-doc: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-doc: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-locale: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-locale: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-ptest: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-ptest: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-ptest: PKGSIZE changed from 371846 to 380764 (+2%)
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-src: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-src: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-staticdev: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-staticdev: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: FILELIST: directory renamed /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info -> /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: PKGSIZE changed from 443005 to 445220 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info moved to /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info

--===============5023051851504363699==--

