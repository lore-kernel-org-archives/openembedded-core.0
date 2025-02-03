Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15998C02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 15:18:20 +0000 (UTC)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
 by mx.groups.io with SMTP id smtpd.web11.90019.1738595894149596686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 07:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YmqrN2J8nzMyg;
	Mon,  3 Feb 2025 16:18:12 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YmqrM6LgZzL7S;
	Mon,  3 Feb 2025 16:18:11 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 03 Feb 2025 16:17:57 +0100
Subject: [PATCH v2 1/2] add basic b4 config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-support-v2-1-848008ad29ea@cherry.de>
References: <20250203-b4-support-v2-0-848008ad29ea@cherry.de>
In-Reply-To: <20250203-b4-support-v2-0-848008ad29ea@cherry.de>
To: openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 15:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210654

From: Quentin Schulz <quentin.schulz@cherry.de>

b4[1] is a very nice tool for mail-based contribution. A config[2] file
exists to set up a few defaults. We can use it to set the Cc recipients
to always add, in our case the mailing list.

Because we do not have anything to check for now, disable needs-checking
so patches can be sent without running b4 prep --check. The
mid-term/long-term plan is to use patchtest locally.

Because we do not have any auto-to-cc support (and the implicit one
using scripts/get_maintainer.pl cannot work for us), also disable
needs-auto-to-cc so patches can be sent without running b4 prep
--auto-to-cc.

[1] https://pypi.org/project/b4/
[2] https://b4.docs.kernel.org/en/latest/config.html

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .b4-config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000000000000000000000000000000000000..8ec5ddd91e1da05f27a53ff6f3d7351317461859
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,3 @@
+[b4]
+  send-series-cc = openembedded-core@lists.openembedded.org
+  prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking

-- 
2.48.1


