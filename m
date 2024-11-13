Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC4BD462CA
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:55:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14817.1731513317977063791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 07:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C955150C
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D6153F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/8] rxvt-unicode: add x11 DISTRO_FEATURE check
Date: Wed, 13 Nov 2024 15:55:05 +0000
Message-Id: <20241113155511.1948551-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113155511.1948551-1-ross.burton@arm.com>
References: <20241113155511.1948551-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207114

rxvt is a classic X11 application, so add the feature check so it doesn't
get pulled into world builds without x11.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recip=
es-sato/rxvt-unicode/rxvt-unicode.inc
index 2ee3edefa76..8cd41f33923 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -13,7 +13,9 @@ SRC_URI =3D "http://dist.schmorp.de/rxvt-unicode/Attic/=
rxvt-unicode-${PV}.tar.bz2
 	   file://rxvt.desktop \
 	   file://rxvt.png"
=20
-inherit autotools pkgconfig update-alternatives
+inherit autotools features_check pkgconfig update-alternatives
+
+REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 RPROVIDES:${PN} =3D "virtual-x-terminal-emulator"
 ALTERNATIVE:${PN} =3D "x-terminal-emulator"
--=20
2.34.1


