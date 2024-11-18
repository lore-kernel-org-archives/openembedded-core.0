Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467A3D60CF0
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4679.1731964633083259581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gBrT77fh;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GjVXOexM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934123e4d5-371647cc-65c6-44fb-a130-1c122cae0271-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964691;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GSJRlVZaTqp3eW6m+u21F3CqF3J8eIG3YEO3aKhEaNU=;
	b=gBrT77fh8qdHMtTd6VOLPQTl5SfGi6YWnhzF4uSiiBgS+63dUZALd+QpiszMQW9B
	7tno7PMYI46bIXQFG453i88t+CY/QLI7nCJJlj4VpFYsCoQnK0zAAGTEEuc1F75vEjo
	4bu3ba2RpnC2lkDP4mmqr95C7odRx8ywrkZrkvOI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964691;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GSJRlVZaTqp3eW6m+u21F3CqF3J8eIG3YEO3aKhEaNU=;
	b=GjVXOexMG02Ur+JvOudGNkkjTk1Ch6kVcbSxXR+w0Y9jY/9ZkCBFyZ9i7MvHZsKU
	jTEKNXxAkXtL5KaKaBdxPRCdjQM0UGflaQVPSr+PzjxY/YcyJoWf78fSs2/n7IGI9Ml
	4N6Fmu8gtX7H6vMvU09yp+V4Co2cNTQTK16HHjds=
Content-Type: multipart/mixed; boundary="===============7360494409209410590=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.51 SUCCEEDED
Message-ID: <010101934123e4d5-371647cc-65c6-44fb-a130-1c122cae0271-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207365

--===============7360494409209410590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgpg-error* to *1.51* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgpg-error-upgrade-1.50-1.51.patch
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
From 438ced3dcaa53cb691ca67596626239e8013a503 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 16:09:12 +0000
Subject: [PATCH] libgpg-error: upgrade 1.50 -> 1.51

---
 .../0001-Do-not-fail-when-testing-config-scripts.patch     | 2 +-
 .../libgpg-error/libgpg-error/pkgconfig.patch              | 7 ++-----
 .../{libgpg-error_1.50.bb => libgpg-error_1.51.bb}         | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.50.bb => libgpg-error_1.51.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index d72838bb05..0910d6cc63 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From 75622f8b21459eb556b36edc3537fdaded7f04bf Mon Sep 17 00:00:00 2001
+From 581919f3af914c6b62e51b345d5d15e709f20e77 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 794a3993e7..dbf728b2de 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,7 +1,7 @@
-From ba5ec5615d76dfa4afb429a4e11f3e7e3bc9de76 Mon Sep 17 00:00:00 2001
+From 3529df77cd20253ce2a9c1962d7a72058a04fd98 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 21 Aug 2024 20:03:29 -0700
-Subject: [PATCH 1/2] support pkgconfig
+Subject: [PATCH] support pkgconfig
 
 Upstream-Status: Inappropriate [gnupg upstream will not take this, it has been tried with other components]
 
@@ -241,6 +241,3 @@ index 2d24071..c561725 100644
 -  AC_SUBST(GPG_ERROR_MT_LIBS)
  ])
 +
--- 
-2.25.1
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.50.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
index 02cdf7707d..741969beb0 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "69405349e0a633e444a28c5b35ce8f14484684518a508dc48a089992fe93e20a"
+SRC_URI[sha256sum] = "be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e724545427e6b2"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.44.1


--===============7360494409209410590==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgpg-error-upgrade-1.50-1.51.patch"

