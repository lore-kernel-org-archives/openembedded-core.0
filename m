Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DF8C27C53
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1268.1715794337174362206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fsagjmwg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DcSen7qj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018f7d4fdad6-7ca2a27b-250b-40f0-a179-c6bd808b6379-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+3FITbZrf3o5P52w4DCjw3hB+a43l6kr2RTtezckN6U=;
	b=fsagjmwgBHiWZ97HAAdAzrbvMDuQuH5t06T0wfXXFT83Dg4T3S1oxFqwfXLr7o+i
	0uRRUtRpmB338rFWAiVadTN4ZBBR0AMxOptFIWfyqL1v4Sn87qs+H+0hS+JPLXe4GOm
	ZFcUa3oFBntqy4z3FOz//6Z0cWEk8TU8swwn5L+A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+3FITbZrf3o5P52w4DCjw3hB+a43l6kr2RTtezckN6U=;
	b=DcSen7qjOc+w51V5zwPLhILkoYJ5+9Y5mU1PUt3qLyyGNhdYAKgI9btEG6D7yYL0
	+RpuJNmKXFsYj0X47vKhSp3VbUv0q4v5dJbnfMbOFbHVpYsMEG+lhKCuJ65NuNqZsaL
	GhFZ66UDShPYN5etkL3dyr7kHkBNUPBjT309Fvc0=
Content-Type: multipart/mixed; boundary="===============3790906128407826148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2024.85 SUCCEEDED
Message-ID: <0101018f7d4fdad6-7ca2a27b-250b-40f0-a179-c6bd808b6379-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199300

--===============3790906128407826148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dropbear* to *2024.85* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2024.84-2024.85.patch
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
From 6821cb2ed751c0c4baf89ece2d5d55e4c0cecd0e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 07:03:18 +0000
Subject: [PATCH] dropbear: upgrade 2024.84 -> 2024.85

---
 .../0001-urandom-xauth-changes-to-options.h.patch   |  8 ++++----
 .../dropbear/0005-dropbear-enable-pam.patch         | 13 +++++--------
 .../dropbear/0006-dropbear-configuration-file.patch | 11 ++++-------
 .../dropbear/dropbear-disable-weak-ciphers.patch    |  9 +++------
 .../{dropbear_2024.84.bb => dropbear_2024.85.bb}    |  2 +-
 5 files changed, 17 insertions(+), 26 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear_2024.84.bb => dropbear_2024.85.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index c74f09e484..9c1dd3f606 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,7 @@
-Subject: [PATCH 1/6] urandom-xauth-changes-to-options.h
+From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard@openedhand.com>
+Date: Wed, 31 Aug 2005 10:45:47 +0000
+Subject: [PATCH] urandom-xauth-changes-to-options.h
 
 Upstream-Status: Inappropriate [configuration]
 ---
@@ -18,6 +21,3 @@ index 6e970bb..ccc8b47 100644
  
  
  /* If you want to enable running an sftp server (such as the one included with
--- 
-2.34.1
-
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index fe667ddc25..6743f506e9 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,7 +1,7 @@
-From b8cece92ba19aa77ac013ea161bfe4c7147747c9 Mon Sep 17 00:00:00 2001
+From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
-Subject: Enable pam
+Subject: [PATCH] Enable pam
 
 We need modify file default_options.h besides enabling pam in
 configure if we want dropbear to support pam.
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index 0e3d027..349338c 100644
+index ccc8b47..12768d1 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -210,7 +210,7 @@ group1 in Dropbear server too */
+@@ -228,7 +228,7 @@ group1 in Dropbear server too */
  
  /* Authentication Types - at least one required.
     RFC Draft requires pubkey auth, and recommends password */
