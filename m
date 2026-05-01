Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79E5CD3445
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15608.1777645529547183619
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=h+KJ1XFN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j/20g1Eh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019de3ee2665-cedf8f16-8e51-477e-b9fd-f246e06b5fff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645528;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xupDq8EsM9uQRVHpEJ0zCLq4SNvS1+PI1FekaykB/tw=;
	b=h+KJ1XFNSPAbSfz9UITX5ZVCAmwBvo6VkzwzI87Ak9wuj4vt8iHi6vfvugEKGU1c
	rjcE4n8PAsZBx+L/hVkwLY0Kn7MryFx2fL/FYe+shx43usnShbmflTyfySnjTb+LGpu
	WJ2Vi5ZYVYGqpIk9WqoF8SAaqalbDTbv7NAbk5tw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645528;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xupDq8EsM9uQRVHpEJ0zCLq4SNvS1+PI1FekaykB/tw=;
	b=j/20g1EhWE39FQmGAhZt3+6Ry9N/N77iKjHj9jqiTdyKk/dFEQqNX1PZzRQl3JOi
	BKRgp1NOIsz5d1h59yX+vV5BKF5lEWVgqWKmCrtRJEcgKJTbD+1k5wzUwVU9QKtbEEk
	VAc1/5lksTF7BQyPf/uRfQToAlTqXoKTQ96m5pww=
Content-Type: multipart/mixed; boundary="===============5569776321803889865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
	Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 sbom-cve-check-update-cvelist-native,sbom-cve-check-update-nvd-native:
 upgrading to 2026,2026.04.30 SUCCEEDED
Message-ID: <0101019de3ee2665-cedf8f16-8e51-477e-b9fd-f246e06b5fff-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236199

--===============5569776321803889865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sbom-cve-check-update-cvelist-native,sbom-cve-check-update-nvd-native* to *2026,2026.04.30* has Succeeded.

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
From 056c93e203502a49745354c09be7eba819ac0a69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 05:57:53 +0000
Subject: [PATCH] 
 sbom-cve-check-update-cvelist-native,sbom-cve-check-update-nvd-native:
 upgrade 1.0 -> 2026,1.0 -> 2026.04.30

---
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb      | 2 +-
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
index 3387122165..4c41b02b71 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
@@ -7,6 +7,6 @@ SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
 # 2026-03-19_baseline
-SRCREV = "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
+SRCREV = "44ed82e3b91a4fdaa19f5475882daed1fb349b30"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
index c868ba09c1..3b076a856d 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
@@ -7,6 +7,6 @@ SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protoco
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
 # v2026.03.19-010002
-SRCREV = "49f8bbe1b0b0884e16bdc37ab68db997085570a7"
+SRCREV = "40edd543de1603d0e00c901fc3cab25a6b0b7bb1"
 
 require sbom-cve-check-update-db.inc
-- 
2.47.1


--===============5569776321803889865==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sbom-cve-check-update-cvelist-native-sbom-cve-check-.patch"

RnJvbSAwNTZjOTNlMjAzNTAyYTQ5NzQ1MzU0YzA5YmU3ZWJhODE5YWMwYTY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNTo1Nzo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
c2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlLHNib20tY3ZlLWNoZWNrLXVwZGF0
ZS1udmQtbmF0aXZlOgogdXBncmFkZSAxLjAgLT4gMjAyNiwxLjAgLT4gMjAyNi4wNC4zMAoKLS0t
CiAuLi4vc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZl
LmJiICAgICAgfCAyICstCiAuLi4vc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRl
LW52ZC1uYXRpdmUuYmIgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVw
ZGF0ZS1jdmVsaXN0LW5hdGl2ZS5iYgppbmRleCAzMzg3MTIyMTY1Li40YzQxYjAyYjcxIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hl
Y2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
Ym9tLWN2ZS1jaGVjay9zYm9tLWN2ZS1jaGVjay11cGRhdGUtY3ZlbGlzdC1uYXRpdmUuYmIKQEAg
LTcsNiArNyw2IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9DVkVQcm9qZWN0L2N2ZWxp
c3RWNS5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHM7CiBTQk9NX0NWRV9DSEVDS19EQl9O
QU1FID0gImN2ZWxpc3QiCiAKICMgMjAyNi0wMy0xOV9iYXNlbGluZQotU1JDUkVWID0gImFkYTU0
ZWUzY2M4MzgwODIwYWE0NWU0OTk2OTEwYmRjOWRjYjk0ZTciCitTUkNSRVYgPSAiNDRlZDgyZTNi
OTFhNGZkYWExOWY1NDc1ODgyZGFlZDFmYjM0OWIzMCIKIAogcmVxdWlyZSBzYm9tLWN2ZS1jaGVj
ay11cGRhdGUtZGIuaW5jCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1j
dmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52ZC1uYXRpdmUuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52ZC1uYXRp
dmUuYmIKaW5kZXggYzg2OGJhMDljMS4uM2IwNzZhODU2ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1udmQtbmF0
aXZlLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9zYm9tLWN2
ZS1jaGVjay11cGRhdGUtbnZkLW5hdGl2ZS5iYgpAQCAtNyw2ICs3LDYgQEAgU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL2ZraWUtY2FkL252ZC1qc29uLWRhdGEtZmVlZHMuZ2l0O2JyYW5jaD1t
YWluO3Byb3RvY28KIFNCT01fQ1ZFX0NIRUNLX0RCX05BTUUgPSAibnZkLWZraWUiCiAKICMgdjIw
MjYuMDMuMTktMDEwMDAyCi1TUkNSRVYgPSAiNDlmOGJiZTFiMGIwODg0ZTE2YmRjMzdhYjY4ZGI5
OTcwODU1NzBhNyIKK1NSQ1JFViA9ICI0MGVkZDU0M2RlMTYwM2QwZTAwYzkwMWZjM2NhYjI1YTZi
MGI3YmIxIgogCiByZXF1aXJlIHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1kYi5pbmMKLS0gCjIuNDcu
MQoK

--===============5569776321803889865==--

