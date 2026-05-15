Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BF0CD5BAB
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34810.1778851219949335673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oio5kTAC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fFXSwtto;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e2bcb9c5a-a2a352e0-0bdd-4644-85f2-4cd86109fdcf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rcC44cV0uqkeulfN4oMcxd/RrrRFKVFDtnmPJjFau5s=;
	b=oio5kTACpm9F6BkjUCfzGVN2SoTgZ5ChQHxKh7xapxgDYZVCk4MHlHffbdLl9RA4
	FUkcO7Dhf7E3FkzX78pWpjKV4e2pMkTtpjNQWjH6nC1JEk1CsOLDA9lScTUdfOdrsn1
	X3UrcgMbMMQnJNEbGxBfgktO4uP76kPOkJVluLO0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rcC44cV0uqkeulfN4oMcxd/RrrRFKVFDtnmPJjFau5s=;
	b=fFXSwttoKW6iDRTKJcMpSN0doVVQlNGa7YO3jU50077qf9r60KpC2PEpoA7FqiMF
	6KX+9RdfpWhknBkRpsoSzTJ/ITyQiZTfkFxKFNdSLcbzi3pAyby2GfqArLJyk+VS1vl
	TNJuKPmj6Wi1bsA7MAi3QSBPb+RxvG9gMEjk4noU=
Content-Type: multipart/mixed; boundary="===============5227212685235303384=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
	Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native:
 upgrading to 2026.05.15-000006,2026-05-15 SUCCEEDED
Message-ID: <0101019e2bcb9c5a-a2a352e0-0bdd-4644-85f2-4cd86109fdcf-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237088

--===============5227212685235303384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native* to *2026.05.15-000006,2026-05-15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sbom-cve-check-update-nvd-native-sbom-cve-check-upda.patch
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
From 9aeffc6c6cd3c68b8932b7af39630ae0d4b908af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 06:04:34 +0000
Subject: [PATCH] 
 sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native:
 upgrade 2026.05.07-000006 -> 2026.05.15-000006,2026-05-07 -> 2026-05-15

---
 ...07.bb => sbom-cve-check-update-cvelist-native_2026-05-15.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.05.15-000006.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-05-07.bb => sbom-cve-check-update-cvelist-native_2026-05-15.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.05.07-000006.bb => sbom-cve-check-update-nvd-native_2026.05.15-000006.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-15.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-15.bb
index 7670172c40..cb8796885d 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-15.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
+SRCREV = "2c1b94ea7a2f12455dad38a480c1efad3739dfec"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.15-000006.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.15-000006.bb
index 02446e30ce..40981f4fef 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.15-000006.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
+SRCREV = "663cf47c8e5cb56657142d2a1f12b051fa1f109e"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc
-- 
2.47.1


--===============5227212685235303384==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sbom-cve-check-update-nvd-native-sbom-cve-check-upda.patch"

