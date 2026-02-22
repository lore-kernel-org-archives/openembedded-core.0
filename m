Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69036C624DE
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 12:09:28 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12184.1771762159112922843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 04:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=L9MUFUr4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260222120915ebd5a5601a00020735-dmqay_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260222120915ebd5a5601a00020735
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Feb 2026 13:09:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NEedl6HIJXH5jjwrqNUexZ4Wk/0eM218cOHas1R8xqE=;
 b=L9MUFUr4C3D9Jx9Ux+zzYyfwWLDOmd6lIBptF9FxbkLDBHrS3D3Uu2dFYColkb3pPv0lGP
 l2IBj8xPzh6qp59YT4yKPceGfRiwbdDFmHGJt0Ymh47yTsR1eX0oR5bMzB7fTagKgg6eB0J/
 ih+A/yZ6/xING6+eFpw8qctCB/381D0kf/1c/Cvg5E1gVNZJtJRq68ZEkLwCOnHyXM1xCAJ/
 04BmEgnmX+xIW52amr+noaVdV5t4ngNRMkj8N768QarmM7nVKNnZCMth/W5Njn07ifpks506
 0rPYGIZK5mR/IALypJh1uWBv+upPmZHeI4tEsJXXVdmGg/54CMUUPvUA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/2] kernel.bbclass: remove dependency on initramfs when not bundled
Date: Sun, 22 Feb 2026 13:07:34 +0100
Message-ID: <20260222120910.318167-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 12:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231629

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes in comparison to v1:
- Add one more commit to add the missing dependency on the initramfs
  to image_types_wic.bbclass when the initramfs is not bundled.
  This is needed to prevent from build failures like
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3228
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3202

Adrian Freihofer (2):
  image_types_wic.bbclass: add depend on initramfs
  kernel.bbclass: remove dependency on initramfs when not bundled

 meta/classes-recipe/image_types_wic.bbclass | 12 ++++
 meta/classes-recipe/kernel.bbclass          | 77 ++++++++++-----------
 2 files changed, 47 insertions(+), 42 deletions(-)

-- 
2.52.0


