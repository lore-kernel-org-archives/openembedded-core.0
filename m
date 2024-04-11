Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1168FC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 14:11:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18916.1712844681196827829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 07:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51515339;
	Thu, 11 Apr 2024 07:11:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 631383F64C;
	Thu, 11 Apr 2024 07:11:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] eudev: update Upstream-Status on netifnames.patch
Date: Thu, 11 Apr 2024 14:11:17 +0000
Message-Id: <20240411141117.209254-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 14:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198132

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/udev/eudev/netifnames.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev/netifnames.patch b/meta/recipes=
-core/udev/eudev/netifnames.patch
index 8f6e9a1538b..4f8e54d12d4 100644
--- a/meta/recipes-core/udev/eudev/netifnames.patch
+++ b/meta/recipes-core/udev/eudev/netifnames.patch
@@ -2,7 +2,7 @@ eudev: consider ID_NET_NAME_MAC as an interface name
=20
 eudev might not create names based on slot or path.
=20
-Upstream-Status: Submitted [github.com/eudev-project/eudev/pull/274]
+Upstream-Status: Backport [github.com/eudev-project/eudev/pull/274]
=20
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
=20
--=20
2.34.1


