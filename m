Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AB1D462CF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:55:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14816.1731513317604865160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 07:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5B771474
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:46 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43E3B3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/8] rxvt-unicode: change virtual/x-terminal-emulator PROVIDES to RPROVIDES
Date: Wed, 13 Nov 2024 15:55:04 +0000
Message-Id: <20241113155511.1948551-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207113

The point of the virtual-x-terminal-emulator alternative was to provide
a single binary that executes whatever terminal has been installed. This
is a runtime choice, so should be RPROVIDES.

This doesn't need built-time PROVIDES, which actively get in the way
when multiple recipes are being built with the same PROVIDES.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recip=
es-sato/rxvt-unicode/rxvt-unicode.inc
index 5193eebb0bc..2ee3edefa76 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -15,7 +15,7 @@ SRC_URI =3D "http://dist.schmorp.de/rxvt-unicode/Attic/=
rxvt-unicode-${PV}.tar.bz2
=20
 inherit autotools pkgconfig update-alternatives
=20
-PROVIDES =3D "virtual/x-terminal-emulator"
+RPROVIDES:${PN} =3D "virtual-x-terminal-emulator"
 ALTERNATIVE:${PN} =3D "x-terminal-emulator"
 ALTERNATIVE_TARGET[x-terminal-emulator] =3D "${bindir}/rxvt"
=20
--=20
2.34.1


