Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0946EE936EA
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 21:43:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1155.1696455824805143781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 14:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51F15C15;
	Wed,  4 Oct 2023 14:44:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B72A3F762;
	Wed,  4 Oct 2023 14:43:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] libx11: upgrade to 1.8.7
Date: Wed,  4 Oct 2023 22:43:40 +0100
Message-Id: <20231004214341.3805882-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 21:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188701

From: Ross Burton <ross.burton@arm.com>

This incorporates fixes for the following CVEs:

- CVE-2023-43785
- CVE-2023-43786
- CVE-2023-43787

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xorg-lib/{libx11_1.8.6.bb =3D> libx11_1.8.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.6.bb =3D> libx11_1.8.7=
.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.8.7.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
index 1cfa56b21e2..5f14e62446d 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
@@ -24,7 +24,7 @@ XORG_PN =3D "libX11"
=20
 SRC_URI +=3D "file://disable_tests.patch"
=20
-SRC_URI[sha256sum] =3D "59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b=
6df0c0703fa25cc9"
+SRC_URI[sha256sum] =3D "05f267468e3c851ae2b5c830bcf74251a90f63f04dd7c709=
ca94dc155b7e99ee"
=20
 inherit gettext
=20
--=20
2.34.1


