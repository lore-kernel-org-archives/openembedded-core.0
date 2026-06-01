Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3C3CD6E78
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:42 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1562.1780328133923791036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EaK0wt1a;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oPFhPGJY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e83d37238-9eeb41b8-db2c-4d57-a468-693f2c680099-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hgVW3FB4cygCWH7O9OVwXf+CY7wGNFOttRDEaFv29cM=;
	b=EaK0wt1aRO6btLlY0O+wEcQ3vpW4tsW0aq/AFKxXeOKwM6nKCrKkv2QAepU55yyF
	xxksvP9qEuMIrdqNfytjF4K05r+wF+sy9STcPQKpvuTno55lfOxz3AX+c5EGIFXj+Q7
	J6Bw/upmVyJCe/FvS3+ZcMhU4KTwzqq4p8OMlTv8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hgVW3FB4cygCWH7O9OVwXf+CY7wGNFOttRDEaFv29cM=;
	b=oPFhPGJY1HnM3bjqMfntu4M4JS9ZUPrRJnlQXOAvJGzaQeXVBdcLLz3VSL5mEX7z
	qrXABIKmjMzku62ppBjYw8/EeZ9b9C6irU694MikQknpvLZNvVKSVJnTwq9pyBPGhY8
	DCQR+2bPs1c7MvY/kzzGuS/iH8RZOZC72ftPxdQY=
Content-Type: multipart/mixed; boundary="===============8601330732085249820=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2026.91 SUCCEEDED
Message-ID: <0101019e83d37238-9eeb41b8-db2c-4d57-a468-693f2c680099-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237861

--===============8601330732085249820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dropbear* to *2026.91* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2025.89-2026.91.patch
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
From e8302c17d13bb1c8f5ec60b4570cf396acb87adf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 07:30:53 +0000
Subject: [PATCH] dropbear: upgrade 2025.89 -> 2026.91

---
 .../0001-urandom-xauth-changes-to-options.h.patch         | 6 +++---
 .../dropbear/dropbear/0005-dropbear-enable-pam.patch      | 8 ++++----
 .../dropbear/0006-dropbear-configuration-file.patch       | 2 +-
 .../dropbear/{dropbear_2025.89.bb => dropbear_2026.91.bb} | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear_2025.89.bb => dropbear_2026.91.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index a662230b88..f24fe9f5d8 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,4 @@
-From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From 869deafce9f13f11ebe3701841beb1af4a6066ca Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Wed, 31 Aug 2005 10:45:47 +0000
 Subject: [PATCH] urandom-xauth-changes-to-options.h
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index 6e970bb..ccc8b47 100644
+index e49dc70..c5a28a8 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -323,7 +323,7 @@ group1 in Dropbear server too */
+@@ -347,7 +347,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 6743f506e9..a8836bbe57 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,4 +1,4 @@
-From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
+From 8530918fa1d55a03ed0516b549dbc01ed90e5d7a Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
 Subject: [PATCH] Enable pam
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index ccc8b47..12768d1 100644
+index c5a28a8..a9802e5 100644
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
index 44861088cc..cd2d1d08a9 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
+From da580301186acb3a367f743318fcc685c3e553e6 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2026.91.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2025.89.bb
rename to meta/recipes-core/dropbear/dropbear_2026.91.bb
index 957a0901fb..80015cc964 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.91.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
+SRC_URI[sha256sum] = "defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
-- 
2.47.1


--===============8601330732085249820==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2025.89-2026.91.patch"

RnJvbSBlODMwMmMxN2QxM2JiMWM4ZjVlYzYwYjQ1NzBjZjM5NmFjYjg3YWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNzozMDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRy
b3BiZWFyOiB1cGdyYWRlIDIwMjUuODkgLT4gMjAyNi45MQoKLS0tCiAuLi4vMDAwMS11cmFuZG9t
LXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoICAgICAgICAgfCA2ICsrKy0tLQogLi4u
L2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCAgICAgIHwg
OCArKysrLS0tLQogLi4uL2Ryb3BiZWFyLzAwMDYtZHJvcGJlYXItY29uZmlndXJhdGlvbi1maWxl
LnBhdGNoICAgICAgIHwgMiArLQogLi4uL2Ryb3BiZWFyL3tkcm9wYmVhcl8yMDI1Ljg5LmJiID0+
IGRyb3BiZWFyXzIwMjYuOTEuYmJ9IHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIv
e2Ryb3BiZWFyXzIwMjUuODkuYmIgPT4gZHJvcGJlYXJfMjAyNi45MS5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDAxLXVyYW5kb20t
eGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9w
YmVhci9kcm9wYmVhci8wMDAxLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0
Y2gKaW5kZXggYTY2MjIzMGI4OC4uZjI0ZmU5ZjVkOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0
aW9ucy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAw
MDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gY2RjNmE0YTU3YTg2ZDgxMTZhOTJhNWQ5MDU5OTNlNjVjZjcyMzU1NiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODY5ZGVhZmNlOWYxM2YxMWViZTM3MDE4NDFiZWIxYWY0
YTYwNjZjYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkQG9wZW5lZGhhbmQuY29tPgogRGF0ZTogV2VkLCAzMSBBdWcgMjAwNSAxMDo0NTo0NyAr
MDAwMAogU3ViamVjdDogW1BBVENIXSB1cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5o
CkBAIC05LDEwICs5LDEwIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmln
dXJhdGlvbl0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL3NyYy9kZWZhdWx0X29wdGlvbnMuaCBiL3NyYy9kZWZhdWx0X29wdGlv
bnMuaAotaW5kZXggNmU5NzBiYi4uY2NjOGI0NyAxMDA2NDQKK2luZGV4IGU0OWRjNzAuLmM1YTI4
YTggMTAwNjQ0CiAtLS0gYS9zcmMvZGVmYXVsdF9vcHRpb25zLmgKICsrKyBiL3NyYy9kZWZhdWx0
X29wdGlvbnMuaAotQEAgLTMyMyw3ICszMjMsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2VydmVy
IHRvbyAqLworQEAgLTM0Nyw3ICszNDcsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2VydmVyIHRv
byAqLwogIAogIC8qIFRoZSBjb21tYW5kIHRvIGludm9rZSBmb3IgeGF1dGggd2hlbiB1c2luZyBY
MTEgZm9yd2FyZGluZy4KICAgKiAiLXEiIGZvciBxdWlldCAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1lbmFibGUtcGFtLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1l
bmFibGUtcGFtLnBhdGNoCmluZGV4IDY3NDNmNTA2ZTkuLmE4ODM2YmJlNTcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxl
LXBhbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA1
LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI1M2NhMDFm
MGZjNTBkYmFlYjJmZjhiY2VjZTBjMzQyNTZlYmE5NGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDg1MzA5MThmYTFkNTVhMDNlZDA1MTZiNTQ5ZGJjMDFlZDkwZTVkN2EgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50
ZWwuY29tPgogRGF0ZTogV2VkLCAyIERlYyAyMDE1IDExOjM2OjAyICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIEVuYWJsZSBwYW0KQEAgLTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKdXNz
aSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZGVmYXVs
dF9vcHRpb25zLmggYi9zcmMvZGVmYXVsdF9vcHRpb25zLmgKLWluZGV4IGNjYzhiNDcuLjEyNzY4
ZDEgMTAwNjQ0CitpbmRleCBjNWEyOGE4Li5hOTgwMmU1IDEwMDY0NAogLS0tIGEvc3JjL2RlZmF1
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
bmRleCA0NDg2MTA4OGNjLi5jZDJkMWQwOGE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFy
LWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTZiMTQ3Zjk3
ZjA5MzhjZGRiNTVlYzFjOTBiYzkxOWMxM2YyNmZjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZGE1ODAzMDExODZhY2IzYTM2N2Y3NDMzMThmY2M2ODVjM2U1NTNlNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8TWluZ2xpLll1QHdpbmRyaXZlci5jb20+
CiBEYXRlOiBUaHUsIDYgU2VwIDIwMTggMTU6NTQ6MDAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
ZHJvcGJlYXIgY29uZmlndXJhdGlvbiBmaWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI1Ljg5LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJl
YXIvZHJvcGJlYXJfMjAyNi45MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI1Ljg5LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI2LjkxLmJiCmluZGV4IDk1N2Ew
OTAxZmIuLjgwMDE1Y2M5NjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFy
L2Ryb3BiZWFyXzIwMjUuODkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJv
cGJlYXJfMjAyNi45MS5iYgpAQCAtMjIsNyArMjIsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9tYXR0
LnVjYy5hc24uYXUvZHJvcGJlYXIvcmVsZWFzZXMvZHJvcGJlYXItJHtQVn0udGFyLmJ6MiBcCiAg
ICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywg
JyR7UEFNX1NSQ19VUkl9JywgJycsIGQpfSBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjBkMWY3Y2E3MTFjZmMzMzZkYzhhODVlNjcyY2FiOWNmZDgyMjNhMDJmZTJkYTBh
NGE3YWViNThjOWUxMTM2MzQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGVmYTkyNDQ3NWFiZjZi
YzFlNzRhYmMwMDE3M2U0NmJmZGM4MDRiZDQ3Y2FhZmExNGY1YTRlZjBjYzc2ZGEzNCIKIE1JUlJP
UlMgKz0gImh0dHA6Ly9tYXR0LnVjYy5hc24uYXUvZHJvcGJlYXIvcmVsZWFzZXMvIGh0dHBzOi8v
ZHJvcGJlYXIubmwvbWlycm9yL3JlbGVhc2VzLyIKIAogUEFNX1NSQ19VUkkgPSAiZmlsZTovLzAw
MDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCBcCi0tIAoyLjQ3LjEKCg==

