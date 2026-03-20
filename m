Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C7C1075269
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:27:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11421.1774009662533936952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EEDE165C
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC2743F7BD
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] layer.conf: update pkgconfig-native exclusions to pkgconf-native
Date: Fri, 20 Mar 2026 12:27:31 +0000
Message-ID: <20260320122732.1630715-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320122732.1630715-1-ross.burton@arm.com>
References: <20260320122732.1630715-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 12:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233605

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/layer.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index a7d44a55912..b097c34c7ba 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -106,7 +106,7 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
     .*->meson-native \
     .*->ninja-native \
     .*->patch-native \
-    .*->pkgconfig-native \
+    .*->pkgconf-native \
     .*->quilt-native \
     ^(?!gtk-doc-native).*->xmlto-native \
     .*->gperf-native \
@@ -121,7 +121,7 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
 # libgcc-native and the C runtime. Omitting these build dependencies can=
 save
 # significant disk space and speeds up packaging into signed rpms a litt=
le.
 SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
-    rpm-sequoia-native->(pkgconfig-native|cargo-native|python3-native|ru=
st-native) \
+    rpm-sequoia-native->(pkgconf-native|cargo-native|python3-native|rust=
-native) \
 "
 # Nothing needs to depend on libc-initial
 # base-passwd/shadow-sysroot don't need their dependencies
--=20
2.43.0


