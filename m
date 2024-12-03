Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E07E74ACB
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 20:02:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29773.1733256151394236396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 12:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1A67FEC
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Dec 2024 12:02:58 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DC073F5A1
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Dec 2024 12:02:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lrzsz: update SRC_URI to avoid redirect
Date: Tue,  3 Dec 2024 20:02:26 +0000
Message-Id: <20241203200226.2955653-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 20:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208220

This server redirects to https:, so we might as well avoid the redirect.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/l=
rzsz/lrzsz_0.12.20.bb
index 3024ddcaf07..f21b9360206 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -11,10 +11,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0=
215e8d672dc4c32c317bb3 \
 SECTION =3D "console/network"
 DEPENDS =3D ""
=20
-SRC_URI =3D "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
+SRC_URI =3D "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://autotools-update.patch \
-	   file://autotools.patch \
-	   file://makefile.patch \
+           file://autotools.patch \
+           file://makefile.patch \
            file://lrzsz-check-locale.h.patch \
            file://cve-2018-10195.patch \
            file://include.patch \
--=20
2.34.1


