Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8EFCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 21:13:09 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.1284.1759871582267830871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 14:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=l26dOalC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251007211258bc4572ad3200020700-9pudzc@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251007211258bc4572ad3200020700
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Oct 2025 23:12:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RKrOgWyEGIX1AlD8eEvRqtJ6F1Zj570t/kG+7jVbOYg=;
 b=l26dOalCWBq9aaRErVaVzfgyDHxjwcYKNY/pYoQlHrOCFDFAAHuzudGs3ULrLBal35Q1nX
 QK06t+52t2P5hlFFk5oT91uXbOdR62tXFKI//lFpR5DHOFtEDGr75yMVWAVe2DMHghtICYww
 MGT2oS482PrxdOkxD193H++McrLYvlodDmKZHeFL7bKd35kVy1Hdw4dNlAe4QFaJd7vLAtMZ
 tfhv0RC1x+C5iMtfAhhZJ2wskDxSe+Fjbx3BD3wMJYCSsbk6XlweV+YIaxIDxaaqceiBze8r
 dGnlaAk7fsX16NCjBgsfjZYNe9ytY5Bor4RkFZWzGVFj59iPb+oxewJQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] grub: ignore CVE-2024-2312
Date: Tue,  7 Oct 2025 23:12:56 +0200
Message-Id: <20251007211256.1570624-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 21:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224566

From: Peter Marko <peter.marko@siemens.com>

This CVE is specific to Ubuntu [1].

[1] https://bugs.launchpad.net/ubuntu/+source/grub2-unsigned/+bug/2054127

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1b019752b7..94eeadfb99 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -70,6 +70,8 @@ CVE_CHECK_IGNORE += "CVE-2019-14865"
 CVE_CHECK_IGNORE += "CVE-2021-46705"
 # not-applicable-platform: Applies only to RHEL/Fedora
 CVE_CHECK_IGNORE += "CVE-2024-1048 CVE-2023-4001"
+# not-applicable-platform: Applies only to Ubuntu
+CVE_CHECK_IGNORE += "CVE-2024-2312"
 
 DEPENDS = "flex-native bison-native gettext-native"
 

