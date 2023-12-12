Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9C3C35274
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:09:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2355.1702390155653875307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC841474;
	Tue, 12 Dec 2023 06:10:01 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E1A693F738;
	Tue, 12 Dec 2023 06:09:14 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/9] autotools: append to EXTRA_AUTORECONF
Date: Tue, 12 Dec 2023 14:08:14 +0000
Message-Id: <20231212140820.2900963-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212140820.2900963-1-ross.burton@arm.com>
References: <20231212140820.2900963-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192196

From: Ross Burton <ross.burton@arm.com>

Inherit order may mean that this class is inherited after assignments,
so extend instead of assign EXTRA_AUTORECONF.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
index 1663307b061..12881a31ec9 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -37,7 +37,7 @@ inherit siteinfo
 export CONFIG_SITE
=20
 acpaths ?=3D "default"
-EXTRA_AUTORECONF =3D "--exclude=3Dautopoint --exclude=3Dgtkdocize"
+EXTRA_AUTORECONF +=3D "--exclude=3Dautopoint --exclude=3Dgtkdocize"
=20
 export lt_cv_sys_lib_dlsearch_path_spec =3D "${libdir} ${base_libdir}"
=20
--=20
2.34.1


