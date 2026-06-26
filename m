Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFD2C43211
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:13:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37266.1782486815872141220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hvrKhGhw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C14CC1F37
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:13:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E2F7E3F632
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782486815; bh=9RXjM4d9WIjoL6xqQUv8HqHt0/Ua9d6bzsurq33p8Nw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hvrKhGhww6WYQ1CTRx71db/4vENkilAj8KBR2R+h29OlFlCPb+tYBWd1yTq5g5U1J
	 nDMoBLPexTxlWz42l2DJxV6NN5se6KnVkYALNlxT2tk5p+rJC5ziCyltDJ/ZJyOxHr
	 a5WRGVTkEa060oSWfGboqVT7QJnnsYdUEygr4HFU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] shared-mime-info: remove python3native dependency
Date: Fri, 26 Jun 2026 16:13:24 +0100
Message-ID: <20260626151325.1735368-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626151325.1735368-1-ross.burton@arm.com>
References: <20260626151325.1735368-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239648

This was added in the shared-mime-info 1.15 upgrade[1] with no rationale,
I suspect it was for itstool-native which is no longer used[2]. At least,
none of the dependencies would need python3-native over the host python3.

[1] oe-core 09ef7f8e4b9 ("shared-mime-info: upgrade 1.10 -> 1.15")
[2] oe-core 8ca8687b336 ("shared-mime-info: drop itstool-native from DEPE=
NDS")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.b=
b b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index f307aca35dd..f27061d5d1a 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/xdg/shared-mi=
me-info.git;protocol=3Dhttps;
            file://0002-Handle-build-with-older-versions-of-GCC.patch"
 SRCREV =3D "9a6d6b8e963935f145f3a1ef446552de6996dada"
=20
-inherit meson pkgconfig gettext python3native mime
+inherit meson pkgconfig gettext mime
=20
 EXTRA_OEMESON =3D " \
                  -Dupdate-mimedb=3Dtrue \
--=20
2.43.0


