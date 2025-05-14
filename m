Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BF6C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 19:15:33 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.110408.1747250128075340324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 12:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CIZTzEC+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202505141915258a461f3bd3ba135b6f-r05tfg@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202505141915258a461f3bd3ba135b6f
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 21:15:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=H8rx8PfRS66+NECK3ItKzkXIdFW3DfDJ52AiDk/EaiQ=;
 b=CIZTzEC+S1E/rkQAueoVjX9Qq1/zvCOxump5pX//7K82oYcoYcmK+PCcFbOe3LepihqptF
 IdXdDCIrA4RmHFWDlttXN4QUhGFAEWS4l+Y20PvzdwyVr/SCppsgaQt4KSXc5BaXuLNub/Z+
 AanEx1QQsPVkzE27mkqi2B4ss0uy6Szorl8/eupHtA3tsUD5SBy99LXXHJvzAYTazyypiP4j
 jeqU/vLBAKZjQ5DmFsqIqPhcmbHiuHCCxTBMNgXi6L9Wd8PilkbR2krwATwCzQqDn91Pv75S
 4fKBb+FdBEcBugli4RcPJ/LsNiJwV7t43kSouNAk7UDgX0Divb5BXTcQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v3 1/2] dropbear: add mirror
Date: Wed, 14 May 2025 21:14:37 +0200
Message-Id: <20250514191438.99369-1-peter.marko@siemens.com>
In-Reply-To: <20250514183336.84167-1-peter.marko@siemens.com>
References: <20250514183336.84167-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 19:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216548

From: Peter Marko <peter.marko@siemens.com>

Main download page is currently unavailable, switch to mirror listed in
README file of the dropbear repository and release tarballs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: no change
v3: use mirror instead of switching url

 meta/recipes-core/dropbear/dropbear_2024.86.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2024.86.bb
index be246a0ccd..38faaebc2a 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.86.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            "
 
 SRC_URI[sha256sum] = "e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e"
+MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \

