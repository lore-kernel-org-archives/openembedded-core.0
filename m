Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336FDC67861
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:36 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.6343.1748939070216158633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=DSUseYWf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2025060308243028cd3f1b14bedccf51-ixbyrk@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025060308243028cd3f1b14bedccf51
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3zvRgT4QP3AMpc0B0j/0VGgFWJha5CHpqx72ZLhCOFw=;
 b=DSUseYWfw5QMe28YP4uPmSU4jFGGCr4TDJYg+RohGCkLSbMPx9tgoYBhVYXcMXxSNJhdif
 5pBB44Cirh+Yrd2GZxlcIZ+VK6s9aGCbZtVEM3cXfQ5z8cO9Y1acV6d3gesnZXbp0NG6F6fI
 Im2SiJx6ZZf4F8VN8ZZmvZ2/ae8tkgwRLRqZ06Obpazdlp8fOJT6Nzl1K3mXdGt6JFgD9myI
 MEgKkhymCQjEF3wjzUoSOAavIlhv07X+5i8LZhhxWeWxY8g+BhTfomaxR1cTuQBxt0KyPzL2
 x9R8h0h4U8o89zmPVz9Ub1pPLQUjPqGKA0bYJRm4CJBonmpt55DdB+sA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 07/20] maintainers: add myself for kernel-signing-keys-native
Date: Tue,  3 Jun 2025 10:23:18 +0200
Message-ID: <20250603082419.409564-8-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217768

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


