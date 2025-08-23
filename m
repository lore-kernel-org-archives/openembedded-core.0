Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414B1CA0EFA
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 20:48:26 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.4713.1755982105426019086
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 13:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=cCHGYY9Q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025082320482276cd509fa0cef89445-b5gstq@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025082320482276cd509fa0cef89445
        for <openembedded-core@lists.openembedded.org>;
        Sat, 23 Aug 2025 22:48:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Nvs4cszuvRvGu4yG5nNQ0wIe3gfeGyzT4vOPEq9lYhM=;
 b=cCHGYY9Q6csUcgIJ5AMj0Fc2Kfo0luPPYuSr2q1ja1RlPXvRHUPnBclusxgaQmXyzuLAL/
 IkxE7gob/fLMRfGvQZeOwxvyE27gXIuhWFoKsyK8JouNT0RLj8vc90K8efNjDPnbTTUQ+dN1
 TqXW7fAjpR92ggyELQPEvfrBF+rP/lW13Jl7sK6B6L0fAlQm7jONzYpUDvdWEOUHgqL7WBR0
 XEDOxf2PjZoTsDakOr9d6Ds+NH/H5J0dWWpnuZ2wRwk/OpdlFGXwACEr4yKy6BeZiHy9DB5C
 3YW2K49YzUg9OFBRofEow5AdTz4yEuZsyoIK/y36mQzKIHU3PsclH9Cw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/3] icu: mark CVE-2025-5222 as fixed
Date: Sat, 23 Aug 2025 22:47:06 +0200
Message-Id: <20250823204707.35257-3-peter.marko@siemens.com>
In-Reply-To: <20250823204707.35257-1-peter.marko@siemens.com>
References: <20250823204707.35257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 20:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222354

From: Peter Marko <peter.marko@siemens.com>

Commit mentioned in [1] is included in 77-1.
This comit was also backported to Yocto all stable/LTS releases.

[1] https://security-tracker.debian.org/tracker/CVE-2025-5222

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/icu/icu_77-1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_77-1.bb
index 43ea865f2d..fa25b3e7c8 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -183,3 +183,5 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/test/tests
     find ${B}/test/ -type f -executable -exec cp {} ${D}${PTEST_PATH}/test/tests \;
 }
+
+CVE_STATUS[CVE-2025-5222] = "fixed-version: fixed in version 77-1"

