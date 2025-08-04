Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE25C87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 19:52:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5444.1754337164200595444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 12:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3E8A1E4D
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C7D33F5A1
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 12:52:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] glib-2.0: -dev should depend on -utils
Date: Mon,  4 Aug 2025 20:52:34 +0100
Message-ID: <20250804195237.149379-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804195237.149379-1-ross.burton@arm.com>
References: <20250804195237.149379-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221440

The -dev package should depend on -utils, as there are a number of
utilities in that package which are needed when compiling GLib-using code=
,
such as glib-genmarshal and glib-compile-resources.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index ba7763c8417..404c82ef6ef 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -157,6 +157,8 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 =3D ""
=20
 RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}"
=20
+RDEPENDS:${PN}-dev +=3D "${PN}-utils"
+
 RDEPENDS:${PN}-ptest +=3D "\
             coreutils \
             libgcc \
--=20
2.43.0


