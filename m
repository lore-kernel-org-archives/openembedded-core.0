Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4634EC54F30
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1293.1721071145581690660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=R4ylT6qP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wtxJeHus;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d58ec9-b5a0a219-e950-4861-8b13-072ec9d01360-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mK8n1etc4+R6Sl1fTwzDUhj5gyC02P8Guc0xa8O6fQs=;
	b=R4ylT6qPPpemyUYTfh+wEYr+YdWZajvi7FKbXXhZZ/0+ae+70mb83TrQMnkjZPYE
	48hxlkbzQZNBwR3fHqo/U2FY392vjZhCxFDHm8NRcY69VeLusbPUqQ0KCAfscvy7lvp
	dyu5yLnL8Ch2+9Z3Ff68B0iiM9+sxqLxn06xkPXY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mK8n1etc4+R6Sl1fTwzDUhj5gyC02P8Guc0xa8O6fQs=;
	b=wtxJeHusvB80s6FojHdS/xtDNyi1esI7mhcH9jgHGn9kWhgeW+MpwumqvrE1J7JG
	zR0qMj2ZOyWzDRYkQUOaF9KL+S+Oa1b8+vF08SWBxDM8BfspE/30BzDSbkV8+iLIY3p
	DoWJ8K/65jFIyWn7rKHP372Xk3N7K1tamklhpcNI=
Content-Type: multipart/mixed; boundary="===============7212191180761153248=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] base-passwd: upgrading to 3.6.4 SUCCEEDED
Message-ID: <01010190b7d58ec9-b5a0a219-e950-4861-8b13-072ec9d01360-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201947

--===============7212191180761153248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *base-passwd* to *3.6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-base-passwd-upgrade-3.6.3-3.6.4.patch
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
From 935f14fc5b7d539da12b5e938ef8dced869d1d0e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 07:51:02 +0000
Subject: [PATCH] base-passwd: upgrade 3.6.3 -> 3.6.4

---
 .../0001-Add-a-shutdown-group.patch            |  6 +++---
 .../0001-base-passwd-Add-the-sgx-group.patch   |  4 ++--
 ...instead-of-bin-bash-for-the-root-user.patch |  4 ++--
 ...ot-since-we-do-not-have-an-etc-shadow.patch |  4 ++--
 ...input-group-for-the-dev-input-devices.patch |  4 ++--
 .../base-passwd/0005-Add-kvm-group.patch       |  6 +++---
 .../base-passwd/0007-Add-wheel-group.patch     | 18 +++++++++++++-----
 ...se-passwd_3.6.3.bb => base-passwd_3.6.4.bb} |  2 +-
 8 files changed, 28 insertions(+), 20 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.3.bb => base-passwd_3.6.4.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
index e50efc9623..1c2bb626c6 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
@@ -1,4 +1,4 @@
-From 8f3ace87df3aaad85946c22cae240532ea3e73b8 Mon Sep 17 00:00:00 2001
+From b8784c0f42d1d2952e3c8d2a179644882146dc41 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Add a shutdown group
@@ -14,10 +14,10 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index ad1dd2d..1b5e2fb 100644
+index 3e7bf1c..72108a8 100644
 --- a/group.master
 +++ b/group.master
-@@ -35,5 +35,6 @@ sasl:*:45:
+@@ -34,5 +34,6 @@ sasl:*:45:
  plugdev:*:46:
  staff:*:50:
  games:*:60:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
index e1340e1b70..fb487d4a00 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
@@ -1,4 +1,4 @@
-From 9e57771d138ac423d5139b984b8c869122ce4976 Mon Sep 17 00:00:00 2001
+From 4a062de9f53e18f10c5ab5cf38806f76f1d78534 Mon Sep 17 00:00:00 2001
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
index 09f8cfea9c..126954d8c8 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
@@ -1,4 +1,4 @@
-From 4411fc0df77566d52bee11ec0bad4be30a96e99e Mon Sep 17 00:00:00 2001
+From 8526d9c4fa2ad5946b12bfe559e5974a649d09bc Mon Sep 17 00:00:00 2001
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
index 06222ab04c..7a4f5b0f37 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
@@ -1,4 +1,4 @@
-From 13a1a284a134d18a454625a5b4485c0d99079ae9 Mon Sep 17 00:00:00 2001
+From c5a5026913462a9f39a684b7eaf06276ba4d9a00 Mon Sep 17 00:00:00 2001
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
index 394a0f01d3..a315cabeba 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
@@ -1,4 +1,4 @@
-From c5f012750f8102ff54af73ccc2d2b7bfa1f26db4 Mon Sep 17 00:00:00 2001
+From b3d97b24519ed47f246d37cb8c411a7454f6c47f Mon Sep 17 00:00:00 2001
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
index 72e6ee333c..4f31b3d22e 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From 6cf19461fb31d7a7a3010629aae9aab49c26a01b Mon Sep 17 00:00:00 2001
+From 2d586ca39386933912a018659ff6053ce7983a4a Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
@@ -10,10 +10,10 @@ Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index cea9d60..5b62284 100644
+index 7d794b2..7fdd8bf 100644
 --- a/group.master
 +++ b/group.master
