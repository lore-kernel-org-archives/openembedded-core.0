Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8E6C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 15:37:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.63196.1686584273334492799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 08:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EB032F4;
	Mon, 12 Jun 2023 08:38:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D7363F5A1;
	Mon, 12 Jun 2023 08:37:52 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] gobject-introspection: remove obsolete DEPENDS
Date: Mon, 12 Jun 2023 16:37:48 +0100
Message-Id: <20230612153748.937565-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612153748.937565-1-ross.burton@arm.com>
References: <20230612153748.937565-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 15:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182677

From: Ross Burton <ross.burton@arm.com>

This recipe uses meson, so doesn't need to DEPEND on autoconf-archive.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gobject-introspection/gobject-introspection_1.74.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.74.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspec=
tion_1.74.0.bb
index d3a7ce2fd93..15265d1dc42 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74=
.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74=
.0.bb
@@ -27,7 +27,7 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 MULTILIB_SCRIPTS =3D "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindi=
r}/g-ir-scanner"
=20
-DEPENDS +=3D " libffi zlib glib-2.0 python3 flex-native bison-native aut=
oconf-archive-native"
+DEPENDS +=3D " libffi zlib glib-2.0 python3 flex-native bison-native"
=20
 # target build needs qemu to run temporary introspection binaries create=
d
 # on the fly by g-ir-scanner and a native version of itself to run
--=20
2.34.1


