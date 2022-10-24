Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CC6C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:07:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20271.1666624069130110605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 08:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4DDF150C;
	Mon, 24 Oct 2022 08:07:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A4C23F792;
	Mon, 24 Oct 2022 08:07:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] xserver-xorg: ignore CVE-2022-3553 as it is XQuartz-specific
Date: Mon, 24 Oct 2022 16:07:44 +0100
Message-Id: <20221024150745.3917987-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024150745.3917987-1-ross.burton@arm.com>
References: <20221024150745.3917987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172103

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
index 057a1ba6ad4..dd741270a71 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -28,6 +28,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2011-4613"
 # impossible or difficult to exploit. There is currently no upstream pat=
ch
 # available for this flaw.
 CVE_CHECK_IGNORE +=3D "CVE-2020-25697"
+# This is specific to XQuartz, which is the macOS X server port
+CVE_CHECK_IGNORE +=3D "CVE-2022-3553"
=20
 S =3D "${WORKDIR}/${XORG_PN}-${PV}"
=20
--=20
2.34.1


