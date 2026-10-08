Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E78CA6010
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 05:25:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9310.1791437152327081019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 22:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qjDcQbNw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=p3UMxkYB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a119f99ca6-b542b7f3-1be1-4130-87eb-a381b36fbe5e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791437151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VM7fohRDC+HEE9rT3jxLHDca57IUCvKtJ4Hw2UvcGoY=;
	b=qjDcQbNwiUSyPh2BWq+ABjtyr8YLltX/pnnxaBes1iqpd6pwnq/rnQ77oM3NHOY7
	Xfu+DN59jsiH+0pbnJmRbmWFSsd39hJtL+VESJTFWXuVFKaFQXVaIUIWgiDw2wwNby/
	vcQHYN0X9Qhb1BKZ7rdPJHeTonXOfgCacVix7tY0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791437151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VM7fohRDC+HEE9rT3jxLHDca57IUCvKtJ4Hw2UvcGoY=;
	b=p3UMxkYB5tCCdXESWxyEI9+lphjn9cryF88ULCL+cbBy171AdXtKxvSYBv4jBVaa
	7WZjz616tRLYk1bwzglvBt5gMFa9vnjUEpzALvOaYo2yK3Nj9SJDRqNx5/L1KtEMPmA
	aUZyjM3IaeSPaktiQmJ5MKtAJQVBp12HtIYxVndc=
Content-Type: multipart/mixed; boundary="===============2806465860832588331=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libzip: upgrading to 1.12 SUCCEEDED
Message-ID: <010101a119f99ca6-b542b7f3-1be1-4130-87eb-a381b36fbe5e-000000@us-west-2.amazonses.com>
Date: Thu, 8 Oct 2026 05:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.08-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 05:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247410

--===============2806465860832588331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libzip* to *1.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libzip-upgrade-1.11.4-1.12.patch
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
From 2969b884a1702cd49753c344666e48fa28183808 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 8 Oct 2026 05:18:38 +0000
Subject: [PATCH] libzip: upgrade 1.11.4 -> 1.12

# 1.12 [2026-10-07]
---
 .../{libzip_1.11.4.bb => libzip_1.12.bb}      | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libzip/{libzip_1.11.4.bb => libzip_1.12.bb} (59%)

diff --git a/meta/recipes-extended/libzip/libzip_1.11.4.bb b/meta/recipes-extended/libzip/libzip_1.12.bb
similarity index 59%
rename from meta/recipes-extended/libzip/libzip_1.11.4.bb
rename to meta/recipes-extended/libzip/libzip_1.12.bb
index 36f7d1faf5..d1c3ec909c 100644
--- a/meta/recipes-extended/libzip/libzip_1.11.4.bb
+++ b/meta/recipes-extended/libzip/libzip_1.12.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 1999-2020 Dieter Baron and Thomas Klausner
+# +Copyright (C) 1999-2026 Dieter Baron and Thomas Klausner
+#  
+#  The authors can be contacted at <info@libzip.org>
+#  
+# 
+#
+
 SUMMARY = "C library for reading, creating, and modifying zip archives"
 DESCRIPTION = "libzip is a C library for reading, creating, and modifying \
 zip archives. Files can be added from data buffers, files, or compressed \
@@ -8,12 +27,12 @@ BUGTRACKER = "https://github.com/nih-at/libzip/issues"
 SECTION = "libs"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a9d2078f35e61cf1122ccd440687cf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e6fcea978dc627f41e0bada0de889ec4"
 
 DEPENDS = "zlib bzip2"
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b"
+SRC_URI[sha256sum] = "376908d0f0fda13180a19fdc4f7062a1abfb59e09ca07a392d361253b8e60c2b"
 
 inherit cmake
 
-- 
2.47.1


