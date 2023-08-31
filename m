Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A555FC83F32
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 11:22:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14410.1693480974616695930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 04:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 910D1139F;
	Thu, 31 Aug 2023 04:23:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4CD323F64C;
	Thu, 31 Aug 2023 04:22:53 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 3/3] inetutils: remove obsolete cruft from do_configure
Date: Thu, 31 Aug 2023 12:22:50 +0100
Message-Id: <20230831112250.124688-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831112250.124688-1-ross.burton@arm.com>
References: <20230831112250.124688-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186972

From: Ross Burton <ross.burton@arm.com>

glob/ doesn't exist and the other files are copied by autotools.bbclass

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/inetutils/inetutils_2.4.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/=
recipes-connectivity/inetutils/inetutils_2.4.bb
index a84fed1fbb8..957f1feac60 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -64,10 +64,6 @@ ERROR_QA:remove =3D "unknown-configure-option"
=20
 do_configure:prepend () {
     export HELP2MAN=3D'true'
-    cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/con=
fig.rpath
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${=
S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-    rm -f ${S}/glob/configure*
 }
=20
 do_install:append () {
--=20
2.34.1


