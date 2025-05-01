Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB635C5B554
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:34:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1808.1746113616009259453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=a7eqsOpu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dLskKe+X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101968c7bb0e9-aa6a2451-498c-44a0-8039-c3dd2eda55c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113638;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+dBnDO3TZRZXgcVrJVXFpL9T0TTU1EEbpm6ffwW9s1Q=;
	b=a7eqsOpuZsLHnpRVoeIZPOG2qCL+A/v5DHislpR38FN8cPNpdpn8mjv+Qds3DYy7
	m6Q1mDkMyxrACCXtMFvNjoV9Zee5dx3oC+FMyes4zMxOyVptIY88nEq9gFEtUpf2rPw
	QML/0aQhKU5+outOhBgeLXY47Tq7z5XS7tfPjbUY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113638;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+dBnDO3TZRZXgcVrJVXFpL9T0TTU1EEbpm6ffwW9s1Q=;
	b=dLskKe+XYjzw1jJsAJErk8xCIztDfGmvU0s5/oUAHlusDnOGlH/uwMt0qkhq9c7+
	gM84sIQvSakHed5QbCa8O7lRVIwm4oOIKggmk3C7OwjLTUW7CekYwQU/V4r97M8MCld
	b3M9y+KVR47lbGvIRUM9yGHs/m3YSyxSip9AtFqw=
Content-Type: multipart/mixed; boundary="===============8368177904381783353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ca-certificates: upgrading to 20250419 SUCCEEDED
Message-ID: <010101968c7bb0e9-aa6a2451-498c-44a0-8039-c3dd2eda55c0-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215885

--===============8368177904381783353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ca-certificates* to *20250419* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ca-certificates-upgrade-20241223-20250419.patch
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
From 086bef15927bfce00c9748b38173acb2d9c4be38 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 14:14:29 +0000
Subject: [PATCH] ca-certificates: upgrade 20241223 -> 20250419

---
 ...ertdata2pem.py-print-a-warning-for-e.patch |  6 ++--
 ...icates-don-t-use-Debianisms-in-run-p.patch |  6 ++--
 ...ca-certificates-add-a-sysroot-option.patch | 36 -------------------
 ...icates-use-relative-symlinks-from-ET.patch |  2 +-
 ...0241223.bb => ca-certificates_20250419.bb} |  3 +-
 5 files changed, 8 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20241223.bb => ca-certificates_20250419.bb} (94%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index da2a247e51..c41d7fe589 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 630736f427c0a1bd0be0b5a2f6d51d63b2c4c9fd Mon Sep 17 00:00:00 2001
+From e2d4af2b8e5ad44d7f1e02c58e3ab870d8318458 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/debian/changelog b/debian/changelog
-index 52d41ca..bdb2c8a 100644
+index dbe3e9c..496e05d 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -138,7 +138,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -156,7 +156,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index cad30929f5..899ad2a7a3 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From 348163df412e53b1b7ec3e81ae5f22caa0227c37 Mon Sep 17 00:00:00 2001
+From b5c5e3ca900660c1ce20037d91efc7a381edae3d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
@@ -22,10 +22,10 @@ Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 36cdd9a..2d3e1fe 100755
+index 91d8024..1e737b9 100755
 --- a/sbin/update-ca-certificates
 +++ b/sbin/update-ca-certificates
-@@ -202,9 +202,7 @@ if [ -d "$HOOKSDIR" ]
+@@ -210,9 +210,7 @@ if [ -d "$HOOKSDIR" ]
  then
  
    echo "Running hooks in $HOOKSDIR..."
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch b/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
deleted file mode 100644
index ba5bb69657..0000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d6bb773745c2e95fd1a414e916fbed64e0d8df66 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 31 Mar 2025 17:42:25 +0200
-Subject: [PATCH] sbin/update-ca-certificates: add a --sysroot option
-
-This allows using the script in cross-compilation environments
-where the script needs to prefix the sysroot to every other
-directory it operates on. There are individual options
-to set those directories, but using a common prefix option
-instead is a lot less clutter and more robust.
-
-Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/13]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- sbin/update-ca-certificates | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 4bb77a0..1e737b9 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -59,6 +59,14 @@ do
-     --hooksdir)
-       shift
-       HOOKSDIR="$1";;
-+    --sysroot)
-+      shift
-+      SYSROOT="$1"
-+      CERTSCONF="$1/${CERTSCONF}"
-+      CERTSDIR="$1/${CERTSDIR}"
-+      LOCALCERTSDIR="$1/${LOCALCERTSDIR}"
-+      ETCCERTSDIR="$1/${ETCCERTSDIR}"
-+      HOOKSDIR="$1/${HOOKSDIR}";;
-     --help|-h|*)
-       echo "$0: [--verbose] [--fresh]"
-       exit;;
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
index 929945b56f..f16ac26a1c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From a69933f96a8675369de702bdb55e57dc21f65e7f Mon Sep 17 00:00:00 2001
+From 69a9ed82f993efbf4d152d0f9bc1bd970d3de65c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
similarity index 94%
rename from meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
index 676e9e0c78..f06a30bd6d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
@@ -14,10 +14,9 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03"
+SRC_URI[sha256sum] = "33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
-           file://0002-sbin-update-ca-certificates-add-a-sysroot-option.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
            "
