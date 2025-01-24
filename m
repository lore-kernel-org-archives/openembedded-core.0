Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A372FC02193
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:29:04 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web11.16101.1737735493591743833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 08:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=TFAgfRpP;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hB5cc7lyEA7NpwtFp6k+Q9fUg8GlxoRHT9/iFQ0eniY=; b=TFAgfRpPITZK65ayRTEmMRdrxo
	EYjQoQUsrWLOri1f/n32+XYS1+TdR30Ga03YZvdutbzPvwMgWPdMpf2me5FC30qCm5lc2TVsBgwlP
	ppMh32mPcuD5Xv3g7KV0/gi7/1gyDkppRkmZ0MHqhsKyKuplNNbQdSB2c3jBic+gX91Jh2pjQ+jBJ
	tRSdgpX9wKGI4utcHq8jxWSeZG9O3SuiVqjy7aEElZIzq66Esq8+ERrop3HKy84GMzhxLqe49QsG4
	e1osf0sBpnhkZvTs7Xekcn55uti0lX6CrxH97+WMAocBFdwaplfAaPSRf40CCsTqht+Tm+iMKf4kV
	t4BV9pIg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tbMNn-009TSd-QS; Fri, 24 Jan 2025 16:18:12 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] util-linux: Document more specific BSD-4-Clause-UC
Date: Fri, 24 Jan 2025 17:17:51 +0100
Message-ID: <20250124161751.13839-5-bage@debian.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250124161751.13839-1-bage@debian.org>
References: <20250124161751.13839-1-bage@debian.org>
MIME-Version: 1.0
X-Debian-User: bage
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210241

LIC_FILES_CHKSUM in the util-linux recipe already contains the more
specific license reference BSD-4-Clause-UC that takes a copyright
addendum by University of California into account.

License-Update: reference can be more specific

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1dc30c0535..56162ab147 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,7 +6,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
+LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT"
 LICENSE:${PN}-fcntl-lock = "MIT"
 LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"

