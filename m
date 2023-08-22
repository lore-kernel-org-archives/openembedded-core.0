Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2562AEE49A3
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 17:00:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1525.1692723642811864763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 10:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F53B11FB;
	Tue, 22 Aug 2023 10:01:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 702043F762;
	Tue, 22 Aug 2023 10:00:39 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/5] perf: enable verbose feature detection
Date: Tue, 22 Aug 2023 18:00:14 +0100
Message-Id: <20230822170018.315470-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 17:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186513

From: Ross Burton <ross.burton@arm.com>

Having verbose feature detection is helpful to see exactly what has been
enabled or disabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index 7d90ac3612f..68d59f69c7d 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -73,6 +73,7 @@ LDFLAGS=3D"-ldl -lutil"
=20
 EXTRA_OEMAKE =3D '\
     V=3D1 \
+    VF=3D1 \
     -C ${S}/tools/perf \
     O=3D${B} \
     CROSS_COMPILE=3D${TARGET_PREFIX} \
--=20
2.34.1


