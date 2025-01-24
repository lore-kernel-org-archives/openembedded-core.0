Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A39C02190
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:29:04 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web10.16314.1737735493279545098
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 08:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=R3fgz6en;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SuGmbMoPWq7Pntmyz/m/kRDPrBVu1Z2GNuUyXS/OxnY=; b=R3fgz6endKzcbPQseRoPYIoYVr
	soszwnlbDLmHaFkZ8iyCS+erZoth5x1XLevcw9TJkM3Jx/Gx7HPum8+CBiVsqBUdNoTRfjzHp8aEG
	7XvL64Jtal4ff39nn0dFRVa8jVRGu2Sm//tPqhBqNP+inXgKMvyJXzD2xN7yp/Aee4INl3BR3M7BF
	W+1yiCMeqO6KyN7/q8tazDBhrhwLJEp+ojUV59COPedk+Dq7mYtzp86CPVPGE2bb2ffRVsE/r8zTJ
	FO3yHw9smYyMctOPyDwX3FcoG1b7hCK7gP51dxN+sJ7oWi4pvB91UINXDJyqTpi48rKh7CQgcsc5B
	oS459oRg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tbMNn-009TSd-DY; Fri, 24 Jan 2025 16:18:11 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] man-pages: Document more specific BSD-4-Clause-UC
Date: Fri, 24 Jan 2025 17:17:50 +0100
Message-ID: <20250124161751.13839-4-bage@debian.org>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210239

LIC_FILES_CHKSUM in the man-pages recipe already contains the more
specific license reference BSD-4-Clause-UC that takes a copyright
addendum by University of California into account.

License-Update: reference can be more specific

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/recipes-extended/man-pages/man-pages_6.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.9.1.bb b/meta/recipes-extended/man-pages/man-pages_6.9.1.bb
index ba1a6c16c4..8258874dd7 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.9.1.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.9.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
-LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
+LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT"
 
 LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
                     file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \

