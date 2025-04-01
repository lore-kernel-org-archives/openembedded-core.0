Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624F1C369A5
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.18040.1743511391276820323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DjUM1F6Q;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gpQwRuAS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195f16089c6-17df1310-60f8-4aa1-a4b3-b8096cca6cb4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LomGBA2zMcl1RmaHnx9TN5jEEsgay9Oe/bGof1CR2Sg=;
	b=DjUM1F6QXG6vAa1dBGwgLZ4AAdULJW9XugJjGi39V/Wpho4F7kyWTnc3bmAeWoOI
	jvzCbFV8T1WvUcdwCk3Z0Q5/t2HbksUjzH4UfNpMurC8lo3VIl87bWpCni1fUupC26N
	K5jCJ4RE7JAgkbR7DvVZjgmAQlfvF09Qp+GbTS3s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511390;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LomGBA2zMcl1RmaHnx9TN5jEEsgay9Oe/bGof1CR2Sg=;
	b=gpQwRuASSzFDwrKos9xG64rjpJZZUrF6hJFpF3qTrpn+9RQeqzFmiI1EWkFAyG/Z
	dY+4ScMLtgTVPwcq2odbuj1weRwUNIhsa/6uWKfu51ZhhxM4r2CwcxsbH/5eQqTWiLg
	aYp3GSLTZyHir3NaUZNsjQAkpr6Zp1z77vMquZeA=
Content-Type: multipart/mixed; boundary="===============3301727741226014130=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2025.87 FAILED
Message-ID: <01010195f16089c6-17df1310-60f8-4aa1-a4b3-b8096cca6cb4-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214036

--===============3301727741226014130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dropbear* to *2025.87* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2024.86-2025.87.patch
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
From 02a25838ad81da16c983f4d43a1a34b64f0ac07d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 07:24:06 +0000
Subject: [PATCH] dropbear: upgrade 2024.86 -> 2025.87

