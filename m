Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195B1C98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:34:38 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1369.1790228074050818150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jGEjIAlB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ppT7AI2X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0d1e88b58-0b0235c4-0867-4717-9f07-aa1457a42db4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790228073;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lm2qi9whzvHe5uLE8UyyTONUGtXNR4bmNK9fAkXNuzE=;
	b=jGEjIAlBxnDfxdoDgbBF2+gochOAyjc5Iqs8FIZ9v1ow0NN0YRx2FnRXtqUuTiOI
	TwrC7lRn1H0X6tkhQ4an+P5ARF8FIs+0/1JNQwbagnkYaj1M7VKQ9atOPpZIzo7h7hr
	kgM/UPzD31IBgPE6eRr/DeFNg8HA+RbWSB4Izi6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790228073;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lm2qi9whzvHe5uLE8UyyTONUGtXNR4bmNK9fAkXNuzE=;
	b=ppT7AI2XEEIVslO/iV52TLb2IJ82zj4WNYGZ2M6aWPOEBFZyDkjOGLi8un5Nt5XH
	qQGWt6t9Mu2WjwRUWINDxVEJcI0CJrX/kWMzYktNrYhngTqw8dAXe2d2gvkpJ62mDFi
	2akOCAaaHnhPPr8r9qfjDlSLdUVaJ3NmF1mV9CHQ=
Content-Type: multipart/mixed; boundary="===============5817865879524103727=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.24 SUCCEEDED
Message-ID: <010101a0d1e88b58-0b0235c4-0867-4717-9f07-aa1457a42db4-000000@us-west-2.amazonses.com>
Date: Thu, 24 Sep 2026 05:34:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.24-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 05:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246563

--===============5817865879524103727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnupg* to *2.5.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.5.22-2.5.24.patch
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
From 2539828d043fb5e898ca47dbaabae1bc44df74f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 24 Sep 2026 05:34:26 +0000
Subject: [PATCH] gnupg: upgrade 2.5.22 -> 2.5.24

Release 2.5.24.
scd: Fix a regression due to the new Nitrokey support.
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
 .../gnupg/{gnupg_2.5.22.bb => gnupg_2.5.24.bb}              | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.22.bb => gnupg_2.5.24.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 52db780959..4d6e364a65 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 8b7d344ed35bc4bcfa0d531a0885fc1bea01ffda Mon Sep 17 00:00:00 2001
+From abe388c8f38df7cd2f0641f17c6f872dd847c330 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 04dd45e676..95f62ff26d 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From f86e7337698debfe5152f4f4bc840bf56f868fab Mon Sep 17 00:00:00 2001
+From f8d096e62c06085e93a339bc2d7421a65c437e6f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 9e2a42d..b48b88d 100644
+index 51ffbc6..39924db 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1909,7 +1909,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1910,7 +1910,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 7553bd9f3f..6b2cfc2503 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From 3c1d201eace11d557eb6c589842e93b8bacbe8f9 Mon Sep 17 00:00:00 2001
+From 7d42cbba53eddce53d1763d7ffe70e728d7b0445 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 234afd16fe..0bffeb0a69 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From f49d102adf393f57e6ca7b6ec6969f60115055ef Mon Sep 17 00:00:00 2001
+From 4c4068e6f8a180737d1b28c6914387bc0a485df3 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.22.bb b/meta/recipes-support/gnupg/gnupg_2.5.24.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.22.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.24.bb
index 803fb2765a..3e562250d7 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.24.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72b7a024e6d9d87e"
+SRC_URI[sha256sum] = "bf149d01a2b9fcc0e4589b8ae8697d3d5c557ea48ed95a3fa55dd3b1187e6039"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.47.1


--===============5817865879524103727==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.5.22-2.5.24.patch"

