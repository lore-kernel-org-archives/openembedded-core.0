Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025F0C71151
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8860.1749993279234242259
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hYDX51vW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kPdGHQ5x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019773baac4d-17308b9a-2127-4b65-83f4-db78b7e91024-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ih2CkqFBGCrWGVUbHE8BXqz5AQZ3qZD40/thxn1j+QE=;
	b=hYDX51vWCW6gj6E5HBTgGkCv5eUWSBPXIJ3XHm1Z0xIsaEC2fNctpJxZZWcc7Dyt
	czwdThstir50yjZkb5p3o0wqJ7LXBJ9F6V9qr1L4JgnXAJvDa6/tzGttKsdnTtHCg9K
	XXWV+LQwQCio3CBoIMkTTi7EStJA9nJL9CGsA0Lo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ih2CkqFBGCrWGVUbHE8BXqz5AQZ3qZD40/thxn1j+QE=;
	b=kPdGHQ5xMJHYxYBehd6T61/PFbP1/owBZRbQdDdgZ8ZXFscLNm75xSetwWjP4Wg8
	yFney9zOYuLH9MZzc5L6lZeHYCk/RTnwgVpDPOgERN60VzboLAaO0ZyfhIQ18eL/XOu
	Ao97uLPQG0UJjNKRqW/b+RIJbC921clY6tsSmQHg=
Content-Type: multipart/mixed; boundary="===============6434155041478547065=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 298 SUCCEEDED
Message-ID: <0101019773baac4d-17308b9a-2127-4b65-83f4-db78b7e91024-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218737

--===============6434155041478547065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *298* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-297-298.patch
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
From df5cc6b40bdd1c2be47748c8b884eac9cfb56447 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 12:54:29 +0000
Subject: [PATCH] diffoscope: upgrade 297 -> 298

---
 .../diffoscope/{diffoscope_297.bb => diffoscope_298.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_297.bb => diffoscope_298.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_297.bb b/meta/recipes-support/diffoscope/diffoscope_298.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_297.bb
rename to meta/recipes-support/diffoscope/diffoscope_298.bb
index 6f6f4ac520..4a50059c99 100644
--- a/meta/recipes-support/diffoscope/diffoscope_297.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_298.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "25532061c640b4be7496f9a726640e20ca0fcb8e46a8a1a46e51ac940a5f4e57"
+SRC_URI[sha256sum] = "9644b7e711df71f13c5f50f3d1353c1e6d09f462d342d9771576e75f3dd8c3e1"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============6434155041478547065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "297" to "298"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 297 [default] to 298 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "297" to "298"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 297 [default] to 298 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "297" to "298"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 297 [default] to 298 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "297" to "298"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 297 [default] to 298 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "297" to "298"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 297 [default] to 298 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "297" to "298"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 297 [default] to 298 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "297" to "298"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1384788 to 1386037 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 297 [default] to 298 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-297.tar.gz;downloadfilename=diffoscope-297.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-298.tar.gz;downloadfilename=diffoscope-298.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "297" to "298"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 297 [default] to 298 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-297.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-298.dist-info

--===============6434155041478547065==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-297-298.patch"

RnJvbSBkZjVjYzZiNDBiZGQxYzJiZTQ3NzQ4YzhiODg0ZWFjOWNmYjU2NDQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTI6NTQ6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI5NyAtPiAyOTgKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjk3LmJiID0+IGRpZmZvc2NvcGVfMjk4LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yOTcuYmIgPT4gZGlmZm9zY29wZV8y
OTguYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI5Ny5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yOTguYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI5Ny5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI5OC5iYgppbmRleCA2ZjZmNGFj
NTIwLi40YTUwMDU5Yzk5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjk3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yOTguYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjU1MzIwNjFjNjQwYjRiZTc0OTZmOWE3MjY2NDBlMjBjYTBmY2I4ZTQ2YThhMWE0NmU1
MWFjOTQwYTVmNGU1NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NjQ0YjdlNzExZGY3MWYxM2M1
ZjUwZjNkMTM1M2MxZTZkMDlmNDYyZDM0MmQ5NzcxNTc2ZTc1ZjNkZDhjM2UxIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============6434155041478547065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-297.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-298.dist-info

--===============6434155041478547065==--

