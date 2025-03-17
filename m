Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E367C28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 13:47:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52714.1742219263025026436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 06:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FE5D13D5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:47:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 199663F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:47:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] dbus-glib: depend on dbus, not dbus-x11
Date: Mon, 17 Mar 2025 13:47:36 +0000
Message-ID: <20250317134738.1826161-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 13:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213097

dbus-x11 hasn't existed as a package since 2012[1] and is just a
RPROVIDES in dbus, so depend on dbus directly instead.

[1] oe-core c02364f36e228835ea5d7fd4e1d347fd451f8544

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/dbus/dbus-glib_0.112.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-cor=
e/dbus/dbus-glib_0.112.bb
index 4acf4356942..4753997d3d2 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -33,7 +33,7 @@ FILES:${PN}-bash-completion +=3D "${libexecdir}/dbus-ba=
sh-completion-helper"
 FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-too=
l"
 FILES:${PN}-dev +=3D "${bindir}/dbus-binding-tool"
=20
-RDEPENDS:${PN}-tests +=3D "dbus-x11"
+RDEPENDS:${PN}-tests +=3D "dbus"
 FILES:${PN}-tests =3D "${datadir}/${BPN}/tests"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.43.0