--===============8601330732085249820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PKGSIZE changed from 1890232 to 1939624 (+3%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-dbg: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-dev: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-doc: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-locale: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: FILELIST: directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/misc/base64 -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/misc/base64, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/ciphers/aes -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/ciphers/aes, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/hashes/helper -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/hashes/helper, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/modes/ctr -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/modes/ctr, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/pk/ecc -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/pk/ecc, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/mac/hmac -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/mac/hmac, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/misc -> /usr/src/debug/dropbear/2
 026.91/libtomcrypt/src/misc, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/headers -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/headers, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/stream/chacha -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/stream/chacha, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/mac/poly1305 -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/mac/poly1305, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/hashes/sha2 -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/hashes/sha2, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/math -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/math, directory renamed /usr/src/debug/dropbear/2025.89/libtomcrypt/src/misc/crypt -> /usr/src/debug/dropbear/2026.91/libtomcrypt/src/misc/crypt, removed "/usr/src/debug/dropbear/2025.89/src/cli-authinteract.c /usr/src/debug/dropbear/2025.89/src/agentfwd.h /usr/src/debug/dropbear
 /2025.89/libtommath/bn_mp_prime_rabin_miller_trials.c /usr/src/debug/dropbear/2025.89/src/svr-agentfwd.c /usr/src/debug/dropbear/2025.89/src/cli-agentfwd.c /usr/src/debug/dropbear/2025.89/src/kex-dh.c /usr/src/debug/dropbear/2025.89/src/dbmalloc.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div_3.c /usr/src/debug/dropbear/2025.89/src/queue.c /usr/src/debug/dropbear/2025.89/libtommath/bn_prime_tab.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_montgomery_reduce_fast.c /usr/src/debug/dropbear/2025.89/src/common-chansession.c /usr/src/debug/dropbear/2025.89/src/dbmalloc.h /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_add.c /usr/src/debug/dropbear/2025.89/src/queue.h /usr/src/debug/dropbear/2025.89/src/kex-x25519.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_mul_digs_fast.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_mul_high_digs.c /usr/src/debug/dropbear/2025.89/libtommath/tommath_private.h /usr/src/debug/dropbear/2025.89/src/cli-auth.c /usr/src/debug/dro
 pbear/2025.89/src/ecc.h /usr/src/debug/dropbear/2025.89/src/kex.h /usr/src/debug/dropbear/2025.89/src/rsa.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_prime_is_prime.c /usr/src/debug/dropbear/2025.89/src/signkey.h /usr/src/debug/dropbear/2025.89/src/cli-tcpfwd.c /usr/src/debug/dropbear/2025.89/src/signkey_ossh.h /usr/src/debug/dropbear/2025.89/libtommath/bn_cutoffs.c /usr/src/debug/dropbear/2025.89/src/signkey.c /usr/src/debug/dropbear/2025.89/src/signkey_ossh.c /usr/src/debug/dropbear/2025.89/src/ecc.c /usr/src/debug/dropbear/2025.89/src/rsa.c /usr/src/debug/dropbear/2025.89/src/scp.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_clear_multi.c /usr/src/debug/dropbear/2025.89/src/svr-tcpfwd.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_is_2k.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_2k.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_neg.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_reverse.c /usr/src/debug/dropbear/2025.89/src/svr-authp
 ubkeyoptions.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_from_ubin.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_to_radix.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_invmod_fast.c /usr/src/debug/dropbear/2025.89/src/sk-ecdsa.c /usr/src/debug/dropbear/2025.89/src/runopts.h /usr/src/debug/dropbear/2025.89/src/sk-ecdsa.h /usr/src/debug/dropbear/2025.89/src/circbuffer.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_sqr.c /usr/src/debug/dropbear/2025.89/src/circbuffer.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_count_bits.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_2k_setup_l.c /usr/src/debug/dropbear/2025.89/src/session.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_add.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_dr_is_modulus.c /usr/src/debug/dropbear/2025.89/src/dbmulti.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_grow.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_get_mag_u32.c /usr/src/debug/dropbear/2025.89/src/ltc_p
 rng.h /usr/src/debug/dropbear/2025.89/src/ltc_prng.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mod_d.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_rand.c /usr/src/debug/dropbear/2025.89/src/crypto_desc.h /usr/src/debug/dropbear/2025.89/src/dh_groups.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_is_2k_l.c /usr/src/debug/dropbear/2025.89/src/listener.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_add_d.c /usr/src/debug/dropbear/2025.89/src/crypto_desc.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_exptmod_fast.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_prime_next_prime.c /usr/src/debug/dropbear/2025.89/src/dh_groups.h /usr/src/debug/dropbear/2025.89/src/listener.c /usr/src/debug/dropbear/2025.89/src/list.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mod.c /usr/src/debug/dropbear/2025.89/src/curve25519.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_prime_is_divisible.c /usr/src/debug/dropbear/2025.89/src/curve25519.h /usr/src/debug/d
 ropbear/2025.89/src/algo.h /usr/src/debug/dropbear/2025.89/src/auth.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_get_mag_ul.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div_2.c /usr/src/debug/dropbear/2025.89/src/cli-authpubkey.c /usr/src/debug/dropbear/2025.89/src/list.h /usr/src/debug/dropbear/2025.89/src/process-packet.c /usr/src/debug/dropbear/2025.89/src/svr-authpubkey.c /usr/src/debug/dropbear/2025.89/src/cli-main.c /usr/src/debug/dropbear/2025.89/src/svr-main.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_rshd.c /usr/src/debug/dropbear/2025.89/src/ed25519.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_set_ul.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_sqrmod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_addmod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_invmod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mod_2d.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div_d.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mul_2d.c /usr/
 src/debug/dropbear/2025.89/libtommath/bn_mp_mulmod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_submod.c /usr/src/debug/dropbear/2025.89/src/ed25519.h /usr/src/debug/dropbear/2025.89/src/svr-auth.c /usr/src/debug/dropbear/2025.89/src/tcp-accept.c /usr/src/debug/dropbear/2025.89/src/loginrec.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_get_l.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_montgomery_setup.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_set.c /usr/src/debug/dropbear/2025.89/src/chansession.h /usr/src/debug/dropbear/2025.89/src/loginrec.h /usr/src/debug/dropbear/2025.89/src/cli-session.c /usr/src/debug/dropbear/2025.89/src/svr-service.c /usr/src/debug/dropbear/2025.89/src/svr-session.c /usr/src/debug/dropbear/2025.89/src/kex-ecdh.c /usr/src/debug/dropbear/2025.89/src/tcpfwd.h /usr/src/debug/dropbear/2025.89/src/x11fwd.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_exch.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mul.c /usr/src/debug/dr
 opbear/2025.89/src/service.h /usr/src/debug/dropbear/2025.89/src/atomicio.c /usr/src/debug/dropbear/2025.89/src/netio.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_clamp.c /usr/src/debug/dropbear/2025.89/src/chachapoly.c /usr/src/debug/dropbear/2025.89/src/packet.c /usr/src/debug/dropbear/2025.89/src/netio.c /usr/src/debug/dropbear/2025.89/src/atomicio.h /usr/src/debug/dropbear/2025.89/src/chachapoly.h /usr/src/debug/dropbear/2025.89/src/packet.h /usr/src/debug/dropbear/2025.89/src/buffer.h /usr/src/debug/dropbear/2025.89/src/gened25519.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_set.c /usr/src/debug/dropbear/2025.89/src/sk-ed25519.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_cmp_mag.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_cnt_lsb.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_exptmod.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_get_i32.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_set_u32.c /usr/src/debug/dropbear/2025.89/src/common-sessi
 on.c /usr/src/debug/dropbear/2025.89/src/buffer.c /usr/src/debug/dropbear/2025.89/src/gened25519.h /usr/src/debug/dropbear/2025.89/src/sk-ed25519.h /usr/src/debug/dropbear/2025.89/src/progressmeter.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_lshd.c /usr/src/debug/dropbear/2025.89/src/common-algo.c /usr/src/debug/dropbear/2025.89/src/progressmeter.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_read_radix.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_mul_d.c /usr/src/debug/dropbear/2025.89/src/cli-runopts.c /usr/src/debug/dropbear/2025.89/src/bignum.c /usr/src/debug/dropbear/2025.89/src/svr-runopts.c /usr/src/debug/dropbear/2025.89/src/sntrup761_compat.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_u32.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_sqr.c /usr/src/debug/dropbear/2025.89/src/ecdsa.h /usr/src/debug/dropbear/2025.89/src/cli-authpasswd.c /usr/src/debug/dropbear/2025.89/src/bignum.h /usr/src/debug/dropbear/2025.89/src/ecdsa.c /usr/src/debug/dr
 opbear/2025.89/libtommath/bn_s_mp_invmod_slow.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_copy.c /usr/src/debug/dropbear/2025.89/libtommath/tommath.h /usr/src/debug/dropbear/2025.89/src/gensignkey.c /usr/src/debug/dropbear/2025.89/src/scpmisc.h /usr/src/debug/dropbear/2025.89/src/gensignkey.h /usr/src/debug/dropbear/2025.89/src/scpmisc.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_sub.c /usr/src/debug/dropbear/2025.89/src/mlkem768.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_montgomery_reduce.c /usr/src/debug/dropbear/2025.89/src/mlkem768.h /usr/src/debug/dropbear/2025.89/src/dropbearkey.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_gcd.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_sub.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_mul_high_digs_fast.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_2k_l.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_mul_digs.c /usr/src/debug/dro
 pbear/2025.89/libtommath/bn_s_mp_exptmod.c /usr/src/debug/dropbear/2025.89/src/dbhelpers.h /usr/src/debug/dropbear/2025.89/src/keyimport.h /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_size.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_ubin_size.c /usr/src/debug/dropbear/2025.89/src/dbhelpers.c /usr/src/debug/dropbear/2025.89/src/keyimport.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_prime_miller_rabin.c /usr/src/debug/dropbear/2025.89/src/sntrup761.h /usr/src/debug/dropbear/2025.89/src/genrsa.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_balance_mul.c /usr/src/debug/dropbear/2025.89/src/sshpty.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_2k_setup.c /usr/src/debug/dropbear/2025.89/src/genrsa.h /usr/src/debug/dropbear/2025.89/src/sntrup761.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_zero.c /usr/src/debug/dropbear/2025.89/src/sshpty.h /usr/src/debug/dropbear/2025.89/src/common-kex.c /usr/src/debug/dropbear/2025.89/src/svr-authpam.c /usr/sr
 c/debug/dropbear/2025.89/libtommath/bn_mp_init.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_multi.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_2expt.c /usr/src/debug/dropbear/2025.89/src/dropbearconvert.c /usr/src/debug/dropbear/2025.89/src/cli-chansession.c /usr/src/debug/dropbear/2025.89/src/svr-chansession.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_sub_d.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_radix_smap.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_abs.c /usr/src/debug/dropbear/2025.89/libtommath/bn_s_mp_sqr_fast.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce_setup.c /usr/src/debug/dropbear/2025.89/src/svr-x11fwd.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_sqrt.c /usr/src/debug/dropbear/2025.89/src/dbrandom.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_reduce.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_div_2d.c /usr/src/debug/dropbear/2025.89/src/common-runopts.c /usr/src/debug/dropbear/2025.89/libtommath/bn_
 mp_dr_reduce.c /usr/src/debug/dropbear/2025.89/src/libcrux_mlkem768_sha3.h /usr/src/debug/dropbear/2025.89/src/dbrandom.h /usr/src/debug/dropbear/2025.89/src/channel.h /usr/src/debug/dropbear/2025.89/src/common-channel.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_montgomery_calc_normalization.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_cmp_d.c /usr/src/debug/dropbear/2025.89/src/cli-kex.c /usr/src/debug/dropbear/2025.89/src/svr-kex.c /usr/src/debug/dropbear/2025.89/src/termcodes.h /usr/src/debug/dropbear/2025.89/src/termcodes.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_cmp.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_lcm.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_clear.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_dr_setup.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_is_square.c /usr/src/debug/dropbear/2025.89/src/dbutil.h /usr/src/debug/dropbear/2025.89/src/kex-pqhybrid.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_to_ubin.c /usr/sr
 c/debug/dropbear/2025.89/libtommath/bn_mp_mul_2.c /usr/src/debug/dropbear/2025.89/src/dbutil.c /usr/src/debug/dropbear/2025.89/src/cli-channel.c /usr/src/debug/dropbear/2025.89/libtommath/bn_mp_init_copy.c", added "/usr/src/debug/dropbear/2026.91/src/svr-streamfwd.c /usr/src/debug/dropbear/2026.91/src/cli-authinteract.c /usr/src/debug/dropbear/2026.91/src/forward.h /usr/src/debug/dropbear/2026.91/src/agentfwd.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_prime_rabin_miller_trials.c /usr/src/debug/dropbear/2026.91/src/cli-agentfwd.c /usr/src/debug/dropbear/2026.91/src/svr-agentfwd.c /usr/src/debug/dropbear/2026.91/src/kex-dh.c /usr/src/debug/dropbear/2026.91/src/dbmalloc.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_div_3.c /usr/src/debug/dropbear/2026.91/src/queue.c /usr/src/debug/dropbear/2026.91/libtommath/bn_prime_tab.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_montgomery_reduce_fast.c /usr/src/debug/dropbear/2026.91/src/common-chansession.c /usr/src/debug/drop
 bear/2026.91/src/dbmalloc.h /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_add.c /usr/src/debug/dropbear/2026.91/src/queue.h /usr/src/debug/dropbear/2026.91/src/kex-x25519.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_mul_digs_fast.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_mul_high_digs.c /usr/src/debug/dropbear/2026.91/libtommath/tommath_private.h /usr/src/debug/dropbear/2026.91/src/cli-auth.c /usr/src/debug/dropbear/2026.91/src/ecc.h /usr/src/debug/dropbear/2026.91/src/kex.h /usr/src/debug/dropbear/2026.91/src/rsa.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_prime_is_prime.c /usr/src/debug/dropbear/2026.91/src/signkey.h /usr/src/debug/dropbear/2026.91/src/svr-tcpfwd.c /usr/src/debug/dropbear/2026.91/src/cli-tcpfwd.c /usr/src/debug/dropbear/2026.91/src/signkey_ossh.h /usr/src/debug/dropbear/2026.91/libtommath/bn_cutoffs.c /usr/src/debug/dropbear/2026.91/src/signkey.c /usr/src/debug/dropbear/2026.91/src/signkey_ossh.c /usr/src/debug/dropbear/2026.91/src/e
 cc.c /usr/src/debug/dropbear/2026.91/src/rsa.c /usr/src/debug/dropbear/2026.91/src/scp.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_clear_multi.c /usr/src/debug/dropbear/2026.91/src/svr-forward.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_is_2k.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_2k.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_neg.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_reverse.c /usr/src/debug/dropbear/2026.91/src/svr-authpubkeyoptions.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_from_ubin.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_to_radix.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_invmod_fast.c /usr/src/debug/dropbear/2026.91/src/sk-ecdsa.c /usr/src/debug/dropbear/2026.91/src/runopts.h /usr/src/debug/dropbear/2026.91/src/sk-ecdsa.h /usr/src/debug/dropbear/2026.91/src/circbuffer.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_sqr.c /usr/src/debug/dropbear/2026.91/src/circbuffer.c /usr/src/debug/
 dropbear/2026.91/libtommath/bn_mp_count_bits.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_2k_setup_l.c /usr/src/debug/dropbear/2026.91/src/session.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_add.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_dr_is_modulus.c /usr/src/debug/dropbear/2026.91/src/dbmulti.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_grow.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_get_mag_u32.c /usr/src/debug/dropbear/2026.91/src/ltc_prng.h /usr/src/debug/dropbear/2026.91/src/ltc_prng.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mod_d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_rand.c /usr/src/debug/dropbear/2026.91/src/crypto_desc.h /usr/src/debug/dropbear/2026.91/src/dh_groups.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_is_2k_l.c /usr/src/debug/dropbear/2026.91/src/listener.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_add_d.c /usr/src/debug/dropbear/2026.91/src/crypto_desc.c /usr/src/debug/dropbear/2
 026.91/libtommath/bn_s_mp_exptmod_fast.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_prime_next_prime.c /usr/src/debug/dropbear/2026.91/src/dh_groups.h /usr/src/debug/dropbear/2026.91/src/listener.c /usr/src/debug/dropbear/2026.91/src/list.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mod.c /usr/src/debug/dropbear/2026.91/src/curve25519.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_prime_is_divisible.c /usr/src/debug/dropbear/2026.91/src/curve25519.h /usr/src/debug/dropbear/2026.91/src/algo.h /usr/src/debug/dropbear/2026.91/src/auth.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_get_mag_ul.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_div_2.c /usr/src/debug/dropbear/2026.91/src/cli-authpubkey.c /usr/src/debug/dropbear/2026.91/src/list.h /usr/src/debug/dropbear/2026.91/src/process-packet.c /usr/src/debug/dropbear/2026.91/src/svr-authpubkey.c /usr/src/debug/dropbear/2026.91/src/cli-main.c /usr/src/debug/dropbear/2026.91/src/svr-main.c /usr/src/debug/dropbear/
 2026.91/libtommath/bn_mp_rshd.c /usr/src/debug/dropbear/2026.91/src/ed25519.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_set_ul.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_sqrmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_addmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_invmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mod_2d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_div_d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mul_2d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mulmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_submod.c /usr/src/debug/dropbear/2026.91/src/ed25519.h /usr/src/debug/dropbear/2026.91/src/svr-auth.c /usr/src/debug/dropbear/2026.91/src/tcp-accept.c /usr/src/debug/dropbear/2026.91/src/loginrec.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_get_l.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_montgomery_setup.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init_set.c /usr/src/debug/dropbear/
 2026.91/src/chansession.h /usr/src/debug/dropbear/2026.91/src/loginrec.h /usr/src/debug/dropbear/2026.91/src/cli-session.c /usr/src/debug/dropbear/2026.91/src/svr-service.c /usr/src/debug/dropbear/2026.91/src/svr-session.c /usr/src/debug/dropbear/2026.91/src/kex-ecdh.c /usr/src/debug/dropbear/2026.91/src/x11fwd.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_exch.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mul.c /usr/src/debug/dropbear/2026.91/src/service.h /usr/src/debug/dropbear/2026.91/src/atomicio.c /usr/src/debug/dropbear/2026.91/src/netio.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_clamp.c /usr/src/debug/dropbear/2026.91/src/chachapoly.c /usr/src/debug/dropbear/2026.91/src/packet.c /usr/src/debug/dropbear/2026.91/src/netio.c /usr/src/debug/dropbear/2026.91/src/atomicio.h /usr/src/debug/dropbear/2026.91/src/chachapoly.h /usr/src/debug/dropbear/2026.91/src/packet.h /usr/src/debug/dropbear/2026.91/src/buffer.h /usr/src/debug/dropbear/2026.91/src/gened25519.c /usr
 /src/debug/dropbear/2026.91/libtommath/bn_mp_set.c /usr/src/debug/dropbear/2026.91/src/sk-ed25519.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_cmp_mag.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_cnt_lsb.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_exptmod.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_get_i32.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_set_u32.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_set_u64.c /usr/src/debug/dropbear/2026.91/src/common-session.c /usr/src/debug/dropbear/2026.91/src/buffer.c /usr/src/debug/dropbear/2026.91/src/gened25519.h /usr/src/debug/dropbear/2026.91/src/sk-ed25519.h /usr/src/debug/dropbear/2026.91/src/progressmeter.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_lshd.c /usr/src/debug/dropbear/2026.91/src/common-algo.c /usr/src/debug/dropbear/2026.91/src/progressmeter.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_read_radix.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mul_d.c /usr/src/debug/dro
 pbear/2026.91/src/cli-runopts.c /usr/src/debug/dropbear/2026.91/src/bignum.c /usr/src/debug/dropbear/2026.91/src/svr-runopts.c /usr/src/debug/dropbear/2026.91/src/sntrup761_compat.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init_u32.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_sqr.c /usr/src/debug/dropbear/2026.91/src/ecdsa.h /usr/src/debug/dropbear/2026.91/src/cli-authpasswd.c /usr/src/debug/dropbear/2026.91/src/bignum.h /usr/src/debug/dropbear/2026.91/src/ecdsa.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_invmod_slow.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_copy.c /usr/src/debug/dropbear/2026.91/libtommath/tommath.h /usr/src/debug/dropbear/2026.91/src/gensignkey.c /usr/src/debug/dropbear/2026.91/src/scpmisc.h /usr/src/debug/dropbear/2026.91/src/gensignkey.h /usr/src/debug/dropbear/2026.91/src/scpmisc.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_sub.c /usr/src/debug/dropbear/2026.91/src/mlkem768.c /usr/src/debug/dropbear/2026.91/libtommath/b
 n_mp_div.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_montgomery_reduce.c /usr/src/debug/dropbear/2026.91/src/mlkem768.h /usr/src/debug/dropbear/2026.91/src/dropbearkey.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_gcd.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_sub.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_mul_high_digs_fast.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_2k_l.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_mul_digs.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_exptmod.c /usr/src/debug/dropbear/2026.91/src/dbhelpers.h /usr/src/debug/dropbear/2026.91/src/keyimport.h /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init_size.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_ubin_size.c /usr/src/debug/dropbear/2026.91/src/dbhelpers.c /usr/src/debug/dropbear/2026.91/src/keyimport.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_prime_miller_rabin.c /usr/src/debug/dropbear/2026.91/src/sntrup761.h /usr/src/debug/dropb
 ear/2026.91/src/genrsa.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_balance_mul.c /usr/src/debug/dropbear/2026.91/src/sshpty.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_2k_setup.c /usr/src/debug/dropbear/2026.91/src/genrsa.h /usr/src/debug/dropbear/2026.91/src/sntrup761.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_zero.c /usr/src/debug/dropbear/2026.91/src/sshpty.h /usr/src/debug/dropbear/2026.91/src/common-kex.c /usr/src/debug/dropbear/2026.91/src/svr-authpam.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init_multi.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_2expt.c /usr/src/debug/dropbear/2026.91/src/dropbearconvert.c /usr/src/debug/dropbear/2026.91/src/cli-chansession.c /usr/src/debug/dropbear/2026.91/src/svr-chansession.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_sub_d.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_radix_smap.c /usr/src/debug/dropbear/2026.91/libtommath/bn_
 mp_abs.c /usr/src/debug/dropbear/2026.91/libtommath/bn_s_mp_sqr_fast.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce_setup.c /usr/src/debug/dropbear/2026.91/src/svr-x11fwd.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_sqrt.c /usr/src/debug/dropbear/2026.91/src/dbrandom.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_reduce.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_div_2d.c /usr/src/debug/dropbear/2026.91/src/common-runopts.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_dr_reduce.c /usr/src/debug/dropbear/2026.91/src/libcrux_mlkem768_sha3.h /usr/src/debug/dropbear/2026.91/src/dbrandom.h /usr/src/debug/dropbear/2026.91/src/channel.h /usr/src/debug/dropbear/2026.91/src/common-channel.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_montgomery_calc_normalization.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_cmp_d.c /usr/src/debug/dropbear/2026.91/src/cli-kex.c /usr/src/debug/dropbear/2026.91/src/svr-kex.c /usr/src/debug/dropbear/2026.91/src/termcode
 s.h /usr/src/debug/dropbear/2026.91/src/termcodes.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_cmp.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_lcm.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_clear.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_dr_setup.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_is_square.c /usr/src/debug/dropbear/2026.91/src/dbutil.h /usr/src/debug/dropbear/2026.91/src/kex-pqhybrid.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_to_ubin.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_mul_2.c /usr/src/debug/dropbear/2026.91/src/dbutil.c /usr/src/debug/dropbear/2026.91/src/cli-channel.c /usr/src/debug/dropbear/2026.91/libtommath/bn_mp_init_copy.c"
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PKGSIZE changed from 1980485 to 2005289 (+1%)
packages/x86-64-v3-poky-linux/dropbear/dropbear-src: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear-staticdev: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear/dropbear: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear/dropbear: PKGSIZE changed from 439406 to 447598 (+2%)
packages/x86-64-v3-poky-linux/dropbear/dropbear: PV changed from "2025.89" to "2026.91"
packages/x86-64-v3-poky-linux/dropbear: PKGV changed from 2025.89 [default] to 2026.91 [default]
packages/x86-64-v3-poky-linux/dropbear: SRC_URI changed from "http://matt.ucc.asn.au/dropbear/releases/dropbear-2025.89.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear" to "http://matt.ucc.asn.au/dropbear/releases/dropbear-2026.91.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear"
packages/x86-64-v3-poky-linux/dropbear: PV changed from "2025.89" to "2026.91"

--===============8601330732085249820==--