RnJvbSA0MzhjZWQzZGNhYTUzY2I2OTFjYTY3NTk2NjI2MjM5ZTgwMTNhNTAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMTY6MDk6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJncGctZXJyb3I6IHVwZ3JhZGUgMS41MCAtPiAxLjUxCgotLS0KIC4uLi8wMDAxLURvLW5vdC1m
YWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaCAgICAgfCAyICstCiAuLi4vbGli
Z3BnLWVycm9yL2xpYmdwZy1lcnJvci9wa2djb25maWcucGF0Y2ggICAgICAgICAgICAgIHwgNyAr
Ky0tLS0tCiAuLi4ve2xpYmdwZy1lcnJvcl8xLjUwLmJiID0+IGxpYmdwZy1lcnJvcl8xLjUxLmJi
fSAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL3tsaWJn
cGctZXJyb3JfMS41MC5iYiA9PiBsaWJncGctZXJyb3JfMS41MS5iYn0gKDk1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yLzAwMDEt
RG8tbm90LWZhaWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci8wMDAxLURvLW5vdC1mYWlsLXdo
ZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaAppbmRleCBkNzI4MzhiYjA1Li4wOTEwZDZj
YzYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3Bn
LWVycm9yLzAwMDEtRG8tbm90LWZhaWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvMDAw
MS1Eby1ub3QtZmFpbC13aGVuLXRlc3RpbmctY29uZmlnLXNjcmlwdHMucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDc1NjIyZjhiMjE0NTllYjU1NmIzNmVkYzM1MzdmZGFkZWQ3ZjA0YmYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU4MTkxOWYzYWY5MTRjNmI2MmU1MWIzNDVkNWQx
NWU3MDlmMjBlNzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMjggRmViIDIwMjAgMDk6
MTk6NTYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGZhaWwgd2hlbiB0ZXN0aW5nIGNv
bmZpZyBzY3JpcHRzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJy
b3IvbGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoCmluZGV4IDc5NGEzOTkzZTcu
LmRiZjcyOGIyZGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJv
ci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoCkBAIC0xLDcgKzEsNyBA
QAotRnJvbSBiYTVlYzU2MTVkNzZkZmE0YWZiNDI5YTRlMTFmM2U3ZTNiYzlkZTc2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNTI5ZGY3N2NkMjAyNTNjZTJhOWMxOTYyZDdhNzIwNThh
MDRmZDk4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyMSBBdWcgMjAyNCAyMDowMzoyOSAtMDcw
MAotU3ViamVjdDogW1BBVENIIDEvMl0gc3VwcG9ydCBwa2djb25maWcKK1N1YmplY3Q6IFtQQVRD
SF0gc3VwcG9ydCBwa2djb25maWcKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtn
bnVwZyB1cHN0cmVhbSB3aWxsIG5vdCB0YWtlIHRoaXMsIGl0IGhhcyBiZWVuIHRyaWVkIHdpdGgg
b3RoZXIgY29tcG9uZW50c10KIApAQCAtMjQxLDYgKzI0MSwzIEBAIGluZGV4IDJkMjQwNzEuLmM1
NjE3MjUgMTAwNjQ0CiAtICBBQ19TVUJTVChHUEdfRVJST1JfTVRfTElCUykKICBdKQogKwotLS0g
Ci0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9y
L2xpYmdwZy1lcnJvcl8xLjUwLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9y
L2xpYmdwZy1lcnJvcl8xLjUxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS41MC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8xLjUx
LmJiCmluZGV4IDAyY2RmNzcwN2QuLjc0MTk2OWJlYjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS41MC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yXzEuNTEuYmIKQEAgLTIwLDcg
KzIwLDcgQEAgU1JDX1VSSSA9ICIke0dOVVBHX01JUlJPUn0vbGliZ3BnLWVycm9yL2xpYmdwZy1l
cnJvci0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY5NDA1MzQ5ZTBhNjMzZTQ0NGEyOGM1
YjM1Y2U4ZjE0NDg0Njg0NTE4YTUwOGRjNDhhMDg5OTkyZmU5M2UyMGEiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYmUwZjFiMmRiNmI5M2VlZDU1MzY5Y2RmNzlmMTlmNzI3NTBjOGM3YzM5ZmMyMGI1
NzdlNzI0NTQ1NDI3ZTZiMiIKIAogQklOQ09ORklHID0gIiR7YmluZGlyfS9ncGctZXJyb3ItY29u
ZmlnIgogCi0tIAoyLjQ0LjEKCg==

