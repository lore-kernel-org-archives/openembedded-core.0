Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24608CCD183
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 00:08:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.891.1759363697319127570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 17:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 40F9240CC8;
	Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2Jv1NjDY3aK; Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1E64540CC1;
	Thu,  2 Oct 2025 00:08:15 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 39077163F7B;
	Wed,  1 Oct 2025 20:08:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC PATCH 2/5] glibc: skip also on baremetal
Date: Wed,  1 Oct 2025 20:08:07 -0400
Message-Id: <20251002000810.226673-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251002000810.226673-1-denis@denix.org>
References: <20251002000810.226673-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 00:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224335

From: Denys Dmytriyenko <denys@konsulko.com>

Similar to how glibc gets skipped when building musl config, also
skip it when building baremetal config.

[YOCTO #15982]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/recipes-core/glibc/glibc-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core=
/glibc/glibc-common.inc
index 7422ede04d..30179870a9 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -21,6 +21,7 @@ ARM_INSTRUCTION_SET:armv6 =3D "arm"
 # this helps in easing out parsing for non-glibc system libraries
 #
 COMPATIBLE_HOST:libc-musl:class-target =3D "null"
+COMPATIBLE_HOST:libc-baremetal:class-target =3D "null"
=20
 PV =3D "2.42+git"
=20
--=20
2.25.1


