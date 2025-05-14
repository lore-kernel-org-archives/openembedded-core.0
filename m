Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BB2C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:34:33 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.109452.1747247666645110101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UXdIt5tW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202505141834237593ac73abb18cb820-8oqfev@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202505141834237593ac73abb18cb820
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:34:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=H4wf2sMsp6amx6gzS2JXrcuno55a3uCLLkOQ11Q4BT4=;
 b=UXdIt5tW5Tnqnj4s5HHngySUS7h1OVJNXWnT9efBXOAph1Xv4u7APiE0UXSDovGofTCsI5
 obPVr1N722fKmjJ2qxiewMnI0y1xatcSqMCzIyKaFE0Q2TetSrEH/GewgvT5xfeMYr1kHfoV
 hyYD6v0kg3da2QCnkk/DCvsNM8hoMWTpJ6yghSWbwaxm+FWdjvQ7hlqwpt5Bywq/qlSxEAvM
 ao2TtJ8spiB6waJMJhNV4qLtXRESvokqeArlpm8Rf38++AaoJ8/CUFprESzSLhxB9PWTOZfZ
 CQMCVk2d6BNzDw7pgnas7cjh5JCCh7sKBsvihlRQIIHITSRSapqqndog==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] dropbear: switch url to mirror
Date: Wed, 14 May 2025 20:33:35 +0200
Message-Id: <20250514183336.84167-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216520

From: Peter Marko <peter.marko@siemens.com>

Main download page is currently unavailable, switch to mirror listed in
README file of the dropbear repository and release tarballs.

This is to allow upgrade due to CVE, it should be reverted later or
maybe even not merged and feed the tarball only from Yocto mirror until
the main page is up again.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/dropbear/dropbear_2024.86.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2024.86.bb
index be246a0ccd..3b54542490 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.86.bb
@@ -12,7 +12,7 @@ DEPENDS = "zlib virtual/crypt"
 RPROVIDES:${PN} = "ssh sshd"
 RCONFLICTS:${PN} = "openssh-sshd openssh"
 
-SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
+SRC_URI = "https://dropbear.nl/mirror/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
            file://init \
            file://dropbearkey.service \

