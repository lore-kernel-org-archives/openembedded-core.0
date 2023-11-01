Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D783C04A92
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8485.1698848704000323679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J2J0Ns5L;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nlzl777v;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460ee5-1372b3f0-3427-439b-a9cd-21bd949fbd44-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jt+5g8oTHVS9q2cloXf18o67dy4yVcVCXCuzT6P/cUM=;
	b=J2J0Ns5LaAQJTVyK8JLftOeAPsAiZW7Jx2Rs9zBcMcaNzf3vA7MgZolmfMnb2WP7
	lVODXGsyJZqW4O/9upU1M4lLh5dGWgP3n4XA7EMwVbhbIbGo5prIyaqYWzL293OF+Kk
	eefdCrPt9j/uegZJkjWCValZpPY6/UeKf7dUCiGQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jt+5g8oTHVS9q2cloXf18o67dy4yVcVCXCuzT6P/cUM=;
	b=nlzl777v2hmU1HM7azP2jgR/yNEwJBRt6fi3lBdkYx1STk+CAAIAzdFgLIiS6vC1
	OIvHExojydsGG2aECdQK+hn7GhFZvGnlIeChDDKvlBz8e6YQs6aL48CJsywbtBjEUj3
	+T2CZaDg2hUpL+oc6sZI5GHRwlb5vqO0h5BcNktI=
Content-Type: multipart/mixed; boundary="===============4234343558688625851=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 1.23.1 SUCCEEDED
Message-ID: <0101018b8b460ee5-1372b3f0-3427-439b-a9cd-21bd949fbd44-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190035

--===============4234343558688625851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gpgme* to *1.23.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-1.22.0-1.23.1.patch
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
From ed1ff8f7463141b85291bbca0bc9dc67ee94ad82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 14:08:57 +0000
Subject: [PATCH] gpgme: upgrade 1.22.0 -> 1.23.1

