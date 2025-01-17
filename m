Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE22C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 12:00:18 +0000 (UTC)
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
 by mx.groups.io with SMTP id smtpd.web11.9246.1737115210762652925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 04:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YZJFh4fhsz12rv;
	Fri, 17 Jan 2025 13:00:08 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YZJFh1tCHz5bc;
	Fri, 17 Jan 2025 13:00:08 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 17 Jan 2025 12:59:53 +0100
Subject: [PATCH] add basic b4 config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-b4-support-v1-1-fe74a5f50eb6@cherry.de>
X-B4-Tracking: v=1; b=H4sIADhGimcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0Nz3SQT3eLSgoL8ohJdQ4OUVGND4zRT4yRzJaCGgqLUtMwKsGHRsbW
 1AOBOCVRcAAAA
X-Change-ID: 20250117-b4-support-10de313f53b7
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 12:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209985

From: Quentin Schulz <quentin.schulz@cherry.de>

b4[1] is a very nice tool for mail-based contribution. A config[2] file
exists to set up a few defaults. We can use it to set the Cc recipients
to always add, in our case the mailing list.

Because we do not have anything to check for now, disable needs-checking
so patches can be sent without running b4 prep --check.

Because we do not have any auto-to-cc support (and the implicit one
using scripts/get_maintainer.pl cannot work for us), also disable
needs-auto-to-cc so patches can be sent without running b4 prep
--auto-to-cc.

[1] https://pypi.org/project/b4/
[2] https://b4.docs.kernel.org/en/latest/config.html

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Note that this file should be overridden by the one that I'll send for
poky by the merging script (no clue how that would work), i.e. an update
of .b4-config from OE-Core should not override the one from poky OE-Core
when we merge/cherry-pick OE-Core patches later on.
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

---
base-commit: ba492417cf8712ca8009154cfadeb494c1a6064f
change-id: 20250117-b4-support-10de313f53b7

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


