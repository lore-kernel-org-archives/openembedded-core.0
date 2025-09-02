Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D4BCAC594
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:43 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.89789.1756850183449696454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RTNwvIbe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YPhuAhef;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101990c6e8d35-5d72c315-f214-4676-90dc-b3ec275197c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850195;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ooMYvLrljhvoK3rXaQZy8zHP1r5EEf2gUK9xmahtGV0=;
	b=RTNwvIbeyGBo7UZ6wfby9MikbIXg32UaX2t8spXZNgIOO6qeaRMHN7euNutryRtf
	kxbHsTJXAigiL/prVU/hnzEFUUM40aDt2uFuRev+uXYZNgYUqqcxgh1+5v4+GChUlgO
	NmgFpW71mF8vdDFeurjZ0OJztojpdGg4GKnRR0rA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850195;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ooMYvLrljhvoK3rXaQZy8zHP1r5EEf2gUK9xmahtGV0=;
	b=YPhuAhefAPQXMo0rYAR2jgq3BA7xEwImBC9oVWPqIF/3Wy41M8QcpsriQa+1dhW6
	wriexueh+ewWiogzFUOs8UV++ScLU/wTznkO4BhePq5bdwLPx31J82qWxbz4IBPcmIC
	t1nofn1KqMax9k3146jwzDN+ZfM8DQiZsT/lzm5M=
Content-Type: multipart/mixed; boundary="===============3945425042456130940=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnss-nis: upgrading to 3.4 SUCCEEDED
Message-ID: <010101990c6e8d35-5d72c315-f214-4676-90dc-b3ec275197c2-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222797

--===============3945425042456130940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnss-nis* to *3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnss-nis-upgrade-3.2-3.4.patch
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
From 237aa3f082c12ce657804f7614f244e4e95ee648 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 19:16:01 +0000
Subject: [PATCH] libnss-nis: upgrade 3.2 -> 3.4

---
 meta/recipes-extended/libnss-nis/libnss-nis.bb             | 4 ++--
 ...e-ake-_nss_nis_getsecretkey-export-conditional-on.patch | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index a7f6545be0..7b6dc19556 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.2"
+PV = "3.4"
 
-SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
+SRCREV = "3c206b762ac8557dab3c40ff3a297c9d1bff0d83"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
            file://0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch \
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch b/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch
index b9996d3292..76dc9bc173 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch
+++ b/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch
@@ -1,7 +1,8 @@
-From ecc9767fd8c3a1ecbfca5df18714df34995a38a3 Mon Sep 17 00:00:00 2001
+From 355596685507adce31ecacd5bef67983706fe540 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 26 Aug 2025 22:45:54 -0700
-Subject: [PATCH] make: Make _nss_nis_getsecretkey export conditional on xdecrypt()
+Subject: [PATCH] make: Make _nss_nis_getsecretkey export conditional on
+ xdecrypt()
 
 The function _nss_nis_getsecretkey in nis-publickey.c is only
 compiled when xdecrypt() is available. This is controlled by the
@@ -43,7 +44,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  rename src/{libnss_nis.map => libnss_nis.map.in} (100%)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index e1a9bb2..cc32ea9 100644
+index ac68d1e..82719ad 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -22,8 +22,24 @@ nss_loader_test_LDADD = -ldl
-- 
2.47.1


--===============3945425042456130940==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnss-nis-upgrade-3.2-3.4.patch"

