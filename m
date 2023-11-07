Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4BCC4167B
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 16:52:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15949.1699375951216528020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 08:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C50B21476;
	Tue,  7 Nov 2023 08:53:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C53D93F6C4;
	Tue,  7 Nov 2023 08:52:29 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] xwayland: upgrade to 23.2.2
Date: Tue,  7 Nov 2023 16:52:28 +0000
Message-Id: <20231107165228.35708-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 16:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190299

From: Ross Burton <ross.burton@arm.com>

e4487cae1 Bump version to 23.2.2
1e8478455 Xi/randr: fix handling of PropModeAppend/Prepend (CVE-2023-5367=
)
829a99117 Switch to libbsd-overlay
4f8a851b6 xwayland: Cancel the EI disconnect timer when freed
cc79b2a83 glamor: xv: Fix invalid accessing of plane attributes for NV12
07c18c90e xwayland: Give up on EI on setup failure
10353a01a xwayland: Add an option to enable EI portal support
4f8e209d2 xwayland/glamor/gbm: Set GBM_BO_USE_LINEAR if only LINEAR modif=
ier is supported
c9a842e60 xwayland/present: Handle NULL window_priv in xwl_present_cleanu=
p
2bd43be92 glamor: fixes GL_INVALID_ENUM errors on ES if there is no quads

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xwayland/{xwayland_23.2.1.bb =3D> xwayland_23.2.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.1.bb =3D> xwayland_=
23.2.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_23.2.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
index e97a921a961..9feac147db5 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
@@ -10,7 +10,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5df87950af51ac2c5822094553ea1=
880"
=20
 SRC_URI =3D "https://www.x.org/archive/individual/xserver/xwayland-${PV}=
.tar.xz"
-SRC_URI[sha256sum] =3D "eebc2692c3aa80617d78428bc6ec7b91b254a98214d2a70e=
997098503cd6ef90"
+SRC_URI[sha256sum] =3D "9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d=
35d5c810a22eb0a8"
=20
 UPSTREAM_CHECK_REGEX =3D "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
=20
--=20
2.34.1


