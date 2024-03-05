Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8E7C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 17:55:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1292.1709661339697673725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 09:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDF8B1FB
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Mar 2024 09:56:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B68E43F73F
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Mar 2024 09:55:38 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rxvt: add rxvt to desktop entry name
Date: Tue,  5 Mar 2024 17:55:35 +0000
Message-Id: <20240305175535.3750401-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 17:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196643

From: Ross Burton <ross.burton@arm.com>

If an image ends up with both matchbox-terminal and rxvt installed then
there are two Terminal applications that only differ in the description.

Rename the rxvt desktop entry to specifically identify itself as rxvt.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop b/m=
eta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
index 6b7978afc94..1ac3d99510b 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
@@ -1,6 +1,6 @@
 [Desktop Entry]
 Version=3D1.0
-Name=3DTerminal
+Name=3DRxvt Terminal
 Comment=3DA unicode capable rxvt clone
 Exec=3Drxvt
 Icon=3Dutilities-terminal
--=20
2.34.1


