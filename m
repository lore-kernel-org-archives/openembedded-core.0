Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DCF1076387
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 16:54:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18061.1775062494926399246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 09:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=BV5J9zc9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA912E99
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 09:54:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA2F93F7D8
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775062494; bh=Twc/niMz3AtsW9hDOLfeTs7iP4jX0xG8qb/BgD0S1eQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BV5J9zc9uIz5+E4tUev05qekNurss6k6JrMDjGQb8jg+d9NUMrg7OWObwWKHlWEnL
	 e9jtV62MqDzmif+HN+J+fueneDr9h5nib1huYYL6LqwOmLGagoSC7F0bimlrr5Z89o
	 xWPJDFOjFKTCUnfbKuvHlnJ1gX7d94wFO37Kmkd4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] classes/sbom-cve-check: add summary export type
Date: Wed,  1 Apr 2026 17:54:47 +0100
Message-ID: <20260401165447.2852846-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401165447.2852846-1-ross.burton@arm.com>
References: <20260401165447.2852846-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 16:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234448

Add an export type for the human-readable summary report.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index 4244ee657a8..4abc427c58f 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -36,6 +36,13 @@ SBOM_CVE_CHECK_EXPORT_CVECHECK[doc] =3D "Export config=
uration to generate a JSON m
 SBOM_CVE_CHECK_EXPORT_CVECHECK[type] ?=3D "yocto-cve-check-manifest"
 SBOM_CVE_CHECK_EXPORT_CVECHECK[ext] ?=3D ".sbom-cve-check.yocto.json"
=20
+SBOM_CVE_CHECK_EXPORT_SUMMARY[doc] =3D "Export configuration to generate=
 a human-readable \
+    summary report, with the following name: \
+    ${IMAGE_NAME}.cve.txt \
+"
+SBOM_CVE_CHECK_EXPORT_SUMMARY[type] ?=3D "summary"
+SBOM_CVE_CHECK_EXPORT_SUMMARY[ext] ?=3D ".cve.txt"
+
 python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
--=20
2.43.0


