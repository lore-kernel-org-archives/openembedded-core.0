Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AB4CD6E74
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1569.1780328135766942518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JcZglLUp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hn5RIWcG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e83d3cd55-c0363960-b60a-4324-bda5-35bbac3a22a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ul8Ke/k/LUf6TYRf3FPu6WzhRMcOkDSIOdC8K/Mxej8=;
	b=JcZglLUpU0opmTHDtww9i2LFkh8Lf0NsPB5IBKZK/RTwFfkhKumkv9CYBzsJ0IsQ
	uHtlL/OHmc6G7lU7K/XhBGvJFFQTA9tbfN9B/soyXUghufI/VZA5cOcRY9LKHZiuSpn
	wZ7D5Xe2h9vFyZBCWHjth8uubyCUASN7kZrqwOgo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ul8Ke/k/LUf6TYRf3FPu6WzhRMcOkDSIOdC8K/Mxej8=;
	b=hn5RIWcGPGCQJht8axsX2o1hqW2p1jRJqrhkddA6rlPRZTQJacEdPe8srGoI1ogi
	GhloEm4vCzm6H7duc8PJw/KQWWVlq/ohsJ7rYx7KhCfw0eT/xwfCjMhzRLvwT7G5lis
	x+dGmAnLQ6iMc86KL6+SOTnSSROOwV0nu1FDUFic=
Content-Type: multipart/mixed; boundary="===============3835442833757931755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.61 SUCCEEDED
Message-ID: <0101019e83d3cd55-c0363960-b60a-4324-bda5-35bbac3a22a1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237956

--===============3835442833757931755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgpg-error* to *1.61* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgpg-error-upgrade-1.60-1.61.patch
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
From 001a9f07b90bb574708087cb3f6a99ca9722822c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 14:49:50 +0000
Subject: [PATCH] libgpg-error: upgrade 1.60 -> 1.61

---
 .../0001-Do-not-fail-when-testing-config-scripts.patch          | 2 +-
 meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch  | 2 +-
 .../libgpg-error/{libgpg-error_1.60.bb => libgpg-error_1.61.bb} | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.60.bb => libgpg-error_1.61.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index 3484af63b3..063a837f60 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From 48d457a819d1bf4171c6cc7fe161cdfc66770be2 Mon Sep 17 00:00:00 2001
+From 8722a653191368fd5f8dfdf798f3cc57e651faf3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 485c079a2b..1fe5e0510b 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From 3648accd954d86b14f7a4eb72b9ffa4fe57b72d5 Mon Sep 17 00:00:00 2001
+From 31d4be147b094cc3e1f45448044efcfddcbdc974 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 21 Aug 2024 20:03:29 -0700
 Subject: [PATCH] support pkgconfig
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
index 622827c2ca..de3918a998 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09"
+SRC_URI[sha256sum] = "7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.47.1


--===============3835442833757931755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.42.0", added "/usr/lib/libgpg-error.so.0.42.1"
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so.0.42.0 moved to /usr/lib/libgpg-error.so.0.42.1
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so.0.42.0 moved to /usr/lib/libgpg-error.so.0.42.1

--===============3835442833757931755==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgpg-error-upgrade-1.60-1.61.patch"

