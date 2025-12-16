Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54027D5C0C0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17382.1765872127684878873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=N+Z5GuSK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CErSBK6F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e4b9d-d188b74f-06c8-4134-b871-7993c50f13a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G9V6ExLQ3idHFiHYeee/EfUMsB3xYDcuObYEWk+LVjs=;
	b=N+Z5GuSKu+/8/C1J9rR3Df875fa2BY0VpkZa0PitR5p9Tezmgid95MqIQlhtPf/s
	uCIuFkKHHTLm1QoQQdKjwMWZETQ+sKfTpaDti7IQI4MaV/PyGu8ND5N1W+zLklPKirQ
	TB9kFpolZqZHGzsO3OqUg9SYxJvqUHZXkuSN8coI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G9V6ExLQ3idHFiHYeee/EfUMsB3xYDcuObYEWk+LVjs=;
	b=CErSBK6FAAGlZKojpk+oHbeeOU6RHG+ghOn2z8i/vWWoWvBwLQDPzjesfj2CuTL2
	t7cFaL/wi3nS3ivl/6E8CUbt9nPhgLHGak1N6GjTjAKAy72JoRZgi70PdbXLzEc/yjH
	TfbtvhNOqV1gzEUa844vS7cjuI85pHOc8CcG305w=
Content-Type: multipart/mixed; boundary="===============4557853275122915113=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat,libxcrypt: upgrading to 4.5.2,4.5.2 FAILED
Message-ID: <0101019b262e4b9d-d188b74f-06c8-4134-b871-7993c50f13a5-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227762

--===============4557853275122915113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxcrypt-compat,libxcrypt* to *4.5.2,4.5.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-libxcrypt-upgrade-4.5.0-4.5.2-4.5.0.patch
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
From 95bb783b22014075a69dade891b2293fda229fba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 19:21:09 +0000
Subject: [PATCH] libxcrypt-compat,libxcrypt: upgrade 4.5.0 -> 4.5.2,4.5.0 ->
 4.5.2

