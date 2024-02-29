Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B575C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 10:49:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22001.1709203785646043874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 02:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 029591FB
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 02:50:24 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B890B3F762
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 02:49:44 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: update yocto-kernel-cache to fix CONFIG_DEBUG_CREDENTIALS warnings
Date: Thu, 29 Feb 2024 10:49:40 +0000
Message-Id: <20240229104940.928214-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196428

From: Ross Burton <ross.burton@arm.com>

Incorporate the fix for upstream removing CONFIG_DEBUG_CREDENTIALS in
the stable branch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
index 2d218692e28..beb26281215 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?=3D "e064a7d658a30b027b999183e2=
1cd37305caff2a"
 SRCREV_machine:qemux86-64 ?=3D "e064a7d658a30b027b999183e21cd37305caff2a=
"
 SRCREV_machine:qemumips64 ?=3D "52456b6cb3393c1848da3ccdae37727c31896f1c=
"
 SRCREV_machine ?=3D "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_meta ?=3D "c97276cdc9d89cceef61184e296e5c837a265ed1"
+SRCREV_meta ?=3D "229dc6171461800d7b4ab16f9c8b35a47a48897f"
=20
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the=
 same
--=20
2.34.1


