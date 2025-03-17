Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA1AC35FFA
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:09:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.58562.1742231334179052410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 788101688
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:09:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3CEA23F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:08:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/5] libcap: remove redundant FILES:PN-dev
Date: Mon, 17 Mar 2025 17:08:44 +0000
Message-ID: <20250317170848.4153724-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317170848.4153724-1-ross.burton@arm.com>
References: <20250317170848.4153724-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213112

base_libdir/*.so is part of the default assignment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libcap/libcap_2.74.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.74.bb b/meta/recipes-su=
pport/libcap/libcap_2.74.bb
index ee3605e3a09..c2738533799 100644
--- a/meta/recipes-support/libcap/libcap_2.74.bb
+++ b/meta/recipes-support/libcap/libcap_2.74.bb
@@ -68,8 +68,6 @@ do_install:append() {
 	fi
 }
=20
-FILES:${PN}-dev +=3D "${base_libdir}/*.so"
-
 # pam files
 FILES:${PN} +=3D "${base_libdir}/security/*.so"
=20
--=20
2.43.0


