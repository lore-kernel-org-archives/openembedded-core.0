Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61280F531D4
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 21:16:08 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3533.1776114964846942084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 14:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=OEJSimgE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026041321160260f9d2cc3800020764-_f7lw8@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026041321160260f9d2cc3800020764
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Apr 2026 23:16:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QQMMMdBQn4unY9wLqy81fG2+hKwUlU5f2YChPyizzqM=;
 b=OEJSimgEPk9EpgUIAmX7Yj5/dY61Pi54Mcb6lXg48EwGxKLecTpfnpZ0IgQiV+ZDvDTEeE
 i3fNsAobTQz0u3zFsAyFq2aZYFMa93FGRPYKK2BOZvS9KZlMEEIOwKAUdUTp1S5Q8/K73maF
 rB5F4u/ODV+65qa+Xd2x139dbTcRlHJDx2YQ3Pu6HI2pwiHvpl4UF2OtwlU07Q1wi2otbGET
 XSZ2q+G+If2Prlw1VQbNbLeYR5zcbvlxzxlnX58XIrWmG5Yj8nMgg3WVcBZZO14baREKw3Vh
 iTZdQwYrHkonHlXoTEfwHpBbajwredE5zY1ZpK3JgBJMUkNa1Xzn6iFw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/6] xdg-utils: set status for CVE-2025-52968
Date: Mon, 13 Apr 2026 23:14:42 +0200
Message-ID: <20260413211447.564257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 21:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235123

From: Peter Marko <peter.marko@siemens.com>

This CVE has tag "disputed", see [1].

[1] https://github.com/CVEProject/cvelistV5/blob/cve_2026-04-12_1800Z/cves/2025/52xxx/CVE-2025-52968.json#L91

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index 3ee320da5a..e39a65831e 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -36,3 +36,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "xmlto-native libxslt-native"
 RDEPENDS:${PN} += "xprop"
+
+CVE_STATUS[CVE-2025-52968] = "disputed"

