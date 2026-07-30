Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AE9C55172
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 19:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19038.1785438014507171459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 12:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=oC33Rwtz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2B6320E3
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B5FBB3F66F
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785438014; bh=Euso/mKlTWJLGRLHcHHc8KlNjErW+KxRLR4B0PLwSe0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oC33RwtzHd8GIta0F7pqtIsQ7OObf2Yw+zOHcWAEvVlihYsJpHdTXu8Th2WoDMwOY
	 r430oAjOduFUQGU1673UVsjGG+oxzQv+1r/+4fuQ0gnnX3KrR0T30+38Qh9iFjSNsp
	 dYEewsMKorcKi88f1xJMeeDRUhYezUO3V9seowws=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] cargo-c: add missing build dependencies
Date: Thu, 30 Jul 2026 20:00:05 +0100
Message-ID: <20260730190007.2440254-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730190007.2440254-1-ross.burton@arm.com>
References: <20260730190007.2440254-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 19:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242372

Now that we're disabling more vendoring, add missing build dependencies
for libgit2 and sqlite3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/cargo-c/cargo-c_0.10.24+cargo-0.98.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cargo-c/cargo-c_0.10.24+cargo-0.98.0.b=
b b/meta/recipes-devtools/cargo-c/cargo-c_0.10.24+cargo-0.98.0.bb
index f4caeefd655..482a34280f7 100644
--- a/meta/recipes-devtools/cargo-c/cargo-c_0.10.24+cargo-0.98.0.bb
+++ b/meta/recipes-devtools/cargo-c/cargo-c_0.10.24+cargo-0.98.0.bb
@@ -15,7 +15,7 @@ DEBUG_PREFIX_MAP +=3D "-ffile-prefix-map=3D${CARGO_HOME=
}=3D${TARGET_DBGSRC_DIR}"
=20
 inherit cargo cargo-update-recipe-crates pkgconfig
=20
-DEPENDS =3D "openssl curl"
+DEPENDS =3D "openssl curl sqlite3 libgit2"
=20
 require ${BPN}-crates.inc
=20
--=20
2.43.0