-@@ -34,6 +34,7 @@ utmp:*:43:
+@@ -33,6 +33,7 @@ utmp:*:43:
  video:*:44:
  sasl:*:45:
  plugdev:*:46:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
index d77122789d..5d92704e48 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -1,3 +1,7 @@
+From 4572792c08f02369fb0ba6b2b1d38ef03a25504c Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
index bf50b01fd5..df4889f220 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "83575327d8318a419caf2d543341215c046044073d1afec2acc0ac4d8095ff39"
+SRC_URI[sha256sum] = "4b5232c5910932215b87bbde6f3c6c9a97021fe7902bd837b1ede8cc0be84a65"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.44.0


--===============7212191180761153248==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-base-passwd-upgrade-3.6.3-3.6.4.patch"

RnJvbSA5MzVmMTRmYzViN2Q1MzlkYTEyYjVlOTM4ZWY4ZGNlZDg2OWQxZDBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDc6NTE6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXNlLXBhc3N3ZDogdXBncmFkZSAzLjYuMyAtPiAzLjYuNAoKLS0tCiAuLi4vMDAwMS1BZGQtYS1z
aHV0ZG93bi1ncm91cC5wYXRjaCAgICAgICAgICAgIHwgIDYgKysrLS0tCiAuLi4vMDAwMS1iYXNl
LXBhc3N3ZC1BZGQtdGhlLXNneC1ncm91cC5wYXRjaCAgIHwgIDQgKystLQogLi4uaW5zdGVhZC1v
Zi1iaW4tYmFzaC1mb3ItdGhlLXJvb3QtdXNlci5wYXRjaCB8ICA0ICsrLS0KIC4uLm90LXNpbmNl
LXdlLWRvLW5vdC1oYXZlLWFuLWV0Yy1zaGFkb3cucGF0Y2ggfCAgNCArKy0tCiAuLi5pbnB1dC1n
cm91cC1mb3ItdGhlLWRldi1pbnB1dC1kZXZpY2VzLnBhdGNoIHwgIDQgKystLQogLi4uL2Jhc2Ut
cGFzc3dkLzAwMDUtQWRkLWt2bS1ncm91cC5wYXRjaCAgICAgICB8ICA2ICsrKy0tLQogLi4uL2Jh
c2UtcGFzc3dkLzAwMDctQWRkLXdoZWVsLWdyb3VwLnBhdGNoICAgICB8IDE4ICsrKysrKysrKysr
KystLS0tLQogLi4uc2UtcGFzc3dkXzMuNi4zLmJiID0+IGJhc2UtcGFzc3dkXzMuNi40LmJifSB8
ICAyICstCiA4IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL3tiYXNlLXBhc3N3ZF8zLjYu
My5iYiA9PiBiYXNlLXBhc3N3ZF8zLjYuNC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAxLUFkZC1hLXNodXRkb3duLWdy
b3VwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAw
MS1BZGQtYS1zaHV0ZG93bi1ncm91cC5wYXRjaAppbmRleCBlNTBlZmM5NjIzLi4xYzJiYjYyNmM2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8w
MDAxLUFkZC1hLXNodXRkb3duLWdyb3VwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Jh
c2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDEtQWRkLWEtc2h1dGRvd24tZ3JvdXAucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDhmM2FjZTg3ZGYzYWFhZDg1OTQ2YzIyY2FlMjQwNTMyZWEzZTcz
YjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI4Nzg0YzBmNDJkMWQyOTUyZTNjOGQy
YTE3OTY0NDg4MjE0NmRjNDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTYXVsIFdv
bGQgPHNnd0BsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBGcmksIDI5IEFwciAyMDIyIDEzOjMyOjI3
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBhIHNodXRkb3duIGdyb3VwCkBAIC0xNCwxMCAr
MTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tPgog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvZ3JvdXAubWFz
dGVyIGIvZ3JvdXAubWFzdGVyCi1pbmRleCBhZDFkZDJkLi4xYjVlMmZiIDEwMDY0NAoraW5kZXgg
M2U3YmYxYy4uNzIxMDhhOCAxMDA2NDQKIC0tLSBhL2dyb3VwLm1hc3RlcgogKysrIGIvZ3JvdXAu
bWFzdGVyCi1AQCAtMzUsNSArMzUsNiBAQCBzYXNsOio6NDU6CitAQCAtMzQsNSArMzQsNiBAQCBz
YXNsOio6NDU6CiAgcGx1Z2RldjoqOjQ2OgogIHN0YWZmOio6NTA6CiAgZ2FtZXM6Kjo2MDoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDEt
YmFzZS1wYXNzd2QtQWRkLXRoZS1zZ3gtZ3JvdXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9i
YXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAxLWJhc2UtcGFzc3dkLUFkZC10aGUtc2d4LWdyb3Vw
LnBhdGNoCmluZGV4IGUxMzQwZTFiNzAuLmZiNDg3ZDRhMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDEtYmFzZS1wYXNzd2QtQWRkLXRo
ZS1zZ3gtZ3JvdXAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFz
ZS1wYXNzd2QvMDAwMS1iYXNlLXBhc3N3ZC1BZGQtdGhlLXNneC1ncm91cC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gOWU1Nzc3MWQxMzhhYzQyM2Q1MTM5Yjk4NGI4Yzg2OTEyMmNlNDk3NiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGEwNjJkZTlmNTNlMThmMTBjNWFiNWNmMzg4
MDZmNzZmMWQ3ODUzNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXggS2llcm5h
biA8YWxleGtAenVtYS5haT4KIERhdGU6IEZyaSwgMjggSnVsIDIwMjMgMTA6Mjg6NTcgKzAxMDAK
IFN1YmplY3Q6IFtQQVRDSF0gYmFzZS1wYXNzd2Q6IEFkZCB0aGUgc2d4IGdyb3VwCkBAIC0xNyw3
ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXggS2llcm5hbiA8YWxleC5raWVybmFuQGdtYWls
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL2dy
b3VwLm1hc3RlciBiL2dyb3VwLm1hc3RlcgotaW5kZXggZDM0ZDJiODMyZDQzLi5lNTRmZDFkMmM2
ZGMgMTAwNjQ0CitpbmRleCBkMzRkMmI4Li5lNTRmZDFkIDEwMDY0NAogLS0tIGEvZ3JvdXAubWFz
dGVyCiArKysgYi9ncm91cC5tYXN0ZXIKIEBAIC0zNCw2ICszNCw3IEBAIHZpZGVvOio6NDQ6CmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAy
LVVzZS1iaW4tc2gtaW5zdGVhZC1vZi1iaW4tYmFzaC1mb3ItdGhlLXJvb3QtdXNlci5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDItVXNlLWJpbi1z
aC1pbnN0ZWFkLW9mLWJpbi1iYXNoLWZvci10aGUtcm9vdC11c2VyLnBhdGNoCmluZGV4IDA5Zjhj
ZmVhOWMuLjEyNjk1NGQ4YzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFz
c3dkL2Jhc2UtcGFzc3dkLzAwMDItVXNlLWJpbi1zaC1pbnN0ZWFkLW9mLWJpbi1iYXNoLWZvci10
aGUtcm9vdC11c2VyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jh
c2UtcGFzc3dkLzAwMDItVXNlLWJpbi1zaC1pbnN0ZWFkLW9mLWJpbi1iYXNoLWZvci10aGUtcm9v
dC11c2VyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NDExZmMwZGY3NzU2NmQ1MmJlZTEx
ZWMwYmFkNGJlMzBhOTZlOTllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4NTI2ZDlj
NGZhMmFkNTk0NmIxMmJmZTU1OWU1OTc0YTY0OWQwOWJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogU2NvdHQgR2FybWFuIDxzY290dC5hLmdhcm1hbkBpbnRlbC5jb20+CiBEYXRlOiBG
cmksIDI5IEFwciAyMDIyIDEzOjMyOjI3ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVzZSAvYmlu
L3NoIGluc3RlYWQgb2YgL2Jpbi9iYXNoIGZvciB0aGUgcm9vdCB1c2VyCkBAIC0xMiw3ICsxMiw3
IEBAIFNpZ25lZC1vZmYtYnk6IFNjb3R0IEdhcm1hbiA8c2NvdHQuYS5nYXJtYW5AaW50ZWwuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvcGFzc3dkLm1hc3RlciBiL3Bhc3N3ZC5tYXN0ZXIKLWluZGV4IDdjZDRlMjQuLjA0
MTY4NWEgMTAwNjQ0CitpbmRleCA5MDUxNGE1Li5iZDNlZmMyIDEwMDY0NAogLS0tIGEvcGFzc3dk
Lm1hc3RlcgogKysrIGIvcGFzc3dkLm1hc3RlcgogQEAgLTEsNCArMSw0IEBACmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAzLVJlbW92ZS1m
b3Itcm9vdC1zaW5jZS13ZS1kby1ub3QtaGF2ZS1hbi1ldGMtc2hhZG93LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMy1SZW1vdmUtZm9yLXJvb3Qt
c2luY2Utd2UtZG8tbm90LWhhdmUtYW4tZXRjLXNoYWRvdy5wYXRjaAppbmRleCAwNjIyMmFiMDRj
Li43YTRmNWIwZjM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9i
YXNlLXBhc3N3ZC8wMDAzLVJlbW92ZS1mb3Itcm9vdC1zaW5jZS13ZS1kby1ub3QtaGF2ZS1hbi1l
dGMtc2hhZG93LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2Ut
cGFzc3dkLzAwMDMtUmVtb3ZlLWZvci1yb290LXNpbmNlLXdlLWRvLW5vdC1oYXZlLWFuLWV0Yy1z
aGFkb3cucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDEzYTFhMjg0YTEzNGQxOGE0NTQ2MjVh
NWI0NDg1YzBkOTkwNzlhZTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM1YTUwMjY5
MTM0NjJhOWYzOWE2ODRiN2VhZjA2Mjc2YmE0ZDlhMDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBTY290dCBHYXJtYW4gPHNjb3R0LmEuZ2FybWFuQGludGVsLmNvbT4KIERhdGU6IEZy
aSwgMjkgQXByIDIwMjIgMTM6MzI6MjggKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlICIq
IiBmb3Igcm9vdCBzaW5jZSB3ZSBkbyBub3QgaGF2ZSBhbiAvZXRjL3NoYWRvdwpAQCAtMTAsNyAr
MTAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBTY290dCBHYXJtYW4gPHNjb3R0LmEuZ2FybWFuQGludGVs
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL3Bhc3N3ZC5tYXN0ZXIgYi9wYXNzd2QubWFzdGVyCi1pbmRleCAwNDE2ODVh
Li4zMWE4NGQ0IDEwMDY0NAoraW5kZXggYmQzZWZjMi4uNjZlOTAzMyAxMDA2NDQKIC0tLSBhL3Bh
c3N3ZC5tYXN0ZXIKICsrKyBiL3Bhc3N3ZC5tYXN0ZXIKIEBAIC0xLDQgKzEsNCBAQApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwNC1BZGQt
YW4taW5wdXQtZ3JvdXAtZm9yLXRoZS1kZXYtaW5wdXQtZGV2aWNlcy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDQtQWRkLWFuLWlucHV0LWdyb3Vw
LWZvci10aGUtZGV2LWlucHV0LWRldmljZXMucGF0Y2gKaW5kZXggMzk0YTBmMDFkMy4uYTMxNWNh
YmViYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNz
d2QvMDAwNC1BZGQtYW4taW5wdXQtZ3JvdXAtZm9yLXRoZS1kZXYtaW5wdXQtZGV2aWNlcy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA0LUFk
ZC1hbi1pbnB1dC1ncm91cC1mb3ItdGhlLWRldi1pbnB1dC1kZXZpY2VzLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBjNWYwMTI3NTBmODEwMmZmNTRhZjczY2NjMmQyYjdiZmExZjI2ZGI0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiM2Q5N2IyNDUxOWVkNDdmMjQ2ZDM3Y2I4YzQx
MWE3NDU0ZjZjNDdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRGFycmVuIEhhcnQg
PGR2aGFydEBsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBGcmksIDI5IEFwciAyMDIyIDEzOjMyOjI4
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBhbiBpbnB1dCBncm91cCBmb3IgdGhlIC9kZXYv
aW5wdXQvKiBkZXZpY2VzCkBAIC0xMCw3ICsxMCw3IEBAIFNpZ25lZC1vZmYtYnk6IERhcnJlbiBI
YXJ0IDxkdmhhcnRAbGludXguaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQogCiBkaWZmIC0tZ2l0IGEvZ3JvdXAubWFzdGVyIGIvZ3JvdXAubWFzdGVyCi1pbmRleCAx
YjVlMmZiLi5jZWE5ZDYwIDEwMDY0NAoraW5kZXggNzIxMDhhOC4uN2Q3OTRiMiAxMDA2NDQKIC0t
LSBhL2dyb3VwLm1hc3RlcgogKysrIGIvZ3JvdXAubWFzdGVyCiBAQCAtMTIsNiArMTIsNyBAQCB1
dWNwOio6MTA6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNl
LXBhc3N3ZC8wMDA1LUFkZC1rdm0tZ3JvdXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNl
LXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA1LUFkZC1rdm0tZ3JvdXAucGF0Y2gKaW5kZXggNzJlNmVl
MzMzYy4uNGYzMWIzZDIyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNz
d2QvYmFzZS1wYXNzd2QvMDAwNS1BZGQta3ZtLWdyb3VwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDUtQWRkLWt2bS1ncm91cC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNmNmMTk0NjFmYjMxZDdhN2EzMDEwNjI5YWFlOWFhYjQ5YzI2
YTAxYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmQ1ODZjYTM5Mzg2OTMzOTEyYTAx
ODY1OWZmNjA1M2NlNzk4M2E0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEphY29i
IEtyb29uIDxqYWNvYi5rcm9vbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMwIEphbiAyMDE5IDA0
OjUzOjQ4ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBrdm0gZ3JvdXAKQEAgLTEwLDEwICsx
MCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKYWNvYiBLcm9vbiA8amFjb2Iua3Jvb25AZ21haWwuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvZ3JvdXAu
bWFzdGVyIGIvZ3JvdXAubWFzdGVyCi1pbmRleCBjZWE5ZDYwLi41YjYyMjg0IDEwMDY0NAoraW5k
ZXggN2Q3OTRiMi4uN2ZkZDhiZiAxMDA2NDQKIC0tLSBhL2dyb3VwLm1hc3RlcgogKysrIGIvZ3Jv
dXAubWFzdGVyCi1AQCAtMzQsNiArMzQsNyBAQCB1dG1wOio6NDM6CitAQCAtMzMsNiArMzMsNyBA
QCB1dG1wOio6NDM6CiAgdmlkZW86Kjo0NDoKICBzYXNsOio6NDU6CiAgcGx1Z2RldjoqOjQ2Ogpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAw
Ny1BZGQtd2hlZWwtZ3JvdXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9i
YXNlLXBhc3N3ZC8wMDA3LUFkZC13aGVlbC1ncm91cC5wYXRjaAppbmRleCBkNzcxMjI3ODlkLi41
ZDkyNzA0ZTQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNl
LXBhc3N3ZC8wMDA3LUFkZC13aGVlbC1ncm91cC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA3LUFkZC13aGVlbC1ncm91cC5wYXRjaApAQCAt
MSwzICsxLDcgQEAKK0Zyb20gNDU3Mjc5MmMwOGYwMjM2OWZiMGJhNmIyYjFkMzhlZjAzYTI1NTA0
YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IExvdWlzIFJhbm5vdSA8bHJhbm5vdUBi
YXlsaWJyZS5jb20+CitEYXRlOiBUaHUsIDE1IEp1biAyMDIzIDEzOjQzOjU1ICswMjAwCitTdWJq
ZWN0OiBbUEFUQ0hdIGJhc2UtcGFzc3dkOiBhZGQgdGhlIHdoZWVsIGdyb3VwCiAKIFdlIG5lZWQg
dG8gaGF2ZSBhIHdoZWVsIGdyb3VwIHdoaWNoIGhhcyBzb21lIHN5c3RlbSBwcml2aWxlZ2VzIHRv
IGNvbnN1bHQgdGhlCiBzeXN0ZW1kIGpvdXJuYWwgb3IgbWFuYWdlIHByaW50ZXJzIHdpdGggY3Vw
cy4KQEAgLTcsMTEgKzExLDE1IEBAIFVwc3RyZWFtIHNheXMgdGhlIGdyb3VwIGRvZXMgbm90IGV4
aXN0IGJ5IGRlZmF1bHQuCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2VuYWJsZSBm
ZWF0dXJlXQogCiBTaWduZWQtb2ZmLWJ5OiBMb3VpcyBSYW5ub3UgPGxyYW5ub3VAYmF5bGlicmUu
Y29tPgotSW5kZXg6IGJhc2UtcGFzc3dkLTMuNS4yNi9ncm91cC5tYXN0ZXIKLT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
LS0tLSBiYXNlLXBhc3N3ZC0zLjUuMjkub3JpZy9ncm91cC5tYXN0ZXIKLSsrKyBiYXNlLXBhc3N3
ZC0zLjUuMjkvZ3JvdXAubWFzdGVyCi1AQCAtMzgsNSArMzgsNiBAQAorLS0tCisgZ3JvdXAubWFz
dGVyIHwgMSArCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCisKK2RpZmYgLS1naXQg
YS9ncm91cC5tYXN0ZXIgYi9ncm91cC5tYXN0ZXIKK2luZGV4IDdmZGQ4YmYuLmQzNGQyYjggMTAw
NjQ0CistLS0gYS9ncm91cC5tYXN0ZXIKKysrKyBiL2dyb3VwLm1hc3RlcgorQEAgLTM3LDUgKzM3
LDYgQEAga3ZtOio6NDc6CiAgc3RhZmY6Kjo1MDoKICBnYW1lczoqOjYwOgogIHNodXRkb3duOio6
NzA6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3
ZF8zLjYuMy5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkXzMu
Ni40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkXzMuNi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Y29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuNC5iYgppbmRleCBiZjUwYjAxZmQ1Li5k
ZjQ4ODlmMjIwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNl
LXBhc3N3ZF8zLjYuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNl
LXBhc3N3ZF8zLjYuNC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vbGF1
bmNocGFkLm5ldC9kZWJpYW4vK2FyY2hpdmUvcHJpbWFyeS8rZmlsZXMvJHtCUE59XyR7UFZ9LnRh
cgogICAgICAgICAgICBmaWxlOi8vMDAwMS1iYXNlLXBhc3N3ZC1BZGQtdGhlLXNneC1ncm91cC5w
YXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgzNTc1MzI3ZDgz
MThhNDE5Y2FmMmQ1NDMzNDEyMTVjMDQ2MDQ0MDczZDFhZmVjMmFjYzBhYzRkODA5NWZmMzkiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNGI1MjMyYzU5MTA5MzIyMTViODdiYmRlNmYzYzZjOWE5NzAy
MWZlNzkwMmJkODM3YjFlZGU4Y2MwYmU4NGE2NSIKIAogIyB0aGUgcGFja2FnZSBpcyB0YWtlbiBm
cm9tIGxhdW5jaHBhZDsgdGhhdCBzb3VyY2UgaXMgc3RhdGljIGFuZCBnb2VzIHN0YWxlCiAjIHNv
IHdlIGNoZWNrIHRoZSBsYXRlc3QgdXBzdHJlYW0gZnJvbSBhIGRpcmVjdG9yeSB0aGF0IGRvZXMg
Z2V0IHVwZGF0ZWQKLS0gCjIuNDQuMAoK

