Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE121D5C0CB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17383.1765872127805893802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zWh3ME9x;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SonBjOtb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e82d4-01c82efb-a024-461f-896e-901a5cfe5b35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g/d8yKusxMDessK6EdVqVBvM2eqyzKWAbg36UYoK4g4=;
	b=zWh3ME9xEf0msCIGfMOyiluIYv6EGiJNf2r+e0onkHbVwFGTHwoiL0Ru7dkqeixw
	BBV5/EfpKflnX2kpAMwicobeXpxkkQPp5QOmxgnCkK8gVL4OPvU0WFoVUWWhjHZ5sex
	hGdRwiLgjGCS2uu+Ljo6ATAaxOV3waNOl7JIo96k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g/d8yKusxMDessK6EdVqVBvM2eqyzKWAbg36UYoK4g4=;
	b=SonBjOtbO/j8z6NcMzv2aZAHBUMDBSEe2VNypbuQK5bhXMUG2I0m/Slq5iuzHpSF
	Qi7xik4syPTg1hm/URgeMQ7dnpGZgSIgH7UX54XA9qWqiZ4/pJISGlBUSv0sq6kIDgH
	9oMFgATWfUScBNuIy61k51Q6A7PAlDXAqEL5C57U=
Content-Type: multipart/mixed; boundary="===============2940945390096626103=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.28.0 SUCCEEDED
Message-ID: <0101019b262e82d4-01c82efb-a024-461f-896e-901a5cfe5b35-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227804

--===============2940945390096626103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.28.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.27.0-1.28.0.patch
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
From 63bc5626d5e965303e783ef6b68ee8ebf27c823d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:45:27 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.27.0 -> 1.28.0

---
 ...{python3-hatchling_1.27.0.bb => python3-hatchling_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.27.0.bb => python3-hatchling_1.28.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.27.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.27.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.28.0.bb
index 5239d8155c..b5a55a0790 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.27.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "971c296d9819abb3811112fc52c7a9751c8d381898f36533bb16f9791e941fd6"
+SRC_URI[sha256sum] = "4d50b02aece6892b8cd0b3ce6c82cb218594d3ec5836dbde75bf41a21ab004c8"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.47.1


--===============2940945390096626103==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.27.0-1.28.0.patch"

RnJvbSA2M2JjNTYyNmQ1ZTk2NTMwM2U3ODNlZjZiNjhlZThlYmYyN2M4MjNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6NDU6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjI3LjAgLT4gMS4yOC4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjI3LjAuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4yOC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjcu
MC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjI4LjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI3LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjguMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI4LjAuYmIKaW5kZXggNTIzOWQ4
MTU1Yy4uYjVhNTVhMDc5MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjI3LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI4LjAuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIERF
UEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRob24zLWhhdGNobGluZy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NzFjMjk2ZDk4MTlhYmIzODExMTEyZmM1MmM3YTk3NTFj
OGQzODE4OThmMzY1MzNiYjE2Zjk3OTFlOTQxZmQ2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRk
NTBiMDJhZWNlNjg5MmI4Y2QwYjNjZTZjODJjYjIxODU5NGQzZWM1ODM2ZGJkZTc1YmY0MWEyMWFi
MDA0YzgiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsKICAgICBleHBvcnQgUFlUSE9OUEFUSD1z
cmMKLS0gCjIuNDcuMQoK

--===============2940945390096626103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hatchling-1.27.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/hatchling-1.28.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/hatchling-1.27.0.dist-info -> /usr/lib/python3.13/site-packages/hatchling-1.28.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.13/site-packages/hatchling-1.27.0.dist-info moved to /usr/lib/python3.13/site-packages/hatchling-1.28.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.13/site-packages/hatchling-1.27.0.dist-info moved to /usr/lib/python3.13/site-packages/hatchling-1.28.0.dist-info

--===============2940945390096626103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hatchling: PV changed from "1.27.0" to "1.28.0"
packages/x86-64-v3-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.27.0.tar.gz;downloadfilename=hatchling-1.27.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.28.0.tar.gz;downloadfilename=hatchling-1.28.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-hatchling: PKGV changed from 1.27.0 [default] to 1.28.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.27.0" to "1.28.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.27.0 [default] to 1.28.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.27.0" to "1.28.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.27.0 [default] to 1.28.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.27.0" to "1.28.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.27.0 [default] to 1.28.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.27.0" to "1.28.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.27.0 [default] to 1.28.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.27.0" to "1.28.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.27.0 [default] to 1.28.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.27.0" to "1.28.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.27.0 [default] to 1.28.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.27.0" to "1.28.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 625948 to 630670 (+1%)
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hatchling-1.27.0.dist-info -> /usr/lib/python3.13/site-packages/hatchling-1.28.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/hatchling-1.27.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/hatchling-1.28.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.27.0 [default] to 1.28.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.13/site-packages/hatchling-1.27.0.dist-info moved to /usr/lib/python3.13/site-packages/hatchling-1.28.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.13/site-packages/hatchling-1.27.0.dist-info moved to /usr/lib/python3.13/site-packages/hatchling-1.28.0.dist-info

--===============2940945390096626103==--