--===============7360494409209410590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libgpg-error/libgpg-error-ptest: FILELIST: added "/usr/lib/libgpg-error/ptest/t-spawn"
packages/core2-64-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.37.0", added "/usr/lib/libgpg-error.so.0.38.0"
Changes to packages/core2-64-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.37.0 to libgpg-error.so.0.38.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.37.0 to libgpg-error.so.0.38.0
  /usr/lib/libgpg-error.so.0.37.0 moved to /usr/lib/libgpg-error.so.0.38.0
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.37.0 to libgpg-error.so.0.38.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.37.0 to libgpg-error.so.0.38.0
  /usr/lib/libgpg-error.so.0.37.0 moved to /usr/lib/libgpg-error.so.0.38.0

--===============7360494409209410590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9422342 to 9620507 (+2%)
packages/core2-64-poky-linux/libgpg-error: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.50.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.51.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest"
packages/core2-64-poky-linux/libgpg-error: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dbg: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dbg: FILELIST: removed "/usr/lib/.debug/libgpg-error.so.0.37.0", added "/usr/lib/libgpg-error/ptest/.debug/t-spawn /usr/lib/.debug/libgpg-error.so.0.38.0"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dbg: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dbg: PKGSIZE changed from 1091120 to 1129552 (+4%)
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dev: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dev: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dev: PKGSIZE changed from 210800 to 211296 (+0%)
packages/core2-64-poky-linux/libgpg-error/libgpg-error-doc: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-doc: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-cs: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-cs: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-da: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-da: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-de: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-de: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-eo: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-eo: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-es: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-es: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-fr: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-fr: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-hu: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-hu: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-it: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-it: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ja: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ja: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-nl: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-nl: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-pl: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-pl: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-pt: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-pt: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ro: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ro: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ru: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ru: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-sr: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-sr: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-sv: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-tr: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-tr: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-uk: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-uk: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-vi: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-vi: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-ptest: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-ptest: FILELIST: added "/usr/lib/libgpg-error/ptest/t-spawn"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-ptest: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-ptest: PKGSIZE changed from 234399 to 249357 (+6%)
packages/core2-64-poky-linux/libgpg-error/libgpg-error-src: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-src: FILELIST: directory renamed /usr/src/debug/libgpg-error/1.50/src -> /usr/src/debug/libgpg-error/1.51/src, directory renamed /usr/src/debug/libgpg-error/1.50/doc -> /usr/src/debug/libgpg-error/1.51/doc, removed "/usr/src/debug/libgpg-error/1.50/tests/t-lock.c /usr/src/debug/libgpg-error/1.50/tests/t-poll.c /usr/src/debug/libgpg-error/1.50/tests/t-malloc.c /usr/src/debug/libgpg-error/1.50/tests/t-argparse.c /usr/src/debug/libgpg-error/1.50/tests/t-printf.c /usr/src/debug/libgpg-error/1.50/tests/t-logging.c /usr/src/debug/libgpg-error/1.50/tests/t-strerror.c /usr/src/debug/libgpg-error/1.50/tests/t-common.h /usr/src/debug/libgpg-error/1.50/tests/t-syserror.c /usr/src/debug/libgpg-error/1.50/tests/t-version.c /usr/src/debug/libgpg-error/1.50/tests/t-stringutils.c /usr/src/debug/libgpg-error/1.50/tests/t-b64.c /usr/src/debug/libgpg-error/1.50/tests/t-lock-single-posix.c", added "/usr/src/debug/libgpg-error/1.51/tests/t-lock.c /us
 r/src/debug/libgpg-error/1.51/tests/t-poll.c /usr/src/debug/libgpg-error/1.51/tests/t-malloc.c /usr/src/debug/libgpg-error/1.51/tests/t-argparse.c /usr/src/debug/libgpg-error/1.51/tests/t-printf.c /usr/src/debug/libgpg-error/1.51/tests/t-spawn.c /usr/src/debug/libgpg-error/1.51/tests/t-logging.c /usr/src/debug/libgpg-error/1.51/tests/t-strerror.c /usr/src/debug/libgpg-error/1.51/tests/t-common.h /usr/src/debug/libgpg-error/1.51/tests/t-syserror.c /usr/src/debug/libgpg-error/1.51/tests/t-version.c /usr/src/debug/libgpg-error/1.51/tests/t-stringutils.c /usr/src/debug/libgpg-error/1.51/tests/t-b64.c /usr/src/debug/libgpg-error/1.51/tests/t-lock-single-posix.c"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-src: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-src: PKGSIZE changed from 921026 to 928381 (+1%)
