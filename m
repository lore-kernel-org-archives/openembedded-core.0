Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AD3C982E6
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:05:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3640.1768586736185284120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 10:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18F411682
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 10:05:29 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70A533F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 10:05:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] fontconfig: remove obsolete workaround
Date: Fri, 16 Jan 2026 18:05:00 +0000
Message-ID: <20260116180501.1548304-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 18:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229554

We don't need to delete two stale files from the source tree anymore, as
they are no longer shipped in the tarballs[1].

[1] fontconfig 31269e35 ("Do not ship fcobjshash.h")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta=
/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
index de2642bdd1..eca12400db 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
@@ -29,11 +29,6 @@ SRC_URI[sha256sum] =3D "9f5cae93f4fffc1fbc05ae99cdfc70=
8cd60dfd6612ffc0512827025c02
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/fontconfig/fontco=
nfig/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
=20
-do_configure:prepend() {
-    # work around https://bugs.freedesktop.org/show_bug.cgi?id=3D101280
-    rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
-}
-
 do_install:append:class-target() {
     # duplicate fc-cache for postinstall script
     mkdir -p ${D}${libexecdir}
--=20
2.43.0


