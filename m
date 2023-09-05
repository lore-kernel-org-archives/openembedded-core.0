Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CBBC83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 13:18:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20946.1693919884739092877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 06:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4015D11FB;
	Tue,  5 Sep 2023 06:18:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABF4E3F67D;
	Tue,  5 Sep 2023 06:18:03 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] python3-build: upgrade to 1.0.0
Date: Tue,  5 Sep 2023 14:18:01 +0100
Message-Id: <20230905131801.1266059-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 13:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187213

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/{python3-build_0.10.0.bb =3D> python3-build_1.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_0.10.0.bb =3D> python=
3-build_1.0.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-build_0.10.0.bb b/meta/=
recipes-devtools/python/python3-build_1.0.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-build_0.10.0.bb
rename to meta/recipes-devtools/python/python3-build_1.0.0.bb
index b446fa391d5..7944bb0b264 100644
--- a/meta/recipes-devtools/python/python3-build_0.10.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/pypa/build"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b0fb4780b2ad6907c2=
56c"
=20
-SRC_URI[sha256sum] =3D "d5b71264afdb5951d6704482aac78de887c80691c52b88a9=
ad195983ca2c9269"
+SRC_URI[sha256sum] =3D "49a60f212df4d9925727c2118e1cbe3abf30b393eff7d0e7=
287d2170eb36844d"
=20
 inherit pypi python_flit_core
=20
--=20
2.34.1


