Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EB1F42115
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19738.1776261874123920073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Z8Lpy6at;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fYThC8G6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d91753d09-b910023b-fcd9-4fd8-a1e5-78380f083141-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7wWPTtAUXRKwydS4MSKtpUSyGoiVP1riSmFPXddESpU=;
	b=Z8Lpy6atLm18sDmiC6dNMlNcHRKLX1LRcpZ/uFy2PBf7b189fjsLb7BRg7Z9yPmi
	iTFkXs8KBb2OLsurgdfdTCIqGAFubEl1nGmbDuYYISPOuDz0fZ6J4xm0dqkFv7Vo1zQ
	fFz57NxXE/no5VEEjy0yIKmf89HTV3sEAk5oGL+o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7wWPTtAUXRKwydS4MSKtpUSyGoiVP1riSmFPXddESpU=;
	b=fYThC8G6Ee6jSExg7aQRnrzVLZzOPvaFiTDi3t5niwPyfm5cbHdgA5+lf/bXYo28
	/7eqP/pgisKEY7QldVbfyBhMBrDhEQNt51PUtdsh01UuT6FajPyZGGpRI9rsAvQ13XQ
	6u2AN7JPgQtPlasznRH04WDCA7EyUDlkF+ZxEV+k=
Content-Type: multipart/mixed; boundary="===============4135152211215330828=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.9.1 FAILED
Message-ID: <0101019d91753d09-b910023b-fcd9-4fd8-a1e5-78380f083141-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235220

--===============4135152211215330828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nfs-utils* to *2.9.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-nfs-utils-upgrade-2.8.7-2.9.1.patch
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
From ffe9f1eec51ae5cc696b296af8c03bd897fee16e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 06:29:18 +0000
Subject: [PATCH] nfs-utils: upgrade 2.8.7 -> 2.9.1

---
 .../nfs-utils/0004-Use-nogroup-for-nobody-group.patch       | 6 +++---
 .../nfs-utils/0005-find-OE-provided-Kerberos.patch          | 4 ++--
 .../nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb}    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
index bbf44d5977..c17bd35c91 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
@@ -1,4 +1,4 @@
-From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From 583ffff1fb4e3e2b367c5f5048f039b642a523b1 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
@@ -11,7 +11,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf
-index 2a2f79a1..e6f3724f 100644
+index 2a2f79a..e6f3724 100644
 --- a/support/nfsidmap/idmapd.conf
 +++ b/support/nfsidmap/idmapd.conf
 @@ -41,7 +41,7 @@
@@ -24,7 +24,7 @@ index 2a2f79a1..e6f3724f 100644
  [Translation]
  
 diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index cd9a965f..3be805e9 100644
+index 5231f56..e1aa8a5 100644
 --- a/utils/idmapd/idmapd.c
 +++ b/utils/idmapd/idmapd.c
 @@ -89,7 +89,7 @@
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
index 3241e8e859..b72431d806 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
@@ -1,4 +1,4 @@
-From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From 2e36fea1056810a881fc59dcc3ab93d00564ab0e Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
@@ -10,7 +10,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
-index f96f0fd4..ad85fdf2 100644
+index f96f0fd..ad85fdf 100644
 --- a/aclocal/kerberos5.m4
 +++ b/aclocal/kerberos5.m4
 @@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 7693a88682..2a3f1e8f5a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0005-find-OE-provided-Kerberos.patch \
            "
 
-SRC_URI[sha256sum] = "59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae"
+SRC_URI[sha256sum] = "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.47.1


--===============4135152211215330828==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-2.8.7-2.9.1.patch"

