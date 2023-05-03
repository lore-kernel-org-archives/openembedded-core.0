Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1609C7EE22
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:52:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18217.1683118367462232769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5205DC14;
	Wed,  3 May 2023 05:53:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9521B3F5A1;
	Wed,  3 May 2023 05:52:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] spirv-tools: remove redundant python3native inherit
Date: Wed,  3 May 2023 13:52:43 +0100
Message-Id: <20230503125244.3063552-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503125244.3063552-1-ross.burton@arm.com>
References: <20230503125244.3063552-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180821

Python is needed at build-time, but the host Python is sufficient.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb b/meta/r=
ecipes-graphics/spir/spirv-tools_1.3.243.0.bb
index 44ffc72b08d..c57acc5a116 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
@@ -17,7 +17,7 @@ PE =3D "1"
 UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
 S =3D "${WORKDIR}/git"
=20
-inherit cmake python3native
+inherit cmake
=20
 DEPENDS =3D "spirv-headers"
=20
--=20
2.34.1


