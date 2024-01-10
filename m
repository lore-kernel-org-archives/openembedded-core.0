Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC848C47DA9
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 13:07:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10994.1704892053849185398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 05:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32A061007
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:08:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1E8803F64C
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:07:33 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] autotools: don't exclude gtkdocize
Date: Wed, 10 Jan 2024 13:07:24 +0000
Message-Id: <20240110130730.3698802-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110130730.3698802-1-ross.burton@arm.com>
References: <20240110130730.3698802-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193502

From: Ross Burton <ross.burton@arm.com>

gtkdocize can now be ran successfully from autoreconf, so there's no
need to exclude it and run it manually.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
index 12881a31ec9..ca76cde0e74 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -37,7 +37,7 @@ inherit siteinfo
 export CONFIG_SITE
=20
 acpaths ?=3D "default"
-EXTRA_AUTORECONF +=3D "--exclude=3Dautopoint --exclude=3Dgtkdocize"
+EXTRA_AUTORECONF +=3D "--exclude=3Dautopoint"
=20
 export lt_cv_sys_lib_dlsearch_path_spec =3D "${libdir} ${base_libdir}"
=20
--=20
2.34.1


