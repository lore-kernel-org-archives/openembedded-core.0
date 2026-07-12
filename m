Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62CAC43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 06:31:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9633.1783837890566120880
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 23:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=q62vMmKt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sbSNMOq+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f550613ce-d48e07f5-358f-4c77-92f7-69b88a4e0489-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783837889;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q0SLwlKVPWZbptnksap4Z/3ixTRnsbxF3PtsXCy0Lzs=;
	b=q62vMmKtzgpH7N24JlHwwU9Eur6ABawqcDLnGuZ14ruuTWyFGxGMwH/jN6OD8lJi
	KhKuDTZI6OTCF3h92lmhwNXGEARkG2NmctZZvnlvcO0RQJskc66Sv0KXEnYEvJ9IEix
	TIINJzWARar0j+/PcvDIYUqnaGpMDS2lJtXTvLJY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783837889;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q0SLwlKVPWZbptnksap4Z/3ixTRnsbxF3PtsXCy0Lzs=;
	b=sbSNMOq+z4nGjYy+K8zy30Fx/ZaJzQsprt7wa0YK6tPnJ/PiyHwh4Ul15aYNM8R1
	DfhqpESN++Mo1+ZBQoqTLpz549AVr8hU80VdTGjqiIdXcm5Ah/+yPeDuqGPEmXNYClS
	a2YNqveMVdOXl26ftG0uWmyWCvJ3pfkHIOgeNZyI=
Content-Type: multipart/mixed; boundary="===============0606132180386557632=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
	Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native:
 upgrading to 2026.07.12-000007,2026-07-12 SUCCEEDED
Message-ID: <0101019f550613ce-d48e07f5-358f-4c77-92f7-69b88a4e0489-000000@us-west-2.amazonses.com>
Date: Sun, 12 Jul 2026 06:31:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.12-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 06:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240752

--===============0606132180386557632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native* to *2026.07.12-000007,2026-07-12* has Succeeded.

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
From fa1dd6a7e787b3a2136e0a047a3e45903052131a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 12 Jul 2026 05:20:32 +0000
Subject: [PATCH] 
 sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native:
 upgrade 2026.06.24-000003 -> 2026.07.12-000007,2026-06-24 -> 2026-07-12

---
 ...24.bb => sbom-cve-check-update-cvelist-native_2026-07-12.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.07.12-000007.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-06-24.bb => sbom-cve-check-update-cvelist-native_2026-07-12.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.06.24-000003.bb => sbom-cve-check-update-nvd-native_2026.07.12-000007.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-12.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-12.bb
index ca192bc9cf..7efaf6e490 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-12.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "966bddf787997b471325e065cae82702a60c64ff"
+SRCREV = "69911b32ff8b0e45ff9c5e6a4f55ee5ab458339a"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.12-000007.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.12-000007.bb
index 73d9e77692..54f3b18445 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.12-000007.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "11e62eba27133a54836b7a081d05ff96f72d879b"
+SRCREV = "b17f7478aaeea80d61e5933e077802908fa51fea"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc
-- 
2.47.1


--===============0606132180386557632==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sbom-cve-check-update-nvd-native-sbom-cve-check-upda.patch"