@@ -27,7 +27,7 @@ index 0e3d027..349338c 100644
  
  /* Note: PAM auth is quite simple and only works for PAM modules which just do
   * a simple "Login: " "Password: " (you can edit the strings in svr-authpam.c).
-@@ -218,7 +218,7 @@ group1 in Dropbear server too */
+@@ -236,7 +236,7 @@ group1 in Dropbear server too */
   * but there's an interface via a PAM module. It won't work for more complex
   * PAM challenge/response.
   * You can't enable both PASSWORD and PAM. */
@@ -36,6 +36,3 @@ index 0e3d027..349338c 100644
  
  /* ~/.ssh/authorized_keys authentication.
   * You must define DROPBEAR_SVR_PUBKEY_AUTH in order to use plugins. */
--- 
-2.25.1
-
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index f54f634a4e..44861088cc 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From e3a5db1b6d3f6382a15b2266458c26c645a10f18 Mon Sep 17 00:00:00 2001
+From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
@@ -15,11 +15,11 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  src/svr-authpam.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/srec/svr-authpam.c b/src/svr-authpam.c
-index d201bc9..165ec5c 100644
+diff --git a/src/svr-authpam.c b/src/svr-authpam.c
+index ec14632..026102f 100644
 --- a/src/svr-authpam.c
 +++ b/src/svr-authpam.c
-@@ -223,7 +223,7 @@ void svr_auth_pam(int valid_user) {
+@@ -224,7 +224,7 @@ void svr_auth_pam(int valid_user) {
  	}
  
  	/* Init pam */
@@ -28,6 +28,3 @@ index d201bc9..165ec5c 100644
  		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s", 
  				rc, pam_strerror(pamHandlep, rc));
  		goto cleanup;
--- 
-2.7.4
-
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
index f998caa255..a20781d31d 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
@@ -1,4 +1,4 @@
-From c347ece05a7fdbf50d76cb136b9ed45caed333f6 Mon Sep 17 00:00:00 2001
+From c8a0c8e87b772576f3a431c3b4cacaf5aa001dcc Mon Sep 17 00:00:00 2001
 From: Joseph Reynolds <joseph.reynolds1@ibm.com>
 Date: Thu, 20 Jun 2019 16:29:15 -0500
 Subject: [PATCH] dropbear: new feature: disable-weak-ciphers
@@ -14,10 +14,10 @@ Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index d417588..bc5200f 100644
+index 12768d1..2b07497 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -180,7 +180,7 @@ IMPORTANT: Some options will require "make clean" after changes */
+@@ -197,7 +197,7 @@ IMPORTANT: Some options will require "make clean" after changes */
   * Small systems should generally include either curve25519 or ecdh for performance.
   * curve25519 is less widely supported but is faster
   */
@@ -26,6 +26,3 @@ index d417588..bc5200f 100644
  #define DROPBEAR_DH_GROUP14_SHA256 1
  #define DROPBEAR_DH_GROUP16 0
  #define DROPBEAR_CURVE25519 1
--- 
-2.25.1
-
diff --git a/meta/recipes-core/dropbear/dropbear_2024.84.bb b/meta/recipes-core/dropbear/dropbear_2024.85.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2024.84.bb
rename to meta/recipes-core/dropbear/dropbear_2024.85.bb
index 3ea64b13d0..54001414d0 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.84.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.85.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            "
 
-SRC_URI[sha256sum] = "16e22b66b333d6b7e504c43679d04ed6ca30f2838db40a21f935c850dfc01009"
+SRC_URI[sha256sum] = "86b036c433a69d89ce51ebae335d65c47738ccf90d13e5eb0fea832e556da502"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.44.0


--===============3790906128407826148==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2024.84-2024.85.patch"

