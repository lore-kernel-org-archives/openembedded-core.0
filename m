Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BA9C7EE2C
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:40:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30019.1684262442466477072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E00F21FB;
	Tue, 16 May 2023 11:41:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F4DD3F793;
	Tue, 16 May 2023 11:40:41 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	kubiznak@2n.com
Subject: [PATCH 6/7] python3-pygobject: mandate gobject-introspection-data DISTRO_FEATURE
Date: Tue, 16 May 2023 19:40:30 +0100
Message-Id: <20230516184031.2255171-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516184031.2255171-1-ross.burton@arm.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181419

From: Ross Burton <ross.burton@arm.com>

PyGObject needs gobject-introspection to function, so add a distro
features check.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.44.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb b/m=
eta/recipes-devtools/python/python3-pygobject_3.44.1.bb
index 1132e9a9ed3..43125927cd3 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e=
631dd8edb7424769c7"
 GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D ""
=20
-inherit gnomebase setuptools3-base gobject-introspection upstream-versio=
n-is-even
+inherit gnomebase setuptools3-base gobject-introspection upstream-versio=
n-is-even features_check
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
 DEPENDS +=3D "python3 glib-2.0"
=20
--=20
2.34.1