RnJvbSAyNTM5ODI4ZDA0M2ZiNWU4OThjYTQ3ZGJhYWJhZTFiYzQ0ZGY3NGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjQgU2VwIDIwMjYgMDU6MzQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnVwZzogdXBncmFkZSAyLjUuMjIgLT4gMi41LjI0CgpSZWxlYXNlIDIuNS4yNC4Kc2NkOiBGaXgg
YSByZWdyZXNzaW9uIGR1ZSB0byB0aGUgbmV3IE5pdHJva2V5IHN1cHBvcnQuClJlbGVhc2UgMi41
LjIzLgpjb21tb246IEZpeCBjb21wb3NpdGUgRE8gcGFyc2luZy4KZGlybW5ncjogQWRkIGFub3Ro
ZXIgdmFsaWRhdGlvbiBpbiBnZXRfZG5zX2NlcnRfc3RhbmRhcmQuCmRpcm1uZ3I6IEFkZCBhIG1p
dGlnYXRpb24gZm9yIGJhZGx5IGNvbmZpZ3VyZWQgd2ViIGtleSBkaXJlY3Rvcmllcy4KZ3BnOiBN
aW5vciBjb2RlIGZpeCBmb3IgY29ycmVjdG5lc3MuCmdwZzogQXZvaWQgd3JvbmcgY29tcGlsZXIg
d2FybmluZy4KZ3BnY29uZjogUHJpbnQgbW9yZSBpbmZvIGZyb20gVkVSU0lPTiBpZiBmb3VuZC4K
c2NkOnAxNTogRml4IHVzZSBvZiBsb2dfaW5mby4KZ3Bnc206IEZpeCB0eXBvIGZvciBkZWJ1ZyBv
dXRwdXQuCkFsbG93IGdldHRpbWUuYyB0byBiZSBidWlsZCB3aXRoIC1XZm9ybWF0LW5vbmxpdGVy
YWwuCmdwZzogSW1wbGljdGx5IHNldCBhbGxvdy05OTgwIGluIGRlLXZzIGNvbXBsaWFuY2UgbW9k
ZS4KZ3BnOiBBbHdheXMgYWxsb3cgcGFyc2luZyBvZiByZmMtOTk4MCBwYWNrZXRzLgpncGdjb25m
OiBQcmludCB0aGUgY29udGVudCBvZiBhIHZlcnNpb25pbmZvLnR4dCBmaWxlIGluIHZlcmJvc2Ug
bW9kZS4KdGVzdHM6IEFkZCBhIHRlc3QgZm9yIHRoZSBuZXcgQnJhaW5wb29sIGFuZCBOSVNUIDk5
ODAgZW5jcnlwdGlvbi4KZ3BnOiBOZXcgZGVidWcgb3B0aW9uIHRvIGdldCB0aGUgc2VjcmV0IGtl
eSBhcyBzLWV4cHJlc3Npb24uCmdwZzogQWRkIEJyYWlucG9vbCBhbmQgTklTVCBhcyBzcGVjaWZp
ZWQgYnkgYW4gUkZDLTk5ODAgdXBkYXRlLgpncGc6IEltcHJvdmUgZGVidWcgZGlhZ25vc3RpY3Mg
Zm9yIGludmFsaWQgcGFja2V0cy4KZ3BnOiBOZXcgLS1lZGl0LWtleSBjb21tYW5kICJhZGRwdWJr
ZXkiCmdwZ2NvbmYsdzMyOiBTaG93IG1vcmUgcmVnaXN0cnkga2V5IG9mIEdwZ09MLgpzY2Q6IEFk
ZCBOaXRyb2tleSAzIHRvIHBjc2Mtc2hhcmVkIGludGVyZmVyZW5jZSBkZXRlY3Rpb24uCmRpcm1u
Z3I6IE1ha2UgdGhlIExEQVAgdXBsb2FkIGZsYWdzIGFsc28gd29yayBmb3IgS1NfU0VBUkNILgpn
cGc6IEltcHJvdmUgcmZjOTk4MCBLeWJlciBpbXBvcnQuCmdwZzogQWxsb3cgZGVjcnlwdGlvbiBv
ZiB2NCBrZXlzIHVzaW5nIG1sazc2OC4KZ3BnOiBNYWtlIHNpZ24gYW5kIGVuY3J5cHQgdXNlIHRo
ZSBTRUlQRHYyLgpncGc6IE1ha2UgdXNlIG9mIHRoZSBuZXcgY3VydmUgbmFtZSAiaWV0ZjI1IiBp
biA5OTgwIG1vZGUuCmdwZzogTWFrZSBHQ00gZGVjcnlwdGlvbiB3b3JrIGluIGZpcHMgbW9kZS4K
Z3BnOiBGaXJzdCB0YWtlIG9uIGFkZGluZyBhIGNvbXBsaWFuY2UgbW9kZSAiZmlwcyIuCmdwZzog
Rml4IHNlaXBkdjIgZW5jcnlwdGlvbiB1c2luZyBBRVMxMjguCmdwZzogQWRkIGltcG9ydCBvcHRp
b24gZGVidWctYWNjZXB0LW5vLXVpZCBmb3IgcmVncmVzc2lvbiB0ZXN0cy4KZ3BnOiBJbXBsZW1l
bnQgZ2VuZXJhdGlvbiBvZiBpZXRmMjUgdjYga2V5cy4KZ3BnLGdwZ3NtLGFnZW50OiBOZXcgb3B0
aW9uIC0tZGVidWctbm8tbGliZ2NyeXB0LgpncGc6IEltcGxlbWVudCBnZW5lcmF0aW9uIG9mIGll
dGYyNyB2NiBrZXlzLgpncGc6IFByaW50IGEgbm90ZSBmb3Igc2FsdGVkIHNpZ25hdHVyZXMuCmNv
bW1vbjogVXBkYXRlIGNvbXBsaWFuY2UgZm9yIG5ldyBhbGdvcy4KZ3BnOiBDb25zaWRlciBwcmVm
ZXJlbmNlcyBmcm9tIGRpcmVjdCBrZXkgc2lnbmF0dXJlcy4KZ3BnOiBJbiByZmMtOTk4MCBtb2Rl
IHVzZSB0aGUgYWxnbyBmcm9tIHRoZSBTRUlQRHYyIHBhY2tldC4KZ3BnOiBJbXBsZW1lbnQgZW5j
cnlwdGlvbiBhY2NvcmRpbmcgdG8gcmZjLTk5ODAuCmdwZzogSGFuZGxlIFJGQy05NTgwIG9uZS1w
YXNzIHNpZ25hdHVyZXMuCmdwZzogSW1wbGVtZW50IHRoZSBkZWNyeXB0aW9uIG9mIHRoZSB2NiB0
ZXN0IG1lc3NhZ2UgZnJvbSByZmMtOTk4MC4KZ3BnOiBSZW5hbWUgdGhlIFBLVF9FTkNSWVBURURf
QUVBRCBjb25zdGFudC4KZ3BnOiBJbXBsZW1lbnQgdGhlIGRlY3J5cHRpb24gb2YgdGhlIHY0IHRl
c3QgbWVzc2FnZSBmcm9tIHJmYy05OTgwLgpjb21tb246IEFkZCBuZXcga2V5IGNvbWJpbmVyIGZy
b20gUkZDLTk5ODAuCmdwZzogQ2xlYW51cCB0aGUgdXNlIG9mIHJlYWRfb2N0ZXRfc3RyaW5nIGlu
IHRoZSBwYXJzZXIuCmdwZzogR2V0IHRoZSBrZXlncmlwIHJpZ2h0IGluIGdwZyBmb3IgdGhlIG5l
dyBNTEtFTSBhbGdvcy4KZ3BnOiBQcmVsaW1pbmFyeSBzdXBwb3J0IGZvciBpbXBvcnRpbmcgc29t
ZSByZmMtOTk4MCBzZWNyZXQga2V5cy4KZ3BnOiBBZGQgcHJlbGltaW5hcnkgc3VwcG9ydCBmb3Ig
UkZDLTk5ODAgZW5jcnlwdGlvbiBrZXlzLgotLS0KIC4uLi8wMDAxLVdvdmVycmlkZS1pbml0LWlz
LW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaCAgICAgIHwgMiArLQogLi4ubmZpZ3VyZS5hYy11
c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggfCA2ICsrKy0tLQog
Li4uL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNo
ICAgfCAyICstCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRj
aCAgICAgICAgICAgICB8IDIgKy0KIC4uLi9nbnVwZy97Z251cGdfMi41LjIyLmJiID0+IGdudXBn
XzIuNS4yNC5iYn0gICAgICAgICAgICAgIHwgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcve2dudXBnXzIuNS4yMi5iYiA9PiBnbnVwZ18yLjUuMjQuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1p
cy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVw
Zy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRj
aAppbmRleCA1MmRiNzgwOTU5Li40ZDZlMzY0YTY1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0
aC1nY2MtOS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAx
LVdvdmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOGI3ZDM0NGVkMzViYzRiY2ZhMGQ1MzFhMDg4NWZjMWJlYTAxZmZkYSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWJlMzg4YzhmMzhkZjdjZDJmMDY0MWYxN2M2Zjg3
MmRkODQ3YzMzMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIwIERlYyAyMDE4IDE3OjM3OjQ4IC0wODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIFdvdmVycmlkZS1pbml0IGlzIG5vdCBuZWVkZWQgd2l0aCBnY2MgOQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25maWd1
cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3Vz
dG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoCmluZGV4IDA0ZGQ0NWU2NzYuLjk1
ZjYyZmYyNmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAw
MDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3Vy
ZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGY4NmU3MzM3Njk4ZGViZmU1MTUyZjRmNGJjODQwYmY1NmY4NjhmYWIg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY4ZDA5NmU2MmMwNjA4NWU5M2EzMzliYzJk
NzQyMWE2NWM0MzdlNmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjIgSmFuIDIwMTgg
MTg6MDA6MjEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlLmFjOiB1c2UgYSBjdXN0
b20gdmFsdWUgZm9yIHRoZSBsb2NhdGlvbiBvZgpAQCAtMTMsMTAgKzEzLDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
Y29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCA5ZTJhNDJkLi5iNDhiODhkIDEwMDY0
NAoraW5kZXggNTFmZmJjNi4uMzk5MjRkYiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysr
IGIvY29uZmlndXJlLmFjCi1AQCAtMTkwOSw3ICsxOTA5LDcgQEAgQUNfREVGSU5FX1VOUVVPVEVE
KEdQR0NPTkZfRElTUF9OQU1FLCAiR1BHQ29uZiIsCitAQCAtMTkxMCw3ICsxOTEwLDcgQEAgQUNf
REVGSU5FX1VOUVVPVEVEKEdQR0NPTkZfRElTUF9OQU1FLCAiR1BHQ29uZiIsCiAgCiAgQUNfREVG
SU5FX1VOUVVPVEVEKEdQR1RBUl9OQU1FLCAiZ3BndGFyIiwgW1RoZSBuYW1lIG9mIHRoZSBncGd0
YXIgdG9vbF0pCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVw
Zy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9m
LW5wdGgtY29uZmlnLnBhdGNoCmluZGV4IDc1NTNiZDlmM2YuLjZiMmNmYzI1MDMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1p
bnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzYzFkMjAxZWFjZTExZDU1N2ViNmM1ODk4NDJlOTNiOGJh
Y2JlOGY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3ZDQyY2JiYTUzZWRkY2U1M2Qx
NzYzZDdmZmU3MGU3MjhkN2IwNDQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU2F1
bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tPgogRGF0ZTogV2VkLCAxNiBBdWcgMjAxNyAxMTox
NjozMCArMDgwMAogU3ViamVjdDogW1BBVENIXSB1c2UgcGtnY29uZmlnIGluc3RlYWQgb2YgbnB0
aCBjb25maWcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3Jl
bG9jYXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUu
cGF0Y2gKaW5kZXggMjM0YWZkMTZmZS4uMGJmZmViMGE2OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGY0OWQxMDJhZGYzOTNmNTdlNmNhN2I2ZWM2OTY5ZjYwMTE1MDU1ZWYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDRjNDA2OGU2ZjhhMTgwNzM3ZDFiMjhjNjkxNDM4N2JjMGE0ODVkZjMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25A
aW50ZWwuY29tPgogRGF0ZTogV2VkLCAxOSBTZXAgMjAxOCAxNDo0NDo0MCArMDEwMAogU3ViamVj
dDogW1BBVENIXSBBbGxvdyB0aGUgZW52aXJvbm1lbnQgdG8gb3ZlcnJpZGUgd2hlcmUgZ251cGcg
bG9va3MgZm9yIGl0cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251
cGdfMi41LjIyLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjI0LmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXBnL2dudXBnXzIuNS4yMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcv
Z251cGdfMi41LjI0LmJiCmluZGV4IDgwM2ZiMjc2NWEuLjNlNTYyMjUwZDcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4yMi5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMjQuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JD
X1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vMDAwMS1jb25maWd1cmUuYWMtdXNl
LWEtY3VzdG9tLXZhbHVlLWZvci0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmls
ZTovL3JlbG9jYXRlLnBhdGNoIgogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBm
aWxlOi8vcmVsb2NhdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NmUyN2IwMjBh
ZDI2NTEwMzg4ZTA2ZjVmMDdmM2Y3MGE0ZWQ4OTE2ZWU5OTVmMWI3MmI3YTAyNGU2ZDlkODdlIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImJmMTQ5ZDAxYTJiOWZjYzBlNDU4OWI4YWU4Njk3ZDNkNWM1
NTdlYTQ4ZWQ5NWEzZmE1NWRkM2IxMTg3ZTYwMzkiCiAKIEVYVFJBX09FQ09ORiA9ICItLWRpc2Fi
bGUtbGRhcCBcCiAJCS0tZGlzYWJsZS1jY2lkLWRyaXZlciBcCi0tIAoyLjQ3LjEKCg==

