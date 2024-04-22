Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCDFC07C79
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 16:42:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.838.1713804114474197388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 09:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DC5C150C;
	Mon, 22 Apr 2024 09:42:22 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE6323F7BD;
	Mon, 22 Apr 2024 09:41:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] npth: remove redundant FILES
Date: Mon, 22 Apr 2024 16:41:51 +0000
Message-Id: <20240422164151.1018971-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 16:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198603

This is covered by the default rules.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/npth/npth_1.7.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/npth/npth_1.7.bb b/meta/recipes-support=
/npth/npth_1.7.bb
index 861f0b92c80..0cf35565a36 100644
--- a/meta/recipes-support/npth/npth_1.7.bb
+++ b/meta/recipes-support/npth/npth_1.7.bb
@@ -14,8 +14,6 @@ SRC_URI[sha256sum] =3D "8589f56937b75ce33b28d312fccbf30=
2b3b71ec3f3945fde6aaa740279
=20
 inherit autotools multilib_header
=20
-FILES:${PN} =3D "${libdir}/libnpth.so.*"
-
 do_install:append() {
     oe_multilib_header npth.h
 }
--=20
2.34.1


