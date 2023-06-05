Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E8EC7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:52:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8291.1685973165986802675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 06:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ABAAD75;
	Mon,  5 Jun 2023 06:53:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 854043F663;
	Mon,  5 Jun 2023 06:52:44 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/4] piglit: upgrade to latest revision
Date: Mon,  5 Jun 2023 14:52:40 +0100
Message-Id: <20230605135241.2568169-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605135241.2568169-1-ross.burton@arm.com>
References: <20230605135241.2568169-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 13:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182383

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
index 6264483bf61..cd97ee53547 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.g=
it;protocol=3Dhttps;branch=3Dma
            "
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-SRCREV =3D "c39bc6062a373c371d9c8076a66acbb26c661471"
+SRCREV =3D "5036601c43fff63f7be5cd8ad7b319a5c1f6652c"
 # (when PV goes above 1.0 remove the trailing r)
 PV =3D "1.0+gitr${SRCPV}"
=20
--=20
2.34.1


