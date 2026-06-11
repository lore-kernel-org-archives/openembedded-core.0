Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17F5CD98DC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50407.1781195495833571318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tcus/jn2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sjhOjuYA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb7867a3b-247c22cc-582a-4118-8277-6c2aa3858aa0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jeGW2V+wzoo8D0AsXWkOLJXDVeHyj45kgRbcM5UjJv0=;
	b=Tcus/jn2Mk9gf/psgQsxIuRg/l8ROnfTpTNqXebaM9x0yw6H+X03Wkxodw4B9Wnz
	nKdbPCS5Iau9Z/+o+24Yco6Qwop7Y6mXhl4KNzfjgZGXtp96L3HKrdW1C0O1y9injuI
	G5nnjgqxjXkLlvEHhcdhpnzME1w1+OWbuzaN8BOc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jeGW2V+wzoo8D0AsXWkOLJXDVeHyj45kgRbcM5UjJv0=;
	b=sjhOjuYAB2Nz2mAyIACT9mcm69CHUya91Bo0PhtH/9ZALNCN2DWXOQ2flFkXihlY
	drdrpfuIJbe4GhCC9ZMDCvrP37159heu63WR31VT8eklv/vlIDGPEZZ4qD44sL8gjq/
	EXqz0KLlcSWgABtpibPHX4a3pPzf8z07HDfE108k=
Content-Type: multipart/mixed; boundary="===============1095469109459319866=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.30.1 SUCCEEDED
Message-ID: <0101019eb7867a3b-247c22cc-582a-4118-8277-6c2aa3858aa0-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238488

--===============1095469109459319866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.30.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.29.0-1.30.1.patch
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
From b7ee1bc1333d099e945f59029861fa482f6a3a3c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:29:44 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.29.0 -> 1.30.1

---
 ...{python3-hatchling_1.29.0.bb => python3-hatchling_1.30.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.29.0.bb => python3-hatchling_1.30.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.29.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
index 080a954f7f..23067e3e58 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "793c31816d952cee405b83488ce001c719f325d9cda69f1fc4cd750527640ea6"
+SRC_URI[sha256sum] = "eee4fd45357f72ebb3d7a42e5d72cfb5e29ed426d79e8836288926c4258d5f2e"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============1095469109459319866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.29.0.tar.gz;downloadfilename=hatchling-1.29.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.30.1.tar.gz;downloadfilename=hatchling-1.30.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-hatchling: PKGV changed from 1.29.0 [default] to 1.30.1 [default]
packages/x86-64-v3-poky-linux/python3-hatchling: PV changed from "1.29.0" to "1.30.1"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.29.0 [default] to 1.30.1 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.29.0" to "1.30.1"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.29.0 [default] to 1.30.1 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.29.0" to "1.30.1"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.29.0 [default] to 1.30.1 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.29.0" to "1.30.1"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.29.0 [default] to 1.30.1 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.29.0" to "1.30.1"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.29.0 [default] to 1.30.1 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.29.0" to "1.30.1"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.29.0 [default] to 1.30.1 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.29.0" to "1.30.1"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 691490 to 712964 (+3%)
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.29.0 [default] to 1.30.1 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.29.0" to "1.30.1"
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info

--===============1095469109459319866==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.29.0-1.30.1.patch"

RnJvbSBiN2VlMWJjMTMzM2QwOTllOTQ1ZjU5MDI5ODYxZmE0ODJmNmEzYTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6Mjk6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjI5LjAgLT4gMS4zMC4xCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjI5LjAuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4zMC4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjku
MC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjMwLjEuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI5LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzAuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMwLjEuYmIKaW5kZXggMDgwYTk1
NGY3Zi4uMjMwNjdlM2U1OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjI5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMwLjEuYmIKQEAgLTcsNiArNyw2IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5h
dGl2ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0
aG9uMy1lZGl0YWJsZXMtbmF0aXZlIHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnMtbmF0aXZlIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzkzYzMxODE2ZDk1MmNlZTQwNWI4MzQ4OGNlMDAxYzcx
OWYzMjVkOWNkYTY5ZjFmYzRjZDc1MDUyNzY0MGVhNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJl
ZWU0ZmQ0NTM1N2Y3MmViYjNkN2E0MmU1ZDcyY2ZiNWUyOWVkNDI2ZDc5ZTg4MzYyODg5MjZjNDI1
OGQ1ZjJlIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0tIAoyLjQ3LjEK
Cg==

--===============1095469109459319866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info

--===============1095469109459319866==--

