Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45650C71135
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:34 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.44201.1748851049229045032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=mJoKDZdc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-2025060207572620e3a5e68f5dafee8a-u6x3wq@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025060207572620e3a5e68f5dafee8a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Jun 2025 09:57:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3zvRgT4QP3AMpc0B0j/0VGgFWJha5CHpqx72ZLhCOFw=;
 b=mJoKDZdcZ4BPNeaDbbta/KYBUjCxOrG9YPl3rE35bdeLkTwj/yTYQbeyFGtbl0slohWXI6
 2cmAjdms6QFj09UQ1DMe36wnhCyg9mKZITcdLN9MV48+lapBiPjMXvBbUF7IsqYhHOEvBvma
 mrZRTy3miWTKw25UVoOlq6v80zXzk4LF1fwuL992NClUd9OG4TcVkQXKLgvVdZJdcT0j4Qxa
 kg4BhyHRRIiiCBJ4hl9oix6ZmJdmnPgD0sHw0M18+lcOYVVXjw9UWj5IR4kVsOYC/RKynvd/
 5YpQsImU1YnTtwHL6X6EahZ7E07YpSNotsaUv2SZ8v0TviPLa8bUHCbg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6 07/21] maintainers: add myself for kernel-signing-keys-native
Date: Mon,  2 Jun 2025 09:56:17 +0200
Message-ID: <20250602075714.32122-8-adrian.freihofer@siemens.com>
In-Reply-To: <20250602075714.32122-1-adrian.freihofer@siemens.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 07:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217694

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8627f72ce77..470e63af079 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -307,6 +307,7 @@ RECIPE_MAINTAINER:pn-kbd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kea = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-kernel-signing-keys-native = "Adrian Freihofer <adrian.freihofer@siemens.com>"
 RECIPE_MAINTAINER:pn-kexec-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-keymaps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
-- 
2.49.0


