Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508EBC35FF1
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 11:22:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6474.1741692168878537174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 04:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CDB61762
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:22:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 243943F673
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:22:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] xserver-xorg: upgrade 21.1.15 -> 21.1.16
Date: Tue, 11 Mar 2025 11:22:42 +0000
Message-ID: <20250311112242.1750761-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311112242.1750761-1-ross.burton@arm.com>
References: <20250311112242.1750761-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 11:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212562

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix

  * CVE-2025-26594
  * CVE-2025-26595
  * CVE-2025-26596
  * CVE-2025-26597
  * CVE-2025-26598
  * CVE-2025-26599
  * CVE-2025-26600
  * CVE-2025-26601

Ref: https://lists.x.org/archives/xorg-announce/2025-February/003584.html
     https://lists.x.org/archives/xorg-announce/2025-February/003585.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../{xserver-xorg_21.1.15.bb =3D> xserver-xorg_21.1.16.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.15.bb =3D> =
xserver-xorg_21.1.16.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
index 080e6d220ed..38c81f2372d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-h=
ardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] =3D "841c82901282902725762df03adbbcd68153d4cdfb0d61df=
0cfd73ad677ae089"
+SRC_URI[sha256sum] =3D "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2d=
fcb62400471a9970"
=20
 # These extensions are now integrated into the server, so declare the mi=
gration
 # path for in-place upgrades.
--=20
2.43.0


