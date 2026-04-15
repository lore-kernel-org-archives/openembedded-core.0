Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6179F428DB
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19826.1776261883261738456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aJWzflWn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=s1RX6nEL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d91756cce-1f290cab-1822-41b5-9ca0-f336fa69fc70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Je3sX25NuAC0g27dzqlQlyS2ioJoER6O+43OUBX6apw=;
	b=aJWzflWnufQtHSNUnZVv0aup+HMyrnu1jWicF+m3GSBHd/mkbTp0ngnlBIEksw6d
	Z87cB2UgrvsfIFC2M10Bnzh2OrXy1MHxjH0+cRfaWRn7oNHvVqLr7AIFuwD0diuKVdv
	1Uh8/IkXs1qc2jJZ26hrxieqRKkrS/g8fwZb38mA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Je3sX25NuAC0g27dzqlQlyS2ioJoER6O+43OUBX6apw=;
	b=s1RX6nELMditUJtZLhDtC53Dx8MEEJBsgAINsAuDO8fA5w6RqcMAvLyCX6rhS+Dq
	uH0hARSi80U1IH6NLicA7/wuWGoXjyRjGquSTvy9IqQps6i3jb0DA8HS9UiAPUSD5yN
	UVi/yuMVsCk7iJsUJuUgME7yy7ov+i1ZVBKMxwxU=
Content-Type: multipart/mixed; boundary="===============6109423443831101810=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sbom-cve-check: upgrading to 1.2.1 SUCCEEDED
Message-ID: <0101019d91756cce-1f290cab-1822-41b5-9ca0-f336fa69fc70-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235258

--===============6109423443831101810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sbom-cve-check* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sbom-cve-check-upgrade-1.2.0-1.2.1.patch
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
From 5ed4ef03252f29b71f47336cd499e4f04379d495 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:32:50 +0000
Subject: [PATCH] python3-sbom-cve-check: upgrade 1.2.0 -> 1.2.1

---
 ...xport_yocto-use-correct-type-for-the-version-attrib.patch | 5 +----
 ...om-cve-check_1.2.0.bb => python3-sbom-cve-check_1.2.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.2.0.bb => python3-sbom-cve-check_1.2.1.bb} (84%)

diff --git a/meta/recipes-devtools/sbom-cve-check/files/0001-export_yocto-use-correct-type-for-the-version-attrib.patch b/meta/recipes-devtools/sbom-cve-check/files/0001-export_yocto-use-correct-type-for-the-version-attrib.patch
index 392f0b99ea..c6423ab233 100644
--- a/meta/recipes-devtools/sbom-cve-check/files/0001-export_yocto-use-correct-type-for-the-version-attrib.patch
+++ b/meta/recipes-devtools/sbom-cve-check/files/0001-export_yocto-use-correct-type-for-the-version-attrib.patch
@@ -1,4 +1,4 @@
-From 1a5ae49c520d3569ed12f0c6373b4223d428f92b Mon Sep 17 00:00:00 2001
+From 1a1f0c740464b2a423f8bea68176d93d58db77e5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 9 Apr 2026 11:55:19 +0100
 Subject: [PATCH] export_yocto: use correct type for the version attribute
@@ -26,6 +26,3 @@ index c8261f4..78d72c0 100644
          with self._open_output_as_text() as f:
              json.dump(json_obj, f, indent=2)
  
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.1.bb
similarity index 84%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.1.bb
index 2a09d8ea4c..6717874998 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "0b01474c541fb4b9d29d36f86fae6d0f27ff2b991fcb59b2fbeb70c1eaa09664"
+SRC_URI[sha256sum] = "d7dfca05cf0cee6b439802fe10689790b9395d436d0d9af6170e23603c2ea5cb"
 
 SRC_URI += "file://0001-export_yocto-use-correct-type-for-the-version-attrib.patch"
 
-- 
2.47.1


--===============6109423443831101810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info

--===============6109423443831101810==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sbom-cve-check-upgrade-1.2.0-1.2.1.patch"

