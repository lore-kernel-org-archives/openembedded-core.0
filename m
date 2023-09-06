Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480C3EE14D0
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:14:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6415.1694024068638159633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 11:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CCD911FB;
	Wed,  6 Sep 2023 11:15:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CBE943F67D;
	Wed,  6 Sep 2023 11:14:27 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/7] pango: explictly enable/disable libthai
Date: Wed,  6 Sep 2023 19:14:17 +0100
Message-Id: <20230906181420.795510-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906181420.795510-1-ross.burton@arm.com>
References: <20230906181420.795510-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 18:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187345

From: Ross Burton <ross.burton@arm.com>

Pango has had an explicit option since 1.46.2

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/pango/pango_1.51.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango_1.51.0.bb b/meta/recipes-g=
raphics/pango/pango_1.51.0.bb
index 3bf84458e52..77a19012483 100644
--- a/meta/recipes-graphics/pango/pango_1.51.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.51.0.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURE=
S', 'x11', d)} \
=20
 PACKAGECONFIG[x11] =3D ",,virtual/libx11 libxft"
 PACKAGECONFIG[tests] =3D "-Dinstall-tests=3Dtrue, -Dinstall-tests=3Dfals=
e"
-PACKAGECONFIG[thai] =3D ",,libthai"
+PACKAGECONFIG[thai] =3D "-Dlibthai=3Denabled,-Dlibthai=3Ddisabled,libtha=
i"
=20
 GIR_MESON_OPTION =3D 'introspection'
=20
--=20
2.34.1