RnJvbSAwMDFhOWYwN2I5MGJiNTc0NzA4MDg3Y2IzZjZhOTljYTk3MjI4MjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNDo0OTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmdwZy1lcnJvcjogdXBncmFkZSAxLjYwIC0+IDEuNjEKCi0tLQogLi4uLzAwMDEtRG8tbm90LWZh
aWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNoICAgICAgICAgIHwgMiArLQogbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci9wa2djb25maWcucGF0
Y2ggIHwgMiArLQogLi4uL2xpYmdwZy1lcnJvci97bGliZ3BnLWVycm9yXzEuNjAuYmIgPT4gbGli
Z3BnLWVycm9yXzEuNjEuYmJ9IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVy
cm9yL3tsaWJncGctZXJyb3JfMS42MC5iYiA9PiBsaWJncGctZXJyb3JfMS42MS5iYn0gKDk1JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVy
cm9yLzAwMDEtRG8tbm90LWZhaWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci8wMDAxLURvLW5v
dC1mYWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaAppbmRleCAzNDg0YWY2M2Iz
Li4wNjNhODM3ZjYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJy
b3IvbGliZ3BnLWVycm9yLzAwMDEtRG8tbm90LWZhaWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3Jp
cHRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGct
ZXJyb3IvMDAwMS1Eby1ub3QtZmFpbC13aGVuLXRlc3RpbmctY29uZmlnLXNjcmlwdHMucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ4ZDQ1N2E4MTlkMWJmNDE3MWM2Y2M3ZmUxNjFjZGZjNjY3
NzBiZTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg3MjJhNjUzMTkxMzY4ZmQ1Zjhk
ZmRmNzk4ZjNjYzU3ZTY1MWZhZjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMjggRmVi
IDIwMjAgMDk6MTk6NTYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGZhaWwgd2hlbiB0
ZXN0aW5nIGNvbmZpZyBzY3JpcHRzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJncGctZXJyb3IvbGliZ3BnLWVycm9yL3BrZ2NvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoCmluZGV4IDQ4
NWMwNzlhMmIuLjFmZTVlMDUxMGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSAzNjQ4YWNjZDk1NGQ4NmIxNGY3YTRlYjcyYjlmZmE0ZmU1N2I3MmQ1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMWQ0YmUxNDdiMDk0Y2MzZTFmNDU0NDgw
NDRlZmNmZGRjYmRjOTc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEpp
YSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyMSBBdWcgMjAyNCAyMDow
MzoyOSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBzdXBwb3J0IHBrZ2NvbmZpZwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8xLjYwLmJi
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8xLjYxLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmdwZy1lcnJvci9saWJncGctZXJyb3JfMS42MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8xLjYxLmJiCmluZGV4IDYyMjgyN2MyY2Eu
LmRlMzkxOGE5OTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJv
ci9saWJncGctZXJyb3JfMS42MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGct
ZXJyb3IvbGliZ3BnLWVycm9yXzEuNjEuYmIKQEAgLTE5LDcgKzE5LDcgQEAgU1JDX1VSSSA9ICIk
e0dOVVBHX01JUlJPUn0vbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci0ke1BWfS50YXIuYnoyIFwK
ICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjExYjJhNzM4ZTIxMmYzZWFiMGZlODYzN2JjMzQxZDMxODFjYTk2NGU5N2Ji
MjY1NGRlOTFhYWI3ZGFlNGNlMDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2E4NTQxM2YyYmMz
NTRmNGY4YWE4MzJiNzE4YWYxMjJlNDg5NjVlOWUwZWI5MDEyZWU2NTljMTNjNjM4NWM5MyIKIAog
QklOQ09ORklHID0gIiR7YmluZGlyfS9ncGctZXJyb3ItY29uZmlnIgogCi0tIAoyLjQ3LjEKCg==

--===============3835442833757931755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11330424 to 11130992 (-2%)
packages/x86-64-v3-poky-linux/libgpg-error: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.60.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.61.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libgpg-error: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGSIZE changed from 1397744 to 1400160 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: FILELIST: removed "/usr/lib/.debug/libgpg-error.so.0.42.0", added "/usr/lib/.debug/libgpg-error.so.0.42.1"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PKGSIZE changed from 39127 to 39527 (+1%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PKGSIZE changed from 35073 to 35396 (+1%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PKGSIZE changed from 299838 to 308030 (+3%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGSIZE changed from 1025216 to 1028616 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: FILELIST: directory renamed /usr/src/debug/libgpg-error/1.60/tests -> /usr/src/debug/libgpg-error/1.61/tests, directory renamed /usr/src/debug/libgpg-error/1.60/src -> /usr/src/debug/libgpg-error/1.61/src, directory renamed /usr/src/debug/libgpg-error/1.60/doc -> /usr/src/debug/libgpg-error/1.61/doc
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PKGV changed from 1.60 [default] to 1.61 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PV changed from "1.60" to "1.61"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.42.0", added "/usr/lib/libgpg-error.so.0.42.1"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PKGV changed from 1.60 [default] to 1.61 [default]
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so.0.42.0 moved to /usr/lib/libgpg-error.so.0.42.1
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.42.0 to libgpg-error.so.0.42.1
  /usr/lib/libgpg-error.so.0.42.0 moved to /usr/lib/libgpg-error.so.0.42.1

--===============3835442833757931755==--

