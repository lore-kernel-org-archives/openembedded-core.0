Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF750C27C42
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1093.1714579215146077115
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ACZ9TmWb;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NU9Tj9ap;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f34e28ff8-0ce13086-41ce-46a6-acf9-ca7dbdf73c60-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u808l298x92rhe9YYMc3vWEqZqfDlY6i8mvDD8uvCc8=;
	b=ACZ9TmWbmORN0bzEdtxYBmXRDUmmDbcneaVzwk364rv9ebL3CZln529Pn8/EQGS7
	L3FRwsa0VW5fjsUtLGeDYbRtaKqnBSKr1hfN/OF5XDVfgzzZKW8NoEhDpwQztvC0M7i
	1r70B4+gTpMZ93skXt445vtVRFhmEHsWrjNt7Q2w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u808l298x92rhe9YYMc3vWEqZqfDlY6i8mvDD8uvCc8=;
	b=NU9Tj9apljcA87GSEjQDOTd+WkcMCnDP5s6Snfo1xrfZROQJTEsT+W/0sns0Ensa
	aaqaJMO24KQtox0uTox79LoOY3zEBAOaPR1Vfafxx9LdOWqPxADuK9vJX4ip8Sx4zec
	wjh3iHH5OCRm1i81KY+tVP7Z5SeqHVnOxEgPT5gQ=
Content-Type: multipart/mixed; boundary="===============1209695059728147877=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2024.85 SUCCEEDED
Message-ID: <0101018f34e28ff8-0ce13086-41ce-46a6-acf9-ca7dbdf73c60-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198794

--===============1209695059728147877==
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
From 200af49f572c2eba4b215730c54e658006c1e686 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 05:17:56 +0000
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
index c74f09e484..0cf572a02a 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,7 @@
-Subject: [PATCH 1/6] urandom-xauth-changes-to-options.h
+From 431c421cf3ad93f580efd401e0ad8d9fa08d3f3d Mon Sep 17 00:00:00 2001
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
index fe667ddc25..ee7d46ed17 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,7 +1,7 @@
-From b8cece92ba19aa77ac013ea161bfe4c7147747c9 Mon Sep 17 00:00:00 2001
+From 70959c18d1fd89329e6bdd3d782929dc60ce8449 Mon Sep 17 00:00:00 2001
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
index f54f634a4e..40f36d1362 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From e3a5db1b6d3f6382a15b2266458c26c645a10f18 Mon Sep 17 00:00:00 2001
+From 94873be8ee31d9ea0adc3c5eeb7ba08124640ed2 Mon Sep 17 00:00:00 2001
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
index f998caa255..5946d051f2 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
@@ -1,4 +1,4 @@
-From c347ece05a7fdbf50d76cb136b9ed45caed333f6 Mon Sep 17 00:00:00 2001
+From e7f91072fb5be30ad83acb8d0f0f0fc7a20f7617 Mon Sep 17 00:00:00 2001
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
index 69c7b04c55..90e3f1d0bd 100644
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


--===============1209695059728147877==
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
packages/core2-64-poky-linux/dropbear/dropbear-src: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear-src: PKGSIZE changed from 1411613 to 1411745 (+0%)
packages/core2-64-poky-linux/dropbear/dropbear-src: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear/dropbear-staticdev: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear-staticdev: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear/dropbear: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear/dropbear: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear: PV changed from "2024.84" to "2024.85"
packages/core2-64-poky-linux/dropbear: PKGV changed from 2024.84 [default] to 2024.85 [default]
packages/core2-64-poky-linux/dropbear: SRC_URI changed from "http://matt.ucc.asn.au/dropbear/releases/dropbear-2024.84.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear file://dropbear-disable-weak-ciphers.patch" to "http://matt.ucc.asn.au/dropbear/releases/dropbear-2024.85.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear file://dropbear-disable-weak-ciphers.patch"

--===============1209695059728147877==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2024.84-2024.85.patch"

