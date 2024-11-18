Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336F9D591CC
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.4785.1731964604654967775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Co8aCL/q;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BGbQEYH/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019341229812-0b20ace7-ef5a-4318-8bdb-e148362ee27e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6MLQGZPJ99RkL5SHt0g3D7iWVJHnZWsgadWfKEXw9FU=;
	b=Co8aCL/qsw+RApd2wV/ILRkJJimwI9Wpk9jvlHgEB5k3T2RRtii2yiY5zkjG/KbW
	h0OQB6YfD+SNmnau9koDQUgKHfciLHwgOKfc8fe9OW2/FnzHYwMliKmU+yt83kssQFe
	2f2GH40JpugVdSZs4ztNnQopswl+XH9F2MNCrmyA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6MLQGZPJ99RkL5SHt0g3D7iWVJHnZWsgadWfKEXw9FU=;
	b=BGbQEYH/1QhNM6cLUx6Nr1fEzvsxoHLpC+mzz0yBO5wBqx3qEIE176/LgvxU13Ac
	A7NdAdsRhZEOR/NMIgp2L0tCEhTTEK8OWI+860Alo5oic/3l1Kq663gVpPJW4VzNAeS
	BNk6lY2NUC47BHSbJi9EDMelq8G862b/WGHCHqBI=
Content-Type: multipart/mixed; boundary="===============1379448075985198788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] base-passwd: upgrading to 3.6.5 SUCCEEDED
Message-ID: <0101019341229812-0b20ace7-ef5a-4318-8bdb-e148362ee27e-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207244

--===============1379448075985198788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *base-passwd* to *3.6.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-base-passwd-upgrade-3.6.4-3.6.5.patch
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
From f510156d275c160579393eeb55d8b95e392ee8a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 04:39:43 +0000
Subject: [PATCH] base-passwd: upgrade 3.6.4 -> 3.6.5

---
 .../0001-Add-a-shutdown-group.patch            |  2 +-
 .../0001-base-passwd-Add-the-sgx-group.patch   |  4 ++--
 ...instead-of-bin-bash-for-the-root-user.patch |  4 ++--
 ...ot-since-we-do-not-have-an-etc-shadow.patch |  4 ++--
 ...input-group-for-the-dev-input-devices.patch |  4 ++--
 .../base-passwd/0005-Add-kvm-group.patch       |  2 +-
 .../base-passwd/0007-Add-wheel-group.patch     | 18 +++++++++++++-----
 ...se-passwd_3.6.4.bb => base-passwd_3.6.5.bb} |  2 +-
 8 files changed, 24 insertions(+), 16 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.4.bb => base-passwd_3.6.5.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
index 33b0b5820d..60e755fd9a 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
@@ -1,4 +1,4 @@
-From 49371dfc984ac895d658d01108e8bf58675ce8c9 Mon Sep 17 00:00:00 2001
+From 03150b2575c5ec1ba30726d30d47303627e6fc60 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Add a shutdown group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
index e1340e1b70..41dfc27178 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
@@ -1,4 +1,4 @@
-From 9e57771d138ac423d5139b984b8c869122ce4976 Mon Sep 17 00:00:00 2001
+From 6ad8995014cc30c932a8b4dae066c56ae33a107f Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alexk@zuma.ai>
 Date: Fri, 28 Jul 2023 10:28:57 +0100
 Subject: [PATCH] base-passwd: Add the sgx group
@@ -17,7 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index d34d2b832d43..e54fd1d2c6dc 100644
+index d34d2b8..e54fd1d 100644
 --- a/group.master
 +++ b/group.master
 @@ -34,6 +34,7 @@ video:*:44:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
