Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFBFC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 17:36:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.50116.1670866560570701453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 09:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBD4E1FB;
	Mon, 12 Dec 2022 09:36:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECF2F3F73B;
	Mon, 12 Dec 2022 09:35:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] libepoxy: remove upstreamed patch
Date: Mon, 12 Dec 2022 17:35:46 +0000
Message-Id: <20221212173547.1860380-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 17:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174500

This patch was upstreamed in 6b09a8bc, 1.5.5 onwards.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...atch_common.h-define-also-EGL_NO_X11.patch | 27 -------------------
 .../libepoxy/libepoxy_1.5.10.bb               |  4 +--
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch_co=
mmon.h-define-also-EGL_NO_X11.patch

diff --git a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-=
define-also-EGL_NO_X11.patch b/meta/recipes-graphics/libepoxy/files/0001-=
dispatch_common.h-define-also-EGL_NO_X11.patch
deleted file mode 100644
index 971a3f54e04..00000000000
--- a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-=
also-EGL_NO_X11.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7211120d1e2f059d900f3379b9790484dbcf7761 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 25 Oct 2019 11:09:34 +0000
-Subject: [PATCH] dispatch_common.h: define also EGL_NO_X11
-
-MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in:
-https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67ea=
cc1ddb
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Pending
-
----
- src/dispatch_common.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/dispatch_common.h b/src/dispatch_common.h
-index a136943..448c9b1 100644
---- a/src/dispatch_common.h
-+++ b/src/dispatch_common.h
-@@ -55,6 +55,7 @@
-  * as EGL_NO_X11
-  */
- #  define MESA_EGL_NO_X11_HEADERS 1
-+#  define EGL_NO_X11 1
- # endif
- #include "epoxy/egl.h"
- #endif
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb b/meta/rec=
ipes-graphics/libepoxy/libepoxy_1.5.10.bb
index d10134568ac..384afa69079 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
@@ -9,9 +9,7 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D58ef4c80d401e07bd9ee8b6b58cf4=
64b"
=20
-SRC_URI =3D "git://github.com/anholt/libepoxy;branch=3Dmaster;protocol=3D=
https \
-           file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
-           "
+SRC_URI =3D "git://github.com/anholt/libepoxy;branch=3Dmaster;protocol=3D=
https"
 SRCREV =3D "c84bc9459357a40e46e2fec0408d04fbdde2c973"
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


