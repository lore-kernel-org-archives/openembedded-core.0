Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17948C624D9
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:11:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15055.1788361857694988368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=bAant0+m;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75E77165C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C5FBC3F673
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788361857; bh=gjf6rWE2wU2niUlKLboJBj152fYVrHi90eOPCDe1VZM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bAant0+mxVwwS+a0Mk46s+jZwpuxRAXGhPXVjdFqYloqshsaWrMJkQxpcWNHemKsb
	 EF8zd/nS/cmL0HFIjik9UogpUfZQ+hiHNeth51/VXoZmdXMlh3xnkSQlKpu/kfGC0W
	 RyBv6kJLPUwKIjYItxPHWzUky98qisIQ2GqPfcL4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] xcb-util: add explicit util-macros-native dependency
Date: Wed,  2 Sep 2026 16:10:46 +0100
Message-ID: <20260902151051.159953-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902151051.159953-1-ross.burton@arm.com>
References: <20260902151051.159953-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244967

This recipe needs util-macros, but currently this comes in via target
transient dependencies.  Explicitly depend on util-macros-native so it
is always present.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/xcb-util.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util.inc b/meta/recipes-g=
raphics/xorg-lib/xcb-util.inc
index 9898a6a13e6..cae1d287861 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util.inc
+++ b/meta/recipes-graphics/xorg-lib/xcb-util.inc
@@ -13,8 +13,7 @@ LICENSE =3D "MIT"
=20
 SECTION =3D "x11/libs"
=20
-DEPENDS =3D "libxcb"
-DEPENDS +=3D "gperf-native"
+DEPENDS =3D "util-macros-native gperf-native libxcb"
=20
 SRC_URI =3D "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
=20
--=20
2.43.0