RnJvbSBmZmU5ZjFlZWM1MWFlNWNjNjk2YjI5NmFmOGMwM2JkODk3ZmVlMTZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDY6Mjk6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZnMtdXRpbHM6IHVwZ3JhZGUgMi44LjcgLT4gMi45LjEKCi0tLQogLi4uL25mcy11dGlscy8wMDA0
LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2ggICAgICAgfCA2ICsrKy0tLQogLi4u
L25mcy11dGlscy8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2ggICAgICAgICAg
fCA0ICsrLS0KIC4uLi9uZnMtdXRpbHMve25mcy11dGlsc18yLjguNy5iYiA9PiBuZnMtdXRpbHNf
Mi45LjEuYmJ9ICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMv
e25mcy11dGlsc18yLjguNy5iYiA9PiBuZnMtdXRpbHNfMi45LjEuYmJ9ICg5OCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDQt
VXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3Jv
dXAucGF0Y2gKaW5kZXggYmJmNDRkNTk3Ny4uYzE3YmQzNWM5MSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDQtVXNlLW5vZ3JvdXAt
Zm9yLW5vYm9keS1ncm91cC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25m
cy11dGlscy9uZnMtdXRpbHMvMDAwNC1Vc2Utbm9ncm91cC1mb3Itbm9ib2R5LWdyb3VwLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMDE5MTNjNWViMGFhZDkzM2E5M2VlOTY2MjUyOTA1Y2Q0
NmQ3NzZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1ODNmZmZmMWZiNGUzZTJiMzY3
YzVmNTA0OGYwMzliNjQyYTUyM2IxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRGFu
aWVsIE1jR3JlZ29yIDxkYW5pZWwubWNncmVnb3JAdmVjaW1hLmNvbT4KIERhdGU6IFR1ZSwgNiBK
dW4gMjAyMyAxNjowNzo1MyAtMDYwMAogU3ViamVjdDogW1BBVENIXSBVc2UgIm5vZ3JvdXAiIGZv
ciBub2JvZHkgZ3JvdXAKQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogRGFuaWVsIE1j
R3JlZ29yIDxkYW5pZWwubWNncmVnb3JAdmVjaW1hLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3N1cHBvcnQvbmZz
aWRtYXAvaWRtYXBkLmNvbmYgYi9zdXBwb3J0L25mc2lkbWFwL2lkbWFwZC5jb25mCi1pbmRleCAy
YTJmNzlhMS4uZTZmMzcyNGYgMTAwNjQ0CitpbmRleCAyYTJmNzlhLi5lNmYzNzI0IDEwMDY0NAog
LS0tIGEvc3VwcG9ydC9uZnNpZG1hcC9pZG1hcGQuY29uZgogKysrIGIvc3VwcG9ydC9uZnNpZG1h
cC9pZG1hcGQuY29uZgogQEAgLTQxLDcgKzQxLDcgQEAKQEAgLTI0LDcgKzI0LDcgQEAgaW5kZXgg
MmEyZjc5YTEuLmU2ZjM3MjRmIDEwMDY0NAogIFtUcmFuc2xhdGlvbl0KICAKIGRpZmYgLS1naXQg
YS91dGlscy9pZG1hcGQvaWRtYXBkLmMgYi91dGlscy9pZG1hcGQvaWRtYXBkLmMKLWluZGV4IGNk
OWE5NjVmLi4zYmU4MDVlOSAxMDA2NDQKK2luZGV4IDUyMzFmNTYuLmUxYWE4YTUgMTAwNjQ0CiAt
LS0gYS91dGlscy9pZG1hcGQvaWRtYXBkLmMKICsrKyBiL3V0aWxzL2lkbWFwZC9pZG1hcGQuYwog
QEAgLTg5LDcgKzg5LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bmZzLXV0aWxzL25mcy11dGlscy8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNS1maW5k
LU9FLXByb3ZpZGVkLUtlcmJlcm9zLnBhdGNoCmluZGV4IDMyNDFlOGU4NTkuLmI3MjQzMWQ4MDYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGls
cy8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDUtZmluZC1PRS1wcm92aWRlZC1L
ZXJiZXJvcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTJhZjI2NmYwMTM3MjJhNjRjNWQw
NGUwZmUwOTdjZDcxMTM5M2E1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmUzNmZl
YTEwNTY4MTBhODgxZmM1OWRjYzNhYjkzZDAwNTY0YWIwZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IERhbmllbCBNY0dyZWdvciA8ZGFuaWVsLm1jZ3JlZ29yQHZlY2ltYS5jb20+CiBE
YXRlOiBXZWQsIDggTm92IDIwMjMgMTY6MjQ6MjAgLTA2MDAKIFN1YmplY3Q6IFtQQVRDSF0gZmlu
ZCBPRSBwcm92aWRlZCBLZXJiZXJvcwpAQCAtMTAsNyArMTAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgTWNHcmVnb3IgPGRhbmllbC5tY2dyZWdvckB2ZWNpbWEuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9hY2xv
Y2FsL2tlcmJlcm9zNS5tNCBiL2FjbG9jYWwva2VyYmVyb3M1Lm00Ci1pbmRleCBmOTZmMGZkNC4u
YWQ4NWZkZjIgMTAwNjQ0CitpbmRleCBmOTZmMGZkLi5hZDg1ZmRmIDEwMDY0NAogLS0tIGEvYWNs
b2NhbC9rZXJiZXJvczUubTQKICsrKyBiL2FjbG9jYWwva2VyYmVyb3M1Lm00CiBAQCAtMjIsOCAr
MjIsOCBAQCBBQ19ERUZVTihbQUNfS0VSQkVST1NfVjVdLFsKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18yLjguNy5iYiBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18yLjkuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGls
cy9uZnMtdXRpbHNfMi44LjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bmZzLXV0aWxzL25mcy11dGlsc18yLjkuMS5iYgppbmRleCA3NjkzYTg4NjgyLi4yYTNmMWU4ZjVh
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRp
bHNfMi44LjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZz
LXV0aWxzXzIuOS4xLmJiCkBAIC0yNSw3ICsyNSw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdf
TUlSUk9SfS9saW51eC91dGlscy9uZnMtdXRpbHMvJHtQVn0vbmZzLXV0aWxzLSR7UFZ9LnRhci54
CiAgICAgICAgICAgIGZpbGU6Ly8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gg
XAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1OWQwZjFlMTdiMThlZmFh
NjBlYTNjY2Y4OWE5Y2FkMzIxN2Y4ZDNiMjNjMThkMmZlMzRiMjVjODk2OWQ2MGFlIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjMwMjg0NjM0M2JmNTA5ZjhmODg0YzIzYmRiZDBmZTg1M2I3ZjdjYmI2
NTcyMDYwYTkwODIyNzlkMTNiMjFhMmMiCiAKICMgT25seSBrZXJuZWwtbW9kdWxlLW5mc2QgaXMg
cmVxdWlyZWQgaGVyZSAoYnV0IGNhbiBiZSBidWlsdC1pbikgIC0gdGhlIG5mc2QgbW9kdWxlIHdp
bGwKICMgcHVsbCBpbiB0aGUgcmVtYWluZGVyIG9mIHRoZSBkZXBlbmRlbmNpZXMuCi0tIAoyLjQ3
LjEKCg==

