Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DCAC624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:11:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15413.1788361859256879984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=N4IhUHeK;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECC62165C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48CA13F673
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788361858; bh=1h/xFT2zNnm6HX4zlgXRI9tIRp1+/tluEjq8DkBydJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N4IhUHeKotlH7MTZFS7OtX/G4Z1NvLbhux99aemis5a1tAZvCvEsgAzvkDnp9kyma
	 Gce39p/Wj3Dfr+FQvma5tCYozNeWdgkw/Y/T++rk9WCNsf0z5DkrfLjdXjs8pcQT4t
	 fF4o32cahjsrvz0oUs3a3m9CfPl2qqUH4hIZxORQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] xorg-driver-common: depend on util-macros-native
Date: Wed,  2 Sep 2026 16:10:48 +0100
Message-ID: <20260902151051.159953-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902151051.159953-1-ross.burton@arm.com>
References: <20260902151051.159953-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244969

There's no need to depend on the target form of this recipe as it just
provides autoconf macros, the native is sufficient.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/m=
eta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index dd964d466d0..08dfa7fabf3 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -6,7 +6,7 @@ LICENSE =3D "MIT"
=20
 PE =3D "2"
=20
-DEPENDS =3D "virtual/xserver xorgproto util-macros"
+DEPENDS =3D "virtual/xserver xorgproto util-macros-native"
=20
 XORG_DRIVER_COMPRESSOR ?=3D ".tar.bz2"
 SRC_URI =3D "${XORG_MIRROR}/individual/driver/${BPN}-${PV}${XORG_DRIVER_=
COMPRESSOR}"
--=20
2.43.0


