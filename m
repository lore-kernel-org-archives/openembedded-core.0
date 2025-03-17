Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDC5C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:52:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51490.1742215924635858895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2036E1688
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:52:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC02D3F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:52:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] common-licenses/OASIS: remove unused license
Date: Mon, 17 Mar 2025 12:51:59 +0000
Message-ID: <20250317125159.3675476-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317125159.3675476-1-ross.burton@arm.com>
References: <20250317125159.3675476-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213088

This isn't a common license as it's the DocBook v4 XML DTD license, and
that is now part of the recipe itself.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/files/common-licenses/OASIS | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta/files/common-licenses/OASIS

diff --git a/meta/files/common-licenses/OASIS b/meta/files/common-license=
s/OASIS
deleted file mode 100644
index f93df7af270..00000000000
--- a/meta/files/common-licenses/OASIS
+++ /dev/null
@@ -1,13 +0,0 @@
-  Permission to use, copy, modify and distribute the DocBook DTD and
-  its accompanying documentation for any purpose and without fee is
-  hereby granted in perpetuity, provided that the above copyright
-  notice and this paragraph appear in all copies.  The copyright
-  holders make no representation about the suitability of the DTD for
-  any purpose.  It is provided "as is" without expressed or implied
-  warranty.
-
-  If you modify the DocBook DTD in any way, except for declaring and
-  referencing additional sets of general entities and declaring
-  additional notations, label your DTD as a variant of DocBook.  See
-  the maintenance documentation for more information.
-
--=20
2.43.0