RnJvbSAyMDBhZjQ5ZjU3MmMyZWJhNGIyMTU3MzBjNTRlNjU4MDA2YzFlNjg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNToxNzo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRy
b3BiZWFyOiB1cGdyYWRlIDIwMjQuODQgLT4gMjAyNC44NQoKLS0tCiAuLi4vMDAwMS11cmFuZG9t
LXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoICAgfCAgOCArKysrLS0tLQogLi4uL2Ry
b3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCAgICAgICAgIHwgMTMgKysrKyst
LS0tLS0tLQogLi4uL2Ryb3BiZWFyLzAwMDYtZHJvcGJlYXItY29uZmlndXJhdGlvbi1maWxlLnBh
dGNoIHwgMTEgKysrKy0tLS0tLS0KIC4uLi9kcm9wYmVhci9kcm9wYmVhci1kaXNhYmxlLXdlYWst
Y2lwaGVycy5wYXRjaCAgICB8ICA5ICsrKy0tLS0tLQogLi4uL3tkcm9wYmVhcl8yMDI0Ljg0LmJi
ID0+IGRyb3BiZWFyXzIwMjQuODUuYmJ9ICAgIHwgIDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUv
ZHJvcGJlYXIve2Ryb3BiZWFyXzIwMjQuODQuYmIgPT4gZHJvcGJlYXJfMjAyNC44NS5iYn0gKDk4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDAx
LXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDAxLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRp
b25zLmgucGF0Y2gKaW5kZXggYzc0ZjA5ZTQ4NC4uMGNmNTcyYTAyYSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwMS11cmFuZG9tLXhhdXRoLWNoYW5n
ZXMtdG8tb3B0aW9ucy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ry
b3BiZWFyLzAwMDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5wYXRjaApAQCAt
MSw0ICsxLDcgQEAKLVN1YmplY3Q6IFtQQVRDSCAxLzZdIHVyYW5kb20teGF1dGgtY2hhbmdlcy10
by1vcHRpb25zLmgKK0Zyb20gNDMxYzQyMWNmM2FkOTNmNTgwZWZkNDAxZTBhZDhkOWZhMDhkM2Yz
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
QG9wZW5lZGhhbmQuY29tPgorRGF0ZTogV2VkLCAzMSBBdWcgMjAwNSAxMDo0NTo0NyArMDAwMAor
U3ViamVjdDogW1BBVENIXSB1cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oCiAKIFVw
c3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29uZmlndXJhdGlvbl0KIC0tLQpAQCAtMTgs
NiArMjEsMyBAQCBpbmRleCA2ZTk3MGJiLi5jY2M4YjQ3IDEwMDY0NAogIAogIAogIC8qIElmIHlv
dSB3YW50IHRvIGVuYWJsZSBydW5uaW5nIGFuIHNmdHAgc2VydmVyIChzdWNoIGFzIHRoZSBvbmUg
aW5jbHVkZWQgd2l0aAotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1lbmFibGUtcGFtLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1lbmFibGUtcGFt
LnBhdGNoCmluZGV4IGZlNjY3ZGRjMjUuLmVlN2Q0NmVkMTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA1LWRyb3BiZWFy
LWVuYWJsZS1wYW0ucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGI4Y2VjZTkyYmExOWFhNzdh
YzAxM2VhMTYxYmZlNGM3MTQ3NzQ3YzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDcw
OTU5YzE4ZDFmZDg5MzI5ZTZiZGQzZDc4MjkyOWRjNjBjZTg0NDkgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgog
RGF0ZTogV2VkLCAyIERlYyAyMDE1IDExOjM2OjAyICswMjAwCi1TdWJqZWN0OiBFbmFibGUgcGFt
CitTdWJqZWN0OiBbUEFUQ0hdIEVuYWJsZSBwYW0KIAogV2UgbmVlZCBtb2RpZnkgZmlsZSBkZWZh
dWx0X29wdGlvbnMuaCBiZXNpZGVzIGVuYWJsaW5nIHBhbSBpbgogY29uZmlndXJlIGlmIHdlIHdh
bnQgZHJvcGJlYXIgdG8gc3VwcG9ydCBwYW0uCkBAIC0xNSwxMCArMTUsMTAgQEAgU2lnbmVkLW9m
Zi1ieTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEv
c3JjL2RlZmF1bHRfb3B0aW9ucy5oIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1pbmRleCAwZTNk
MDI3Li4zNDkzMzhjIDEwMDY0NAoraW5kZXggY2NjOGI0Ny4uMTI3NjhkMSAxMDA2NDQKIC0tLSBh
L3NyYy9kZWZhdWx0X29wdGlvbnMuaAogKysrIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1AQCAt
MjEwLDcgKzIxMCw3IEBAIGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCitAQCAtMjI4
LDcgKzIyOCw3IEBAIGdyb3VwMSBpbiBEcm9wYmVhciBzZXJ2ZXIgdG9vICovCiAgCiAgLyogQXV0
aGVudGljYXRpb24gVHlwZXMgLSBhdCBsZWFzdCBvbmUgcmVxdWlyZWQuCiAgICAgUkZDIERyYWZ0
IHJlcXVpcmVzIHB1YmtleSBhdXRoLCBhbmQgcmVjb21tZW5kcyBwYXNzd29yZCAqLwpAQCAtMjcs
NyArMjcsNyBAQCBpbmRleCAwZTNkMDI3Li4zNDkzMzhjIDEwMDY0NAogIAogIC8qIE5vdGU6IFBB
TSBhdXRoIGlzIHF1aXRlIHNpbXBsZSBhbmQgb25seSB3b3JrcyBmb3IgUEFNIG1vZHVsZXMgd2hp
Y2gganVzdCBkbwogICAqIGEgc2ltcGxlICJMb2dpbjogIiAiUGFzc3dvcmQ6ICIgKHlvdSBjYW4g
ZWRpdCB0aGUgc3RyaW5ncyBpbiBzdnItYXV0aHBhbS5jKS4KLUBAIC0yMTgsNyArMjE4LDcgQEAg
Z3JvdXAxIGluIERyb3BiZWFyIHNlcnZlciB0b28gKi8KK0BAIC0yMzYsNyArMjM2LDcgQEAgZ3Jv
dXAxIGluIERyb3BiZWFyIHNlcnZlciB0b28gKi8KICAgKiBidXQgdGhlcmUncyBhbiBpbnRlcmZh
Y2UgdmlhIGEgUEFNIG1vZHVsZS4gSXQgd29uJ3Qgd29yayBmb3IgbW9yZSBjb21wbGV4CiAgICog
UEFNIGNoYWxsZW5nZS9yZXNwb25zZS4KICAgKiBZb3UgY2FuJ3QgZW5hYmxlIGJvdGggUEFTU1dP
UkQgYW5kIFBBTS4gKi8KQEAgLTM2LDYgKzM2LDMgQEAgaW5kZXggMGUzZDAyNy4uMzQ5MzM4YyAx
MDA2NDQKICAKICAvKiB+Ly5zc2gvYXV0aG9yaXplZF9rZXlzIGF1dGhlbnRpY2F0aW9uLgogICAq
IFlvdSBtdXN0IGRlZmluZSBEUk9QQkVBUl9TVlJfUFVCS0VZX0FVVEggaW4gb3JkZXIgdG8gdXNl
IHBsdWdpbnMuICovCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDYtZHJvcGJlYXItY29u
ZmlndXJhdGlvbi1maWxlLnBhdGNoCmluZGV4IGY1NGY2MzRhNGUuLjQwZjM2ZDEzNjIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDYtZHJvcGJlYXIt
Y29uZmlndXJhdGlvbi1maWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFy
L2Ryb3BiZWFyLzAwMDYtZHJvcGJlYXItY29uZmlndXJhdGlvbi1maWxlLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBlM2E1ZGIxYjZkM2Y2MzgyYTE1YjIyNjY0NThjMjZjNjQ1YTEwZjE4IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NDg3M2JlOGVlMzFkOWVhMGFkYzNjNWVlYjdi
YTA4MTI0NjQwZWQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2xpIFl1IDxN
aW5nbGkuWXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgNiBTZXAgMjAxOCAxNTo1NDowMCAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBkcm9wYmVhciBjb25maWd1cmF0aW9uIGZpbGUKQEAgLTE1
LDExICsxNSwxMSBAQCBTaWduZWQtb2ZmLWJ5OiBNaW5nbGkgWXUgPE1pbmdsaS5ZdUB3aW5kcml2
ZXIuY29tPgogIHNyYy9zdnItYXV0aHBhbS5jIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCi1kaWZmIC0tZ2l0IGEvc3JlYy9zdnItYXV0aHBh
bS5jIGIvc3JjL3N2ci1hdXRocGFtLmMKLWluZGV4IGQyMDFiYzkuLjE2NWVjNWMgMTAwNjQ0Citk
aWZmIC0tZ2l0IGEvc3JjL3N2ci1hdXRocGFtLmMgYi9zcmMvc3ZyLWF1dGhwYW0uYworaW5kZXgg
ZWMxNDYzMi4uMDI2MTAyZiAxMDA2NDQKIC0tLSBhL3NyYy9zdnItYXV0aHBhbS5jCiArKysgYi9z
cmMvc3ZyLWF1dGhwYW0uYwotQEAgLTIyMyw3ICsyMjMsNyBAQCB2b2lkIHN2cl9hdXRoX3BhbShp
bnQgdmFsaWRfdXNlcikgeworQEAgLTIyNCw3ICsyMjQsNyBAQCB2b2lkIHN2cl9hdXRoX3BhbShp
bnQgdmFsaWRfdXNlcikgewogIAl9CiAgCiAgCS8qIEluaXQgcGFtICovCkBAIC0yOCw2ICsyOCwz
IEBAIGluZGV4IGQyMDFiYzkuLjE2NWVjNWMgMTAwNjQ0CiAgCQlkcm9wYmVhcl9sb2coTE9HX1dB
Uk5JTkcsICJwYW1fc3RhcnQoKSBmYWlsZWQsIHJjPSVkLCAlcyIsIAogIAkJCQlyYywgcGFtX3N0
cmVycm9yKHBhbUhhbmRsZXAsIHJjKSk7CiAgCQlnb3RvIGNsZWFudXA7Ci0tLSAKLTIuNy40Ci0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyL2Ryb3BiZWFy
LWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIv
ZHJvcGJlYXIvZHJvcGJlYXItZGlzYWJsZS13ZWFrLWNpcGhlcnMucGF0Y2gKaW5kZXggZjk5OGNh
YTI1NS4uNTk0NmQwNTFmMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIv
ZHJvcGJlYXIvZHJvcGJlYXItZGlzYWJsZS13ZWFrLWNpcGhlcnMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvZHJvcGJlYXItZGlzYWJsZS13ZWFrLWNpcGhl
cnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMzNDdlY2UwNWE3ZmRiZjUwZDc2Y2IxMzZi
OWVkNDVjYWVkMzMzZjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU3ZjkxMDcyZmI1
YmUzMGFkODNhY2I4ZDBmMGYwZmM3YTIwZjc2MTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKb3NlcGggUmV5bm9sZHMgPGpvc2VwaC5yZXlub2xkczFAaWJtLmNvbT4KIERhdGU6IFRo
dSwgMjAgSnVuIDIwMTkgMTY6Mjk6MTUgLTA1MDAKIFN1YmplY3Q6IFtQQVRDSF0gZHJvcGJlYXI6
IG5ldyBmZWF0dXJlOiBkaXNhYmxlLXdlYWstY2lwaGVycwpAQCAtMTQsMTAgKzE0LDEwIEBAIFNp
Z25lZC1vZmYtYnk6IEpvc2VwaCBSZXlub2xkcyA8am9zZXBoLnJleW5vbGRzMUBpYm0uY29tPgog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvc3JjL2RlZmF1bHRfb3B0aW9ucy5oIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5oCi1pbmRl
eCBkNDE3NTg4Li5iYzUyMDBmIDEwMDY0NAoraW5kZXggMTI3NjhkMS4uMmIwNzQ5NyAxMDA2NDQK
IC0tLSBhL3NyYy9kZWZhdWx0X29wdGlvbnMuaAogKysrIGIvc3JjL2RlZmF1bHRfb3B0aW9ucy5o
Ci1AQCAtMTgwLDcgKzE4MCw3IEBAIElNUE9SVEFOVDogU29tZSBvcHRpb25zIHdpbGwgcmVxdWly
ZSAibWFrZSBjbGVhbiIgYWZ0ZXIgY2hhbmdlcyAqLworQEAgLTE5Nyw3ICsxOTcsNyBAQCBJTVBP
UlRBTlQ6IFNvbWUgb3B0aW9ucyB3aWxsIHJlcXVpcmUgIm1ha2UgY2xlYW4iIGFmdGVyIGNoYW5n
ZXMgKi8KICAgKiBTbWFsbCBzeXN0ZW1zIHNob3VsZCBnZW5lcmFsbHkgaW5jbHVkZSBlaXRoZXIg
Y3VydmUyNTUxOSBvciBlY2RoIGZvciBwZXJmb3JtYW5jZS4KICAgKiBjdXJ2ZTI1NTE5IGlzIGxl
c3Mgd2lkZWx5IHN1cHBvcnRlZCBidXQgaXMgZmFzdGVyCiAgICovCkBAIC0yNiw2ICsyNiwzIEBA
IGluZGV4IGQ0MTc1ODguLmJjNTIwMGYgMTAwNjQ0CiAgI2RlZmluZSBEUk9QQkVBUl9ESF9HUk9V
UDE0X1NIQTI1NiAxCiAgI2RlZmluZSBEUk9QQkVBUl9ESF9HUk9VUDE2IDAKICAjZGVmaW5lIERS
T1BCRUFSX0NVUlZFMjU1MTkgMQotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNC44NC5iYiBiL21ldGEvcmVjaXBlcy1jb3Jl
L2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjQuODUuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNC44NC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNC44NS5iYgppbmRl
eCA2OWM3YjA0YzU1Li45MGUzZjFkMGJkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9k
cm9wYmVhci9kcm9wYmVhcl8yMDI0Ljg0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3Bi
ZWFyL2Ryb3BiZWFyXzIwMjQuODUuYmIKQEAgLTIzLDcgKzIzLDcgQEAgU1JDX1VSSSA9ICJodHRw
Oi8vbWF0dC51Y2MuYXNuLmF1L2Ryb3BiZWFyL3JlbGVhc2VzL2Ryb3BiZWFyLSR7UFZ9LnRhci5i
ejIgXAogICAgICAgICAgICAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdk
aXNhYmxlLXdlYWstY2lwaGVycycsICdmaWxlOi8vZHJvcGJlYXItZGlzYWJsZS13ZWFrLWNpcGhl
cnMucGF0Y2gnLCAnJywgZCl9IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMTZlMjJiNjZiMzMzZDZiN2U1MDRjNDM2NzlkMDRlZDZjYTMwZjI4MzhkYjQwYTIxZjkzNWM4
NTBkZmMwMTAwOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4NmIwMzZjNDMzYTY5ZDg5Y2U1MWVi
YWUzMzVkNjVjNDc3MzhjY2Y5MGQxM2U1ZWIwZmVhODMyZTU1NmRhNTAyIgogCiBQQU1fU1JDX1VS
SSA9ICJmaWxlOi8vMDAwNS1kcm9wYmVhci1lbmFibGUtcGFtLnBhdGNoIFwKICAgICAgICAgICAg
ICAgIGZpbGU6Ly8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaCBcCi0tIAoy
LjQ0LjAKCg==

--===============1209695059728147877==--

