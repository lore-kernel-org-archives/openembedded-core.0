Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCBBC2FC02
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.823.1686887483263578426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cZE/QJbY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c25444b3-e08b1f88-a7b1-4d84-b574-390d77db6d40-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aFRBFAuUlMZYHVNUlYjuMoSeOqzl2pMK1g+i/YAkoSY=;
	b=cZE/QJbYHF4rn1V68dJgc5L0VG6JGHGE5xNX4ya6sq1Slfgn1cdu78YT37RwB8hO
	jjIhHYx6bv5Db+jDXnKMYkDy6IJdY3/L2NusO54ECL/hF7ke46SjRI5CysMiC8p2ez4
	HA3b4AHVuFSGClo2BEf3f/3JNxzCHXk6wJOxpX1A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aFRBFAuUlMZYHVNUlYjuMoSeOqzl2pMK1g+i/YAkoSY=;
	b=hcasD1jDWeLU8weEarUJ0YoOIzwli81Wpl4+3rBxwf9bl0VmtEWWyNO1jOg2YXJC
	8ZLs01Vij3fh7D6YY1DsJvH1P2psJZwbA2j8DvwrQCk9GbX+spDqu8yNpuPX0EUCcsx
	xKMnM9MGOPsV/YdJCgcNhsYl6Ozx8YuK08qwXZIY=
Content-Type: multipart/mixed; boundary="===============1195083149949274306=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.18.0 SUCCEEDED
Message-ID: <01010188c25444b3-e08b1f88-a7b1-4d84-b574-390d77db6d40-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182918

--===============1195083149949274306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.17.0-1.18.0.patch
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
From 9758e255f034d881b29b47e5b053de8319be4a87 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:12:03 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.17.0 -> 1.18.0

---
 ...{python3-hatchling_1.17.0.bb => python3-hatchling_1.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.17.0.bb => python3-hatchling_1.18.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.17.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.17.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
index 05a86f0efb..c94e49dab3 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.17.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "b1244db3f45b4ef5a00106a46612da107cdfaf85f1580b8e1c059fefc98b0930"
+SRC_URI[sha256sum] = "50e99c3110ce0afc3f7bdbadff1c71c17758e476731c27607940cfa6686489ca"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.39.2


--===============1195083149949274306==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.17.0-1.18.0.patch"

RnJvbSA5NzU4ZTI1NWYwMzRkODgxYjI5YjQ3ZTViMDUzZGU4MzE5YmU0YTg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6MTI6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjE3LjAgLT4gMS4xOC4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjE3LjAuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4xOC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTcu
MC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjE4LjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjE3LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTguMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjE4LjAuYmIKaW5kZXggMDVhODZm
MGVmYi4uYzk0ZTQ5ZGFiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjE3LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjE4LjAuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIERF
UEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRob24zLWhhdGNobGluZy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiMTI0NGRiM2Y0NWI0ZWY1YTAwMTA2YTQ2NjEyZGExMDdj
ZGZhZjg1ZjE1ODBiOGUxYzA1OWZlZmM5OGIwOTMwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUw
ZTk5YzMxMTBjZTBhZmMzZjdiZGJhZGZmMWM3MWMxNzc1OGU0NzY3MzFjMjc2MDc5NDBjZmE2Njg2
NDg5Y2EiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsKICAgICBleHBvcnQgUFlUSE9OUEFUSD1z
cmMKLS0gCjIuMzkuMgoK

--===============1195083149949274306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.17.0" to "1.18.0"
packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.17.0.tar.gz;downloadfilename=hatchling-1.17.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.18.0.tar.gz;downloadfilename=hatchling-1.18.0.tar.gz"
packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.17.0 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.17.0" to "1.18.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.17.0 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.17.0" to "1.18.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.17.0 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.17.0" to "1.18.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.17.0 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.17.0" to "1.18.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.17.0 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.17.0" to "1.18.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.17.0 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.17.0" to "1.18.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.17.0 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.17.0" to "1.18.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 680279 to 680784 (+0%)
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.17.0 [default] to 1.18.0 [default]
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.18.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.18.0.dist-info

--===============1195083149949274306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.18.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.18.0.dist-info

--===============1195083149949274306==--

