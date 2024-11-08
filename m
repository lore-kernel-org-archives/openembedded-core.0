Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C8DD64067
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 17:02:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17735.1731085327855661719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 09:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F33B152B
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Nov 2024 09:02:37 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A8CF3F6A8
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Nov 2024 09:02:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] default-providers.conf: add virtual-x-terminal-emulator
Date: Fri,  8 Nov 2024 17:01:51 +0000
Message-Id: <20241108170156.2057761-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108170156.2057761-1-ross.burton@arm.com>
References: <20241108170156.2057761-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 17:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206893

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


