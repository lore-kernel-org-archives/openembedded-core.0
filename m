Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5046C49EA1
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45929.1721746303130381360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 424511476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 67E033F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/37] python3-jsonschema: rename nongpl PACKAGECONFIG
Date: Tue, 23 Jul 2024 15:51:02 +0100
Message-Id: <20240723145137.74198-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202369

To make it clear that this is an alternative to the format PACKAGECONFIG,
rename it to format-nongpl.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb b/=
meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
index c3184396d29..95afc1ead20 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[format] =3D ",,,\
     python3-rfc3987 \
     python3-rfc3339-validator \
 "
-PACKAGECONFIG[nongpl] =3D ",,,\
+PACKAGECONFIG[format-nongpl] =3D ",,,\
     python3-idna \
     python3-jsonpointer \
     python3-webcolors \
--=20
2.34.1


