Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40C1C43219
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:17:51 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.16777.1667744267612979638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oHB8rbUq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id gw22so8358788pjb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN8UkqRHvdJK0tun2fThiKoBxNDP/jmI8eXvgo2+uZY=;
        b=oHB8rbUqIUm1fejjAVUmUaHGhzpS4feFVqexpQb7HxmC0lknOoz/B4Hn7r1rGagiOA
         F1/wVn3oT7N+surH/C7RrwVsNtBKEJEGnSEV6ov1/XfpC6ONexMrfrTm6Jz8X7ix59/s
         YBQvjmEUP4rGDk1Gmp8wi4PdyuDYmZUBMD6m0g1jOieHXi0XUU0ujrBy3h6E1fIr1fPC
         JPdf2k1jDrCFoPce+zXbUo6/iPKczjLoxoXfYgXMgF2mdl2hp5hFfBX/JNsSAQlhATuN
         oTJwav5Uff9y+Jp2o91acHmSKmTYWhhHVwx0DriLSLIdydmVAxk8Zt6eBJ57Q9kEZ2Eb
         ITsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN8UkqRHvdJK0tun2fThiKoBxNDP/jmI8eXvgo2+uZY=;
        b=lkw4sGhKOUA9AYz+aL2ptqA60THRLo6EiywJ7lSyyI+a1OicNAsAf35F9RjyoVFr8N
         sh9L8ukon+35Gp4o9h7Ejnj415l+E+/OmVH+zJSpoyO1hCgHSbMCbdxmLVyOyLKZysIt
         UNZDIOBAH53jl0rM4tfQK+xWLdPy/cmzy0gviwVt95Nb2IfMJEwBiY2iFbcchYSz1EcW
         0LxVUvl2e3ajml7KySZrg0mu90WKjfFtmKkTGWHumQ/zT3m9pIESvbudJF3PA5uB94AS
         80yq9Sh2JNGr7Syfs37uAFv5l4iCO7SplHC0xAdc2AtCpkq/AcWYNdviOPoxwjXUv4JC
         2SMA==
X-Gm-Message-State: ACrzQf0F1EBjYzGYC3KgMdi25vmPricGp1P4ikMudVEZD6BEr6nIv5BS
	tLQIz9CqrDsM6qW55r+migIPbgw8JQ13ypro
X-Google-Smtp-Source: AMsMyM4frH88uUB4moX/CSuijd4oZ6dncHJoBuCjoO152xDLb+gkZbpkn+xfFnjeMESBvsX6O9i26g==
X-Received: by 2002:a17:903:228f:b0:186:d89e:c073 with SMTP id b15-20020a170903228f00b00186d89ec073mr44492991plh.48.1667744266746;
        Sun, 06 Nov 2022 06:17:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/34] lttng-ust: upgrade 2.13.4 -> 2.13.5
Date: Sun,  6 Nov 2022 04:16:51 -1000
Message-Id: <d96afd6159b696dc18a7d6ab3731ad1ac258c98c.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172776

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
* Fix: bytecode validator: reject specialized load field/context ref instructions
* Fix: bytecode validator: reject specialized load instructions
* Fix: event notification capture: validate buffer length
* Fix: event notification capture error handling
* Fix: lttng-ust-comm: wait on wrong child process
* fix: 'make dist' without javah

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 569d6c271bf782cb4a524603693adbbe3d020f92)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
index 56200ac3e1..916408bff0 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "698f82ec5dc56e981c0bb08c46ebabaf31c60e877c2e365b9fd6d3a9fff8b398"
+SRC_URI[sha256sum] = "f1d7bb4984a3dc5dacd3b7bcb4c10c04b041b0eecd7cba1fef3d8f86aff02bd6"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1