RnJvbSA2ODIxY2IyZWQ3NTFjMGM0YmFmODllY2UyZDVkNTVlNGMwY2VjZDBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDc6MDM6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cm9wYmVhcjogdXBncmFkZSAyMDI0Ljg0IC0+IDIwMjQuODUKCi0tLQogLi4uLzAwMDEtdXJhbmRv
bS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5wYXRjaCAgIHwgIDggKysrKy0tLS0KIC4uLi9k
cm9wYmVhci8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2ggICAgICAgICB8IDEzICsrKysr
LS0tLS0tLS0KIC4uLi9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5w
YXRjaCB8IDExICsrKystLS0tLS0tCiAuLi4vZHJvcGJlYXIvZHJvcGJlYXItZGlzYWJsZS13ZWFr
LWNpcGhlcnMucGF0Y2ggICAgfCAgOSArKystLS0tLS0KIC4uLi97ZHJvcGJlYXJfMjAyNC44NC5i
YiA9PiBkcm9wYmVhcl8yMDI0Ljg1LmJifSAgICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3Jl
L2Ryb3BiZWFyL3tkcm9wYmVhcl8yMDI0Ljg0LmJiID0+IGRyb3BiZWFyXzIwMjQuODUuYmJ9ICg5
OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAw
MS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0
aW9ucy5oLnBhdGNoCmluZGV4IGM3NGYwOWU0ODQuLjljMWRkM2Y2MDYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDEtdXJhbmRvbS14YXV0aC1jaGFu
Z2VzLXRvLW9wdGlvbnMuaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9k
cm9wYmVhci8wMDAxLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2gKQEAg
LTEsNCArMSw3IEBACi1TdWJqZWN0OiBbUEFUQ0ggMS82XSB1cmFuZG9tLXhhdXRoLWNoYW5nZXMt
dG8tb3B0aW9ucy5oCitGcm9tIGNkYzZhNGE1N2E4NmQ4MTE2YTkyYTVkOTA1OTkzZTY1Y2Y3MjM1
NTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFy
ZEBvcGVuZWRoYW5kLmNvbT4KK0RhdGU6IFdlZCwgMzEgQXVnIDIwMDUgMTA6NDU6NDcgKzAwMDAK
K1N1YmplY3Q6IFtQQVRDSF0gdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaAogCiBV
cHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAtLS0KQEAgLTE4
LDYgKzIxLDMgQEAgaW5kZXggNmU5NzBiYi4uY2NjOGI0NyAxMDA2NDQKICAKICAKICAvKiBJZiB5
b3Ugd2FudCB0byBlbmFibGUgcnVubmluZyBhbiBzZnRwIHNlcnZlciAoc3VjaCBhcyB0aGUgb25l
IGluY2x1ZGVkIHdpdGgKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBh
bS5wYXRjaAppbmRleCBmZTY2N2RkYzI1Li42NzQzZjUwNmU5IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVh
ci1lbmFibGUtcGFtLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBiOGNlY2U5MmJhMTlhYTc3
YWMwMTNlYTE2MWJmZTRjNzE0Nzc0N2M5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
NTNjYTAxZjBmYzUwZGJhZWIyZmY4YmNlY2UwYzM0MjU2ZWJhOTRmIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4K
IERhdGU6IFdlZCwgMiBEZWMgMjAxNSAxMTozNjowMiArMDIwMAotU3ViamVjdDogRW5hYmxlIHBh
bQorU3ViamVjdDogW1BBVENIXSBFbmFibGUgcGFtCiAKIFdlIG5lZWQgbW9kaWZ5IGZpbGUgZGVm
YXVsdF9vcHRpb25zLmggYmVzaWRlcyBlbmFibGluZyBwYW0gaW4KIGNvbmZpZ3VyZSBpZiB3ZSB3
YW50IGRyb3BiZWFyIHRvIHN1cHBvcnQgcGFtLgpAQCAtMTUsMTAgKzE1LDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L3NyYy9kZWZhdWx0X29wdGlvbnMuaCBiL3NyYy9kZWZhdWx0X29wdGlvbnMuaAotaW5kZXggMGUz
ZDAyNy4uMzQ5MzM4YyAxMDA2NDQKK2luZGV4IGNjYzhiNDcuLjEyNzY4ZDEgMTAwNjQ0CiAtLS0g
YS9zcmMvZGVmYXVsdF9vcHRpb25zLmgKICsrKyBiL3NyYy9kZWZhdWx0X29wdGlvbnMuaAotQEAg
LTIxMCw3ICsyMTAsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2VydmVyIHRvbyAqLworQEAgLTIy
OCw3ICsyMjgsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2VydmVyIHRvbyAqLwogIAogIC8qIEF1
dGhlbnRpY2F0aW9uIFR5cGVzIC0gYXQgbGVhc3Qgb25lIHJlcXVpcmVkLgogICAgIFJGQyBEcmFm
dCByZXF1aXJlcyBwdWJrZXkgYXV0aCwgYW5kIHJlY29tbWVuZHMgcGFzc3dvcmQgKi8KQEAgLTI3
LDcgKzI3LDcgQEAgaW5kZXggMGUzZDAyNy4uMzQ5MzM4YyAxMDA2NDQKICAKICAvKiBOb3RlOiBQ
QU0gYXV0aCBpcyBxdWl0ZSBzaW1wbGUgYW5kIG9ubHkgd29ya3MgZm9yIFBBTSBtb2R1bGVzIHdo
aWNoIGp1c3QgZG8KICAgKiBhIHNpbXBsZSAiTG9naW46ICIgIlBhc3N3b3JkOiAiICh5b3UgY2Fu
IGVkaXQgdGhlIHN0cmluZ3MgaW4gc3ZyLWF1dGhwYW0uYykuCi1AQCAtMjE4LDcgKzIxOCw3IEBA
IGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCitAQCAtMjM2LDcgKzIzNiw3IEBAIGdy
b3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCiAgICogYnV0IHRoZXJlJ3MgYW4gaW50ZXJm
YWNlIHZpYSBhIFBBTSBtb2R1bGUuIEl0IHdvbid0IHdvcmsgZm9yIG1vcmUgY29tcGxleAogICAq
IFBBTSBjaGFsbGVuZ2UvcmVzcG9uc2UuCiAgICogWW91IGNhbid0IGVuYWJsZSBib3RoIFBBU1NX
T1JEIGFuZCBQQU0uICovCkBAIC0zNiw2ICszNiwzIEBAIGluZGV4IDBlM2QwMjcuLjM0OTMzOGMg
MTAwNjQ0CiAgCiAgLyogfi8uc3NoL2F1dGhvcml6ZWRfa2V5cyBhdXRoZW50aWNhdGlvbi4KICAg
KiBZb3UgbXVzdCBkZWZpbmUgRFJPUEJFQVJfU1ZSX1BVQktFWV9BVVRIIGluIG9yZGVyIHRvIHVz
ZSBwbHVnaW5zLiAqLwotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNv
bmZpZ3VyYXRpb24tZmlsZS5wYXRjaAppbmRleCBmNTRmNjM0YTRlLi40NDg2MTA4OGNjIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFy
LWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVh
ci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gZTNhNWRiMWI2ZDNmNjM4MmExNWIyMjY2NDU4YzI2YzY0NWExMGYxOCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTZiMTQ3Zjk3ZjA5MzhjZGRiNTVlYzFjOTBi
YzkxOWMxM2YyNmZjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8
TWluZ2xpLll1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDYgU2VwIDIwMTggMTU6NTQ6MDAg
KzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZHJvcGJlYXIgY29uZmlndXJhdGlvbiBmaWxlCkBAIC0x
NSwxMSArMTUsMTEgQEAgU2lnbmVkLW9mZi1ieTogTWluZ2xpIFl1IDxNaW5nbGkuWXVAd2luZHJp
dmVyLmNvbT4KICBzcmMvc3ZyLWF1dGhwYW0uYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAotZGlmZiAtLWdpdCBhL3NyZWMvc3ZyLWF1dGhw
YW0uYyBiL3NyYy9zdnItYXV0aHBhbS5jCi1pbmRleCBkMjAxYmM5Li4xNjVlYzVjIDEwMDY0NAor
ZGlmZiAtLWdpdCBhL3NyYy9zdnItYXV0aHBhbS5jIGIvc3JjL3N2ci1hdXRocGFtLmMKK2luZGV4
IGVjMTQ2MzIuLjAyNjEwMmYgMTAwNjQ0CiAtLS0gYS9zcmMvc3ZyLWF1dGhwYW0uYwogKysrIGIv
c3JjL3N2ci1hdXRocGFtLmMKLUBAIC0yMjMsNyArMjIzLDcgQEAgdm9pZCBzdnJfYXV0aF9wYW0o
aW50IHZhbGlkX3VzZXIpIHsKK0BAIC0yMjQsNyArMjI0LDcgQEAgdm9pZCBzdnJfYXV0aF9wYW0o
aW50IHZhbGlkX3VzZXIpIHsKICAJfQogIAogIAkvKiBJbml0IHBhbSAqLwpAQCAtMjgsNiArMjgs
MyBAQCBpbmRleCBkMjAxYmM5Li4xNjVlYzVjIDEwMDY0NAogIAkJZHJvcGJlYXJfbG9nKExPR19X
QVJOSU5HLCAicGFtX3N0YXJ0KCkgZmFpbGVkLCByYz0lZCwgJXMiLCAKICAJCQkJcmMsIHBhbV9z
dHJlcnJvcihwYW1IYW5kbGVwLCByYykpOwogIAkJZ290byBjbGVhbnVwOwotLS0gCi0yLjcuNAot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci9kcm9wYmVh
ci1kaXNhYmxlLXdlYWstY2lwaGVycy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFy
L2Ryb3BiZWFyL2Ryb3BiZWFyLWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoCmluZGV4IGY5OThj
YWEyNTUuLmEyMDc4MWQzMWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFy
L2Ryb3BiZWFyL2Ryb3BiZWFyLWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyL2Ryb3BiZWFyLWRpc2FibGUtd2Vhay1jaXBo
ZXJzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMzQ3ZWNlMDVhN2ZkYmY1MGQ3NmNiMTM2
YjllZDQ1Y2FlZDMzM2Y2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjOGEwYzhlODdi
NzcyNTc2ZjNhNDMxYzNiNGNhY2FmNWFhMDAxZGNjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSm9zZXBoIFJleW5vbGRzIDxqb3NlcGgucmV5bm9sZHMxQGlibS5jb20+CiBEYXRlOiBU
aHUsIDIwIEp1biAyMDE5IDE2OjI5OjE1IC0wNTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRyb3BiZWFy
OiBuZXcgZmVhdHVyZTogZGlzYWJsZS13ZWFrLWNpcGhlcnMKQEAgLTE0LDEwICsxNCwxMCBAQCBT
aWduZWQtb2ZmLWJ5OiBKb3NlcGggUmV5bm9sZHMgPGpvc2VwaC5yZXlub2xkczFAaWJtLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL3NyYy9kZWZhdWx0X29wdGlvbnMuaCBiL3NyYy9kZWZhdWx0X29wdGlvbnMuaAotaW5k
ZXggZDQxNzU4OC4uYmM1MjAwZiAxMDA2NDQKK2luZGV4IDEyNzY4ZDEuLjJiMDc0OTcgMTAwNjQ0
CiAtLS0gYS9zcmMvZGVmYXVsdF9vcHRpb25zLmgKICsrKyBiL3NyYy9kZWZhdWx0X29wdGlvbnMu
aAotQEAgLTE4MCw3ICsxODAsNyBAQCBJTVBPUlRBTlQ6IFNvbWUgb3B0aW9ucyB3aWxsIHJlcXVp
cmUgIm1ha2UgY2xlYW4iIGFmdGVyIGNoYW5nZXMgKi8KK0BAIC0xOTcsNyArMTk3LDcgQEAgSU1Q
T1JUQU5UOiBTb21lIG9wdGlvbnMgd2lsbCByZXF1aXJlICJtYWtlIGNsZWFuIiBhZnRlciBjaGFu
Z2VzICovCiAgICogU21hbGwgc3lzdGVtcyBzaG91bGQgZ2VuZXJhbGx5IGluY2x1ZGUgZWl0aGVy
IGN1cnZlMjU1MTkgb3IgZWNkaCBmb3IgcGVyZm9ybWFuY2UuCiAgICogY3VydmUyNTUxOSBpcyBs
ZXNzIHdpZGVseSBzdXBwb3J0ZWQgYnV0IGlzIGZhc3RlcgogICAqLwpAQCAtMjYsNiArMjYsMyBA
QCBpbmRleCBkNDE3NTg4Li5iYzUyMDBmIDEwMDY0NAogICNkZWZpbmUgRFJPUEJFQVJfREhfR1JP
VVAxNF9TSEEyNTYgMQogICNkZWZpbmUgRFJPUEJFQVJfREhfR1JPVVAxNiAwCiAgI2RlZmluZSBE
Uk9QQkVBUl9DVVJWRTI1NTE5IDEKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjQuODQuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI0Ljg1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjQuODQuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjQuODUuYmIKaW5k
ZXggM2VhNjRiMTNkMC4uNTQwMDE0MTRkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
ZHJvcGJlYXIvZHJvcGJlYXJfMjAyNC44NC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9w
YmVhci9kcm9wYmVhcl8yMDI0Ljg1LmJiCkBAIC0yMyw3ICsyMyw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL21hdHQudWNjLmFzbi5hdS9kcm9wYmVhci9yZWxlYXNlcy9kcm9wYmVhci0ke1BWfS50YXIu
YnoyIFwKICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAn
ZGlzYWJsZS13ZWFrLWNpcGhlcnMnLCAnZmlsZTovL2Ryb3BiZWFyLWRpc2FibGUtd2Vhay1jaXBo
ZXJzLnBhdGNoJywgJycsIGQpfSBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjE2ZTIyYjY2YjMzM2Q2YjdlNTA0YzQzNjc5ZDA0ZWQ2Y2EzMGYyODM4ZGI0MGEyMWY5MzVj
ODUwZGZjMDEwMDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODZiMDM2YzQzM2E2OWQ4OWNlNTFl
YmFlMzM1ZDY1YzQ3NzM4Y2NmOTBkMTNlNWViMGZlYTgzMmU1NTZkYTUwMiIKIAogUEFNX1NSQ19V
UkkgPSAiZmlsZTovLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCBcCiAgICAgICAgICAg
ICAgICBmaWxlOi8vMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2ggXAotLSAK
Mi40NC4wCgo=

--===============3790906128407826148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dropbear/dropbear-dbg: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear-dbg: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear/dropbear-dev: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear-dev: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear/dropbear-doc: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear-doc: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear/dropbear-locale: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear-locale: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear/dropbear-src: PKGSIZE changed from 1411613 to 1411745 (+0%)
packages/core2-64-poky-linux/dropbear/dropbear-src: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear-src: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear/dropbear-staticdev: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear-staticdev: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear/dropbear: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear: SRC_URI changed from "http://matt.ucc.asn.au/dropbear/releases/dropbear-2024.84.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear file://dropbear-disable-weak-ciphers.patch" to "http://matt.ucc.asn.au/dropbear/releases/dropbear-2024.85.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear file://dropbear-disable-weak-ciphers.patch"
packages/core2-64-poky-linux/dropbear: PKGV changed from 2024.84 [default] to 2024.85 [default]

--===============3790906128407826148==--