--===============2806465860832588331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libzip/libzip-dev: FILELIST: removed "/usr/lib/cmake/libzip/modules/FindMbedTLS.cmake"
packages/x86-64-v3-poky-linux/libzip/libzip-doc: PKGSIZE changed from 0 to 941026 (+100%)
packages/x86-64-v3-poky-linux/libzip/libzip-doc: FILELIST: added "/usr/share/doc/libzip/libzip/zip_source_pass_to_lower_layer.html /usr/share/doc/libzip/libzip/zip_source_at_eof.html"
packages/x86-64-v3-poky-linux/libzip/libzip: FILELIST: removed "/usr/lib/libzip.so.5.5", added "/usr/lib/libzip.so.5.6"
Changes to packages/x86-64-v3-poky-linux/libzip (sysroot):
  /usr/lib/libzip.so.5 changed symlink target from libzip.so.5.5 to libzip.so.5.6
  /usr/lib/libzip.so.5.5 moved to /usr/lib/libzip.so.5.6
  /usr/lib/cmake/libzip/modules/FindMbedTLS.cmake was removed

--===============2806465860832588331==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libzip-upgrade-1.11.4-1.12.patch"

RnJvbSAyOTY5Yjg4NGExNzAyY2Q0OTc1M2MzNDQ2NjZlNDhmYTI4MTgzODA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOCBPY3QgMjAyNiAwNToxODozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnppcDogdXBncmFkZSAxLjExLjQgLT4gMS4xMgoKIyAxLjEyIFsyMDI2LTEwLTA3XQotLS0KIC4u
Li97bGliemlwXzEuMTEuNC5iYiA9PiBsaWJ6aXBfMS4xMi5iYn0gICAgICB8IDIzICsrKysrKysr
KysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ6aXAve2xpYnppcF8xLjExLjQu
YmIgPT4gbGliemlwXzEuMTIuYmJ9ICg1OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnppcC9saWJ6aXBfMS4xMS40LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
YnppcC9saWJ6aXBfMS4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDU5JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGliemlwL2xpYnppcF8xLjExLjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJ6aXAvbGliemlwXzEuMTIuYmIKaW5kZXggMzZmN2QxZmFmNS4u
ZDFjM2VjOTA5YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnppcC9saWJ6
aXBfMS4xMS40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ6aXAvbGliemlwXzEu
MTIuYmIKQEAgLTEsMyArMSwyMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFs
dWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93
aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNl
IHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQg
c3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vu
c2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQg
eWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMg
KysrIExJQ0VOU0UKKyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgKEMpIDE5OTktMjAy
MCBEaWV0ZXIgQmFyb24gYW5kIFRob21hcyBLbGF1c25lcgorIyArQ29weXJpZ2h0IChDKSAxOTk5
LTIwMjYgRGlldGVyIEJhcm9uIGFuZCBUaG9tYXMgS2xhdXNuZXIKKyMgIAorIyAgVGhlIGF1dGhv
cnMgY2FuIGJlIGNvbnRhY3RlZCBhdCA8aW5mb0BsaWJ6aXAub3JnPgorIyAgCisjIAorIworCiBT
VU1NQVJZID0gIkMgbGlicmFyeSBmb3IgcmVhZGluZywgY3JlYXRpbmcsIGFuZCBtb2RpZnlpbmcg
emlwIGFyY2hpdmVzIgogREVTQ1JJUFRJT04gPSAibGliemlwIGlzIGEgQyBsaWJyYXJ5IGZvciBy
ZWFkaW5nLCBjcmVhdGluZywgYW5kIG1vZGlmeWluZyBcCiB6aXAgYXJjaGl2ZXMuIEZpbGVzIGNh
biBiZSBhZGRlZCBmcm9tIGRhdGEgYnVmZmVycywgZmlsZXMsIG9yIGNvbXByZXNzZWQgXApAQCAt
OCwxMiArMjcsMTIgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vbmloLWF0L2xp
YnppcC9pc3N1ZXMiCiBTRUNUSU9OID0gImxpYnMiCiAKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNl
IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZDhhOWQyMDc4ZjM1ZTYx
Y2YxMTIyY2NkNDQwNjg3Y2YiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT1lNmZjZWE5NzhkYzYyN2Y0MWUwYmFkYTBkZTg4OWVjNCIKIAogREVQRU5EUyA9ICJ6bGliIGJ6
aXAyIgogCiBTUkNfVVJJID0gImh0dHBzOi8vbGliemlwLm9yZy9kb3dubG9hZC9saWJ6aXAtJHtQ
Vn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhMjQ3ZjU3ZDFlM2U2ZjZkMTE0MTNi
MTJhNmYyOGE5ZDM4OGRlMTEwYWRjMGVjNjA4ZDg5MzE4MGVkNzA5N2IiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMzc2OTA4ZDBmMGZkYTEzMTgwYTE5ZmRjNGY3MDYyYTFhYmZiNTllMDljYTA3YTM5
MmQzNjEyNTNiOGU2MGMyYiIKIAogaW5oZXJpdCBjbWFrZQogCi0tIAoyLjQ3LjEKCg==

