Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C59C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:50:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7304.1788267003455033182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=RlhYt8PU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E76611756
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 05:49:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 44B6D3F85F
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 05:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788267002; bh=OFb9Hfy9tTSmCAcatI/WjaxEjWSaeDdHwYVKiyzZGAw=;
	h=From:To:Subject:Date:From;
	b=RlhYt8PU5mDSO9PctpbNb4sY/3qj3zdNjWkL8D4PJwlWshYHpkrJtuJdJ95uLOqcu
	 UsFLD3DtZ6x48lUxVnvA2WwvjN2Brn+Cik6v6LvGxy4HNrrafiBLkxsxcQs0M/6spw
	 2SyPpJ488Z0IHdJttTPFMf0doKHEA8fD1dD16ZFw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-mako: remove redundant python3-wheel-native dependency
Date: Tue,  1 Sep 2026 13:49:58 +0100
Message-ID: <20260901124958.2528193-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244827

This build dependency was removed in the 1.4.0 release[1].

[1] https://github.com/sqlalchemy/mako/commit/1e439f6178f92db7c5c45eea37e=
c4319eeda345d

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-mako_1.4.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-mako_1.4.1.bb b/meta/re=
cipes-devtools/python/python3-mako_1.4.1.bb
index fb989cb21c5..90d303e84be 100644
--- a/meta/recipes-devtools/python/python3-mako_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.4.1.bb
@@ -12,8 +12,6 @@ SRC_URI[sha256sum] =3D "d7904710b662996425a21627710c477=
7c45053146942cf8a7aebf757c9
=20
 CVE_PRODUCT =3D "makotemplates:mako sqlalchemy:mako"
=20
-DEPENDS +=3D "python3-wheel-native"
-
 RDEPENDS:${PN} =3D "python3-html \
                   python3-markupsafe \
                   python3-misc \
--=20
2.43.0


