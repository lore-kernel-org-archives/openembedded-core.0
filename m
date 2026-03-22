Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A36D58CAD
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 23:01:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5695.1774220506948391674
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 16:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=D3qmqTlX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202603222301437f34de438e00020769-6zdlr0@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202603222301437f34de438e00020769
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Mar 2026 00:01:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YP+x1pSJvYkMs7W5THd9qPox8lRrfqVLMOHr5D8uBt0=;
 b=D3qmqTlX/2zZ6iMzhoumirXAK98watExqpZiE1saICGlHqdi2VSgNfNZ6XCF5M4MwBAn1G
 O7QpSYQKdp+mIIBN0hH1hpdYAFEjDFhTFB1TpljH1X5y+EAia/tsppYFLpT83x0YdECCXROq
 HNA0ISBvDe5ptEGUezh8ihh/M+qx+zBWytzma3dz4EqLdQYQxQwnZqdaX0EvB+7/G89Gfkry
 mf5ku7b5jyW/ehy0KvoTOeuHYKo2ThHrxwoqHf3A7wYNTIAdav7f3z1J4wyQP2+MmnqRXI6I
 mARIRTlTkZyewZhU7WFMEnYbtUsWNWffVQs7z2SZ3az4gTG3jODULM5A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/4] btrfs-tools: upgrade 6.19 -> 6.19.1
Date: Mon, 23 Mar 2026 00:01:28 +0100
Message-Id: <20260322230131.12001-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 23:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233684

Release notes [1]:

* fix balance filter 'usage' that was incorrectly used for ranged usage
* core:
    * fix tree-checker vararg format print
    * stability fixes
    * compiler warning fixes
* other:
    * CI updates, action version updates, more build targets
    * cleanups, refactoring
    * minor documentation updates

[1] https://github.com/kdave/btrfs-progs/releases/tag/v6.19.1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../btrfs-tools/{btrfs-tools_6.19.bb => btrfs-tools_6.19.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.19.bb => btrfs-tools_6.19.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb
index 460f70a35a..dee1270fa0 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "9ac9a97ee3ebcc71c584a202a31ccd6442c436dc"
+SRCREV = "fa79dbea32d39ac0ae41a88a079013c7ad2a8a58"
 
 PACKAGECONFIG ??= " \
     programs \

