Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B06C3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 12:47:20 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.25897.1722775632282810554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 05:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Q6JTpHKp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20240804124708957e5b427a76f60012-b5xwob@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20240804124708957e5b427a76f60012
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 Aug 2024 14:47:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9W8mOlqxzqgxr6jvTcw6fuZDUnOv3k+tznFHG92O9ug=;
 b=Q6JTpHKpy1WLf01yBQyGoFYmxLo+Z1PJD/m3YDIaFQ7MpV0vDbCv2RllAMFW6t6v1MTVe+
 bz4DVZzqCwR17nrw1K/s9v+otw5iIWqAPrI4eE6/qEJRXdd+wb29JGGjLTDcdJtmhvV1XNKY
 VMdu5/8HZJdb+9M2lGK/f7H5pfMOFIkP+ixo5KSIU10+9ncg36KSuzTUPbD8kFR0JMslqlFe
 DchD8oMZtbD62FsIDbTQW2LA9ggnNJAv0hqPeWMqN0AtY0HbEClWh97J3N5Zgznin1uOb4Ob
 GCLoSWaN17i1951bPktALe5+9JWsOcZ47wRYZsZhU3YSK+DMVk3WfQNw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] nasm: Upgrade 2.16.01 -> 2.16.03
Date: Sun,  4 Aug 2024 14:46:18 +0200
Message-Id: <20240804124618.4153530-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 12:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202944

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Removes CVE-2022-46456 from reports.

(From OE-Core rev: 4a5b6e8dd315b2281afb232410db585d431be00f)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} (88%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.16.01.bb b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
similarity index 88%
rename from meta/recipes-devtools/nasm/nasm_2.16.01.bb
rename to meta/recipes-devtools/nasm/nasm_2.16.03.bb
index 219cc49360..281f3940e7 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[sha256sum] = "35b6ad2ee048d41c4779f073f3efca7762a822b7d2d4ef4e8df24cf65747bb2e"
+SRC_URI[sha256sum] = "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
 
 EXTRA_AUTORECONF:append = " -I autoconf/m4"
 
-- 
2.30.2


