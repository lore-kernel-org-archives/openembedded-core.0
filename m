Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8B8C44507
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:50:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.168346.1783403394367065018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JK0VMTxV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k3SOWp/U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f3b2030f1-74e275a1-3e7b-41b2-8266-7a289156e6ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783403393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A+cgvynith9aGDvuZ6JbhoHTf+sXwi3ttxqO6sdyrVM=;
	b=JK0VMTxVDdw5vZ0Rd5SwSTXuvhJEjW15yOBzZAdvZCvwxFdwlhOJ40hKKdvBJo2i
	vdsKnMjR/S22O7fot1qlec8Ps8hDnv70jtK6iEfHByGMD6GMIduJvAfIc7z3dGnmjiI
	KQAJoPCCcDZr7ffGBbVcLfeo8o39tYfAWx+A/si4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783403393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A+cgvynith9aGDvuZ6JbhoHTf+sXwi3ttxqO6sdyrVM=;
	b=k3SOWp/UWI/dGJ+egIDGO0xudDqipxuSKzsDn2NhMDOZe543uRCrSFQenGTmWcZS
	gPDFFRZLHHWjcA4002BVR20NeA6PaJYVr0eXenjMW8yvFYSHtMPazJRGwRMqCHCaSrs
	btutH8AW08FvEWQhU44Qy6v4J8GToMvz8NkggCfU=
Content-Type: multipart/mixed; boundary="===============4248421554173149491=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2026.92 SUCCEEDED
Message-ID: <0101019f3b2030f1-74e275a1-3e7b-41b2-8266-7a289156e6ef-000000@us-west-2.amazonses.com>
Date: Tue, 7 Jul 2026 05:49:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.07-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240353

--===============4248421554173149491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dropbear* to *2026.92* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2026.91-2026.92.patch
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
From 080fb7c083ffa4e2dc925d8e02e78861fade21fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 7 Jul 2026 05:27:39 +0000
Subject: [PATCH] dropbear: upgrade 2026.91 -> 2026.92

---
 .../0001-urandom-xauth-changes-to-options.h.patch         | 6 +++---
 .../dropbear/dropbear/0005-dropbear-enable-pam.patch      | 8 ++++----
 .../dropbear/0006-dropbear-configuration-file.patch       | 2 +-
 .../dropbear/{dropbear_2026.91.bb => dropbear_2026.92.bb} | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear_2026.91.bb => dropbear_2026.92.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index a662230b88..b0f8e61998 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,4 @@
-From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From e5f6c6e8d2b6315e509c610e7d13e7dd2b465a85 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Wed, 31 Aug 2005 10:45:47 +0000
 Subject: [PATCH] urandom-xauth-changes-to-options.h
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index 6e970bb..ccc8b47 100644
+index ffaf062..2eb7de1 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -323,7 +323,7 @@ group1 in Dropbear server too */
+@@ -347,7 +347,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 6743f506e9..bfb78b1ee1 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,4 +1,4 @@
-From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
+From dce5d03ed4d28c6374e593b7ef2cc4688f795fbd Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
 Subject: [PATCH] Enable pam
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index ccc8b47..12768d1 100644
+index 2eb7de1..be85bee 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -228,7 +228,7 @@ group1 in Dropbear server too */
+@@ -240,7 +240,7 @@ group1 in Dropbear server too */
  
  /* Authentication Types - at least one required.
     RFC Draft requires pubkey auth, and recommends password */
@@ -27,7 +27,7 @@ index ccc8b47..12768d1 100644
  
  /* Note: PAM auth is quite simple and only works for PAM modules which just do
   * a simple "Login: " "Password: " (you can edit the strings in svr-authpam.c).
-@@ -236,7 +236,7 @@ group1 in Dropbear server too */
+@@ -248,7 +248,7 @@ group1 in Dropbear server too */
   * but there's an interface via a PAM module. It won't work for more complex
   * PAM challenge/response.
   * You can't enable both PASSWORD and PAM. */
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index 44861088cc..7509efb88c 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
+From 50d64008f722f0f9719fc6c1b44582316022b93e Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
diff --git a/meta/recipes-core/dropbear/dropbear_2026.91.bb b/meta/recipes-core/dropbear/dropbear_2026.92.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2026.91.bb
rename to meta/recipes-core/dropbear/dropbear_2026.92.bb
index cdddd64fe2..44a4dcde03 100644
--- a/meta/recipes-core/dropbear/dropbear_2026.91.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.92.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34"
+SRC_URI[sha256sum] = "91dcb5234de8dea68dd82c55411c9fc986b457ab58372a780ee8a870419c2f7e"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
-- 
2.47.1


