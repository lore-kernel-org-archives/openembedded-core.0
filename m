Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756E0C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:04:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39295.1753891432536934687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DB121BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B98173F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/13] python3-pdm: use new python_pdm class
Date: Wed, 30 Jul 2025 17:03:37 +0100
Message-ID: <20250730160343.4053614-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221128

Instead of using the setuptoools class but not using setuptools, use the
new python_pdm class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pdm_2.25.4.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb b/meta/re=
cipes-devtools/python/python3-pdm_2.25.4.bb
index 1e25e189742..da77ed8f6c6 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2eb31a2cc1a75=
8c34b499f287dd04ef2"
=20
 SRC_URI[sha256sum] =3D "bd655d789429928d6e27ff6693c19c82bc81aa75ba51d7b1=
c6102d039c8f211c"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_pdm
=20
 DEPENDS +=3D " \
-    python3-pdm-backend-native \
     python3-pdm-build-locked-native \
 "
=20
--=20
2.43.0


