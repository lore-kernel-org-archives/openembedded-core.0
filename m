Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B77D49C6E
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:53:58 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5995.1769759629654069887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=XQeOTdZK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-2026013007534618cb0a1dbf0002073f-zsveav@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026013007534618cb0a1dbf0002073f
        for <openembedded-core@lists.openembedded.org>;
        Fri, 30 Jan 2026 08:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=dDk2Ek9Xl32M4pr6lJjUOOxyIzHBuNxYxmziqTZ0gBc=;
 b=XQeOTdZK5YKa75OPfPu8WjaC1WTFHBE50p3H3YrxvOgUOvslaSA6y243o31f2bKqYuhCP9
 DLrqB3AR12EiSgcLz2DeAcG2kXZSLBwoOVEEj81QmWvWVioPLnhafpaWJmdlKYINJkiknWh6
 W4P+KhJS2ASYa2yZfOj2+EYXB8B2z74fpTZ9VQBZlhinwSeD+nehKz5HgYz4PB564vxmDvUi
 y2PqFbshuu8op+g/4hAmAP31qVqj0nVILGClDu+wHmIeq58V73Zh9k9zHoJSlYAHx45Lnmgn
 A5PNsULhqKOaGbO3ahDkyp5YMz9xdLnfZfJefHAyCfJO1QzrFQ6EICcw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/2] fix bug 16135 - useradd/groupadd debug output includes PATH
Date: Fri, 30 Jan 2026 08:52:30 +0100
Message-ID: <20260130075333.940897-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 07:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230184

From: Adrian Freihofer <adrian.freihofer@siemens.com>

More details are available at
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16135#add_comment

Adrian Freihofer (2):
  build-sysroots: Serialize native and target sysroot population
  build-sysroots: Add sysroot tasks to default build and remove warning

 meta/recipes-core/meta/build-sysroots.bb | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

-- 
2.52.0


