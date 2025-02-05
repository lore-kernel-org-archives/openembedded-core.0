Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7102C02199
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 16:16:28 +0000 (UTC)
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
 by mx.groups.io with SMTP id smtpd.web11.16192.1738772179021878829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 08:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yp52T4HsPzPwL;
	Wed,  5 Feb 2025 17:16:17 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yp52T1XpHz4y3;
	Wed,  5 Feb 2025 17:16:17 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 05 Feb 2025 17:16:00 +0100
Subject: [PATCH v4 1/2] add basic b4 config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-b4-support-v4-1-ad5f99923977@cherry.de>
References: <20250205-b4-support-v4-0-ad5f99923977@cherry.de>
In-Reply-To: <20250205-b4-support-v4-0-ad5f99923977@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 16:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210866

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
index 0000000000000000000000000000000000000000..41094218531d638457a265721fb928697d0ee9de
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,3 @@
+[b4]
+  send-series-to = openembedded-core@lists.openembedded.org
+  prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking

-- 
2.48.1