RnJvbSBmYTFkZDZhN2U3ODdiM2EyMTM2ZTBhMDQ3YTNlNDU5MDMwNTIxMzFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTIgSnVsIDIwMjYgMDU6MjA6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSAK
IHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1udmQtbmF0aXZlLHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1j
dmVsaXN0LW5hdGl2ZToKIHVwZ3JhZGUgMjAyNi4wNi4yNC0wMDAwMDMgLT4gMjAyNi4wNy4xMi0w
MDAwMDcsMjAyNi0wNi0yNCAtPiAyMDI2LTA3LTEyCgotLS0KIC4uLjI0LmJiID0+IHNib20tY3Zl
LWNoZWNrLXVwZGF0ZS1jdmVsaXN0LW5hdGl2ZV8yMDI2LTA3LTEyLmJifSB8IDIgKy0KIC4uLmJi
ID0+IHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1udmQtbmF0aXZlXzIwMjYuMDcuMTItMDAwMDA3LmJi
fSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay97c2JvbS1jdmUt
Y2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYtMDYtMjQuYmIgPT4gc2JvbS1jdmUtY2hl
Y2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYtMDctMTIuYmJ9ICg4OSUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3tzYm9tLWN2ZS1jaGVjay11cGRhdGUt
bnZkLW5hdGl2ZV8yMDI2LjA2LjI0LTAwMDAwMy5iYiA9PiBzYm9tLWN2ZS1jaGVjay11cGRhdGUt
bnZkLW5hdGl2ZV8yMDI2LjA3LjEyLTAwMDAwNy5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2
ZWxpc3QtbmF0aXZlXzIwMjYtMDYtMjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1j
dmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYtMDctMTIu
YmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1jdmVsaXN0LW5hdGl2ZV8yMDI2
LTA2LTI0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2sv
c2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYtMDctMTIuYmIKaW5kZXgg
Y2ExOTJiYzljZi4uN2VmYWY2ZTQ5MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1jdmVsaXN0LW5hdGl2ZV8yMDI2
LTA2LTI0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9zYm9t
LWN2ZS1jaGVjay11cGRhdGUtY3ZlbGlzdC1uYXRpdmVfMjAyNi0wNy0xMi5iYgpAQCAtNiw3ICs2
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL0NWRVByb2plY3QvY3ZlbGlzdFY1
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0NWRVByb2plY3QvY3ZlbGlzdFY1LmdpdDti
cmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcztkZXN0c3VmZml4PSIKIFNCT01fQ1ZFX0NIRUNLX0RC
X05BTUUgPSAiY3ZlbGlzdCIKIAotU1JDUkVWID0gIjk2NmJkZGY3ODc5OTdiNDcxMzI1ZTA2NWNh
ZTgyNzAyYTYwYzY0ZmYiCitTUkNSRVYgPSAiNjk5MTFiMzJmZjhiMGU0NWZmOWM1ZTZhNGY1NWVl
NWFiNDU4MzM5YSIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPi4rKV9i
YXNlbGluZSIKIAogcmVxdWlyZSBzYm9tLWN2ZS1jaGVjay11cGRhdGUtZGIuaW5jCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2st
dXBkYXRlLW52ZC1uYXRpdmVfMjAyNi4wNi4yNC0wMDAwMDMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52ZC1uYXRpdmVfMjAy
Ni4wNy4xMi0wMDAwMDcuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1udmQt
bmF0aXZlXzIwMjYuMDYuMjQtMDAwMDAzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52ZC1uYXRpdmVfMjAyNi4w
Ny4xMi0wMDAwMDcuYmIKaW5kZXggNzNkOWU3NzY5Mi4uNTRmM2IxODQ0NSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0
ZS1udmQtbmF0aXZlXzIwMjYuMDYuMjQtMDAwMDAzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zYm9tLWN2ZS1jaGVjay9zYm9tLWN2ZS1jaGVjay11cGRhdGUtbnZkLW5hdGl2ZV8yMDI2
LjA3LjEyLTAwMDAwNy5iYgpAQCAtNiw3ICs2LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL2ZraWUtY2FkL252ZC1qc29uLWRhdGEtZmVlZHMiCiBTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vZmtpZS1jYWQvbnZkLWpzb24tZGF0YS1mZWVkcy5naXQ7YnJhbmNoPW1haW47cHJv
dG9jb2w9aHR0cHM7ZGVzdHN1ZmZpeD0iCiBTQk9NX0NWRV9DSEVDS19EQl9OQU1FID0gIm52ZC1m
a2llIgogCi1TUkNSRVYgPSAiMTFlNjJlYmEyNzEzM2E1NDgzNmI3YTA4MWQwNWZmOTZmNzJkODc5
YiIKK1NSQ1JFViA9ICJiMTdmNzQ3OGFhZWVhODBkNjFlNTkzM2UwNzc4MDI5MDhmYTUxZmVhIgog
VVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPi4rKSIKIAogcmVxdWlyZSBz
Ym9tLWN2ZS1jaGVjay11cGRhdGUtZGIuaW5jCi0tIAoyLjQ3LjEKCg==

--===============0606132180386557632==--

