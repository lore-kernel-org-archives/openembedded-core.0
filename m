Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077DCE936E9
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 21:43:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1156.1696455825009421996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 14:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05954DA7;
	Wed,  4 Oct 2023 14:44:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4D053F762;
	Wed,  4 Oct 2023 14:43:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] libxpm: upgrade to 3.5.17
Date: Wed,  4 Oct 2023 22:43:41 +0100
Message-Id: <20231004214341.3805882-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231004214341.3805882-1-ross.burton@arm.com>
References: <20231004214341.3805882-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 21:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188702

From: Ross Burton <ross.burton@arm.com>

This release fixes the following CVEs:

- CVE-2023-43788
- CVE-2023-43789

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xorg-lib/{libxpm_3.5.16.bb =3D> libxpm_3.5.17.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.16.bb =3D> libxpm_3.5.=
17.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb b/meta/recip=
es-graphics/xorg-lib/libxpm_3.5.17.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index c3d01f1bb36..8e15ecc0d48 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -22,6 +22,6 @@ PACKAGES =3D+ "sxpm cxpm"
 FILES:cxpm =3D "${bindir}/cxpm"
 FILES:sxpm =3D "${bindir}/sxpm"
=20
-SRC_URI[sha256sum] =3D "e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e=
71fa2f6eff649f51"
+SRC_URI[sha256sum] =3D "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6f=
a3fc95e271226e43"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.34.1


