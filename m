Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C84D462D3
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:55:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15124.1731513319754419380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 07:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E96E31474
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:48 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8ACC93F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/8] default-providers.conf: add virtual-x-terminal-emulator
Date: Wed, 13 Nov 2024 15:55:07 +0000
Message-Id: <20241113155511.1948551-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113155511.1948551-1-ross.burton@arm.com>
References: <20241113155511.1948551-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207116

We have multiple recipes in core that  RPROVIDE virtual-x-terminal-emulat=
or,
so we should pick one to be the default for deterministic builds.

Pick rxvt, as it's the lightest.  Sato can depend on matchbox-terminal
explicitly and rxvt will not be added.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/default-providers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
index d18173c7449..b32c4e0d254 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -59,3 +59,5 @@ PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconfig-nat=
ive"
 PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
=20
 PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
+
+PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D "rxvt-unicode"
--=20
2.34.1


