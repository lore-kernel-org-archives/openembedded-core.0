Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D36BCCF2F2
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:55:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33444.1768823719585435125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 03:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CD391517
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 03:55:12 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B8D6A3F632
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 03:55:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] default-providers: remove ltp entry
Date: Mon, 19 Jan 2026 11:55:13 +0000
Message-ID: <20260119115513.3295499-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 11:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229609

We have a default provider for ltp on the basis that there is an
alternative in meta-oe called ltp-ddt, but this was removed in 2017[1].

[1] meta-oe ec9e5ed062 ("recipes: remove blacklisted recipes")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/default-providers.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
index 3f113543cd..5101ad78f8 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -52,8 +52,6 @@ PREFERRED_PROVIDER_nativesdk-opkg ?=3D "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?=3D "kbd"
 PREFERRED_PROVIDER_gzip-native ?=3D "pigz-native"
 PREFERRED_PROVIDER_udev ?=3D "${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd','eudev',d)}"
-# Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/lt=
p-ddt_0.0.4.bb
-PREFERRED_PROVIDER_ltp ?=3D "ltp"
 PREFERRED_PROVIDER_getopt ?=3D "util-linux-getopt"
 PREFERRED_PROVIDER_openssl ?=3D "openssl"
 PREFERRED_PROVIDER_openssl-native ?=3D "openssl-native"
--=20
2.43.0


