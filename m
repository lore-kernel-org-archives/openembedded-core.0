Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16409C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 13:47:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52950.1742219263809004145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 06:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E24C1688
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:47:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD2723F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:47:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] packagegroup-core-x11: depend on dbus, not dbus-x11
Date: Mon, 17 Mar 2025 13:47:37 +0000
Message-ID: <20250317134738.1826161-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317134738.1826161-1-ross.burton@arm.com>
References: <20250317134738.1826161-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 13:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213098

dbus-x11 hasn't existed as a package since 2012[1] and is just a
RPROVIDES in dbus, so depend on dbus directly instead.

Also remove some non-ASCII that had sneaked into the file.

[1] oe-core c02364f36e228835ea5d7fd4e1d347fd451f8544

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb=
 b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 91db7ed33bd..4a3590e3e79 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -30,6 +30,6 @@ RDEPENDS:${PN}-utils =3D "\
     xrandr \
     xmodmap \
     xdpyinfo \
-    xinput-calibrator=C2=A0\
-    dbus-x11 \
+    xinput-calibrator \
+    dbus \
     "
--=20
2.43.0


