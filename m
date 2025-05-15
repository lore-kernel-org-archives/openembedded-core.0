Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC38C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11032.1747312309530073748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KuRAuHVw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fwM7IeBc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010196d3edf16c-bd827bc0-e051-4908-8772-e8f05ab453b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rqCih/AsGdt/B/UUco6CZc9sccrGB02igNqtgrnW/Kw=;
	b=KuRAuHVwCXl48KE5RuYXtKGCtUX9bKaY7EwakKWyOhz9ufQrRe97oWR/erJjJ/38
	PjfXYlNcGFBNvcExIA1tyq0mghKIumM8+ZgzWJSGaCJdmhL19bHz3WXrtNHMtn1LAIv
	CkjlzzZpwotEClgCyHiD2FT7xVe9XWy4zAAHU7BI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rqCih/AsGdt/B/UUco6CZc9sccrGB02igNqtgrnW/Kw=;
	b=fwM7IeBcIAUfA4oATjxEsvCCKJa4x7cQ4EpKh9xrUjiM2nyrir8KZ9+C13rOuz+P
	cUn8Digy+h7/FVChpekvc2fw9sCfTYNlzfMiBrc1fzOmeup/JF2MbeegyM4QtisXHx4
	NC77rVYdcOH93lXVWd/3Az/qEO9XufM8j7eh67cM=
Content-Type: multipart/mixed; boundary="===============2621608053642032176=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2025.88 FAILED
Message-ID: <01010196d3edf16c-bd827bc0-e051-4908-8772-e8f05ab453b6-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216593

--===============2621608053642032176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dropbear* to *2025.88* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2024.86-2025.88.patch
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
From 40cc04055ca8c9e6b68a72b602bd7fdcf7fd8438 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 07:02:40 +0000
Subject: [PATCH] dropbear: upgrade 2024.86 -> 2025.88

