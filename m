Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EA3C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:35 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.6347.1748939074330427213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=CV1clTQl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250603082432ce58cce8ba470cd7ce-3kja10@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250603082432ce58cce8ba470cd7ce
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=U5N42MAZm3wFm16ebeKrYrGn24WVKRRwwikhYx6XnCU=;
 b=CV1clTQl9kJW3SfZMHaw0zp+GPTFZL+/lzmNhPDQr1c2p4ZJNLg5o+aeK827HDQs+t36WI
 Nn4AF5fgS5/iQS4piP3zoPtNtMWt2p+zHJHCWsLK/wmaHHSH309gx8dlvEFxbbiBf/5nPcK3
 k0QlNQ5wptkPD0IYynIBHr1xkoRoUNWI+wXdHnL4O/QmbuMY2X2Q0sefXtpJJv2BiJ3o9IuK
 WbZwRbaI6yc6ttF2juexbV9FxzXhVTXlT9wkrUzE5v28Wf8wNvYq+gMSFZ74jyPcebavL2WB
 MiWjzx6CLocrMDsEzqHCApKOfDsRi1AtFwTlYVb7oLrZBDt1+fIGH8+w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 12/20] maintainers: add myself for linux-yocto-fitimage
Date: Tue,  3 Jun 2025 10:23:23 +0200
Message-ID: <20250603082419.409564-13-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217777

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 470e63af079..5165024f503 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -472,6 +472,7 @@ RECIPE_MAINTAINER:pn-libxxf86vm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libyaml = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-lighttpd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-linux-dummy = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-linux-yocto-fitimage = "Adrian Freihofer <adrian.freihofer@siemens.com>"
 RECIPE_MAINTAINER:pn-linux-firmware = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-linux-libc-headers = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-- 
2.49.0