--===============4135152211215330828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-0a09faf78bbedf67406181c25588dfaf196246c1"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0a09faf78bbedf67406181c25588dfaf196246c1"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 467 Local 452 Mirrors 0 Missed 15 Current 643 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 755 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 816 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 834 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 839 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 920 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevent/libevent_2.1.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 939 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: recipe netbase-1_6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running task 903 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_recipe_qa)
NOTE: recipe rpcbind-1.2.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe netbase-1_6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpcbind-1.2.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1057 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1066 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe nfs-utils-2.9.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 1072 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevent/libevent_2.1.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1073 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-yocto-6.18.19+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1077 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe nfs-utils-2.9.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libevent-2.1.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1043 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_fetch)
NOTE: Running setscene task 1080 of 1110 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-yocto-6.18.19+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_fetch: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2287 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_unpack)
NOTE: Running task 2377 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2443 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe nfs-utils-2.9.1-r0: task do_unpack: Started
NOTE: Running task 2587 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_create_recipe_spdx)
NOTE: recipe nfs-utils-2.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 2632 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_patch)
NOTE: recipe nfs-utils-2.9.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe nfs-utils-2.9.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nfs-utils-2.9.1-r0: task do_patch: Succeeded
NOTE: Running task 2637 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2638 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_populate_lic)
NOTE: recipe nfs-utils-2.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nfs-utils-2.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_populate_lic: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nfs-utils-2.9.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 2639 of 2651 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_configure)
NOTE: recipe nfs-utils-2.9.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worke
 r/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recip
 es-support/libcap/libcap_2.77.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevent/libevent_2.1.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/r
 ecipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['base-files', 'base-passwd', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'systemd-systemctl-native', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'linux-libc-headers', 'attr', 'bash-completion', 'libcap-ng', 'libcap', 'libevent', 'sqlite3', 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-jinja2-native', 'python3-markupsafe-native', 'python3-packaging-nat
 ive', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libcap-ng-native', 'libcap-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing ACLOCAL="aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not running autopoint: --exclude autopoint was given
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot/usr/share/aclocal/ --force -I aclocal
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'aclocal'.
| libtoolize: copying file 'aclocal/libtool.m4'
| libtoolize: copying file 'aclocal/ltoptions.m4'
| libtoolize: copying file 'aclocal/ltsugar.m4'
| libtoolize: copying file 'aclocal/ltversion.m4'
| libtoolize: copying file 'aclocal/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: configure.ac: no need to run autopoint (confirmed)
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot/usr/share/aclocal/ --force -I aclocal
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot-native/usr/bin/autoconf --force
| configure.ac:294: warning: cannot check for file existence when cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3066: AC_CHECK_FILE is expanded from...
| ../sources/autoconf-2.73/lib/m4sugar/m4sh.m4:696: AS_IF is expanded from...
| aclocal/libtirpc.m4:54: AC_LIBTIRPC_OLD is expanded from...
| aclocal.m4:168: PKG_CHECK_MODULES is expanded from...
| ../sources/autoconf-2.73/lib/m4sugar/m4sh.m4:696: AS_IF is expanded from...
| aclocal/libtirpc.m4:3: AC_LIBTIRPC is expanded from...
| configure.ac:294: the top level
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot-native/usr/bin/autoheader --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:11: installing './compile'
| configure.ac:7: installing './missing'
| support/export/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: configure.ac: not running make: --make not given
| autoreconf: Leaving directory '.'
| NOTE: Running ./configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking --with-statduser=rpcuser                 --enable-mountconfig                 --enable-libmount-mount                 --enable-uuid                 --with-statdpath=/var/lib/nfs/statd                 --with-pluginpath=/usr/lib/libnfsidmap                 --with-rpcgen=/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rpcgen                 --disable-static  --disable-blkmapd --disable-gss --disable-svcgss --enable-ipv6 --disable-nfsdctl --disable-nfsv4 --di
 sable-nfsdcltrack --with-systemd=/usr/lib/systemd/system
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot option to enable C23 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot... none
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking for vfork.h... no
| checking for sys/select.h... yes
| checking for sys/socket.h... yes
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking for mount... yes
| checking for libnl-3.0 >= 3.1... no
| configure: error: Package requirements (libnl-3.0 >= 3.1) were not met:
| 
| Package 'libnl-3.0' not found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables LIBNL3_CFLAGS
| and LIBNL3_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/sources/nfs-utils-2.9.1/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.1053793:284 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.1053793, line 284
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.1053793, line 260
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.1053793, line 233
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.1053793, line 154
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.1053793, line 288
NOTE: recipe nfs-utils-2.9.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2639 tasks of which 2629 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415062858.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415062858.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/log.do_configure.1053793
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: nfs-utils-2.9.1-r0 do_configure: configure failed
ERROR: nfs-utils-2.9.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.1053793' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/log.do_configure.1053793
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_configure) failed with exit code '1'

--===============4135152211215330828==--

