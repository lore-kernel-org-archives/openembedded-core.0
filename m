Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3193E71066
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 12:26:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.15318.1695299188411125913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 05:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VTlz7JGm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96B901BF206;
	Thu, 21 Sep 2023 12:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695299185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wj/dT6kHlN/ruysQSZvJcPKlWIK0Imqy5IcdjdhB5nU=;
	b=VTlz7JGmG8VRIlmnhCfhFQZPGVG1TXZcM1/bqx76RCr3m7NidDKoU2q3GiR4WwwJ9lsH4G
	S6+SJBCUjDN6XeLy1Bc7doFrPkyikHBq5SuK1zgZ3USv8UxdykRU0ix7dHIQHodCRGQ+8J
	E1XNVj8o7ZeoHDrhkojm//aiJAb4HlkY+O5u8Dq5oHjKKXywS8oTEw+/a6ddgq47JI7Que
	gcfuZqbg4URWG44Za9JJVJSw9oR9lJ9flbGMeDyhBgGj31HM4hARn3CtAZA1l/a1r4iROT
	wH0XuEuQce4nisK2lQRZrMiZpXPnE9s8gidjSsDn7P740bMV9WOjtnHvF8iDRg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] lib/oe/qa: remove obsolete "Accepted" string for Upstream-Status
Date: Thu, 21 Sep 2023 14:26:11 +0200
Message-Id: <20230921122612.3287830-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 12:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187991

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Replaced by "Backport" since release 3.2
https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/lib/oe/qa.py                                           | 2 +-
 meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index de980638c4..94955f78ba 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -216,7 +216,7 @@ def exit_if_errors(d):
 def check_upstream_status(fullpath):
     import re
     kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
-    strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
+    strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
     guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
 
     with open(fullpath, encoding='utf-8', errors='ignore') as f:
diff --git a/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py b/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
index 511b36d033..d63567efbe 100644
--- a/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
+++ b/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
@@ -8,8 +8,8 @@
 import common
 import pyparsing
 
-upstream_status_literal_valid_status = ["Pending", "Accepted", "Backport", "Denied", "Inappropriate", "Submitted"]
-upstream_status_nonliteral_valid_status = ["Pending", "Accepted", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]"]
+upstream_status_literal_valid_status = ["Pending", "Backport", "Denied", "Inappropriate", "Submitted"]
+upstream_status_nonliteral_valid_status = ["Pending", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]"]
 
 upstream_status_valid_status = pyparsing.Or(
     [pyparsing.Literal(status) for status in upstream_status_literal_valid_status]
-- 
2.34.1


