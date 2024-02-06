Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A31C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 19:06:55 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.1552.1707246407716978184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 11:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=F7va3mtY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2024020619064346ef2dd4a2146964ba-fkzmsk@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2024020619064346ef2dd4a2146964ba
        for <openembedded-core@lists.openembedded.org>;
        Tue, 06 Feb 2024 20:06:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=HWZ3d3gV2DvukHRfRRc8G3YZDCgLmUuu0n+0HHi+/ow=;
 b=F7va3mtYHXn+ZIvq6Ky7GMjNM3Z72thwC+w9L5oobSM54oyKu0TCyHMbwXDYQy0ifQcrP3
 UTQxJ2vP+E5ebeWL+yUz3iIoOitcRehbU4/G66EZ+To+TITg8hAXCgxz2wFjwP36uWhBwRZX
 Zy03ujsprA8IlwRMn4QBP7R9086PQ=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] util-linux: add alternative link for scriptreplay
Date: Tue,  6 Feb 2024 20:05:55 +0100
Message-Id: <20240206190555.1928753-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 19:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195021

From: Peter Marko <peter.marko@siemens.com>

This utility conflicts with script from busybox with rich
configuration.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux_2.39.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
index 9fd3a5f525..3e87dcc2c2 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -255,6 +255,7 @@ ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 ALTERNATIVE_LINK_NAME[rtcwake] = "${sbindir}/rtcwake"
+ALTERNATIVE_LINK_NAME[scriptreplay] = "${bindir}/scriptreplay"
 ALTERNATIVE_LINK_NAME[setpriv] = "${bindir}/setpriv"
 ALTERNATIVE_LINK_NAME[setsid] = "${bindir}/setsid"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
-- 
2.30.2