---
 ...1-urandom-xauth-changes-to-options.h.patch |  6 ++--
 .../dropbear/0005-dropbear-enable-pam.patch   |  8 +++---
 .../0006-dropbear-configuration-file.patch    |  2 +-
 .../dropbear-disable-weak-ciphers.patch       | 28 -------------------
 ...ropbear_2024.86.bb => dropbear_2025.87.bb} |  2 +-
 5 files changed, 9 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
 rename meta/recipes-core/dropbear/{dropbear_2024.86.bb => dropbear_2025.87.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 9c1dd3f606..8b010ab2b8 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,4 @@
-From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From ef7a9ccc09d559b584c9e2da1066af65fe8e75cb Mon Sep 17 00:00:00 2001
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
index 6743f506e9..d7d0eeee6e 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,4 +1,4 @@
-From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
+From d3102e74124f5d815e94c11c69ae50a087cb591c Mon Sep 17 00:00:00 2001
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
index 44861088cc..06b10efe7d 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
+From 75839803aaa4d272b7877a4492ec170674ed7405 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2025.87.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2024.86.bb
rename to meta/recipes-core/dropbear/dropbear_2025.87.bb
index be246a0ccd..e0cfbe67d7 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.87.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            "
 
-SRC_URI[sha256sum] = "e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e"
+SRC_URI[sha256sum] = "738b7f358547f0c64c3e1a56bbc5ef98d34d9ec6adf9ccdf01dc0bf2caa2bc8d"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.47.1


--===============3301727741226014130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2025.87.bb: Unable to get checksum for dropbear SRC_URI entry dropbear-disable-weak-ciphers.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.87/poky/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/poky/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/poky/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.87/qemux86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/qemux86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/qemux86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.87/qemuall/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/qemuall/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/qemuall/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.87/x86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/x86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/x86-64/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear-2025.87/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/files/dropbear-disable-weak-ciphers.patch
ERROR: Parsing halted due to errors, see error messages above

--===============3301727741226014130==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2024.86-2025.87.patch"

RnJvbSAwMmEyNTgzOGFkODFkYTE2Yzk4M2Y0ZDQzYTFhMzRiNjRmMGFjMDdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNzoyNDowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRy
b3BiZWFyOiB1cGdyYWRlIDIwMjQuODYgLT4gMjAyNS44NwoKLS0tCiAuLi4xLXVyYW5kb20teGF1
dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2ggfCAgNiArKy0tCiAuLi4vZHJvcGJlYXIvMDAw
NS1kcm9wYmVhci1lbmFibGUtcGFtLnBhdGNoICAgfCAgOCArKystLS0KIC4uLi8wMDA2LWRyb3Bi
ZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaCAgICB8ICAyICstCiAuLi4vZHJvcGJlYXItZGlz
YWJsZS13ZWFrLWNpcGhlcnMucGF0Y2ggICAgICAgfCAyOCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5yb3BiZWFyXzIwMjQuODYuYmIgPT4gZHJvcGJlYXJfMjAyNS44Ny5iYn0gfCAgMiArLQogNSBm
aWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyL2Ryb3BiZWFyLWRp
c2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJl
YXIve2Ryb3BiZWFyXzIwMjQuODYuYmIgPT4gZHJvcGJlYXJfMjAyNS44Ny5iYn0gKDk4JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDAxLXVyYW5k
b20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9k
cm9wYmVhci9kcm9wYmVhci8wMDAxLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgu
cGF0Y2gKaW5kZXggOWMxZGQzZjYwNi4uOGIwMTBhYjJiOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8t
b3B0aW9ucy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFy
LzAwMDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gY2RjNmE0YTU3YTg2ZDgxMTZhOTJhNWQ5MDU5OTNlNjVjZjcyMzU1NiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWY3YTljY2MwOWQ1NTliNTg0YzllMmRhMTA2NmFm
NjVmZThlNzVjYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkQG9wZW5lZGhhbmQuY29tPgogRGF0ZTogV2VkLCAzMSBBdWcgMjAwNSAxMDo0NTo0
NyArMDAwMAogU3ViamVjdDogW1BBVENIXSB1cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9u
cy5oCkBAIC05LDEwICs5LDEwIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29u
ZmlndXJhdGlvbl0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIAogZGlmZiAtLWdpdCBhL3NyYy9kZWZhdWx0X29wdGlvbnMuaCBiL3NyYy9kZWZhdWx0X29w
dGlvbnMuaAotaW5kZXggNmU5NzBiYi4uY2NjOGI0NyAxMDA2NDQKK2luZGV4IDZlNThhMjkuLjVk
ZGFhNTkgMTAwNjQ0CiAtLS0gYS9zcmMvZGVmYXVsdF9vcHRpb25zLmgKICsrKyBiL3NyYy9kZWZh
dWx0X29wdGlvbnMuaAotQEAgLTMxMSw3ICszMTEsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2Vy
dmVyIHRvbyAqLworQEAgLTMxNyw3ICszMTcsNyBAQCBncm91cDEgaW4gRHJvcGJlYXIgc2VydmVy
IHRvbyAqLwogIAogIC8qIFRoZSBjb21tYW5kIHRvIGludm9rZSBmb3IgeGF1dGggd2hlbiB1c2lu
ZyBYMTEgZm9yd2FyZGluZy4KICAgKiAiLXEiIGZvciBxdWlldCAqLwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1lbmFibGUtcGFt
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVh
ci1lbmFibGUtcGFtLnBhdGNoCmluZGV4IDY3NDNmNTA2ZTkuLmQ3ZDBlZWVlNmUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5h
YmxlLXBhbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8w
MDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI1M2Nh
MDFmMGZjNTBkYmFlYjJmZjhiY2VjZTBjMzQyNTZlYmE5NGYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGQzMTAyZTc0MTI0ZjVkODE1ZTk0YzExYzY5YWU1MGEwODdjYjU5MWMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5A
aW50ZWwuY29tPgogRGF0ZTogV2VkLCAyIERlYyAyMDE1IDExOjM2OjAyICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEVuYWJsZSBwYW0KQEAgLTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBK
dXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZGVm
YXVsdF9vcHRpb25zLmggYi9zcmMvZGVmYXVsdF9vcHRpb25zLmgKLWluZGV4IGNjYzhiNDcuLjEy
NzY4ZDEgMTAwNjQ0CitpbmRleCA1ZGRhYTU5Li4yMjIxNDQyIDEwMDY0NAogLS0tIGEvc3JjL2Rl
ZmF1bHRfb3B0aW9ucy5oCiArKysgYi9zcmMvZGVmYXVsdF9vcHRpb25zLmgKLUBAIC0yMjgsNyAr
MjI4LDcgQEAgZ3JvdXAxIGluIERyb3BiZWFyIHNlcnZlciB0b28gKi8KK0BAIC0yMzQsNyArMjM0
LDcgQEAgZ3JvdXAxIGluIERyb3BiZWFyIHNlcnZlciB0b28gKi8KICAKICAvKiBBdXRoZW50aWNh
dGlvbiBUeXBlcyAtIGF0IGxlYXN0IG9uZSByZXF1aXJlZC4KICAgICBSRkMgRHJhZnQgcmVxdWly
ZXMgcHVia2V5IGF1dGgsIGFuZCByZWNvbW1lbmRzIHBhc3N3b3JkICovCkBAIC0yNyw3ICsyNyw3
IEBAIGluZGV4IGNjYzhiNDcuLjEyNzY4ZDEgMTAwNjQ0CiAgCiAgLyogTm90ZTogUEFNIGF1dGgg
aXMgcXVpdGUgc2ltcGxlIGFuZCBvbmx5IHdvcmtzIGZvciBQQU0gbW9kdWxlcyB3aGljaCBqdXN0
IGRvCiAgICogYSBzaW1wbGUgIkxvZ2luOiAiICJQYXNzd29yZDogIiAoeW91IGNhbiBlZGl0IHRo
ZSBzdHJpbmdzIGluIHN2ci1hdXRocGFtLmMpLgotQEAgLTIzNiw3ICsyMzYsNyBAQCBncm91cDEg
aW4gRHJvcGJlYXIgc2VydmVyIHRvbyAqLworQEAgLTI0Miw3ICsyNDIsNyBAQCBncm91cDEgaW4g
RHJvcGJlYXIgc2VydmVyIHRvbyAqLwogICAqIGJ1dCB0aGVyZSdzIGFuIGludGVyZmFjZSB2aWEg
YSBQQU0gbW9kdWxlLiBJdCB3b24ndCB3b3JrIGZvciBtb3JlIGNvbXBsZXgKICAgKiBQQU0gY2hh
bGxlbmdlL3Jlc3BvbnNlLgogICAqIFlvdSBjYW4ndCBlbmFibGUgYm90aCBQQVNTV09SRCBhbmQg
UEFNLiAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIv
MDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRj
aAppbmRleCA0NDg2MTA4OGNjLi4wNmIxMGVmZTdkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3Bi
ZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTZiMTQ3
Zjk3ZjA5MzhjZGRiNTVlYzFjOTBiYzkxOWMxM2YyNmZjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNzU4Mzk4MDNhYWE0ZDI3MmI3ODc3YTQ0OTJlYzE3MDY3NGVkNzQwNSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8TWluZ2xpLll1QHdpbmRyaXZlci5j
b20+CiBEYXRlOiBUaHUsIDYgU2VwIDIwMTggMTU6NTQ6MDAgKzA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gZHJvcGJlYXIgY29uZmlndXJhdGlvbiBmaWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9kcm9wYmVhci9kcm9wYmVhci9kcm9wYmVhci1kaXNhYmxlLXdlYWstY2lwaGVycy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyL2Ryb3BiZWFyLWRpc2FibGUt
d2Vhay1jaXBoZXJzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBhMjA3ODFk
MzFkLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFy
L2Ryb3BiZWFyLWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEs
MjggKzAsMCBAQAotRnJvbSBjOGEwYzhlODdiNzcyNTc2ZjNhNDMxYzNiNGNhY2FmNWFhMDAxZGNj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogSm9zZXBoIFJleW5vbGRzIDxqb3NlcGgu
cmV5bm9sZHMxQGlibS5jb20+Ci1EYXRlOiBUaHUsIDIwIEp1biAyMDE5IDE2OjI5OjE1IC0wNTAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIGRyb3BiZWFyOiBuZXcgZmVhdHVyZTogZGlzYWJsZS13ZWFrLWNp
cGhlcnMKLQotVGhpcyBmZWF0dXJlIGRpc2FibGVzIGFsbCBDQkMsIFNIQTEsIGFuZCBkaWZmaWUt
aGVsbG1hbiBncm91cDEgY2lwaGVycwotaW4gdGhlIGRyb3BiZWFyIHNzaCBzZXJ2ZXIgYW5kIGNs
aWVudCBzaW5jZSB0aGV5J3JlIGNvbnNpZGVyZWQgd2VhayBjaXBoZXJzCi1hbmQgd2Ugd2FudCB0
byBzdXBwb3J0IHRoZSBzdG9uZyBhbGdvcml0aG1zLgotCi1VcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCi1TaWduZWQtb2ZmLWJ5OiBKb3NlcGggUmV5bm9sZHMg
PGpvc2VwaC5yZXlub2xkczFAaWJtLmNvbT4KLS0tLQotIHNyYy9kZWZhdWx0X29wdGlvbnMuaCB8
IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQot
ZGlmZiAtLWdpdCBhL3NyYy9kZWZhdWx0X29wdGlvbnMuaCBiL3NyYy9kZWZhdWx0X29wdGlvbnMu
aAotaW5kZXggMTI3NjhkMS4uMmIwNzQ5NyAxMDA2NDQKLS0tLSBhL3NyYy9kZWZhdWx0X29wdGlv
bnMuaAotKysrIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1AQCAtMTk3LDcgKzE5Nyw3IEBAIElN
UE9SVEFOVDogU29tZSBvcHRpb25zIHdpbGwgcmVxdWlyZSAibWFrZSBjbGVhbiIgYWZ0ZXIgY2hh
bmdlcyAqLwotICAqIFNtYWxsIHN5c3RlbXMgc2hvdWxkIGdlbmVyYWxseSBpbmNsdWRlIGVpdGhl
ciBjdXJ2ZTI1NTE5IG9yIGVjZGggZm9yIHBlcmZvcm1hbmNlLgotICAqIGN1cnZlMjU1MTkgaXMg
bGVzcyB3aWRlbHkgc3VwcG9ydGVkIGJ1dCBpcyBmYXN0ZXIKLSAgKi8KLS0jZGVmaW5lIERST1BC
RUFSX0RIX0dST1VQMTRfU0hBMSAxCi0rI2RlZmluZSBEUk9QQkVBUl9ESF9HUk9VUDE0X1NIQTEg
MAotICNkZWZpbmUgRFJPUEJFQVJfREhfR1JPVVAxNF9TSEEyNTYgMQotICNkZWZpbmUgRFJPUEJF
QVJfREhfR1JPVVAxNiAwCi0gI2RlZmluZSBEUk9QQkVBUl9DVVJWRTI1NTE5IDEKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjQuODYuYmIgYi9tZXRh
L3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI1Ljg3LmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIw
MjQuODYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyXzIw
MjUuODcuYmIKaW5kZXggYmUyNDZhMGNjZC4uZTBjZmJlNjdkNyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNC44Ni5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI1Ljg3LmJiCkBAIC0yMyw3ICsyMyw3IEBAIFNS
Q19VUkkgPSAiaHR0cDovL21hdHQudWNjLmFzbi5hdS9kcm9wYmVhci9yZWxlYXNlcy9kcm9wYmVh
ci0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tB
R0VDT05GSUcnLCAnZGlzYWJsZS13ZWFrLWNpcGhlcnMnLCAnZmlsZTovL2Ryb3BiZWFyLWRpc2Fi
bGUtd2Vhay1jaXBoZXJzLnBhdGNoJywgJycsIGQpfSBcCiAgICAgICAgICAgICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImU3ODkzNmRmZmMzOTVmMmUwZGIwOTkzMjFkNmJlNjU5MTkwOTY2Yjk5
NzEyYjU1YzUzMGRkMGExODIyZTBhNWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzM4YjdmMzU4
NTQ3ZjBjNjRjM2UxYTU2YmJjNWVmOThkMzRkOWVjNmFkZjljY2RmMDFkYzBiZjJjYWEyYmM4ZCIK
IAogUEFNX1NSQ19VUkkgPSAiZmlsZTovLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCBc
CiAgICAgICAgICAgICAgICBmaWxlOi8vMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUu
cGF0Y2ggXAotLSAKMi40Ny4xCgo=

--===============3301727741226014130==--

