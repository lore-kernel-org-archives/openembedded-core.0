Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D92CC46CA3
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.22320.1701436491469986027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HgJ+JWo8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JZgk2oyz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018c25848c46-7689a7c6-156e-41b5-b30d-43daebc99b65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436493;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ye5Qapikq4jlIX0a7vZzQ9YdWVbPGWXmrF5wx6OSjyQ=;
	b=HgJ+JWo8IrSbZ/LENo/oBTSbxzVgIzBZIFqhIa3kSU6NnVTzCTNNoUCCWxKPZjRm
	WldggRdgTwqlZL2r6iO++NOWDf6tvg2aW3Vn3GPbJRAODGXeB39eTS6DjMW99JVl0EI
	AXYPHWVcMPIjNTJOK1oiFHe+eeVD5Upa05NZeWUc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436493;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ye5Qapikq4jlIX0a7vZzQ9YdWVbPGWXmrF5wx6OSjyQ=;
	b=JZgk2oyz3Y9rgjtL51F/j0uf2MtxdYi5M8T3vGqvBSScqE9I8cK9kXPAsBfOukbE
	Cbcjy68OG+nNOw7LPUsSsa2gxzwXgnampxCTQDBBO2WeFZCZuGsQ0dvMdz0Paf74b0n
	fXy0tiN/2YKzu3NzpV4c9zAEriqyXCxnycvkun0w=
Content-Type: multipart/mixed; boundary="===============1517788743105028335=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 1.23.2 SUCCEEDED
Message-ID: <0101018c25848c46-7689a7c6-156e-41b5-b30d-43daebc99b65-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191659

--===============1517788743105028335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gpgme* to *1.23.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-1.23.1-1.23.2.patch
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
From f6ff3007e45074fbf42de7e99ce3e926fe7ae3c9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 12:46:44 +0000
Subject: [PATCH] gpgme: upgrade 1.23.1 -> 1.23.2

---
 meta/recipes-support/gpgme/{gpgme_1.23.1.bb => gpgme_1.23.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_1.23.1.bb => gpgme_1.23.2.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme_1.23.1.bb b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.23.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.23.2.bb
index e029b73a8f..0d53400bd4 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "a0c316f7ab7d3bfb01a8753c3370dc906e5b61436021f3b54ff1483b513769bd"
+SRC_URI[sha256sum] = "9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
-- 
2.39.2


--===============1517788743105028335==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-1.23.1-1.23.2.patch"

RnJvbSBmNmZmMzAwN2U0NTA3NGZiZjQyZGU3ZTk5Y2UzZTkyNmZlN2FlM2M5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAxMjo0Njo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdw
Z21lOiB1cGdyYWRlIDEuMjMuMSAtPiAxLjIzLjIKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z3BnbWUve2dwZ21lXzEuMjMuMS5iYiA9PiBncGdtZV8xLjIzLjIuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ3BnbWUve2dwZ21lXzEuMjMuMS5iYiA9PiBncGdtZV8xLjIzLjIuYmJ9ICg5
NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMS4yMy4x
LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMS4yMy4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21l
XzEuMjMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMS4y
My4yLmJiCmluZGV4IGUwMjliNzNhOGYuLjBkNTM0MDBiZDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzEuMjMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9ncGdtZS9ncGdtZV8xLjIzLjIuYmIKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VSSSA9ICIk
e0dOVVBHX01JUlJPUn0vZ3BnbWUvJHtCUH0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaCBcCiAgICAgICAg
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwYzMxNmY3YWI3ZDNiZmIwMWE4NzUzYzMz
NzBkYzkwNmU1YjYxNDM2MDIxZjNiNTRmZjE0ODNiNTEzNzY5YmQiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOTQ5OWU4YjFmMzNjY2NiNjgxNTUyN2ExYmMxNjA0OWQzNWE2MTk4YTZjNWZhZTAxODVm
MmJkNTYxYmNlNTIyNCIKIAogUFlUSE9OX0RFUFMgPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0xB
TkdVQUdFUycsICdweXRob24nLCAnc3dpZy1uYXRpdmUnLCAnJywgZCl9IgogCi0tIAoyLjM5LjIK
Cg==

--===============1517788743105028335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgmepp.so.6.20.0", added "/usr/lib/libgpgmepp.so.6.20.1"
packages/core2-64-poky-linux/gpgme/gpgme-cpp: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-cpp: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgmepp.so.6.20.0 /usr/lib/.debug/libgpgme.so.11.32.0", added "/usr/lib/.debug/libgpgme.so.11.32.1 /usr/lib/.debug/libgpgmepp.so.6.20.1"
packages/core2-64-poky-linux/gpgme/gpgme-dbg: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 10228328 to 10229888 (+0%)
packages/core2-64-poky-linux/gpgme/gpgme-dbg: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-dev: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-dev: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-doc: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 474142 to 474094 (-0%)
packages/core2-64-poky-linux/gpgme/gpgme-doc: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-locale: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-locale: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-src: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 3616747 to 3617911 (+0%)
packages/core2-64-poky-linux/gpgme/gpgme-src: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme-staticdev: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.32.0", added "/usr/lib/libgpgme.so.11.32.1"
packages/core2-64-poky-linux/gpgme/gpgme: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/gpgme: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.23.1.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-python-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0006-fix-build-path-issue.patch file://0008-do-not-auto-check-var-PYTHON.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.23.2.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-pyt
 hon-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0006-fix-build-path-issue.patch file://0008-do-not-auto-check-var-PYTHON.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch"
packages/core2-64-poky-linux/gpgme: PV changed from "1.23.1" to "1.23.2"
packages/core2-64-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info", added "/usr/lib/python3.11/site-packages/gpg-1.23.2-py3.11.egg-info"
packages/core2-64-poky-linux/gpgme/python3-gpg: PKGV changed from 1.23.1 [default] to 1.23.2 [default]
packages/core2-64-poky-linux/gpgme/python3-gpg: PV changed from "1.23.1" to "1.23.2"
Changes to packages/core2-64-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.20.0 to libgpgmepp.so.6.20.1
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.20.0 to libgpgmepp.so.6.20.1
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.32.0 to libgpgme.so.11.32.1
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.32.0 to libgpgme.so.11.32.1
  /usr/lib/libgpgmepp.so.6.20.0 moved to /usr/lib/libgpgmepp.so.6.20.1
  /usr/lib/libgpgme.so.11.32.0 moved to /usr/lib/libgpgme.so.11.32.1
  /usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/gpg-1.23.2-py3.11.egg-info

--===============1517788743105028335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgmepp.so.6.20.0", added "/usr/lib/libgpgmepp.so.6.20.1"
packages/core2-64-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.32.0", added "/usr/lib/libgpgme.so.11.32.1"
packages/core2-64-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info", added "/usr/lib/python3.11/site-packages/gpg-1.23.2-py3.11.egg-info"
Changes to packages/core2-64-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.20.0 to libgpgmepp.so.6.20.1
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.20.0 to libgpgmepp.so.6.20.1
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.32.0 to libgpgme.so.11.32.1
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.32.0 to libgpgme.so.11.32.1
  /usr/lib/libgpgmepp.so.6.20.0 moved to /usr/lib/libgpgmepp.so.6.20.1
  /usr/lib/libgpgme.so.11.32.0 moved to /usr/lib/libgpgme.so.11.32.1
  /usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/gpg-1.23.2-py3.11.egg-info

--===============1517788743105028335==--

