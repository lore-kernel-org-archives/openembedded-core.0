Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598D9C07E8E
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 16:39:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.757.1713803931372713545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 09:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 305F4150C;
	Mon, 22 Apr 2024 09:39:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 832193F7BD;
	Mon, 22 Apr 2024 09:38:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/5] npth: update homepage
Date: Mon, 22 Apr 2024 16:38:44 +0000
Message-Id: <20240422163846.1012183-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422163846.1012183-1-ross.burton@arm.com>
References: <20240422163846.1012183-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 16:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198599

Set the homepage to the actual homepage, not that of the older GNU Pth.

Also fix some whitespace in the license fields.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/npth/npth_1.7.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/npth/npth_1.7.bb b/meta/recipes-support=
/npth/npth_1.7.bb
index f02a731f850..45d4efb4a9c 100644
--- a/meta/recipes-support/npth/npth_1.7.bb
+++ b/meta/recipes-support/npth/npth_1.7.bb
@@ -1,12 +1,11 @@
 SUMMARY =3D "New GNU Portable Threads library"
 DESCRIPTION =3D "nPth is a library to provide the GNU Pth API and thus a=
 non-preemptive threads implementation. "
-HOMEPAGE =3D "https://www.gnu.org/software/pth/"
+HOMEPAGE =3D "https://gnupg.org/software/npth/"
 SECTION =3D "libs"
 LICENSE =3D "LGPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "\
-    file://COPYING.LIB;md5=3D2caced0b25dfefd4c601d92bd15116de\
-    "
+LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2caced0b25dfefd4c601d92bd=
15116de"
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
+
 SRC_URI =3D "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://musl-fix.patch \
--=20
2.34.1


