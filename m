Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F53EC9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1229.1790144870597126145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dnSsZ8Gp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2yfGeRRv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0ccf2f51d-a991af0d-11b7-4571-8f8e-940abcd0d011-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OvuoUbWBaFo/ZAk+6d1q3xnqqIG/8OceEFIN1RWhc7k=;
	b=dnSsZ8Gp5VqjpoflGpI+Wb2zpBhOM+SCMAqnqx3xVEJoRRwYfW4fwwTeKdNFL5rS
	BC8AD+6uwkEiGomDuTsCHmea1n6oMBiTY2UOzfpWQs/555zJ3SLz1wdvsoCuNabJQxF
	g13K+lkl32z6bp74xSBv9qZhRH1VkHFbH3y9Uo6Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OvuoUbWBaFo/ZAk+6d1q3xnqqIG/8OceEFIN1RWhc7k=;
	b=2yfGeRRvqyvGf7ZFXP8cq+INxdnroa9i94/gAgRC1wOnej1/NZMDJ184R+PCBP5N
	dWX3yH8W3665dznDjn8btZ+LVQjS5mva4Q09Xl+yzbA5c224QEpUvITvfJeIkLH/IrG
	R4IXXnf/jYi3HNRAhccNDMtSAkg91JjQtsswGwPw=
Content-Type: multipart/mixed; boundary="===============8516192295375690393=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.23 SUCCEEDED
Message-ID: <010101a0ccf2f51d-a991af0d-11b7-4571-8f8e-940abcd0d011-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246448

--===============8516192295375690393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnupg* to *2.5.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.5.22-2.5.23.patch
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
From 2180c23d238fa260c9b693f992be8ff07c63b633 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 23 Sep 2026 06:24:08 +0000
Subject: [PATCH] gnupg: upgrade 2.5.22 -> 2.5.23

Release 2.5.23.
common: Fix composite DO parsing.
dirmngr: Add another validation in get_dns_cert_standard.
dirmngr: Add a mitigation for badly configured web key directories.
gpg: Minor code fix for correctness.
gpg: Avoid wrong compiler warning.
gpgconf: Print more info from VERSION if found.
scd:p15: Fix use of log_info.
gpgsm: Fix typo for debug output.
Allow gettime.c to be build with -Wformat-nonliteral.
gpg: Implictly set allow-9980 in de-vs compliance mode.
gpg: Always allow parsing of rfc-9980 packets.
gpgconf: Print the content of a versioninfo.txt file in verbose mode.
tests: Add a test for the new Brainpool and NIST 9980 encryption.
gpg: New debug option to get the secret key as s-expression.
gpg: Add Brainpool and NIST as specified by an RFC-9980 update.
gpg: Improve debug diagnostics for invalid packets.
gpg: New --edit-key command "addpubkey"
gpgconf,w32: Show more registry key of GpgOL.
scd: Add Nitrokey 3 to pcsc-shared interference detection.
dirmngr: Make the LDAP upload flags also work for KS_SEARCH.
gpg: Improve rfc9980 Kyber import.
gpg: Allow decryption of v4 keys using mlk768.
gpg: Make sign and encrypt use the SEIPDv2.
gpg: Make use of the new curve name "ietf25" in 9980 mode.
gpg: Make GCM decryption work in fips mode.
gpg: First take on adding a compliance mode "fips".
gpg: Fix seipdv2 encryption using AES128.
gpg: Add import option debug-accept-no-uid for regression tests.
gpg: Implement generation of ietf25 v6 keys.
gpg,gpgsm,agent: New option --debug-no-libgcrypt.
gpg: Implement generation of ietf27 v6 keys.
gpg: Print a note for salted signatures.
common: Update compliance for new algos.
gpg: Consider preferences from direct key signatures.
gpg: In rfc-9980 mode use the algo from the SEIPDv2 packet.
gpg: Implement encryption according to rfc-9980.
gpg: Handle RFC-9580 one-pass signatures.
gpg: Implement the decryption of the v6 test message from rfc-9980.
gpg: Rename the PKT_ENCRYPTED_AEAD constant.
gpg: Implement the decryption of the v4 test message from rfc-9980.
common: Add new key combiner from RFC-9980.
gpg: Cleanup the use of read_octet_string in the parser.
gpg: Get the keygrip right in gpg for the new MLKEM algos.
gpg: Preliminary support for importing some rfc-9980 secret keys.
gpg: Add preliminary support for RFC-9980 encryption keys.
---
 .../0001-Woverride-init-is-not-needed-with-gcc-9.patch      | 2 +-
 ...nfigure.ac-use-a-custom-value-for-the-location-of-.patch | 6 +++---
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch   | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch             | 2 +-
 .../gnupg/{gnupg_2.5.22.bb => gnupg_2.5.23.bb}              | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.22.bb => gnupg_2.5.23.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 52db780959..707bba9faf 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 8b7d344ed35bc4bcfa0d531a0885fc1bea01ffda Mon Sep 17 00:00:00 2001
