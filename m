Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D930CD98E1
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:49 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50424.1781195505185481678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VGOlBYIF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4MOjh4Ri;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019eb7867b5a-0dc8cbcf-83b0-41a9-87fe-94f1aca1ada3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I3WYKsjtrTD7duLsZwmDM+pfNsTRZC9qxKvqvYkO1Lw=;
	b=VGOlBYIFID6ZIGjBu07rpmdhbpf1zeE82fgdO0xRXJAOGAUh6XbORhWkhTbGtZdK
	xi1/ijUppbKGmaQe2xrpPBGfhNZdFIPjNMl6MSg6hi2mHuyVs2GxQ/lJwuQmToeYqEg
	CTy+5Qvzfykfiiq8q3Il6VPZ6oVXj5HeYV8GCsY8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I3WYKsjtrTD7duLsZwmDM+pfNsTRZC9qxKvqvYkO1Lw=;
	b=4MOjh4RiOc/FhZ+6KeSlbdS7N2t69pfYSdgfWDW5lkBW0EFnCKcAih/l431Fg3+t
	UwHSq6XQvnJGjNpUTN2cycR6nOXwVIMRJokEp61UF6Dho/Sj/jo020DFykr0sXkUSP0
	Wr1fTO3bgpSOtOEGZKYxMJ907dn91E2v3iBOiTIk=
Content-Type: multipart/mixed; boundary="===============4433894664153621230=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 6.1.1 SUCCEEDED
Message-ID: <0101019eb7867b5a-0dc8cbcf-83b0-41a9-87fe-94f1aca1ada3-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238494

--===============4433894664153621230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-lxml* to *6.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-6.1.0-6.1.1.patch
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
From 459b5084865e688ab1d61e0f32a774463ad944d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:41:55 +0000
Subject: [PATCH] python3-lxml: upgrade 6.1.0 -> 6.1.1

---
 .../python/{python3-lxml_6.1.0.bb => python3-lxml_6.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.1.0.bb => python3-lxml_6.1.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.1.0.bb b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.1.0.bb
rename to meta/recipes-devtools/python/python3-lxml_6.1.1.bb
index b7bbf5c3d6..77386ebdd0 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.1.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "bfd57d8008c4965709a919c3e9a98f76c2c7cb319086b3d26858250620023b13"
+SRC_URI[sha256sum] = "ba96ae44888e0185281e937633a743ea90d5a196c6000f82565ebb0580012d40"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.47.1


--===============4433894664153621230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.1.0.tar.gz;downloadfilename=lxml-6.1.0.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.1.0.tar.gz;downloadfilename=lxml-6.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.1.1.tar.gz;downloadfilename=lxml-6.1.1.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.1.1.tar.gz;downloadfilename=lxml-6.1.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-lxml: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 21258062 to 21258102 (+0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: FILELIST: directory renamed /usr/src/debug/python3-lxml/6.1.0/src/lxml/html -> /usr/src/debug/python3-lxml/6.1.1/src/lxml/html, directory renamed /usr/src/debug/python3-lxml/6.1.0/src/lxml -> /usr/src/debug/python3-lxml/6.1.1/src/lxml, directory renamed /usr/src/debug/python3-lxml/6.1.0/src/lxml/includes -> /usr/src/debug/python3-lxml/6.1.1/src/lxml/includes
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 5930862 to 5930523 (-0%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PV changed from "6.1.0" to "6.1.1"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGV changed from 6.1.0 [default] to 6.1.1 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info -> /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info moved to /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info

--===============4433894664153621230==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-6.1.0-6.1.1.patch"

RnJvbSA0NTliNTA4NDg2NWU2ODhhYjFkNjFlMGYzMmE3NzQ0NjNhZDk0NGQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6NDE6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWx4bWw6IHVwZ3JhZGUgNi4xLjAgLT4gNi4xLjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1seG1sXzYuMS4wLmJiID0+IHB5dGhvbjMtbHhtbF82LjEuMS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1seG1sXzYuMS4wLmJiID0+IHB5dGhv
bjMtbHhtbF82LjEuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbHhtbF82LjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1seG1sXzYuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMS4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF82LjEuMS5i
YgppbmRleCBiN2JiZjVjM2Q2Li43NzM4NmViZGQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF82LjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF82LjEuMS5iYgpAQCAtMTgsNyArMTgsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy50eHQ7bWQ1PWU0YzA0NWViYWQ5NThl
YWQ0YjQ4MDA4ZjcwODM4NDAzIFwKIAogREVQRU5EUyArPSAibGlieG1sMiBsaWJ4c2x0IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYmZkNTdkODAwOGM0OTY1NzA5YTkxOWMzZTlhOThmNzZjMmM3
Y2IzMTkwODZiM2QyNjg1ODI1MDYyMDAyM2IxMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiYTk2
YWU0NDg4OGUwMTg1MjgxZTkzNzYzM2E3NDNlYTkwZDVhMTk2YzYwMDBmODI1NjVlYmIwNTgwMDEy
ZDQwIgogCiBTUkNfVVJJICs9ICIke1BZUElfU1JDX1VSSX0iCiBpbmhlcml0IHBrZ2NvbmZpZyBw
eXBpIHNldHVwdG9vbHMzCi0tIAoyLjQ3LjEKCg==

--===============4433894664153621230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info -> /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.14/site-packages/lxml-6.1.0.dist-info moved to /usr/lib/python3.14/site-packages/lxml-6.1.1.dist-info

--===============4433894664153621230==--

