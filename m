Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6D6C87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 20:49:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.98308.1754081394056342955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 13:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 985B116A3
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 13:49:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A2183F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 13:49:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] dbus: remove obsolete cleanups
Date: Fri,  1 Aug 2025 21:49:25 +0100
Message-ID: <20250801204928.2580529-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801204928.2580529-1-ross.burton@arm.com>
References: <20250801204928.2580529-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 20:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221372

The removal of the Red Hat initscript has been redundant since 2017[1].

The test directory is not installed, so there's no need to remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>

[1] dbus: 708a44d0 ("Remove distribution-specific init-scripts")
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/db=
us/dbus_1.16.2.bb
index 381dcec82a3..909a209fc7b 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -159,12 +159,6 @@ do_install:append:class-target() {
 		chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
 	fi
=20
-	# Remove Red Hat initscript
-	rm -rf ${D}${sysconfdir}/rc.d
-
-	# Remove empty testexec directory as we don't build tests
-	rm -rf ${D}${libdir}/dbus-1.0/test
-
 	# Remove /run as it is created on startup
 	rm -rf ${D}${runtimedir}
 }
--=20
2.43.0


