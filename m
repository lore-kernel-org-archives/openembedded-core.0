Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0203510FCAFF
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14763.1775054168711693414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zX05nccy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3mG9aNEG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d49792052-53c96643-0aa5-463c-b95e-adbf422138e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AQjwltspfqUVNqQKsMCxfAVVKBOP/CEp8Fr+c5I/zwA=;
	b=zX05nccyeRxVxcrHOj2qqU5CAKpaTfk8yWQWgDW8o/jBOL4K+w/0Duyu7haHSire
	gxA3cb/Bywn1LtgYszkBzhwIpB+if/HFI1+kF/gzXpZnlptZm5xR9269QAC3n6KZHz+
	Bey3vrAM+ShDD2Iw6Uj1qW97K5pOLDN48O/Bx0J4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AQjwltspfqUVNqQKsMCxfAVVKBOP/CEp8Fr+c5I/zwA=;
	b=3mG9aNEGuYyXF+aMuQqWwuhLu57OsEn9dI0nMYZ/7hNErQit/9CUkEa2Jfs8ZmZq
	KiqpHHA9Z/gJwC/RG12kao8sDgTFGd0f/X2V2oomhUEu83vdFtV6n8JtjRO2NjEyPW9
	jjBAmDG/yQhBvpUSzodH7LVl9GJjRYFu7L8/Qv9I=
Content-Type: multipart/mixed; boundary="===============7862906008054965257=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-kirk: upgrading to 4.1.0 SUCCEEDED
Message-ID: <0101019d49792052-53c96643-0aa5-463c-b95e-adbf422138e4-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234403

--===============7862906008054965257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-kirk* to *4.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-kirk-upgrade-4.0.0-4.1.0.patch
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
From 1a78d66721648765dbbe4bd081ef0ae0ff7ae1ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 11:24:38 +0000
Subject: [PATCH] python3-kirk: upgrade 4.0.0 -> 4.1.0

---
 .../{python3-kirk_4.0.0.bb => python3-kirk_4.1.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/python3-kirk/{python3-kirk_4.0.0.bb => python3-kirk_4.1.0.bb} (85%)

diff --git a/meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb b/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
similarity index 85%
rename from meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb
rename to meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
index af53d2edf3..3027d98de0 100644
--- a/meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb
+++ b/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI[sha256sum] = "4606f46dfdb7be1e1c2de8d8f040037459a9de8a07fa1123cee4b68c7f7cb764"
+SRC_URI[sha256sum] = "dc4dc4fa8994b14565a3d4f31bb79d6d27102ecbbd4feaef4ebc1e10e9cbace3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============7862906008054965257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: FILELIST: directory renamed /usr/lib/python3.14/site-packages/kirk-4.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/kirk-4.0.0.dist-info -> /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-kirk (sysroot):
  /usr/lib/python3.14/site-packages/kirk-4.0.0.dist-info moved to /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info

--===============7862906008054965257==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-kirk-upgrade-4.0.0-4.1.0.patch"

RnJvbSAxYTc4ZDY2NzIxNjQ4NzY1ZGJiZTRiZDA4MWVmMGFlMGZmN2FlMWVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMToyNDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMta2lyazogdXBncmFkZSA0LjAuMCAtPiA0LjEuMAoKLS0tCiAuLi4ve3B5dGhvbjMta2ly
a180LjAuMC5iYiA9PiBweXRob24zLWtpcmtfNC4xLjAuYmJ9ICAgICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvcHl0aG9uMy1raXJrL3tweXRob24zLWtpcmtfNC4wLjAuYmIgPT4g
cHl0aG9uMy1raXJrXzQuMS4wLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9weXRob24zLWtpcmsvcHl0aG9uMy1raXJrXzQuMC4wLmJiIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3B5dGhvbjMta2lyay9weXRob24zLWtpcmtfNC4xLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3B5dGhvbjMta2lyay9w
eXRob24zLWtpcmtfNC4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9weXRo
b24zLWtpcmsvcHl0aG9uMy1raXJrXzQuMS4wLmJiCmluZGV4IGFmNTNkMmVkZjMuLjMwMjdkOThk
ZTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9weXRob24zLWtpcmsvcHl0aG9u
My1raXJrXzQuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9weXRob24zLWtpcmsv
cHl0aG9uMy1raXJrXzQuMS4wLmJiCkBAIC03LDcgKzcsNyBAQCBTRUNUSU9OID0gImNvbnNvbGUv
dXRpbHMiCiBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTM5YmJhN2QyY2YwYmExMDM2ZjJhNmUyYmU1MmZlM2YwIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNDYwNmY0NmRmZGI3YmUxZTFjMmRlOGQ4ZjA0MDAzNzQ1OWE5ZGU4
YTA3ZmExMTIzY2VlNGI2OGM3ZjdjYjc2NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkYzRkYzRm
YTg5OTRiMTQ1NjVhM2Q0ZjMxYmI3OWQ2ZDI3MTAyZWNiYmQ0ZmVhZWY0ZWJjMWUxMGU5Y2JhY2Uz
IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjQ3
LjEKCg==

--===============7862906008054965257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-kirk: SRC_URI changed from "https://files.pythonhosted.org/packages/source/k/kirk/kirk-4.0.0.tar.gz;downloadfilename=kirk-4.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/k/kirk/kirk-4.1.0.tar.gz;downloadfilename=kirk-4.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-kirk: PV changed from "4.0.0" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-kirk: PKGV changed from 4.0.0 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-dbg: PV changed from "4.0.0" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-dbg: PKGV changed from 4.0.0 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-dev: PV changed from "4.0.0" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-dev: PKGV changed from 4.0.0 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-doc: PV changed from "4.0.0" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-doc: PKGV changed from 4.0.0 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-locale: PV changed from "4.0.0" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-locale: PKGV changed from 4.0.0 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-src: PV changed from "4.0.0" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-src: PKGV changed from 4.0.0 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-staticdev: PV changed from "4.0.0" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-staticdev: PKGV changed from 4.0.0 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: FILELIST: directory renamed /usr/lib/python3.14/site-packages/kirk-4.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/kirk-4.0.0.dist-info -> /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: PKGSIZE changed from 663005 to 665187 (+0%)
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: PV changed from "4.0.0" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: PKGV changed from 4.0.0 [default] to 4.1.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-kirk (sysroot):
  /usr/lib/python3.14/site-packages/kirk-4.0.0.dist-info moved to /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info

--===============7862906008054965257==--

