Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CC4CD8C88
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:44 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1555.1780328130323382964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hhG9q1+F;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FK1v+r4J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d362e8-2c63af76-29df-4656-92d2-99f2f125b2b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=egV/uAmXvPZh3kRoz8VDX8jicGGZD4S2rCNPnSwgn7c=;
	b=hhG9q1+FC9o6zT+JrG1KlDeaD/TLFHeZtgtqGwpPnXFG9Q6763X6a0xxueBq8h3I
	yRg638FRf2Cx+BQSP4DwmZts+rArxBF1uGB4OxMj72kim5vMkEH7P/kboIV+AMr+YgQ
	45TPEtxw2VQpIKy/uiefl5w6ZUy1s4Ogvl6zRJqc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=egV/uAmXvPZh3kRoz8VDX8jicGGZD4S2rCNPnSwgn7c=;
	b=FK1v+r4J6V4dNzNKeHir3EjuJPfYyyQjtG58eYVWVh9b6ab9k+HooksF40zwZGrM
	uB1BJZ8lzGLnSLakHYQ5J7KwtWiZZTSDgDyu4jPQ1h1jPtXh5NznhccJfQVYzvwj/HY
	bGknZp4hZ6ns+o6jCw3PyQK6oYAJ6PjtUezYJ9HE=
Content-Type: multipart/mixed; boundary="===============3790366009042512228=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
	Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 sbom-cve-check-update-cvelist-native,sbom-cve-check-update-nvd-native:
 upgrading to 2026-06-01,2026.06.01-000006 SUCCEEDED
Message-ID: <0101019e83d362e8-2c63af76-29df-4656-92d2-99f2f125b2b2-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237848

--===============3790366009042512228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sbom-cve-check-update-cvelist-native,sbom-cve-check-update-nvd-native* to *2026-06-01,2026.06.01-000006* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sbom-cve-check-update-cvelist-native-sbom-cve-check-.patch
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
From 7d4d760837cd74c07e87b5b15e51299e314bcc46 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 06:19:07 +0000
Subject: [PATCH] 
 sbom-cve-check-update-cvelist-native,sbom-cve-check-update-nvd-native:
 upgrade 2026-05-07 -> 2026-06-01,2026.05.07-000006 -> 2026.06.01-000006

---
 ...07.bb => sbom-cve-check-update-cvelist-native_2026-06-01.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.06.01-000006.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-05-07.bb => sbom-cve-check-update-cvelist-native_2026-06-01.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.05.07-000006.bb => sbom-cve-check-update-nvd-native_2026.06.01-000006.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-01.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-01.bb
index 7670172c40..257585d444 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-01.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
+SRCREV = "00891ca3cf68cc6e81cac1272ffa6fb7423a5361"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.01-000006.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.01-000006.bb
index 02446e30ce..05c08887a3 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.01-000006.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
+SRCREV = "bc103d3a7763c1242677c937b7736efabcbc55e0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc
-- 
2.47.1


--===============3790366009042512228==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sbom-cve-check-update-cvelist-native-sbom-cve-check-.patch"

