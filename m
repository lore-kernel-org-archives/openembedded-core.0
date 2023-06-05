Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE94C77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:52:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8293.1685973164668956877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 06:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4F8F152B;
	Mon,  5 Jun 2023 06:53:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFD9B3F663;
	Mon,  5 Jun 2023 06:52:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/4] gtk+3: upgrade 3.24.37 -> 3.24.38
Date: Mon,  5 Jun 2023 14:52:39 +0100
Message-Id: <20230605135241.2568169-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605135241.2568169-1-ross.burton@arm.com>
References: <20230605135241.2568169-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 13:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182382

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.37.bb =3D> gtk+3_3.24.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.37.bb =3D> gtk+3_3.24.38.bb} =
(86%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.38.bb
similarity index 86%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
index 1f01cf549c5..37fa0a7290d 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
@@ -5,7 +5,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+=
-${PV}.tar.xz \
            file://opengl.patch \
            "
-SRC_URI[sha256sum] =3D "6745f0b4c053794151fd0f0e2474b077cccff5f83e9dd1bf=
3d39fe9fe5fb7f57"
+SRC_URI[sha256sum] =3D "ce11decf018b25bdd8505544a4f87242854ec88be054d9ad=
e5f3a20444dd8ee7"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.34.1


