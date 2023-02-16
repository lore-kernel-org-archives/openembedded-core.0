Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9445C636D7
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 15:10:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12317.1676560209745388459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 07:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84C20113E;
	Thu, 16 Feb 2023 07:10:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55E6B3F703;
	Thu, 16 Feb 2023 07:10:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] python3-iniconfig: add BBCLASSEXTEND
Date: Thu, 16 Feb 2023 15:10:04 +0000
Message-Id: <20230216151005.3469200-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216151005.3469200-1-ross.burton@arm.com>
References: <20230216151005.3469200-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177292

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


