Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1959CC83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 11:15:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.59503.1753960510401323620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 04:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D77C31D13
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 04:15:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F1053F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 04:15:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bash: update source checksum
Date: Thu, 31 Jul 2025 12:15:05 +0100
Message-ID: <20250731111505.1235881-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 11:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221193

The bash-5.3 tarball was regenerated, so update the checksum.

Signed-off-by: Ross Burton <ross.burton@arm.com>

[1] https://lists.gnu.org/archive/html/bug-bash/2025-07/msg00156.html
---
 meta/recipes-extended/bash/bash_5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash_5.3.bb b/meta/recipes-extend=
ed/bash/bash_5.3.bb
index c241ea6d3b7..b50a48d28c9 100644
--- a/meta/recipes-extended/bash/bash_5.3.bb
+++ b/meta/recipes-extended/bash/bash_5.3.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtar=
ball \
            file://fix-run-builtins.patch \
            "
=20
-SRC_URI[tarball.sha256sum] =3D "62dd49c44c399ed1b3f7f731e87a782334d834f0=
8e098a35f2c87547d5dbb269"
+SRC_URI[tarball.sha256sum] =3D "0d5cd86965f869a26cf64f4b71be7b96f90a3ba8=
b3d74e27e8e9d9d5550f31ba"
=20
 DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
--=20
2.43.0


