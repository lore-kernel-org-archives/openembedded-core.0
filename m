Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920D1CD98E6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50439.1781195522545452168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Bkwx89gP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lXnDVea5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019eb786bfaf-e540c3c8-1dca-4077-b1a7-df9699b6a83f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195522;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=16eeeyjHKa/BoIw3ip4eDB1Fji9cxpwpBJCjxyhUUs8=;
	b=Bkwx89gPzFpwGPl/q0sDVfuKMtIBSyJ1CXao76cLNbj3e8+a1W9EubY+0tnGvDnF
	4Oc1EodkbgDgqyn5yq6aSh8W20WW1qoxK6GUTHRjXz6IsxElMpVWc+2NoQia/8w+g5p
	uv0gRZh20aMbwoUumuY4ZD6tNMSyShWX0YaMTDlM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195522;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=16eeeyjHKa/BoIw3ip4eDB1Fji9cxpwpBJCjxyhUUs8=;
	b=lXnDVea5zDUceHNXdtF1bAa8jgpj6t1kUKQg9aGngJ8Uu3ATZ8N6H46YeAmd8IIx
	enXNaTjtKhy+nYgTouq/cTsXvqPnHmX2bQCL9x84rSpRD5x4KL9HKtghP3XIX7oepcd
	FCMvBn3VHP3D4du3EUGI6AdNjE+RPQS8WBMkLY24=
Content-Type: multipart/mixed; boundary="===============0219252089046145337=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ca-certificates: upgrading to 20260601 SUCCEEDED
Message-ID: <0101019eb786bfaf-e540c3c8-1dca-4077-b1a7-df9699b6a83f-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238567

--===============0219252089046145337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ca-certificates* to *20260601* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ca-certificates-upgrade-20260223-20260601.patch
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
From b93de52b4ac6f8583a5f98819c533aa7a7ad79c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 14:57:50 +0000
Subject: [PATCH] ca-certificates: upgrade 20260223 -> 20260601

