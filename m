Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13AEEE14A6
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 15:13:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.904.1694013171546821048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 08:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AECD106F;
	Wed,  6 Sep 2023 08:13:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA1A43F7B4;
	Wed,  6 Sep 2023 08:12:49 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] glib-2.0: explicitly enable strlcpy()
Date: Wed,  6 Sep 2023 16:12:47 +0100
Message-Id: <20230906151247.312252-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 15:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187319

From: Ross Burton <ross.burton@arm.com>

We have glibc 2.38 which added strlcpy(), so enable the use of it
explicitly in the Meson cross file for when the target doesn't support
qemu-usermode (which will result in the default of not using it).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-gli=
bc b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
index c4648f58c78..3049e5116ec 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
+++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
@@ -3,3 +3,4 @@ have_c99_vsnprintf =3D true
 have_c99_snprintf =3D true
 have_unix98_printf =3D true
 va_val_copy =3D true
+have_strlcpy =3D true
--=20
2.34.1


