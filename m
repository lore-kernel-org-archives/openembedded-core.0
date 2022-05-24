Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D42AC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 11:44:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8369.1653392691024549090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 04:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDE361FB;
	Tue, 24 May 2022 04:44:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6ABD3F73D;
	Tue, 24 May 2022 04:44:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] python3-iniconfig: add BBCLASSEXTEND for native and
 nativesdk
Date: Tue, 24 May 2022 12:44:41 +0100
Message-Id: <20220524114442.1166085-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 11:44:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166058

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/me=
ta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
index 4643437b800..05ce088335f 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] =3D "bc3af051d7d14b2ee5ef9969666def0=
cd1a000e121eaea580d4a313df4
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
 inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