--===============5817865879524103727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gnupg-changelog.txt"

Release 2.5.24.
scd: Fix a regression due to the new Nitrokey support.
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

--===============5817865879524103727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 22366160 to 22589552 (+1%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-dbg: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-dev: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-doc: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1752072 to 1793192 (+2%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-gpg: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 249118 to 249329 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 226925 to 227099 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 224509 to 224683 (+0%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ka: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ka: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nl: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-nl: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: FILELIST: directory renamed /usr/src/debug/gnupg/2.5.22/scd -> /usr/src/debug/gnupg/2.5.24/scd, directory renamed /usr/src/debug/gnupg/2.5.22/common -> /usr/src/debug/gnupg/2.5.24/common, directory renamed /usr/src/debug/gnupg/2.5.22/kbx -> /usr/src/debug/gnupg/2.5.24/kbx, directory renamed /usr/src/debug/gnupg/2.5.22/dirmngr -> /usr/src/debug/gnupg/2.5.24/dirmngr, directory renamed /usr/src/debug/gnupg/2.5.22/regexp -> /usr/src/debug/gnupg/2.5.24/regexp, directory renamed /usr/src/debug/gnupg/2.5.22/sm -> /usr/src/debug/gnupg/2.5.24/sm, directory renamed /usr/src/debug/gnupg/2.5.22/tools -> /usr/src/debug/gnupg/2.5.24/tools, directory renamed /usr/src/debug/gnupg/2.5.22/g10 -> /usr/src/debug/gnupg/2.5.24/g10, directory renamed /usr/src/debug/gnupg/2.5.22/agent -> /usr/src/debug/gnupg/2.5.24/agent
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 9200644 to 9296473 (+1%)
packages/x86-64-v3-poky-linux/gnupg/gnupg-src: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg/gnupg: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg/gnupg: PKGSIZE changed from 4774993 to 4815985 (+1%)
packages/x86-64-v3-poky-linux/gnupg/gnupg: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg: PKGV changed from 2.5.22 [default] to 2.5.24 [default]
packages/x86-64-v3-poky-linux/gnupg: PV changed from "2.5.22" to "2.5.24"
packages/x86-64-v3-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.22.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.24.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"

--===============5817865879524103727==--

