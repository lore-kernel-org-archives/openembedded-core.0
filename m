Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B1AD3ABE5
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:13:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.66461.1731348829752857762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BCCD1480
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:14:19 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABADB3F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:13:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] json-glib: don't use deprecated gtk_doc option flag
Date: Mon, 11 Nov 2024 18:13:37 +0000
Message-Id: <20241111181341.3296523-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111181341.3296523-1-ross.burton@arm.com>
References: <20241111181341.3296523-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206971

The correct meson flag for the documentation is 'documentation'.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb b/meta/reci=
pes-gnome/json-glib/json-glib_1.10.0.bb
index df3cdba3b1e..332e8b65c3c 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
@@ -14,6 +14,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native"
 inherit gnomebase lib_package gobject-introspection gi-docgen gettext pt=
est-gnome manpages upstream-version-is-even
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
+GIDOCGEN_MESON_OPTION =3D 'documentation'
 GIDOCGEN_MESON_ENABLE_FLAG =3D 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG =3D 'disabled'
=20
--=20
2.34.1