RnJvbSA1ZWQ0ZWYwMzI1MmYyOWI3MWY0NzMzNmNkNDk5ZTRmMDQzNzlkNDk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6MzI6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNib20tY3ZlLWNoZWNrOiB1cGdyYWRlIDEuMi4wIC0+IDEuMi4xCgotLS0KIC4uLnhw
b3J0X3lvY3RvLXVzZS1jb3JyZWN0LXR5cGUtZm9yLXRoZS12ZXJzaW9uLWF0dHJpYi5wYXRjaCB8
IDUgKy0tLS0KIC4uLm9tLWN2ZS1jaGVja18xLjIuMC5iYiA9PiBweXRob24zLXNib20tY3ZlLWNo
ZWNrXzEuMi4xLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVj
ay97cHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjIuMC5iYiA9PiBweXRob24zLXNib20tY3ZlLWNo
ZWNrXzEuMi4xLmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
Ym9tLWN2ZS1jaGVjay9maWxlcy8wMDAxLWV4cG9ydF95b2N0by11c2UtY29ycmVjdC10eXBlLWZv
ci10aGUtdmVyc2lvbi1hdHRyaWIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1j
dmUtY2hlY2svZmlsZXMvMDAwMS1leHBvcnRfeW9jdG8tdXNlLWNvcnJlY3QtdHlwZS1mb3ItdGhl
LXZlcnNpb24tYXR0cmliLnBhdGNoCmluZGV4IDM5MmYwYjk5ZWEuLmM2NDIzYWIyMzMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9maWxlcy8wMDAxLWV4
cG9ydF95b2N0by11c2UtY29ycmVjdC10eXBlLWZvci10aGUtdmVyc2lvbi1hdHRyaWIucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL2ZpbGVzLzAwMDEtZXhw
b3J0X3lvY3RvLXVzZS1jb3JyZWN0LXR5cGUtZm9yLXRoZS12ZXJzaW9uLWF0dHJpYi5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gMWE1YWU0OWM1MjBkMzU2OWVkMTJmMGM2MzczYjQyMjNkNDI4
ZjkyYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWExZjBjNzQwNDY0YjJhNDIzZjhi
ZWE2ODE3NmQ5M2Q1OGRiNzdlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogVGh1LCA5IEFwciAyMDI2IDExOjU1
OjE5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV4cG9ydF95b2N0bzogdXNlIGNvcnJlY3QgdHlw
ZSBmb3IgdGhlIHZlcnNpb24gYXR0cmlidXRlCkBAIC0yNiw2ICsyNiwzIEBAIGluZGV4IGM4MjYx
ZjQuLjc4ZDcyYzAgMTAwNjQ0CiAgICAgICAgICB3aXRoIHNlbGYuX29wZW5fb3V0cHV0X2FzX3Rl
eHQoKSBhcyBmOgogICAgICAgICAgICAgIGpzb24uZHVtcChqc29uX29iaiwgZiwgaW5kZW50PTIp
CiAgCi0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2Jv
bS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjIuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9weXRob24zLXNib20tY3ZlLWNoZWNrXzEuMi4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9z
Ym9tLWN2ZS1jaGVjay9weXRob24zLXNib20tY3ZlLWNoZWNrXzEuMi4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVj
a18xLjIuMS5iYgppbmRleCAyYTA5ZDhlYTRjLi42NzE3ODc0OTk4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18x
LjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9u
My1zYm9tLWN2ZS1jaGVja18xLjIuMS5iYgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJHUEwt
Mi4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01NzBhOWIz
NzQ5ZGQwNDYzYTE3Nzg4MDNiMTJhNmRjZSIKIAogUFlQSV9QQUNLQUdFID0gInNib21fY3ZlX2No
ZWNrIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBiMDE0NzRjNTQxZmI0YjlkMjlkMzZmODZmYWU2
ZDBmMjdmZjJiOTkxZmNiNTliMmZiZWI3MGMxZWFhMDk2NjQiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZDdkZmNhMDVjZjBjZWU2YjQzOTgwMmZlMTA2ODk3OTBiOTM5NWQ0MzZkMGQ5YWY2MTcwZTIz
NjAzYzJlYTVjYiIKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtZXhwb3J0X3lvY3RvLXVzZS1j
b3JyZWN0LXR5cGUtZm9yLXRoZS12ZXJzaW9uLWF0dHJpYi5wYXRjaCIKIAotLSAKMi40Ny4xCgo=

--===============6109423443831101810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.2.0.tar.gz;downloadfilename=sbom_cve_check-1.2.0.tar.gz file://0001-export_yocto-use-correct-type-for-the-version-attrib.patch" to "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.2.1.tar.gz;downloadfilename=sbom_cve_check-1.2.1.tar.gz file://0001-export_yocto-use-correct-type-for-the-version-attrib.patch"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGSIZE changed from 1044027 to 1049543 (+1%)
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PV changed from "1.2.0" to "1.2.1"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.0.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.2.1.dist-info

--===============6109423443831101810==--