--===============2806465860832588331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libzip-changelog.txt"

# 1.12 [2026-10-07]

--===============2806465860832588331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libzip: PV changed from "1.11.4" to "1.12"
packages/x86-64-v3-poky-linux/libzip: SRC_URI changed from "https://libzip.org/download/libzip-1.11.4.tar.xz" to "https://libzip.org/download/libzip-1.12.tar.xz"
packages/x86-64-v3-poky-linux/libzip: PKGV changed from 1.11.4 [default] to 1.12 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-dbg: PV changed from "1.11.4" to "1.12"
packages/x86-64-v3-poky-linux/libzip/libzip-dbg: PKGV changed from 1.11.4 [default] to 1.12 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-dbg: PKGSIZE changed from 876136 to 922344 (+5%)
packages/x86-64-v3-poky-linux/libzip/libzip-dbg: FILELIST: removed "/usr/lib/.debug/libzip.so.5.5", added "/usr/lib/.debug/libzip.so.5.6"
packages/x86-64-v3-poky-linux/libzip/libzip-dev: PV changed from "1.11.4" to "1.12"
packages/x86-64-v3-poky-linux/libzip/libzip-dev: PKGV changed from 1.11.4 [default] to 1.12 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-dev: PKGSIZE changed from 61201 to 56908 (-7%)
packages/x86-64-v3-poky-linux/libzip/libzip-dev: FILELIST: removed "/usr/lib/cmake/libzip/modules/FindMbedTLS.cmake"
packages/x86-64-v3-poky-linux/libzip/libzip-doc: PV changed from "1.11.4" to "1.12"
packages/x86-64-v3-poky-linux/libzip/libzip-doc: PKGV changed from 1.11.4 [default] to 1.12 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-doc: PKGSIZE changed from 0 to 941026 (+100%)
packages/x86-64-v3-poky-linux/libzip/libzip-doc: FILELIST: added "/usr/share/doc/libzip/libzip/zip_source_pass_to_lower_layer.html /usr/share/doc/libzip/libzip/zip_source_at_eof.html"
packages/x86-64-v3-poky-linux/libzip/libzip-locale: PV changed from "1.11.4" to "1.12"
packages/x86-64-v3-poky-linux/libzip/libzip-locale: PKGV changed from 1.11.4 [default] to 1.12 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-src: PV changed from "1.11.4" to "1.12"
packages/x86-64-v3-poky-linux/libzip/libzip-src: PKGV changed from 1.11.4 [default] to 1.12 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-src: PKGSIZE changed from 721597 to 764577 (+6%)
packages/x86-64-v3-poky-linux/libzip/libzip-src: FILELIST: directory renamed /usr/src/debug/libzip/1.11.4/src -> /usr/src/debug/libzip/1.12/src, directory renamed /usr/src/debug/libzip/1.11.4 -> /usr/src/debug/libzip/1.12, removed "/usr/src/debug/libzip/1.11.4/lib/zip_dirent.c /usr/src/debug/libzip/1.11.4/lib/zip_unchange_data.c /usr/src/debug/libzip/1.11.4/lib/zip_fopen_encrypted.c /usr/src/debug/libzip/1.11.4/lib/zip_file_rename.c /usr/src/debug/libzip/1.11.4/lib/zip_error_strerror.c /usr/src/debug/libzip/1.11.4/lib/zip_name_locate.c /usr/src/debug/libzip/1.11.4/lib/zip_stat_index.c /usr/src/debug/libzip/1.11.4/lib/zip_source_error.c /usr/src/debug/libzip/1.11.4/lib/zip_close.c /usr/src/debug/libzip/1.11.4/lib/zip_delete.c /usr/src/debug/libzip/1.11.4/lib/zip_file_add.c /usr/src/debug/libzip/1.11.4/lib/zip_source_accept_empty.c /usr/src/debug/libzip/1.11.4/lib/zip_source_begin_write_cloning.c /usr/src/debug/libzip/1.11.4/lib/zip_source_file_common.c /usr/src/debug/libzip/1.11.4/lib
 /zip_error_clear.c /usr/src/debug/libzip/1.11.4/lib/zip_source_begin_write.c /usr/src/debug/libzip/1.11.4/lib/zip_source_layered.c /usr/src/debug/libzip/1.11.4/lib/zip_get_num_entries.c /usr/src/debug/libzip/1.11.4/lib/zip_source_seek_write.c /usr/src/debug/libzip/1.11.4/lib/zip_source_tell_write.c /usr/src/debug/libzip/1.11.4/lib/zip_file_replace.c /usr/src/debug/libzip/1.11.4/lib/zip_discard.c /usr/src/debug/libzip/1.11.4/lib/zip_source_commit_write.c /usr/src/debug/libzip/1.11.4/lib/zip_fseek.c /usr/src/debug/libzip/1.11.4/lib/zip_source_is_deleted.c /usr/src/debug/libzip/1.11.4/lib/zip_unchange_all.c /usr/src/debug/libzip/1.11.4/lib/zip_string.c /usr/src/debug/libzip/1.11.4/lib/zip_extra_field.c /usr/src/debug/libzip/1.11.4/lib/zip_source_call.c /usr/src/debug/libzip/1.11.4/lib/zip_source_free.c /usr/src/debug/libzip/1.11.4/lib/zip_source_open.c /usr/src/debug/libzip/1.11.4/lib/compat.h /usr/src/debug/libzip/1.11.4/lib/zip_file_set_encryption.c /usr/src/debug/libzip/1.11.4/lib/z
 ip_source_read.c /usr/src/debug/libzip/1.11.4/lib/zip_source_seek.c /usr/src/debug/libzip/1.11.4/lib/zip_source_stat.c /usr/src/debug/libzip/1.11.4/lib/zip_source_tell.c /usr/src/debug/libzip/1.11.4/lib/zip_source_winzip_aes_decode.c /usr/src/debug/libzip/1.11.4/lib/zip_source_file.h /usr/src/debug/libzip/1.11.4/lib/zip_add.c /usr/src/debug/libzip/1.11.4/lib/zip_crypto_openssl.c /usr/src/debug/libzip/1.11.4/lib/zip_err_str.c /usr/src/debug/libzip/1.11.4/lib/zip_add_entry.c /usr/src/debug/libzip/1.11.4/lib/zip_new.c /usr/src/debug/libzip/1.11.4/lib/zip_crypto_openssl.h /usr/src/debug/libzip/1.11.4/lib/zip_get_encryption_implementation.c /usr/src/debug/libzip/1.11.4/lib/zip_get_archive_comment.c /usr/src/debug/libzip/1.11.4/lib/zip_set_archive_comment.c /usr/src/debug/libzip/1.11.4/lib/zip_hash.c /usr/src/debug/libzip/1.11.4/lib/zip_random_unix.c /usr/src/debug/libzip/1.11.4/lib/zip_source_pkware_decode.c /usr/src/debug/libzip/1.11.4/lib/zip_source_pkware_encode.c /usr/src/debug/libzi
 p/1.11.4/lib/zip_fread.c /usr/src/debug/libzip/1.11.4/lib/zip_stat_init.c /usr/src/debug/libzip/1.11.4/lib/zip_add_dir.c /usr/src/debug/libzip/1.11.4/lib/zip_open.c /usr/src/debug/libzip/1.11.4/lib/zip_fclose.c /usr/src/debug/libzip/1.11.4/lib/zip_source_supports.c /usr/src/debug/libzip/1.11.4/lib/zip_source_compress.c /usr/src/debug/libzip/1.11.4/lib/zip_libzip_version.c /usr/src/debug/libzip/1.11.4/lib/zip_io_util.c /usr/src/debug/libzip/1.11.4/lib/zip_source_pass_to_lower_layer.c /usr/src/debug/libzip/1.11.4/lib/zip_fopen.c /usr/src/debug/libzip/1.11.4/lib/zip_dir_add.c /usr/src/debug/libzip/1.11.4/lib/zip_ftell.c /usr/src/debug/libzip/1.11.4/lib/zip_file_error_clear.c /usr/src/debug/libzip/1.11.4/lib/zip_entry.c /usr/src/debug/libzip/1.11.4/lib/zip_source_remove.c /usr/src/debug/libzip/1.11.4/lib/zip_source_file_stdio.h /usr/src/debug/libzip/1.11.4/lib/zip_source_file_stdio.c /usr/src/debug/libzip/1.11.4/lib/zip.h /usr/src/debug/libzip/1.11.4/lib/zip_memdup.c /usr/src/debug/libz
 ip/1.11.4/lib/zip_file_get_comment.c /usr/src/debug/libzip/1.11.4/lib/zip_file_set_comment.c /usr/src/debug/libzip/1.11.4/lib/zip_set_file_compression.c /usr/src/debug/libzip/1.11.4/lib/zip_source_winzip_aes_encode.c /usr/src/debug/libzip/1.11.4/lib/zip_source_zip_new.c /usr/src/debug/libzip/1.11.4/lib/zip_progress.c /usr/src/debug/libzip/1.11.4/lib/zip_source_get_file_attributes.c /usr/src/debug/libzip/1.11.4/lib/zip_set_default_password.c /usr/src/debug/libzip/1.11.4/lib/zip_source_file_stdio_named.c /usr/src/debug/libzip/1.11.4/lib/zip_source_window.c /usr/src/debug/libzip/1.11.4/lib/zip_fopen_index.c /usr/src/debug/libzip/1.11.4/lib/zip_unchange_archive.c /usr/src/debug/libzip/1.11.4/lib/zip_strerror.c /usr/src/debug/libzip/1.11.4/lib/zip_source_rollback_write.c /usr/src/debug/libzip/1.11.4/lib/zip_get_name.c /usr/src/debug/libzip/1.11.4/lib/zip_error_to_str.c /usr/src/debug/libzip/1.11.4/lib/zip_set_name.c /usr/src/debug/libzip/1.11.4/lib/zip_get_file_comment.c /usr/src/debug/l
 ibzip/1.11.4/lib/zip_set_file_comment.c /usr/src/debug/libzip/1.11.4/lib/zip_pkware.c /usr/src/debug/libzip/1.11.4/lib/zip_error.c /usr/src/debug/libzip/1.11.4/lib/zip_utf-8.c /usr/src/debug/libzip/1.11.4/lib/zip_replace.c /usr/src/debug/libzip/1.11.4/lib/zip_algorithm_xz.c /usr/src/debug/libzip/1.11.4/lib/zip_rename.c /usr/src/debug/libzip/1.11.4/lib/zip_algorithm_bzip2.c /usr/src/debug/libzip/1.11.4/lib/zip_source_close.c /usr/src/debug/libzip/1.11.4/lib/zip_source_write.c /usr/src/debug/libzip/1.11.4/lib/zip_unchange.c /usr/src/debug/libzip/1.11.4/lib/zip_source_function.c /usr/src/debug/libzip/1.11.4/lib/zip_source_buffer.c /usr/src/debug/libzip/1.11.4/lib/zip_extra_field_api.c /usr/src/debug/libzip/1.11.4/lib/zip_file_get_offset.c /usr/src/debug/libzip/1.11.4/lib/zip_fopen_index_encrypted.c /usr/src/debug/libzip/1.11.4/lib/zipint.h /usr/src/debug/libzip/1.11.4/lib/zip_winzip_aes.c /usr/src/debug/libzip/1.11.4/lib/zip_algorithm_deflate.c /usr/src/debug/libzip/1.11.4/lib/zip_stat
 .c /usr/src/debug/libzip/1.11.4/lib/zip_error_get_sys_type.c /usr/src/debug/libzip/1.11.4/lib/zip_get_archive_flag.c /usr/src/debug/libzip/1.11.4/lib/zip_file_strerror.c /usr/src/debug/libzip/1.11.4/lib/zip_set_archive_flag.c /usr/src/debug/libzip/1.11.4/lib/zip_source_get_dostime.c /usr/src/debug/libzip/1.11.4/lib/zip_error_get.c /usr/src/debug/libzip/1.11.4/lib/zip_get_num_files.c /usr/src/debug/libzip/1.11.4/lib/zip_source_crc.c /usr/src/debug/libzip/1.11.4/lib/zip_source_zip.c /usr/src/debug/libzip/1.11.4/lib/zip_buffer.c /usr/src/debug/libzip/1.11.4/lib/zip_realloc.c /usr/src/debug/libzip/1.11.4/lib/zip_file_error_get.c /usr/src/debug/libzip/1.11.4/lib/zip_file_get_external_attributes.c /usr/src/debug/libzip/1.11.4/lib/zip_file_set_external_attributes.c /usr/src/debug/libzip/1.11.4/lib/zip_fdopen.c /usr/src/debug/libzip/1.11.4/lib/zip_file_set_mtime.c", added "/usr/src/debug/libzip/1.12/lib/zip_source_file_stdio.h /usr/src/debug/libzip/1.12/lib/zip_source_file_stdio.c /usr/src/
 debug/libzip/1.12/lib/zip_get_num_files.c /usr/src/debug/libzip/1.12/lib/zip_source_commit_write.c /usr/src/debug/libzip/1.12/lib/zip_source_zip_new.c /usr/src/debug/libzip/1.12/lib/zip_source_read.c /usr/src/debug/libzip/1.12/lib/zip_fopen_index.c /usr/src/debug/libzip/1.12/lib/compat.h /usr/src/debug/libzip/1.12/lib/zip_progress.c /usr/src/debug/libzip/1.12/lib/zip_source_pkware_encode.c /usr/src/debug/libzip/1.12/lib/zip_source_seek_write.c /usr/src/debug/libzip/1.12/lib/zip_source_tell_write.c /usr/src/debug/libzip/1.12/lib/zip_get_archive_flag.c /usr/src/debug/libzip/1.12/lib/zip_set_archive_flag.c /usr/src/debug/libzip/1.12/lib/zip_source_layered.c /usr/src/debug/libzip/1.12/lib/zip_error_to_str.c /usr/src/debug/libzip/1.12/lib/zip_get_name.c /usr/src/debug/libzip/1.12/lib/zip_extra_field.c /usr/src/debug/libzip/1.12/lib/zip_set_name.c /usr/src/debug/libzip/1.12/lib/zip_source_open.c /usr/src/debug/libzip/1.12/lib/zip_io_util.c /usr/src/debug/libzip/1.12/lib/zip_source_zip.c /
 usr/src/debug/libzip/1.12/lib/zip_hash.c /usr/src/debug/libzip/1.12/lib/zip_open.c /usr/src/debug/libzip/1.12/lib/zip_stat.c /usr/src/debug/libzip/1.12/lib/zip_file_set_comment.c /usr/src/debug/libzip/1.12/lib/zip_delete.c /usr/src/debug/libzip/1.12/lib/zip_fclose.c /usr/src/debug/libzip/1.12/lib/zip_pkware.c /usr/src/debug/libzip/1.12/lib/zip_realloc.c /usr/src/debug/libzip/1.12/lib/zip_rename.c /usr/src/debug/libzip/1.12/lib/zip_stat_init.c /usr/src/debug/libzip/1.12/lib/zip_source_stat.c /usr/src/debug/libzip/1.12/lib/zip_algorithm_deflate.c /usr/src/debug/libzip/1.12/lib/zip_crypto.c /usr/src/debug/libzip/1.12/lib/zip_winzip_aes.c /usr/src/debug/libzip/1.12/lib/zip_source_accept_empty.c /usr/src/debug/libzip/1.12/lib/siphash.c /usr/src/debug/libzip/1.12/lib/zip_crypto_openssl.c /usr/src/debug/libzip/1.12/lib/zip_file_get_comment.c /usr/src/debug/libzip/1.12/lib/zip_string.c /usr/src/debug/libzip/1.12/lib/zip_crypto_openssl.h /usr/src/debug/libzip/1.12/lib/siphash.h /usr/src/debu
 g/libzip/1.12/lib/zip_set_default_password.c /usr/src/debug/libzip/1.12/lib/zip_file_error_get.c /usr/src/debug/libzip/1.12/lib/zip_algorithm_bzip2.c /usr/src/debug/libzip/1.12/lib/zip_source_begin_write.c /usr/src/debug/libzip/1.12/lib/zip_source_get_dostime.c /usr/src/debug/libzip/1.12/lib/zip_source_get_file_attributes.c /usr/src/debug/libzip/1.12/lib/zip_replace.c /usr/src/debug/libzip/1.12/lib/zip_fopen_encrypted.c /usr/src/debug/libzip/1.12/lib/zip_name_locate.c /usr/src/debug/libzip/1.12/lib/zip_stat_index.c /usr/src/debug/libzip/1.12/lib/zip_source_crc.c /usr/src/debug/libzip/1.12/lib/zip_source_free.c /usr/src/debug/libzip/1.12/lib/zip_source_seek.c /usr/src/debug/libzip/1.12/lib/zip_file_error_clear.c /usr/src/debug/libzip/1.12/lib/zip_source_pass_to_lower_layer.c /usr/src/debug/libzip/1.12/lib/zip_fdopen.c /usr/src/debug/libzip/1.12/lib/zip_file_replace.c /usr/src/debug/libzip/1.12/lib/zip_add_entry.c /usr/src/debug/libzip/1.12/lib/zip_fopen_index_encrypted.c /usr/src/deb
 ug/libzip/1.12/lib/zip_file_set_mtime.c /usr/src/debug/libzip/1.12/lib/zip_source_pkware_decode.c /usr/src/debug/libzip/1.12/lib/zip_error_get.c /usr/src/debug/libzip/1.12/lib/zip_source_supports.c /usr/src/debug/libzip/1.12/lib/zip_error_strerror.c /usr/src/debug/libzip/1.12/lib/zip_add.c /usr/src/debug/libzip/1.12/lib/zip_source_compress.c /usr/src/debug/libzip/1.12/lib/zip_file_strerror.c /usr/src/debug/libzip/1.12/lib/zip_source_call.c /usr/src/debug/libzip/1.12/lib/zip_libzip_version.c /usr/src/debug/libzip/1.12/lib/zip_source_is_deleted.c /usr/src/debug/libzip/1.12/lib/zip_new.c /usr/src/debug/libzip/1.12/lib/zip_err_str.c /usr/src/debug/libzip/1.12/lib/zip_source_file_stdio_named.c /usr/src/debug/libzip/1.12/lib/zip_source_file_common.c /usr/src/debug/libzip/1.12/lib/zip_extra_field_api.c /usr/src/debug/libzip/1.12/lib/zip_utf-8.c /usr/src/debug/libzip/1.12/lib/zip_fseek.c /usr/src/debug/libzip/1.12/lib/zip_ftell.c /usr/src/debug/libzip/1.12/lib/zip_close.c /usr/src/debug/lib
 zip/1.12/lib/zip_entry.c /usr/src/debug/libzip/1.12/lib/zip_error.c /usr/src/debug/libzip/1.12/lib/zip_fopen.c /usr/src/debug/libzip/1.12/lib/zip_fread.c /usr/src/debug/libzip/1.12/lib/zip_source_at_eof.c /usr/src/debug/libzip/1.12/lib/zip_source_buffer.c /usr/src/debug/libzip/1.12/lib/zip_source_remove.c /usr/src/debug/libzip/1.12/lib/zip_source_window.c /usr/src/debug/libzip/1.12/lib/zip_source_winzip_aes_decode.c /usr/src/debug/libzip/1.12/lib/zip_source_winzip_aes_encode.c /usr/src/debug/libzip/1.12/lib/zip_get_num_entries.c /usr/src/debug/libzip/1.12/lib/zip_set_file_compression.c /usr/src/debug/libzip/1.12/lib/zip_strerror.c /usr/src/debug/libzip/1.12/lib/zip_add_dir.c /usr/src/debug/libzip/1.12/lib/zip_file_get_offset.c /usr/src/debug/libzip/1.12/lib/zip_file_rename.c /usr/src/debug/libzip/1.12/lib/zip_file_set_external_attributes.c /usr/src/debug/libzip/1.12/lib/zip_get_archive_comment.c /usr/src/debug/libzip/1.12/lib/zip_set_archive_comment.c /usr/src/debug/libzip/1.12/lib/
 zip.h /usr/src/debug/libzip/1.12/lib/zip_memdup.c /usr/src/debug/libzip/1.12/lib/zip_unchange_all.c /usr/src/debug/libzip/1.12/lib/zip_file_get_external_attributes.c /usr/src/debug/libzip/1.12/lib/zip_file_set_encryption.c /usr/src/debug/libzip/1.12/lib/zip_get_encryption_implementation.c /usr/src/debug/libzip/1.12/lib/zip_dirent.c /usr/src/debug/libzip/1.12/lib/zip_dir_add.c /usr/src/debug/libzip/1.12/lib/zip_discard.c /usr/src/debug/libzip/1.12/lib/zip_get_file_comment.c /usr/src/debug/libzip/1.12/lib/zip_set_file_comment.c /usr/src/debug/libzip/1.12/lib/zip_source_begin_write_cloning.c /usr/src/debug/libzip/1.12/lib/zip_random_unix.c /usr/src/debug/libzip/1.12/lib/zip_buffer.c /usr/src/debug/libzip/1.12/lib/zip_source_function.c /usr/src/debug/libzip/1.12/lib/zip_unchange_archive.c /usr/src/debug/libzip/1.12/lib/zip_error_get_sys_type.c /usr/src/debug/libzip/1.12/lib/zip_unchange_data.c /usr/src/debug/libzip/1.12/lib/zipint.h /usr/src/debug/libzip/1.12/lib/zip_source_tell.c /usr/
 src/debug/libzip/1.12/lib/zip_source_rollback_write.c /usr/src/debug/libzip/1.12/lib/zip_unchange.c /usr/src/debug/libzip/1.12/lib/zip_source_close.c /usr/src/debug/libzip/1.12/lib/zip_source_error.c /usr/src/debug/libzip/1.12/lib/zip_source_write.c /usr/src/debug/libzip/1.12/lib/zip_error_clear.c /usr/src/debug/libzip/1.12/lib/zip_algorithm_xz.c /usr/src/debug/libzip/1.12/lib/zip_source_file.h /usr/src/debug/libzip/1.12/lib/zip_file_add.c"
packages/x86-64-v3-poky-linux/libzip/libzip-staticdev: PV changed from "1.11.4" to "1.12"
packages/x86-64-v3-poky-linux/libzip/libzip-staticdev: PKGV changed from 1.11.4 [default] to 1.12 [default]
packages/x86-64-v3-poky-linux/libzip/libzip: PV changed from "1.11.4" to "1.12"
packages/x86-64-v3-poky-linux/libzip/libzip: PKGV changed from 1.11.4 [default] to 1.12 [default]
packages/x86-64-v3-poky-linux/libzip/libzip: PKGSIZE changed from 228917 to 237109 (+4%)
packages/x86-64-v3-poky-linux/libzip/libzip: FILELIST: removed "/usr/lib/libzip.so.5.5", added "/usr/lib/libzip.so.5.6"
Changes to packages/x86-64-v3-poky-linux/libzip (sysroot):
  /usr/lib/libzip.so.5 changed symlink target from libzip.so.5.5 to libzip.so.5.6
  /usr/lib/libzip.so.5.5 moved to /usr/lib/libzip.so.5.6
  /usr/lib/cmake/libzip/modules/FindMbedTLS.cmake was removed

--===============2806465860832588331==--

