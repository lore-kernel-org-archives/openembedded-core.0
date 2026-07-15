Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C70CC44514
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6665.1784124316542076759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KcWU5FdA;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 996B11576
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6FE093F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124315; bh=0sXQjvP5W1lcfAWZcPONR/2DlZO6q0n9M1U+ImVWLA0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KcWU5FdACxOwq1ssYeVJHF+E9Wd3FbpR/8w0d1D7B8xUfUThEUW4VkMygTuG+AtYB
	 EYfsDJW5oGpae5mHUm63wIbbbXvD99YwmOJOZQv+aJtPAF9dDMVfUHkokqXm8Em3NQ
	 iI2dbtYpmxfvgTdoMib/keKB3foyq3kE8DJbwMa8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/12] patchelf: build with meson
Date: Wed, 15 Jul 2026 15:04:59 +0100
Message-ID: <20260715140507.2329605-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240963

Upstream has meson support, so use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/patchelf/patchelf_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipe=
s-devtools/patchelf/patchelf_git.bb
index 6c88da1b098..adc1198937d 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -4,15 +4,14 @@ HOMEPAGE =3D "https://github.com/NixOS/patchelf"
=20
 LICENSE =3D "GPL-3.0-only"
=20
-SRC_URI =3D "git://github.com/NixOS/patchelf;protocol=3Dhttps;branch=3Dm=
aster \
-"
+SRC_URI =3D "git://github.com/NixOS/patchelf;protocol=3Dhttps;branch=3Dm=
aster"
 SRCREV =3D "7688b17c18d16f67fa8d5a82a2404c2e3a18648d"
=20
 PV =3D "0.19.1"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a=
71e"
=20
-inherit autotools
+inherit meson
=20
 PACKAGES +=3D "${PN}-zsh-completion"
 FILES:${PN}-zsh-completion =3D "${datadir}/zsh"
--=20
2.43.0