---
 ...1-urandom-xauth-changes-to-options.h.patch |  6 ++--
 .../dropbear/0005-dropbear-enable-pam.patch   |  8 +++---
 .../0006-dropbear-configuration-file.patch    |  2 +-
 .../dropbear-disable-weak-ciphers.patch       | 28 -------------------
 ...ropbear_2024.86.bb => dropbear_2025.88.bb} |  2 +-
 5 files changed, 9 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
 rename meta/recipes-core/dropbear/{dropbear_2024.86.bb => dropbear_2025.88.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 9c1dd3f606..98380d3ebb 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,4 @@
-From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From 617fa35ec8fa619c6c8e1b18cf588174cc90ac54 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Wed, 31 Aug 2005 10:45:47 +0000
 Subject: [PATCH] urandom-xauth-changes-to-options.h
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index 6e970bb..ccc8b47 100644
+index 6e58a29..5ddaa59 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -311,7 +311,7 @@ group1 in Dropbear server too */
+@@ -317,7 +317,7 @@ group1 in Dropbear server too */
  
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 6743f506e9..3b65b99916 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,4 +1,4 @@
-From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
+From ff0b1a95cc0a71faef256af17289a85d2aff2d57 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
 Subject: [PATCH] Enable pam
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/default_options.h b/src/default_options.h
-index ccc8b47..12768d1 100644
+index 5ddaa59..2221442 100644
 --- a/src/default_options.h
 +++ b/src/default_options.h
-@@ -228,7 +228,7 @@ group1 in Dropbear server too */
+@@ -234,7 +234,7 @@ group1 in Dropbear server too */
  
  /* Authentication Types - at least one required.
     RFC Draft requires pubkey auth, and recommends password */
@@ -27,7 +27,7 @@ index ccc8b47..12768d1 100644
  
  /* Note: PAM auth is quite simple and only works for PAM modules which just do
   * a simple "Login: " "Password: " (you can edit the strings in svr-authpam.c).
-@@ -236,7 +236,7 @@ group1 in Dropbear server too */
+@@ -242,7 +242,7 @@ group1 in Dropbear server too */
   * but there's an interface via a PAM module. It won't work for more complex
   * PAM challenge/response.
   * You can't enable both PASSWORD and PAM. */
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index 44861088cc..3548c559e3 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
+From c2f9b71ecef4fde8bacbb54a79324a5d43e42d14 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
deleted file mode 100644
index a20781d31d..0000000000
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c8a0c8e87b772576f3a431c3b4cacaf5aa001dcc Mon Sep 17 00:00:00 2001
-From: Joseph Reynolds <joseph.reynolds1@ibm.com>
-Date: Thu, 20 Jun 2019 16:29:15 -0500
-Subject: [PATCH] dropbear: new feature: disable-weak-ciphers
-
-This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers
-in the dropbear ssh server and client since they're considered weak ciphers
-and we want to support the stong algorithms.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
----
- src/default_options.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/default_options.h b/src/default_options.h
-index 12768d1..2b07497 100644
---- a/src/default_options.h
-+++ b/src/default_options.h
-@@ -197,7 +197,7 @@ IMPORTANT: Some options will require "make clean" after changes */
-  * Small systems should generally include either curve25519 or ecdh for performance.
-  * curve25519 is less widely supported but is faster
-  */
--#define DROPBEAR_DH_GROUP14_SHA1 1
-+#define DROPBEAR_DH_GROUP14_SHA1 0
- #define DROPBEAR_DH_GROUP14_SHA256 1
- #define DROPBEAR_DH_GROUP16 0
- #define DROPBEAR_CURVE25519 1
diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2025.88.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2024.86.bb
rename to meta/recipes-core/dropbear/dropbear_2025.88.bb
index be246a0ccd..517263b4f2 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.88.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            "
 
-SRC_URI[sha256sum] = "e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e"
+SRC_URI[sha256sum] = "783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.47.1


--===============2621608053642032176==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2024.86-2025.88.patch"

RnJvbSA0MGNjMDQwNTVjYThjOWU2YjY4YTcyYjYwMmJkN2ZkY2Y3ZmQ4NDM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDc6MDI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cm9wYmVhcjogdXBncmFkZSAyMDI0Ljg2IC0+IDIwMjUuODgKCi0tLQogLi4uMS11cmFuZG9tLXhh
dXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoIHwgIDYgKystLQogLi4uL2Ryb3BiZWFyLzAw
MDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCAgIHwgIDggKysrLS0tCiAuLi4vMDAwNi1kcm9w
YmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2ggICAgfCAgMiArLQogLi4uL2Ryb3BiZWFyLWRp
c2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoICAgICAgIHwgMjggLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4ucm9wYmVhcl8yMDI0Ljg2LmJiID0+IGRyb3BiZWFyXzIwMjUuODguYmJ9IHwgIDIgKy0KIDUg
ZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci9kcm9wYmVhci1k
aXNhYmxlLXdlYWstY2lwaGVycy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3Bi
ZWFyL3tkcm9wYmVhcl8yMDI0Ljg2LmJiID0+IGRyb3BiZWFyXzIwMjUuODguYmJ9ICg5OCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFu
ZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUv
ZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5o
LnBhdGNoCmluZGV4IDljMWRkM2Y2MDYuLjk4MzgwZDNlYmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRv
LW9wdGlvbnMuaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVh
ci8wMDAxLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGNkYzZhNGE1N2E4NmQ4MTE2YTkyYTVkOTA1OTkzZTY1Y2Y3MjM1NTYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDYxN2ZhMzVlYzhmYTYxOWM2YzhlMWIxOGNmNTg4
MTc0Y2M5MGFjNTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZEBvcGVuZWRoYW5kLmNvbT4KIERhdGU6IFdlZCwgMzEgQXVnIDIwMDUgMTA6NDU6
NDcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlv
bnMuaApAQCAtOSwxMCArOSwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2Nv
bmZpZ3VyYXRpb25dCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZGVmYXVsdF9vcHRpb25zLmggYi9zcmMvZGVmYXVsdF9v
cHRpb25zLmgKLWluZGV4IDZlOTcwYmIuLmNjYzhiNDcgMTAwNjQ0CitpbmRleCA2ZTU4YTI5Li41
ZGRhYTU5IDEwMDY0NAogLS0tIGEvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCiArKysgYi9zcmMvZGVm
YXVsdF9vcHRpb25zLmgKLUBAIC0zMTEsNyArMzExLDcgQEAgZ3JvdXAxIGluIERyb3BiZWFyIHNl
cnZlciB0b28gKi8KK0BAIC0zMTcsNyArMzE3LDcgQEAgZ3JvdXAxIGluIERyb3BiZWFyIHNlcnZl
ciB0b28gKi8KICAKICAvKiBUaGUgY29tbWFuZCB0byBpbnZva2UgZm9yIHhhdXRoIHdoZW4gdXNp
bmcgWDExIGZvcndhcmRpbmcuCiAgICogIi1xIiBmb3IgcXVpZXQgKi8KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBh
bS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJl
YXItZW5hYmxlLXBhbS5wYXRjaAppbmRleCA2NzQzZjUwNmU5Li4zYjY1Yjk5OTE2IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA1LWRyb3BiZWFyLWVu
YWJsZS1wYW0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIv
MDAwNS1kcm9wYmVhci1lbmFibGUtcGFtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNTNj
YTAxZjBmYzUwZGJhZWIyZmY4YmNlY2UwYzM0MjU2ZWJhOTRmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBmZjBiMWE5NWNjMGE3MWZhZWYyNTZhZjE3Mjg5YTg1ZDJhZmYyZDU3IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVu
QGludGVsLmNvbT4KIERhdGU6IFdlZCwgMiBEZWMgMjAxNSAxMTozNjowMiArMDIwMAogU3ViamVj
dDogW1BBVENIXSBFbmFibGUgcGFtCkBAIC0xNSwxMCArMTUsMTAgQEAgU2lnbmVkLW9mZi1ieTog
SnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2Rl
ZmF1bHRfb3B0aW9ucy5oIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1pbmRleCBjY2M4YjQ3Li4x
Mjc2OGQxIDEwMDY0NAoraW5kZXggNWRkYWE1OS4uMjIyMTQ0MiAxMDA2NDQKIC0tLSBhL3NyYy9k
ZWZhdWx0X29wdGlvbnMuaAogKysrIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1AQCAtMjI4LDcg
KzIyOCw3IEBAIGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCitAQCAtMjM0LDcgKzIz
NCw3IEBAIGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCiAgCiAgLyogQXV0aGVudGlj
YXRpb24gVHlwZXMgLSBhdCBsZWFzdCBvbmUgcmVxdWlyZWQuCiAgICAgUkZDIERyYWZ0IHJlcXVp
cmVzIHB1YmtleSBhdXRoLCBhbmQgcmVjb21tZW5kcyBwYXNzd29yZCAqLwpAQCAtMjcsNyArMjcs
NyBAQCBpbmRleCBjY2M4YjQ3Li4xMjc2OGQxIDEwMDY0NAogIAogIC8qIE5vdGU6IFBBTSBhdXRo
IGlzIHF1aXRlIHNpbXBsZSBhbmQgb25seSB3b3JrcyBmb3IgUEFNIG1vZHVsZXMgd2hpY2gganVz
dCBkbwogICAqIGEgc2ltcGxlICJMb2dpbjogIiAiUGFzc3dvcmQ6ICIgKHlvdSBjYW4gZWRpdCB0
aGUgc3RyaW5ncyBpbiBzdnItYXV0aHBhbS5jKS4KLUBAIC0yMzYsNyArMjM2LDcgQEAgZ3JvdXAx
IGluIERyb3BiZWFyIHNlcnZlciB0b28gKi8KK0BAIC0yNDIsNyArMjQyLDcgQEAgZ3JvdXAxIGlu
IERyb3BiZWFyIHNlcnZlciB0b28gKi8KICAgKiBidXQgdGhlcmUncyBhbiBpbnRlcmZhY2Ugdmlh
IGEgUEFNIG1vZHVsZS4gSXQgd29uJ3Qgd29yayBmb3IgbW9yZSBjb21wbGV4CiAgICogUEFNIGNo
YWxsZW5nZS9yZXNwb25zZS4KICAgKiBZb3UgY2FuJ3QgZW5hYmxlIGJvdGggUEFTU1dPUkQgYW5k
IFBBTS4gKi8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFy
LzAwMDYtZHJvcGJlYXItY29uZmlndXJhdGlvbi1maWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0
Y2gKaW5kZXggNDQ4NjEwODhjYy4uMzU0OGM1NTllMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNi1kcm9w
YmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE2YjE0
N2Y5N2YwOTM4Y2RkYjU1ZWMxYzkwYmM5MTljMTNmMjZmYzAgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGMyZjliNzFlY2VmNGZkZThiYWNiYjU0YTc5MzI0YTVkNDNlNDJkMTQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPE1pbmdsaS5ZdUB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogVGh1LCA2IFNlcCAyMDE4IDE1OjU0OjAwICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGRyb3BiZWFyIGNvbmZpZ3VyYXRpb24gZmlsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvZHJvcGJlYXItZGlzYWJsZS13ZWFrLWNpcGhlcnMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci9kcm9wYmVhci1kaXNhYmxl
LXdlYWstY2lwaGVycy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTIwNzgx
ZDMxZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVh
ci9kcm9wYmVhci1kaXNhYmxlLXdlYWstY2lwaGVycy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDI4ICswLDAgQEAKLUZyb20gYzhhMGM4ZTg3Yjc3MjU3NmYzYTQzMWMzYjRjYWNhZjVhYTAwMWRj
YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEpvc2VwaCBSZXlub2xkcyA8am9zZXBo
LnJleW5vbGRzMUBpYm0uY29tPgotRGF0ZTogVGh1LCAyMCBKdW4gMjAxOSAxNjoyOToxNSAtMDUw
MAotU3ViamVjdDogW1BBVENIXSBkcm9wYmVhcjogbmV3IGZlYXR1cmU6IGRpc2FibGUtd2Vhay1j
aXBoZXJzCi0KLVRoaXMgZmVhdHVyZSBkaXNhYmxlcyBhbGwgQ0JDLCBTSEExLCBhbmQgZGlmZmll
LWhlbGxtYW4gZ3JvdXAxIGNpcGhlcnMKLWluIHRoZSBkcm9wYmVhciBzc2ggc2VydmVyIGFuZCBj
bGllbnQgc2luY2UgdGhleSdyZSBjb25zaWRlcmVkIHdlYWsgY2lwaGVycwotYW5kIHdlIHdhbnQg
dG8gc3VwcG9ydCB0aGUgc3RvbmcgYWxnb3JpdGhtcy4KLQotVXBzdHJlYW0tU3RhdHVzOiBJbmFw
cHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQotU2lnbmVkLW9mZi1ieTogSm9zZXBoIFJleW5vbGRz
IDxqb3NlcGgucmV5bm9sZHMxQGlibS5jb20+Ci0tLS0KLSBzcmMvZGVmYXVsdF9vcHRpb25zLmgg
fCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0K
LWRpZmYgLS1naXQgYS9zcmMvZGVmYXVsdF9vcHRpb25zLmggYi9zcmMvZGVmYXVsdF9vcHRpb25z
LmgKLWluZGV4IDEyNzY4ZDEuLjJiMDc0OTcgMTAwNjQ0Ci0tLS0gYS9zcmMvZGVmYXVsdF9vcHRp
b25zLmgKLSsrKyBiL3NyYy9kZWZhdWx0X29wdGlvbnMuaAotQEAgLTE5Nyw3ICsxOTcsNyBAQCBJ
TVBPUlRBTlQ6IFNvbWUgb3B0aW9ucyB3aWxsIHJlcXVpcmUgIm1ha2UgY2xlYW4iIGFmdGVyIGNo
YW5nZXMgKi8KLSAgKiBTbWFsbCBzeXN0ZW1zIHNob3VsZCBnZW5lcmFsbHkgaW5jbHVkZSBlaXRo
ZXIgY3VydmUyNTUxOSBvciBlY2RoIGZvciBwZXJmb3JtYW5jZS4KLSAgKiBjdXJ2ZTI1NTE5IGlz
IGxlc3Mgd2lkZWx5IHN1cHBvcnRlZCBidXQgaXMgZmFzdGVyCi0gICovCi0tI2RlZmluZSBEUk9Q
QkVBUl9ESF9HUk9VUDE0X1NIQTEgMQotKyNkZWZpbmUgRFJPUEJFQVJfREhfR1JPVVAxNF9TSEEx
IDAKLSAjZGVmaW5lIERST1BCRUFSX0RIX0dST1VQMTRfU0hBMjU2IDEKLSAjZGVmaW5lIERST1BC
RUFSX0RIX0dST1VQMTYgMAotICNkZWZpbmUgRFJPUEJFQVJfQ1VSVkUyNTUxOSAxCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI0Ljg2LmJiIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNS44OC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8y
MDI0Ljg2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8y
MDI1Ljg4LmJiCmluZGV4IGJlMjQ2YTBjY2QuLjUxNzI2M2I0ZjIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjQuODYuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNS44OC5iYgpAQCAtMjMsNyArMjMsNyBAQCBT
UkNfVVJJID0gImh0dHA6Ly9tYXR0LnVjYy5hc24uYXUvZHJvcGJlYXIvcmVsZWFzZXMvZHJvcGJl
YXItJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNL
QUdFQ09ORklHJywgJ2Rpc2FibGUtd2Vhay1jaXBoZXJzJywgJ2ZpbGU6Ly9kcm9wYmVhci1kaXNh
YmxlLXdlYWstY2lwaGVycy5wYXRjaCcsICcnLCBkKX0gXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJlNzg5MzZkZmZjMzk1ZjJlMGRiMDk5MzIxZDZiZTY1OTE5MDk2NmI5
OTcxMmI1NWM1MzBkZDBhMTgyMmUwYTVlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc4M2Y1MGVh
MjdiMTdjMTZkYTg5NTc4ZmFmZGI2ZGVjZmE0NGJiOGY2NTkwZTU2OThhNGU0ZDM2NzJkYzUzZDQi
CiAKIFBBTV9TUkNfVVJJID0gImZpbGU6Ly8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2gg
XAogICAgICAgICAgICAgICAgZmlsZTovLzAwMDYtZHJvcGJlYXItY29uZmlndXJhdGlvbi1maWxl
LnBhdGNoIFwKLS0gCjIuNDcuMQoK

--===============2621608053642032176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2025.88.bb: Unable to get checksum for dropbear SRC_URI entry dropbear-disable-weak-ciphers.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.88/poky/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/poky/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/poky/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.88/qemux86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/qemux86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/qemux86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.88/qemuall/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/qemuall/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/qemuall/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.88/x86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/x86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/x86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.88/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/dropbear-disable-weak-ciphers.patch
ERROR: Parsing halted due to errors, see error messages above

--===============2621608053642032176==--

