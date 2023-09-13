Return-Path: <sanjanasanju1608@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9726EDEC40
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 11:19:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.9157.1694603947496816543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 04:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KAGgxFKn;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: sanjanasanju1608@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c337aeefbdso61053285ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 04:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694603947; x=1695208747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IBnmuseJEsRU39oDLBRrQ8YvxYrecFgsAO40jwAwc7o=;
        b=KAGgxFKnI7bcqmHIJkKLd9IzD9k4hh8lqBVOsHkPNzpzNatZmiSrq6cyNDoRwArynH
         o7zhhswotS1xwbcvoOXC7xE3+PYGfQ3A/6qEsjrH99uJpKvEtRjAwYd3ti7B/9S7x9tk
         W/K7vDPszRD7Edhj+OFaR+tec0FTA6851EhECqD20Wp6a9Q+Qz3siAPYsVVS7nQxBlDU
         XhhILwodvHOCJnyDdjuRbM9BsUZGFwIKDN/0h9JRcpDBXSZM+tiMAj0G41Dash0q96Yg
         2ESlZoWgdcz/5PlepM0ERzB6zOQcN/CPpKDq82M0IL8ROnvKJo9Cdn7OtqvtTr3Vl70U
         hxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694603947; x=1695208747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBnmuseJEsRU39oDLBRrQ8YvxYrecFgsAO40jwAwc7o=;
        b=RfdL6dh/fXj0tnll5JQdI7uLT5oGzWO1qzYr7JkhD2j2QRU41bkALElMLdbcwMdRnE
         duKKwNNgMZRQyuUUKRjsZOnKsJsgiH6TPKfe+tjBV5eDBE54eMwM7MQc6dImHy9asQ1A
         WlAgePekdJdMqAJ7LTXKkM7kAMyB//i9B6wL40IA2USFRFcMSLl70ruML555b4DTxHUR
         nNihhNv9G7ic4gvly+zcFs98ow7LRNGKu28jxL5CsBPzSRq7hJfgTz8W8rb16h1ojU1/
         sAjfwirilEq/W0lfg4SusyMlU28itC3PwohZiH1HE0gX6MS/FvNZua9PMOpt6L5IzASG
         qaCQ==
X-Gm-Message-State: AOJu0YwVQWX3FcMAkIFaeZZF71POoTv8Xrx9ZEnGi9L/FEC8RpsUMJzz
	oVR+jpiEhJsXRNR0Z1UPrar9hTw/v+HcmA==
X-Google-Smtp-Source: AGHT+IHLbJcy0LNZZ+xe41XTozECpg30e/vlrX0mG2oR3EzAxqlbxKvvVH2Kn5qEPjSojABrhNnh2g==
X-Received: by 2002:a17:902:dac9:b0:1b8:6987:de84 with SMTP id q9-20020a170902dac900b001b86987de84mr2890001plx.48.1694603946581;
        Wed, 13 Sep 2023 04:19:06 -0700 (PDT)
Received: from bft01.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902d48900b001b892aac5c9sm10200842plg.298.2023.09.13.04.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:19:05 -0700 (PDT)
From: Sanjana <sanjanasanju1608@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com,
	Sanjana <sanjanasanju1608@gmail.com>
Subject: [kirkstone][PATCH] glibc: stable 2.35 branch updates
Date: Wed, 13 Sep 2023 16:48:45 +0530
Message-Id: <20230913111845.585486-1-sanjanasanju1608@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 11:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187583

Below commits on glibc-2.35 stable branch are updated.

561e9dadc0 x86: Fix incorrect scope of setting `shared_per_thread`
1c3ecf5858 x86: Use `3/4*sizeof(per-thread-L3)` as low bound for NT threshold.
47c7d2eb03 x86: Fix slight bug in `shared_per_thread` cache size calculation.
d1b1da26ea x86: Increase `non_temporal_threshold` to roughly `sizeof_L3 / 4`
e19af583b4 elf: _dl_find_object may return 1 during early startup.

Signed-off-by: Sanjana <sanjanasanju1608@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 01b1abef7d..f23ceb5a25 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "cbceb903c4d770acc7e4ba5641036516830ed69b"
+SRCREV_glibc ?= "561e9dadc02f46a7ba2190c0a04259583479f6c9"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


