Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2756.1795845424937149202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=spZIFIen;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QJAd+ghV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a220ba846b-4e3a82ac-cc2a-4750-a141-3e8e41cca64d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795845424;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vlnZC/xIf0zY8tlY/ocaSuE9O693OMG9G621LA21CRo=;
	b=spZIFIennVaGN/eBPE3ZxLIjj0/nHhcVwgjvW53FcPCBUfQOp078EztjWha7N6mK
	QU4y841cNnVz1rBbBwEChZNwrD4eBiHl3zrudZmeG9mS3mULIA6JTZLFFZGeBaVHZyD
	EXK6QMMY6keT2+33qbmx8U+WnsTzmhV3c6A0JCas=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795845424;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vlnZC/xIf0zY8tlY/ocaSuE9O693OMG9G621LA21CRo=;
	b=QJAd+ghVNW6SLMh1xmkcuWtqGvE1ahkx0AL+wlP2jSqvfOUPKlBBu/j3lwPAUgan
	O3xHg4eVqI1G9NTeaG2RNXcrelmbHml3eN24bNld/siWdZ8PLBi2LnwDVwhCrLkKynd
	Ra4fjQKOaUJ4m6kxzAA21k9Xcw7LDkvQ+8kJrIpo=
Content-Type: multipart/mixed; boundary="===============4034202221950819631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 340 SUCCEEDED
Message-ID: <010101a220ba846b-4e3a82ac-cc2a-4750-a141-3e8e41cca64d-000000@us-west-2.amazonses.com>
Date: Sat, 28 Nov 2026 05:57:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.28-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 05:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251479

--===============4034202221950819631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *340* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-339-340.patch
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
From e167b0c99db1326077b1264bddb8dae774f7c0e4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 28 Nov 2026 05:56:57 +0000
Subject: [PATCH] diffoscope: upgrade 339 -> 340

---
 .../diffoscope/{diffoscope_339.bb => diffoscope_340.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_339.bb => diffoscope_340.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_339.bb b/meta/recipes-support/diffoscope/diffoscope_340.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_339.bb
rename to meta/recipes-support/diffoscope/diffoscope_340.bb
index 65c30d29cd..f69eb9687f 100644
--- a/meta/recipes-support/diffoscope/diffoscope_339.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_340.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fb033492c16017963bfa04290c3ffd8e3b7884e1226dfaa6da2b1a07368d8e82"
+SRC_URI[sha256sum] = "970a7858f78a45b1333091984bb2c5a59ef6f661be9cf06c5bea758a69696bcc"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============4034202221950819631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 339 [default] to 340 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "339" to "340"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 339 [default] to 340 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "339" to "340"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 339 [default] to 340 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "339" to "340"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 339 [default] to 340 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "339" to "340"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 339 [default] to 340 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "339" to "340"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 339 [default] to 340 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "339" to "340"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.15/site-packages/diffoscope-339.dist-info/licenses -> /usr/lib/python3.15/site-packages/diffoscope-340.dist-info/licenses, directory renamed /usr/lib/python3.15/site-packages/diffoscope-339.dist-info -> /usr/lib/python3.15/site-packages/diffoscope-340.dist-info
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 339 [default] to 340 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1452338 to 1452372 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "339" to "340"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 339 [default] to 340 [default]
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-339.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-340.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "339" to "340"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.15/site-packages/diffoscope-339.dist-info moved to /usr/lib/python3.15/site-packages/diffoscope-340.dist-info

--===============4034202221950819631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.15/site-packages/diffoscope-339.dist-info -> /usr/lib/python3.15/site-packages/diffoscope-340.dist-info, directory renamed /usr/lib/python3.15/site-packages/diffoscope-339.dist-info/licenses -> /usr/lib/python3.15/site-packages/diffoscope-340.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.15/site-packages/diffoscope-339.dist-info moved to /usr/lib/python3.15/site-packages/diffoscope-340.dist-info

--===============4034202221950819631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-339-340.patch"

RnJvbSBlMTY3YjBjOTlkYjEzMjYwNzdiMTI2NGJkZGI4ZGFlNzc0ZjdjMGU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjggTm92IDIwMjYgMDU6NTY6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMzOSAtPiAzNDAKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzM5LmJiID0+IGRpZmZvc2NvcGVfMzQwLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMzkuYmIgPT4gZGlmZm9zY29wZV8z
NDAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMzOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zNDAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzOS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzM0MC5iYgppbmRleCA2NWMzMGQy
OWNkLi5mNjllYjk2ODdmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzM5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zNDAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmIwMzM0
OTJjMTYwMTc5NjNiZmEwNDI5MGMzZmZkOGUzYjc4ODRlMTIyNmRmYWE2ZGEyYjFhMDczNjhkOGU4
MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NzBhNzg1OGY3OGE0NWIxMzMzMDkxOTg0YmIyYzVh
NTllZjZmNjYxYmU5Y2YwNmM1YmVhNzU4YTY5Njk2YmNjIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============4034202221950819631==--
