Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95670C52D73
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45948.1721746313363168161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82A051476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B1EB83F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/37] gi-docgen: use python_poetry_core
Date: Tue, 23 Jul 2024 15:51:20 +0100
Message-Id: <20240723145137.74198-20-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202387

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb b/meta/reci=
pes-gnome/gi-docgen/gi-docgen_2023.3.bb
index 488f2663cbf..54ca5d9d078 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
@@ -14,7 +14,7 @@ SRCREV =3D "96f2e9b93e1d8a5338eb05b87fd879856ab7b3cc"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit setuptools3
+inherit python_poetry_core
=20
 RDEPENDS:${PN} +=3D "python3-asyncio python3-core python3-jinja2 python3=
-json python3-markdown python3-markupsafe python3-pygments python3-typogr=
ify python3-xml"
=20
--=20
2.34.1