-- 
2.47.1


--===============8368177904381783353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dbg: PV changed from "20241223" to "20250419"
packages/all-poky-linux/ca-certificates/ca-certificates-dbg: PKGV changed from 20241223 [default] to 20250419 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-dev: PV changed from "20241223" to "20250419"
packages/all-poky-linux/ca-certificates/ca-certificates-dev: PKGV changed from 20241223 [default] to 20250419 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-doc: PV changed from "20241223" to "20250419"
packages/all-poky-linux/ca-certificates/ca-certificates-doc: PKGV changed from 20241223 [default] to 20250419 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-locale: PV changed from "20241223" to "20250419"
packages/all-poky-linux/ca-certificates/ca-certificates-locale: PKGV changed from 20241223 [default] to 20250419 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-src: PV changed from "20241223" to "20250419"
packages/all-poky-linux/ca-certificates/ca-certificates-src: PKGV changed from 20241223 [default] to 20250419 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: PV changed from "20241223" to "20250419"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: PKGV changed from 20241223 [default] to 20250419 [default]
packages/all-poky-linux/ca-certificates/ca-certificates: PKGSIZE changed from 239785 to 236235 (-1%)
packages/all-poky-linux/ca-certificates/ca-certificates: PV changed from "20241223" to "20250419"
packages/all-poky-linux/ca-certificates/ca-certificates: PKGV changed from 20241223 [default] to 20250419 [default]
packages/all-poky-linux/ca-certificates/ca-certificates: FILELIST: removed "/usr/share/ca-certificates/mozilla/SwissSign_Silver_CA_-_G2.crt /usr/share/ca-certificates/mozilla/Security_Communication_RootCA3.crt /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G4.crt /usr/share/ca-certificates/mozilla/SecureSign_RootCA11.crt", added "/usr/share/ca-certificates/mozilla/D-TRUST_EV_Root_CA_2_2023.crt /usr/share/ca-certificates/mozilla/D-TRUST_BR_Root_CA_2_2023.crt"
packages/all-poky-linux/ca-certificates: PV changed from "20241223" to "20250419"
packages/all-poky-linux/ca-certificates: SRC_URI changed from "http://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20241223.tar.xz file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch file://0002-sbin-update-ca-certificates-add-a-sysroot-option.patch file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch" to "http://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20250419.tar.xz file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch"
packages/all-poky-linux/ca-certificates: PKGV changed from 20241223 [default] to 20250419 [default]
Changes to packages/all-poky-linux/ca-certificates (sysroot):
  /usr/share/ca-certificates/mozilla/D-TRUST_BR_Root_CA_2_2023.crt was added
  /usr/share/ca-certificates/mozilla/D-TRUST_EV_Root_CA_2_2023.crt was added
  /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G4.crt was removed
  /usr/share/ca-certificates/mozilla/SecureSign_RootCA11.crt was removed
  /usr/share/ca-certificates/mozilla/Security_Communication_RootCA3.crt was removed
  /usr/share/ca-certificates/mozilla/SwissSign_Silver_CA_-_G2.crt was removed