RnJvbSAyMzdhYTNmMDgyYzEyY2U2NTc4MDRmNzYxNGYyNDRlNGU5NWVlNjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxOToxNjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5zcy1uaXM6IHVwZ3JhZGUgMy4yIC0+IDMuNAoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGlibnNzLW5pcy9saWJuc3MtbmlzLmJiICAgICAgICAgICAgIHwgNCArKy0tCiAuLi5lLWFrZS1f
bnNzX25pc19nZXRzZWNyZXRrZXktZXhwb3J0LWNvbmRpdGlvbmFsLW9uLnBhdGNoIHwgNyArKysr
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlibnNzLW5pcy9saWJuc3MtbmlzLmJi
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYm5zcy1uaXMvbGlibnNzLW5pcy5iYgppbmRleCBh
N2Y2NTQ1YmUwLi43YjZkYzE5NTU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGlibnNzLW5pcy9saWJuc3MtbmlzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJu
c3MtbmlzL2xpYm5zcy1uaXMuYmIKQEAgLTEzLDkgKzEzLDkgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiBT
RUNUSU9OID0gImxpYnMiCiBERVBFTkRTICs9ICJsaWJ0aXJwYyBsaWJuc2wyIgogCi1QViA9ICIz
LjIiCitQViA9ICIzLjQiCiAKLVNSQ1JFViA9ICJjZDBkMzkxYWY5NTM1YjU2ZTYxMmVkMjI3YzFi
ODliZTI2OWYzZDU5IgorU1JDUkVWID0gIjNjMjA2Yjc2MmFjODU1N2RhYjNjNDBmZjNhMjk3Yzlk
MWJmZjBkODMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS90aGt1a3VrL2xpYm5zc19u
aXM7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LW1ha2UtYWtlLV9uc3NfbmlzX2dldHNlY3JldGtleS1leHBvcnQtY29uZGl0aW9uYWwtb24ucGF0
Y2ggXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYm5zcy1uaXMvbGlibnNz
LW5pcy8wMDAxLW1ha2UtYWtlLV9uc3NfbmlzX2dldHNlY3JldGtleS1leHBvcnQtY29uZGl0aW9u
YWwtb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlibnNzLW5pcy9saWJuc3Mtbmlz
LzAwMDEtbWFrZS1ha2UtX25zc19uaXNfZ2V0c2VjcmV0a2V5LWV4cG9ydC1jb25kaXRpb25hbC1v
bi5wYXRjaAppbmRleCBiOTk5NmQzMjkyLi43NmRjOWJjMTczIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlibnNzLW5pcy9saWJuc3MtbmlzLzAwMDEtbWFrZS1ha2UtX25zc19u
aXNfZ2V0c2VjcmV0a2V5LWV4cG9ydC1jb25kaXRpb25hbC1vbi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlibnNzLW5pcy9saWJuc3MtbmlzLzAwMDEtbWFrZS1ha2UtX25zc19u
aXNfZ2V0c2VjcmV0a2V5LWV4cG9ydC1jb25kaXRpb25hbC1vbi5wYXRjaApAQCAtMSw3ICsxLDgg
QEAKLUZyb20gZWNjOTc2N2ZkOGMzYTFlY2JmY2E1ZGYxODcxNGRmMzQ5OTVhMzhhMyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzU1NTk2Njg1NTA3YWRjZTMxZWNhY2Q1YmVmNjc5ODM3
MDZmZTU0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI2IEF1ZyAyMDI1IDIyOjQ1OjU0IC0wNzAwCi1TdWJq
ZWN0OiBbUEFUQ0hdIG1ha2U6IE1ha2UgX25zc19uaXNfZ2V0c2VjcmV0a2V5IGV4cG9ydCBjb25k
aXRpb25hbCBvbiB4ZGVjcnlwdCgpCitTdWJqZWN0OiBbUEFUQ0hdIG1ha2U6IE1ha2UgX25zc19u
aXNfZ2V0c2VjcmV0a2V5IGV4cG9ydCBjb25kaXRpb25hbCBvbgorIHhkZWNyeXB0KCkKIAogVGhl
IGZ1bmN0aW9uIF9uc3NfbmlzX2dldHNlY3JldGtleSBpbiBuaXMtcHVibGlja2V5LmMgaXMgb25s
eQogY29tcGlsZWQgd2hlbiB4ZGVjcnlwdCgpIGlzIGF2YWlsYWJsZS4gVGhpcyBpcyBjb250cm9s
bGVkIGJ5IHRoZQpAQCAtNDMsNyArNDQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogIHJlbmFtZSBzcmMve2xpYm5zc19uaXMubWFwID0+IGxpYm5zc19u
aXMubWFwLmlufSAoMTAwJSkKIAogZGlmZiAtLWdpdCBhL3NyYy9NYWtlZmlsZS5hbSBiL3NyYy9N
YWtlZmlsZS5hbQotaW5kZXggZTFhOWJiMi4uY2MzMmVhOSAxMDA2NDQKK2luZGV4IGFjNjhkMWUu
LjgyNzE5YWQgMTAwNjQ0CiAtLS0gYS9zcmMvTWFrZWZpbGUuYW0KICsrKyBiL3NyYy9NYWtlZmls
ZS5hbQogQEAgLTIyLDggKzIyLDI0IEBAIG5zc19sb2FkZXJfdGVzdF9MREFERCA9IC1sZGwKLS0g
CjIuNDcuMQoK

--===============3945425042456130940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libnss-nis: PKGV changed from 3.2 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/libnss-nis: PV changed from "3.2" to "3.4"
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-dbg: PKGSIZE changed from 181664 to 176040 (-3%)
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-dbg: PKGV changed from 3.2 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-dbg: PV changed from "3.2" to "3.4"
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-dev: PKGV changed from 3.2 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-dev: PV changed from "3.2" to "3.4"
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-doc: PKGV changed from 3.2 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-doc: PV changed from "3.2" to "3.4"
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-locale: PKGV changed from 3.2 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-locale: PV changed from "3.2" to "3.4"
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-src: PKGV changed from 3.2 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-src: PV changed from "3.2" to "3.4"
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-staticdev: PKGV changed from 3.2 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis-staticdev: PV changed from "3.2" to "3.4"
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis: PKGV changed from 3.2 [default] to 3.4 [default]
packages/x86-64-v3-poky-linux/libnss-nis/libnss-nis: PV changed from "3.2" to "3.4"

--===============3945425042456130940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1941 targets, 53 skipped, 0 masked, 0 errors.
Removing 7 recipes from the qemux86_64 sysroot...done.
Removing 8 recipes from the x86-64-v3 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'libnss-nis'
libnss-nis was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============3945425042456130940==--

