Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8B2C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 22:09:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1039.1667858955274066979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 14:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C5B01FB;
	Mon,  7 Nov 2022 14:09:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A15A3F703;
	Mon,  7 Nov 2022 14:09:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] populate_sdk_ext: use ConfigParser instead of SafeConfigParser
Date: Mon,  7 Nov 2022 22:09:09 +0000
Message-Id: <20221107220910.193855-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 22:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172935

SafeConfigParser was renamed to ConfigParser in 3.2, and the
SafeConfigParser alias will be removed in 3.12.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-=
recipe/populate_sdk_ext.bbclass
index 925cb313fcd..01d8a693a72 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -233,7 +233,7 @@ python copy_buildsystem () {
=20
     # Write out config file for devtool
     import configparser
-    config =3D configparser.SafeConfigParser()
+    config =3D configparser.ConfigParser()
     config.add_section('General')
     config.set('General', 'bitbake_subdir', conf_bbpath)
     config.set('General', 'init_path', conf_initpath)
--=20
2.34.1


