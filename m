Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC42EFCBCD
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:57 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28798.1773582114921782754
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BJBPZ2bg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0AUfpgUL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019cf1bb5d3f-be6386cb-85f5-42f2-890e-6c11b74955ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sVWSSZb2puywSWjlyDiFz+ifXogtVuRNVjqc6w5bQko=;
	b=BJBPZ2bgzKJp5LpkdlzuybQzNt6xRE8EyPrrw0UGD18w/k6qLKsLoNaPIcrwCxKR
	e8lKE5ixlXhAQYCFKPKUqJ1NH/O0NVXyUdzmkKN/uPAjuDD+FIV1neEOBIRrw6aAUjt
	6KwXt1YqMx6b1Xv55ERUbA0dYR2/2F5vmLuh7TK0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sVWSSZb2puywSWjlyDiFz+ifXogtVuRNVjqc6w5bQko=;
	b=0AUfpgULjo9K1rEq6P9XGFKeKe7ATPaZnyEnYmtzwoNbHLrhKppmPdUkEGGVnnVp
	cOK79jws13zDLgzR5q8ZT+VsK9GDgl5MxCekiSgwfv8GQRQLIq9BrlUT6NRI59iTHDY
	CH2VlqoX2t1/vRh6ifCU/LV4k0ZYScarIZlWvGy4=
Content-Type: multipart/mixed; boundary="===============1772734883583724189=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.8.7 SUCCEEDED
Message-ID: <0101019cf1bb5d3f-be6386cb-85f5-42f2-890e-6c11b74955ff-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233133

--===============1772734883583724189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nfs-utils* to *2.8.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nfs-utils-upgrade-2.8.5-2.8.7.patch
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
From a137e7ab100c2d24a334927520454480af4faa2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 06:22:18 +0000
Subject: [PATCH] nfs-utils: upgrade 2.8.5 -> 2.8.7

---
 .../nfs-utils/0004-Use-nogroup-for-nobody-group.patch       | 6 +++---
 .../nfs-utils/0005-find-OE-provided-Kerberos.patch          | 4 ++--
 .../nfs-utils/{nfs-utils_2.8.5.bb => nfs-utils_2.8.7.bb}    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.5.bb => nfs-utils_2.8.7.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
index bbf44d5977..407cdac058 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
@@ -1,4 +1,4 @@
-From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From c54e8afb98521d27fcd2f03271ee976a2b1659ee Mon Sep 17 00:00:00 2001
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
index 3241e8e859..a7e8e27cf1 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
@@ -1,4 +1,4 @@
-From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From b604ffb11eff2646e169c749529c02f21a8e6f01 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
index 119e49e2a2..95e7d6582e 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0005-find-OE-provided-Kerberos.patch \
            "
 
-SRC_URI[sha256sum] = "b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb"
+SRC_URI[sha256sum] = "59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.47.1


--===============1772734883583724189==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-2.8.5-2.8.7.patch"