--===============8368177904381783353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/ca-certificates/ca-certificates: FILELIST: removed "/usr/share/ca-certificates/mozilla/Security_Communication_RootCA3.crt /usr/share/ca-certificates/mozilla/SecureSign_RootCA11.crt /usr/share/ca-certificates/mozilla/SwissSign_Silver_CA_-_G2.crt /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G4.crt", added "/usr/share/ca-certificates/mozilla/D-TRUST_EV_Root_CA_2_2023.crt /usr/share/ca-certificates/mozilla/D-TRUST_BR_Root_CA_2_2023.crt"
Changes to packages/all-poky-linux/ca-certificates (sysroot):
  /usr/share/ca-certificates/mozilla/D-TRUST_BR_Root_CA_2_2023.crt was added
  /usr/share/ca-certificates/mozilla/D-TRUST_EV_Root_CA_2_2023.crt was added
  /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G4.crt was removed
  /usr/share/ca-certificates/mozilla/SecureSign_RootCA11.crt was removed
  /usr/share/ca-certificates/mozilla/Security_Communication_RootCA3.crt was removed
  /usr/share/ca-certificates/mozilla/SwissSign_Silver_CA_-_G2.crt was removed

--===============8368177904381783353==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ca-certificates-upgrade-20241223-20250419.patch"

RnJvbSAwODZiZWYxNTkyN2JmY2UwMGM5NzQ4YjM4MTczYWNiMmQ5YzRiZTM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxNDoxNDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNh
LWNlcnRpZmljYXRlczogdXBncmFkZSAyMDI0MTIyMyAtPiAyMDI1MDQxOQoKLS0tCiAuLi5lcnRk
YXRhMnBlbS5weS1wcmludC1hLXdhcm5pbmctZm9yLWUucGF0Y2ggfCAgNiArKy0tCiAuLi5pY2F0
ZXMtZG9uLXQtdXNlLURlYmlhbmlzbXMtaW4tcnVuLXAucGF0Y2ggfCAgNiArKy0tCiAuLi5jYS1j
ZXJ0aWZpY2F0ZXMtYWRkLWEtc3lzcm9vdC1vcHRpb24ucGF0Y2ggfCAzNiAtLS0tLS0tLS0tLS0t
LS0tLS0tCiAuLi5pY2F0ZXMtdXNlLXJlbGF0aXZlLXN5bWxpbmtzLWZyb20tRVQucGF0Y2ggfCAg
MiArLQogLi4uMDI0MTIyMy5iYiA9PiBjYS1jZXJ0aWZpY2F0ZXNfMjAyNTA0MTkuYmJ9IHwgIDMg
Ky0KIDUgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2Et
Y2VydGlmaWNhdGVzLzAwMDItc2Jpbi11cGRhdGUtY2EtY2VydGlmaWNhdGVzLWFkZC1hLXN5c3Jv
b3Qtb3B0aW9uLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNh
dGVzL3tjYS1jZXJ0aWZpY2F0ZXNfMjAyNDEyMjMuYmIgPT4gY2EtY2VydGlmaWNhdGVzXzIwMjUw
NDE5LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRp
ZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMS1SZXZlcnQtbW96aWxsYS1jZXJ0ZGF0YTJwZW0u
cHktcHJpbnQtYS13YXJuaW5nLWZvci1lLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2Et
Y2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAxLVJldmVydC1tb3ppbGxhLWNlcnRkYXRh
MnBlbS5weS1wcmludC1hLXdhcm5pbmctZm9yLWUucGF0Y2gKaW5kZXggZGEyYTI0N2U1MS4uYzQx
ZDdmZTU4OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVz
L2NhLWNlcnRpZmljYXRlcy8wMDAxLVJldmVydC1tb3ppbGxhLWNlcnRkYXRhMnBlbS5weS1wcmlu
dC1hLXdhcm5pbmctZm9yLWUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2Vy
dGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAxLVJldmVydC1tb3ppbGxhLWNlcnRkYXRhMnBl
bS5weS1wcmludC1hLXdhcm5pbmctZm9yLWUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDYz
MDczNmY0MjdjMGExYmQwYmUwYjVhMmY2ZDUxZDYzYjJjNGM5ZmQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGUyZDRhZjJiOGU1YWQ0NGQ3ZjFlMDJjNThlM2FiODcwZDgzMTg0NTggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51
dHJvbml4LmRlPgogRGF0ZTogTW9uLCAxOCBPY3QgMjAyMSAxMjowNTo0OSArMDIwMAogU3ViamVj
dDogW1BBVENIXSBSZXZlcnQgIm1vemlsbGEvY2VydGRhdGEycGVtLnB5OiBwcmludCBhIHdhcm5p
bmcgZm9yIGV4cGlyZWQKQEAgLTE2LDEwICsxNiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvZGViaWFuL2NoYW5nZWxv
ZyBiL2RlYmlhbi9jaGFuZ2Vsb2cKLWluZGV4IDUyZDQxY2EuLmJkYjJjOGEgMTAwNjQ0CitpbmRl
eCBkYmUzZTljLi40OTZlMDVkIDEwMDY0NAogLS0tIGEvZGViaWFuL2NoYW5nZWxvZwogKysrIGIv
ZGViaWFuL2NoYW5nZWxvZwotQEAgLTEzOCw3ICsxMzgsNiBAQCBjYS1jZXJ0aWZpY2F0ZXMgKDIw
MjExMDA0KSB1bnN0YWJsZTsgdXJnZW5jeT1sb3cKK0BAIC0xNTYsNyArMTU2LDYgQEAgY2EtY2Vy
dGlmaWNhdGVzICgyMDIxMTAwNCkgdW5zdGFibGU7IHVyZ2VuY3k9bG93CiAgICAgIC0gIlRydXN0
aXMgRlBTIFJvb3QgQ0EiCiAgICAgIC0gIlN0YWF0IGRlciBOZWRlcmxhbmRlbiBSb290IENBIC0g
RzMiCiAgICAqIEJsYWNrbGlzdCBleHBpcmVkIHJvb3QgY2VydGlmaWNhdGUgIkRTVCBSb290IENB
IFgzIiAoY2xvc2VzOiAjOTk1NDMyKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Y2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAxLXVwZGF0ZS1jYS1jZXJ0aWZpY2F0
ZXMtZG9uLXQtdXNlLURlYmlhbmlzbXMtaW4tcnVuLXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLzAwMDEtdXBkYXRlLWNhLWNlcnRp
ZmljYXRlcy1kb24tdC11c2UtRGViaWFuaXNtcy1pbi1ydW4tcC5wYXRjaAppbmRleCBjYWQzMDky
OWY1Li44OTlhZDJhN2EzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0
aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLzAwMDEtdXBkYXRlLWNhLWNlcnRpZmljYXRlcy1kb24t
dC11c2UtRGViaWFuaXNtcy1pbi1ydW4tcC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLzAwMDEtdXBkYXRlLWNhLWNlcnRpZmlj
YXRlcy1kb24tdC11c2UtRGViaWFuaXNtcy1pbi1ydW4tcC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMzQ4MTYzZGY0MTJlNTNiMWI3ZWMzZTgxYWU1ZjIyY2FhMDIyN2MzNyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjVjNWUzY2E5MDA2NjBjMWNlMjAwMzdkOTFlZmM3YTM4MWVk
YWUzZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBNb24sIDYgSnVsIDIwMTUgMTU6MTk6NDEgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gY2EtY2VydGlmaWNhdGVzOiByZW1vdmUgRGViaWFuaXNtIGluIHJ1bi1w
YXJ0cyBpbnZvY2F0aW9uCkBAIC0yMiwxMCArMjIsMTAgQEAgU2lnbmVkLW9mZi1ieTogTWFjaWVq
IEJvcnplY2tpIDxtYWNpZWouYm9yemVja2lAcm5kaXR5LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zYmluL3VwZGF0
ZS1jYS1jZXJ0aWZpY2F0ZXMgYi9zYmluL3VwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMKLWluZGV4IDM2
Y2RkOWEuLjJkM2UxZmUgMTAwNzU1CitpbmRleCA5MWQ4MDI0Li4xZTczN2I5IDEwMDc1NQogLS0t
IGEvc2Jpbi91cGRhdGUtY2EtY2VydGlmaWNhdGVzCiArKysgYi9zYmluL3VwZGF0ZS1jYS1jZXJ0
aWZpY2F0ZXMKLUBAIC0yMDIsOSArMjAyLDcgQEAgaWYgWyAtZCAiJEhPT0tTRElSIiBdCitAQCAt
MjEwLDkgKzIxMCw3IEBAIGlmIFsgLWQgIiRIT09LU0RJUiIgXQogIHRoZW4KICAKICAgIGVjaG8g
IlJ1bm5pbmcgaG9va3MgaW4gJEhPT0tTRElSLi4uIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAyLXNiaW4tdXBkYXRl
LWNhLWNlcnRpZmljYXRlcy1hZGQtYS1zeXNyb290LW9wdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMi1zYmluLXVwZGF0
ZS1jYS1jZXJ0aWZpY2F0ZXMtYWRkLWEtc3lzcm9vdC1vcHRpb24ucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IGJhNWJiNjk2NTcuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAyLXNiaW4tdXBk
YXRlLWNhLWNlcnRpZmljYXRlcy1hZGQtYS1zeXNyb290LW9wdGlvbi5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDM2ICswLDAgQEAKLUZyb20gZDZiYjc3Mzc0NWMyZTk1ZmQxYTQxNGU5MTZmYmVk
NjRlMGQ4ZGY2NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBNb24sIDMxIE1hciAyMDI1IDE3OjQyOjI1
ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIHNiaW4vdXBkYXRlLWNhLWNlcnRpZmljYXRlczogYWRk
IGEgLS1zeXNyb290IG9wdGlvbgotCi1UaGlzIGFsbG93cyB1c2luZyB0aGUgc2NyaXB0IGluIGNy
b3NzLWNvbXBpbGF0aW9uIGVudmlyb25tZW50cwotd2hlcmUgdGhlIHNjcmlwdCBuZWVkcyB0byBw
cmVmaXggdGhlIHN5c3Jvb3QgdG8gZXZlcnkgb3RoZXIKLWRpcmVjdG9yeSBpdCBvcGVyYXRlcyBv
bi4gVGhlcmUgYXJlIGluZGl2aWR1YWwgb3B0aW9ucwotdG8gc2V0IHRob3NlIGRpcmVjdG9yaWVz
LCBidXQgdXNpbmcgYSBjb21tb24gcHJlZml4IG9wdGlvbgotaW5zdGVhZCBpcyBhIGxvdCBsZXNz
IGNsdXR0ZXIgYW5kIG1vcmUgcm9idXN0LgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBb
aHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL2RlYmlhbi9jYS1jZXJ0aWZpY2F0ZXMvLS9tZXJnZV9y
ZXF1ZXN0cy8xM10KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0
cm9uaXguZGU+Ci0tLS0KLSBzYmluL3VwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMgfCA4ICsrKysrKysr
Ci0gMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvc2Jpbi91
cGRhdGUtY2EtY2VydGlmaWNhdGVzIGIvc2Jpbi91cGRhdGUtY2EtY2VydGlmaWNhdGVzCi1pbmRl
eCA0YmI3N2EwLi4xZTczN2I5IDEwMDc1NQotLS0tIGEvc2Jpbi91cGRhdGUtY2EtY2VydGlmaWNh
dGVzCi0rKysgYi9zYmluL3VwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMKLUBAIC01OSw2ICs1OSwxNCBA
QCBkbwotICAgICAtLWhvb2tzZGlyKQotICAgICAgIHNoaWZ0Ci0gICAgICAgSE9PS1NESVI9IiQx
Ijs7Ci0rICAgIC0tc3lzcm9vdCkKLSsgICAgICBzaGlmdAotKyAgICAgIFNZU1JPT1Q9IiQxIgot
KyAgICAgIENFUlRTQ09ORj0iJDEvJHtDRVJUU0NPTkZ9IgotKyAgICAgIENFUlRTRElSPSIkMS8k
e0NFUlRTRElSfSIKLSsgICAgICBMT0NBTENFUlRTRElSPSIkMS8ke0xPQ0FMQ0VSVFNESVJ9Igot
KyAgICAgIEVUQ0NFUlRTRElSPSIkMS8ke0VUQ0NFUlRTRElSfSIKLSsgICAgICBIT09LU0RJUj0i
JDEvJHtIT09LU0RJUn0iOzsKLSAgICAgLS1oZWxwfC1ofCopCi0gICAgICAgZWNobyAiJDA6IFst
LXZlcmJvc2VdIFstLWZyZXNoXSIKLSAgICAgICBleGl0OzsKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMy11cGRhdGUt
Y2EtY2VydGlmaWNhdGVzLXVzZS1yZWxhdGl2ZS1zeW1saW5rcy1mcm9tLUVULnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAzLXVw
ZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMtdXNlLXJlbGF0aXZlLXN5bWxpbmtzLWZyb20tRVQucGF0Y2gK
aW5kZXggOTI5OTQ1YjU2Zi4uZjE2YWMyNmExYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAzLXVwZGF0ZS1jYS1jZXJ0
aWZpY2F0ZXMtdXNlLXJlbGF0aXZlLXN5bWxpbmtzLWZyb20tRVQucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAzLXVwZGF0
ZS1jYS1jZXJ0aWZpY2F0ZXMtdXNlLXJlbGF0aXZlLXN5bWxpbmtzLWZyb20tRVQucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGE2OTkzM2Y5NmE4Njc1MzY5ZGU3MDJiZGI1NWU1N2RjMjFmNjVl
N2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY5YTllZDgyZjk5M2VmYmY0ZDE1MmQw
ZjliYzFiZDk3MGQzZGU2NWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04
P3E/QW5kcj1DMz1BOT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogRGF0ZTog
V2VkLCAyOCBNYXIgMjAxOCAxNjo0NTowNSArMDEwMAogU3ViamVjdDogW1BBVENIXSB1cGRhdGUt
Y2EtY2VydGlmaWNhdGVzOiB1c2UgcmVsYXRpdmUgc3ltbGlua3MgZnJvbQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlc18yMDI0
MTIyMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZp
Y2F0ZXNfMjAyNTA0MTkuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlc18yMDI0MTIyMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRp
ZmljYXRlc18yMDI1MDQxOS5iYgppbmRleCA2NzZlOWUwYzc4Li5mMDZhMzBiZDZkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVz
XzIwMjQxMjIzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9j
YS1jZXJ0aWZpY2F0ZXNfMjAyNTA0MTkuYmIKQEAgLTE0LDEwICsxNCw5IEBAIERFUEVORFM6Y2xh
c3MtbmF0aXZlc2RrID0gIm9wZW5zc2wtbmF0aXZlIgogIyBOZWVkIHJlaGFzaCBmcm9tIG9wZW5z
c2wgYW5kIHJ1bi1wYXJ0cyBmcm9tIGRlYmlhbnV0aWxzCiBQQUNLQUdFX1dSSVRFX0RFUFMgKz0g
Im9wZW5zc2wtbmF0aXZlIGRlYmlhbnV0aWxzLW5hdGl2ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImRkODI4NmQwYTlkZDM1Yzc1NmZlYTVmMWRmM2ZlZDE1MTBmYjg5MWYzNzY5MDM4OTFiMDAz
Y2Q5YjFhZDdlMDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzNiNDRlZjc4NjUzZWNkM2YwZjJm
MTNlNWJiYTZiZTQ2NmJlMmU3ZGE3MjE4MmY3Mzc5MTJiODE3OThiYTVkMiIKIFNSQ19VUkkgPSAi
JHtERUJJQU5fTUlSUk9SfS9tYWluL2MvY2EtY2VydGlmaWNhdGVzLyR7QlBOfV8ke1BWfS50YXIu
eHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS11cGRhdGUtY2EtY2VydGlmaWNhdGVzLWRvbi10
LXVzZS1EZWJpYW5pc21zLWluLXJ1bi1wLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDIt
c2Jpbi11cGRhdGUtY2EtY2VydGlmaWNhdGVzLWFkZC1hLXN5c3Jvb3Qtb3B0aW9uLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDMtdXBkYXRlLWNhLWNlcnRpZmljYXRlcy11c2UtcmVsYXRp
dmUtc3ltbGlua3MtZnJvbS1FVC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJldmVy
dC1tb3ppbGxhLWNlcnRkYXRhMnBlbS5weS1wcmludC1hLXdhcm5pbmctZm9yLWUucGF0Y2ggXAog
ICAgICAgICAgICAiCi0tIAoyLjQ3LjEKCg==

--===============8368177904381783353==--

