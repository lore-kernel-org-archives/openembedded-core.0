Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D38F4211C
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:55 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19818.1776261877443292947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iiL6cOOZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zHpYT7Ln;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d91756289-5a3615cf-380b-4dfd-aa8d-616594b3276a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cT+MHj7z0UzDk1QRpZidJ2MjYP/nirq6VQqAs2CQ0ak=;
	b=iiL6cOOZzwauqs+14z0DCbp5qJWW/S4ZKUxpSBLUlCp248cU6OEATjrNuf0Ojl43
	Gb5dGcetqTKZEzF6cySo1WZxD3iRQ/1NhUKCRsQcf7Y6/ExTC/ewpyYsvR1Qt77VYy0
	BquYhBaq+pgci64MmOoxulq4uQBC1+0H/EySWXz0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cT+MHj7z0UzDk1QRpZidJ2MjYP/nirq6VQqAs2CQ0ak=;
	b=zHpYT7Ln3/uNR1+NcU8EGdcbsHhGk4I45/PPH6G9k+zEZf2U4M7FtXOYll3LTn6R
	fxOpOvoTB74dZDnQi4N9v/OzGsIPb6NgHVvCL7UJgb5+DZmdi31/4zPpjwz5BtNXF+W
	bZYOPFXDoW4q0MpjxhKd8aeZt80f2BMNX1B64UNQ=
Content-Type: multipart/mixed; boundary="===============1191927830768234242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.9.0 SUCCEEDED
Message-ID: <0101019d91756289-5a3615cf-380b-4dfd-aa8d-616594b3276a-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235247

--===============1191927830768234242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-testtools* to *2.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-testtools-upgrade-2.8.7-2.9.0.patch
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
From ae177e3078781369edb2f0aa655782ee846b9955 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:04:50 +0000
Subject: [PATCH] python3-testtools: upgrade 2.8.7 -> 2.9.0

---
 .../{python3-testtools_2.8.7.bb => python3-testtools_2.9.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.8.7.bb => python3-testtools_2.9.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.8.7.bb b/meta/recipes-devtools/python/python3-testtools_2.9.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.8.7.bb
rename to meta/recipes-devtools/python/python3-testtools_2.9.0.bb
index db3ec2373d..a7011acd78 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.8.7.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.9.0.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "1aa19aaabf9736385fc111a95f94f6b0661c0b41e65ca5129223eb518c63e8b9"
+SRC_URI[sha256sum] = "eb562d1a2157c6d443c8c118861eb452b3655d1842f9b61b8567ad01b32826e3"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.47.1


--===============1191927830768234242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info, added "/usr/lib/python3.14/site-packages/testtools/__pycache__/_types.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/_types.py"
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info
  /usr/lib/python3.14/site-packages/testtools/__pycache__/_types.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/_types.py was added

--===============1191927830768234242==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-testtools-upgrade-2.8.7-2.9.0.patch"

RnJvbSBhZTE3N2UzMDc4NzgxMzY5ZWRiMmYwYWE2NTU3ODJlZTg0NmI5OTU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6MDQ6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRlc3R0b29sczogdXBncmFkZSAyLjguNyAtPiAyLjkuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtdGVzdHRvb2xzXzIuOC43LmJiID0+IHB5dGhvbjMtdGVzdHRvb2xzXzIuOS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRlc3R0b29sc18yLjguNy5i
YiA9PiBweXRob24zLXRlc3R0b29sc18yLjkuMC5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOC43LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRlc3R0b29sc18yLjkuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdGVzdHRvb2xzXzIuOC43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOS4wLmJiCmluZGV4IGRiM2VjMjM3M2QuLmE3
MDExYWNkNzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10ZXN0dG9vbHNfMi44LjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXRlc3R0b29sc18yLjkuMC5iYgpAQCAtOCw3ICs4LDcgQEAgREVQRU5EUyArPSAicHl0
aG9uMy1oYXRjaC12Y3MtbmF0aXZlIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWFhMTlhYWFiZjk3MzYzODVmYzExMWE5NWY5NGY2YjA2
NjFjMGI0MWU2NWNhNTEyOTIyM2ViNTE4YzYzZThiOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJl
YjU2MmQxYTIxNTdjNmQ0NDNjOGMxMTg4NjFlYjQ1MmIzNjU1ZDE4NDJmOWI2MWI4NTY3YWQwMWIz
MjgyNmUzIgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICAgIHB5dGhvbjMtY29tcHJlc3Npb24g
XAotLSAKMi40Ny4xCgo=

--===============1191927830768234242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-testtools: PKGV changed from 2.8.7 [default] to 2.9.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.8.7.tar.gz;downloadfilename=testtools-2.8.7.tar.gz" to "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.9.0.tar.gz;downloadfilename=testtools-2.9.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-testtools: PV changed from "2.8.7" to "2.9.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PKGV changed from 2.8.7 [default] to 2.9.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PV changed from "2.8.7" to "2.9.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PKGV changed from 2.8.7 [default] to 2.9.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PV changed from "2.8.7" to "2.9.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PKGV changed from 2.8.7 [default] to 2.9.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PV changed from "2.8.7" to "2.9.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PKGV changed from 2.8.7 [default] to 2.9.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PV changed from "2.8.7" to "2.9.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PKGV changed from 2.8.7 [default] to 2.9.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PV changed from "2.8.7" to "2.9.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PKGV changed from 2.8.7 [default] to 2.9.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PV changed from "2.8.7" to "2.9.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 979979 to 980199 (+0%)
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/testtools/_types.py /usr/lib/python3.14/site-packages/testtools/__pycache__/_types.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGV changed from 2.8.7 [default] to 2.9.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PV changed from "2.8.7" to "2.9.0"
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info
  /usr/lib/python3.14/site-packages/testtools/__pycache__/_types.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/_types.py was added

--===============1191927830768234242==--