+From 1c8f78f659e094aa924e1a84326a086701e803c9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 04dd45e676..94120195a7 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From f86e7337698debfe5152f4f4bc840bf56f868fab Mon Sep 17 00:00:00 2001
+From ff6e519a6034d331a82d8018772db940191a3887 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 9e2a42d..b48b88d 100644
+index 59e2bce..4eff4a8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1909,7 +1909,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1910,7 +1910,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 7553bd9f3f..c30677e80d 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From 3c1d201eace11d557eb6c589842e93b8bacbe8f9 Mon Sep 17 00:00:00 2001
+From a0a9afc96bcf352324109496a3c5419133002afe Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 234afd16fe..2775967303 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From f49d102adf393f57e6ca7b6ec6969f60115055ef Mon Sep 17 00:00:00 2001
+From 4d15672a7dadaa0d21ef9339a065af20a49b5348 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.22.bb b/meta/recipes-support/gnupg/gnupg_2.5.23.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.22.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.23.bb
index 803fb2765a..139e1c9ef2 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.23.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72b7a024e6d9d87e"
+SRC_URI[sha256sum] = "97ebba329ed0aa1ed24395b6a485a3626680f4c19232c62a0c0f0433c726e2bd"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.47.1


--===============8516192295375690393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 22366160 to 22589320 (+1%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-dev: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-doc: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1752072 to 1793192 (+2%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 226925 to 227099 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 224509 to 224683 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ka: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ka: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nl: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nl: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: FILELIST: directory renamed /usr/src/debug/gnupg/2.5.22/sm -> /usr/src/debug/gnupg/2.5.23/sm, directory renamed /usr/src/debug/gnupg/2.5.22/agent -> /usr/src/debug/gnupg/2.5.23/agent, directory renamed /usr/src/debug/gnupg/2.5.22/tools -> /usr/src/debug/gnupg/2.5.23/tools, directory renamed /usr/src/debug/gnupg/2.5.22/dirmngr -> /usr/src/debug/gnupg/2.5.23/dirmngr, directory renamed /usr/src/debug/gnupg/2.5.22/g10 -> /usr/src/debug/gnupg/2.5.23/g10, directory renamed /usr/src/debug/gnupg/2.5.22/regexp -> /usr/src/debug/gnupg/2.5.23/regexp, directory renamed /usr/src/debug/gnupg/2.5.22/kbx -> /usr/src/debug/gnupg/2.5.23/kbx, directory renamed /usr/src/debug/gnupg/2.5.22/scd -> /usr/src/debug/gnupg/2.5.23/scd, directory renamed /usr/src/debug/gnupg/2.5.22/common -> /usr/src/debug/gnupg/2.5.23/common
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 9200644 to 9296317 (+1%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg/gnupg: PKGV changed from 2.5.22 [default] to 2.5.23 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg: PKGSIZE changed from 4774993 to 4815985 (+1%)
packages/x86-64-v3-poky-linux/gnupg: PV changed from "2.5.22" to "2.5.23"
packages/x86-64-v3-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.22.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.23.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"
packages/x86-64-v3-poky-linux/gnupg: PKGV changed from 2.5.22 [default] to 2.5.23 [default]

--===============8516192295375690393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gnupg-changelog.txt"

Release 2.5.23.
common: Fix composite DO parsing.
dirmngr: Add another validation in get_dns_cert_standard.
dirmngr: Add a mitigation for badly configured web key directories.
gpg: Minor code fix for correctness.
gpg: Avoid wrong compiler warning.
gpgconf: Print more info from VERSION if found.
scd:p15: Fix use of log_info.
gpgsm: Fix typo for debug output.
Allow gettime.c to be build with -Wformat-nonliteral.
gpg: Implictly set allow-9980 in de-vs compliance mode.
gpg: Always allow parsing of rfc-9980 packets.
gpgconf: Print the content of a versioninfo.txt file in verbose mode.
tests: Add a test for the new Brainpool and NIST 9980 encryption.
gpg: New debug option to get the secret key as s-expression.
gpg: Add Brainpool and NIST as specified by an RFC-9980 update.
gpg: Improve debug diagnostics for invalid packets.
gpg: New --edit-key command "addpubkey"
gpgconf,w32: Show more registry key of GpgOL.
scd: Add Nitrokey 3 to pcsc-shared interference detection.
dirmngr: Make the LDAP upload flags also work for KS_SEARCH.
gpg: Improve rfc9980 Kyber import.
gpg: Allow decryption of v4 keys using mlk768.
gpg: Make sign and encrypt use the SEIPDv2.
gpg: Make use of the new curve name "ietf25" in 9980 mode.
gpg: Make GCM decryption work in fips mode.
gpg: First take on adding a compliance mode "fips".
gpg: Fix seipdv2 encryption using AES128.
gpg: Add import option debug-accept-no-uid for regression tests.
gpg: Implement generation of ietf25 v6 keys.
gpg,gpgsm,agent: New option --debug-no-libgcrypt.
gpg: Implement generation of ietf27 v6 keys.
gpg: Print a note for salted signatures.
common: Update compliance for new algos.
gpg: Consider preferences from direct key signatures.
gpg: In rfc-9980 mode use the algo from the SEIPDv2 packet.
gpg: Implement encryption according to rfc-9980.
gpg: Handle RFC-9580 one-pass signatures.
gpg: Implement the decryption of the v6 test message from rfc-9980.
gpg: Rename the PKT_ENCRYPTED_AEAD constant.
gpg: Implement the decryption of the v4 test message from rfc-9980.
common: Add new key combiner from RFC-9980.
gpg: Cleanup the use of read_octet_string in the parser.
gpg: Get the keygrip right in gpg for the new MLKEM algos.
gpg: Preliminary support for importing some rfc-9980 secret keys.
gpg: Add preliminary support for RFC-9980 encryption keys.

--===============8516192295375690393==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.5.22-2.5.23.patch"

RnJvbSAyMTgwYzIzZDIzOGZhMjYwYzliNjkzZjk5MmJlOGZmMDdjNjNiNjMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjMgU2VwIDIwMjYgMDY6MjQ6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnVwZzogdXBncmFkZSAyLjUuMjIgLT4gMi41LjIzCgpSZWxlYXNlIDIuNS4yMy4KY29tbW9uOiBG
aXggY29tcG9zaXRlIERPIHBhcnNpbmcuCmRpcm1uZ3I6IEFkZCBhbm90aGVyIHZhbGlkYXRpb24g
aW4gZ2V0X2Ruc19jZXJ0X3N0YW5kYXJkLgpkaXJtbmdyOiBBZGQgYSBtaXRpZ2F0aW9uIGZvciBi
YWRseSBjb25maWd1cmVkIHdlYiBrZXkgZGlyZWN0b3JpZXMuCmdwZzogTWlub3IgY29kZSBmaXgg
Zm9yIGNvcnJlY3RuZXNzLgpncGc6IEF2b2lkIHdyb25nIGNvbXBpbGVyIHdhcm5pbmcuCmdwZ2Nv
bmY6IFByaW50IG1vcmUgaW5mbyBmcm9tIFZFUlNJT04gaWYgZm91bmQuCnNjZDpwMTU6IEZpeCB1
c2Ugb2YgbG9nX2luZm8uCmdwZ3NtOiBGaXggdHlwbyBmb3IgZGVidWcgb3V0cHV0LgpBbGxvdyBn
ZXR0aW1lLmMgdG8gYmUgYnVpbGQgd2l0aCAtV2Zvcm1hdC1ub25saXRlcmFsLgpncGc6IEltcGxp
Y3RseSBzZXQgYWxsb3ctOTk4MCBpbiBkZS12cyBjb21wbGlhbmNlIG1vZGUuCmdwZzogQWx3YXlz
IGFsbG93IHBhcnNpbmcgb2YgcmZjLTk5ODAgcGFja2V0cy4KZ3BnY29uZjogUHJpbnQgdGhlIGNv
bnRlbnQgb2YgYSB2ZXJzaW9uaW5mby50eHQgZmlsZSBpbiB2ZXJib3NlIG1vZGUuCnRlc3RzOiBB
ZGQgYSB0ZXN0IGZvciB0aGUgbmV3IEJyYWlucG9vbCBhbmQgTklTVCA5OTgwIGVuY3J5cHRpb24u
CmdwZzogTmV3IGRlYnVnIG9wdGlvbiB0byBnZXQgdGhlIHNlY3JldCBrZXkgYXMgcy1leHByZXNz
aW9uLgpncGc6IEFkZCBCcmFpbnBvb2wgYW5kIE5JU1QgYXMgc3BlY2lmaWVkIGJ5IGFuIFJGQy05
OTgwIHVwZGF0ZS4KZ3BnOiBJbXByb3ZlIGRlYnVnIGRpYWdub3N0aWNzIGZvciBpbnZhbGlkIHBh
Y2tldHMuCmdwZzogTmV3IC0tZWRpdC1rZXkgY29tbWFuZCAiYWRkcHVia2V5IgpncGdjb25mLHcz
MjogU2hvdyBtb3JlIHJlZ2lzdHJ5IGtleSBvZiBHcGdPTC4Kc2NkOiBBZGQgTml0cm9rZXkgMyB0
byBwY3NjLXNoYXJlZCBpbnRlcmZlcmVuY2UgZGV0ZWN0aW9uLgpkaXJtbmdyOiBNYWtlIHRoZSBM
REFQIHVwbG9hZCBmbGFncyBhbHNvIHdvcmsgZm9yIEtTX1NFQVJDSC4KZ3BnOiBJbXByb3ZlIHJm
Yzk5ODAgS3liZXIgaW1wb3J0LgpncGc6IEFsbG93IGRlY3J5cHRpb24gb2YgdjQga2V5cyB1c2lu
ZyBtbGs3NjguCmdwZzogTWFrZSBzaWduIGFuZCBlbmNyeXB0IHVzZSB0aGUgU0VJUER2Mi4KZ3Bn
OiBNYWtlIHVzZSBvZiB0aGUgbmV3IGN1cnZlIG5hbWUgImlldGYyNSIgaW4gOTk4MCBtb2RlLgpn
cGc6IE1ha2UgR0NNIGRlY3J5cHRpb24gd29yayBpbiBmaXBzIG1vZGUuCmdwZzogRmlyc3QgdGFr
ZSBvbiBhZGRpbmcgYSBjb21wbGlhbmNlIG1vZGUgImZpcHMiLgpncGc6IEZpeCBzZWlwZHYyIGVu
Y3J5cHRpb24gdXNpbmcgQUVTMTI4LgpncGc6IEFkZCBpbXBvcnQgb3B0aW9uIGRlYnVnLWFjY2Vw
dC1uby11aWQgZm9yIHJlZ3Jlc3Npb24gdGVzdHMuCmdwZzogSW1wbGVtZW50IGdlbmVyYXRpb24g
b2YgaWV0ZjI1IHY2IGtleXMuCmdwZyxncGdzbSxhZ2VudDogTmV3IG9wdGlvbiAtLWRlYnVnLW5v
LWxpYmdjcnlwdC4KZ3BnOiBJbXBsZW1lbnQgZ2VuZXJhdGlvbiBvZiBpZXRmMjcgdjYga2V5cy4K
Z3BnOiBQcmludCBhIG5vdGUgZm9yIHNhbHRlZCBzaWduYXR1cmVzLgpjb21tb246IFVwZGF0ZSBj
b21wbGlhbmNlIGZvciBuZXcgYWxnb3MuCmdwZzogQ29uc2lkZXIgcHJlZmVyZW5jZXMgZnJvbSBk
aXJlY3Qga2V5IHNpZ25hdHVyZXMuCmdwZzogSW4gcmZjLTk5ODAgbW9kZSB1c2UgdGhlIGFsZ28g
ZnJvbSB0aGUgU0VJUER2MiBwYWNrZXQuCmdwZzogSW1wbGVtZW50IGVuY3J5cHRpb24gYWNjb3Jk
aW5nIHRvIHJmYy05OTgwLgpncGc6IEhhbmRsZSBSRkMtOTU4MCBvbmUtcGFzcyBzaWduYXR1cmVz
LgpncGc6IEltcGxlbWVudCB0aGUgZGVjcnlwdGlvbiBvZiB0aGUgdjYgdGVzdCBtZXNzYWdlIGZy
b20gcmZjLTk5ODAuCmdwZzogUmVuYW1lIHRoZSBQS1RfRU5DUllQVEVEX0FFQUQgY29uc3RhbnQu
CmdwZzogSW1wbGVtZW50IHRoZSBkZWNyeXB0aW9uIG9mIHRoZSB2NCB0ZXN0IG1lc3NhZ2UgZnJv
bSByZmMtOTk4MC4KY29tbW9uOiBBZGQgbmV3IGtleSBjb21iaW5lciBmcm9tIFJGQy05OTgwLgpn
cGc6IENsZWFudXAgdGhlIHVzZSBvZiByZWFkX29jdGV0X3N0cmluZyBpbiB0aGUgcGFyc2VyLgpn
cGc6IEdldCB0aGUga2V5Z3JpcCByaWdodCBpbiBncGcgZm9yIHRoZSBuZXcgTUxLRU0gYWxnb3Mu
CmdwZzogUHJlbGltaW5hcnkgc3VwcG9ydCBmb3IgaW1wb3J0aW5nIHNvbWUgcmZjLTk5ODAgc2Vj
cmV0IGtleXMuCmdwZzogQWRkIHByZWxpbWluYXJ5IHN1cHBvcnQgZm9yIFJGQy05OTgwIGVuY3J5
cHRpb24ga2V5cy4KLS0tCiAuLi4vMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdp
dGgtZ2NjLTkucGF0Y2ggICAgICB8IDIgKy0KIC4uLm5maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZh
bHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoIHwgNiArKystLS0KIC4uLi9nbnVwZy8wMDAy
LXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaCAgIHwgMiArLQogbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2ggICAgICAgICAgICAg
fCAyICstCiAuLi4vZ251cGcve2dudXBnXzIuNS4yMi5iYiA9PiBnbnVwZ18yLjUuMjMuYmJ9ICAg
ICAgICAgICAgICB8IDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL3tnbnVwZ18yLjUu
MjIuYmIgPT4gZ251cGdfMi41LjIzLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13
aXRoLWdjYy05LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1X
b3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKaW5kZXggNTJkYjc4
MDk1OS4uNzA3YmJhOWZhZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcv
Z251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5p
dC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhi
N2QzNDRlZDM1YmM0YmNmYTBkNTMxYTA4ODVmYzFiZWEwMWZmZGEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDFjOGY3OGY2NTllMDk0YWE5MjRlMWE4NDMyNmEwODY3MDFlODAzYzkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogVGh1LCAyMCBEZWMgMjAxOCAxNzozNzo0OCAtMDgwMAogU3ViamVjdDogW1BBVENI
XSBXb3ZlcnJpZGUtaW5pdCBpcyBub3QgbmVlZGVkIHdpdGggZ2NjIDkKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1
c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3It
dGhlLWxvY2F0aW9uLW9mLS5wYXRjaAppbmRleCAwNGRkNDVlNjc2Li45NDEyMDE5NWE3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5h
Yy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3Vz
dG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBmODZlNzMzNzY5OGRlYmZlNTE1MmY0ZjRiYzg0MGJmNTZmODY4ZmFiIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBmZjZlNTE5YTYwMzRkMzMxYTgyZDgwMTg3NzJkYjk0MDE5MWEzODg3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDIyIEphbiAyMDE4IDE4OjAwOjIxICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogdXNlIGEgY3VzdG9tIHZhbHVlIGZvciB0
aGUgbG9jYXRpb24gb2YKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBi
L2NvbmZpZ3VyZS5hYwotaW5kZXggOWUyYTQyZC4uYjQ4Yjg4ZCAxMDA2NDQKK2luZGV4IDU5ZTJi
Y2UuLjRlZmY0YTggMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5h
YwotQEAgLTE5MDksNyArMTkwOSw3IEBAIEFDX0RFRklORV9VTlFVT1RFRChHUEdDT05GX0RJU1Bf
TkFNRSwgIkdQR0NvbmYiLAorQEAgLTE5MTAsNyArMTkxMCw3IEBAIEFDX0RFRklORV9VTlFVT1RF
RChHUEdDT05GX0RJU1BfTkFNRSwgIkdQR0NvbmYiLAogIAogIEFDX0RFRklORV9VTlFVT1RFRChH
UEdUQVJfTkFNRSwgImdwZ3RhciIsIFtUaGUgbmFtZSBvZiB0aGUgZ3BndGFyIHRvb2xdKQogIApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtn
Y29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnVwZy9nbnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5w
YXRjaAppbmRleCA3NTUzYmQ5ZjNmLi5jMzA2NzdlODBkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRo
LWNvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAy
LXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gM2MxZDIwMWVhY2UxMWQ1NTdlYjZjNTg5ODQyZTkzYjhiYWNiZThmOSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTBhOWFmYzk2YmNmMzUyMzI0MTA5NDk2YTNjNTQxOTEz
MzAwMmFmZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFNhdWwgV29sZCA8c2d3QGxp
bnV4LmludGVsLmNvbT4KIERhdGU6IFdlZCwgMTYgQXVnIDIwMTcgMTE6MTY6MzAgKzA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gdXNlIHBrZ2NvbmZpZyBpbnN0ZWFkIG9mIG5wdGggY29uZmlnCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCmluZGV4IDIz
NGFmZDE2ZmUuLjI3NzU5NjczMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBn
L2dudXBnL3JlbG9jYXRlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmNDlkMTAyYWRmMzkz
ZjU3ZTZjYTdiNmVjNjk2OWY2MDExNTA1NWVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA0ZDE1NjcyYTdkYWRhYTBkMjFlZjkzMzlhMDY1YWYyMGE0OWI1MzQ4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERh
dGU6IFdlZCwgMTkgU2VwIDIwMTggMTQ6NDQ6NDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWxs
b3cgdGhlIGVudmlyb25tZW50IHRvIG92ZXJyaWRlIHdoZXJlIGdudXBnIGxvb2tzIGZvciBpdHMK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4yMi5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4yMy5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUu
MjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4yMy5i
YgppbmRleCA4MDNmYjI3NjVhLi4xMzllMWM5ZWYyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z251cGcvZ251cGdfMi41LjIzLmJiCkBAIC0yNSw3ICsyNSw3IEBAIFNSQ19VUkk6YXBwZW5kOmNs
YXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1
ZS1mb3ItCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9yZWxvY2F0ZS5w
YXRjaCIKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgZmlsZTovL3JlbG9jYXRl
LnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTZlMjdiMDIwYWQyNjUxMDM4OGUwNmY1
ZjA3ZjNmNzBhNGVkODkxNmVlOTk1ZjFiNzJiN2EwMjRlNmQ5ZDg3ZSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI5N2ViYmEzMjllZDBhYTFlZDI0Mzk1YjZhNDg1YTM2MjY2ODBmNGMxOTIzMmM2MmEw
YzBmMDQzM2M3MjZlMmJkIgogCiBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWxkYXAgXAogCQkt
LWRpc2FibGUtY2NpZC1kcml2ZXIgXAotLSAKMi40Ny4xCgo=

--===============8516192295375690393==--

