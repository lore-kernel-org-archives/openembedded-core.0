Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6FFC982F5
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:40:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42910.1789969207784928761
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 22:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=efJ09h7Z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IyS3SAiD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0c27a8dc3-cff4353a-42bf-4be0-a4ac-d7db63daf465-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789969206;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3f3tKmC6tiMWsDRaw5OMQLjk9xndXAtC4seMcE7NXLs=;
	b=efJ09h7ZUYvibR1myEix52sbh4VEwayi8aXUyrJ5YGHOSc3QM52ntHCu6XvNFghF
	CSfelz2w9V9AePV0uAdM9fAj6tgp4n7YD5ILXaNhemJoIPaQdkswQcMemSLmT9p6grm
	kG7osVE2zjiCnzYE5trCLjx2vsFZPoMNsgmi5DyM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789969206;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3f3tKmC6tiMWsDRaw5OMQLjk9xndXAtC4seMcE7NXLs=;
	b=IyS3SAiDOqSvOKuJH6wdETxtyF6jF7fyYtmURJO0sTcrmlzmRRXH3t8KQdX1+e3Y
	irkVk/ZTrmXK+hDLUqlwr3U3B0mc4nLwdaGfPpSejw0bdVSrgQncTZLo0ZKmx5+uIjF
	A1uqyJJ8jXuxSWm8OkL9xOzVhexAIvnU3RDSugLQ=
Content-Type: multipart/mixed; boundary="===============6950420602321835974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.32.4 SUCCEEDED
Message-ID: <010101a0c27a8dc3-cff4353a-42bf-4be0-a4ac-d7db63daf465-000000@us-west-2.amazonses.com>
Date: Mon, 21 Sep 2026 05:40:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.21-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246278

--===============6950420602321835974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.32.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.32.0-1.32.4.patch
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
From 5e881cac904fae07ce17fd8907b03d90b5e26b50 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 21 Sep 2026 05:07:58 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.32.0 -> 1.32.4

---
 ...{python3-hatchling_1.32.0.bb => python3-hatchling_1.32.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.32.0.bb => python3-hatchling_1.32.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.32.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.32.4.bb
index e0c82ff367..1420625d9e 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.32.4.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-packaging-native python3-pathspec-native python3-pluggy-native python3-tomlkit-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "0bdbde4a52b06c37e3eca395f85a762bf0ef06fe374fd8ae429dc6be10230f5f"
+SRC_URI[sha256sum] = "c4468f73144c054d2aab4ef0f0378c43b9878bf07f8ffd6b79690e970d375f07"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============6950420602321835974==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.32.0-1.32.4.patch"

RnJvbSA1ZTg4MWNhYzkwNGZhZTA3Y2UxN2ZkODkwN2IwM2Q5MGI1ZTI2YjUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjEgU2VwIDIwMjYgMDU6MDc6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjMyLjAgLT4gMS4zMi40CgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjMyLjAuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4zMi40LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzIu
MC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjMyLjQuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMyLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzIuNC5i
YgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMyLjQuYmIKaW5kZXggZTBjODJm
ZjM2Ny4uMTQyMDYyNWQ5ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjMyLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMyLjQuYmIKQEAgLTcsNiArNyw2IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKIERFUEVORFMgKz0gInB5dGhvbjMtcGFja2FnaW5n
LW5hdGl2ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBsdWdneS1uYXRpdmUgcHl0
aG9uMy10b21sa2l0LW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjBiZGJkZTRhNTJiMDZjMzdlM2VjYTM5NWY4NWE3NjJiZjBl
ZjA2ZmUzNzRmZDhhZTQyOWRjNmJlMTAyMzBmNWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzQ0
NjhmNzMxNDRjMDU0ZDJhYWI0ZWYwZjAzNzhjNDNiOTg3OGJmMDdmOGZmZDZiNzk2OTBlOTcwZDM3
NWYwNyIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4xCgo=

--===============6950420602321835974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hatchling: PV changed from "1.32.0" to "1.32.4"
packages/x86-64-v3-poky-linux/python3-hatchling: PKGV changed from 1.32.0 [default] to 1.32.4 [default]
packages/x86-64-v3-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.32.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.32.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.32.0" to "1.32.4"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.32.0 [default] to 1.32.4 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.32.0" to "1.32.4"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.32.0 [default] to 1.32.4 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.32.0" to "1.32.4"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.32.0 [default] to 1.32.4 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.32.0" to "1.32.4"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.32.0 [default] to 1.32.4 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.32.0" to "1.32.4"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.32.0 [default] to 1.32.4 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.32.0" to "1.32.4"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.32.0 [default] to 1.32.4 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.32.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.32.0.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.32.0" to "1.32.4"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.32.0 [default] to 1.32.4 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 719762 to 722605 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.32.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info

--===============6950420602321835974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.32.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.32.0.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.32.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.32.4.dist-info

--===============6950420602321835974==--

