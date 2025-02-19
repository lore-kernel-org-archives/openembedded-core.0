Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ABAC021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 17:41:45 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.28800.1739986900043738956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 09:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=bMGkdrEr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250219174137678ac31ce9ba6b98ed-e9oe3k@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250219174137678ac31ce9ba6b98ed
        for <openembedded-core@lists.openembedded.org>;
        Wed, 19 Feb 2025 18:41:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KNmFSzZXOzckuEd3d760wgUhzG4LlmcwfR8Oq0XpKFM=;
 b=bMGkdrErP3IENbL6qh7JM158w4Agdm0iiGgy0Ker3klUdYGtXuDi7gAPtvSNp6XznxTwFs
 xekvxRQCZTe7rzFWmCvIdrnx6zYWB2HtdtPpjTxkJqT1Ktac+9/cgTT9OfzI1a2c0Y1mZAEr
 ys6/+urvOefHvk1gUFD2JaiQC31jblIfV7a3kg5Tr5E5Wja2Ew1Mc7PSM5M6Z57A3OwcqXqB
 zXOBSWDC5DGGMVfUNSEi+mBrdz8ZXT1qbtqnYHxVPoDhjAk0dKASIi+VV2Oe3bn7J+QOuVFT
 T3XNAq1IuTrdNbsKTw1Ol48XP2bnPAzrWFUVMdU0IuAW1C/ZXRxEFYCg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] libsass: fix fetched commit hash
Date: Wed, 19 Feb 2025 18:40:28 +0100
Message-Id: <20250219174028.3486899-2-peter.marko@siemens.com>
In-Reply-To: <20250219174028.3486899-1-peter.marko@siemens.com>
References: <20250219174028.3486899-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 17:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211722

From: Peter Marko <peter.marko@siemens.com>

Old commit hash is for v3.6.5, not v3.6.6.
https://github.com/sass/libsass/tags
Old version contains several vulnerabilities.

Note that exact recipe copy of recipe introduced in oe-core was never
present in oe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sass/libsass_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sass/libsass_git.bb b/meta/recipes-support/sass/libsass_git.bb
index 295a2b059f..f0824944b9 100644
--- a/meta/recipes-support/sass/libsass_git.bb
+++ b/meta/recipes-support/sass/libsass_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 inherit autotools
 
 SRC_URI = "git://github.com/sass/libsass.git;branch=master;protocol=https"
-SRCREV = "f6afdbb9288d20d1257122e71d88e53348a53af3"
+SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
 PV = "3.6.6"
 
 S = "${WORKDIR}/git"

