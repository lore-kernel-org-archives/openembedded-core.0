Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD79C5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:22:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1040.1785565359275240865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FeT2ZdV3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4957eefd361so3012985e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 23:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785565357; x=1786170157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WV9zBlOVPqpfjeSmDfZho5DTGtmbDo/E5+1bN6G29E=;
        b=FeT2ZdV3beRPrIyyOTJfZ9R22AIOti5eKpZIqED9RFGu+5sEuiZ2FQDyZx4ib/5E7Y
         YZNqNNBhAdi/ZC8KpNVSu6eHJP8tFpyxNgFqR9lbuGfuH1s4Dmd1vQ6sCufWAC4j7msI
         VaOaoUvs9yEYsOBfF4ZWIM/Ok8d0jGW5vmM4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785565357; x=1786170157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/WV9zBlOVPqpfjeSmDfZho5DTGtmbDo/E5+1bN6G29E=;
        b=ZhSfu9PJulfZ8r2Ymk4VZ+jZKC46sAANlIf8eHd6u/dFV/1hZx/rOG+VRjx0Vu1PZ8
         uLSHPPtsP0bR0bxQf78mTJ1SPQT1Nh9I99Rd/D81SLnxsja9xGV3dzyYFHhH7MwAnrrY
         dYgq926DZWJFQA1zlc9nlDbLVxuRlA3zrnel4X4xaSa/zR7mDCtlqUOOUO5eiiw5oXZm
         Gbk8L5WkTTJwczpeSyLU8ZEeEO+dBpVyIDDLLPDGqgY0DzYXW7CmH1hM7vUgmrzSr9GA
         thlcWrVft6KRMGtnN1HKSq7ZJd0UHHjEF4OQpd7TmIrGE4jW2jvt0jafLP4czx7SqQxC
         WPtQ==
X-Gm-Message-State: AOJu0Yz0npeFJ71yNWYthxLYYXZMwgF/2/oj9rJ63Rdqs37Ml+goE6TQ
	yHurtlD0t3JShBhCLmRUn4Dxh70/hUz/ryevz4dhvcen3zxHHD9EL3cFHtnrIvJJduD/R9vE/Xu
	yOV4RcAY=
X-Gm-Gg: AR+sD12CzleK+GaK6XnlMz/SlZIs8zK5r+zoqJImUaAPPWblc/ly+M977GflMwMVNx8
	WhpLkxUbWAZznsBJtVO5VHnkDZA5LywfZIoTT+I7umXaejntkrs1EtPKHyDa+3mJ3+blbQIaSNE
	MuK1W/DVkIFgKh3W3WsOMCvs0xD9ZRq8Q7IYSJH5esx80Cop/PT5/y5yd5jKtfpBxcQ9+KfISLW
	7GsNqsZz94sC98ljBXVW9OPOxnnSevZ25G1TKQlkLXFLHGed9zSf0xlC0YuoRPYh/LuCSLhv8o6
	Bb3vibumRCipB0COTXnzcLLEn02Yy+V0xHZ7lsn28+hG3nC7X1bqWJk3WMm1ami8lupdyYNCosW
	ud899S5i1o94pNVmpP59t4dEJWlhuhZPM8az7sqPvM1Geu6tD4MqIpiGB/UfFdgH5b7XiTr7aRn
	I1FJ83rtxxy92GQVgw97bisldivv97KkTpr6tDXI6dpQxRKqAX37RBD2tXGsTTmknoum7cKxoTi
	QPApGgStQi1pl+l23CIJHDIZqIC
X-Received: by 2002:a05:600c:8489:b0:495:495b:9248 with SMTP id 5b1f17b1804b1-4980c64b73emr20204615e9.4.1785565357504;
        Fri, 31 Jul 2026 23:22:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm13921262f8f.0.2026.07.31.23.22.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:22:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] diffoscope: upgrade 325 -> 326
Date: Sat,  1 Aug 2026 07:22:31 +0100
Message-ID: <20260801062235.2497102-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242470

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_325.bb => diffoscope_326.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_325.bb => diffoscope_326.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_325.bb b/meta/recipes-support/diffoscope/diffoscope_326.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_325.bb
rename to meta/recipes-support/diffoscope/diffoscope_326.bb
index 521b2b5b04d..3ab679f34f6 100644
--- a/meta/recipes-support/diffoscope/diffoscope_325.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_326.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d74a2edb0555a9ee306d5362b921f80c144bb941c0a6d61794473d1540d729ad"
+SRC_URI[sha256sum] = "21aaa977a9fbdf6e2b70b675a700ad1f80e878ac1dac59cf6fb0ba5f319616c7"
 
 RDEPENDS:${PN} += "\
         binutils \