packages/core2-64-poky-linux/libgpg-error/libgpg-error-staticdev: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-staticdev: PV changed from "1.50" to "1.51"
packages/core2-64-poky-linux/libgpg-error/libgpg-error: PKGV changed from 1.50 [default] to 1.51 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.37.0", added "/usr/lib/libgpg-error.so.0.38.0"
packages/core2-64-poky-linux/libgpg-error/libgpg-error: PV changed from "1.50" to "1.51"
Changes to packages/core2-64-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.37.0 to libgpg-error.so.0.38.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.37.0 to libgpg-error.so.0.38.0
  /usr/lib/libgpg-error.so.0.37.0 moved to /usr/lib/libgpg-error.so.0.38.0
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.37.0 to libgpg-error.so.0.38.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.37.0 to libgpg-error.so.0.38.0
  /usr/lib/libgpg-error.so.0.37.0 moved to /usr/lib/libgpg-error.so.0.38.0

--===============7360494409209410590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1881 targets, 52 skipped, 0 masked, 0 errors.
Removing 43 recipes from the core2-64 sysroot...done.
Removing 41 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:55d148edc2139b63f9705fc37b0eb04b8baad630"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 284 Local 179 Mirrors 0 Missed 105 Current 202 (63% match, 78% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 218 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 223 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 227 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 230 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 234 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 252 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_lic_setscene)
NOTE: Running setscene task 286 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 295 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_lic_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 296 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 297 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 298 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 299 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 300 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 301 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 304 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 309 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 310 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 313 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 314 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 315 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 318 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 332 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 387 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 388 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 389 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 390 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 391 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 392 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 393 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 400 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 425 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 426 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 427 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 428 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 429 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 430 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 431 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: Running task 738 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running task 739 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 752 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa)
NOTE: Running task 757 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 758 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: Running task 759 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
NOTE: Running task 760 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 765 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: Running task 766 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 768 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 770 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_fetch)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 432 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: Running setscene task 434 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: Running setscene task 435 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 771 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: Running task 772 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: Running task 773 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 774 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 780 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_fetch)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 781 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: Running task 782 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 436 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: Running task 783 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Succeeded
NOTE: Running task 784 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe perl-5.40.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 785 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa: Succeeded
NOTE: Running task 787 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe perl-5.40.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 789 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_fetch)
NOTE: Running task 791 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 792 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_unpack)
NOTE: Running task 793 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: Running setscene task 437 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 794 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 795 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe bash-5.2.37-r0: task do_unpack: Started
NOTE: Running task 797 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_fetch)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Started
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 440 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_fetch: Started
NOTE: Running setscene task 441 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 798 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_unpack)
NOTE: Running task 799 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 800 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_patch)
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 801 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 802 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Started
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 443 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 445 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 805 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: Running setscene task 446 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_unpack: Succeeded
NOTE: Running task 807 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_patch)
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 808 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 809 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 811 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Succeeded
NOTE: Running task 812 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 448 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 813 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: Running task 814 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: Running setscene task 449 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.37-r0: task do_patch: Started
NOTE: Running setscene task 450 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 451 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 452 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_patch: Succeeded
NOTE: Running task 815 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Started
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 816 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: Running task 817 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 818 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 820 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: recipe cracklib-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 454 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 455 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Started
NOTE: Running task 822 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 457 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: Running setscene task 458 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 823 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 824 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 825 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Succeeded
NOTE: Running task 826 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_deploy_source_date_epoch)
NOTE: Running task 828 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 829 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_unpack)
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 831 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 833 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: Running setscene task 459 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: Running setscene task 460 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe perl-5.40.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 834 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 836 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 840 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 842 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_fetch)
NOTE: Running task 844 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe bash-5.2.37-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: Running task 848 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: Running task 849 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Started
NOTE: Running task 850 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: Running task 853 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 859 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 860 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 463 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 861 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 863 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 864 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 865 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: Running task 866 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 892 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 902 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: Running task 919 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 968 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: Running task 974 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 975 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 466 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 978 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 980 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 468 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running noexec task 982 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running task 983 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 984 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_patch)
NOTE: Running task 985 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: Running task 986 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_patch)
NOTE: Running task 987 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: Running task 990 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cracklib-2.10.2-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe shadow-4.16.0-r0: task do_patch: Started
NOTE: recipe perl-5.40.0-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 471 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 473 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 995 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe shadow-4.16.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 477 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 478 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1000 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1002 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: Running task 1003 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1004 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_fetch: Succeeded
NOTE: Running task 1005 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1006 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: Running task 1007 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1008 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe musl-1.2.5+git-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1009 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1010 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: Running task 1011 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_collect_spdx_deps)
NOTE: recipe perl-5.40.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: Running noexec task 1015 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: Running noexec task 1016 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 1017 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: Running task 1019 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe musl-1.2.5+git-r0: task do_unpack: Succeeded
NOTE: Running task 1020 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.5+git-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package unihash changed to cf97fb3d1def5bc50884adac44ff0414ba7a7048c7e41dda3deba4d0b391a1e7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata became valid
NOTE: Running setscene task 478 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 482 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to a5195a8651bd771dfe48b1ecae2e89a153927fbb5dc68cc8c0dfb226e9d1dda0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: Running setscene task 449 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 485 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1035 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Succeeded
NOTE: Running task 1051 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_unpack)
NOTE: Running task 1052 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Succeeded
NOTE: Running task 1053 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_patch)
NOTE: Running task 1054 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Succeeded
NOTE: Running noexec task 1056 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_configure)
NOTE: Running noexec task 1057 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_compile)
NOTE: Running task 1058 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_install)
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Succeeded
NOTE: Running task 1071 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1074 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1075 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1076 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1077 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1079 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1080 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.5+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.5+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1081 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.5+git-r0: task do_configure: Started
NOTE: recipe musl-1.2.5+git-r0: task do_configure: Succeeded
NOTE: Running task 1082 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe musl-1.2.5+git-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to 0c352f22d07fc9ad45d2a42f2722fb5542baafde1f16d933e26c1e304bc53992
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: Running setscene task 454 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_package unihash changed to d2823c93a486dbbb6db3eb1cfd9ac4612d806fe7df3075a86791c85b6176e848
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata became valid
NOTE: Running setscene task 454 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1092 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_collect_spdx_deps)
NOTE: recipe musl-1.2.5+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.5+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1093 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.5+git-r0: task do_install: Started
NOTE: recipe musl-1.2.5+git-r0: task do_install: Succeeded
NOTE: Running task 1095 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1096 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package: Started
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1097 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_configure)
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1098 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_compile)
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to cad49bdf808b2c35a536bc6846bf8e7f8881c76cb8b74bbde552352ffa96089c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Running setscene task 456 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1101 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1102 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_install)
NOTE: recipe libgcc-14.2.0-r0: task do_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1103 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_multilib_install)
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1104 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1106 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1107 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1108 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_configure)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package unihash changed to a2eb7773a2bc93cf4cfc6c6fc339b44dbe596a9361a3904fc683d32cdb0a1f44
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata became valid
NOTE: Running setscene task 458 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1111 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1112 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_compile)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1113 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_install)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1115 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1121 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1122 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package)
NOTE: Running task 1123 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1124 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1125 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1126 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1127 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1128 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1129 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1130 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1131 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1132 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_configure)
NOTE: Running task 1133 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1134 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1135 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1136 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_configure)
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1137 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1138 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Started
NOTE: Running task 1139 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure)
NOTE: Running task 1140 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1141 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1142 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1143 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: Running task 1144 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1146 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1147 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1148 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1149 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1150 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1151 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1152 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1153 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.51-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1154 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1155 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1156 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1158 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1159 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_compile)
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Started
NOTE: recipe cracklib-2.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1160 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_configure)
NOTE: recipe base-passwd-3.6.4-r0: task do_configure: Succeeded
NOTE: Running task 1161 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_compile)
NOTE: recipe cracklib-2.10.2-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1162 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_install)
NOTE: recipe base-passwd-3.6.4-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_install: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1169 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_install)
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_configure: Succeeded
NOTE: Running task 1170 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_compile)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_compile: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package unihash changed to 0a77ac0637f2fd06e9b0b7b5d2d498e165c75f23f2276d5c61b1b74da97cbe55
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata became valid
NOTE: Running setscene task 454 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 485 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1173 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: Running task 1174 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: Running task 1176 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package)
NOTE: Running task 1179 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1180 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1182 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_collect_spdx_deps)
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1183 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1184 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe base-passwd-3.6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1185 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile)
NOTE: recipe gdbm-1.24-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1186 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: recipe base-passwd-3.6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: Running task 1187 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: Running task 1189 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe zlib-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1190 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 757ee89c9ce5a21276271be4eb9548b3065e76aa5c55fa26b28e6fe6c37052fc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 485 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1191 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1192 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1193 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1196 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_collect_spdx_deps)
NOTE: Running task 1197 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_collect_spdx_deps)
NOTE: recipe cracklib-2.10.2-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.51-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.51-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1198 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_collect_spdx_deps)
NOTE: recipe attr-2.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package unihash changed to b718297ba2499385d16928c350ec9df170154e201eabec3a8ed6fcf321513747
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata became valid
NOTE: Running setscene task 485 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1199 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 141507a4da25407968438fd16debc1326c8db3674cda63a5057a4f37d12682fe
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: Running task 1204 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1206 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1209 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_collect_spdx_deps)
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Started
NOTE: recipe cracklib-2.10.2-r0: task do_compile: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdbm-1.24-r0: task do_compile: Succeeded
NOTE: Running task 1210 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile_ptest_base)
NOTE: Setscene tasks completed
NOTE: Running task 1211 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_install)
NOTE: recipe cracklib-2.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Started
NOTE: recipe cracklib-2.10.2-r0: task do_install: Started
NOTE: Running task 1213 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1214 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: Running task 1215 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1217 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1218 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to 22beb395c7811f97883b28cd3cead7ca19e80f528bad474e2d6123cf115c31a2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe cracklib-2.10.2-r0: task do_install: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_configure: Succeeded
NOTE: Running task 1221 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1222 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_package)
NOTE: Setscene tasks completed
NOTE: Running task 1223 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.51-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.51-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_package: Started
NOTE: Running task 1224 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_compile)
NOTE: recipe gdbm-1.24-r0: task do_install: Succeeded
NOTE: Running task 1225 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.51-r0: task do_compile: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1226 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure)
NOTE: recipe libpam-1.6.1-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1228 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1229 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package)
NOTE: recipe gdbm-1.24-r0: task do_package: Started
NOTE: recipe perl-5.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1230 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_configure)
NOTE: recipe perl-5.40.0-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 69c6610f7d0cac64fdb5f972590234db9fedb9e40d809a41a93379df2ea70fcb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: Running setscene task 485 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 84689d2fe248b31f90eb83611bb3ec5a3215383bf00f60a4457cfb1768432a0b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx became valid
NOTE: Running setscene task 472 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 473 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 474 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 481 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1237 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package unihash changed to 9c7f18de3dfdf3a243e012aea76518be273ff89527655d6c34d5319c124b398c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gdbm-1.24-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package unihash changed to 09a789005f4102bc13d1baeb4ac6e5b45112aa81f14a9e196bc405724f833947
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_package unihash changed to fe4edf5680400a9106ad540e9b7738f8bb7f453f2af204ca6ae8ffda1b76174b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata became valid
NOTE: Running setscene task 480 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_create_spdx_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm unihash changed to 96abd528bedff270e9409103930b50e3d7701b5101b3f60b84e1d287d5da4b38
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1241 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1244 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1245 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.51-r0: task do_compile: Succeeded
NOTE: Running task 1246 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.51-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.51-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1247 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1248 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.51-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1249 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1250 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.51-r0: task do_install: Succeeded
NOTE: Running task 1251 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.51-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1252 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 1253 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.51-r0: task do_install_ptest_base: Succeeded
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: Running task 1254 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_package)
NOTE: Running task 1255 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1256 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.51-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1258 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1259 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1260 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1261 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1262 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 1263 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1264 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 1266 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package)
NOTE: recipe libgpg-error-1.51-r0: task do_package: Succeeded
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Started
NOTE: Running task 1267 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 80bc318bb64eff37939fd51aeda0329a58f58da6545c6ea014f8ca3b863234b4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1268 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata: Succeeded
NOTE: Running task 1269 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_create_spdx)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_create_spdx: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgpg-error-1.51-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package unihash changed to 9744b4214c3d6b0293baccc8d2b3f8327bd237ffaea5ba30510b6debda5a6df1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1272 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1273 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile)
NOTE: recipe libpam-1.6.1-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1274 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1276 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 2265564661c3c6ea2a7241b0c1c54514288b5759ac9777d697d500a6b4400339
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: Running task 1277 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 4fadb31d18a138e72ed392cd19ac15728929b89479abfc899a6f5a496170eca1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-3_3.46.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1280 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_install)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_install: Succeeded
NOTE: Running task 1282 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_package)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1283 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1284 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_package unihash changed to ff04b89360688459c7df2903ac8f26c05fb8be3f8d2d7e99f8d0ea7e1b1d675e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 1286 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1288 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1289 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package)
NOTE: Running task 1290 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.6.1-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1291 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_configure: Started
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1292 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_configure: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_configure: Started
NOTE: Running task 1293 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_compile)
NOTE: recipe libcap-2.70-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1295 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1296 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1297 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: Running task 1298 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1299 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe bash-5.2.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: Running task 1300 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_configure)
NOTE: recipe bash-5.2.37-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1301 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure)
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Started
NOTE: recipe libcap-2.70-r0: task do_compile: Succeeded
NOTE: Running task 1302 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_install)
NOTE: recipe libcap-2.70-r0: task do_install: Started
NOTE: recipe libcap-2.70-r0: task do_install: Succeeded
NOTE: Running task 1304 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1305 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package unihash changed to 78c5ca0bc3b867a2e6d5981c0351ee590c20b4150701e8421f8d77245f384658
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx became valid
NOTE: Running setscene task 482 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1307 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package)
NOTE: Running task 1309 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.70-r0: task do_package: Started
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1310 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_compile)
NOTE: recipe shadow-4.16.0-r0: task do_compile: Started
NOTE: recipe libcap-2.70-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package unihash changed to f33b17a9d180c9924a0bd87f0f89577e910ce3b6207282f3cdb59e0e682af6e1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libcap/2.70/temp/log.do_packagedata_setscene.3288800
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running task 1311 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata)
NOTE: recipe libcap-2.70-r0: task do_packagedata: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1312 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1313 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_compile)
NOTE: recipe perl-5.40.0-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1314 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to 4f9c40e3e4d008cb2d3f9d5debe95b3d3b91cfeea8395ab71d5c2407d51f7f43
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx became valid
NOTE: Running setscene task 475 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1317 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_collect_spdx_deps)
NOTE: recipe bash-5.2.37-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-5.2.37-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 1318 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_package)
NOTE: Running task 1320 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.37-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1321 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_configure_ptest_base)
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.16.0-r0: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_configure_ptest_base: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe bash-5.2.37-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1323 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_compile)
NOTE: recipe bash-5.2.37-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1324 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1325 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 1326 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1327 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 1329 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_compile: Succeeded
NOTE: Running task 1330 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_compile_ptest_base: Started
NOTE: recipe shadow-4.16.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_package unihash changed to f060dd24a0b27b9034064955096552d7be2f370bacdf6fbc84a9a4a39e0e3c59
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_create_spdx became valid
NOTE: Running setscene task 485 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Succeeded
NOTE: Running task 1331 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1333 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: Running task 1335 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1336 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to 401994673efb3dea0512df3943404d13db854efa653f46f53e1f1aa8ce619198
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1338 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_install)
NOTE: recipe bash-5.2.37-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Running task 1339 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata unihash changed to 6b66af3b779514d4c17c242487994abe8066426e24ddbaf2cf9838ff5118e557
NOTE: Setscene tasks completed
NOTE: Running task 1340 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx)
NOTE: Running task 1341 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk)
NOTE: Running task 1342 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb)
NOTE: Running task 1343 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm)
NOTE: Running task 1344 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk unihash changed to bf2fa7ae421b1d367d0b1e9ee9c888f81564b0ceac5d79e98df072f6fcac6b36
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa unihash changed to 393d81d9475fa549f31977272e1dd2f92f03ab88b7f5dfc825aab37add22b08e
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb unihash changed to 305436323adae6d1294fe7c635ec7080bd5134c25030b000f70a9fd365b48b14
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm unihash changed to 7ff14bbed0686e4d050ed707b13eba408a1ee582c639fbb9dd58a87ab13de7f7
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 1345 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.2.37-r0: task do_install: Succeeded
NOTE: Running task 1346 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.37-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1347 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install)
NOTE: recipe util-linux-2.40.2-r0: task do_install: Started
NOTE: recipe bash-5.2.37-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1348 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package)
NOTE: recipe bash-5.2.37-r0: task do_package: Started
NOTE: recipe util-linux-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 1350 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1351 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package)
NOTE: recipe util-linux-2.40.2-r0: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package unihash changed to b24cca652d7a32b23c77b77b01850c7a80c88d6c98592baaf4c0a30495e6e9aa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata became valid
NOTE: Running setscene task 481 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1354 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_package_write_ipk)
NOTE: Running task 1355 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_package_write_deb)
NOTE: Running task 1356 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_package_write_rpm)
NOTE: Running task 1357 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_package_qa)
NOTE: Running task 1358 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_create_package_spdx)
NOTE: recipe libgpg-error-1.51-r0: task do_package_write_ipk: Started
NOTE: recipe libgpg-error-1.51-r0: task do_package_write_deb: Started
NOTE: recipe libgpg-error-1.51-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.51-r0: task do_package_qa: Started
NOTE: recipe libgpg-error-1.51-r0: task do_create_package_spdx: Started
NOTE: recipe libgpg-error-1.51-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_package_write_deb: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_package_qa: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_package_write_ipk: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1359 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1360 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile)
NOTE: recipe coreutils-9.5-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.51-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1362 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install)
NOTE: recipe coreutils-9.5-r0: task do_install: Started
NOTE: recipe coreutils-9.5-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package unihash changed to e7292248fd6dc64eb0f39c3ef4fb6069dfa0d12e3a60abec976f118461c1f097
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1365 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package)
NOTE: recipe coreutils-9.5-r0: task do_package: Started
NOTE: recipe perl-5.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1366 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1367 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_install)
NOTE: recipe perl-5.40.0-r0: task do_install: Started
NOTE: recipe coreutils-9.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package unihash changed to d4d928cefb57058d3d4ebb43f126e98abd767a6fa7fbc46ca40d0db64bbb55e5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.40.0-r0: task do_install: Succeeded
NOTE: Running task 1369 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1370 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package)
NOTE: recipe perl-5.40.0-r0: task do_package: Started
NOTE: recipe perl-5.40.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package unihash changed to d1afdd021099e2649c58d937e469709a37ddb53a44e4d9532f310ae4315bb79d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb became valid
NOTE: Running setscene task 482 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa_setscene)
NOTE: Running setscene task 483 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 484 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 486 of 486 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1374 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm unihash changed to 325c6b656934d103ce684797e2f685060ab4322e2febbf36644445472cb18f49
NOTE: Running noexec task 1376 of 1376 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_build)
NOTE: Tasks Summary: Attempted 1376 tasks of which 1047 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 22 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libcap-2.70-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.72-r0 to 0:2.70-r0) [version-going-backwards]
ERROR: libcap-2.70-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.72-r0 to 0:2.70-r0) [version-going-backwards]
ERROR: libcap-2.70-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.72-r0 to 0:2.70-r0) [version-going-backwards]
ERROR: libcap-2.70-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.72-r0 to 0:2.70-r0) [version-going-backwards]
ERROR: libcap-2.70-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.72-r0 to 0:2.70-r0) [version-going-backwards]
ERROR: libcap-2.70-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.72-r0 to 0:2.70-r0) [version-going-backwards]
ERROR: libcap-2.70-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.72-r0 to 0:2.70-r0) [version-going-backwards]
ERROR: libcap-2.70-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.72-r0 to 0:2.70-r0) [version-going-backwards]
ERROR: libcap-2.70-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7360494409209410590==--