--===============7212191180761153248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PKGV changed from 3.6.3 [default] to 3.6.4 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PV changed from "3.6.3" to "3.6.4"
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PKGV changed from 3.6.3 [default] to 3.6.4 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PV changed from "3.6.3" to "3.6.4"
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGV changed from 3.6.3 [default] to 3.6.4 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGSIZE changed from 19813 to 19873 (+0%)
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PV changed from "3.6.3" to "3.6.4"
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PKGV changed from 3.6.3 [default] to 3.6.4 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PV changed from "3.6.3" to "3.6.4"
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PKGV changed from 3.6.3 [default] to 3.6.4 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PV changed from "3.6.3" to "3.6.4"
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PKGV changed from 3.6.3 [default] to 3.6.4 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PV changed from "3.6.3" to "3.6.4"
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PKGV changed from 3.6.3 [default] to 3.6.4 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PV changed from "3.6.3" to "3.6.4"
packages/core2-64-poky-linux/base-passwd/base-passwd: PKGV changed from 3.6.3 [default] to 3.6.4 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd: PV changed from "3.6.3" to "3.6.4"
packages/core2-64-poky-linux/base-passwd: PKGV changed from 3.6.3 [default] to 3.6.4 [default]
packages/core2-64-poky-linux/base-passwd: PV changed from "3.6.3" to "3.6.4"
packages/core2-64-poky-linux/base-passwd: SRC_URI changed from "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.3.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patch" to "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.4.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patch"

--===============7212191180761153248==--