---
 .../{libxcrypt-compat_4.5.0.bb => libxcrypt-compat_4.5.2.bb}    | 1 +
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.5.0.bb => libxcrypt_4.5.2.bb}        | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.5.0.bb => libxcrypt-compat_4.5.2.bb} (99%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.5.0.bb => libxcrypt_4.5.2.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.2.bb
similarity index 99%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.2.bb
index 30ec6a4674..bb4e2032dd 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.2.bb
@@ -16,3 +16,4 @@ do_install:append () {
 	rm -rf ${D}${libdir}/libcrypt.so
 	rm -rf ${D}${datadir}
 }
+
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index bef40b0ae6..9aed0b9d81 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=b65434749329c34b5d32c2df3f1b4112 \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "096296cb6fbecd9ad46c93a410d76c752a5d6206"
+SRCREV = "db70b42bd7b2a5b00a8580c8dec0aa66791c950a"
 
 PROVIDES = "virtual/crypt"
 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.5.0.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.5.0.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb
-- 
2.47.1


--===============4557853275122915113==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-libxcrypt-upgrade-4.5.0-4.5.2-4.5.0.patch"

RnJvbSA5NWJiNzgzYjIyMDE0MDc1YTY5ZGFkZTg5MWIyMjkzZmRhMjI5ZmJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMTk6MjE6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4Y3J5cHQtY29tcGF0LGxpYnhjcnlwdDogdXBncmFkZSA0LjUuMCAtPiA0LjUuMiw0LjUuMCAt
PgogNC41LjIKCi0tLQogLi4uL3tsaWJ4Y3J5cHQtY29tcGF0XzQuNS4wLmJiID0+IGxpYnhjcnlw
dC1jb21wYXRfNC41LjIuYmJ9ICAgIHwgMSArCiBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQv
bGlieGNyeXB0LmluYyAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4vbGlieGNyeXB0
L3tsaWJ4Y3J5cHRfNC41LjAuYmIgPT4gbGlieGNyeXB0XzQuNS4yLmJifSAgICAgICAgfCAwCiAz
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC97bGlieGNyeXB0LWNvbXBhdF80LjUuMC5iYiA9PiBs
aWJ4Y3J5cHQtY29tcGF0XzQuNS4yLmJifSAoOTklKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3Jl
L2xpYnhjcnlwdC97bGlieGNyeXB0XzQuNS4wLmJiID0+IGxpYnhjcnlwdF80LjUuMi5iYn0gKDEw
MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1j
b21wYXRfNC41LjAuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNv
bXBhdF80LjUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjUuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC41LjIuYmIKaW5kZXgg
MzBlYzZhNDY3NC4uYmI0ZTIwMzJkZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGli
eGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC41LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
bGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC41LjIuYmIKQEAgLTE2LDMgKzE2LDQgQEAgZG9f
aW5zdGFsbDphcHBlbmQgKCkgewogCXJtIC1yZiAke0R9JHtsaWJkaXJ9L2xpYmNyeXB0LnNvCiAJ
cm0gLXJmICR7RH0ke2RhdGFkaXJ9CiB9CisKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xp
YnhjcnlwdC5pbmMKaW5kZXggYmVmNDBiMGFlNi4uOWFlZDBiOWQ4MSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TSU5HO21kNT1iNjU0MzQ3NDkzMjljMzRiNWQzMmMyZGYz
ZjFiNDExMiBcCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL2Jlc3NlcjgyL2xpYnhjcnlwdC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gIjA5NjI5NmNiNmZiZWNkOWFkNDZjOTNhNDEw
ZDc2Yzc1MmE1ZDYyMDYiCitTUkNSRVYgPSAiZGI3MGI0MmJkN2IyYTViMDBhODU4MGM4ZGVjMGFh
NjY3OTFjOTUwYSIKIAogUFJPVklERVMgPSAidmlydHVhbC9jcnlwdCIKIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdF80LjUuMC5iYiBiL21ldGEvcmVj
aXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHRfNC41LjIuYmIKc2ltaWxhcml0eSBpbmRleCAx
MDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHRfNC41
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHRfNC41
LjIuYmIKLS0gCjIuNDcuMQoK

--===============4557853275122915113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxcrypt-compat: SRC_URI changed from "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v4.5.0" to "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt-compat: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt-compat: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 647280 to 647688 (+0%)
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 792953 to 793040 (+0%)
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-src: FILELIST: directory renamed /usr/src/debug/libxcrypt-compat/4.5.0 -> /usr/src/debug/libxcrypt-compat/4.5.2, directory renamed /usr/src/debug/libxcrypt-compat/4.5.0/lib -> /usr/src/debug/libxcrypt-compat/4.5.2/lib
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt: SRC_URI changed from "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v4.5.0" to "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-dbg: PKGSIZE changed from 639440 to 639856 (+0%)
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-dbg: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-dbg: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-dev: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-dev: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-doc: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-doc: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-locale: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-locale: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-src: PKGSIZE changed from 786268 to 786355 (+0%)
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-src: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-src: FILELIST: directory renamed /usr/src/debug/libxcrypt/4.5.0 -> /usr/src/debug/libxcrypt/4.5.2, directory renamed /usr/src/debug/libxcrypt/4.5.0/lib -> /usr/src/debug/libxcrypt/4.5.2/lib
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-src: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-staticdev: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt-staticdev: PV changed from "4.5.0" to "4.5.2"
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt: PKGSIZE changed from 223225 to 227321 (+2%)
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt: PKGV changed from 4.5.0 [default] to 4.5.2 [default]
packages/x86-64-v3-poky-linux/libxcrypt/libxcrypt: PV changed from "4.5.0" to "4.5.2"

--===============4557853275122915113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'libxcrypt'
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not libxcrypt

--===============4557853275122915113==--