index 09f8cfea9c..61b3ed38d7 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
@@ -1,4 +1,4 @@
-From 4411fc0df77566d52bee11ec0bad4be30a96e99e Mon Sep 17 00:00:00 2001
+From 54bb95b9c4532f9cbe634dd43798ce37c93d6f50 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Use /bin/sh instead of /bin/bash for the root user
@@ -12,7 +12,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/passwd.master b/passwd.master
-index 7cd4e24..041685a 100644
+index 90514a5..bd3efc2 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index 06222ab04c..6b13d4c967 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
@@ -1,4 +1,4 @@
-From 13a1a284a134d18a454625a5b4485c0d99079ae9 Mon Sep 17 00:00:00 2001
+From 03406451d66a9d561d6e32a181248e5a0bd58d58 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Remove "*" for root since we do not have an /etc/shadow
@@ -10,7 +10,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/passwd.master b/passwd.master
-index 041685a..31a84d4 100644
+index bd3efc2..66e9033 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
index 394a0f01d3..85739d5b47 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
@@ -1,4 +1,4 @@
-From c5f012750f8102ff54af73ccc2d2b7bfa1f26db4 Mon Sep 17 00:00:00 2001
+From 662da5251f3f9634c583eeccc8242a05393d37be Mon Sep 17 00:00:00 2001
 From: Darren Hart <dvhart@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Add an input group for the /dev/input/* devices
@@ -10,7 +10,7 @@ Signed-off-by: Darren Hart <dvhart@linux.intel.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index 1b5e2fb..cea9d60 100644
+index 72108a8..7d794b2 100644
 --- a/group.master
 +++ b/group.master
 @@ -12,6 +12,7 @@ uucp:*:10:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
index 0101637e9e..65a9ef53a3 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From 74fc91ee809bc902f79144ee2277fa3e368c30d0 Mon Sep 17 00:00:00 2001
+From c6e5c31cd276f69a4db479188efb3ab3e0f35dd8 Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
index d77122789d..a4d2dd875b 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -1,3 +1,7 @@
+From fc9790b768971d5b9e9b6d215bc29885a646c335 Mon Sep 17 00:00:00 2001
+From: Louis Rannou <lrannou@baylibre.com>
+Date: Thu, 15 Jun 2023 13:43:55 +0200
+Subject: [PATCH] base-passwd: add the wheel group
 
 We need to have a wheel group which has some system privileges to consult the
 systemd journal or manage printers with cups.
@@ -7,11 +11,15 @@ Upstream says the group does not exist by default.
 Upstream-Status: Inappropriate [enable feature]
 
 Signed-off-by: Louis Rannou <lrannou@baylibre.com>
-Index: base-passwd-3.5.26/group.master
-===================================================================
---- base-passwd-3.5.29.orig/group.master
-+++ base-passwd-3.5.29/group.master
-@@ -38,5 +38,6 @@
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index 7fdd8bf..d34d2b8 100644
+--- a/group.master
++++ b/group.master
+@@ -37,5 +37,6 @@ kvm:*:47:
  staff:*:50:
  games:*:60:
  shutdown:*:70:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
index df4889f220..47c15e5541 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "4b5232c5910932215b87bbde6f3c6c9a97021fe7902bd837b1ede8cc0be84a65"
+SRC_URI[sha256sum] = "bd30ab67b1f8029d3e70d3419e5033fb4595ab91c91307c3b7c00978e8d111b2"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.44.1


--===============1379448075985198788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-base-passwd-upgrade-3.6.4-3.6.5.patch"

RnJvbSBmNTEwMTU2ZDI3NWMxNjA1NzkzOTNlZWI1NWQ4Yjk1ZTM5MmVlOGE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDQ6Mzk6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXNlLXBhc3N3ZDogdXBncmFkZSAzLjYuNCAtPiAzLjYuNQoKLS0tCiAuLi4vMDAwMS1BZGQtYS1z
aHV0ZG93bi1ncm91cC5wYXRjaCAgICAgICAgICAgIHwgIDIgKy0KIC4uLi8wMDAxLWJhc2UtcGFz
c3dkLUFkZC10aGUtc2d4LWdyb3VwLnBhdGNoICAgfCAgNCArKy0tCiAuLi5pbnN0ZWFkLW9mLWJp
bi1iYXNoLWZvci10aGUtcm9vdC11c2VyLnBhdGNoIHwgIDQgKystLQogLi4ub3Qtc2luY2Utd2Ut
ZG8tbm90LWhhdmUtYW4tZXRjLXNoYWRvdy5wYXRjaCB8ICA0ICsrLS0KIC4uLmlucHV0LWdyb3Vw
LWZvci10aGUtZGV2LWlucHV0LWRldmljZXMucGF0Y2ggfCAgNCArKy0tCiAuLi4vYmFzZS1wYXNz
d2QvMDAwNS1BZGQta3ZtLWdyb3VwLnBhdGNoICAgICAgIHwgIDIgKy0KIC4uLi9iYXNlLXBhc3N3
ZC8wMDA3LUFkZC13aGVlbC1ncm91cC5wYXRjaCAgICAgfCAxOCArKysrKysrKysrKysrLS0tLS0K
IC4uLnNlLXBhc3N3ZF8zLjYuNC5iYiA9PiBiYXNlLXBhc3N3ZF8zLjYuNS5iYn0gfCAgMiArLQog
OCBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC97YmFzZS1wYXNzd2RfMy42LjQuYmIgPT4g
YmFzZS1wYXNzd2RfMy42LjUuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMS1BZGQtYS1zaHV0ZG93bi1ncm91cC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDEtQWRkLWEt
c2h1dGRvd24tZ3JvdXAucGF0Y2gKaW5kZXggMzNiMGI1ODIwZC4uNjBlNzU1ZmQ5YSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMS1BZGQt
YS1zaHV0ZG93bi1ncm91cC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3
ZC9iYXNlLXBhc3N3ZC8wMDAxLUFkZC1hLXNodXRkb3duLWdyb3VwLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA0OTM3MWRmYzk4NGFjODk1ZDY1OGQwMTEwOGU4YmY1ODY3NWNlOGM5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMzE1MGIyNTc1YzVlYzFiYTMwNzI2ZDMwZDQ3MzAz
NjI3ZTZmYzYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU2F1bCBXb2xkIDxzZ3dA
bGludXguaW50ZWwuY29tPgogRGF0ZTogRnJpLCAyOSBBcHIgMjAyMiAxMzozMjoyNyArMDAwMAog
U3ViamVjdDogW1BBVENIXSBBZGQgYSBzaHV0ZG93biBncm91cApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMS1iYXNlLXBhc3N3ZC1BZGQt
dGhlLXNneC1ncm91cC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2Ut
cGFzc3dkLzAwMDEtYmFzZS1wYXNzd2QtQWRkLXRoZS1zZ3gtZ3JvdXAucGF0Y2gKaW5kZXggZTEz
NDBlMWI3MC4uNDFkZmMyNzE3OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1w
YXNzd2QvYmFzZS1wYXNzd2QvMDAwMS1iYXNlLXBhc3N3ZC1BZGQtdGhlLXNneC1ncm91cC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAxLWJh
c2UtcGFzc3dkLUFkZC10aGUtc2d4LWdyb3VwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5
ZTU3NzcxZDEzOGFjNDIzZDUxMzliOTg0YjhjODY5MTIyY2U0OTc2IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA2YWQ4OTk1MDE0Y2MzMGM5MzJhOGI0ZGFlMDY2YzU2YWUzM2ExMDdmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleCBLaWVybmFuIDxhbGV4a0B6dW1hLmFp
PgogRGF0ZTogRnJpLCAyOCBKdWwgMjAyMyAxMDoyODo1NyArMDEwMAogU3ViamVjdDogW1BBVENI
XSBiYXNlLXBhc3N3ZDogQWRkIHRoZSBzZ3ggZ3JvdXAKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVk
LW9mZi1ieTogQWxleCBLaWVybmFuIDxhbGV4LmtpZXJuYW5AZ21haWwuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvZ3JvdXAubWFzdGVyIGIvZ3Jv
dXAubWFzdGVyCi1pbmRleCBkMzRkMmI4MzJkNDMuLmU1NGZkMWQyYzZkYyAxMDA2NDQKK2luZGV4
IGQzNGQyYjguLmU1NGZkMWQgMTAwNjQ0CiAtLS0gYS9ncm91cC5tYXN0ZXIKICsrKyBiL2dyb3Vw
Lm1hc3RlcgogQEAgLTM0LDYgKzM0LDcgQEAgdmlkZW86Kjo0NDoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDItVXNlLWJpbi1zaC1pbnN0
ZWFkLW9mLWJpbi1iYXNoLWZvci10aGUtcm9vdC11c2VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNv
cmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMi1Vc2UtYmluLXNoLWluc3RlYWQtb2YtYmlu
LWJhc2gtZm9yLXRoZS1yb290LXVzZXIucGF0Y2gKaW5kZXggMDlmOGNmZWE5Yy4uNjFiM2VkMzhk
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2Qv
MDAwMi1Vc2UtYmluLXNoLWluc3RlYWQtb2YtYmluLWJhc2gtZm9yLXRoZS1yb290LXVzZXIucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMi1V
c2UtYmluLXNoLWluc3RlYWQtb2YtYmluLWJhc2gtZm9yLXRoZS1yb290LXVzZXIucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDQ0MTFmYzBkZjc3NTY2ZDUyYmVlMTFlYzBiYWQ0YmUzMGE5NmU5
OWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU0YmI5NWI5YzQ1MzJmOWNiZTYzNGRk
NDM3OThjZTM3YzkzZDZmNTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTY290dCBH
YXJtYW4gPHNjb3R0LmEuZ2FybWFuQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMjkgQXByIDIwMjIg
MTM6MzI6MjcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gVXNlIC9iaW4vc2ggaW5zdGVhZCBvZiAv
YmluL2Jhc2ggZm9yIHRoZSByb290IHVzZXIKQEAgLTEyLDcgKzEyLDcgQEAgU2lnbmVkLW9mZi1i
eTogU2NvdHQgR2FybWFuIDxzY290dC5hLmdhcm1hbkBpbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9wYXNzd2Qu
bWFzdGVyIGIvcGFzc3dkLm1hc3RlcgotaW5kZXggN2NkNGUyNC4uMDQxNjg1YSAxMDA2NDQKK2lu
ZGV4IDkwNTE0YTUuLmJkM2VmYzIgMTAwNjQ0CiAtLS0gYS9wYXNzd2QubWFzdGVyCiArKysgYi9w
YXNzd2QubWFzdGVyCiBAQCAtMSw0ICsxLDQgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDMtUmVtb3ZlLWZvci1yb290LXNpbmNlLXdl
LWRvLW5vdC1oYXZlLWFuLWV0Yy1zaGFkb3cucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNl
LXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAzLVJlbW92ZS1mb3Itcm9vdC1zaW5jZS13ZS1kby1ub3Qt
aGF2ZS1hbi1ldGMtc2hhZG93LnBhdGNoCmluZGV4IDA2MjIyYWIwNGMuLjZiMTNkNGM5NjcgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDMt
UmVtb3ZlLWZvci1yb290LXNpbmNlLXdlLWRvLW5vdC1oYXZlLWFuLWV0Yy1zaGFkb3cucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMy1SZW1v
dmUtZm9yLXJvb3Qtc2luY2Utd2UtZG8tbm90LWhhdmUtYW4tZXRjLXNoYWRvdy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMTNhMWEyODRhMTM0ZDE4YTQ1NDYyNWE1YjQ0ODVjMGQ5OTA3OWFl
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDM0MDY0NTFkNjZhOWQ1NjFkNmUzMmEx
ODEyNDhlNWEwYmQ1OGQ1OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFNjb3R0IEdh
cm1hbiA8c2NvdHQuYS5nYXJtYW5AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAyOSBBcHIgMjAyMiAx
MzozMjoyOCArMDAwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUgIioiIGZvciByb290IHNpbmNl
IHdlIGRvIG5vdCBoYXZlIGFuIC9ldGMvc2hhZG93CkBAIC0xMCw3ICsxMCw3IEBAIFNpZ25lZC1v
ZmYtYnk6IFNjb3R0IEdhcm1hbiA8c2NvdHQuYS5nYXJtYW5AaW50ZWwuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvcGFz
c3dkLm1hc3RlciBiL3Bhc3N3ZC5tYXN0ZXIKLWluZGV4IDA0MTY4NWEuLjMxYTg0ZDQgMTAwNjQ0
CitpbmRleCBiZDNlZmMyLi42NmU5MDMzIDEwMDY0NAogLS0tIGEvcGFzc3dkLm1hc3RlcgogKysr
IGIvcGFzc3dkLm1hc3RlcgogQEAgLTEsNCArMSw0IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA0LUFkZC1hbi1pbnB1dC1ncm91cC1m
b3ItdGhlLWRldi1pbnB1dC1kZXZpY2VzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1w
YXNzd2QvYmFzZS1wYXNzd2QvMDAwNC1BZGQtYW4taW5wdXQtZ3JvdXAtZm9yLXRoZS1kZXYtaW5w
dXQtZGV2aWNlcy5wYXRjaAppbmRleCAzOTRhMGYwMWQzLi44NTczOWQ1YjQ3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA0LUFkZC1hbi1p
bnB1dC1ncm91cC1mb3ItdGhlLWRldi1pbnB1dC1kZXZpY2VzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDQtQWRkLWFuLWlucHV0LWdyb3Vw
LWZvci10aGUtZGV2LWlucHV0LWRldmljZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM1
ZjAxMjc1MGY4MTAyZmY1NGFmNzNjY2MyZDJiN2JmYTFmMjZkYjQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDY2MmRhNTI1MWYzZjk2MzRjNTgzZWVjY2M4MjQyYTA1MzkzZDM3YmUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBEYXJyZW4gSGFydCA8ZHZoYXJ0QGxpbnV4Lmlu
dGVsLmNvbT4KIERhdGU6IEZyaSwgMjkgQXByIDIwMjIgMTM6MzI6MjggKzAwMDAKIFN1YmplY3Q6
IFtQQVRDSF0gQWRkIGFuIGlucHV0IGdyb3VwIGZvciB0aGUgL2Rldi9pbnB1dC8qIGRldmljZXMK
QEAgLTEwLDcgKzEwLDcgQEAgU2lnbmVkLW9mZi1ieTogRGFycmVuIEhhcnQgPGR2aGFydEBsaW51
eC5pbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1n
aXQgYS9ncm91cC5tYXN0ZXIgYi9ncm91cC5tYXN0ZXIKLWluZGV4IDFiNWUyZmIuLmNlYTlkNjAg
MTAwNjQ0CitpbmRleCA3MjEwOGE4Li43ZDc5NGIyIDEwMDY0NAogLS0tIGEvZ3JvdXAubWFzdGVy
CiArKysgYi9ncm91cC5tYXN0ZXIKIEBAIC0xMiw2ICsxMiw3IEBAIHV1Y3A6KjoxMDoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDUtQWRk
LWt2bS1ncm91cC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFz
c3dkLzAwMDUtQWRkLWt2bS1ncm91cC5wYXRjaAppbmRleCAwMTAxNjM3ZTllLi42NWE5ZWY1M2Ez
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8w
MDA1LUFkZC1rdm0tZ3JvdXAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNz
d2QvYmFzZS1wYXNzd2QvMDAwNS1BZGQta3ZtLWdyb3VwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA3NGZjOTFlZTgwOWJjOTAyZjc5MTQ0ZWUyMjc3ZmEzZTM2OGMzMGQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBjNmU1YzMxY2QyNzZmNjlhNGRiNDc5MTg4ZWZiM2FiM2UwZjM1
ZGQ4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmFjb2IgS3Jvb24gPGphY29iLmty
b29uQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMzAgSmFuIDIwMTkgMDQ6NTM6NDggKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gQWRkIGt2bSBncm91cApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwNy1BZGQtd2hlZWwtZ3JvdXAucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA3LUFkZC13aGVlbC1n
cm91cC5wYXRjaAppbmRleCBkNzcxMjI3ODlkLi5hNGQyZGQ4NzViIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA3LUFkZC13aGVlbC1ncm91
cC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8w
MDA3LUFkZC13aGVlbC1ncm91cC5wYXRjaApAQCAtMSwzICsxLDcgQEAKK0Zyb20gZmM5NzkwYjc2
ODk3MWQ1YjllOWI2ZDIxNWJjMjk4ODVhNjQ2YzMzNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb206IExvdWlzIFJhbm5vdSA8bHJhbm5vdUBiYXlsaWJyZS5jb20+CitEYXRlOiBUaHUsIDE1
IEp1biAyMDIzIDEzOjQzOjU1ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGJhc2UtcGFzc3dkOiBh
ZGQgdGhlIHdoZWVsIGdyb3VwCiAKIFdlIG5lZWQgdG8gaGF2ZSBhIHdoZWVsIGdyb3VwIHdoaWNo
IGhhcyBzb21lIHN5c3RlbSBwcml2aWxlZ2VzIHRvIGNvbnN1bHQgdGhlCiBzeXN0ZW1kIGpvdXJu
YWwgb3IgbWFuYWdlIHByaW50ZXJzIHdpdGggY3Vwcy4KQEAgLTcsMTEgKzExLDE1IEBAIFVwc3Ry
ZWFtIHNheXMgdGhlIGdyb3VwIGRvZXMgbm90IGV4aXN0IGJ5IGRlZmF1bHQuCiBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUgW2VuYWJsZSBmZWF0dXJlXQogCiBTaWduZWQtb2ZmLWJ5OiBM
b3VpcyBSYW5ub3UgPGxyYW5ub3VAYmF5bGlicmUuY29tPgotSW5kZXg6IGJhc2UtcGFzc3dkLTMu
NS4yNi9ncm91cC5tYXN0ZXIKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBiYXNlLXBhc3N3ZC0zLjUuMjkub3Jp
Zy9ncm91cC5tYXN0ZXIKLSsrKyBiYXNlLXBhc3N3ZC0zLjUuMjkvZ3JvdXAubWFzdGVyCi1AQCAt
MzgsNSArMzgsNiBAQAorLS0tCisgZ3JvdXAubWFzdGVyIHwgMSArCisgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCisKK2RpZmYgLS1naXQgYS9ncm91cC5tYXN0ZXIgYi9ncm91cC5tYXN0
ZXIKK2luZGV4IDdmZGQ4YmYuLmQzNGQyYjggMTAwNjQ0CistLS0gYS9ncm91cC5tYXN0ZXIKKysr
KyBiL2dyb3VwLm1hc3RlcgorQEAgLTM3LDUgKzM3LDYgQEAga3ZtOio6NDc6CiAgc3RhZmY6Kjo1
MDoKICBnYW1lczoqOjYwOgogIHNodXRkb3duOio6NzA6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuNC5iYiBiL21ldGEvcmVjaXBlcy1j
b3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkXzMuNi41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkXzMu
Ni40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3
ZF8zLjYuNS5iYgppbmRleCBkZjQ4ODlmMjIwLi40N2MxNWU1NTQxIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuNC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuNS5iYgpAQCAtMTUsNyAr
MTUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vbGF1bmNocGFkLm5ldC9kZWJpYW4vK2FyY2hpdmUv
cHJpbWFyeS8rZmlsZXMvJHtCUE59XyR7UFZ9LnRhcgogICAgICAgICAgICBmaWxlOi8vMDAwMS1i
YXNlLXBhc3N3ZC1BZGQtdGhlLXNneC1ncm91cC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjRiNTIzMmM1OTEwOTMyMjE1Yjg3YmJkZTZmM2M2YzlhOTcwMjFm
ZTc5MDJiZDgzN2IxZWRlOGNjMGJlODRhNjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmQzMGFi
NjdiMWY4MDI5ZDNlNzBkMzQxOWU1MDMzZmI0NTk1YWI5MWM5MTMwN2MzYjdjMDA5NzhlOGQxMTFi
MiIKIAogIyB0aGUgcGFja2FnZSBpcyB0YWtlbiBmcm9tIGxhdW5jaHBhZDsgdGhhdCBzb3VyY2Ug
aXMgc3RhdGljIGFuZCBnb2VzIHN0YWxlCiAjIHNvIHdlIGNoZWNrIHRoZSBsYXRlc3QgdXBzdHJl
YW0gZnJvbSBhIGRpcmVjdG9yeSB0aGF0IGRvZXMgZ2V0IHVwZGF0ZWQKLS0gCjIuNDQuMQoK

--===============1379448075985198788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PV changed from "3.6.4" to "3.6.5"
packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PKGV changed from 3.6.4 [default] to 3.6.5 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PKGSIZE changed from 64040 to 64232 (+0%)
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PV changed from "3.6.4" to "3.6.5"
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PKGV changed from 3.6.4 [default] to 3.6.5 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PV changed from "3.6.4" to "3.6.5"
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGV changed from 3.6.4 [default] to 3.6.5 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGSIZE changed from 19873 to 19940 (+0%)
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PV changed from "3.6.4" to "3.6.5"
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PKGV changed from 3.6.4 [default] to 3.6.5 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PV changed from "3.6.4" to "3.6.5"
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PKGV changed from 3.6.4 [default] to 3.6.5 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PKGSIZE changed from 41591 to 41941 (+1%)
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PV changed from "3.6.4" to "3.6.5"
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PKGV changed from 3.6.4 [default] to 3.6.5 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PV changed from "3.6.4" to "3.6.5"
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PKGV changed from 3.6.4 [default] to 3.6.5 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd: PV changed from "3.6.4" to "3.6.5"
packages/core2-64-poky-linux/base-passwd/base-passwd: PKGV changed from 3.6.4 [default] to 3.6.5 [default]
packages/core2-64-poky-linux/base-passwd: SRC_URI changed from "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.4.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patch" to "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.5.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patch"
packages/core2-64-poky-linux/base-passwd: PV changed from "3.6.4" to "3.6.5"
packages/core2-64-poky-linux/base-passwd: PKGV changed from 3.6.4 [default] to 3.6.5 [default]

--===============1379448075985198788==--

