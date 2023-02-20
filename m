Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A754C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:55:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18572.1676912134756260093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B580015BF;
	Mon, 20 Feb 2023 08:56:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28EB43F703;
	Mon, 20 Feb 2023 08:55:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 2/3] python3-iniconfig: add BBCLASSEXTEND
Date: Mon, 20 Feb 2023 16:55:28 +0000
Message-Id: <20230220165529.374011-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220165529.374011-1-ross.burton@arm.com>
References: <20230220165529.374011-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177445

Needed to build a native python3-pytest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb b/me=
ta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
index ca50ebbc352..2abeec62f4c 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
@@ -9,3 +9,5 @@ SRC_URI[sha256sum] =3D "2d91e135bf72d31a410b17c16da610a82=
cb55f6b0477d1a902134b24a4
 DEPENDS +=3D "python3-hatch-vcs-native"
=20
 inherit pypi python_hatchling
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


