Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFEFCD98D9
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:48 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50610.1781195501901811018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UtasbIIf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OE5i5OO4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019eb78685d8-ed86c27b-26e9-45ab-9cd5-88271429c6f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JSV/ZocS+ntM8wnBtUDafS6JeW7WojLaX8MmYcR1Rhs=;
	b=UtasbIIfag9rEn8EJ/rt4EY0pz7xY1FPGr4mBx7/s8RR6Fi+o604UghNcxIEn6ja
	3kpmr9PyQNSOYLBz3cAUSdpR2L55kn4fyQnlpmk2F6mgdrrnkGUOptoyqTNUnmzyQKR
	Qb4nTUeFqrkkTglG4wYjxrEsz3cQCoUglZgr/2HE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JSV/ZocS+ntM8wnBtUDafS6JeW7WojLaX8MmYcR1Rhs=;
	b=OE5i5OO4/QhtCpWDq5YNWiQvc3peJWvRq4JIIDFlzSUeAYeGneojIX1xzrUCy5lG
	7Tf45w8r//y0Soazh54+AhDCn7s5S7EMY4zpDbvPTxjKzlCDvCt6kKlTSnVMsUuDa81
	Ice40Q1xSix9lIGdQw4hgA2jHkqs6m6SKynhgWJ0=
Content-Type: multipart/mixed; boundary="===============0574975842530693475=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-snowballstemmer: upgrading to 3.1.1 SUCCEEDED
Message-ID: <0101019eb78685d8-ed86c27b-26e9-45ab-9cd5-88271429c6f6-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238499

--===============0574975842530693475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-snowballstemmer* to *3.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-snowballstemmer-upgrade-3.1.0-3.1.1.patch
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
From 5fd1cc4b2e53ece0e1d4d03401919f74ed6876ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:13:19 +0000
Subject: [PATCH] python3-snowballstemmer: upgrade 3.1.0 -> 3.1.1

---
 ...nowballstemmer_3.1.0.bb => python3-snowballstemmer_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-snowballstemmer_3.1.0.bb => python3-snowballstemmer_3.1.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb
rename to meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb
index 52911593ae..032197008f 100644
--- a/meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/snowballstem/snowball"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=07c3b61d971c3df6e19ce439cfe1fb8c"
 
-SRC_URI[sha256sum] = "fd9e34526b23340cd23ffea6c9f9760974ecc2c2ac9e1d81401443ccdb2a801f"
+SRC_URI[sha256sum] = "e07bbc54a0d798fe6010a12398422e62a8bfbba95c394fd0956ef58cb4d3e260"
 
 PYPI_PACKAGE = "snowballstemmer"
 
-- 
2.47.1


--===============0574975842530693475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-snowballstemmer: PV changed from "3.1.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-snowballstemmer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/snowballstemmer/snowballstemmer-3.1.0.tar.gz;downloadfilename=snowballstemmer-3.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/snowballstemmer/snowballstemmer-3.1.1.tar.gz;downloadfilename=snowballstemmer-3.1.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-snowballstemmer: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dbg: PV changed from "3.1.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dbg: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dev: PV changed from "3.1.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dev: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-doc: PV changed from "3.1.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-doc: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-locale: PV changed from "3.1.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-locale: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-src: PV changed from "3.1.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-src: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-staticdev: PV changed from "3.1.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer-staticdev: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PV changed from "3.1.0" to "3.1.1"
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PKGSIZE changed from 1876693 to 1860591 (-1%)
packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info -> /usr/lib/python3.14/site-packages/snowballstemmer-3.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/snowballstemmer-3.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-snowballstemmer (sysroot):
  /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info moved to /usr/lib/python3.14/site-packages/snowballstemmer-3.1.1.dist-info

--===============0574975842530693475==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-snowballstemmer-upgrade-3.1.0-3.1.1.patch"

RnJvbSA1ZmQxY2M0YjJlNTNlY2UwZTFkNGQwMzQwMTkxOWY3NGVkNjg3NmVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6MTM6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNub3diYWxsc3RlbW1lcjogdXBncmFkZSAzLjEuMCAtPiAzLjEuMQoKLS0tCiAuLi5u
b3diYWxsc3RlbW1lcl8zLjEuMC5iYiA9PiBweXRob24zLXNub3diYWxsc3RlbW1lcl8zLjEuMS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNub3diYWxsc3Rl
bW1lcl8zLjEuMC5iYiA9PiBweXRob24zLXNub3diYWxsc3RlbW1lcl8zLjEuMS5iYn0gKDc4JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc25vd2Jh
bGxzdGVtbWVyXzMuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNub3diYWxsc3RlbW1lcl8zLjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc25vd2JhbGxzdGVtbWVyXzMu
MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc25v
d2JhbGxzdGVtbWVyXzMuMS4xLmJiCmluZGV4IDUyOTExNTkzYWUuLjAzMjE5NzAwOGYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zbm93YmFsbHN0ZW1t
ZXJfMy4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNu
b3diYWxsc3RlbW1lcl8zLjEuMS5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6
Ly9naXRodWIuY29tL3Nub3diYWxsc3RlbS9zbm93YmFsbCIKIExJQ0VOU0UgPSAiQlNELTMtQ2xh
dXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MDdjM2I2MWQ5NzFj
M2RmNmUxOWNlNDM5Y2ZlMWZiOGMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZDllMzQ1MjZi
MjMzNDBjZDIzZmZlYTZjOWY5NzYwOTc0ZWNjMmMyYWM5ZTFkODE0MDE0NDNjY2RiMmE4MDFmIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImUwN2JiYzU0YTBkNzk4ZmU2MDEwYTEyMzk4NDIyZTYyYThi
ZmJiYTk1YzM5NGZkMDk1NmVmNThjYjRkM2UyNjAiCiAKIFBZUElfUEFDS0FHRSA9ICJzbm93YmFs
bHN0ZW1tZXIiCiAKLS0gCjIuNDcuMQoK

--===============0574975842530693475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-snowballstemmer/python3-snowballstemmer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info -> /usr/lib/python3.14/site-packages/snowballstemmer-3.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/snowballstemmer-3.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-snowballstemmer (sysroot):
  /usr/lib/python3.14/site-packages/snowballstemmer-3.1.0.dist-info moved to /usr/lib/python3.14/site-packages/snowballstemmer-3.1.1.dist-info

--===============0574975842530693475==--

