Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5439CF4213F
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19820.1776261879823134887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=h5fZf2I/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=w+b9q0U5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d91755567-2bc9e256-cc7b-4aa8-abd3-37e90aab7965-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aiR2rZlkd8QMi2u8i5/ufcobUgfnZz4UKpmWX1qGVDQ=;
	b=h5fZf2I/sUk0I39aSsN14N23/bBadqE8+WCs0K0/KWBnJcRptGtQaDWuhW24KHpR
	60Mbt8hrpmafDzo/t5brRC5k614wgm2i/c9h0c37ciKwg0BjIxqu/ySy06WB4/PkJL7
	Eh+jBteq+EVO7cBNXJr8AKP/TM3Yy4CyXTk7z+Hs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aiR2rZlkd8QMi2u8i5/ufcobUgfnZz4UKpmWX1qGVDQ=;
	b=w+b9q0U5qn8k714JFhq9rAR3PdKahB/m5kYmhDkWZdW1r8G1GDSP45JbmOYl64Y4
	FToKBXjZ1vZkmfHhGvaRUrOv0h8tJFr1u24WoMwGKHb9+L6Ld46Za20w+wPEj/Bv6DM
	C4kKlVb1RHK7/a1bW0N/DJOg6YtI1dj8YEEjedGc=
Content-Type: multipart/mixed; boundary="===============9175759421763809370=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 6.0.4 SUCCEEDED
Message-ID: <0101019d91755567-2bc9e256-cc7b-4aa8-abd3-37e90aab7965-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235237

--===============9175759421763809370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-lxml* to *6.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-6.0.2-6.0.4.patch
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
From 5327bb64f19afcd878c3f53c8fc7ff7a6429f402 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:46:05 +0000
Subject: [PATCH] python3-lxml: upgrade 6.0.2 -> 6.0.4

---
 .../python/{python3-lxml_6.0.2.bb => python3-lxml_6.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.0.2.bb => python3-lxml_6.0.4.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb b/meta/recipes-devtools/python/python3-lxml_6.0.4.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.0.2.bb
rename to meta/recipes-devtools/python/python3-lxml_6.0.4.bb
index 876fda93b6..1257534c0f 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.4.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
+SRC_URI[sha256sum] = "4137516be2a90775f99d8ef80ec0283f8d78b5d8bd4630ff20163b72e7e9abf2"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.47.1


--===============9175759421763809370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.14/site-packages/lxml-6.0.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/lxml-6.0.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/lxml-6.0.2.dist-info -> /usr/lib/python3.14/site-packages/lxml-6.0.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.14/site-packages/lxml-6.0.2.dist-info moved to /usr/lib/python3.14/site-packages/lxml-6.0.4.dist-info

--===============9175759421763809370==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-6.0.2-6.0.4.patch"

RnJvbSA1MzI3YmI2NGYxOWFmY2Q4NzhjM2Y1M2M4ZmM3ZmY3YTY0MjlmNDAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6NDY6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWx4bWw6IHVwZ3JhZGUgNi4wLjIgLT4gNi4wLjQKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1seG1sXzYuMC4yLmJiID0+IHB5dGhvbjMtbHhtbF82LjAuNC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1seG1sXzYuMC4yLmJiID0+IHB5dGhv
bjMtbHhtbF82LjAuNC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbHhtbF82LjAuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1seG1sXzYuMC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzYuMC4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF82LjAuNC5i
YgppbmRleCA4NzZmZGE5M2I2Li4xMjU3NTM0YzBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF82LjAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF82LjAuNC5iYgpAQCAtMTgsNyArMTgsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy50eHQ7bWQ1PWU0YzA0NWViYWQ5NThl
YWQ0YjQ4MDA4ZjcwODM4NDAzIFwKIAogREVQRU5EUyArPSAibGlieG1sMiBsaWJ4c2x0IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Q3OWYzMzY3YmQ3NGIzMTdkZGE2NTVkYzhmY2ZhMzA0ZDll
YjZlNGZiMDZiNzE2OGM1Y2YyN2Y5NmUwY2Q2MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MTM3
NTE2YmUyYTkwNzc1Zjk5ZDhlZjgwZWMwMjgzZjhkNzhiNWQ4YmQ0NjMwZmYyMDE2M2I3MmU3ZTlh
YmYyIgogCiBTUkNfVVJJICs9ICIke1BZUElfU1JDX1VSSX0iCiBpbmhlcml0IHBrZ2NvbmZpZyBw
eXBpIHNldHVwdG9vbHMzCi0tIAoyLjQ3LjEKCg==

--===============9175759421763809370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-lxml: PKGV changed from 6.0.2 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-lxml: PV changed from "6.0.2" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.2.tar.gz;downloadfilename=lxml-6.0.2.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.2.tar.gz;downloadfilename=lxml-6.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.4.tar.gz;downloadfilename=lxml-6.0.4.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-6.0.4.tar.gz;downloadfilename=lxml-6.0.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 6.0.2 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "6.0.2" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 21812232 to 21160216 (-3%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 6.0.2 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "6.0.2" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 6.0.2 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "6.0.2" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 6.0.2 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "6.0.2" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: FILELIST: directory renamed /usr/src/debug/python3-lxml/6.0.2/src/lxml/includes -> /usr/src/debug/python3-lxml/6.0.4/src/lxml/includes, directory renamed /usr/src/debug/python3-lxml/6.0.2/src/lxml -> /usr/src/debug/python3-lxml/6.0.4/src/lxml, directory renamed /usr/src/debug/python3-lxml/6.0.2/src/lxml/html -> /usr/src/debug/python3-lxml/6.0.4/src/lxml/html
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 6.0.2 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PV changed from "6.0.2" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 21142569 to 21256082 (+1%)
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 6.0.2 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "6.0.2" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.14/site-packages/lxml-6.0.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/lxml-6.0.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/lxml-6.0.2.dist-info -> /usr/lib/python3.14/site-packages/lxml-6.0.4.dist-info
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGV changed from 6.0.2 [default] to 6.0.4 [default]
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PV changed from "6.0.2" to "6.0.4"
packages/x86-64-v3-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 6007519 to 5779462 (-4%)
Changes to packages/x86-64-v3-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.14/site-packages/lxml-6.0.2.dist-info moved to /usr/lib/python3.14/site-packages/lxml-6.0.4.dist-info

--===============9175759421763809370==--

