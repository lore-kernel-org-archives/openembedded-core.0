Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21768C001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 16:59:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40249.1691427590871090153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 09:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E55FD75;
	Mon,  7 Aug 2023 10:00:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 035353F59C;
	Mon,  7 Aug 2023 09:59:49 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] ghostscript: ignore CVE-2023-38560
Date: Mon,  7 Aug 2023 17:59:45 +0100
Message-Id: <20230807165945.4102126-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807165945.4102126-1-ross.burton@arm.com>
References: <20230807165945.4102126-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 16:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185613

From: Ross Burton <ross.burton@arm.com>

The ghostscript recipe isn't vulnerable to CVE-2023-38560, as this is an
issue in the GhostPCL release, whereas this recipe is the Ghostscript
release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
index 6b5f443db06..0ddf708f936 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
@@ -67,3 +67,5 @@ COMPATIBLE_HOST =3D "^(?!arc).*"
=20
 # some entries in NVD uses gpl_ghostscript
 CVE_PRODUCT =3D "ghostscript gpl_ghostscript"
+
+CVE_STATUS[CVE-2023-38560] =3D "not-applicable-config: PCL isn't part of=
 the Ghostscript release"
--=20
2.34.1