--===============4248421554173149491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGV changed from 2026.91 [default] to 2026.92 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGSIZE changed from 1939632 to 1940104 (+0%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PV changed from "2026.91" to "2026.92"
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PKGV changed from 2026.91 [default] to 2026.92 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PV changed from "2026.91" to "2026.92"
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PKGV changed from 2026.91 [default] to 2026.92 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PV changed from "2026.91" to "2026.92"
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PKGV changed from 2026.91 [default] to 2026.92 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PV changed from "2026.91" to "2026.92"
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGV changed from 2026.91 [default] to 2026.92 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGSIZE changed from 2005289 to 2007294 (+0%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PV changed from "2026.91" to "2026.92"
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: FILELIST: directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/misc -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/misc, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/mac/hmac -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/mac/hmac, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/headers -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/headers, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/modes/ctr -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/modes/ctr, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/hashes/helper -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/hashes/helper, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/pk/ecc -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/pk/ecc, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/ciphers/aes -> /usr/src/debug/dropbear/2026.92/libtomcr
 ypt/src/ciphers/aes, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/misc/base64 -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/misc/base64, directory renamed /usr/src/debug/dropbear/2026.91/libtommath -> /usr/src/debug/dropbear/2026.92/libtommath, directory renamed /usr/src/debug/dropbear/2026.91/src -> /usr/src/debug/dropbear/2026.92/src, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/misc/crypt -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/misc/crypt, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/mac/poly1305 -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/mac/poly1305, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/math -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/math, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/hashes/sha2 -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/hashes/sha2, directory renamed /usr/src/debug/dropbear/2026.91/libtomcrypt/src/stream/chach
 a -> /usr/src/debug/dropbear/2026.92/libtomcrypt/src/stream/chacha
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PKGV changed from 2026.91 [default] to 2026.92 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PV changed from "2026.91" to "2026.92"
packages/x86-64-v3-poky-linux/dropbear/dropbear: PKGV changed from 2026.91 [default] to 2026.92 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear: PV changed from "2026.91" to "2026.92"
packages/x86-64-v3-poky-linux/dropbear: SRC_URI changed from "http://matt.ucc.asn.au/dropbear/releases/dropbear-2026.91.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear" to "http://matt.ucc.asn.au/dropbear/releases/dropbear-2026.92.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear"
packages/x86-64-v3-poky-linux/dropbear: PKGV changed from 2026.91 [default] to 2026.92 [default]
packages/x86-64-v3-poky-linux/dropbear: PV changed from "2026.91" to "2026.92"

--===============4248421554173149491==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2026.91-2026.92.patch"

RnJvbSAwODBmYjdjMDgzZmZhNGUyZGM5MjVkOGUwMmU3ODg2MWZhZGUyMWZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNyBKdWwgMjAyNiAwNToyNzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRy
b3BiZWFyOiB1cGdyYWRlIDIwMjYuOTEgLT4gMjAyNi45MgoKLS0tCiAuLi4vMDAwMS11cmFuZG9t
LXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoICAgICAgICAgfCA2ICsrKy0tLQogLi4u
L2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCAgICAgIHwg
OCArKysrLS0tLQogLi4uL2Ryb3BiZWFyLzAwMDYtZHJvcGJlYXItY29uZmlndXJhdGlvbi1maWxl
LnBhdGNoICAgICAgIHwgMiArLQogLi4uL2Ryb3BiZWFyL3tkcm9wYmVhcl8yMDI2LjkxLmJiID0+
IGRyb3BiZWFyXzIwMjYuOTIuYmJ9IHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIv
e2Ryb3BiZWFyXzIwMjYuOTEuYmIgPT4gZHJvcGJlYXJfMjAyNi45Mi5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDAxLXVyYW5kb20t
eGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9w
YmVhci9kcm9wYmVhci8wMDAxLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0
Y2gKaW5kZXggYTY2MjIzMGI4OC4uYjBmOGU2MTk5OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0
aW9ucy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAw
MDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gY2RjNmE0YTU3YTg2ZDgxMTZhOTJhNWQ5MDU5OTNlNjVjZjcyMzU1NiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTVmNmM2ZThkMmI2MzE1ZTUwOWM2MTBlN2QxM2U3ZGQy
YjQ2NWE4NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkQG9wZW5lZGhhbmQuY29tPgogRGF0ZTogV2VkLCAzMSBBdWcgMjAwNSAxMDo0NTo0NyAr
MDAwMAogU3ViamVjdDogW1BBVENIXSB1cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5o
CkBAIC05LDEwICs5LDEwIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmln
dXJhdGlvbl0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL3NyYy9kZWZhdWx0X29wdGlvbnMuaCBiL3NyYy9kZWZhdWx0X29wdGlv
bnMuaAotaW5kZXggNmU5NzBiYi4uY2NjOGI0NyAxMDA2NDQKK2luZGV4IGZmYWYwNjIuLjJlYjdk
ZTEgMTAwNjQ0CiAtLS0gYS9zcmMvZGVmYXVsdF9vcHRpb25zLmgKICsrKyBiL3NyYy9kZWZhdWx0
X29wdGlvbnMuaAotQEAgLTMyMyw3ICszMjMsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2VydmVy
IHRvbyAqLworQEAgLTM0Nyw3ICszNDcsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2VydmVyIHRv
byAqLwogIAogIC8qIFRoZSBjb21tYW5kIHRvIGludm9rZSBmb3IgeGF1dGggd2hlbiB1c2luZyBY
MTEgZm9yd2FyZGluZy4KICAgKiAiLXEiIGZvciBxdWlldCAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1lbmFibGUtcGFtLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1l
bmFibGUtcGFtLnBhdGNoCmluZGV4IDY3NDNmNTA2ZTkuLmJmYjc4YjFlZTEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxl
LXBhbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA1
LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI1M2NhMDFm
MGZjNTBkYmFlYjJmZjhiY2VjZTBjMzQyNTZlYmE5NGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGRjZTVkMDNlZDRkMjhjNjM3NGU1OTNiN2VmMmNjNDY4OGY3OTVmYmQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50
ZWwuY29tPgogRGF0ZTogV2VkLCAyIERlYyAyMDE1IDExOjM2OjAyICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIEVuYWJsZSBwYW0KQEAgLTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKdXNz
aSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZGVmYXVs
dF9vcHRpb25zLmggYi9zcmMvZGVmYXVsdF9vcHRpb25zLmgKLWluZGV4IGNjYzhiNDcuLjEyNzY4
ZDEgMTAwNjQ0CitpbmRleCAyZWI3ZGUxLi5iZTg1YmVlIDEwMDY0NAogLS0tIGEvc3JjL2RlZmF1
bHRfb3B0aW9ucy5oCiArKysgYi9zcmMvZGVmYXVsdF9vcHRpb25zLmgKLUBAIC0yMjgsNyArMjI4
LDcgQEAgZ3JvdXAxIGluIERyb3BiZWFyIHNlcnZlciB0b28gKi8KK0BAIC0yNDAsNyArMjQwLDcg
QEAgZ3JvdXAxIGluIERyb3BiZWFyIHNlcnZlciB0b28gKi8KICAKICAvKiBBdXRoZW50aWNhdGlv
biBUeXBlcyAtIGF0IGxlYXN0IG9uZSByZXF1aXJlZC4KICAgICBSRkMgRHJhZnQgcmVxdWlyZXMg
cHVia2V5IGF1dGgsIGFuZCByZWNvbW1lbmRzIHBhc3N3b3JkICovCkBAIC0yNyw3ICsyNyw3IEBA
IGluZGV4IGNjYzhiNDcuLjEyNzY4ZDEgMTAwNjQ0CiAgCiAgLyogTm90ZTogUEFNIGF1dGggaXMg
cXVpdGUgc2ltcGxlIGFuZCBvbmx5IHdvcmtzIGZvciBQQU0gbW9kdWxlcyB3aGljaCBqdXN0IGRv
CiAgICogYSBzaW1wbGUgIkxvZ2luOiAiICJQYXNzd29yZDogIiAoeW91IGNhbiBlZGl0IHRoZSBz
dHJpbmdzIGluIHN2ci1hdXRocGFtLmMpLgotQEAgLTIzNiw3ICsyMzYsNyBAQCBncm91cDEgaW4g
RHJvcGJlYXIgc2VydmVyIHRvbyAqLworQEAgLTI0OCw3ICsyNDgsNyBAQCBncm91cDEgaW4gRHJv
cGJlYXIgc2VydmVyIHRvbyAqLwogICAqIGJ1dCB0aGVyZSdzIGFuIGludGVyZmFjZSB2aWEgYSBQ
QU0gbW9kdWxlLiBJdCB3b24ndCB3b3JrIGZvciBtb3JlIGNvbXBsZXgKICAgKiBQQU0gY2hhbGxl
bmdlL3Jlc3BvbnNlLgogICAqIFlvdSBjYW4ndCBlbmFibGUgYm90aCBQQVNTV09SRCBhbmQgUEFN
LiAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAw
Ni1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9k
cm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaApp
bmRleCA0NDg2MTA4OGNjLi43NTA5ZWZiODhjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFy
LWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTZiMTQ3Zjk3
ZjA5MzhjZGRiNTVlYzFjOTBiYzkxOWMxM2YyNmZjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNTBkNjQwMDhmNzIyZjBmOTcxOWZjNmMxYjQ0NTgyMzE2MDIyYjkzZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8TWluZ2xpLll1QHdpbmRyaXZlci5jb20+
CiBEYXRlOiBUaHUsIDYgU2VwIDIwMTggMTU6NTQ6MDAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
ZHJvcGJlYXIgY29uZmlndXJhdGlvbiBmaWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI2LjkxLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJl
YXIvZHJvcGJlYXJfMjAyNi45Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI2LjkxLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI2LjkyLmJiCmluZGV4IGNkZGRk
NjRmZTIuLjQ0YTRkY2RlMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFy
L2Ryb3BiZWFyXzIwMjYuOTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJv
cGJlYXJfMjAyNi45Mi5iYgpAQCAtMjcsNyArMjcsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9tYXR0
LnVjYy5hc24uYXUvZHJvcGJlYXIvcmVsZWFzZXMvZHJvcGJlYXItJHtQVn0udGFyLmJ6MiBcCiAg
ICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywg
JyR7UEFNX1NSQ19VUkl9JywgJycsIGQpfSBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImRlZmE5MjQ0NzVhYmY2YmMxZTc0YWJjMDAxNzNlNDZiZmRjODA0YmQ0N2NhYWZh
MTRmNWE0ZWYwY2M3NmRhMzQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTFkY2I1MjM0ZGU4ZGVh
NjhkZDgyYzU1NDExYzlmYzk4NmI0NTdhYjU4MzcyYTc4MGVlOGE4NzA0MTljMmY3ZSIKIE1JUlJP
UlMgKz0gImh0dHA6Ly9tYXR0LnVjYy5hc24uYXUvZHJvcGJlYXIvcmVsZWFzZXMvIGh0dHBzOi8v
ZHJvcGJlYXIubmwvbWlycm9yL3JlbGVhc2VzLyIKIAogUEFNX1NSQ19VUkkgPSAiZmlsZTovLzAw
MDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCBcCi0tIAoyLjQ3LjEKCg==

--===============4248421554173149491==--

