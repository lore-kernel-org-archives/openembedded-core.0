Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2007C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 15:28:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13000.1790090883162346586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 08:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nUKB9Fvx;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 954B31576
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 08:27:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF90F3F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790090882; bh=Dp+UWaMVcxfH5cvwXhiXfmCoVylcOcJtcFjuQEY7zbo=;
	h=From:To:Subject:Date:From;
	b=nUKB9Fvxy83TRL+xz8HUpCJBakkxe5xF1BM/8g2FV8byxf4eZkes8fvOQ16xE8Fl3
	 k6RTSYmuq8OmtxqyfF+hR2BQtYWVCWnZaZRfmmOgzQCK9RU95+mt0eYiZhUOytJEWQ
	 3TcukttX5zeCarZAr5qxFtUkR5h0rIYqK7PFPkGc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gtk4: remove obsolete -Wno-error=int-conversion
Date: Tue, 22 Sep 2026 16:27:57 +0100
Message-ID: <20260922152757.3496350-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 15:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246422

The relevant code was fixed in "vulkan: Don't treat Vulkan objects as
pointers or 32bit breaks", which was merged in 4.22.0.

[1] https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/9170

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gtk+/gtk4_4.22.5.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.22.5.bb
index 5d7385d29ad..cf0ea114e08 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
@@ -74,10 +74,6 @@ PACKAGECONFIG[gstreamer] =3D "-Dmedia-gstreamer=3Denab=
led,-Dmedia-gstreamer=3Ddisabled
 PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tin=
ysparql,localsearch"
 PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled, vulka=
n-loader vulkan-headers shaderc-native"
=20
-# Disable int-conversion warning as error until [1] is fixed
-# [1] https://gitlab.gnome.org/GNOME/gtk/-/issues/6033
-CFLAGS +=3D "-Wno-error=3Dint-conversion"
-
 LIBV =3D "4.0.0"
=20
 FILES:${PN}:append =3D " \
--=20
2.43.0


