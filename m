Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF38E98FDF
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:26:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136574.1775751987740644341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 09:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VZFbxM/R;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 560271C25
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Apr 2026 09:26:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A22D83F641
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Apr 2026 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775751987; bh=LToq4hTh/XYHC8zvAoOivn3Nwr8FlzxypPBPKoADnw8=;
	h=From:To:Subject:Date:From;
	b=VZFbxM/R8Wn2ICK4HRQzgg6C+yrlvdtZv0eceXDv8v6YqmIDk4mgq2xpDYrjbWjZd
	 nlPB5JS2F7tzLEpNbU5Q+5AxtxChzwLxrg9M9PiO8RB5g0SEg1QNeKHvFzSTVfMBsa
	 cWuhVf1ZvwxSw1wZexVv3Zxhxs1L0ITWIXn6+RI0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python3-sbom-cve-check: move from devtools/python to devtools/sbom-cve-check
Date: Thu,  9 Apr 2026 17:26:20 +0100
Message-ID: <20260409162622.3307731-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234934

Move the tool recipe from the catch-all python/ directory to be alongside
the recipes that fetch the databases for the tool.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{python =3D> sbom-cve-check}/python3-sbom-cve-check_1.2.0.bb    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/{python =3D> sbom-cve-check}/python3-sbom-c=
ve-check_1.2.0.bb (100%)

diff --git a/meta/recipes-devtools/python/python3-sbom-cve-check_1.2.0.bb=
 b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-sbom-cve-check_1.2.0.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.2=
.0.bb
--=20
2.43.0