RnJvbSBhMTM3ZTdhYjEwMGMyZDI0YTMzNDkyNzUyMDQ1NDQ4MGFmNGZhYTJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDY6MjI6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZnMtdXRpbHM6IHVwZ3JhZGUgMi44LjUgLT4gMi44LjcKCi0tLQogLi4uL25mcy11dGlscy8wMDA0
LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2ggICAgICAgfCA2ICsrKy0tLQogLi4u
L25mcy11dGlscy8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2ggICAgICAgICAg
fCA0ICsrLS0KIC4uLi9uZnMtdXRpbHMve25mcy11dGlsc18yLjguNS5iYiA9PiBuZnMtdXRpbHNf
Mi44LjcuYmJ9ICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMv
e25mcy11dGlsc18yLjguNS5iYiA9PiBuZnMtdXRpbHNfMi44LjcuYmJ9ICg5OCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDQt
VXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3Jv
dXAucGF0Y2gKaW5kZXggYmJmNDRkNTk3Ny4uNDA3Y2RhYzA1OCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDQtVXNlLW5vZ3JvdXAt
Zm9yLW5vYm9keS1ncm91cC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25m
cy11dGlscy9uZnMtdXRpbHMvMDAwNC1Vc2Utbm9ncm91cC1mb3Itbm9ib2R5LWdyb3VwLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMDE5MTNjNWViMGFhZDkzM2E5M2VlOTY2MjUyOTA1Y2Q0
NmQ3NzZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNTRlOGFmYjk4NTIxZDI3ZmNk
MmYwMzI3MWVlOTc2YTJiMTY1OWVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRGFu
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
LU9FLXByb3ZpZGVkLUtlcmJlcm9zLnBhdGNoCmluZGV4IDMyNDFlOGU4NTkuLmE3ZThlMjdjZjEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGls
cy8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDUtZmluZC1PRS1wcm92aWRlZC1L
ZXJiZXJvcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTJhZjI2NmYwMTM3MjJhNjRjNWQw
NGUwZmUwOTdjZDcxMTM5M2E1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjYwNGZm
YjExZWZmMjY0NmUxNjljNzQ5NTI5YzAyZjIxYThlNmYwMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IERhbmllbCBNY0dyZWdvciA8ZGFuaWVsLm1jZ3JlZ29yQHZlY2ltYS5jb20+CiBE
YXRlOiBXZWQsIDggTm92IDIwMjMgMTY6MjQ6MjAgLTA2MDAKIFN1YmplY3Q6IFtQQVRDSF0gZmlu
ZCBPRSBwcm92aWRlZCBLZXJiZXJvcwpAQCAtMTAsNyArMTAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgTWNHcmVnb3IgPGRhbmllbC5tY2dyZWdvckB2ZWNpbWEuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9hY2xv
Y2FsL2tlcmJlcm9zNS5tNCBiL2FjbG9jYWwva2VyYmVyb3M1Lm00Ci1pbmRleCBmOTZmMGZkNC4u
YWQ4NWZkZjIgMTAwNjQ0CitpbmRleCBmOTZmMGZkLi5hZDg1ZmRmIDEwMDY0NAogLS0tIGEvYWNs
b2NhbC9rZXJiZXJvczUubTQKICsrKyBiL2FjbG9jYWwva2VyYmVyb3M1Lm00CiBAQCAtMjIsOCAr
MjIsOCBAQCBBQ19ERUZVTihbQUNfS0VSQkVST1NfVjVdLFsKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18yLjguNS5iYiBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18yLjguNy5iYgpzaW1pbGFyaXR5
IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGls
cy9uZnMtdXRpbHNfMi44LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bmZzLXV0aWxzL25mcy11dGlsc18yLjguNy5iYgppbmRleCAxMTllNDllMmEyLi45NWU3ZDY1ODJl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRp
bHNfMi44LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZz
LXV0aWxzXzIuOC43LmJiCkBAIC0yNSw3ICsyNSw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdf
TUlSUk9SfS9saW51eC91dGlscy9uZnMtdXRpbHMvJHtQVn0vbmZzLXV0aWxzLSR7UFZ9LnRhci54
CiAgICAgICAgICAgIGZpbGU6Ly8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gg
XAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiMTNjYTRhOWRmNDQxODZi
ZGJlMTA3NTE0YjIyNzMyZDQyNDNmNzg1Zjk1ZGFmMmZiODZhZmMxZWRiYTE1YmJiIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjU5ZDBmMWUxN2IxOGVmYWE2MGVhM2NjZjg5YTljYWQzMjE3ZjhkM2Iy
M2MxOGQyZmUzNGIyNWM4OTY5ZDYwYWUiCiAKICMgT25seSBrZXJuZWwtbW9kdWxlLW5mc2QgaXMg
cmVxdWlyZWQgaGVyZSAoYnV0IGNhbiBiZSBidWlsdC1pbikgIC0gdGhlIG5mc2QgbW9kdWxlIHdp
bGwKICMgcHVsbCBpbiB0aGUgcmVtYWluZGVyIG9mIHRoZSBkZXBlbmRlbmNpZXMuCi0tIAoyLjQ3
LjEKCg==

