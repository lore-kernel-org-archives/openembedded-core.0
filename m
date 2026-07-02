Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A1CC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 12:30:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67932.1782995422748500018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 05:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Id40zpT0;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D06481FCD
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:30:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC8123F905
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782995422; bh=mEJqEpzMAXckeWV0CZJqE9jn6ById+EyZTBiWNzBbR4=;
	h=From:To:Subject:Date:From;
	b=Id40zpT00xpzl/Kx1aaANqnongrlIqyKkKDF9E50dnW167xiJp/XVc5/KCA5ZPwIO
	 eob1Sc3/qYSpUzw2OzZ9ebAf5adGFSTx/s1m9MQ2qxYxTb9TdpcLq5nBOuS2k2I3dh
	 J/KoomjO6YMmTXD54hsDxTFhpmU0Q8z/oA7WoCYc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: remove install-umask workaround
Date: Thu,  2 Jul 2026 13:30:17 +0100
Message-ID: <20260702123017.3840678-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 12:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240036

This workaround is no longer needed as the upstream commit that fixes
the problem is part of 3.2.0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_3.2.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/kea/kea_3.2.0.bb b/meta/recipes-co=
nnectivity/kea/kea_3.2.0.bb
index 3967f539b7f..bc3b3ce4a4d 100644
--- a/meta/recipes-connectivity/kea/kea_3.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_3.2.0.bb
@@ -24,9 +24,7 @@ SRC_URI[sha256sum] =3D "14bf695d37b65b9b1bf550fea5d0ada=
f9806c50e5419ef2a176a4b8e9a
=20
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
=20
-# install-umask can be removed when upgrading to 3.1.19 onwards
-# https://gitlab.isc.org/isc-projects/kea/-/commit/d9f332a6f36f8056a54b0=
698d4672a67aea812ba
-EXTRA_OEMESON +=3D "-Dcrypto=3Dopenssl -Drunstatedir=3D${runtimedir} -Dk=
rb5=3Ddisabled -Dnetconf=3Ddisabled --install-umask=3D0022"
+EXTRA_OEMESON +=3D "-Dcrypto=3Dopenssl -Drunstatedir=3D${runtimedir} -Dk=
rb5=3Ddisabled -Dnetconf=3Ddisabled"
=20
 INITSCRIPT_NAME =3D "kea-dhcp4-server"
 INITSCRIPT_PARAMS =3D "defaults 30"
--=20
2.43.0