---
 meta/recipes-support/gpgme/{gpgme_1.22.0.bb => gpgme_1.23.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_1.22.0.bb => gpgme_1.23.1.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme_1.22.0.bb b/meta/recipes-support/gpgme/gpgme_1.23.1.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.22.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.23.1.bb
index 84c8fa9f8a..e029b73a8f 100644
--- a/meta/recipes-support/gpgme/gpgme_1.22.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.1.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "9551e37081ad3bde81018a0d24f245c3f8206990549598fb31a97a68380a7b71"
+SRC_URI[sha256sum] = "a0c316f7ab7d3bfb01a8753c3370dc906e5b61436021f3b54ff1483b513769bd"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
-- 
2.39.2


--===============4234343558688625851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgmepp.so.6.19.0", added "/usr/lib/libgpgmepp.so.6.20.0"
packages/core2-64-poky-linux/gpgme/gpgme-cpp: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme/gpgme-cpp: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 10205464 to 10228744 (+0%)
packages/core2-64-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgme.so.11.31.0 /usr/lib/.debug/libgpgmepp.so.6.19.0", added "/usr/lib/.debug/libgpgme.so.11.32.0 /usr/lib/.debug/libgpgmepp.so.6.20.0"
packages/core2-64-poky-linux/gpgme/gpgme-dbg: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme/gpgme-dbg: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/gpgme/gpgme-dev: PKGSIZE changed from 262285 to 263792 (+1%)
packages/core2-64-poky-linux/gpgme/gpgme-dev: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme/gpgme-dev: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 472572 to 474142 (+0%)
packages/core2-64-poky-linux/gpgme/gpgme-doc: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme/gpgme-doc: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/gpgme/gpgme-locale: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme/gpgme-locale: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 3599636 to 3616747 (+0%)
packages/core2-64-poky-linux/gpgme/gpgme-src: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme/gpgme-src: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme/gpgme-staticdev: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.31.0", added "/usr/lib/libgpgme.so.11.32.0"
packages/core2-64-poky-linux/gpgme/gpgme: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme/gpgme: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.22.0.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-python-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0006-fix-build-path-issue.patch file://0008-do-not-auto-check-var-PYTHON.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.23.1.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-pyt
 hon-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0006-fix-build-path-issue.patch file://0008-do-not-auto-check-var-PYTHON.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch"
packages/core2-64-poky-linux/gpgme: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme: PV changed from "1.22.0" to "1.23.1"
packages/core2-64-poky-linux/gpgme/python3-gpg: PKGSIZE changed from 1429448 to 1431222 (+0%)
packages/core2-64-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/python3.11/site-packages/gpg-1.22.0-py3.11.egg-info", added "/usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info"
packages/core2-64-poky-linux/gpgme/python3-gpg: PKGV changed from 1.22.0 [default] to 1.23.1 [default]
packages/core2-64-poky-linux/gpgme/python3-gpg: PV changed from "1.22.0" to "1.23.1"
Changes to packages/core2-64-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.19.0 to libgpgmepp.so.6.20.0
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.19.0 to libgpgmepp.so.6.20.0
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.31.0 to libgpgme.so.11.32.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.31.0 to libgpgme.so.11.32.0
  /usr/lib/libgpgmepp.so.6.19.0 moved to /usr/lib/libgpgmepp.so.6.20.0
  /usr/lib/libgpgme.so.11.31.0 moved to /usr/lib/libgpgme.so.11.32.0
  /usr/lib/python3.11/site-packages/gpg-1.22.0-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info

--===============4234343558688625851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgmepp.so.6.19.0", added "/usr/lib/libgpgmepp.so.6.20.0"
packages/core2-64-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.31.0", added "/usr/lib/libgpgme.so.11.32.0"
packages/core2-64-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/python3.11/site-packages/gpg-1.22.0-py3.11.egg-info", added "/usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info"
Changes to packages/core2-64-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.19.0 to libgpgmepp.so.6.20.0
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.19.0 to libgpgmepp.so.6.20.0
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.31.0 to libgpgme.so.11.32.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.31.0 to libgpgme.so.11.32.0
  /usr/lib/libgpgmepp.so.6.19.0 moved to /usr/lib/libgpgmepp.so.6.20.0
  /usr/lib/libgpgme.so.11.31.0 moved to /usr/lib/libgpgme.so.11.32.0
  /usr/lib/python3.11/site-packages/gpg-1.22.0-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/gpg-1.23.1-py3.11.egg-info

--===============4234343558688625851==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-1.22.0-1.23.1.patch"

RnJvbSBlZDFmZjhmNzQ2MzE0MWI4NTI5MWJiY2EwYmM5ZGM2N2VlOTRhZDgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxNDowODo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdw
Z21lOiB1cGdyYWRlIDEuMjIuMCAtPiAxLjIzLjEKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z3BnbWUve2dwZ21lXzEuMjIuMC5iYiA9PiBncGdtZV8xLjIzLjEuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ3BnbWUve2dwZ21lXzEuMjIuMC5iYiA9PiBncGdtZV8xLjIzLjEuYmJ9ICg5
NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMS4yMi4w
LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMS4yMy4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21l
XzEuMjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMS4y
My4xLmJiCmluZGV4IDg0YzhmYTlmOGEuLmUwMjliNzNhOGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzEuMjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9ncGdtZS9ncGdtZV8xLjIzLjEuYmIKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VSSSA9ICIk
e0dOVVBHX01JUlJPUn0vZ3BnbWUvJHtCUH0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaCBcCiAgICAgICAg
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk1NTFlMzcwODFhZDNiZGU4MTAxOGEwZDI0
ZjI0NWMzZjgyMDY5OTA1NDk1OThmYjMxYTk3YTY4MzgwYTdiNzEiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYTBjMzE2ZjdhYjdkM2JmYjAxYTg3NTNjMzM3MGRjOTA2ZTViNjE0MzYwMjFmM2I1NGZm
MTQ4M2I1MTM3NjliZCIKIAogUFlUSE9OX0RFUFMgPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0xB
TkdVQUdFUycsICdweXRob24nLCAnc3dpZy1uYXRpdmUnLCAnJywgZCl9IgogCi0tIAoyLjM5LjIK
Cg==

--===============4234343558688625851==--

