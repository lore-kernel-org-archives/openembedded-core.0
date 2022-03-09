Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA941C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:06:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.2080.1646841969435243144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0673E168F
	for <openembedded-core@lists.openembedded.org>;
 Wed,  9 Mar 2022 08:06:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A77163F7F5
	for <openembedded-core@lists.openembedded.org>;
 Wed,  9 Mar 2022 08:06:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-scons: remove redundant FILES:${PN}-doc
Date: Wed,  9 Mar 2022 16:06:06 +0000
Message-Id: <20220309160606.2663760-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 16:06:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162969

mandir is in the default FILES:${PN}-doc, so there's no need to add it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-scons_4.3.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-scons_4.3.0.bb b/meta/r=
ecipes-devtools/python/python3-scons_4.3.0.bb
index 624f974805..ae91d980fe 100644
--- a/meta/recipes-devtools/python/python3-scons_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.3.0.bb
@@ -28,7 +28,6 @@ do_install:append() {
     install -d ${D}${mandir}/man1
     mv ${D}${prefix}/scons*.1 ${D}${mandir}/man1/
 }
-FILES:${PN}-doc +=3D "${mandir}/man1/scons*.1"
=20
 do_install:append:class-native() {
     create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR=3D'${STAGING_DIR_HO=
ST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE=3D'1'
--=20
2.25.1


