Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38724EE14CD
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:14:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6412.1694024066433955808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 11:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE03E106F;
	Wed,  6 Sep 2023 11:15:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77DD03F67D;
	Wed,  6 Sep 2023 11:14:25 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/7] glib-2.0: libelf has a configure option now, specify it
Date: Wed,  6 Sep 2023 19:14:14 +0100
Message-Id: <20230906181420.795510-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 18:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187342

From: Ross Burton <ross.burton@arm.com>

GLib has had an option to control libelf since 2.67.0, so use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index 843b6bd29b3..878dd107de4 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -40,8 +40,7 @@ PACKAGECONFIG ??=3D "libmount \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)}"
 PACKAGECONFIG[libmount] =3D "-Dlibmount=3Denabled,-Dlibmount=3Ddisabled,=
util-linux"
 PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue, -Dman=3Dfalse, libxslt-native=
 xmlto-native"
-# libelf is auto-detected without a configuration option
-PACKAGECONFIG[libelf] =3D ",,elfutils"
+PACKAGECONFIG[libelf] =3D "-Dlibelf=3Denabled,-Dlibelf=3Ddisabled,elfuti=
ls"
 PACKAGECONFIG[tests] =3D "-Dinstalled_tests=3Dtrue,-Dinstalled_tests=3Df=
alse,"
 PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
=20
--=20
2.34.1


