Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB19E784AF
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:23:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78311.1696242205172269758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 03:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAB61DA7;
	Mon,  2 Oct 2023 03:24:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0821E3F762;
	Mon,  2 Oct 2023 03:23:23 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] python3-numpy: remove unused CLEANBROKEN
Date: Mon,  2 Oct 2023 11:23:20 +0100
Message-Id: <20231002102320.3692433-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002102320.3692433-1-ross.burton@arm.com>
References: <20231002102320.3692433-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 10:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188596

From: Ross Burton <ross.burton@arm.com>

CLEANBROKEN isn't used by setuptools3, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-numpy_1.26.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb b/meta/=
recipes-devtools/python/python3-numpy_1.26.0.bb
index 3ae40a33fb4..92785d00a65 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
@@ -24,8 +24,6 @@ inherit ptest setuptools3 github-releases
=20
 S =3D "${WORKDIR}/numpy-${PV}"
=20
-CLEANBROKEN =3D "1"
-
 do_compile:prepend() {
     export NPY_DISABLE_SVML=3D1
 }
--=20
2.34.1


