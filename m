Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017B8C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 16:04:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.874.1721750643986660480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 09:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A30F1007
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 09:04:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 365693F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 09:04:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gi-docgen: upgrade to 2024.1
Date: Tue, 23 Jul 2024 17:03:59 +0100
Message-Id: <20240723160359.2247774-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 16:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202411

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gi-docgen/{gi-docgen_2023.3.bb =3D> gi-docgen_2024.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_2023.3.bb =3D> gi-docgen_=
2024.1.bb} (94%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb b/meta/reci=
pes-gnome/gi-docgen/gi-docgen_2024.1.bb
similarity index 94%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb
index 488f2663cbf..12c2b8ed215 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://gi-docgen.py;beginline=3D1=
;endline=3D5;md5=3D2dc0f1f0120247
=20
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=3Dhttps=
;branch=3Dmain"
=20
-SRCREV =3D "96f2e9b93e1d8a5338eb05b87fd879856ab7b3cc"
+SRCREV =3D "eff4ec3d21df38c9d857bcf58aa98437c6610489"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


