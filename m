Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB53FCAC59A
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 10:55:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16512.1758020138733345907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 03:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB5C312FC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 03:55:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A07483F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 03:55:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] packagegroup-core-base-utils: remove GNU which, busybox provides which
Date: Tue, 16 Sep 2025 11:55:32 +0100
Message-ID: <20250916105533.381404-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 10:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223542

busybox has a basic implementation of which, so there's no real need to
pull in GNU Which unless explicitly needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-core-base-utils.bb                | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base-u=
tils.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-util=
s.bb
index b17cba4a789..0a5ffac3165 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
@@ -56,6 +56,5 @@ RDEPENDS:${PN} =3D "\
     util-linux \
     ${VIRTUAL-RUNTIME_vim} \
     wget \
-    which \
     xz \
     "
--=20
2.43.0


