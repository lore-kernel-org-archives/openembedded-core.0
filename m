Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E1CC624DA
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:11:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15054.1788361857030080604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=oy2Djh1I;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6108165C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1071C3F673
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788361856; bh=xKJIStAw9imwRKPeNvEXlNeYNxlKQ++mj2hPsHM26mg=;
	h=From:To:Subject:Date:From;
	b=oy2Djh1IcUlSApre65vc0Kjo/ykGXLFB6AQeamRwY5iJsO/YzJ8KMMPK2h+tfRc0T
	 d5GUy2vaa2YXUawJHFDCWEK7qDHWr+c54twbjnzoaDvuLy6lQ4eTPeQLXgMQ7qYyYP
	 owavis/a+vfVmfaALy/cFQToFkRCcXj8Nvun6F64=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] libxcb: add explicit util-macros-native dependency
Date: Wed,  2 Sep 2026 16:10:45 +0100
Message-ID: <20260902151051.159953-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244966

This recipe needs util-macros, but currently this comes in via target
transient dependencies.  Explicitly depend on util-macros-native so it
is always present.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb b/meta/recip=
es-graphics/xorg-lib/libxcb_1.17.0.bb
index fcd8aad3036..0e7538cda5c 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] =3D "599ebf9996710fea71622e6e184f3a8=
ad5b43d0e5fa8c4e407123c88a5
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-DEPENDS =3D "xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
+DEPENDS =3D "util-macros-native xcb-proto xorgproto libxau libpthread-st=
ubs libxdmcp"
=20
 PACKAGES_DYNAMIC =3D "^${PN}-.*"
=20
--=20
2.43.0


