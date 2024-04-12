Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5B2C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 16:58:45 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.51855.1712941114834191159
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 09:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=pmPb+5yf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20240412165832640fb1c12a12880a87-3cfzxk@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20240412165832640fb1c12a12880a87
        for <openembedded-core@lists.openembedded.org>;
        Fri, 12 Apr 2024 18:58:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rTXDTB4gIU/MDm/3naaz2rWjEBX1sZqmD9/9pn7BblA=;
 b=pmPb+5yf6Jjgu8z6h/UegTUfhUy7GhgeOQGgJh+mEBRuwlk6CuiY157/8DsQnX9FOlg4B6
 //8SZVJPLVBGwCCb/7ZV15gXuP9+8XKyRIGKoccisjMqJMnBb7qYfnoyupl9a4U/Gfxktx9S
 wRjQtX2XiffYtg/AijregxyecXvrM=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 0/3] kbd: update-license
Date: Fri, 12 Apr 2024 18:57:11 +0200
Message-Id: <20240412165714.8951-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 16:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198178

kbd consists of many parts with different licenses which
are not properly documented/handled.

This series tries to fix the most problematic issues,
which are non-commercial and gpl-3 licenses.

Peter Marko (3):
  kbd: split gpl-3 keymap to separate package
  kbd: remove non-free Agafari fonts
  kbd: update license

 .../0001-Remove-non-free-Agafari-fonts.patch  | 336 ++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.6.4.bb            |  24 +-
 2 files changed, 356 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/kbd/kbd/0001-Remove-non-free-Agafari-fonts.patch

-- 
2.30.2