---
 ...ertdata2pem.py-print-a-warning-for-e.patch |  6 ++---
 ...icates-don-t-use-Debianisms-in-run-p.patch |  2 +-
 ...icates-use-relative-symlinks-from-ET.patch |  2 +-
 ...0260223.bb => ca-certificates_20260601.bb} | 25 +++++++++++++++++--
 4 files changed, 28 insertions(+), 7 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (79%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index 1226508c98..5ba5d3eac6 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 743774cd53ed1c45bb660eddacf6dadb5ee3e145 Mon Sep 17 00:00:00 2001
+From 05f51aa6d26e7107f744bbb6e71effa213fa04c8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/debian/changelog b/debian/changelog
-index dbe3e9c..496e05d 100644
+index 8ae7839..23b4b21 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -156,7 +156,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -218,7 +218,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index 1a29da756f..f03d298705 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From 63086d41f76b1c3357e23c6509df72d3f75af20c Mon Sep 17 00:00:00 2001
+From 4bad006e03e23a8e69c5a409d7c46d31015292ec Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
index 929945b56f..310b3ad95c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From a69933f96a8675369de702bdb55e57dc21f65e7f Mon Sep 17 00:00:00 2001
+From c61c17ae5e10d560cd2de1d56c5347509bbc14b1 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
similarity index 79%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
index 41690d1d08..641975b11d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- debian/copyright
+# +++ debian/copyright
+# @@ -2,7 +2,6 @@
+#  Source: http://ftp.debian.org/debian/pool/main/c/ca-certificates/
+#  
+#  Files: debian/*
+# -       examples/*
+#         Makefile
+#         mozilla/*
+#         sbin/*
+# 
+#
+
 SUMMARY = "Common CA certificates"
 DESCRIPTION = "This package includes PEM files of CA certificates to allow \
 SSL-based applications to check for the authenticity of SSL connections. \
@@ -5,7 +26,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0-or-later & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=ae5b36b514e3f12ce1aa8e2ee67f3d7e"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=dab7c7cea776d1a1648deb0052c72647"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +35,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
+SRC_URI[sha256sum] = "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f4649854cf4b0d4bea21"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
-- 
2.47.1


--===============0219252089046145337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dbg: PV changed from "20260223" to "20260601"
packages/all-poky-linux/ca-certificates/ca-certificates-dbg: PKGV changed from 20260223 [default] to 20260601 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-dev: PV changed from "20260223" to "20260601"
packages/all-poky-linux/ca-certificates/ca-certificates-dev: PKGV changed from 20260223 [default] to 20260601 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-doc: PV changed from "20260223" to "20260601"
packages/all-poky-linux/ca-certificates/ca-certificates-doc: PKGV changed from 20260223 [default] to 20260601 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-locale: PV changed from "20260223" to "20260601"
packages/all-poky-linux/ca-certificates/ca-certificates-locale: PKGV changed from 20260223 [default] to 20260601 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-src: PV changed from "20260223" to "20260601"
packages/all-poky-linux/ca-certificates/ca-certificates-src: PKGV changed from 20260223 [default] to 20260601 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: PV changed from "20260223" to "20260601"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: PKGV changed from 20260223 [default] to 20260601 [default]
packages/all-poky-linux/ca-certificates/ca-certificates: PV changed from "20260223" to "20260601"
packages/all-poky-linux/ca-certificates/ca-certificates: PKGV changed from 20260223 [default] to 20260601 [default]
packages/all-poky-linux/ca-certificates/ca-certificates: PKGSIZE changed from 228128 to 192791 (-15%)
packages/all-poky-linux/ca-certificates/ca-certificates: FILELIST: removed "/usr/share/ca-certificates/mozilla/AffirmTrust_Commercial.crt /usr/share/ca-certificates/mozilla/AffirmTrust_Premium_ECC.crt /usr/share/ca-certificates/mozilla/Certigna.crt /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_EC1.crt /usr/share/ca-certificates/mozilla/Trustwave_Global_Certification_Authority.crt /usr/share/ca-certificates/mozilla/COMODO_Certification_Authority.crt /usr/share/ca-certificates/mozilla/SecureTrust_CA.crt /usr/share/ca-certificates/mozilla/GTS_Root_R2.crt /usr/share/ca-certificates/mozilla/GLOBALTRUST_2020.crt /usr/share/ca-certificates/mozilla/certSIGN_ROOT_CA.crt /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G2.crt /usr/share/ca-certificates/mozilla/DigiCert_Assured_ID_Root_CA.crt /usr/share/ca-certificates/mozilla/FIRMAPROFESIONAL_CA_ROOT-A_WEB.crt /usr/share/ca-certificates/mozilla/SwissSign_Gold_CA_-_G2.crt /usr/share/ca-certif
 icates/mozilla/Trustwave_Global_ECC_P384_Certification_Authority.crt /usr/share/ca-certificates/mozilla/Trustwave_Global_ECC_P256_Certification_Authority.crt /usr/share/ca-certificates/mozilla/AffirmTrust_Premium.crt /usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_3.crt /usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_2.crt /usr/share/ca-certificates/mozilla/TeliaSonera_Root_CA_v1.crt /usr/share/ca-certificates/mozilla/DigiCert_Global_Root_CA.crt /usr/share/ca-certificates/mozilla/DigiCert_High_Assurance_EV_Root_CA.crt /usr/share/ca-certificates/mozilla/_OISTE_Server_Root_RSA_G1.crt /usr/share/ca-certificates/mozilla/AffirmTrust_Networking.crt /usr/share/ca-certificates/mozilla/Secure_Global_CA.crt", added "/usr/share/ca-certificates/mozilla/e-Szigno_TLS_Root_CA_2023.crt /usr/share/ca-certificates/mozilla/OISTE_Server_Root_RSA_G1.crt"
packages/all-poky-linux/ca-certificates: SRC_URI changed from "http://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20260223.tar.xz file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch" to "http://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20260601.tar.xz file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch"
packages/all-poky-linux/ca-certificates: PV changed from "20260223" to "20260601"
packages/all-poky-linux/ca-certificates: PKGV changed from 20260223 [default] to 20260601 [default]
Changes to packages/all-poky-linux/ca-certificates (sysroot):
  /usr/share/ca-certificates/mozilla/e-Szigno_TLS_Root_CA_2023.crt was added
  /usr/share/ca-certificates/mozilla/OISTE_Server_Root_RSA_G1.crt was added
  /usr/share/ca-certificates/mozilla/AffirmTrust_Commercial.crt was removed
  /usr/share/ca-certificates/mozilla/AffirmTrust_Networking.crt was removed
  /usr/share/ca-certificates/mozilla/AffirmTrust_Premium.crt was removed
  /usr/share/ca-certificates/mozilla/AffirmTrust_Premium_ECC.crt was removed
  /usr/share/ca-certificates/mozilla/Certigna.crt was removed
  /usr/share/ca-certificates/mozilla/certSIGN_ROOT_CA.crt was removed
  /usr/share/ca-certificates/mozilla/COMODO_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/DigiCert_Assured_ID_Root_CA.crt was removed
  /usr/share/ca-certificates/mozilla/DigiCert_Global_Root_CA.crt was removed
  /usr/share/ca-certificates/mozilla/DigiCert_High_Assurance_EV_Root_CA.crt was removed
  /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_EC1.crt was removed
  /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G2.crt was removed
  /usr/share/ca-certificates/mozilla/FIRMAPROFESIONAL_CA_ROOT-A_WEB.crt was removed
  /usr/share/ca-certificates/mozilla/GLOBALTRUST_2020.crt was removed
  /usr/share/ca-certificates/mozilla/GTS_Root_R2.crt was removed
  /usr/share/ca-certificates/mozilla/_OISTE_Server_Root_RSA_G1.crt was removed
  /usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_2.crt was removed
  /usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_3.crt was removed
  /usr/share/ca-certificates/mozilla/Secure_Global_CA.crt was removed
  /usr/share/ca-certificates/mozilla/SecureTrust_CA.crt was removed
  /usr/share/ca-certificates/mozilla/SwissSign_Gold_CA_-_G2.crt was removed
  /usr/share/ca-certificates/mozilla/TeliaSonera_Root_CA_v1.crt was removed
  /usr/share/ca-certificates/mozilla/Trustwave_Global_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/Trustwave_Global_ECC_P256_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/Trustwave_Global_ECC_P384_Certification_Authority.crt was removed

--===============0219252089046145337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/ca-certificates/ca-certificates: FILELIST: removed "/usr/share/ca-certificates/mozilla/AffirmTrust_Networking.crt /usr/share/ca-certificates/mozilla/Trustwave_Global_ECC_P256_Certification_Authority.crt /usr/share/ca-certificates/mozilla/Trustwave_Global_ECC_P384_Certification_Authority.crt /usr/share/ca-certificates/mozilla/TeliaSonera_Root_CA_v1.crt /usr/share/ca-certificates/mozilla/SwissSign_Gold_CA_-_G2.crt /usr/share/ca-certificates/mozilla/Certigna.crt /usr/share/ca-certificates/mozilla/AffirmTrust_Premium.crt /usr/share/ca-certificates/mozilla/AffirmTrust_Commercial.crt /usr/share/ca-certificates/mozilla/FIRMAPROFESIONAL_CA_ROOT-A_WEB.crt /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_EC1.crt /usr/share/ca-certificates/mozilla/AffirmTrust_Premium_ECC.crt /usr/share/ca-certificates/mozilla/DigiCert_Assured_ID_Root_CA.crt /usr/share/ca-certificates/mozilla/certSIGN_ROOT_CA.crt /usr/share/ca-certificates/mozilla/QuoVadis_Root_CA
 _2.crt /usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_3.crt /usr/share/ca-certificates/mozilla/COMODO_Certification_Authority.crt /usr/share/ca-certificates/mozilla/SecureTrust_CA.crt /usr/share/ca-certificates/mozilla/GLOBALTRUST_2020.crt /usr/share/ca-certificates/mozilla/DigiCert_High_Assurance_EV_Root_CA.crt /usr/share/ca-certificates/mozilla/DigiCert_Global_Root_CA.crt /usr/share/ca-certificates/mozilla/_OISTE_Server_Root_RSA_G1.crt /usr/share/ca-certificates/mozilla/Secure_Global_CA.crt /usr/share/ca-certificates/mozilla/GTS_Root_R2.crt /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G2.crt /usr/share/ca-certificates/mozilla/Trustwave_Global_Certification_Authority.crt", added "/usr/share/ca-certificates/mozilla/e-Szigno_TLS_Root_CA_2023.crt /usr/share/ca-certificates/mozilla/OISTE_Server_Root_RSA_G1.crt"
packages/all-poky-linux/ca-certificates/ca-certificates: PKGSIZE changed from 228128 to 192791 (-15%)
Changes to packages/all-poky-linux/ca-certificates (sysroot):
  /usr/share/ca-certificates/mozilla/e-Szigno_TLS_Root_CA_2023.crt was added
  /usr/share/ca-certificates/mozilla/OISTE_Server_Root_RSA_G1.crt was added
  /usr/share/ca-certificates/mozilla/AffirmTrust_Commercial.crt was removed
  /usr/share/ca-certificates/mozilla/AffirmTrust_Networking.crt was removed
  /usr/share/ca-certificates/mozilla/AffirmTrust_Premium.crt was removed
  /usr/share/ca-certificates/mozilla/AffirmTrust_Premium_ECC.crt was removed
  /usr/share/ca-certificates/mozilla/Certigna.crt was removed
  /usr/share/ca-certificates/mozilla/certSIGN_ROOT_CA.crt was removed
  /usr/share/ca-certificates/mozilla/COMODO_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/DigiCert_Assured_ID_Root_CA.crt was removed
  /usr/share/ca-certificates/mozilla/DigiCert_Global_Root_CA.crt was removed
  /usr/share/ca-certificates/mozilla/DigiCert_High_Assurance_EV_Root_CA.crt was removed
  /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_EC1.crt was removed
  /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority_-_G2.crt was removed
  /usr/share/ca-certificates/mozilla/FIRMAPROFESIONAL_CA_ROOT-A_WEB.crt was removed
  /usr/share/ca-certificates/mozilla/GLOBALTRUST_2020.crt was removed
  /usr/share/ca-certificates/mozilla/GTS_Root_R2.crt was removed
  /usr/share/ca-certificates/mozilla/_OISTE_Server_Root_RSA_G1.crt was removed
  /usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_2.crt was removed
  /usr/share/ca-certificates/mozilla/QuoVadis_Root_CA_3.crt was removed
  /usr/share/ca-certificates/mozilla/Secure_Global_CA.crt was removed
  /usr/share/ca-certificates/mozilla/SecureTrust_CA.crt was removed
  /usr/share/ca-certificates/mozilla/SwissSign_Gold_CA_-_G2.crt was removed
  /usr/share/ca-certificates/mozilla/TeliaSonera_Root_CA_v1.crt was removed
  /usr/share/ca-certificates/mozilla/Trustwave_Global_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/Trustwave_Global_ECC_P256_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/Trustwave_Global_ECC_P384_Certification_Authority.crt was removed

--===============0219252089046145337==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ca-certificates-upgrade-20260223-20260601.patch"

RnJvbSBiOTNkZTUyYjRhYzZmODU4M2E1Zjk4ODE5YzUzM2FhN2E3YWQ3OWM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTQ6NTc6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
YS1jZXJ0aWZpY2F0ZXM6IHVwZ3JhZGUgMjAyNjAyMjMgLT4gMjAyNjA2MDEKCi0tLQogLi4uZXJ0
ZGF0YTJwZW0ucHktcHJpbnQtYS13YXJuaW5nLWZvci1lLnBhdGNoIHwgIDYgKystLS0KIC4uLmlj
YXRlcy1kb24tdC11c2UtRGViaWFuaXNtcy1pbi1ydW4tcC5wYXRjaCB8ICAyICstCiAuLi5pY2F0
ZXMtdXNlLXJlbGF0aXZlLXN5bWxpbmtzLWZyb20tRVQucGF0Y2ggfCAgMiArLQogLi4uMDI2MDIy
My5iYiA9PiBjYS1jZXJ0aWZpY2F0ZXNfMjAyNjA2MDEuYmJ9IHwgMjUgKysrKysrKysrKysrKysr
KystLQogNCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy97Y2EtY2VydGlmaWNh
dGVzXzIwMjYwMjIzLmJiID0+IGNhLWNlcnRpZmljYXRlc18yMDI2MDYwMS5iYn0gKDc5JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlm
aWNhdGVzLzAwMDEtUmV2ZXJ0LW1vemlsbGEtY2VydGRhdGEycGVtLnB5LXByaW50LWEtd2Fybmlu
Zy1mb3ItZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1j
ZXJ0aWZpY2F0ZXMvMDAwMS1SZXZlcnQtbW96aWxsYS1jZXJ0ZGF0YTJwZW0ucHktcHJpbnQtYS13
YXJuaW5nLWZvci1lLnBhdGNoCmluZGV4IDEyMjY1MDhjOTguLjViYTVkM2VhYzYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMv
MDAwMS1SZXZlcnQtbW96aWxsYS1jZXJ0ZGF0YTJwZW0ucHktcHJpbnQtYS13YXJuaW5nLWZvci1l
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0
aWZpY2F0ZXMvMDAwMS1SZXZlcnQtbW96aWxsYS1jZXJ0ZGF0YTJwZW0ucHktcHJpbnQtYS13YXJu
aW5nLWZvci1lLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3NDM3NzRjZDUzZWQxYzQ1YmI2
NjBlZGRhY2Y2ZGFkYjVlZTNlMTQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNWY1
MWFhNmQyNmU3MTA3Zjc0NGJiYjZlNzFlZmZhMjEzZmEwNGM4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6
IE1vbiwgMTggT2N0IDIwMjEgMTI6MDU6NDkgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmV2ZXJ0
ICJtb3ppbGxhL2NlcnRkYXRhMnBlbS5weTogcHJpbnQgYSB3YXJuaW5nIGZvciBleHBpcmVkCkBA
IC0xNiwxMCArMTYsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhA
bGludXRyb25peC5kZT4KICAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMyBkZWxl
dGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2RlYmlhbi9jaGFuZ2Vsb2cgYi9kZWJpYW4vY2hhbmdl
bG9nCi1pbmRleCBkYmUzZTljLi40OTZlMDVkIDEwMDY0NAoraW5kZXggOGFlNzgzOS4uMjNiNGIy
MSAxMDA2NDQKIC0tLSBhL2RlYmlhbi9jaGFuZ2Vsb2cKICsrKyBiL2RlYmlhbi9jaGFuZ2Vsb2cK
LUBAIC0xNTYsNyArMTU2LDYgQEAgY2EtY2VydGlmaWNhdGVzICgyMDIxMTAwNCkgdW5zdGFibGU7
IHVyZ2VuY3k9bG93CitAQCAtMjE4LDcgKzIxOCw2IEBAIGNhLWNlcnRpZmljYXRlcyAoMjAyMTEw
MDQpIHVuc3RhYmxlOyB1cmdlbmN5PWxvdwogICAgICAtICJUcnVzdGlzIEZQUyBSb290IENBIgog
ICAgICAtICJTdGFhdCBkZXIgTmVkZXJsYW5kZW4gUm9vdCBDQSAtIEczIgogICAgKiBCbGFja2xp
c3QgZXhwaXJlZCByb290IGNlcnRpZmljYXRlICJEU1QgUm9vdCBDQSBYMyIgKGNsb3NlczogIzk5
NTQzMikKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9j
YS1jZXJ0aWZpY2F0ZXMvMDAwMS11cGRhdGUtY2EtY2VydGlmaWNhdGVzLWRvbi10LXVzZS1EZWJp
YW5pc21zLWluLXJ1bi1wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNh
dGVzL2NhLWNlcnRpZmljYXRlcy8wMDAxLXVwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMtZG9uLXQtdXNl
LURlYmlhbmlzbXMtaW4tcnVuLXAucGF0Y2gKaW5kZXggMWEyOWRhNzU2Zi4uZjAzZDI5ODcwNSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRp
ZmljYXRlcy8wMDAxLXVwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMtZG9uLXQtdXNlLURlYmlhbmlzbXMt
aW4tcnVuLXAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVz
L2NhLWNlcnRpZmljYXRlcy8wMDAxLXVwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMtZG9uLXQtdXNlLURl
YmlhbmlzbXMtaW4tcnVuLXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDYzMDg2ZDQxZjc2
YjFjMzM1N2UyM2M2NTA5ZGY3MmQzZjc1YWYyMGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDRiYWQwMDZlMDNlMjNhOGU2OWM1YTQwOWQ3YzQ2ZDMxMDE1MjkyZWMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgog
RGF0ZTogTW9uLCA2IEp1bCAyMDE1IDE1OjE5OjQxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNh
LWNlcnRpZmljYXRlczogcmVtb3ZlIERlYmlhbmlzbSBpbiBydW4tcGFydHMgaW52b2NhdGlvbgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRp
ZmljYXRlcy8wMDAzLXVwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMtdXNlLXJlbGF0aXZlLXN5bWxpbmtz
LWZyb20tRVQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2Et
Y2VydGlmaWNhdGVzLzAwMDMtdXBkYXRlLWNhLWNlcnRpZmljYXRlcy11c2UtcmVsYXRpdmUtc3lt
bGlua3MtZnJvbS1FVC5wYXRjaAppbmRleCA5Mjk5NDViNTZmLi4zMTBiM2FkOTVjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVz
LzAwMDMtdXBkYXRlLWNhLWNlcnRpZmljYXRlcy11c2UtcmVsYXRpdmUtc3ltbGlua3MtZnJvbS1F
VC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2Vy
dGlmaWNhdGVzLzAwMDMtdXBkYXRlLWNhLWNlcnRpZmljYXRlcy11c2UtcmVsYXRpdmUtc3ltbGlu
a3MtZnJvbS1FVC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTY5OTMzZjk2YTg2NzUzNjlk
ZTcwMmJkYjU1ZTU3ZGMyMWY2NWU3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzYx
YzE3YWU1ZTEwZDU2MGNkMmRlMWQ1NmM1MzQ3NTA5YmJjMTRiMSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206ID0/VVRGLTg/cT9BbmRyPUMzPUE5PTIwRHJhc3ppaz89IDxhbmRyZS5kcmFz
emlrQGpjaS5jb20+CiBEYXRlOiBXZWQsIDI4IE1hciAyMDE4IDE2OjQ1OjA1ICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHVwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXM6IHVzZSByZWxhdGl2ZSBzeW1saW5r
cyBmcm9tCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMv
Y2EtY2VydGlmaWNhdGVzXzIwMjYwMjIzLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2Vy
dGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlc18yMDI2MDYwMS5iYgpzaW1pbGFyaXR5IGluZGV4IDc5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2Vy
dGlmaWNhdGVzXzIwMjYwMjIzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1j
ZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzXzIwMjYwNjAxLmJiCmluZGV4IDQxNjkwZDFkMDgu
LjY0MTk3NWIxMWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmlj
YXRlcy9jYS1jZXJ0aWZpY2F0ZXNfMjAyNjAyMjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlc18yMDI2MDYwMS5iYgpAQCAtMSwzICsx
LDI0IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gZGViaWFuL2NvcHlyaWdodAorIyArKysgZGVi
aWFuL2NvcHlyaWdodAorIyBAQCAtMiw3ICsyLDYgQEAKKyMgIFNvdXJjZTogaHR0cDovL2Z0cC5k
ZWJpYW4ub3JnL2RlYmlhbi9wb29sL21haW4vYy9jYS1jZXJ0aWZpY2F0ZXMvCisjICAKKyMgIEZp
bGVzOiBkZWJpYW4vKgorIyAtICAgICAgIGV4YW1wbGVzLyoKKyMgICAgICAgICBNYWtlZmlsZQor
IyAgICAgICAgIG1vemlsbGEvKgorIyAgICAgICAgIHNiaW4vKgorIyAKKyMKKwogU1VNTUFSWSA9
ICJDb21tb24gQ0EgY2VydGlmaWNhdGVzIgogREVTQ1JJUFRJT04gPSAiVGhpcyBwYWNrYWdlIGlu
Y2x1ZGVzIFBFTSBmaWxlcyBvZiBDQSBjZXJ0aWZpY2F0ZXMgdG8gYWxsb3cgXAogU1NMLWJhc2Vk
IGFwcGxpY2F0aW9ucyB0byBjaGVjayBmb3IgdGhlIGF1dGhlbnRpY2l0eSBvZiBTU0wgY29ubmVj
dGlvbnMuIFwKQEAgLTUsNyArMjYsNyBAQCBUaGlzIGRlcml2ZWQgZnJvbSBEZWJpYW4ncyBDQSBD
ZXJ0aWZpY2F0ZXMuIgogSE9NRVBBR0UgPSAiaHR0cDovL3BhY2thZ2VzLmRlYmlhbi5vcmcvc2lk
L2NhLWNlcnRpZmljYXRlcyIKIFNFQ1RJT04gPSAibWlzYyIKIExJQ0VOU0UgPSAiR1BMLTIuMC1v
ci1sYXRlciAmIE1QTC0yLjAiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29w
eXJpZ2h0O21kNT1hZTViMzZiNTE0ZTNmMTJjZTFhYThlMmVlNjdmM2Q3ZSIKK0xJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL2RlYmlhbi9jb3B5cmlnaHQ7bWQ1PWRhYjdjN2NlYTc3NmQxYTE2NDhk
ZWIwMDUyYzcyNjQ3IgogCiAjIFRoaXMgaXMgbmVlZGVkIHRvIGVuc3VyZSB3ZSBjYW4gcnVuIHRo
ZSBwb3N0aW5zdCBhdCBpbWFnZSBjcmVhdGlvbiB0aW1lCiBERVBFTkRTID0gIiIKQEAgLTE0LDcg
KzM1LDcgQEAgREVQRU5EUzpjbGFzcy1uYXRpdmVzZGsgPSAib3BlbnNzbC1uYXRpdmUiCiAjIE5l
ZWQgcmVoYXNoIGZyb20gb3BlbnNzbCBhbmQgcnVuLXBhcnRzIGZyb20gZGViaWFudXRpbHMKIFBB
Q0tBR0VfV1JJVEVfREVQUyArPSAib3BlbnNzbC1uYXRpdmUgZGViaWFudXRpbHMtbmF0aXZlIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmZhMmIwMGQ0MzYwZjBkMTRlYzUxNjQwYWU4YWVhOWU1
NjM5NTZiOTVlYTc4NmUzYzNjMDFjNGVlYWQ0MmI1NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3
YWI2MzAxZjdmMzRlZWY5MGE0ZDI3ODY0N2MyNjBiYzA3NjJlMGUxNDU2MWY0NjQ5ODU0Y2Y0YjBk
NGJlYTIxIgogU1JDX1VSSSA9ICIke0RFQklBTl9NSVJST1J9L21haW4vYy9jYS1jZXJ0aWZpY2F0
ZXMvJHtCUE59XyR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXVwZGF0ZS1j
YS1jZXJ0aWZpY2F0ZXMtZG9uLXQtdXNlLURlYmlhbmlzbXMtaW4tcnVuLXAucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMy11cGRhdGUtY2EtY2VydGlmaWNhdGVzLXVzZS1yZWxhdGl2ZS1z
eW1saW5rcy1mcm9tLUVULnBhdGNoIFwKLS0gCjIuNDcuMQoK

--===============0219252089046145337==--

