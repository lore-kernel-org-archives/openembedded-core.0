Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF23D729F0
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 17:38:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.119633.1732901892753633104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 09:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCFE711FB
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 09:38:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E56D03F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 09:38:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] gnu-efi: fix license
Date: Fri, 29 Nov 2024 17:38:02 +0000
Message-Id: <20241129173803.3499627-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129173803.3499627-1-ross.burton@arm.com>
References: <20241129173803.3499627-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 17:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208028

gnu-efi is a mix of BSD and GPL licensed source code, not a choice
between the two.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb b/meta/recipes-bs=
p/gnu-efi/gnu-efi_3.0.18.bb
index b08aede69f2..db77f30aaf4 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Libraries for producing EFI binaries"
 HOMEPAGE =3D "http://sourceforge.net/projects/gnu-efi/"
 DESCRIPTION =3D "GNU-EFI aims to Develop EFI applications for ARM-64, AR=
M-32, x86_64, IA-64 (IPF), IA-32 (x86), and MIPS platforms using the GNU =
toolchain and the EFI development environment."
 SECTION =3D "devel"
-LICENSE =3D "GPL-2.0-or-later | BSD-2-Clause"
+LICENSE =3D "GPL-2.0-or-later & BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://gnuefi/crt0-efi-arm.S;beginline=3D4;endline=
=3D16;md5=3De582764a4776e60c95bf9ab617343d36 \
                     file://gnuefi/crt0-efi-aarch64.S;beginline=3D4;endli=
ne=3D16;md5=3De582764a4776e60c95bf9ab617343d36 \
                     file://inc/efishellintf.h;beginline=3D13;endline=3D2=
0;md5=3D202766b79d708eff3cc70fce15fb80c7 \
--=20
2.34.1


