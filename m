Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9400AD6AAF0
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 16:25:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.409.1775147120069173787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 09:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ubJACbdY;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84AB8344A;
	Thu,  2 Apr 2026 09:25:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E42523F915;
	Thu,  2 Apr 2026 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775147119; bh=XdqMmAAULNQSc+T7eC9TN6wtCcccXxCE4BzttoR9cR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ubJACbdYAl9cRI8tK++DxdXmHyb10zGEc8FiBhS8ckiyFwQOyCmuoHyfpSNEGFzc1
	 1dRzflQAtexUqOKidkp8nRgRuQaDw/IrgpyT1vU26Y5vSMs0IUlVx+a+ZTq/SqB1a7
	 Vqi/Ao5A1fAtsjR+DLyEd4P9+Fc0Xv5wDjna9zOs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com
Subject: [RFC PATCH 2/3] sbom-cve-check: move to classes from classes-recipe
Date: Thu,  2 Apr 2026 17:25:09 +0100
Message-ID: <20260402162510.1945892-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402162510.1945892-1-ross.burton@arm.com>
References: <20260402162510.1945892-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 16:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234547

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/{classes-recipe =3D> classes}/sbom-cve-check.bbclass | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/{classes-recipe =3D> classes}/sbom-cve-check.bbclass (100%)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes/sb=
om-cve-check.bbclass
similarity index 100%
rename from meta/classes-recipe/sbom-cve-check.bbclass
rename to meta/classes/sbom-cve-check.bbclass
--=20
2.47.1