RnJvbSA5YWVmZmM2YzZjZDNjNjhiODkzMmI3YWYzOTYzMGFlMGQ0YjkwOGFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDY6MDQ6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSAK
IHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1udmQtbmF0aXZlLHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1j
dmVsaXN0LW5hdGl2ZToKIHVwZ3JhZGUgMjAyNi4wNS4wNy0wMDAwMDYgLT4gMjAyNi4wNS4xNS0w
MDAwMDYsMjAyNi0wNS0wNyAtPiAyMDI2LTA1LTE1CgotLS0KIC4uLjA3LmJiID0+IHNib20tY3Zl
LWNoZWNrLXVwZGF0ZS1jdmVsaXN0LW5hdGl2ZV8yMDI2LTA1LTE1LmJifSB8IDIgKy0KIC4uLmJi
ID0+IHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1udmQtbmF0aXZlXzIwMjYuMDUuMTUtMDAwMDA2LmJi
fSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay97c2JvbS1jdmUt
Y2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYtMDUtMDcuYmIgPT4gc2JvbS1jdmUtY2hl
Y2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYtMDUtMTUuYmJ9ICg4OSUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3tzYm9tLWN2ZS1jaGVjay11cGRhdGUt
bnZkLW5hdGl2ZV8yMDI2LjA1LjA3LTAwMDAwNi5iYiA9PiBzYm9tLWN2ZS1jaGVjay11cGRhdGUt
bnZkLW5hdGl2ZV8yMDI2LjA1LjE1LTAwMDAwNi5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2
ZWxpc3QtbmF0aXZlXzIwMjYtMDUtMDcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1j
dmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYtMDUtMTUu
YmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1jdmVsaXN0LW5hdGl2ZV8yMDI2
LTA1LTA3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2sv
c2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYtMDUtMTUuYmIKaW5kZXgg
NzY3MDE3MmM0MC4uY2I4Nzk2ODg1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1jdmVsaXN0LW5hdGl2ZV8yMDI2
LTA1LTA3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9zYm9t
LWN2ZS1jaGVjay11cGRhdGUtY3ZlbGlzdC1uYXRpdmVfMjAyNi0wNS0xNS5iYgpAQCAtNiw3ICs2
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL0NWRVByb2plY3QvY3ZlbGlzdFY1
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0NWRVByb2plY3QvY3ZlbGlzdFY1LmdpdDti
cmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcztkZXN0c3VmZml4PSIKIFNCT01fQ1ZFX0NIRUNLX0RC
X05BTUUgPSAiY3ZlbGlzdCIKIAotU1JDUkVWID0gImRkMGU5M2M3NTAzNGQwMTY3NDk4MTc0Yzg4
NmE1NjcyOWVkYzQ0ZGUiCitTUkNSRVYgPSAiMmMxYjk0ZWE3YTJmMTI0NTVkYWQzOGE0ODBjMWVm
YWQzNzM5ZGZlYyIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPi4rKV9i
YXNlbGluZSIKIAogcmVxdWlyZSBzYm9tLWN2ZS1jaGVjay11cGRhdGUtZGIuaW5jCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2st
dXBkYXRlLW52ZC1uYXRpdmVfMjAyNi4wNS4wNy0wMDAwMDYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52ZC1uYXRpdmVfMjAy
Ni4wNS4xNS0wMDAwMDYuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1udmQt
bmF0aXZlXzIwMjYuMDUuMDctMDAwMDA2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52ZC1uYXRpdmVfMjAyNi4w
NS4xNS0wMDAwMDYuYmIKaW5kZXggMDI0NDZlMzBjZS4uNDA5ODFmNGZlZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0
ZS1udmQtbmF0aXZlXzIwMjYuMDUuMDctMDAwMDA2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zYm9tLWN2ZS1jaGVjay9zYm9tLWN2ZS1jaGVjay11cGRhdGUtbnZkLW5hdGl2ZV8yMDI2
LjA1LjE1LTAwMDAwNi5iYgpAQCAtNiw3ICs2LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL2ZraWUtY2FkL252ZC1qc29uLWRhdGEtZmVlZHMiCiBTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vZmtpZS1jYWQvbnZkLWpzb24tZGF0YS1mZWVkcy5naXQ7YnJhbmNoPW1haW47cHJv
dG9jb2w9aHR0cHM7ZGVzdHN1ZmZpeD0iCiBTQk9NX0NWRV9DSEVDS19EQl9OQU1FID0gIm52ZC1m
a2llIgogCi1TUkNSRVYgPSAiNzJkODg0MWM4YWQ5MDgzZWJmNjcyMzA2M2YyNzU0NDRlYTBkNzZm
OSIKK1NSQ1JFViA9ICI2NjNjZjQ3YzhlNWNiNTY2NTcxNDJkMmExZjEyYjA1MWZhMWYxMDllIgog
VVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPi4rKSIKIAogcmVxdWlyZSBz
Ym9tLWN2ZS1jaGVjay11cGRhdGUtZGIuaW5jCi0tIAoyLjQ3LjEKCg==

--===============5227212685235303384==--