--===============1772734883583724189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/nfs-utils: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.5/nfs-utils-2.8.5.tar.xz file://nfsserver file://nfscommon file://0004-Use-nogroup-for-nobody-group.patch file://0005-find-OE-provided-Kerberos.patch" to "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.7/nfs-utils-2.8.7.tar.xz file://nfsserver file://nfscommon file://0004-Use-nogroup-for-nobody-group.patch file://0005-find-OE-provided-Kerberos.patch"
packages/x86-64-v3-poky-linux/nfs-utils: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-client: PKGSIZE changed from 360116 to 360107 (-0%)
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-client: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-client: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-dbg: PKGSIZE changed from 3368264 to 3449952 (+2%)
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-dbg: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-dbg: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-dev: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-dev: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-doc: PKGSIZE changed from 204372 to 205656 (+1%)
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-doc: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-doc: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-locale: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-locale: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-mount: PKGSIZE changed from 146307 to 150403 (+3%)
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-mount: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-mount: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-rpcctl: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-src: PKGSIZE changed from 960337 to 973050 (+1%)
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-src: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-src: FILELIST: directory renamed /usr/src/debug/nfs-utils/2.8.5/utils/mountd -> /usr/src/debug/nfs-utils/2.8.7/utils/mountd, directory renamed /usr/src/debug/nfs-utils/2.8.5/utils/nfsref -> /usr/src/debug/nfs-utils/2.8.7/utils/nfsref, directory renamed /usr/src/debug/nfs-utils/2.8.5/support/nsm -> /usr/src/debug/nfs-utils/2.8.7/support/nsm, directory renamed /usr/src/debug/nfs-utils/2.8.5/utils/statd -> /usr/src/debug/nfs-utils/2.8.7/utils/statd, directory renamed /usr/src/debug/nfs-utils/2.8.5/support/reexport -> /usr/src/debug/nfs-utils/2.8.7/support/reexport, directory renamed /usr/src/debug/nfs-utils/2.8.5/support/include/nfs -> /usr/src/debug/nfs-utils/2.8.7/support/include/nfs, directory renamed /usr/src/debug/nfs-utils/2.8.5/tools/nfsconf -> /usr/src/debug/nfs-utils/2.8.7/tools/nfsconf, directory renamed /usr/src/debug/nfs-utils/2.8.5/utils/nfsd -> /usr/src/debug/nfs-utils/2.8.7/utils/nfsd, directory renamed /usr/src/debug/nfs-
 utils/2.8.5/tools/nfsrahead -> /usr/src/debug/nfs-utils/2.8.7/tools/nfsrahead, directory renamed /usr/src/debug/nfs-utils/2.8.5/utils/mount -> /usr/src/debug/nfs-utils/2.8.7/utils/mount, directory renamed /usr/src/debug/nfs-utils/2.8.5/utils/nfsstat -> /usr/src/debug/nfs-utils/2.8.7/utils/nfsstat, directory renamed /usr/src/debug/nfs-utils/2.8.5/utils/showmount -> /usr/src/debug/nfs-utils/2.8.7/utils/showmount, directory renamed /usr/src/debug/nfs-utils/2.8.5/support/export -> /usr/src/debug/nfs-utils/2.8.7/support/export, directory renamed /usr/src/debug/nfs-utils/2.8.5/support/junction -> /usr/src/debug/nfs-utils/2.8.7/support/junction, directory renamed /usr/src/debug/nfs-utils/2.8.5/tools/rpcdebug -> /usr/src/debug/nfs-utils/2.8.7/tools/rpcdebug, directory renamed /usr/src/debug/nfs-utils/2.8.5/utils/exportfs -> /usr/src/debug/nfs-utils/2.8.7/utils/exportfs, directory renamed /usr/src/debug/nfs-utils/2.8.5/systemd -> /usr/src/debug/nfs-utils/2.8.7/systemd, removed "/usr/src/debu
 g/nfs-utils/2.8.5/support/nfs/rpcmisc.c /usr/src/debug/nfs-utils/2.8.5/support/nfs/xlog.c /usr/src/debug/nfs-utils/2.8.5/support/include/ha-callout.h /usr/src/debug/nfs-utils/2.8.5/support/nfs/mydaemon.c /usr/src/debug/nfs-utils/2.8.5/support/nfs/cacheio.c /usr/src/debug/nfs-utils/2.8.5/support/misc/workqueue.c /usr/src/debug/nfs-utils/2.8.5/support/nfs/getport.c /usr/src/debug/nfs-utils/2.8.5/support/nfs/xcommon.c /usr/src/debug/nfs-utils/2.8.5/support/include/nsm.h /usr/src/debug/nfs-utils/2.8.5/support/include/nfsd_path.h /usr/src/debug/nfs-utils/2.8.5/support/include/nfsrpc.h /usr/src/debug/nfs-utils/2.8.5/support/include/rpcmisc.h /usr/src/debug/nfs-utils/2.8.5/support/include/xio.h /usr/src/debug/nfs-utils/2.8.5/support/nfs/exports.c /usr/src/debug/nfs-utils/2.8.5/support/misc/file.c /usr/src/debug/nfs-utils/2.8.5/support/include/version.h /usr/src/debug/nfs-utils/2.8.5/support/include/junction.h /usr/src/debug/nfs-utils/2.8.5/support/misc/nfsd_path.c /usr/src/debug/nfs-utils/
 2.8.5/support/nfs/rmtab.c /usr/src/debug/nfs-utils/2.8.5/support/include/xlog.h /usr/src/debug/nfs-utils/2.8.5/support/include/conffile.h /usr/src/debug/nfs-utils/2.8.5/support/include/sockaddr.h /usr/src/debug/nfs-utils/2.8.5/support/nfs/rpcdispatch.c /usr/src/debug/nfs-utils/2.8.5/support/include/fsloc.h /usr/src/debug/nfs-utils/2.8.5/support/include/nfslib.h /usr/src/debug/nfs-utils/2.8.5/support/include/misc.h /usr/src/debug/nfs-utils/2.8.5/support/include/pseudoflavors.h /usr/src/debug/nfs-utils/2.8.5/support/nfs/xio.c /usr/src/debug/nfs-utils/2.8.5/support/include/workqueue.h /usr/src/debug/nfs-utils/2.8.5/support/nfs/conffile.c /usr/src/debug/nfs-utils/2.8.5/support/include/exportfs.h /usr/src/debug/nfs-utils/2.8.5/support/nfs/svc_create.c /usr/src/debug/nfs-utils/2.8.5/support/nfs/rpc_socket.c /usr/src/debug/nfs-utils/2.8.5/support/include/v4root.h /usr/src/debug/nfs-utils/2.8.5/support/misc/mountpoint.c /usr/src/debug/nfs-utils/2.8.5/support/include/xcommon.h /usr/src/debug
 /nfs-utils/2.8.5/support/nfs/svc_socket.c /usr/src/debug/nfs-utils/2.8.5/support/nfs/closeall.c /usr/src/debug/nfs-utils/2.8.5/support/nfs/wildmat.c", added "/usr/src/debug/nfs-utils/2.8.7/support/nfs/rpcmisc.c /usr/src/debug/nfs-utils/2.8.7/support/nfs/xlog.c /usr/src/debug/nfs-utils/2.8.7/support/include/ha-callout.h /usr/src/debug/nfs-utils/2.8.7/support/nfs/mydaemon.c /usr/src/debug/nfs-utils/2.8.7/support/nfs/cacheio.c /usr/src/debug/nfs-utils/2.8.7/support/misc/workqueue.c /usr/src/debug/nfs-utils/2.8.7/support/nfs/getport.c /usr/src/debug/nfs-utils/2.8.7/support/nfs/xcommon.c /usr/src/debug/nfs-utils/2.8.7/support/include/nsm.h /usr/src/debug/nfs-utils/2.8.7/support/include/nfsd_path.h /usr/src/debug/nfs-utils/2.8.7/support/include/nfs_ucred.h /usr/src/debug/nfs-utils/2.8.7/support/include/nfsrpc.h /usr/src/debug/nfs-utils/2.8.7/support/include/rpcmisc.h /usr/src/debug/nfs-utils/2.8.7/support/include/xio.h /usr/src/debug/nfs-utils/2.8.7/support/nfs/exports.c /usr/src/debug/nf
 s-utils/2.8.7/support/misc/file.c /usr/src/debug/nfs-utils/2.8.7/support/include/version.h /usr/src/debug/nfs-utils/2.8.7/support/include/junction.h /usr/src/debug/nfs-utils/2.8.7/support/misc/nfsd_path.c /usr/src/debug/nfs-utils/2.8.7/support/nfs/rmtab.c /usr/src/debug/nfs-utils/2.8.7/support/nfs/ucred.c /usr/src/debug/nfs-utils/2.8.7/support/include/xlog.h /usr/src/debug/nfs-utils/2.8.7/support/include/conffile.h /usr/src/debug/nfs-utils/2.8.7/support/include/sockaddr.h /usr/src/debug/nfs-utils/2.8.7/support/nfs/rpcdispatch.c /usr/src/debug/nfs-utils/2.8.7/support/include/fsloc.h /usr/src/debug/nfs-utils/2.8.7/support/include/nfslib.h /usr/src/debug/nfs-utils/2.8.7/support/include/misc.h /usr/src/debug/nfs-utils/2.8.7/support/include/pseudoflavors.h /usr/src/debug/nfs-utils/2.8.7/support/nfs/xio.c /usr/src/debug/nfs-utils/2.8.7/support/include/workqueue.h /usr/src/debug/nfs-utils/2.8.7/support/nfs/conffile.c /usr/src/debug/nfs-utils/2.8.7/support/include/exportfs.h /usr/src/debug/
 nfs-utils/2.8.7/support/nfs/svc_create.c /usr/src/debug/nfs-utils/2.8.7/support/nfs/rpc_socket.c /usr/src/debug/nfs-utils/2.8.7/support/include/v4root.h /usr/src/debug/nfs-utils/2.8.7/support/misc/mountpoint.c /usr/src/debug/nfs-utils/2.8.7/support/include/xcommon.h /usr/src/debug/nfs-utils/2.8.7/support/nfs/svc_socket.c /usr/src/debug/nfs-utils/2.8.7/support/nfs/closeall.c /usr/src/debug/nfs-utils/2.8.7/support/nfs/wildmat.c /usr/src/debug/nfs-utils/2.8.7/support/misc/ucred.c"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-src: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-staticdev: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-staticdev: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-stats: PKGSIZE changed from 77076 to 77980 (+1%)
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-stats: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils-stats: PV changed from "2.8.5" to "2.8.7"
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils: PKGSIZE changed from 649599 to 653727 (+1%)
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils: PKGV changed from 2.8.5 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/nfs-utils/nfs-utils: PV changed from "2.8.5" to "2.8.7"

--===============1772734883583724189==--

