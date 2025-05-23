Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A15C5AE59
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:29 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.44670.1747993340986507116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=IongyQV5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-2025052309421939ffe20eca5f9d4d49-twcbgt@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025052309421939ffe20eca5f9d4d49
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 May 2025 11:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0glglaHzOJfexBTcb5OhynTfJcVoqHnQ/ZApXeeXp/c=;
 b=IongyQV5CQvzCuKUN95qVJp+fRJgmGbbL4CoDafC/OMV0O3oEZ7/YpFC8ivzZnH5ZCbVW7
 kYvnjy900CP943Qx/uCE6jQV2OWRi+q5jdGcfOggsIqmbOpmqzc2zgUv/hWF4mBXiulc+pnT
 8Jvn2eLZUEUE/PQgpCxf3uZ3EQ9L/X7dr+UDnx1HOHOfuBZN/eVS7uYxirFems9C7I8HKw5c
 fplP00EOdpNVuuWpRBeLe/oSG8r64iX9RqZpvbe6m9rxFx57BU685/Xn7hBU7Do7ZPh3EoJO
 ifIjxlDUh8hayKCZl6TS5Te7bKHXJv7MCKgX0zRcHbIDPzgSpsL2MJ8A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 09/17] maintainers: add myself for linux-yocto-fitimage
Date: Fri, 23 May 2025 11:41:10 +0200
Message-ID: <20250523094152.727177-10-adrian.freihofer@siemens.com>
In-Reply-To: <20250523094152.727177-1-adrian.freihofer@siemens.com>
References: <20250523094152.727177-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217189

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9d72c110024..2cd50e5df98 100644
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


