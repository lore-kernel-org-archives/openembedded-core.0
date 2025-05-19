Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368DFC3ABD8
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:09:03 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.48593.1747652938203955123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=aZy8CL4I;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250519110855b464b11f0fe5c04bf4-iyj2qn@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250519110855b464b11f0fe5c04bf4
        for <openembedded-core@lists.openembedded.org>;
        Mon, 19 May 2025 13:08:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QFAc+S7SVjqV2ao2AcN9QUJoObErPlU6v8Mjuz+NHS8=;
 b=aZy8CL4IeO1GqbK/eaJWCY22AtyZDorT6pGHX37r2ai7qQAJat6LDgTqz2ncjFkkQjIglj
 QtnQ14AS/j5+qxKzvs5HJDbYkhYR6ApdC7ShnenEFMu+H4byl/ypnseHpNNVsfp2I5b3dh+o
 qvIcKh0urN/N7KnHaJMa901Sp75glz+A21c3OHZ7n/235HvEYonf7JvucbSuV04LRD3NiFNe
 RCaJg6KEciailPfDgcVzkE7smvY9sdOj2vLMKNk41TayD2Cegfm8xftsNSX8ryxQw/3Am9c7
 aor3d2sFa9zeO/xtrpetKvfvfBosmvxvC5XLgBlFuLCv/3S1l1AbzIJA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 08/16] maintainers: add myself for linux-yocto-fitimage
Date: Mon, 19 May 2025 13:07:52 +0200
Message-ID: <20250519110838.82978-9-adrian.freihofer@siemens.com>
In-Reply-To: <20250519110838.82978-1-adrian.freihofer@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216837

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c19e306cfa..d7d157af4fe 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -471,6 +471,7 @@ RECIPE_MAINTAINER:pn-libxxf86vm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libyaml = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-lighttpd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-linux-dummy = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-linux-yocto-fitimage = "Adrian Freihofer <adrian.freihofer@siemens.com>"
 RECIPE_MAINTAINER:pn-linux-firmware = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-linux-libc-headers = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-- 
2.49.0


