Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338CBC0015E
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 14:09:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.9127.1687788559699517317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 07:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=malformed MIME header line: Subject: [PATCH] uboot-extlinux-config.bbclass: fix old override syntax in
 comment;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5605740005;
	Mon, 26 Jun 2023 14:09:15 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] uboot-extlinux-config.bbclass: fix old override syntax in
 comment
Date: Mon, 26 Jun 2023 16:08:47 +0200
Message-ID: <20230626-dev-uboot-extlinux-config-comment-new-syntax-v1-1-bd3319130902@theobroma-systems.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 14:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183421

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D
The comment specifies how to use the variables but uses the older and=0D
now unsupported override syntax. Let's update to match the newer syntax.=0D
=0D
Cc: Quentin Schulz <foss+yocto@0leil.net>=0D
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
---=0D
This was NOT tested, only looked weird and the code seems to indicate it=0D
can use the new syntax (which is not always guaranteed, see=0D
PREFERRED_PROVIDER).=0D
---=0D
 meta/classes-recipe/uboot-extlinux-config.bbclass | 8 ++++----=0D
 1 file changed, 4 insertions(+), 4 deletions(-)=0D
=0D
diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/class=
es-recipe/uboot-extlinux-config.bbclass=0D
index 86a7d30ca0..653e583663 100644=0D
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass=0D
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass=0D
@@ -33,11 +33,11 @@=0D
 # UBOOT_EXTLINUX_DEFAULT_LABEL ??=3D "Linux Default"=0D
 # UBOOT_EXTLINUX_TIMEOUT ??=3D "30"=0D
 #=0D
-# UBOOT_EXTLINUX_KERNEL_IMAGE_default ??=3D "../zImage"=0D
-# UBOOT_EXTLINUX_MENU_DESCRIPTION_default ??=3D "Linux Default"=0D
+# UBOOT_EXTLINUX_KERNEL_IMAGE:default ??=3D "../zImage"=0D
+# UBOOT_EXTLINUX_MENU_DESCRIPTION:default ??=3D "Linux Default"=0D
 #=0D
-# UBOOT_EXTLINUX_KERNEL_IMAGE_fallback ??=3D "../zImage-fallback"=0D
-# UBOOT_EXTLINUX_MENU_DESCRIPTION_fallback ??=3D "Linux Fallback"=0D
+# UBOOT_EXTLINUX_KERNEL_IMAGE:fallback ??=3D "../zImage-fallback"=0D
+# UBOOT_EXTLINUX_MENU_DESCRIPTION:fallback ??=3D "Linux Fallback"=0D
 #=0D
 # Results:=0D
 #=0D
=0D
---=0D
base-commit: 13b646c0e167ca52f69c91be5538049b172015ac=0D
change-id: 20230626-dev-uboot-extlinux-config-comment-new-syntax-82396af309=
35=0D
=0D
Best regards,=0D
-- =0D
Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D

