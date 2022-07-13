Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905C2C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:28:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1.1657729708937501790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C6F415A1;
	Wed, 13 Jul 2022 09:28:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E85C13F792;
	Wed, 13 Jul 2022 09:28:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 7/8] python3-hatchling: remove PEP517_BUILD_API
Date: Wed, 13 Jul 2022 17:28:20 +0100
Message-Id: <20220713162821.974801-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713162821.974801-1-ross.burton@arm.com>
References: <20220713162821.974801-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167971

Now that we're using picobuild, hatchling can bootstrap itself.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-hatchling_1.5.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.5.0.bb b/me=
ta/recipes-devtools/python/python3-hatchling_1.5.0.bb
index e453dbdcf75..61b3e87b925 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.5.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.5.0.bb
@@ -10,10 +10,6 @@ DEPENDS:remove:class-native =3D "python3-hatchling-nat=
ive"
=20
 SRC_URI[sha256sum] =3D "9ca409a41140cc662164680b78adcd3ba77b23a945984bd9=
970d11fe38e86a38"
=20
-# Until we have a proper tool to invoke PEP517 builds, hatchling can't
-# bootstrap itself automatically.
-PEP517_BUILD_API =3D "hatchling.ouroboros"
-
 do_compile:prepend() {
     export PYTHONPATH=3Dsrc
 }
--=20
2.34.1