RnJvbSA3ZDRkNzYwODM3Y2Q3NGMwN2U4N2I1YjE1ZTUxMjk5ZTMxNGJjYzQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNjoxOTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
c2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlLHNib20tY3ZlLWNoZWNrLXVwZGF0
ZS1udmQtbmF0aXZlOgogdXBncmFkZSAyMDI2LTA1LTA3IC0+IDIwMjYtMDYtMDEsMjAyNi4wNS4w
Ny0wMDAwMDYgLT4gMjAyNi4wNi4wMS0wMDAwMDYKCi0tLQogLi4uMDcuYmIgPT4gc2JvbS1jdmUt
Y2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYtMDYtMDEuYmJ9IHwgMiArLQogLi4uYmIg
PT4gc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52ZC1uYXRpdmVfMjAyNi4wNi4wMS0wMDAwMDYuYmJ9
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3tzYm9tLWN2ZS1j
aGVjay11cGRhdGUtY3ZlbGlzdC1uYXRpdmVfMjAyNi0wNS0wNy5iYiA9PiBzYm9tLWN2ZS1jaGVj
ay11cGRhdGUtY3ZlbGlzdC1uYXRpdmVfMjAyNi0wNi0wMS5iYn0gKDg5JSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2sve3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1u
dmQtbmF0aXZlXzIwMjYuMDUuMDctMDAwMDA2LmJiID0+IHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1u
dmQtbmF0aXZlXzIwMjYuMDYuMDEtMDAwMDA2LmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9zYm9tLWN2ZS1jaGVjay11cGRhdGUtY3Zl
bGlzdC1uYXRpdmVfMjAyNi0wNS0wNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2
ZS1jaGVjay9zYm9tLWN2ZS1jaGVjay11cGRhdGUtY3ZlbGlzdC1uYXRpdmVfMjAyNi0wNi0wMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
c2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYt
MDUtMDcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9z
Ym9tLWN2ZS1jaGVjay11cGRhdGUtY3ZlbGlzdC1uYXRpdmVfMjAyNi0wNi0wMS5iYgppbmRleCA3
NjcwMTcyYzQwLi4yNTc1ODVkNDQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
c2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlXzIwMjYt
MDUtMDcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3Nib20t
Y3ZlLWNoZWNrLXVwZGF0ZS1jdmVsaXN0LW5hdGl2ZV8yMDI2LTA2LTAxLmJiCkBAIC02LDcgKzYs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vQ1ZFUHJvamVjdC9jdmVsaXN0VjUi
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vQ1ZFUHJvamVjdC9jdmVsaXN0VjUuZ2l0O2Jy
YW5jaD1tYWluO3Byb3RvY29sPWh0dHBzO2Rlc3RzdWZmaXg9IgogU0JPTV9DVkVfQ0hFQ0tfREJf
TkFNRSA9ICJjdmVsaXN0IgogCi1TUkNSRVYgPSAiZGQwZTkzYzc1MDM0ZDAxNjc0OTgxNzRjODg2
YTU2NzI5ZWRjNDRkZSIKK1NSQ1JFViA9ICIwMDg5MWNhM2NmNjhjYzZlODFjYWMxMjcyZmZhNmZi
NzQyM2E1MzYxIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+LispX2Jh
c2VsaW5lIgogCiByZXF1aXJlIHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1kYi5pbmMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9zYm9tLWN2ZS1jaGVjay11
cGRhdGUtbnZkLW5hdGl2ZV8yMDI2LjA1LjA3LTAwMDAwNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zYm9tLWN2ZS1jaGVjay9zYm9tLWN2ZS1jaGVjay11cGRhdGUtbnZkLW5hdGl2ZV8yMDI2
LjA2LjAxLTAwMDAwNi5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52ZC1u
YXRpdmVfMjAyNi4wNS4wNy0wMDAwMDYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zYm9tLWN2ZS1jaGVjay9zYm9tLWN2ZS1jaGVjay11cGRhdGUtbnZkLW5hdGl2ZV8yMDI2LjA2
LjAxLTAwMDAwNi5iYgppbmRleCAwMjQ0NmUzMGNlLi4wNWMwODg4N2EzIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRl
LW52ZC1uYXRpdmVfMjAyNi4wNS4wNy0wMDAwMDYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1udmQtbmF0aXZlXzIwMjYu
MDYuMDEtMDAwMDA2LmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vZmtpZS1jYWQvbnZkLWpzb24tZGF0YS1mZWVkcyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9ma2llLWNhZC9udmQtanNvbi1kYXRhLWZlZWRzLmdpdDticmFuY2g9bWFpbjtwcm90
b2NvbD1odHRwcztkZXN0c3VmZml4PSIKIFNCT01fQ1ZFX0NIRUNLX0RCX05BTUUgPSAibnZkLWZr
aWUiCiAKLVNSQ1JFViA9ICI3MmQ4ODQxYzhhZDkwODNlYmY2NzIzMDYzZjI3NTQ0NGVhMGQ3NmY5
IgorU1JDUkVWID0gImJjMTAzZDNhNzc2M2MxMjQyNjc3YzkzN2I3NzM2ZWZhYmNiYzU1ZTAiCiBV
UFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+LispIgogCiByZXF1aXJlIHNi
b20tY3ZlLWNoZWNrLXVwZGF0ZS1kYi5pbmMKLS0gCjIuNDcuMQoK

--===============3790366009042512228==--

